/**
 * Search Results Page
 * GET /search?q=query
 */

import {
  SITE_NAME, TABLE_NAME, ITEMS_PATH,
  escapeHtml, renderHead, renderNav, renderFooter, renderBreadcrumbs,
  renderCard, renderEmptyState, renderPagination,
  renderPage, htmlResponse
} from './_shared.js';

const ITEMS_PER_PAGE = 24;

export async function onRequestGet(context) {
  const { env, request } = context;
  const url = new URL(request.url);
  const baseUrl = `${url.protocol}//${url.host}`;

  const query = url.searchParams.get('q')?.trim() || '';
  const page = Math.max(1, parseInt(url.searchParams.get('page')) || 1);
  const offset = (page - 1) * ITEMS_PER_PAGE;

  // If no query, show search box
  if (!query) {
    const head = renderHead({
      title: 'Search',
      description: `Search ${SITE_NAME} to find what you're looking for.`,
      url: `${baseUrl}/search`
    });

    const body = `
    ${renderNav('/search')}

    <main class="max-w-4xl mx-auto px-6 py-20">
      <h1 class="font-display text-3xl md:text-5xl font-bold tracking-tight mb-10 text-center animate-fade-in-up">Search</h1>

      <form action="/search" method="GET" class="flex flex-col sm:flex-row gap-3 max-w-xl mx-auto animate-fade-in-up stagger-2">
        <input
          type="search"
          name="q"
          placeholder="What are you looking for?"
          autofocus
          class="flex-1 bg-surface border border-border rounded-xl px-5 py-3 focus:outline-none transition-all"
        >
        <button type="submit" class="bg-primary hover:bg-primary-hover text-white font-medium px-7 py-3 rounded-xl transition-all duration-200">
          Search
        </button>
      </form>
    </main>

    ${renderFooter()}
    `;

    return htmlResponse(renderPage(head, body));
  }

  try {
    // Search items
    const searchPattern = `%${query}%`;

    const { results: items } = await env.DB.prepare(
      `SELECT * FROM ${TABLE_NAME}
       WHERE name LIKE ? OR description LIKE ? OR content LIKE ?
       ORDER BY
         CASE WHEN name LIKE ? THEN 0 ELSE 1 END,
         name
       LIMIT ? OFFSET ?`
    ).bind(searchPattern, searchPattern, searchPattern, searchPattern, ITEMS_PER_PAGE, offset).all();

    // Get total count for pagination
    const countResult = await env.DB.prepare(
      `SELECT COUNT(*) as count FROM ${TABLE_NAME}
       WHERE name LIKE ? OR description LIKE ? OR content LIKE ?`
    ).bind(searchPattern, searchPattern, searchPattern).first();

    const totalCount = countResult?.count || 0;
    const totalPages = Math.ceil(totalCount / ITEMS_PER_PAGE);

    // JSON-LD for search results
    const jsonLd = {
      "@context": "https://schema.org",
      "@type": "SearchResultsPage",
      "name": `Search results for "${query}"`,
      "url": `${baseUrl}/search?q=${encodeURIComponent(query)}`
    };

    const head = renderHead({
      title: `Search: ${query}`,
      description: `${totalCount} results found for "${query}" in ${SITE_NAME}.`,
      url: `${baseUrl}/search?q=${encodeURIComponent(query)}`,
      jsonLd,
      noindex: true
    });

    const resultsHtml = items.length > 0
      ? `
        <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-6">
          ${items.map(item => renderCard(item)).join('\n')}
        </div>
        ${renderPagination({
          currentPage: page,
          totalPages,
          baseUrl: `/search?q=${encodeURIComponent(query)}`
        })}
      `
      : renderEmptyState({
          emoji: '🔍',
          title: 'No results found',
          message: `We couldn't find anything matching "${escapeHtml(query)}". Try different keywords.`,
          action: { href: '/', label: 'Browse All' }
        });

    const body = `
    ${renderNav('/search')}

    <!-- Breadcrumbs -->
    <div class="border-b border-border">
      <div class="max-w-5xl mx-auto px-6 py-4">
        ${renderBreadcrumbs([
          { label: 'Home', href: '/' },
          { label: 'Search' }
        ], baseUrl)}
      </div>
    </div>

    <!-- Search Header -->
    <section class="bg-surface border-b border-border">
      <div class="relative z-10 max-w-5xl mx-auto px-6 py-8">
        <form action="/search" method="GET" class="flex flex-col sm:flex-row gap-3 max-w-xl">
          <input
            type="search"
            name="q"
            value="${escapeHtml(query)}"
            placeholder="Search..."
            class="flex-1 bg-white border border-border rounded-xl px-5 py-3 focus:outline-none transition-all"
          >
          <button type="submit" class="bg-primary hover:bg-primary-hover text-white font-medium px-7 py-3 rounded-xl transition-all duration-200">
            Search
          </button>
        </form>
      </div>
    </section>

    <!-- Results -->
    <main class="max-w-5xl mx-auto px-6 py-14">
      <div class="flex items-center justify-between mb-10">
        <h1 class="font-display text-2xl font-bold tracking-tight">
          ${totalCount > 0 ? `${totalCount} result${totalCount === 1 ? '' : 's'} for "${escapeHtml(query)}"` : 'No results'}
        </h1>
      </div>

      ${resultsHtml}
    </main>

    ${renderFooter()}
    `;

    return htmlResponse(renderPage(head, body));

  } catch (error) {
    console.error('Search error:', error);

    const head = renderHead({
      title: 'Search',
      description: `Search ${SITE_NAME}.`,
      url: `${baseUrl}/search`
    });

    const body = `
    ${renderNav('/search')}

    <main class="max-w-4xl mx-auto px-6 py-12">
      ${renderEmptyState({
        emoji: '⚠️',
        title: 'Search unavailable',
        message: 'Please try again later.',
        action: { href: '/', label: 'Go Home' }
      })}
    </main>

    ${renderFooter()}
    `;

    return htmlResponse(renderPage(head, body));
  }
}
