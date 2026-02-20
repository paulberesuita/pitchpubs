---
name: project-architecture
description: Load DB schema, SSR patterns, shared modules, routing, SEO architecture. Usage: /project-architecture
user_invokable: true
---

# Project Architecture

Technical patterns for directory apps on Cloudflare Pages.

---

## Philosophy

**The simplest stack that produces a professional result.** Every page is a single function that queries a database and returns HTML. No build step, no bundler, no hydration, no client-side routing. The entire mental model is: **data in, HTML out.**

**Config-driven, not code-driven.** `functions/_shared/config.js` is the single source of truth. Change `ITEMS_PATH` from `'cafes'` to `'tools'` and the nav links, breadcrumbs, meta titles, API endpoints, and sitemap all update automatically.

**SSR over SPA.** Directories need every page independently crawlable, unique meta tags per page, fast first paint with no JS, and URLs that work when shared. Server-side rendering gives all of this for free.

**Cloudflare's edge, not a server.** Pages Functions run at 300+ locations worldwide. D1 (SQLite) and R2 (object storage) complete the stack. One ecosystem, one CLI.

**No local dev.** Production *is* the dev environment. Deploy takes ~10 seconds. Clone, authenticate, deploy.

---

## Config System

All site constants live in `functions/_shared/config.js` — the single source of truth.

```javascript
// Core
SITE_NAME, DOMAIN, PROD_BASE, TABLE_NAME, ITEMS_PATH, CATEGORY_FIELD

// SEO & Schema
SCHEMA_TYPE       // Schema.org type for detail pages ('LocalBusiness', 'Product', etc.)
EXPERTISE_AREAS   // Array for Organization schema knowsAbout (E-E-A-T)

// Behavior
HOMEPAGE_FILTER   // 'states' or 'categories' — what homepage pills filter by
SHORT_PATHS       // { 'short-url': 'category-slug' } — 301 redirects via middleware
EFFECTS           // { grain: false, countUp: true } — toggleable visual effects
```

---

## Project Structure

```
functions/
├── _middleware.js          # Short-path 301s, noindex on previews, legacy URL redirects
├── _shared.js              # Barrel re-export (all modules)
├── _shared/
│   ├── config.js           # All constants (single source of truth)
│   ├── utils.js            # escapeHtml, slugify, truncate, capitalize
│   ├── layout.js           # renderHead (SEO + fonts + colors + RSS + pagination hints),
│                           #   renderNav (desktop + mobile with close-on-outside),
│                           #   renderFooter (scroll reveal, countUp, grain),
│                           #   renderBreadcrumbs (with BreadcrumbList JSON-LD)
│   ├── components.js       # renderCard (images-first, onerror fallback, lazy loading),
│                           #   renderEmptyState, renderPagination (rel next/prev)
│   ├── map.js              # renderMapToggle (grid/map toggle buttons),
│                           #   renderMap (Leaflet container + data + client-side JS)
│   └── response.js         # renderPage, htmlResponse, jsonResponse, errorResponse
├── index.js                # Homepage (hero, features strip, client-side filter pills)
├── [ITEMS_PATH]/[[slug]].js # Browse (images-first sort, category pills, pagination)
│                           #   + Detail (hero, about with auto-linked content, sources,
│                           #   sidebar with map, 3 related sections: city/state/category)
├── states/[[slug]].js      # States index + detail (items grouped by city, city pills)
├── cities/[[slug]].js      # Cities index + detail (items grouped by category, related cities)
├── category/[[slug]].js    # Category detail (state filter dropdown, pagination)
├── categories.js           # Categories index
├── best/[[slug]].js        # Best-of ranking pages
├── search.js               # Search (noindex, name-match priority)
├── crew.js                 # Team page (Organization schema)
├── services/[[slug]].js    # Related services
├── about.js                # About + "How We Research"
├── faq.js                  # FAQ (FAQPage structured data)
├── contact.js, submit.js   # Contact + submit forms
├── robots.txt.js           # Dynamic robots.txt (reads DOMAIN from config)
├── llms-full.txt.js        # Full DB dump for LLM crawlers
├── sitemap.xml.js          # Dynamic sitemap (threshold filtering, real lastmod)
├── feed.xml.js             # RSS feed
├── 404.js                  # Not found
├── images/[[path]].js      # R2 image proxy
└── api/
    ├── categories.js       # GET /api/categories
    ├── items/[[slug]].js   # GET /api/items/[slug]
    ├── states/[[slug]].js  # GET /api/states (list + counts) + /api/states/[slug] (items)
    └── cities/[[slug]].js  # GET /api/cities (list + counts, ?state= filter) + /api/cities/[slug]
```

---

## Bindings

| Binding | Type | Name | Usage |
|---------|------|------|-------|
| `env.DB` | D1 | `[PROJECT]-db` | SQLite database |
| `env.IMAGES` | R2 | `[PROJECT]-images` | Item images |

---

## Shared Modules

**Import from barrel** (existing pattern):
```javascript
import { SITE_NAME, ITEMS_PATH, PROD_BASE, escapeHtml, capitalize, renderHead, renderCard, htmlResponse } from './_shared.js';
```

