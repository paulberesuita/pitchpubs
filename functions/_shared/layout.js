/**
 * Shared layout components — head, nav, footer, breadcrumbs
 */

import { SITE_NAME, DOMAIN, ITEMS_PATH, PROD_BASE, EFFECTS } from './config.js';
import { escapeHtml, capitalize } from './utils.js';

/**
 * Render the <head> section with all SEO essentials
 */
export function renderHead({ title, description, url, image, type = 'website', jsonLd = null, noindex = false, pagination = null, mapEnabled = false }) {
  const fullTitle = `${escapeHtml(title)} | ${SITE_NAME}`;
  const safeDescription = escapeHtml(description);
  // Rewrite all URLs to production domain, never preview URLs
  const toProd = (u) => u ? escapeHtml(u.replace(/^https?:\/\/[^/]+/, PROD_BASE)) : '';
  const safeUrl = toProd(url);
  const safeImage = image ? escapeHtml(image.startsWith('http') ? image : `${PROD_BASE}/images/${image}`) : '';

  return `
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>${fullTitle}</title>
  <meta name="description" content="${safeDescription}">
  <link rel="canonical" href="${safeUrl}">
  ${noindex ? '<meta name="robots" content="noindex, follow">' : ''}
  ${pagination?.prev ? `<link rel="prev" href="${toProd(pagination.prev)}">` : ''}
  ${pagination?.next ? `<link rel="next" href="${toProd(pagination.next)}">` : ''}

  <!-- RSS Feed Discovery -->
  <link rel="alternate" type="application/rss+xml" title="${SITE_NAME}" href="${PROD_BASE}/feed.xml">

  <!-- Open Graph -->
  <meta property="og:title" content="${fullTitle}">
  <meta property="og:description" content="${safeDescription}">
  <meta property="og:url" content="${safeUrl}">
  ${safeImage ? `<meta property="og:image" content="${safeImage}">` : ''}
  <meta property="og:type" content="${type}">
  <meta property="og:site_name" content="${SITE_NAME}">

  <!-- Twitter Card -->
  <meta name="twitter:card" content="${safeImage ? 'summary_large_image' : 'summary'}">
  <meta name="twitter:title" content="${fullTitle}">
  <meta name="twitter:description" content="${safeDescription}">
  ${safeImage ? `<meta name="twitter:image" content="${safeImage}">` : ''}

  <!-- Favicon -->
  <link rel="icon" type="image/svg+xml" href="/favicon.svg">

  <!-- Analytics (uncomment and set domain after setup) -->
  <!-- <script defer data-domain="${DOMAIN}" src="https://plausible.io/js/script.js"></script> -->

  ${mapEnabled ? `
  <!-- Leaflet (map view) -->
  <link rel="stylesheet" href="https://unpkg.com/leaflet@1.9.4/dist/leaflet.css" crossorigin="">
  <script src="https://unpkg.com/leaflet@1.9.4/dist/leaflet.js" crossorigin=""></script>
  ` : ''}

  <!-- Fonts & Tailwind -->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Epilogue:wght@400;500;600;700;800&family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
  <script src="https://cdn.tailwindcss.com"></script>
  <script>
    tailwind.config = {
      theme: {
        extend: {
          fontFamily: {
            sans: ['Inter', 'system-ui', 'sans-serif'],
            display: ['Epilogue', 'system-ui', 'sans-serif'],
          },
          colors: {
            'primary': '#1c1917',
            'primary-hover': '#292524',
            'background': '#ffffff',
            'surface': '#f5f5f4',
            'surface-hover': '#e7e5e4',
            'border': '#e7e5e4',
            'muted': '#57534e',
            'accent': '#166534',       // pitch green
            'accent-hover': '#14532d', // darker green
            'error': '#dc2626',
            'error-bg': '#fef2f2',
            'success': '#16a34a',
            'success-bg': '#f0fdf4',
          },
          borderRadius: {
            'xl': '12px',
            '2xl': '16px',
            '3xl': '20px',
          },
          keyframes: {
            'fade-in': {
              '0%': { opacity: '0' },
              '100%': { opacity: '1' },
            },
            'fade-in-up': {
              '0%': { opacity: '0', transform: 'translateY(16px)' },
              '100%': { opacity: '1', transform: 'translateY(0)' },
            },
          },
          animation: {
            'fade-in': 'fade-in 0.5s ease-out forwards',
            'fade-in-up': 'fade-in-up 0.5s ease-out forwards',
          },
        }
      }
    }
  </script>
  <style>
    .stagger-1 { animation-delay: 0ms; }
    .stagger-2 { animation-delay: 80ms; }
    .stagger-3 { animation-delay: 160ms; }
    .stagger-4 { animation-delay: 240ms; }
    .stagger-5 { animation-delay: 320ms; }
    .stagger-6 { animation-delay: 400ms; }
    [class*="animate-fade-in"] { opacity: 0; }

    .card-hover {
      transition: transform 200ms ease-out;
    }
    .card-hover:hover {
      transform: translateY(-2px);
    }
    .card-hover:active {
      transform: scale(0.98);
    }

    .reveal {
      opacity: 0;
      transform: translateY(16px);
      transition: opacity 0.5s ease-out, transform 0.5s ease-out;
    }
    .reveal.visible {
      opacity: 1;
      transform: translateY(0);
    }

    ${EFFECTS.grain ? `
    /* Grain texture overlay — add .grain-bg to any section */
    .grain-bg {
      position: relative;
    }
    .grain-bg::after {
      content: '';
      position: absolute;
      inset: 0;
      opacity: 0.04;
      pointer-events: none;
      background-image: url("data:image/svg+xml,%3Csvg viewBox='0 0 256 256' xmlns='http://www.w3.org/2000/svg'%3E%3Cfilter id='noise'%3E%3CfeTurbulence type='fractalNoise' baseFrequency='0.9' numOctaves='4' stitchTiles='stitch'/%3E%3C/filter%3E%3Crect width='100%25' height='100%25' filter='url(%23noise)'/%3E%3C/svg%3E");
      background-repeat: repeat;
      background-size: 128px 128px;
      z-index: 1;
    }
    ` : ''}

  </style>
  ${(() => {
    if (!jsonLd) return '';
    // Rewrite request-origin URLs to production domain in JSON-LD
    const requestBase = url.match(/^https?:\/\/[^/]+/)?.[0] || '';
    let str = JSON.stringify(jsonLd);
    if (requestBase && requestBase !== PROD_BASE) {
      str = str.split(requestBase).join(PROD_BASE);
    }
    return `<script type="application/ld+json">${str}</script>`;
  })()}
  `;
}

