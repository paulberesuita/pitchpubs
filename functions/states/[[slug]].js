/**
 * States Pages
 * GET /states - States index (all states with item counts)
 * GET /states/[state] - State detail (items organized by city)
 */

import {
  SITE_NAME, TABLE_NAME, ITEMS_PATH, CATEGORY_FIELD, PROD_BASE,
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
    return renderStatesIndex(context, baseUrl);
  }

  return renderStateDetail(context, baseUrl, slug);
}

/**
 * States index — all states with item counts
 */
async function renderStatesIndex(context, baseUrl) {
  const { env } = context;

  try {
    const { results: states } = await env.DB.prepare(
      `SELECT state, COUNT(*) as count
       FROM ${TABLE_NAME}
       WHERE state IS NOT NULL AND state != ''
       GROUP BY state
       ORDER BY count DESC, state ASC`
    ).all();

    const totalItems = states.reduce((sum, s) => sum + s.count, 0);

    const jsonLd = {
      "@context": "https://schema.org",
      "@type": "CollectionPage",
      "name": `Browse by State | ${SITE_NAME}`,
      "url": `${PROD_BASE}/states`,
      "numberOfItems": states.length,
      "hasPart": states.slice(0, 20).map(s => ({
        "@type": "ItemList",
        "name": s.state,
        "url": `${PROD_BASE}/states/${slugify(s.state)}`,
        "numberOfItems": s.count
      }))
    };

    const sampleStates = states.slice(0, 3).map(s => s.state).join(', ');
    const head = renderHead({
      title: `${capitalize(ITEMS_PATH)} in ${states.length} States - ${totalItems} Locations`,
      description: `Explore ${totalItems} ${ITEMS_PATH} across ${states.length} states.${sampleStates ? ` Including ${sampleStates}.` : ''}`,
      url: `${baseUrl}/states`,
      jsonLd
    });

    const statesHtml = states.map((s, i) => {
      const stateSlug = slugify(s.state);
      return `
      <a href="/states/${escapeHtml(stateSlug)}" class="group block bg-surface rounded-2xl border border-border card-hover p-7 reveal" style="transition-delay: ${Math.min(i, 12) * 60}ms">
        <div class="flex items-center justify-between">
          <div>
            <h2 class="font-display text-lg font-bold group-hover:text-primary transition-colors duration-200">${escapeHtml(s.state)}</h2>
            <p class="text-sm text-muted mt-1.5">${s.count} item${s.count === 1 ? '' : 's'}</p>
          </div>
          <svg class="w-5 h-5 text-muted group-hover:text-primary transition-colors duration-200" fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5l7 7-7 7"></path>
          </svg>
        </div>
      </a>
      `;
    }).join('\n');

    const body = `
    ${renderNav('/states')}

    <!-- Breadcrumbs -->
    <div class="border-b border-border">
      <div class="max-w-5xl mx-auto px-6 py-4">
        ${renderBreadcrumbs([
          { label: 'Home', href: '/' },
          { label: 'States' }
        ], baseUrl)}
      </div>
    </div>

    <!-- Header -->
    <section class="bg-surface border-b border-border">
      <div class="relative z-10 max-w-5xl mx-auto px-6 py-14">
        <h1 class="font-display text-3xl md:text-5xl font-bold tracking-tight mb-3 animate-fade-in-up">Browse by State</h1>
        <p class="text-lg text-muted animate-fade-in-up stagger-2">${totalItems} items across ${states.length} states</p>
      </div>
    </section>

    <!-- States Grid -->
    <main class="max-w-5xl mx-auto px-6 py-14">
      ${states.length > 0 ? `
      <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-5">
        ${statesHtml}
      </div>
      ` : renderEmptyState({
        emoji: '&#127758;',
        title: 'No states yet',
        message: 'Items with state data will appear here.',
        action: { href: '/submit', label: 'Submit Item' }
      })}
    </main>

    ${renderFooter()}
    `;

    return htmlResponse(renderPage(head, body));

  } catch (error) {
    console.error('States index error:', error);

    const head = renderHead({
      title: 'Browse by State',
      description: `Browse items by state in ${SITE_NAME}.`,
      url: `${baseUrl}/states`
    });

    const body = `
    ${renderNav('/states')}
    <main class="max-w-6xl mx-auto px-6 py-12">
      ${renderEmptyState({
        emoji: '&#127758;',
        title: 'No states yet',
        message: 'Add items with location data to browse by state.',
        action: { href: '/submit', label: 'Submit Item' }
      })}
    </main>
    ${renderFooter()}
    `;

    return htmlResponse(renderPage(head, body));
  }
}

