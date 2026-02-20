/**
 * Categories Index Page
 * GET /categories
 */

import {
  SITE_NAME, TABLE_NAME, CATEGORY_FIELD,
  escapeHtml, renderHead, renderNav, renderFooter, renderBreadcrumbs,
  renderEmptyState, renderPage, htmlResponse
} from './_shared.js';

export async function onRequestGet(context) {
  const { env, request } = context;
  const url = new URL(request.url);
  const baseUrl = `${url.protocol}//${url.host}`;

  try {
    // Get categories with counts
    const { results: categories } = await env.DB.prepare(
      `SELECT ${CATEGORY_FIELD} as category, COUNT(*) as count
       FROM ${TABLE_NAME}
       WHERE ${CATEGORY_FIELD} IS NOT NULL AND ${CATEGORY_FIELD} != ''
       GROUP BY ${CATEGORY_FIELD}
       ORDER BY count DESC, ${CATEGORY_FIELD} ASC`
    ).all();

    // JSON-LD for categories
    const jsonLd = {
      "@context": "https://schema.org",
      "@type": "CollectionPage",
      "name": `Categories | ${SITE_NAME}`,
      "url": `${baseUrl}/categories`,
      "numberOfItems": categories.length
    };

    const sampleCats = categories.slice(0, 3).map(c => c.category).join(', ');
    const head = renderHead({
      title: `${categories.length} Categories`,
      description: `Browse ${categories.length} categories in ${SITE_NAME}.${sampleCats ? ` Including ${sampleCats}.` : ''}`,
      url: `${baseUrl}/categories`,
      jsonLd
    });

    const categoriesHtml = categories.length > 0
      ? categories.map((cat, i) => {
          const slug = cat.category.toLowerCase().replace(/\s+/g, '-');
          return `
          <a href="/category/${escapeHtml(slug)}" class="group block bg-surface rounded-2xl border border-border card-hover p-7 reveal" style="transition-delay: ${i * 80}ms">
            <div class="flex items-center justify-between">
              <div>
                <h2 class="font-display text-lg font-bold group-hover:text-primary transition-colors duration-200">${escapeHtml(cat.category)}</h2>
                <p class="text-sm text-muted mt-1.5">${cat.count} item${cat.count === 1 ? '' : 's'}</p>
              </div>
              <svg class="w-5 h-5 text-muted group-hover:text-primary transition-colors duration-200" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5l7 7-7 7"></path>
              </svg>
            </div>
          </a>
          `;
        }).join('\n')
      : '';

    const body = `
    ${renderNav('/categories')}

    <!-- Breadcrumbs -->
    <div class="border-b border-border">
      <div class="max-w-5xl mx-auto px-6 py-4">
        ${renderBreadcrumbs([
          { label: 'Home', href: '/' },
          { label: 'Categories' }
        ], baseUrl)}
      </div>
    </div>

    <!-- Content -->
    <main class="max-w-5xl mx-auto px-6 py-14">
      <h1 class="font-display text-3xl md:text-5xl font-bold tracking-tight mb-10 animate-fade-in-up">Categories</h1>

      ${categories.length > 0 ? `
      <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-5">
        ${categoriesHtml}
      </div>
      ` : renderEmptyState({
        emoji: '&#128194;',
        title: 'No categories yet',
        message: 'Categories will appear here once items are added.',
        action: { href: '/submit', label: 'Submit Item' }
      })}
    </main>

    ${renderFooter()}
    `;

    return htmlResponse(renderPage(head, body));

  } catch (error) {
    console.error('Categories error:', error);

    const head = renderHead({
      title: 'Categories',
      description: `Browse categories in ${SITE_NAME}.`,
      url: `${baseUrl}/categories`
    });

    const body = `
    ${renderNav('/categories')}

    <main class="max-w-6xl mx-auto px-6 py-12">
      ${renderEmptyState({
        emoji: '📂',
        title: 'No categories yet',
        message: 'Add items to create categories.',
        action: { href: '/submit', label: 'Submit Item' }
      })}
    </main>

    ${renderFooter()}
    `;

    return htmlResponse(renderPage(head, body));
  }
}