/**
 * Render navigation header with active page highlighting
 * @param {string} currentPath - Current URL pathname (e.g., '/about', '/items')
 */
export function renderNav(currentPath = '') {
  const navLink = (href, label) => {
    const isActive = currentPath === href || (href !== '/' && currentPath.startsWith(href));
    return `<a href="${href}" class="${isActive ? 'text-primary font-medium' : 'text-muted'} hover:text-primary transition-colors">${label}</a>`;
  };

  const mobileLink = (href, label) => {
    const isActive = currentPath === href || (href !== '/' && currentPath.startsWith(href));
    return `<a href="${href}" class="py-3 ${isActive ? 'text-primary font-medium bg-surface' : 'text-muted'} hover:text-primary transition-colors rounded-xl px-3 hover:bg-surface">${label}</a>`;
  };

  return `
  <header class="sticky top-0 z-40 bg-background">
    <div class="max-w-7xl mx-auto px-6 h-16 flex items-center justify-between">
      <a href="/" class="font-display text-xl font-bold">${SITE_NAME}</a>

      <!-- Desktop nav -->
      <nav class="hidden md:flex items-center gap-8 text-sm">
        ${navLink(`/${ITEMS_PATH}`, 'Browse')}
        ${navLink('/cities', 'Cities')}
        ${navLink('/states', 'States')}
        ${navLink('/about', 'About')}
        <a href="/submit" class="bg-primary hover:bg-primary-hover text-white font-medium px-5 py-2 rounded-xl transition-colors">
          Submit
        </a>
      </nav>

      <!-- Mobile menu button -->
      <button id="mobile-menu-btn" class="md:hidden p-2 text-muted hover:text-primary transition-colors" aria-label="Menu">
        <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16M4 18h16"></path>
        </svg>
      </button>
    </div>

    <!-- Mobile menu -->
    <div id="mobile-menu" class="hidden md:hidden border-t border-border bg-background">
      <nav class="flex flex-col px-6 py-4 gap-1 text-sm">
        ${mobileLink(`/${ITEMS_PATH}`, 'Browse')}
        ${mobileLink('/cities', 'Cities')}
        ${mobileLink('/states', 'States')}
        ${mobileLink('/about', 'About')}
        <a href="/submit" class="bg-primary hover:bg-primary-hover text-white font-medium px-5 py-3 rounded-xl transition-colors text-center mt-3">
          Submit
        </a>
      </nav>
    </div>
  </header>

  <script>
    (function() {
      const btn = document.getElementById('mobile-menu-btn');
      const menu = document.getElementById('mobile-menu');
      if (!btn || !menu) return;
      btn.addEventListener('click', function(e) {
        e.stopPropagation();
        menu.classList.toggle('hidden');
      });
      document.addEventListener('click', function(e) {
        if (!menu.classList.contains('hidden') && !menu.contains(e.target) && e.target !== btn) {
          menu.classList.add('hidden');
        }
      });
    })();
  </script>
  `;
}

