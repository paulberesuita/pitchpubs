/**
 * Cities Pages
 * GET /cities - Cities index (all cities with item counts)
 * GET /cities/[city-state] - City detail (items organized by category)
 */

import {
  SITE_NAME, TABLE_NAME, ITEMS_PATH, CATEGORY_FIELD,
  escapeHtml, slugify, capitalize, renderHead, renderNav, renderFooter, renderBreadcrumbs,
  renderCard, renderEmptyState, renderMapToggle, renderMap,
  renderPage, htmlResponse
} from '../_shared.js';

export async function onRequestGet(context) {
  const { params, request } = context;
  const url = new URL(request.url);
  const baseUrl = `${url.protocol}//${url.host}`;

  const slug = params.slug?.[0];

  if (!slug) {
    return renderCitiesIndex(context, baseUrl);
  }

  return renderCityDetail(context, baseUrl, slug);
}

/**
 * Cities index — all cities ranked by item count
 */
async function renderCitiesIndex(context, baseUrl) {
  const { env } = context;

  try {
    const { results: cities } = await env.DB.prepare(
      `SELECT city, state, COUNT(*) as count
       FROM ${TABLE_NAME}
       WHERE city IS NOT NULL AND city != ''
       GROUP BY city, state
       ORDER BY count DESC, city ASC`
    ).all();

    const totalItems = cities.reduce((sum, c) => sum + c.count, 0);

    const jsonLd = {
      "@context": "https://schema.org",
      "@type": "CollectionPage",
      "name": `Browse by City | ${SITE_NAME}`,
      "url": `${baseUrl}/cities`,
      "numberOfItems": cities.length,
      "hasPart": cities.slice(0, 30).map(c => ({
        "@type": "ItemList",
        "name": `${c.city}, ${c.state}`,
        "url": `${baseUrl}/cities/${slugify(c.city + '-' + c.state)}`,
        "numberOfItems": c.count
      }))
    };

    const sampleCities = cities.slice(0, 3).map(c => `${c.city}, ${c.state}`).join('; ');
    const head = renderHead({
      title: `${capitalize(ITEMS_PATH)} in ${cities.length} Cities - ${totalItems} Locations`,
      description: `Explore ${totalItems} ${ITEMS_PATH} across ${cities.length} cities.${sampleCities ? ` Including ${sampleCities}.` : ''}`,
      url: `${baseUrl}/cities`,
      jsonLd
    });

    const citiesHtml = cities.map((c, i) => {
      const citySlug = slugify(c.city + '-' + c.state);
      return `
      <a href="/cities/${escapeHtml(citySlug)}" class="group block bg-surface rounded-2xl border border-border card-hover p-7 reveal" style="transition-delay: ${Math.min(i, 12) * 60}ms">
        <div class="flex items-center justify-between">
          <div>
            <h2 class="font-display text-lg font-bold group-hover:text-primary transition-colors duration-200">${escapeHtml(c.city)}</h2>
            <p class="text-sm text-muted mt-1.5">${escapeHtml(c.state)} &middot; ${c.count} item${c.count === 1 ? '' : 's'}</p>
          </div>
          <svg class="w-5 h-5 text-muted group-hover:text-primary transition-colors duration-200" fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5l7 7-7 7"></path>
          </svg>
        </div>
      </a>
      `;
    }).join('\n');

    const body = `
    ${renderNav('/cities')}

    <!-- Breadcrumbs -->
    <div class="border-b border-border">
      <div class="max-w-5xl mx-auto px-6 py-4">
        ${renderBreadcrumbs([
          { label: 'Home', href: '/' },
          { label: 'Cities' }
        ], baseUrl)}
      </div>
    </div>

    <!-- Header -->
    <section class="bg-surface border-b border-border">
      <div class="relative z-10 max-w-5xl mx-auto px-6 py-14">
        <h1 class="font-display text-3xl md:text-5xl font-bold tracking-tight mb-3 animate-fade-in-up">Browse by City</h1>
        <p class="text-lg text-muted animate-fade-in-up stagger-2">${totalItems} items across ${cities.length} cities</p>
      </div>
    </section>

    <!-- Cities Grid -->
    <main class="max-w-5xl mx-auto px-6 py-14">
      ${cities.length > 0 ? `
      <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-5">
        ${citiesHtml}
      </div>
      ` : renderEmptyState({
        emoji: '&#127963;',
        title: 'No cities yet',
        message: 'Items with city data will appear here.',
        action: { href: '/submit', label: 'Submit Item' }
      })}
    </main>

    ${renderFooter()}
    `;

    return htmlResponse(renderPage(head, body));

  } catch (error) {
    console.error('Cities index error:', error);

    const head = renderHead({
      title: 'Browse by City',
      description: `Browse items by city in ${SITE_NAME}.`,
      url: `${baseUrl}/cities`
    });

    const body = `
    ${renderNav('/cities')}
    <main class="max-w-6xl mx-auto px-6 py-12">
      ${renderEmptyState({
        emoji: '&#127963;',
        title: 'No cities yet',
        message: 'Add items with location data to browse by city.',
        action: { href: '/submit', label: 'Submit Item' }
      })}
    </main>
    ${renderFooter()}
    `;

    return htmlResponse(renderPage(head, body));
  }
}

