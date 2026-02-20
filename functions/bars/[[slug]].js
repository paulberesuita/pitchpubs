/**
 * Items Browse + Detail Page
 * GET /items - Browse all items
 * GET /items/[slug] - Item detail page
 *
 * NOTE: The folder name "items" should be renamed during bootstrap
 * to match your directory topic (e.g., "tools", "places", "products")
 */

import {
  SITE_NAME, TABLE_NAME, ITEMS_PATH, CATEGORY_FIELD, SCHEMA_TYPE,
  escapeHtml, slugify, capitalize, renderHead, renderNav, renderFooter, renderBreadcrumbs,
  renderCard, renderEmptyState, renderPagination, renderMapToggle, renderMap,
  renderPage, htmlResponse
} from '../_shared.js';

const ITEMS_PER_PAGE = 24;

export async function onRequestGet(context) {
  const { env, request, params } = context;
  const url = new URL(request.url);
  const baseUrl = `${url.protocol}//${url.host}`;

  const slug = params.slug?.[0];

  // If no slug, render browse page
  if (!slug) {
    return renderBrowsePage(context, baseUrl);
  }

  // Otherwise, render detail page
  return renderDetailPage(context, baseUrl, slug);
}

/**
 * Browse all items page
 */
async function renderBrowsePage(context, baseUrl) {
  const { env, request } = context;
  const url = new URL(request.url);

  const page = Math.max(1, parseInt(url.searchParams.get('page')) || 1);
  const category = url.searchParams.get('category');
  const sort = url.searchParams.get('sort') || 'name';
  const offset = (page - 1) * ITEMS_PER_PAGE;

  try {
    // Build query based on filters
    let whereClause = '';
    const bindings = [];

    if (category) {
      whereClause = `WHERE ${CATEGORY_FIELD} = ?`;
      bindings.push(category);
    }

    // Sort options — default sorts images-first so pages look complete
    const sortOptions = {
      'name': 'CASE WHEN image_url IS NOT NULL AND image_url != \'\' THEN 0 ELSE 1 END, name ASC',
      'newest': 'created_at DESC',
      'oldest': 'created_at ASC'
    };
    const orderBy = sortOptions[sort] || sortOptions['name'];

    // Get items
    const { results: items } = await env.DB.prepare(
      `SELECT * FROM ${TABLE_NAME} ${whereClause} ORDER BY ${orderBy} LIMIT ? OFFSET ?`
    ).bind(...bindings, ITEMS_PER_PAGE, offset).all();

    // Get total count
    const countResult = await env.DB.prepare(
      `SELECT COUNT(*) as count FROM ${TABLE_NAME} ${whereClause}`
    ).bind(...bindings).first();

    const totalCount = countResult?.count || 0;
    const totalPages = Math.ceil(totalCount / ITEMS_PER_PAGE);

    // Get categories for filter
    const { results: categories } = await env.DB.prepare(
      `SELECT ${CATEGORY_FIELD} as category, COUNT(*) as count FROM ${TABLE_NAME}
       WHERE ${CATEGORY_FIELD} IS NOT NULL
       GROUP BY ${CATEGORY_FIELD} ORDER BY count DESC`
    ).all();

    const sampleNames = items.slice(0, 3).map(i => i.name).join(', ');
    const hasMappable = items.some(i => i.latitude && i.longitude);
    const paginationBase = `${baseUrl}/${ITEMS_PATH}${category ? `?category=${encodeURIComponent(category)}` : ''}`;
    const pageSep = paginationBase.includes('?') ? '&' : '?';

    const browseJsonLd = {
      "@context": "https://schema.org",
      "@type": "CollectionPage",
      "name": category ? `${category} ${capitalize(ITEMS_PATH)}` : `Browse ${capitalize(ITEMS_PATH)}`,
      "url": `${baseUrl}/${ITEMS_PATH}`,
      "numberOfItems": totalCount
    };

    const head = renderHead({
      title: category ? `${category} ${capitalize(ITEMS_PATH)} - ${totalCount} Listings` : `Browse All ${totalCount} ${capitalize(ITEMS_PATH)}`,
      description: `Browse ${totalCount} ${ITEMS_PATH} in ${SITE_NAME}.${category ? ` Filtered by ${category}.` : ''}${sampleNames ? ` Including ${sampleNames}.` : ''}`,
      url: `${baseUrl}/${ITEMS_PATH}`,
      jsonLd: browseJsonLd,
      mapEnabled: hasMappable,
      pagination: totalPages > 1 ? {
        prev: page > 1 ? `${paginationBase}${pageSep}page=${page - 1}` : null,
        next: page < totalPages ? `${paginationBase}${pageSep}page=${page + 1}` : null
      } : null
    });

    // Category filter pills
    const filterPills = categories.map(cat => {
      const isActive = category === cat.category;
      return `
        <a href="/${ITEMS_PATH}?category=${encodeURIComponent(cat.category)}"
           class="${isActive ? 'text-sm bg-primary text-white font-medium' : 'bg-surface hover:bg-surface-hover text-muted hover:text-primary border border-border hover:border-border'} text-sm px-4 py-2 rounded-xl transition-all duration-200">
          ${escapeHtml(cat.category)} (${cat.count})
        </a>
      `;
    }).join('\n');

    const body = `
    ${renderNav('/' + ITEMS_PATH)}

    <!-- Breadcrumbs -->
    <div class="border-b border-border">
      <div class="max-w-5xl mx-auto px-6 py-4">
        ${renderBreadcrumbs([
          { label: 'Home', href: '/' },
          { label: 'Browse' }
        ], baseUrl)}
      </div>
    </div>

    <!-- Filters -->
    <section class="bg-surface border-b border-border">
      <div class="relative z-10 max-w-5xl mx-auto px-6 py-8">
        <div class="flex flex-wrap items-center gap-2.5">
          <a href="/${ITEMS_PATH}"
             class="${!category ? 'text-sm bg-primary text-white font-medium' : 'bg-surface hover:bg-surface-hover text-muted hover:text-primary border border-border hover:border-border'} text-sm px-4 py-2 rounded-xl transition-all duration-200">
            All
          </a>
          ${filterPills}
        </div>
      </div>
    </section>

    <!-- Items -->
    <main class="max-w-5xl mx-auto px-6 py-14">
      <div class="flex items-center justify-between mb-10">
        <p class="text-muted">
          <span class="text-primary font-semibold">${totalCount}</span> item${totalCount === 1 ? '' : 's'}
          ${category ? ` in ${escapeHtml(category)}` : ''}
        </p>
        <div class="flex items-center gap-3">
          ${renderMapToggle(items)}
          <select onchange="window.location.href='/${ITEMS_PATH}?sort=' + this.value${category ? `+ '&category=${encodeURIComponent(category)}'` : ''}"
                  class="text-sm bg-surface border border-border rounded-xl px-4 py-2 focus:outline-none transition-all">
            <option value="name" ${sort === 'name' ? 'selected' : ''}>Alphabetical</option>
            <option value="newest" ${sort === 'newest' ? 'selected' : ''}>Newest First</option>
            <option value="oldest" ${sort === 'oldest' ? 'selected' : ''}>Oldest First</option>
          </select>
        </div>
      </div>

      ${items.length > 0 ? `
      <div id="directory-grid" class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-7">
        ${items.map((item, i) => `<div class="reveal" style="transition-delay: ${i * 60}ms">${renderCard(item)}</div>`).join('\n')}
      </div>
      ${renderMap(items)}
      ${renderPagination({
        currentPage: page,
        totalPages,
        baseUrl: `/${ITEMS_PATH}${category ? `?category=${encodeURIComponent(category)}` : ''}`
      })}
      ` : renderEmptyState({
        emoji: '&#128237;',
        title: 'No items yet',
        message: 'Be the first to add something to this directory.',
        action: { href: '/submit', label: 'Submit Item' }
      })}
    </main>

    ${renderFooter()}
    `;

    return htmlResponse(renderPage(head, body));

  } catch (error) {
    console.error('Browse page error:', error);

    const head = renderHead({
      title: 'Browse',
      description: `Browse items in ${SITE_NAME}.`,
      url: `${baseUrl}/${ITEMS_PATH}`
    });

    const body = `
    ${renderNav('/' + ITEMS_PATH)}
    <main class="max-w-6xl mx-auto px-6 py-12">
      ${renderEmptyState({
        emoji: '📭',
        title: 'No items yet',
        message: 'Add items to get started.',
        action: { href: '/submit', label: 'Submit Item' }
      })}
    </main>
    ${renderFooter()}
    `;

    return htmlResponse(renderPage(head, body));
  }
}

