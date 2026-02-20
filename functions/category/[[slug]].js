/**
 * Category Page
 * GET /category/[slug]
 */

import {
  SITE_NAME, TABLE_NAME, ITEMS_PATH, CATEGORY_FIELD,
  escapeHtml, slugify, capitalize, renderHead, renderNav, renderFooter, renderBreadcrumbs,
  renderCard, renderEmptyState, renderPagination,
  renderPage, htmlResponse
} from '../_shared.js';

const ITEMS_PER_PAGE = 24;

export async function onRequestGet(context) {
  const { env, request, params } = context;
  const url = new URL(request.url);
  const baseUrl = `${url.protocol}//${url.host}`;

  const slug = params.slug?.[0];
  const page = Math.max(1, parseInt(url.searchParams.get('page')) || 1);
  const offset = (page - 1) * ITEMS_PER_PAGE;

  // If no slug, redirect to categories index
  if (!slug) {
    return Response.redirect(`${baseUrl}/categories`, 302);
  }

  try {
    // Find category by slug (convert slug back to potential category name)
    // Try exact match first, then slug match
    const categoryResult = await env.DB.prepare(
      `SELECT DISTINCT ${CATEGORY_FIELD} as category FROM ${TABLE_NAME}
       WHERE LOWER(REPLACE(${CATEGORY_FIELD}, ' ', '-')) = ?
       LIMIT 1`
    ).bind(slug.toLowerCase()).first();

    if (!categoryResult) {
      // 404
      const head = renderHead({
        title: 'Category Not Found',
        description: 'The requested category could not be found.',
        url: `${baseUrl}/category/${slug}`
      });

      const body = `
      ${renderNav('/categories')}
      <main class="max-w-6xl mx-auto px-6 py-12">
        ${renderEmptyState({
          emoji: '🔍',
          title: 'Category not found',
          message: 'This category doesn\'t exist or has no items.',
          action: { href: '/categories', label: 'View Categories' }
        })}
      </main>
      ${renderFooter()}
      `;

      return htmlResponse(renderPage(head, body), 404);
    }

    const categoryName = categoryResult.category;

    // Get items in category — images-first so pages look complete
    const { results: items } = await env.DB.prepare(
      `SELECT * FROM ${TABLE_NAME}
       WHERE ${CATEGORY_FIELD} = ?
       ORDER BY CASE WHEN image_url IS NOT NULL AND image_url != '' THEN 0 ELSE 1 END, name ASC
       LIMIT ? OFFSET ?`
    ).bind(categoryName, ITEMS_PER_PAGE, offset).all();

    // Get total count
    const countResult = await env.DB.prepare(
      `SELECT COUNT(*) as count FROM ${TABLE_NAME} WHERE ${CATEGORY_FIELD} = ?`
    ).bind(categoryName).first();

    const totalCount = countResult?.count || 0;
    const totalPages = Math.ceil(totalCount / ITEMS_PER_PAGE);

    // Get states for client-side filter dropdown
    const { results: states } = await env.DB.prepare(
      `SELECT state, COUNT(*) as count
       FROM ${TABLE_NAME}
       WHERE ${CATEGORY_FIELD} = ? AND state IS NOT NULL AND state != ''
       GROUP BY state
       ORDER BY count DESC, state ASC`
    ).bind(categoryName).all();

    // JSON-LD for category page
    const jsonLd = {
      "@context": "https://schema.org",
      "@type": "CollectionPage",
      "name": `${categoryName} | ${SITE_NAME}`,
      "url": `${baseUrl}/category/${slug}`,
      "numberOfItems": totalCount,
      "hasPart": items.slice(0, 10).map(item => ({
        "@type": "Thing",
        "name": item.name,
        "url": `${baseUrl}/${ITEMS_PATH}/${item.slug}`
      }))
    };

    const sampleNames = items.slice(0, 3).map(i => i.name).join(', ');
    const head = renderHead({
      title: `${totalCount} Best ${categoryName} ${capitalize(ITEMS_PATH)}`,
      description: `Discover ${totalCount} ${categoryName} ${ITEMS_PATH}${states.length > 0 ? ` across ${states.length} state${states.length === 1 ? '' : 's'}` : ''}.${sampleNames ? ` Including ${sampleNames}.` : ''}`,
      url: `${baseUrl}/category/${slug}`,
      jsonLd,
      pagination: totalPages > 1 ? {
        prev: page > 1 ? `${baseUrl}/category/${slug}?page=${page - 1}` : null,
        next: page < totalPages ? `${baseUrl}/category/${slug}?page=${page + 1}` : null
      } : null
    });

    const body = `
    ${renderNav('/categories')}

    <!-- Breadcrumbs -->
    <div class="border-b border-border">
      <div class="max-w-5xl mx-auto px-6 py-4">
        ${renderBreadcrumbs([
          { label: 'Home', href: '/' },
          { label: 'Categories', href: '/categories' },
          { label: categoryName }
        ], baseUrl)}
      </div>
    </div>

    <!-- Header -->
    <section class="bg-surface border-b border-border">
      <div class="relative z-10 max-w-5xl mx-auto px-6 py-14">
        <h1 class="font-display text-3xl md:text-5xl font-bold tracking-tight mb-3 animate-fade-in-up">${escapeHtml(categoryName)}</h1>
        <p class="text-lg text-muted animate-fade-in stagger-2"><span id="showing-count">${totalCount}</span> item${totalCount === 1 ? '' : 's'} in this category</p>
      </div>
    </section>

    <!-- Items -->
    <main class="max-w-5xl mx-auto px-6 py-14">
      ${items.length > 0 ? `

      <!-- Filter bar -->
      ${states.length > 1 ? `
      <div class="flex items-center gap-4 mb-10 reveal">
        <select id="state-filter"
                class="text-sm bg-surface border border-border rounded-xl px-4 py-2.5 focus:outline-none focus:border-primary transition-all">
          <option value="">All States (${totalCount})</option>
          ${states.map(s => `<option value="${escapeHtml(s.state)}">${escapeHtml(s.state)} (${s.count})</option>`).join('\n')}
        </select>
        <span class="text-sm text-muted" id="filter-status"></span>
      </div>
      ` : ''}

      <div id="items-grid" class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-7">
        ${items.map((item, i) => `<div class="reveal item-card" data-state="${escapeHtml(item.state || '')}" style="transition-delay: ${i * 60}ms">${renderCard(item)}</div>`).join('\n')}
      </div>
      ${renderPagination({
        currentPage: page,
        totalPages,
        baseUrl: `/category/${slug}`
      })}
      ` : renderEmptyState({
        emoji: '&#128237;',
        title: 'No items yet',
        message: 'There are no items in ' + escapeHtml(categoryName) + ' yet.',
        action: { href: '/submit', label: 'Submit Item' }
      })}
    </main>

    <!-- Client-side state filter -->
    <script>
    (function() {
      const filter = document.getElementById('state-filter');
      if (!filter) return;
      const cards = document.querySelectorAll('.item-card');
      const status = document.getElementById('filter-status');
      const countEl = document.getElementById('showing-count');
      const total = cards.length;

      filter.addEventListener('change', function() {
        const val = this.value;
        let shown = 0;
        cards.forEach(card => {
          const match = !val || card.dataset.state === val;
          card.style.display = match ? '' : 'none';
          if (match) shown++;
        });
        if (countEl) countEl.textContent = shown;
        if (status) status.textContent = val ? 'Showing ' + shown + ' of ' + total : '';
      });
    })();
    </script>

    ${renderFooter()}
    `;

    return htmlResponse(renderPage(head, body));

  } catch (error) {
    console.error('Category page error:', error);

    const head = renderHead({
      title: 'Error',
      description: 'An error occurred.',
      url: `${baseUrl}/category/${slug}`
    });

    const body = `
    ${renderNav('/categories')}
    <main class="max-w-6xl mx-auto px-6 py-12">
      ${renderEmptyState({
        emoji: '⚠️',
        title: 'Something went wrong',
        message: 'Please try again later.',
        action: { href: '/categories', label: 'View Categories' }
      })}
    </main>
    ${renderFooter()}
    `;

    return htmlResponse(renderPage(head, body), 500);
  }
}