/**
 * City detail — items organized by category within city, with related cities
 */
async function renderCityDetail(context, baseUrl, slug) {
  const { env } = context;

  try {
    // Find city by slug match (slug format: city-name-state)
    // Try matching against slugified "city-state" combinations
    const { results: allCities } = await env.DB.prepare(
      `SELECT DISTINCT city, state FROM ${TABLE_NAME}
       WHERE city IS NOT NULL AND city != ''`
    ).all();

    const match = allCities.find(c =>
      slugify(c.city + '-' + c.state) === slug.toLowerCase()
    );

    if (!match) {
      const head = renderHead({
        title: 'City Not Found',
        description: 'The requested city could not be found.',
        url: `${baseUrl}/cities/${slug}`
      });

      const body = `
      ${renderNav('/cities')}
      <main class="max-w-6xl mx-auto px-6 py-12">
        ${renderEmptyState({
          emoji: '&#128270;',
          title: 'City not found',
          message: 'This city has no items or doesn\'t exist.',
          action: { href: '/cities', label: 'View All Cities' }
        })}
      </main>
      ${renderFooter()}
      `;

      return htmlResponse(renderPage(head, body), 404);
    }

    const { city: cityName, state: stateName } = match;

    // Get all items in this city
    const { results: items } = await env.DB.prepare(
      `SELECT * FROM ${TABLE_NAME}
       WHERE city = ? AND state = ?
       ORDER BY ${CATEGORY_FIELD} ASC, name ASC`
    ).bind(cityName, stateName).all();

    // Get category breakdown
    const { results: categories } = await env.DB.prepare(
      `SELECT ${CATEGORY_FIELD} as category, COUNT(*) as count
       FROM ${TABLE_NAME}
       WHERE city = ? AND state = ? AND ${CATEGORY_FIELD} IS NOT NULL
       GROUP BY ${CATEGORY_FIELD}
       ORDER BY count DESC`
    ).bind(cityName, stateName).all();

    // Get related cities in same state
    const { results: relatedCities } = await env.DB.prepare(
      `SELECT city, state, COUNT(*) as count
       FROM ${TABLE_NAME}
       WHERE state = ? AND city != ? AND city IS NOT NULL AND city != ''
       GROUP BY city, state
       ORDER BY count DESC
       LIMIT 8`
    ).bind(stateName, cityName).all();

    // JSON-LD
    const jsonLd = {
      "@context": "https://schema.org",
      "@type": "ItemList",
      "name": `${SITE_NAME} in ${cityName}, ${stateName}`,
      "url": `${baseUrl}/cities/${slug}`,
      "numberOfItems": items.length,
      "itemListElement": items.map((item, i) => ({
        "@type": "ListItem",
        "position": i + 1,
        "item": {
          "@type": "Thing",
          "name": item.name,
          "url": `${baseUrl}/${ITEMS_PATH}/${item.slug}`
        }
      }))
    };

    // Sample names for richer meta description
    const sampleNames = items.slice(0, 3).map(i => i.name).join(', ');
    const hasMappable = items.some(i => i.latitude && i.longitude);
    const head = renderHead({
      title: `${capitalize(ITEMS_PATH)} in ${cityName}, ${stateName} - ${items.length} Locations`,
      description: `Discover ${items.length} ${ITEMS_PATH} in ${cityName}, ${stateName}.${sampleNames ? ` Including ${sampleNames}.` : ''}`,
      url: `${baseUrl}/cities/${slug}`,
      jsonLd,
      mapEnabled: hasMappable
    });

    // Group items by category
    const itemsByCategory = {};
    for (const item of items) {
      const cat = item[CATEGORY_FIELD] || 'Other';
      if (!itemsByCategory[cat]) itemsByCategory[cat] = [];
      itemsByCategory[cat].push(item);
    }

    // Sort categories by count
    const sortedCategories = Object.entries(itemsByCategory).sort((a, b) => b[1].length - a[1].length);

    // Category sections
    const categorySections = sortedCategories.map(([cat, catItems]) => {
      const catSlug = slugify(cat);
      const isOther = cat === 'Other';
      return `
      <div class="reveal">
        <div class="flex items-center justify-between mb-6">
          <h2 class="font-display text-xl font-bold tracking-tight">
            ${isOther ? 'Other' : `
              <a href="/category/${escapeHtml(catSlug)}" class="hover:text-muted transition-colors">${escapeHtml(cat)}</a>
            `}
          </h2>
          <span class="text-sm text-muted">${catItems.length} item${catItems.length === 1 ? '' : 's'}</span>
        </div>
        <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-7">
          ${catItems.map((item, i) => `<div class="reveal" style="transition-delay: ${i * 60}ms">${renderCard(item)}</div>`).join('\n')}
        </div>
      </div>
      `;
    }).join('\n<hr class="border-border my-12">\n');

    // Related cities
    const relatedCitiesHtml = relatedCities.length > 0 ? `
    <section class="mt-16 reveal">
      <h2 class="font-display text-2xl font-bold tracking-tight mb-8">More in ${escapeHtml(stateName)}</h2>
      <div class="grid grid-cols-2 sm:grid-cols-3 lg:grid-cols-4 gap-4">
        ${relatedCities.map(c => {
          const cSlug = slugify(c.city + '-' + c.state);
          return `
          <a href="/cities/${escapeHtml(cSlug)}" class="group bg-surface rounded-xl border border-border p-4 card-hover">
            <p class="font-display font-semibold text-sm group-hover:text-primary transition-colors">${escapeHtml(c.city)}</p>
            <p class="text-xs text-muted mt-1">${c.count} item${c.count === 1 ? '' : 's'}</p>
          </a>
          `;
        }).join('\n')}
      </div>
    </section>
    ` : '';

    const stateSlug = slugify(stateName);

    const body = `
    ${renderNav('/cities')}

    <!-- Breadcrumbs -->
    <div class="border-b border-border">
      <div class="max-w-5xl mx-auto px-6 py-4">
        ${renderBreadcrumbs([
          { label: 'Home', href: '/' },
          { label: stateName, href: '/states/' + stateSlug },
          { label: cityName }
        ], baseUrl)}
      </div>
    </div>

    <!-- Header -->
    <section class="bg-surface border-b border-border">
      <div class="relative z-10 max-w-5xl mx-auto px-6 py-14">
        <div class="flex items-start justify-between gap-4">
          <div>
            <h1 class="font-display text-3xl md:text-5xl font-bold tracking-tight mb-3 animate-fade-in-up">${escapeHtml(cityName)}, ${escapeHtml(stateName)}</h1>
            <p class="text-lg text-muted animate-fade-in-up stagger-2">${items.length} item${items.length === 1 ? '' : 's'} across ${categories.length} categor${categories.length === 1 ? 'y' : 'ies'}</p>
          </div>
          <div class="mt-2 animate-fade-in stagger-2">
            ${renderMapToggle(items)}
          </div>
        </div>
      </div>
    </section>

    <!-- Content -->
    <main class="max-w-5xl mx-auto px-6 py-14">
      <div id="directory-grid">
        ${categorySections}
      </div>
      ${renderMap(items)}
      ${relatedCitiesHtml}
    </main>

    ${renderFooter()}
    `;

    return htmlResponse(renderPage(head, body));

  } catch (error) {
    console.error('City detail error:', error);

    const head = renderHead({
      title: 'Error',
      description: 'An error occurred.',
      url: `${baseUrl}/cities/${slug}`
    });

    const body = `
    ${renderNav('/cities')}
    <main class="max-w-6xl mx-auto px-6 py-12">
      ${renderEmptyState({
        emoji: '&#9888;',
        title: 'Something went wrong',
        message: 'Please try again later.',
        action: { href: '/cities', label: 'View All Cities' }
      })}
    </main>
    ${renderFooter()}
    `;

    return htmlResponse(renderPage(head, body), 500);
  }
}
