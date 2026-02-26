/**
 * Homepage
 * GET /
 *
 * Lean hero, league pills, featured cities, full directory with search + filters
 */

import {
  SITE_NAME, TABLE_NAME, ITEMS_PATH, EXPERTISE_AREAS, PROD_BASE, HOMEPAGE_FAQ,
  escapeHtml, slugify, stateFullName, renderHead, renderNav, renderFooter,
  renderCard, renderEmptyState, renderPage, htmlResponse
} from './_shared.js';

const ITEMS_PER_PAGE = 24;

export async function onRequestGet(context) {
  const { env, request } = context;
  const url = new URL(request.url);
  const baseUrl = `${url.protocol}//${url.host}`;

  const state = url.searchParams.get('state') || '';
  const city = url.searchParams.get('city') || '';
  const sort = url.searchParams.get('sort') || '';

  try {
    // Build directory query with optional state/city filter
    let whereClause = '';
    const bindings = [];
    if (city) {
      whereClause = 'WHERE city = ?';
      bindings.push(city);
    } else if (state) {
      whereClause = 'WHERE state = ?';
      bindings.push(state);
    }

    // Sort options
    const sortOptions = {
      'latest': 'created_at DESC',
      'az': 'name ASC',
      'za': 'name DESC',
      '': 'featured DESC, CASE WHEN image_url IS NOT NULL AND image_url != \'\' THEN 0 ELSE 1 END, name ASC'
    };
    const orderBy = sortOptions[sort] || sortOptions[''];

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
    const overallCount = (state || city)
      ? (await env.DB.prepare(`SELECT COUNT(*) as count FROM ${TABLE_NAME}`).first())?.count || 0
      : totalCount;

    // Get all cities for dropdown
    const { results: cities } = await env.DB.prepare(
      `SELECT city, state, city_slug, COUNT(*) as count FROM ${TABLE_NAME}
       GROUP BY city, state ORDER BY city ASC`
    ).all();

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

    const head = renderHead({
      title: city
        ? `Soccer Bars in ${city} - ${SITE_NAME}`
        : state
          ? `Soccer Bars in ${state} - ${SITE_NAME}`
          : `${overallCount} Soccer Bars in America - Find Where to Watch`,
      description: `${SITE_NAME} is a curated directory of ${overallCount} soccer-friendly bars across ${cities.length} US cities. Find the best spots to watch Premier League, MLS, Champions League, and World Cup 2026 matches.`,
      url: baseUrl,
      jsonLd
    });

    // State filter pills
    const statePillsHtml = states.map(s => {
      const isActive = state === s.state;
      const fullName = stateFullName(s.state);
      return `<a href="/?state=${encodeURIComponent(s.state)}"
                 class="text-sm px-4 py-1.5 rounded-full border transition-all whitespace-nowrap shrink-0 ${isActive
                   ? 'bg-accent text-white border-accent font-medium'
                   : 'text-muted border-border hover:text-primary hover:bg-surface'}">${escapeHtml(fullName)}</a>`;
    }).join('\n');

    // Directory grid
    const directoryGrid = items.length > 0
      ? items.map((item, i) =>
          `<div class="reveal bar-card" style="transition-delay: ${Math.min(i, 8) * 60}ms">${renderCard(item)}</div>`
        ).join('\n')
      : renderEmptyState({
          emoji: '&#9917;',
          title: 'No bars found',
          message: city ? `No bars in ${city} yet.` : state ? `No bars in ${state} yet.` : 'Be the first to add a soccer bar.',
          action: { href: '/submit', label: 'Submit a Bar' }
        });

    const body = `
    ${renderNav('/')}

    <!-- Hero -->
    <section>
      <div class="max-w-7xl mx-auto px-6 py-10 md:py-14 text-center">
        <p class="text-sm font-medium text-muted uppercase tracking-[0.15em] mb-4 animate-fade-in"><span class="count-up">${overallCount}</span> soccer bars across America</p>
        <h1 class="font-display text-3xl md:text-4xl font-bold tracking-tight mb-4 animate-fade-in-up stagger-2">Find where to watch the beautiful game</h1>
        <p class="text-muted max-w-md mx-auto animate-fade-in-up stagger-3 leading-relaxed">Soccer-friendly bars with early opens, big screens, and fans who actually care.</p>
      </div>
    </section>

    <!-- Directory -->
    <section class="max-w-7xl mx-auto px-6 py-8">

      <!-- Filters -->
      <div class="flex items-center gap-3 mb-8">
        <!-- Scrollable pills -->
        <div id="pills-scroll" class="relative flex items-center gap-2 overflow-x-auto scrollbar-hide min-w-0" style="-webkit-overflow-scrolling:touch;scrollbar-width:none;mask-image:linear-gradient(to right,black 85%,transparent 100%);-webkit-mask-image:linear-gradient(to right,black 85%,transparent 100%)">
          <a href="/"
             class="text-sm px-4 py-1.5 rounded-full border transition-all shrink-0 ${!state
               ? 'bg-accent text-white border-accent font-medium'
               : 'text-muted border-border hover:text-primary hover:bg-surface'}">All</a>
          ${statePillsHtml}
        </div>

        <!-- Pinned: dropdowns + count -->
        <div class="flex items-center gap-2 shrink-0">
          <div class="relative" data-dropdown="city">
            <button class="flex items-center gap-1.5 bg-white border border-border rounded-full pl-5 pr-3.5 py-2 text-sm ${city ? 'text-primary font-medium' : 'text-muted'} hover:text-primary hover:border-primary/30 transition-all cursor-pointer">
              <span>${city ? escapeHtml(city) : 'All Cities'}</span>
              <svg class="w-3.5 h-3.5 opacity-50" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7"></path>
              </svg>
            </button>
            <div class="hidden absolute right-0 top-full mt-1.5 bg-white border border-border rounded-xl shadow-lg shadow-black/5 py-1.5 z-50 max-h-64 overflow-y-auto min-w-[200px]" data-panel>
              <div data-value="" class="dropdown-option px-4 py-2 text-sm cursor-pointer transition-colors ${!city ? 'text-primary font-medium bg-surface' : 'text-muted hover:text-primary hover:bg-surface/50'}">All Cities</div>
              ${cities.map(c =>
                `<div data-value="${escapeHtml(c.city)}" class="dropdown-option px-4 py-2 text-sm cursor-pointer transition-colors ${city === c.city ? 'text-primary font-medium bg-surface' : 'text-stone-700 hover:text-primary hover:bg-surface/50'}">${escapeHtml(c.city)} <span class="text-muted text-xs">${c.count}</span></div>`
              ).join('\n')}
            </div>
          </div>
          <div class="relative" data-dropdown="sort">
            <button class="flex items-center gap-1.5 bg-white border border-border rounded-full pl-5 pr-3.5 py-2 text-sm ${sort ? 'text-primary font-medium' : 'text-muted'} hover:text-primary hover:border-primary/30 transition-all cursor-pointer">
              <span>${sort === 'latest' ? 'Latest' : sort === 'az' ? 'A to Z' : sort === 'za' ? 'Z to A' : 'Order by'}</span>
              <svg class="w-3.5 h-3.5 opacity-50" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7"></path>
              </svg>
            </button>
            <div class="hidden absolute right-0 top-full mt-1.5 bg-white border border-border rounded-xl shadow-lg shadow-black/5 py-1.5 z-50 min-w-[160px]" data-panel>
              <div data-value="" class="dropdown-option px-4 py-2 text-sm cursor-pointer transition-colors ${!sort ? 'text-primary font-medium bg-surface' : 'text-stone-700 hover:text-primary hover:bg-surface/50'}">Default</div>
              <div data-value="latest" class="dropdown-option px-4 py-2 text-sm cursor-pointer transition-colors ${sort === 'latest' ? 'text-primary font-medium bg-surface' : 'text-stone-700 hover:text-primary hover:bg-surface/50'}">Latest</div>
              <div data-value="az" class="dropdown-option px-4 py-2 text-sm cursor-pointer transition-colors ${sort === 'az' ? 'text-primary font-medium bg-surface' : 'text-stone-700 hover:text-primary hover:bg-surface/50'}">Name (A to Z)</div>
              <div data-value="za" class="dropdown-option px-4 py-2 text-sm cursor-pointer transition-colors ${sort === 'za' ? 'text-primary font-medium bg-surface' : 'text-stone-700 hover:text-primary hover:bg-surface/50'}">Name (Z to A)</div>
            </div>
          </div>
          <span class="text-sm text-muted shrink-0">${totalCount} bars</span>
        </div>
      </div>

      <!-- Grid -->
      <div id="directory-grid" class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-7">
        ${directoryGrid}
      </div>

      <!-- Loading spinner -->
      <div id="load-more" class="flex justify-center py-12 ${totalCount <= ITEMS_PER_PAGE ? 'hidden' : ''}">
        <div class="w-6 h-6 border-2 border-border border-t-accent rounded-full animate-spin"></div>
      </div>

      <!-- Scripts -->
      <script>
      (function() {
        // Pills scroll fade
        var pills = document.getElementById('pills-scroll');
        if (pills) {
          pills.addEventListener('scroll', function() {
            var atEnd = pills.scrollLeft + pills.clientWidth >= pills.scrollWidth - 5;
            pills.style.maskImage = atEnd ? 'none' : 'linear-gradient(to right,black 85%,transparent 100%)';
            pills.style.webkitMaskImage = atEnd ? 'none' : 'linear-gradient(to right,black 85%,transparent 100%)';
          });
        }

        // Custom dropdowns
        function applyFilter(key, val) {
          var u = new URL(window.location);
          if (val) { u.searchParams.set(key, val); } else { u.searchParams.delete(key); }
          u.searchParams.delete('page');
          window.location = u.toString();
        }
        document.querySelectorAll('[data-dropdown]').forEach(function(dd) {
          var btn = dd.querySelector('button');
          var panel = dd.querySelector('[data-panel]');
          var key = dd.dataset.dropdown === 'city' ? 'city' : 'sort';
          btn.addEventListener('click', function(e) {
            e.stopPropagation();
            var wasOpen = !panel.classList.contains('hidden');
            document.querySelectorAll('[data-panel]').forEach(function(p) { p.classList.add('hidden'); });
            if (!wasOpen) panel.classList.remove('hidden');
          });
          panel.querySelectorAll('.dropdown-option').forEach(function(opt) {
            opt.addEventListener('click', function() { applyFilter(key, this.dataset.value); });
          });
        });
        document.addEventListener('click', function() {
          document.querySelectorAll('[data-panel]').forEach(function(p) { p.classList.add('hidden'); });
        });

        // Infinite scroll
        var grid = document.getElementById('directory-grid');
        var spinner = document.getElementById('load-more');
        var offset = ${ITEMS_PER_PAGE};
        var total = ${totalCount};
        var loading = false;
        var done = offset >= total;

        function buildUrl() {
          var params = new URLSearchParams();
          var state = '${state}';
          var city = '${city}';
          var sort = '${sort}';
          if (city) params.set('city', city);
          else if (state) params.set('state', state);
          if (sort) params.set('sort', sort);
          params.set('limit', '${ITEMS_PER_PAGE}');
          params.set('offset', offset);
          return '/api/items?' + params.toString();
        }

        function escHtml(s) { var d = document.createElement('div'); d.textContent = s; return d.innerHTML; }

        function renderCard(item) {
          var imgSrc = item.image_url ? (item.image_url.startsWith('/') ? item.image_url : '/images/' + item.image_url) : '';
          var imgHtml = item.image_url
            ? '<img src="' + escHtml(imgSrc) + '" alt="' + escHtml(item.name) + '" width="400" height="300" class="w-full h-full object-cover group-hover:scale-105 transition-transform duration-500 ease-out" loading="lazy" onerror="this.style.display=\\'none\\';this.nextElementSibling.style.display=\\'flex\\'"><div class="w-full h-full bg-surface items-center justify-center" style="display:none"><span class="text-4xl opacity-20">&#128230;</span></div>'
            : '<div class="w-full h-full bg-surface flex items-center justify-center"><span class="text-4xl opacity-20">&#128230;</span></div>';
          var loc = [item.city, item.state].filter(Boolean).join(', ');
          return '<a href="/bars/' + escHtml(item.slug) + '" class="group block bg-white rounded-2xl overflow-hidden border border-border card-hover">'
            + '<div class="aspect-[4/3] overflow-hidden">' + imgHtml + '</div>'
            + '<div class="p-5">'
            + '<h3 class="font-display font-semibold group-hover:text-muted transition-colors">' + escHtml(item.name) + '</h3>'
            + (item.description ? '<p class="text-sm text-muted mt-1.5 line-clamp-2 leading-relaxed">' + escHtml(item.description) + '</p>' : '')
            + (loc ? '<p class="text-xs text-muted mt-1">' + escHtml(loc) + '</p>' : '')
            + '</div></a>';
        }

        function loadMore() {
          if (loading || done) return;
          loading = true;
          fetch(buildUrl())
            .then(function(r) { return r.json(); })
            .then(function(json) {
              var items = json.data || [];
              items.forEach(function(item) {
                var div = document.createElement('div');
                div.className = 'bar-card';
                div.innerHTML = renderCard(item);
                grid.appendChild(div);
              });
              offset += items.length;
              done = !json.meta.hasMore;
              if (done && spinner) spinner.classList.add('hidden');
              loading = false;
            })
            .catch(function() { loading = false; });
        }

        if (!done) {
          var observer = new IntersectionObserver(function(entries) {
            if (entries[0].isIntersecting) loadMore();
          }, { rootMargin: '400px' });
          if (spinner) observer.observe(spinner);
        } else if (spinner) {
          spinner.classList.add('hidden');
        }
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