/**
 * Render footer with trust nav
 */
export function renderFooter() {
  const year = new Date().getFullYear();
  const itemsLabel = capitalize(ITEMS_PATH);
  const footerLink = (href, label) =>
    `<li><a href="${href}" class="text-sm text-muted hover:text-primary transition-colors duration-200">${label}</a></li>`;

  return `
  <footer class="border-t border-border mt-24">
    <div class="max-w-7xl mx-auto px-6 py-16">
      <div class="grid grid-cols-2 md:grid-cols-4 gap-10 md:gap-12">

        <!-- Brand -->
        <div class="col-span-2 md:col-span-1">
          <a href="/" class="font-display text-xl font-bold hover:text-muted transition-colors">${SITE_NAME}</a>
          <p class="text-sm text-muted mt-3 max-w-xs leading-relaxed">The best soccer bars in America. Curated for fans who want the real match-day experience.</p>
          <a href="/feed.xml" class="inline-flex items-center gap-1.5 text-xs text-muted hover:text-primary transition-colors mt-4">
            <svg class="w-3.5 h-3.5" fill="none" stroke="currentColor" viewBox="0 0 24 24" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
              <path d="M4 11a9 9 0 0 1 9 9"/><path d="M4 4a16 16 0 0 1 16 16"/><circle cx="5" cy="19" r="1"/>
            </svg>
            RSS Feed
          </a>
        </div>

        <!-- Browse -->
        <div>
          <p class="font-semibold text-sm text-primary mb-4">Browse</p>
          <ul class="space-y-2.5">
            ${footerLink(`/${ITEMS_PATH}`, `All ${itemsLabel}`)}
            ${footerLink('/categories', 'Categories')}
            ${footerLink('/best', 'Best Of')}
            ${footerLink('/states', 'States')}
            ${footerLink('/cities', 'Cities')}
          </ul>
        </div>

        <!-- Company -->
        <div>
          <p class="font-semibold text-sm text-primary mb-4">Company</p>
          <ul class="space-y-2.5">
            ${footerLink('/about', 'About')}
            ${footerLink('/crew', 'The Crew')}
            ${footerLink('/about#how-we-research', 'How We Research')}
            ${footerLink('/faq', 'FAQ')}
            ${footerLink('/contact', 'Contact')}
            ${footerLink('/submit', 'Submit')}
          </ul>
        </div>

        <!-- Newsletter -->
        <div>
          <p class="font-semibold text-sm text-primary mb-4">Stay Updated</p>
          <p class="text-sm text-muted mb-4 leading-relaxed">Get notified when we add new ${ITEMS_PATH}.</p>
          <form class="flex gap-2" onsubmit="event.preventDefault();this.querySelector('button').textContent='Subscribed!';this.querySelector('input').disabled=true;">
            <input
              type="email"
              placeholder="you@email.com"
              required
              class="flex-1 min-w-0 text-sm border border-border rounded-lg px-3 py-2 focus:outline-none focus:border-primary/30 transition-all"
            >
            <button
              type="submit"
              class="bg-primary hover:bg-primary-hover text-white text-sm font-medium px-4 py-2 rounded-lg transition-colors shrink-0"
            >
              Join
            </button>
          </form>
          <p class="text-xs text-muted mt-2">No spam. Unsubscribe anytime.</p>
        </div>

      </div>

      <!-- Bottom bar -->
      <div class="border-t border-border mt-12 pt-8 flex flex-col sm:flex-row items-center justify-between gap-4">
        <p class="text-sm text-muted">&copy; ${year} ${SITE_NAME}. All rights reserved.</p>
        <div class="flex items-center gap-6">
          <a href="/about#how-we-research" class="text-xs text-muted hover:text-primary transition-colors">How We Research</a>
          <a href="/contact" class="text-xs text-muted hover:text-primary transition-colors">Contact</a>
          <a href="/llms.txt" class="text-xs text-muted hover:text-primary transition-colors">LLMs.txt</a>
        </div>
      </div>
    </div>
  </footer>

  <!-- Scroll reveal observer + console easter egg -->
  <script>
    // Console easter egg — one-time delight for devs
    if (!sessionStorage.getItem('hello')) {
      console.log('%c${SITE_NAME}', 'font-size: 24px; font-weight: bold; color: #1c1917;');
      console.log('%cCurated with care. Built with Claude.', 'font-size: 12px; color: #78716c;');
      console.log('%cAPI: /api/items  |  Data: /llms-full.txt', 'font-size: 11px; color: #a8a29e;');
      sessionStorage.setItem('hello', '1');
    }

    const observer = new IntersectionObserver((entries) => {
      entries.forEach((entry, i) => {
        if (entry.isIntersecting) {
          setTimeout(() => entry.target.classList.add('visible'), i * 100);
          observer.unobserve(entry.target);
        }
      });
    }, { threshold: 0.1 });
    document.querySelectorAll('.reveal').forEach(el => observer.observe(el));

    ${EFFECTS.countUp ? `
    // Count-up animation — add .count-up to elements with numeric text content
    const countObserver = new IntersectionObserver((entries) => {
      entries.forEach(entry => {
        if (entry.isIntersecting) {
          const el = entry.target;
          const target = parseInt(el.textContent.replace(/,/g, ''), 10);
          if (isNaN(target) || target === 0) return;
          const duration = 800;
          const start = performance.now();
          const tick = (now) => {
            const progress = Math.min((now - start) / duration, 1);
            const eased = 1 - Math.pow(1 - progress, 3);
            el.textContent = Math.round(target * eased).toLocaleString();
            if (progress < 1) requestAnimationFrame(tick);
          };
          el.textContent = '0';
          requestAnimationFrame(tick);
          countObserver.unobserve(el);
        }
      });
    }, { threshold: 0.3 });
    document.querySelectorAll('.count-up').forEach(el => countObserver.observe(el));
    ` : ''}
  </script>
  `;
}

