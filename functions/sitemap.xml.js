/**
 * XML Sitemap
 * GET /sitemap.xml
 *
 * Auto-generates sitemap from database.
 * Includes: static pages, items, categories, best-of, states, cities.
 * Uses threshold filtering — only includes cities/categories with enough items.
 */

import { PROD_BASE, TABLE_NAME, ITEMS_PATH, CATEGORY_FIELD } from './_shared.js';
import { slugify } from './_shared/utils.js';

// Thresholds — prevent thin content pages from diluting crawl budget
const MIN_CITY_ITEMS = 3;
const MIN_CATEGORY_ITEMS = 3;

export async function onRequestGet(context) {
  const { env, request } = context;
  const baseUrl = PROD_BASE;

  try {
    // Static pages
    const staticPages = [
      { loc: '/', priority: '1.0', changefreq: 'daily' },
      { loc: `/${ITEMS_PATH}`, priority: '0.9', changefreq: 'daily' },
      { loc: '/states', priority: '0.8', changefreq: 'weekly' },
      { loc: '/cities', priority: '0.8', changefreq: 'weekly' },
      { loc: '/categories', priority: '0.8', changefreq: 'weekly' },
      { loc: '/best', priority: '0.8', changefreq: 'weekly' },
      // /search excluded — noindex page
      { loc: '/about', priority: '0.4', changefreq: 'monthly' },
      { loc: '/faq', priority: '0.4', changefreq: 'monthly' },
      { loc: '/contact', priority: '0.3', changefreq: 'monthly' },
      { loc: '/submit', priority: '0.3', changefreq: 'monthly' },
      { loc: '/crew', priority: '0.3', changefreq: 'monthly' }
    ];

    // Get all items
    let items = [];
    try {
      const { results } = await env.DB.prepare(
        `SELECT slug, updated_at, created_at FROM ${TABLE_NAME} ORDER BY created_at DESC`
      ).all();
      items = results || [];
    } catch (e) { /* Table may not exist yet */ }

    // Get categories with real lastmod dates + count threshold
    let categories = [];
    try {
      const { results } = await env.DB.prepare(
        `SELECT ${CATEGORY_FIELD} as category,
                COUNT(*) as count,
                MAX(COALESCE(updated_at, created_at)) as lastmod
         FROM ${TABLE_NAME}
         WHERE ${CATEGORY_FIELD} IS NOT NULL
         GROUP BY ${CATEGORY_FIELD}
         HAVING count >= ?`
      ).bind(MIN_CATEGORY_ITEMS).all();
      categories = results || [];
    } catch (e) { /* Table may not exist yet */ }

    // Get states with lastmod + all states (no threshold — states are always valuable)
    let states = [];
    try {
      const { results } = await env.DB.prepare(
        `SELECT state,
                COUNT(*) as count,
                MAX(COALESCE(updated_at, created_at)) as lastmod
         FROM ${TABLE_NAME}
         WHERE state IS NOT NULL AND state != ''
         GROUP BY state`
      ).all();
      states = results || [];
    } catch (e) { /* Table may not exist yet */ }

    // Get cities with lastmod + count threshold
    let cities = [];
    try {
      const { results } = await env.DB.prepare(
        `SELECT city, state,
                COUNT(*) as count,
                MAX(COALESCE(updated_at, created_at)) as lastmod
         FROM ${TABLE_NAME}
         WHERE city IS NOT NULL AND city != ''
         GROUP BY city, state
         HAVING count >= ?`
      ).bind(MIN_CITY_ITEMS).all();
      cities = results || [];
    } catch (e) { /* Table may not exist yet */ }

    // Build URL entries
    const urls = [];

    // Derive lastmod for static pages from most recent item update
    const latestItem = items.length > 0 ? (items[0].updated_at || items[0].created_at) : null;
    const staticLastmod = latestItem ? new Date(latestItem).toISOString().split('T')[0] : '';

    // Static pages
    for (const page of staticPages) {
      urls.push(`
  <url>
    <loc>${baseUrl}${page.loc}</loc>
    ${staticLastmod ? `<lastmod>${staticLastmod}</lastmod>` : ''}
    <changefreq>${page.changefreq}</changefreq>
    <priority>${page.priority}</priority>
  </url>`);
    }

    // State pages
    for (const s of states) {
      const stateSlug = slugify(s.state);
      const lastmod = s.lastmod ? new Date(s.lastmod).toISOString().split('T')[0] : '';
      urls.push(`
  <url>
    <loc>${baseUrl}/states/${stateSlug}</loc>
    ${lastmod ? `<lastmod>${lastmod}</lastmod>` : ''}
    <changefreq>weekly</changefreq>
    <priority>0.8</priority>
  </url>`);
    }

    // City pages (threshold filtered)
    for (const c of cities) {
      const citySlug = slugify(c.city + '-' + c.state);
      const lastmod = c.lastmod ? new Date(c.lastmod).toISOString().split('T')[0] : '';
      urls.push(`
  <url>
    <loc>${baseUrl}/cities/${citySlug}</loc>
    ${lastmod ? `<lastmod>${lastmod}</lastmod>` : ''}
    <changefreq>weekly</changefreq>
    <priority>0.7</priority>
  </url>`);
    }

    // Category pages (threshold filtered) + best-of pages
    for (const cat of categories) {
      const slug = slugify(cat.category);
      const catLastmod = cat.lastmod ? new Date(cat.lastmod).toISOString().split('T')[0] : '';

      urls.push(`
  <url>
    <loc>${baseUrl}/category/${slug}</loc>
    ${catLastmod ? `<lastmod>${catLastmod}</lastmod>` : ''}
    <changefreq>weekly</changefreq>
    <priority>0.7</priority>
  </url>`);

      urls.push(`
  <url>
    <loc>${baseUrl}/best/${slug}</loc>
    ${catLastmod ? `<lastmod>${catLastmod}</lastmod>` : ''}
    <changefreq>weekly</changefreq>
    <priority>0.7</priority>
  </url>`);
    }

    // Item pages — use updated_at for real lastmod (never inflate with today's date)
    for (const item of items) {
      const lastmod = (item.updated_at || item.created_at)
        ? new Date(item.updated_at || item.created_at).toISOString().split('T')[0]
        : '2025-01-01';

      urls.push(`
  <url>
    <loc>${baseUrl}/${ITEMS_PATH}/${item.slug}</loc>
    <lastmod>${lastmod}</lastmod>
    <changefreq>monthly</changefreq>
    <priority>0.6</priority>
  </url>`);
    }

    const sitemap = `<?xml version="1.0" encoding="UTF-8"?>
<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
${urls.join('\n')}
</urlset>`;

    return new Response(sitemap, {
      headers: {
        'Content-Type': 'application/xml; charset=utf-8',
        'Cache-Control': 'public, max-age=3600' // 1 hour cache
      }
    });

  } catch (error) {
    console.error('Sitemap error:', error);

    const fallbackBase = PROD_BASE;
    const sitemap = `<?xml version="1.0" encoding="UTF-8"?>
<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
  <url>
    <loc>${fallbackBase}/</loc>
    <changefreq>daily</changefreq>
    <priority>1.0</priority>
  </url>
</urlset>`;

    return new Response(sitemap, {
      headers: {
        'Content-Type': 'application/xml; charset=utf-8',
        'Cache-Control': 'public, max-age=300'
      }
    });
  }
}
