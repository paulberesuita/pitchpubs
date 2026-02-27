/**
 * Homepage
 * GET /
 *
 * Lean hero, scrollable filter pills, 4-column grid with "Load More" button
 */

import {
  SITE_NAME, TABLE_NAME, ITEMS_PATH, EXPERTISE_AREAS, PROD_BASE, HOMEPAGE_FAQ,
  escapeHtml, stateFullName, renderHead, renderNav, renderFooter,
  renderCard, renderEmptyState, renderPage, htmlResponse
} from './_shared.js';

const ITEMS_PER_PAGE = 24;

export async function onRequestGet(context) {
  const { env, request } = context;
  const url = new URL(request.url);
  const baseUrl = `${url.protocol}//${url.host}`;

  const activePill = url.searchParams.get('view') || '';

  // Special pills (sort/filter based)
  const SPECIAL_PILLS = ['featured', 'latest'];
  const isSpecialPill = SPECIAL_PILLS.includes(activePill);
  const isStatePill = activePill && !isSpecialPill;

  try {
    // Build WHERE/ORDER based on active pill
    let whereClause = '';
    const bindings = [];
    let orderBy;

    if (activePill === 'featured') {
      whereClause = 'WHERE featured = 1';
      orderBy = `CASE WHEN image_url IS NOT NULL AND image_url != '' THEN 0 ELSE 1 END, name ASC`;
    } else if (activePill === 'latest') {
      orderBy = 'created_at DESC';
    } else if (isStatePill) {
      whereClause = 'WHERE state = ?';
      bindings.push(activePill);
      orderBy = `featured DESC, CASE WHEN image_url IS NOT NULL AND image_url != '' THEN 0 ELSE 1 END, name ASC`;
    } else {
      orderBy = `featured DESC, CASE WHEN image_url IS NOT NULL AND image_url != '' THEN 0 ELSE 1 END, name ASC`;
    }

    // Get paginated items
    const { results: items } = await env.DB.prepare(
      `SELECT * FROM ${TABLE_NAME} ${whereClause} ORDER BY ${orderBy} LIMIT ?`
    ).bind(...bindings, ITEMS_PER_PAGE).all();

    // Get total count (filtered)
    const countResult = await env.DB.prepare(
      `SELECT COUNT(*) as count FROM ${TABLE_NAME} ${whereClause}`
    ).bind(...bindings).first();
    const totalCount = countResult?.count || 0;

    // Get overall count (unfiltered) for hero
    const overallCount = activePill
      ? (await env.DB.prepare(`SELECT COUNT(*) as count FROM ${TABLE_NAME}`).first())?.count || 0
      : totalCount;

    // Featured count
    const featuredCount = (await env.DB.prepare(
      `SELECT COUNT(*) as count FROM ${TABLE_NAME} WHERE featured = 1`
    ).first())?.count || 0;

    // Get states for filter pills
    const { results: states } = await env.DB.prepare(
      `SELECT state, COUNT(*) as count FROM ${TABLE_NAME}
       WHERE state IS NOT NULL AND state != ''
       GROUP BY state ORDER BY count DESC LIMIT 12`
    ).all();

    // JSON-LD
    const jsonLd = [
      {
        "@context": "https://schema.org",
        "@type": "WebSite",
        "name": SITE_NAME,
        "url": PROD_BASE,
        "potentialAction": {
          "@type": "SearchAction",
          "target": `${PROD_BASE}/search?q={search_term_string}`,
          "query-input": "required name=search_term_string"
        }
      },
      {
        "@context": "https://schema.org",
        "@type": "Organization",
        "name": SITE_NAME,
        "url": PROD_BASE,
        "logo": `${PROD_BASE}/favicon.svg`,
        "sameAs": [],
        "knowsAbout": EXPERTISE_AREAS
      },
      ...(HOMEPAGE_FAQ?.length ? [{
        "@context": "https://schema.org",
        "@type": "FAQPage",
        "mainEntity": HOMEPAGE_FAQ.map(item => ({
          "@type": "Question",
          "name": item.question,
          "acceptedAnswer": {
            "@type": "Answer",
            "text": item.answer
          }
        }))
      }] : [])
    ];

    const filterLabel = isStatePill ? stateFullName(activePill) : (activePill === 'featured' ? 'Featured' : (activePill === 'latest' ? 'Latest' : ''));
    const head = renderHead({
      title: filterLabel
        ? `${filterLabel} Soccer Bars - ${SITE_NAME}`
        : `${overallCount} Soccer Bars in America - Find Where to Watch`,
      description: `${SITE_NAME} is a curated directory of ${overallCount} soccer-friendly bars across America. Find the best spots to watch Premier League, MLS, Champions League, and World Cup 2026 matches.`,
      url: baseUrl,
      jsonLd
    });

    // Build all pills: All + special (Featured, Latest) + state pills
    const pillClass = (isActive) => `filter-pill text-sm px-5 py-2 rounded-full transition-all whitespace-nowrap shrink-0 cursor-pointer ${isActive
      ? 'bg-accent text-white font-medium'
      : 'bg-stone-100 text-stone-600 hover:bg-stone-200 hover:text-primary'}`;

    const specialPillsHtml = [
      featuredCount > 0 ? `<button data-pill="featured" class="${pillClass(activePill === 'featured')}">Featured (${featuredCount})</button>` : '',
      `<button data-pill="latest" class="${pillClass(activePill === 'latest')}">Latest</button>`
    ].filter(Boolean).join('\n');

    const statePillsHtml = states.map(s =>
      `<button data-pill="${escapeHtml(s.state)}" class="${pillClass(activePill === s.state)}">${escapeHtml(stateFullName(s.state))}</button>`
    ).join('\n');

    // Directory grid
    const directoryGrid = items.length > 0
      ? items.map((item, i) =>
          `<div class="reveal item-card" style="transition-delay: ${Math.min(i, 8) * 60}ms">${renderCard(item)}</div>`
        ).join('\n')
      : renderEmptyState({
          emoji: '&#9917;',
          title: 'No bars found',
          message: filterLabel ? `No bars in ${filterLabel} yet.` : 'Be the first to add a soccer bar.',
          action: { href: '/submit', label: 'Submit a Bar' }
        });

    // Escape filter value for JS string injection
    const safeActivePill = activePill.replace(/'/g, "\\'");

    const body = `
    ${renderNav('/')}

    <!-- Hero -->
    <section>
      <div class="max-w-7xl mx-auto px-6 pt-12 pb-10 md:pt-16 md:pb-12 text-center">
        <p class="text-sm font-medium text-muted uppercase tracking-[0.15em] mb-4 animate-fade-in"><span class="count-up">${overallCount}</span> soccer bars across America</p>
        <h1 class="font-display text-3xl md:text-4xl font-bold tracking-tight mb-4 animate-fade-in-up stagger-2">Find where to watch the beautiful game</h1>
        <p class="text-muted max-w-md mx-auto animate-fade-in-up stagger-3 leading-relaxed">Soccer-friendly bars with early opens, big screens, and fans who actually care.</p>
      </div>
    </section>

    <!-- Directory -->
    <section class="max-w-7xl mx-auto px-6 py-8">

      <!-- Filter pills -->
      <div class="flex items-center gap-2 overflow-x-auto mb-8 scrollbar-hide">
        <button data-pill="" class="${pillClass(!activePill)}">All (${overallCount})</button>
        ${specialPillsHtml}
        ${statePillsHtml}
      </div>

      <!-- Grid -->
      <div id="directory-grid" class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-7">
        ${directoryGrid}
      </div>

      <!-- Load More -->
      <div id="load-more" class="flex justify-center py-12 ${totalCount <= ITEMS_PER_PAGE ? 'hidden' : ''}">
        <button id="load-more-btn" class="px-8 py-3 text-sm font-medium text-muted border border-border rounded-full hover:text-primary hover:border-primary/30 transition-all cursor-pointer">Load more</button>
      </div>

      <style>.scrollbar-hide::-webkit-scrollbar{display:none}</style>

      <!-- Scripts -->
      <script>
      (function() {
        var grid = document.getElementById('directory-grid');
        var loadMoreWrap = document.getElementById('load-more');
        var loadBtn = document.getElementById('load-more-btn');
        var LIMIT = ${ITEMS_PER_PAGE};

        var activePill = '${safeActivePill}';
        var offset = LIMIT;
        var loading = false;
        var done = ${totalCount} <= LIMIT;

        function escHtml(s) { var d = document.createElement('div'); d.textContent = s; return d.innerHTML; }

        function renderCard(item) {
          var imgSrc = item.image_url ? (item.image_url.startsWith('/') ? item.image_url : '/images/' + item.image_url) : '';
          var imgHtml = item.image_url
            ? '<img src="' + escHtml(imgSrc) + '" alt="' + escHtml(item.name) + '" width="400" height="300" class="w-full h-full object-cover group-hover:scale-105 transition-transform duration-500 ease-out" loading="lazy" onerror="this.style.display=\\'none\\';this.nextElementSibling.style.display=\\'flex\\'"><div class="w-full h-full bg-surface items-center justify-center" style="display:none"><span class="text-4xl opacity-20">&#128230;</span></div>'
            : '<div class="w-full h-full bg-surface flex items-center justify-center"><span class="text-4xl opacity-20">&#128230;</span></div>';
          var loc = [item.city, item.state].filter(Boolean).join(', ');
          return '<a href="/${ITEMS_PATH}/' + escHtml(item.slug) + '" class="group block bg-white rounded-2xl overflow-hidden border border-border card-hover">'
            + '<div class="aspect-[4/3] overflow-hidden">' + imgHtml + '</div>'
            + '<div class="p-5">'
            + '<h3 class="font-display font-semibold group-hover:text-muted transition-colors">' + escHtml(item.name) + '</h3>'
            + (item.description ? '<p class="text-sm text-muted mt-1.5 line-clamp-2 leading-relaxed">' + escHtml(item.description) + '</p>' : '')
            + (loc ? '<p class="text-xs text-muted mt-1">' + escHtml(loc) + '</p>' : '')
            + '</div></a>';
        }

        function buildApiUrl(extra) {
          var params = new URLSearchParams();
          if (activePill === 'featured') params.set('featured', '1');
          else if (activePill === 'latest') params.set('sort', 'latest');
          else if (activePill) params.set('state', activePill);
          params.set('limit', LIMIT);
          if (extra) { for (var k in extra) params.set(k, extra[k]); }
          return '/api/items?' + params.toString();
        }

        function refreshGrid() {
          offset = 0;
          done = false;
          grid.style.opacity = '0.5';
          grid.style.transition = 'opacity 0.15s';
          fetch(buildApiUrl({ offset: 0 }))
            .then(function(r) { return r.json(); })
            .then(function(json) {
              var items = json.data || [];
              grid.innerHTML = items.map(function(item) {
                return '<div class="item-card">' + renderCard(item) + '</div>';
              }).join('');
              grid.style.opacity = '1';
              offset = items.length;
              done = !json.meta.hasMore;
              if (done) loadMoreWrap.classList.add('hidden');
              else loadMoreWrap.classList.remove('hidden');
              if (loadBtn) loadBtn.textContent = 'Load more';
              var u = new URL(window.location);
              u.search = '';
              if (activePill) u.searchParams.set('view', activePill);
              history.pushState(null, '', u.toString());
            })
            .catch(function() { grid.style.opacity = '1'; });
        }

        function loadMore() {
          if (loading || done) return;
          loading = true;
          if (loadBtn) loadBtn.textContent = 'Loading...';
          fetch(buildApiUrl({ offset: offset }))
            .then(function(r) { return r.json(); })
            .then(function(json) {
              var items = json.data || [];
              items.forEach(function(item) {
                var div = document.createElement('div');
                div.className = 'item-card';
                div.innerHTML = renderCard(item);
                grid.appendChild(div);
              });
              offset += items.length;
              done = !json.meta.hasMore;
              if (done) loadMoreWrap.classList.add('hidden');
              else if (loadBtn) loadBtn.textContent = 'Load more';
              loading = false;
            })
            .catch(function() { loading = false; if (loadBtn) loadBtn.textContent = 'Load more'; });
        }
        if (loadBtn) loadBtn.addEventListener('click', loadMore);

        function updatePillStyles() {
          document.querySelectorAll('.filter-pill').forEach(function(pill) {
            var val = pill.dataset.pill;
            var isActive = val === activePill;
            pill.className = 'filter-pill text-sm px-5 py-2 rounded-full transition-all whitespace-nowrap shrink-0 cursor-pointer '
              + (isActive ? 'bg-accent text-white font-medium' : 'bg-stone-100 text-stone-600 hover:bg-stone-200 hover:text-primary');
          });
        }
        document.querySelectorAll('.filter-pill').forEach(function(pill) {
          pill.addEventListener('click', function() {
            var val = this.dataset.pill;
            activePill = (activePill === val) ? '' : val;
            updatePillStyles();
            refreshGrid();
          });
        });
      })();
      </script>
    </section>

    ${HOMEPAGE_FAQ?.length ? `
    <!-- FAQ -->
    <section class="max-w-3xl mx-auto px-6 py-16">
      <h2 class="font-display text-2xl font-bold tracking-tight mb-8 text-center">Frequently Asked Questions</h2>
      <div class="space-y-3">
        ${HOMEPAGE_FAQ.map(item => `
        <details class="group bg-surface rounded-xl border border-border overflow-hidden">
          <summary class="flex items-center justify-between p-5 cursor-pointer hover:bg-surface-hover transition-colors">
            <h3 class="font-semibold pr-4">${escapeHtml(item.question)}</h3>
            <svg class="w-5 h-5 text-muted shrink-0 transition-transform group-open:rotate-180" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7"></path>
            </svg>
          </summary>
          <div class="px-5 pb-5 text-muted leading-relaxed">
            ${escapeHtml(item.answer)}
          </div>
        </details>
        `).join('\n')}
      </div>
    </section>
    ` : ''}

    ${renderFooter()}
    `;

    return htmlResponse(renderPage(head, body));

  } catch (error) {
    console.error('Homepage error:', error);

    const head = renderHead({
      title: SITE_NAME,
      description: 'Find the best soccer bars in America. Curated for fans who want the real match-day experience.',
      url: baseUrl
    });

    const body = `
    ${renderNav('/')}

    <section class="max-w-6xl mx-auto px-6 py-20">
      ${renderEmptyState({
        emoji: '&#9917;',
        title: 'Getting Started',
        message: 'Run the bootstrap process to set up your database and add bars.',
        action: { href: '/submit', label: 'Submit a Bar' }
      })}
    </section>

    ${renderFooter()}
    `;

    return htmlResponse(renderPage(head, body));
  }
}