/**
 * Render breadcrumbs with BreadcrumbList JSON-LD structured data
 * @param {Array<{label: string, href?: string}>} items
 * @param {string} baseUrl - Full base URL for structured data (e.g., https://example.com)
 */
export function renderBreadcrumbs(items, baseUrl = '') {
  const crumbs = items.map((item, i) => {
    const isLast = i === items.length - 1;
    if (isLast) {
      return `<span class="text-primary font-medium">${escapeHtml(item.label)}</span>`;
    }
    return `
      <a href="${escapeHtml(item.href)}" class="text-muted hover:text-primary transition-colors">${escapeHtml(item.label)}</a>
      <svg class="w-4 h-4 text-border" fill="none" stroke="currentColor" viewBox="0 0 24 24">
        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5l7 7-7 7"></path>
      </svg>
    `;
  }).join('\n');

  // BreadcrumbList JSON-LD — always use production domain
  const jsonLd = baseUrl ? JSON.stringify({
    "@context": "https://schema.org",
    "@type": "BreadcrumbList",
    "itemListElement": items.filter(item => item.href).map((item, i) => ({
      "@type": "ListItem",
      "position": i + 1,
      "name": item.label,
      "item": `${PROD_BASE}${item.href}`
    }))
  }) : '';

  return `
  ${jsonLd ? `<script type="application/ld+json">${jsonLd}</script>` : ''}
  `;
}
