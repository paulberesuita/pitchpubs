/**
 * Shared layout components — head, nav, footer, breadcrumbs
 */

import { SITE_NAME, DOMAIN, ITEMS_PATH, PROD_BASE, EFFECTS } from './config.js';
import { escapeHtml } from './utils.js';

/**
 * Render the <head> section with all SEO essentials
 */
export function renderHead({ title, description, url, image, type = 'website', jsonLd = null, noindex = false, pagination = null, mapEnabled = false }) {
  const fullTitle = `${escapeHtml(title)} | ${SITE_NAME}`;
  const safeDescription = escapeHtml(description);
  // Canonical always points to production domain, never preview URLs
  const safeUrl = escapeHtml(url.replace(/^https?:\/\/[^/]+/, PROD_BASE));
  const safeImage = image ? escapeHtml(image) : '';

  return `
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>${fullTitle}</title>
  <meta name="description" content="${safeDescription}">
  <link rel="canonical" href="${safeUrl}">
  ${noindex ? '<meta name="robots" content="noindex, follow">' : ''}
  ${pagination?.prev ? `<link rel="prev" href="${escapeHtml(pagination.prev)}">` : ''}
  ${pagination?.next ? `<link rel="next" href="${escapeHtml(pagination.next)}">` : ''}

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
            'background': '#fafaf9',
            'surface': '#f5f5f4',
            'surface-hover': '#e7e5e4',
            'border': '#e7e5e4',
            'muted': '#57534e',
            'accent': '#1c1917',       // customize per directory
            'accent-hover': '#292524', // customize per directory
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
  ${jsonLd ? `<script type="application/ld+json">${JSON.stringify(jsonLd)}</script>` : ''}
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
  <header class="sticky top-0 z-40 bg-background border-b border-border">
    <div class="max-w-5xl mx-auto px-6 h-16 flex items-center justify-between">
      <a href="/" class="font-display text-xl font-bold">${SITE_NAME}</a>

      <!-- Desktop nav -->
      <nav class="hidden md:flex items-center gap-8 text-sm">
        ${navLink(`/${ITEMS_PATH}`, 'Browse')}
        ${navLink('/states', 'States')}
        ${navLink('/cities', 'Cities')}
        ${navLink('/categories', 'Categories')}
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
        ${mobileLink('/states', 'States')}
        ${mobileLink('/cities', 'Cities')}
        ${mobileLink('/categories', 'Categories')}
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
  return `
  <footer class="border-t border-border mt-24">
    <div class="max-w-5xl mx-auto px-6 py-16">
      <div class="flex flex-col md:flex-row items-start justify-between gap-10">
        <div>
          <p class="font-display text-lg font-bold text-primary mb-2">${SITE_NAME}</p>
          <p class="text-sm text-muted max-w-xs">Discover and explore the best.</p>
        </div>
        <div class="flex flex-wrap gap-x-10 gap-y-3">
          <a href="/about" class="text-sm text-muted hover:text-primary transition-colors duration-200">About</a>
          <a href="/about#how-we-research" class="text-sm text-muted hover:text-primary transition-colors duration-200">How We Research</a>
          <a href="/faq" class="text-sm text-muted hover:text-primary transition-colors duration-200">FAQ</a>
          <a href="/contact" class="text-sm text-muted hover:text-primary transition-colors duration-200">Contact</a>
        </div>
      </div>
      <div class="border-t border-border mt-10 pt-10 text-center">
        <p class="text-sm text-muted">&copy; ${year} ${SITE_NAME}. All rights reserved.</p>
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

  // BreadcrumbList JSON-LD (only if baseUrl provided)
  const jsonLd = baseUrl ? JSON.stringify({
    "@context": "https://schema.org",
    "@type": "BreadcrumbList",
    "itemListElement": items.filter(item => item.href).map((item, i) => ({
      "@type": "ListItem",
      "position": i + 1,
      "name": item.label,
      "item": `${baseUrl}${item.href}`
    }))
  }) : '';

  return `
  ${jsonLd ? `<script type="application/ld+json">${jsonLd}</script>` : ''}
  <nav class="flex items-center gap-2 text-sm" aria-label="Breadcrumb">
    ${crumbs}
  </nav>
  `;
}