/**
 * State detail — items organized by city, with category breakdown
 */
async function renderStateDetail(context, baseUrl, slug) {
  const { env } = context;

  try {
    // Find state by slug match
    const stateResult = await env.DB.prepare(
      `SELECT DISTINCT state FROM ${TABLE_NAME}
       WHERE LOWER(REPLACE(REPLACE(state, ' ', '-'), '.', '')) = ?
       LIMIT 1`
    ).bind(slug.toLowerCase()).first();

    if (!stateResult) {
      const head = renderHead({
        title: 'State Not Found',
        description: 'The requested state could not be found.',
        url: `${baseUrl}/states/${slug}`
      });

      const body = `
      ${renderNav('/states')}
      <main class="max-w-6xl mx-auto px-6 py-12">
        ${renderEmptyState({
          emoji: '&#128270;',
          title: 'State not found',
          message: 'This state has no items or doesn\'t exist.',
          action: { href: '/states', label: 'View All States' }
        })}
      </main>
      ${renderFooter()}
      `;

      return htmlResponse(renderPage(head, body), 404);
    }

    const stateName = stateResult.state;

    // Get all items in this state
    const { results: items } = await env.DB.prepare(
      `SELECT * FROM ${TABLE_NAME}
       WHERE state = ?
       ORDER BY city ASC, name ASC`
    ).bind(stateName).all();

    // Get city breakdown
    const { results: cities } = await env.DB.prepare(
      `SELECT city, COUNT(*) as count
       FROM ${TABLE_NAME}
       WHERE state = ? AND city IS NOT NULL AND city != ''
       GROUP BY city
       ORDER BY count DESC, city ASC`
    ).bind(stateName).all();

    // Get category breakdown
    const { results: categories } = await env.DB.prepare(
      `SELECT ${CATEGORY_FIELD} as category, COUNT(*) as count
       FROM ${TABLE_NAME}
       WHERE state = ? AND ${CATEGORY_FIELD} IS NOT NULL
       GROUP BY ${CATEGORY_FIELD}
       ORDER BY count DESC`
    ).bind(stateName).all();

    // JSON-LD
    const jsonLd = {
      "@context": "https://schema.org",
      "@type": "ItemList",
      "name": `${SITE_NAME} in ${stateName}`,
      "url": `${PROD_BASE}/states/${slug}`,
      "numberOfItems": items.length,
      "itemListElement": items.slice(0, 50).map((item, i) => ({
        "@type": "ListItem",
        "position": i + 1,
        "item": {
          "@type": "Thing",
          "name": item.name,
          "url": `${PROD_BASE}/${ITEMS_PATH}/${item.slug}`
        }
      }))
    };

    // Sample names for richer meta description
    const sampleNames = items.slice(0, 3).map(i => i.name).join(', ');
    const hasMappable = items.some(i => i.latitude && i.longitude);
    const head = renderHead({
      title: `${capitalize(ITEMS_PATH)} in ${stateName} - ${items.length} Locations`,
      description: `Discover ${items.length} ${ITEMS_PATH} in ${stateName} across ${cities.length} cit${cities.length === 1 ? 'y' : 'ies'}.${sampleNames ? ` Including ${sampleNames}.` : ''}`,
      url: `${baseUrl}/states/${slug}`,
      jsonLd,
      mapEnabled: hasMappable
    });

    // Group items by city
    const itemsByCity = {};
    for (const item of items) {
      const city = item.city || 'Other';
      if (!itemsByCity[city]) itemsByCity[city] = [];
      itemsByCity[city].push(item);
    }

    // Sort cities by count (descending)
    const sortedCities = Object.entries(itemsByCity).sort((a, b) => b[1].length - a[1].length);

    // City sections
    const citySections = sortedCities.map(([city, cityItems]) => {
      const citySlug = slugify(city + '-' + stateName);
      const isOther = city === 'Other';
      return `
      <div class="reveal">
        <div class="flex items-center justify-between mb-6">
          <h2 class="font-display text-xl font-bold tracking-tight">
            ${isOther ? 'Other Locations' : `
              <a href="/cities/${escapeHtml(citySlug)}" class="hover:text-muted transition-colors">${escapeHtml(city)}</a>
            `}
          </h2>
          <span class="text-sm text-muted">${cityItems.length} item${cityItems.length === 1 ? '' : 's'}</span>
        </div>
        <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-7">
          ${cityItems.map((item, i) => `<div class="reveal" style="transition-delay: ${i * 60}ms">${renderCard(item)}</div>`).join('\n')}
        </div>
      </div>
      `;
    }).join('\n<hr class="border-border my-12">\n');

    // City pills for quick nav
    const cityPills = cities.map(c => {
      const citySlug = slugify(c.city + '-' + stateName);
      return `<a href="/cities/${escapeHtml(citySlug)}" class="text-sm bg-surface hover:bg-surface-hover text-muted hover:text-primary px-4 py-2 rounded-xl border border-border transition-all duration-200">${escapeHtml(c.city)} (${c.count})</a>`;
    }).join('\n');

    // Category pills
    const categoryPills = categories.map(cat =>
      `<a href="/category/${slugify(cat.category)}" class="text-sm text-muted hover:text-primary transition-colors">${escapeHtml(cat.category)} (${cat.count})</a>`
    ).join('<span class="text-border">&middot;</span>\n');

    const body = `
    ${renderNav('/states')}

    <!-- Breadcrumbs -->
    <div class="border-b border-border">
      <div class="max-w-5xl mx-auto px-6 py-4">
        ${renderBreadcrumbs([
          { label: 'Home', href: '/' },
          { label: 'States', href: '/states' },
          { label: stateName }
        ], baseUrl)}
      </div>
    </div>

    <!-- Header -->
    <section class="bg-surface border-b border-border">
      <div class="max-w-5xl mx-auto px-6 py-14">
        <div class="flex items-start justify-between gap-4">
          <div>
            <h1 class="font-display text-3xl md:text-5xl font-bold tracking-tight mb-3 animate-fade-in-up">${escapeHtml(stateName)}</h1>
            <p class="text-lg text-muted animate-fade-in-up stagger-2">${items.length} item${items.length === 1 ? '' : 's'} across ${cities.length} cit${cities.length === 1 ? 'y' : 'ies'}</p>
          </div>
          <div class="mt-2 animate-fade-in stagger-2">
            ${renderMapToggle(items)}
          </div>
        </div>
        ${categories.length > 0 ? `
        <div class="flex flex-wrap items-center gap-3 mt-4 animate-fade-in stagger-3">
          ${categoryPills}
        </div>
        ` : ''}
      </div>
    </section>

    <!-- City Quick Nav -->
    ${cities.length > 1 ? `
    <section class="border-b border-border">
      <div class="max-w-5xl mx-auto px-6 py-5">
        <div class="flex flex-wrap items-center gap-2.5">
          ${cityPills}
        </div>
      </div>
    </section>
    ` : ''}

    <!-- Content -->
    <main class="max-w-5xl mx-auto px-6 py-14">
      <div id="directory-grid">
        ${citySections}
      </div>
      ${renderMap(items)}
    </main>

    ${renderFooter()}
    `;

    return htmlResponse(renderPage(head, body));

  } catch (error) {
    console.error('State detail error:', error);

    const head = renderHead({
      title: 'Error',
      description: 'An error occurred.',
      url: `${baseUrl}/states/${slug}`
    });

    const body = `
    ${renderNav('/states')}
    <main class="max-w-6xl mx-auto px-6 py-12">
      ${renderEmptyState({
        emoji: '&#9888;',
        title: 'Something went wrong',
        message: 'Please try again later.',
        action: { href: '/states', label: 'View All States' }
      })}
    </main>
    ${renderFooter()}
    `;

    return htmlResponse(renderPage(head, body), 500);
  }
}