/**
 * Item detail page
 */
async function renderDetailPage(context, baseUrl, slug) {
  const { env } = context;

  try {
    // Get item by slug
    const item = await env.DB.prepare(
      `SELECT * FROM ${TABLE_NAME} WHERE slug = ?`
    ).bind(slug).first();

    if (!item) {
      const head = renderHead({
        title: 'Not Found',
        description: 'The requested item could not be found.',
        url: `${baseUrl}/${ITEMS_PATH}/${slug}`
      });

      const body = `
      ${renderNav('/' + ITEMS_PATH)}
      <main class="max-w-6xl mx-auto px-6 py-12">
        ${renderEmptyState({
          emoji: '🔍',
          title: 'Item not found',
          message: 'This item doesn\'t exist or has been removed.',
          action: { href: `/${ITEMS_PATH}`, label: 'Browse All' }
        })}
      </main>
      ${renderFooter()}
      `;

      return htmlResponse(renderPage(head, body), 404);
    }

    const categoryValue = item[CATEGORY_FIELD];

    // Get 3 related sections: same city, same state, same category (SpookFinder pattern)
    const [cityRelated, stateRelated, categoryRelated] = await Promise.all([
      // Related in same city
      (item.city && item.state) ? env.DB.prepare(
        `SELECT * FROM ${TABLE_NAME}
         WHERE city = ? AND state = ? AND slug != ?
         ORDER BY RANDOM() LIMIT 4`
      ).bind(item.city, item.state, slug).all().then(r => r.results) : Promise.resolve([]),
      // Related in same state
      item.state ? env.DB.prepare(
        `SELECT * FROM ${TABLE_NAME}
         WHERE state = ? AND slug != ? ${item.city ? `AND city != ?` : ''}
         ORDER BY RANDOM() LIMIT 4`
      ).bind(...[item.state, slug, ...(item.city ? [item.city] : [])]).all().then(r => r.results) : Promise.resolve([]),
      // Related in same category
      categoryValue ? env.DB.prepare(
        `SELECT * FROM ${TABLE_NAME}
         WHERE ${CATEGORY_FIELD} = ? AND slug != ? ${item.state ? `AND state != ?` : ''}
         ORDER BY RANDOM() LIMIT 4`
      ).bind(...[categoryValue, slug, ...(item.state ? [item.state] : [])]).all().then(r => r.results) : Promise.resolve([])
    ]);

    // Parse sources if present
    let sources = [];
    if (item.sources) {
      try { sources = JSON.parse(item.sources); } catch (e) { /* ignore */ }
    }

    // JSON-LD with domain-specific SCHEMA_TYPE
    const jsonLd = {
      "@context": "https://schema.org",
      "@type": SCHEMA_TYPE,
      "name": item.name,
      "description": item.description,
      "url": `${baseUrl}/${ITEMS_PATH}/${slug}`,
      ...(item.image_url && { "image": item.image_url }),
      ...(item.updated_at && { "dateModified": item.updated_at }),
      ...(item.created_at && { "datePublished": item.created_at }),
      ...(item.latitude && item.longitude && {
        "geo": { "@type": "GeoCoordinates", "latitude": item.latitude, "longitude": item.longitude }
      }),
      ...((item.city || item.state) && {
        "address": {
          "@type": "PostalAddress",
          ...(item.city && { "addressLocality": item.city }),
          ...(item.state && { "addressRegion": item.state }),
          ...(item.address && { "streetAddress": item.address })
        }
      }),
      ...(sources.length > 0 && {
        "citation": sources.map(s => ({ "@type": "CreativeWork", "url": s }))
      })
    };

    const head = renderHead({
      title: item.name,
      description: (item.description || item.content || `${item.name} - part of our curated directory.`).substring(0, 155),
      url: `${baseUrl}/${ITEMS_PATH}/${slug}`,
      image: item.image_url,
      jsonLd
    });

    // Image HTML — includes dimensions for CLS prevention + onerror fallback
    const detailImageSrc = item.image_url?.startsWith('/') ? item.image_url : `/images/${item.image_url}`;
    const imageHtml = item.image_url
      ? `<img src="${escapeHtml(detailImageSrc)}" alt="${escapeHtml(item.name)}" width="800" height="400" class="w-full h-full object-cover" loading="eager"
           onerror="this.style.display='none';this.nextElementSibling.style.display='flex'">
         <div class="w-full h-full bg-surface items-center justify-center" style="display:none"><span class="text-4xl opacity-30">&#128230;</span></div>`
      : `<div class="w-full h-full bg-surface flex items-center justify-center"><span class="text-4xl opacity-30">&#128230;</span></div>`;

    // Slugs for links
    const categorySlug = categoryValue ? slugify(categoryValue) : '';
    const stateSlug = item.state ? slugify(item.state) : '';
    const citySlug = (item.city && item.state) ? slugify(item.city + '-' + item.state) : '';

    // Build related sections (SpookFinder pattern: city, state, category)
    const relatedSections = [];

    if (cityRelated.length > 0) {
      relatedSections.push(`
      <section class="mt-16 reveal">
        <div class="flex items-center justify-between mb-5">
          <h2 class="font-display text-xl font-semibold tracking-tight">More in ${escapeHtml(item.city)}</h2>
          <a href="/cities/${escapeHtml(citySlug)}" class="text-sm text-muted hover:text-primary transition-colors">View all &rarr;</a>
        </div>
        <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-6">
          ${cityRelated.map((r, i) => `<div class="reveal" style="transition-delay: ${i * 80}ms">${renderCard(r)}</div>`).join('\n')}
        </div>
      </section>
      `);
    }

    if (stateRelated.length > 0) {
      relatedSections.push(`
      <section class="mt-12 reveal">
        <div class="flex items-center justify-between mb-5">
          <h2 class="font-display text-xl font-semibold tracking-tight">More in ${escapeHtml(item.state)}</h2>
          <a href="/states/${escapeHtml(stateSlug)}" class="text-sm text-muted hover:text-primary transition-colors">View all &rarr;</a>
        </div>
        <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-6">
          ${stateRelated.map((r, i) => `<div class="reveal" style="transition-delay: ${i * 80}ms">${renderCard(r)}</div>`).join('\n')}
        </div>
      </section>
      `);
    }

    if (categoryRelated.length > 0) {
      relatedSections.push(`
      <section class="mt-12 reveal">
        <div class="flex items-center justify-between mb-5">
          <h2 class="font-display text-xl font-semibold tracking-tight">More ${escapeHtml(categoryValue)}</h2>
          <a href="/category/${escapeHtml(categorySlug)}" class="text-sm text-muted hover:text-primary transition-colors">View all &rarr;</a>
        </div>
        <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-6">
          ${categoryRelated.map((r, i) => `<div class="reveal" style="transition-delay: ${i * 80}ms">${renderCard(r)}</div>`).join('\n')}
        </div>
      </section>
      `);
    }

    const relatedHtml = relatedSections.join('\n');

    const body = `
    ${renderNav('/' + ITEMS_PATH)}

    <!-- Breadcrumbs -->
    <div class="border-b border-border">
      <div class="max-w-4xl mx-auto px-6 py-4">
        ${renderBreadcrumbs([
          { label: 'Home', href: '/' },
          ...(item.state ? [{ label: item.state, href: `/states/${stateSlug}` }] : [
            { label: capitalize(ITEMS_PATH), href: `/${ITEMS_PATH}` }
          ]),
          { label: item.name }
        ], baseUrl)}
      </div>
    </div>

    <!-- Main Content -->
    <main class="max-w-4xl mx-auto px-6 py-12">

      <!-- Header Card -->
      <div class="bg-surface rounded-2xl border border-border overflow-hidden mb-10 animate-fade-in-up">
        <!-- Hero Image -->
        <div class="aspect-[2/1] bg-surface overflow-hidden">
          ${imageHtml}
        </div>

        <!-- Header Content -->
        <div class="p-8 md:p-10">
          <div class="flex flex-col md:flex-row md:items-start md:justify-between gap-6">
            <div class="flex-1">
              <h1 class="font-display text-2xl md:text-4xl font-semibold tracking-tight mb-4">${escapeHtml(item.name)}</h1>
              <p class="text-lg text-muted mb-5 leading-relaxed">${escapeHtml(item.description || '')}</p>
              <div class="flex flex-wrap items-center gap-3">
                ${categoryValue ? `
                <a href="/category/${categorySlug}" class="text-sm bg-surface hover:bg-surface-hover text-muted hover:text-primary px-4 py-1.5 rounded-xl transition-all duration-200 border border-border">
                  ${escapeHtml(categoryValue)}
                </a>
                ` : ''}
              </div>
            </div>
            ${item.source_url ? `
            <div class="flex flex-col gap-3 md:min-w-[180px]">
              <a href="${escapeHtml(item.source_url)}" target="_blank" rel="noopener noreferrer"
                 class="bg-primary hover:bg-primary-hover text-white font-medium px-6 py-3.5 rounded-xl transition-all duration-200 text-center">
                Visit Website &rarr;
              </a>
            </div>
            ` : ''}
          </div>
        </div>
      </div>

      <!-- Content Grid -->
      <div class="grid grid-cols-1 lg:grid-cols-3 gap-8">

        <!-- Main Content -->
        <div class="lg:col-span-2 space-y-8">

          <!-- About -->
          <section class="bg-surface rounded-2xl border border-border p-8 reveal">
            <h2 class="font-display text-xl font-semibold tracking-tight mb-5">About</h2>
            <div class="prose prose-stone max-w-none text-muted leading-relaxed">
              ${(() => {
                const raw = escapeHtml(item.content || item.description || 'No description available.');
                // Auto-link first city and state mention to geographic pages
                // Regex-escape special chars (., (, ), etc.) in names
                const reEscape = (s) => s.replace(/[.*+?^${}()|[\]\\]/g, '\\$&');
                let linked = raw;
                if (item.city && item.state) {
                  const cityLink = `/cities/${slugify(item.city + '-' + item.state)}`;
                  const cityPattern = new RegExp(`\\b${reEscape(escapeHtml(item.city))}\\b`);
                  linked = linked.replace(cityPattern, `<a href="${cityLink}" class="text-primary hover:text-primary-hover transition-colors">${escapeHtml(item.city)}</a>`);
                }
                if (item.state) {
                  const stateLink = `/states/${slugify(item.state)}`;
                  const statePattern = new RegExp(`\\b${reEscape(escapeHtml(item.state))}\\b`);
                  linked = linked.replace(statePattern, `<a href="${stateLink}" class="text-primary hover:text-primary-hover transition-colors">${escapeHtml(item.state)}</a>`);
                }
                return `<p>${linked}</p>`;
              })()}
            </div>
          </section>

          ${sources.length > 0 ? `
          <!-- Sources — E-E-A-T trust signal -->
          <section class="bg-surface rounded-2xl border border-border p-8 reveal">
            <div class="flex items-center justify-between mb-5">
              <h2 class="font-display text-xl font-semibold tracking-tight">Sources</h2>
              <span class="text-xs bg-success-bg text-success px-3 py-1 rounded-xl font-medium">${item.source_count || sources.length} verified</span>
            </div>
            <p class="text-sm text-muted mb-5">Researched from ${item.source_count || sources.length} independent source${(item.source_count || sources.length) === 1 ? '' : 's'}.
              <a href="/about#how-we-research" class="text-primary hover:text-primary-hover transition-colors duration-200">How we research &rarr;</a>
            </p>
            <ul class="space-y-3">
              ${sources.map((s, i) => `
              <li class="text-sm">
                <a href="${escapeHtml(s)}" target="_blank" rel="noopener noreferrer"
                   class="text-primary hover:text-primary-hover transition-colors duration-200 break-all">
                  ${escapeHtml(s.replace(/^https?:\/\/(www\.)?/, '').split('/')[0])}
                </a>
              </li>
              `).join('')}
            </ul>
          </section>
          ` : ''}

        </div>

        <!-- Sidebar -->
        <div class="space-y-6">

          <!-- Details Card -->
          <div class="bg-surface rounded-2xl border border-border p-6 reveal">
            <h3 class="font-display font-semibold text-xs uppercase tracking-[0.15em] text-muted mb-5">Details</h3>
            <dl class="space-y-5">
              ${categoryValue ? `
              <div>
                <dt class="text-sm text-muted mb-1">Category</dt>
                <dd>
                  <a href="/category/${categorySlug}" class="text-primary hover:text-primary-hover transition-colors duration-200">
                    ${escapeHtml(categoryValue)}
                  </a>
                </dd>
              </div>
              ` : ''}
              ${(item.city || item.state) ? `
              <div class="border-t border-border pt-5">
                <dt class="text-sm text-muted mb-1">Location</dt>
                <dd>
                  ${item.city ? `<a href="/cities/${escapeHtml(citySlug)}" class="text-primary hover:text-primary-hover transition-colors duration-200">${escapeHtml(item.city)}</a>` : ''}
                  ${item.city && item.state ? ', ' : ''}
                  ${item.state ? `<a href="/states/${escapeHtml(stateSlug)}" class="text-primary hover:text-primary-hover transition-colors duration-200">${escapeHtml(item.state)}</a>` : ''}
                </dd>
              </div>
              ` : ''}
              ${item.source_url ? `
              <div class="border-t border-border pt-5">
                <dt class="text-sm text-muted mb-1">Website</dt>
                <dd>
                  <a href="${escapeHtml(item.source_url)}" target="_blank" rel="noopener noreferrer"
                     class="text-primary hover:text-primary-hover transition-colors duration-200">
                    Visit &rarr;
                  </a>
                </dd>
              </div>
              ` : ''}
              <div class="border-t border-border pt-5">
                <dt class="text-sm text-muted mb-1">Last Researched</dt>
                <dd>${(item.updated_at || item.created_at) ? new Date(item.updated_at || item.created_at).toLocaleDateString('en-US', { year: 'numeric', month: 'long', day: 'numeric' }) : 'Unknown'}</dd>
              </div>
            </dl>
          </div>

          <!-- Google Maps Embed -->
          ${item.latitude && item.longitude ? `
          <div class="bg-surface rounded-2xl border border-border overflow-hidden reveal">
            <iframe
              src="https://maps.google.com/maps?q=${item.latitude},${item.longitude}&z=15&output=embed"
              width="100%" height="220" style="border:0;" loading="lazy" referrerpolicy="no-referrer-when-downgrade"
              title="Map of ${escapeHtml(item.name)}">
            </iframe>
          </div>
          ` : ''}

        </div>

      </div>

      ${relatedHtml}

    </main>

    ${renderFooter()}
    `;

    return htmlResponse(renderPage(head, body));

  } catch (error) {
    console.error('Detail page error:', error);

    const head = renderHead({
      title: 'Error',
      description: 'An error occurred.',
      url: `${baseUrl}/${ITEMS_PATH}/${slug}`
    });

    const body = `
    ${renderNav('/' + ITEMS_PATH)}
    <main class="max-w-6xl mx-auto px-6 py-12">
      ${renderEmptyState({
        emoji: '⚠️',
        title: 'Something went wrong',
        message: 'Please try again later.',
        action: { href: `/${ITEMS_PATH}`, label: 'Browse All' }
      })}
    </main>
    ${renderFooter()}
    `;

    return htmlResponse(renderPage(head, body), 500);
  }
}
