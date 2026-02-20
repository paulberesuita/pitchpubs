/**
 * RSS Feed
 * GET /feed.xml
 *
 * Auto-generates RSS feed from recent items
 */

import { SITE_NAME, PROD_BASE, TABLE_NAME, ITEMS_PATH, CATEGORY_FIELD, escapeHtml } from './_shared.js';

export async function onRequestGet(context) {
  const { env } = context;
  const baseUrl = PROD_BASE;

  try {
    // Get recent items
    let items = [];
    try {
      const { results } = await env.DB.prepare(
        `SELECT * FROM ${TABLE_NAME} ORDER BY created_at DESC LIMIT 20`
      ).all();
      items = results || [];
    } catch (e) {
      // Table may not exist yet
    }

    // Build date for channel
    const buildDate = new Date().toUTCString();
    const lastBuildDate = items.length > 0 && items[0].created_at
      ? new Date(items[0].created_at).toUTCString()
      : buildDate;

    // Build items (escapeHtml works for XML — &#039; is valid in XML)
    const itemsXml = items.map(item => {
      const pubDate = item.created_at
        ? new Date(item.created_at).toUTCString()
        : buildDate;

      return `
    <item>
      <title>${escapeHtml(item.name)}</title>
      <link>${baseUrl}/${ITEMS_PATH}/${escapeHtml(item.slug)}</link>
      <description>${escapeHtml(item.description || '')}</description>
      <pubDate>${pubDate}</pubDate>
      <guid isPermaLink="true">${baseUrl}/${ITEMS_PATH}/${escapeHtml(item.slug)}</guid>
      ${item[CATEGORY_FIELD] ? `<category>${escapeHtml(item[CATEGORY_FIELD])}</category>` : ''}
    </item>`;
    }).join('\n');

    const feed = `<?xml version="1.0" encoding="UTF-8"?>
<rss version="2.0" xmlns:atom="http://www.w3.org/2005/Atom">
  <channel>
    <title>${escapeHtml(SITE_NAME)}</title>
    <link>${baseUrl}</link>
    <description>Latest additions to ${escapeHtml(SITE_NAME)}</description>
    <language>en-us</language>
    <lastBuildDate>${lastBuildDate}</lastBuildDate>
    <atom:link href="${baseUrl}/feed.xml" rel="self" type="application/rss+xml"/>
${itemsXml}
  </channel>
</rss>`;

    return new Response(feed, {
      headers: {
        'Content-Type': 'application/rss+xml; charset=utf-8',
        'Cache-Control': 'public, max-age=3600' // 1 hour cache
      }
    });

  } catch (error) {
    console.error('Feed error:', error);

    // Return empty feed on error
    const feed = `<?xml version="1.0" encoding="UTF-8"?>
<rss version="2.0">
  <channel>
    <title>${SITE_NAME}</title>
    <link>${baseUrl}</link>
    <description>Latest additions to ${SITE_NAME}</description>
  </channel>
</rss>`;

    return new Response(feed, {
      headers: {
        'Content-Type': 'application/rss+xml; charset=utf-8',
        'Cache-Control': 'public, max-age=300'
      }
    });
  }
}