**Or import directly** (preferred for new code):
```javascript
import { SITE_NAME } from './_shared/config.js';
import { renderHead } from './_shared/layout.js';
```

---

## Routing: [[slug]].js Priority

**CRITICAL:** `[[slug]].js` handles ALL requests in a directory — including the bare path. An `index.js` in the same directory is NEVER called.

```javascript
export async function onRequestGet(context) {
  const slug = context.params.slug?.[0];
  if (!slug) return renderIndexPage(context);
  return renderDetailPage(context, slug);
}
```

---

## SSR Page Pattern

All pages are **server-side rendered**. Functions return full HTML with data from D1.

```javascript
import { SITE_NAME, TABLE_NAME, ITEMS_PATH, PROD_BASE, escapeHtml, capitalize, renderHead, renderNav, renderFooter,
  renderBreadcrumbs, renderCard, renderEmptyState, renderPage, htmlResponse } from '../_shared.js';

export async function onRequestGet(context) {
  const { env, request } = context;
  const url = new URL(request.url);
  const baseUrl = `${url.protocol}//${url.host}`;

  try {
    const { results } = await env.DB.prepare(
      `SELECT * FROM ${TABLE_NAME} WHERE state = ? ORDER BY name`
    ).bind('California').all();

    const head = renderHead({
      title: 'Page Title',
      description: 'Meta description with counts and sample names.',
      url: `${baseUrl}/page-path`,
      jsonLd: { /* structured data */ }
    });

    const body = `
    ${renderNav('/current-path')}
    <main class="max-w-5xl mx-auto px-6 py-14">
      <!-- content -->
    </main>
    ${renderFooter()}
    `;

    return htmlResponse(renderPage(head, body));
  } catch (error) {
    console.error('Error:', error);
    // render error/empty state
  }
}
```

---

## renderHead Options

```javascript
renderHead({
  title,              // Page title (appended with " | SITE_NAME")
  description,        // Meta description
  url,                // Page URL (rewritten to production domain automatically)
  image,              // Optional OG image URL
  type,               // OG type (default: 'website')
  jsonLd,             // Optional JSON-LD structured data (object or array)
  noindex,            // Optional: true to add noindex meta tag (use for search results)
  pagination,         // Optional: { prev: url, next: url } for rel next/prev
  mapEnabled,         // Optional: true to load Leaflet CSS/JS from CDN (for map toggle pages)
})
```

Automatically includes: canonical URL (production domain), OG tags, Twitter cards, RSS discovery link, favicon, Google Fonts, Tailwind config with color tokens.

---

## SQL Patterns

```javascript
// Images-first sort (use on all listing pages)
`ORDER BY CASE WHEN image_url IS NOT NULL AND image_url != '' THEN 0 ELSE 1 END, name ASC`

// Featured + images-first (homepage)
`ORDER BY featured DESC, CASE WHEN image_url IS NOT NULL AND image_url != '' THEN 0 ELSE 1 END, name ASC`

// Related items (detail page — 3 sections: city, state, category)
`WHERE city = ? AND state = ? AND slug != ? ORDER BY RANDOM() LIMIT 4`

// Geographic aggregation
`SELECT state, COUNT(*) as count FROM ${TABLE_NAME} GROUP BY state ORDER BY count DESC`

// Search with name-match priority
`WHERE name LIKE ? OR description LIKE ? ORDER BY CASE WHEN name LIKE ? THEN 0 ELSE 1 END, name`
```

---

## Middleware

`functions/_middleware.js` runs before every request:

1. **Short-path redirects** — `/quiet-spots` -> `/category/quiet-spots` (301)
2. **Legacy URL redirects** — `/items?category=Tools` -> `/category/tools` (301)
3. **Non-production noindex** — Sets `X-Robots-Tag: noindex, nofollow` on preview domains

---

## Sitemap Architecture

`functions/sitemap.xml.js` — dynamic, not static:

- **Static pages** with `lastmod` derived from most recent item update
- **State pages** — all states (no threshold)
- **City pages** — threshold filtered (`MIN_CITY_ITEMS = 3`)
- **Category pages + best-of** — threshold filtered (`MIN_CATEGORY_ITEMS = 3`)
- **Item pages** — all items with real `lastmod` from `updated_at`
- **Production domain** hardcoded for all URLs

---

## Cache-Control

| Content | Cache | Why |
|---------|-------|-----|
| HTML pages | `public, max-age=300` | 5 min, keeps content fresh |
| Images (R2) | `public, max-age=31536000, immutable` | 1 year, images don't change |
| API JSON | `public, max-age=300` | 5 min, same as pages |
| Sitemap | `public, max-age=3600` | 1 hour |

---

## Security Rules

1. **Always escape HTML** — `escapeHtml()` for database content in templates
2. **Use prepared statements** — `env.DB.prepare('...').bind(value)` — never concatenation
3. **Log errors** — `console.error()` before returning error responses
4. **Cache public pages** — `Cache-Control: public, max-age=300`
5. **CORS on API only** — `Access-Control-Allow-Origin: *` on `/api/` endpoints
