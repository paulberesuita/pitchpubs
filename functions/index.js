/**
 * Homepage
 * GET /
 *
 * Calm hero, features strip, full directory grid
 */

import {
  SITE_NAME, TABLE_NAME, ITEMS_PATH, CATEGORY_FIELD, HOMEPAGE_FILTER, EXPERTISE_AREAS,
  escapeHtml, slugify, renderHead, renderNav, renderFooter,
  renderCard, renderEmptyState, renderPage, htmlResponse
} from './_shared.js';

export async function onRequestGet(context) {
  const { env, request } = context;
  const url = new URL(request.url);
  const baseUrl = `${url.protocol}//${url.host}`;

  try {
    // Get all items for full directory
    // Images-first so homepage grid looks complete
    const { results: allItems } = await env.DB.prepare(
      `SELECT * FROM ${TABLE_NAME} ORDER BY featured DESC, CASE WHEN image_url IS NOT NULL AND image_url != '' THEN 0 ELSE 1 END, name ASC LIMIT 15`
    ).all();

    // Get total count
    const countResult = await env.DB.prepare(
      `SELECT COUNT(*) as count FROM ${TABLE_NAME}`
    ).first();
    const totalCount = countResult?.count || 0;

    // Get filter pills data — states or categories depending on config
    let filterPills = [];
    if (HOMEPAGE_FILTER === 'states') {
      const { results: states } = await env.DB.prepare(
        `SELECT state, COUNT(*) as count FROM ${TABLE_NAME}
         WHERE state IS NOT NULL AND state != ''
         GROUP BY state ORDER BY count DESC LIMIT 10`
      ).all();
      filterPills = states.map(s => ({
        label: s.state,
        count: s.count,
        href: `/states/${slugify(s.state)}`
      }));
    } else {
      const { results: categories } = await env.DB.prepare(
        `SELECT ${CATEGORY_FIELD} as category, COUNT(*) as count FROM ${TABLE_NAME}
         WHERE ${CATEGORY_FIELD} IS NOT NULL
         GROUP BY ${CATEGORY_FIELD} ORDER BY count DESC LIMIT 8`
      ).all();
      filterPills = categories.map(c => ({
        label: c.category,
        count: c.count,
        href: `/${ITEMS_PATH}?category=${encodeURIComponent(c.category)}`
      }));
    }

    // JSON-LD for homepage
    const jsonLd = [
      {
        "@context": "https://schema.org",
        "@type": "WebSite",
        "name": SITE_NAME,
        "url": baseUrl,
        "potentialAction": {
          "@type": "SearchAction",
          "target": `${baseUrl}/search?q={search_term_string}`,
          "query-input": "required name=search_term_string"
        }
      },
      {
        "@context": "https://schema.org",
        "@type": "Organization",
        "name": SITE_NAME,
        "url": baseUrl,
        "logo": `${baseUrl}/favicon.svg`,
        "sameAs": [],
        "knowsAbout": EXPERTISE_AREAS
      }
    ];

    const head = renderHead({
      title: `${totalCount} Work-Friendly Cafes - Find Your Next Workspace`,
      description: `${SITE_NAME} is a curated directory of ${totalCount} work-friendly cafes. Find fast WiFi, quiet corners, and great coffee.`,
      url: baseUrl,
      jsonLd
    });

    // Filter pills HTML — client-side filtering, no navigation
    const filterAttr = HOMEPAGE_FILTER === 'states' ? 'state' : 'category';
    const pillsHtml = filterPills.map(pill => `
      <button data-filter="${escapeHtml(pill.label)}"
              class="filter-pill text-sm text-muted hover:text-primary px-4 py-2 rounded-xl border border-border hover:bg-surface transition-all duration-200 cursor-pointer">
        ${escapeHtml(pill.label)}
      </button>
    `).join('\n');

    // Full directory grid — each card gets a data attribute for filtering
    const directoryGrid = allItems.length > 0
      ? allItems.map((item, i) => {
          const filterValue = HOMEPAGE_FILTER === 'states' ? (item.state || '') : (item[CATEGORY_FIELD] || '');
          return `<div class="reveal item-card" data-filter-value="${escapeHtml(filterValue)}" style="transition-delay: ${Math.min(i, 8) * 60}ms">${renderCard(item)}</div>`;
        }).join('\n')
      : renderEmptyState({
          emoji: '&#9749;',
          title: 'No cafes yet',
          message: 'Be the first to add a work-friendly cafe.',
          action: { href: '/submit', label: 'Submit a Cafe' }
        });

    const body = `
    ${renderNav('/')}

    <!-- Hero — compact and calm -->
    <section class="border-b border-border">
      <div class="max-w-5xl mx-auto px-6 py-16 md:py-20">
        <p class="text-sm font-medium text-muted uppercase tracking-[0.15em] mb-4 animate-fade-in"><span class="count-up">${totalCount}</span> curated cafes</p>
        <h1 class="font-display text-3xl md:text-4xl font-bold tracking-tight mb-4 animate-fade-in-up stagger-2">Find your next workspace</h1>
        <p class="text-muted max-w-md mb-8 animate-fade-in-up stagger-3 leading-relaxed">Work-friendly cafes with fast WiFi, good coffee, and the right vibe.</p>

        <form action="/search" method="GET" class="flex gap-3 max-w-md animate-fade-in-up stagger-4">
          <input
            type="search"
            name="q"
            placeholder="Search cafes..."
            class="flex-1 bg-surface border border-border rounded-xl px-4 py-2.5 text-sm focus:outline-none focus:border-primary transition-all placeholder:text-muted"
          >
          <button type="submit" class="bg-primary hover:bg-primary-hover text-white text-sm font-medium px-5 py-2.5 rounded-xl transition-colors">
            Search
          </button>
        </form>
      </div>
    </section>

    <!-- Features strip -->
    <section class="border-b border-border bg-surface">
      <div class="max-w-5xl mx-auto px-6 py-10">
        <div class="grid grid-cols-1 sm:grid-cols-3 gap-8 animate-fade-in stagger-3">
          <div class="flex items-start gap-4">
            <div class="w-10 h-10 rounded-xl bg-background border border-border flex items-center justify-center shrink-0">
              <svg class="w-5 h-5 text-primary" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" d="M8.111 16.404a5.5 5.5 0 017.778 0M12 20h.01m-7.08-7.071c3.904-3.905 10.236-3.905 14.14 0M1.394 9.393c5.857-5.858 15.355-5.858 21.213 0"></path>
              </svg>
            </div>
            <div>
              <p class="text-sm font-medium mb-1">Verified WiFi</p>
              <p class="text-sm text-muted leading-relaxed">Every cafe tested for speed and reliability.</p>
            </div>
          </div>

          <div class="flex items-start gap-4">
            <div class="w-10 h-10 rounded-xl bg-background border border-border flex items-center justify-center shrink-0">
              <svg class="w-5 h-5 text-primary" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" d="M19 11H5m14 0a2 2 0 012 2v6a2 2 0 01-2 2H5a2 2 0 01-2-2v-6a2 2 0 012-2m14 0V9a2 2 0 00-2-2M5 11V9a2 2 0 012-2m0 0V5a2 2 0 012-2h6a2 2 0 012 2v2M7 7h10"></path>
              </svg>
            </div>
            <div>
              <p class="text-sm font-medium mb-1">Work-Ready</p>
              <p class="text-sm text-muted leading-relaxed">Power outlets, good seating, and no side-eyes.</p>
            </div>
          </div>

          <div class="flex items-start gap-4">
            <div class="w-10 h-10 rounded-xl bg-background border border-border flex items-center justify-center shrink-0">
              <svg class="w-5 h-5 text-primary" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" d="M17.657 16.657L13.414 20.9a1.998 1.998 0 01-2.827 0l-4.244-4.243a8 8 0 1111.314 0z"></path>
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" d="M15 11a3 3 0 11-6 0 3 3 0 016 0z"></path>
              </svg>
            </div>
            <div>
              <p class="text-sm font-medium mb-1">Real Places</p>
              <p class="text-sm text-muted leading-relaxed">Every spot visited and reviewed by remote workers.</p>
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- Full Directory -->
    <section class="max-w-5xl mx-auto px-6 py-14">

      <!-- Filter pills -->
      ${filterPills.length > 0 ? `
      <div class="flex flex-wrap items-center gap-2.5 mb-10 reveal" id="filter-bar">
        <button data-filter="" class="filter-pill text-sm bg-primary text-white px-4 py-2 rounded-xl font-medium cursor-pointer active">All</button>
        ${pillsHtml}
      </div>
      ` : ''}

      <!-- Grid -->
      <div id="directory-grid" class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-7">
        ${directoryGrid}
      </div>

      <!-- View all link -->
      ${totalCount > 15 ? `
      <div class="text-center mt-12">
        <a href="/${ITEMS_PATH}" class="text-sm text-muted hover:text-primary transition-colors">View all ${totalCount} cafes &rarr;</a>
      </div>
      ` : ''}

      <!-- Client-side filter -->
      <script>
      (function() {
        const pills = document.querySelectorAll('.filter-pill');
        const cards = document.querySelectorAll('.item-card');
        if (!pills.length || !cards.length) return;

        pills.forEach(pill => {
          pill.addEventListener('click', function() {
            const val = this.dataset.filter;

            // Update active pill styling
            pills.forEach(p => {
              p.classList.remove('bg-primary', 'text-white', 'font-medium', 'active');
              p.classList.add('text-muted', 'border', 'border-border');
            });
            this.classList.add('bg-primary', 'text-white', 'font-medium', 'active');
            this.classList.remove('text-muted', 'border', 'border-border');

            // Filter cards
            cards.forEach(card => {
              const match = !val || card.dataset.filterValue === val;
              card.style.display = match ? '' : 'none';
            });
          });
        });
      })();
      </script>
    </section>

    ${renderFooter()}
    `;

    return htmlResponse(renderPage(head, body));

  } catch (error) {
    console.error('Homepage error:', error);

    const head = renderHead({
      title: SITE_NAME,
      description: 'Find work-friendly cafes with great WiFi and good coffee.',
      url: baseUrl
    });

    const body = `
    ${renderNav('/')}

    <section class="max-w-6xl mx-auto px-6 py-20">
      ${renderEmptyState({
        emoji: '&#9749;',
        title: 'Getting Started',
        message: 'Run the bootstrap process to set up your database and add cafes.',
        action: { href: '/submit', label: 'Submit a Cafe' }
      })}
    </section>

    ${renderFooter()}
    `;

    return htmlResponse(renderPage(head, body));
  }
}
