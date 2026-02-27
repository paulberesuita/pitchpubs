# SoccerBars

The best soccer bars in America — curated for fans who want the real match-day experience.

---

## On Session Start

**Read context:** Skim the first ~150 lines of:
- `CONTEXT.md` — Key decisions and lessons learned
- `CHANGELOG.md` — Recent changes and current status

Both files are ordered newest-first. Only read the top ~150 lines (covers the last 1-2 sessions).

---

## Mindset

**Product over promotion.** Build something people want to use, not something optimized for crawlers. The best SEO is a site people link to because it's genuinely useful. Earn attention through quality — data accuracy, useful tools, delightful experiences.

---

## How We Work

### Agents = Autonomous Workers

Agents are **autonomous workers**. They check state, decide what needs doing, recommend, and execute. They don't wait for permission to investigate — they look at the data, the site, the gaps, and come back with a clear picture and a plan.

| Agent | Focus | Triggers |
|-------|-------|----------|
| **setup** | Bootstrap new directory (idea → config → infra → deploy) | "setup", "bootstrap", "new directory", "configure project" |
| **content** | Data + content pages (discover, research, build pages, fix data) | "content", "content agent", "research data", "add data", "data quality" |
| **product** | Build amazing product with taste — mini apps, delights, polished experience | "product", "product agent", "ship feature", "build tool", "mini-apps" |
| **seo** | Technical SEO (audit, fix, deploy) | "seo", "sitemap", "meta tags", "structured data", "indexing", "seo audit" |
| **marketing** | Distribution — social posts, campaigns, outreach, partnerships. Spreads what product builds. | "marketing", "marketing agent", "outreach", "backlinks", "social" |

Each agent is **fully autonomous** within its domain. No agent invokes another.

### Skills = How to Do It

Skills are **detailed instructions** for specific tasks. Agents invoke skills when executing.

**Shared skills (all agents use):**
| Skill | What it does |
|-------|--------------|
| `/tasty-design` | Colors, typography, components, design language |
| `/project-architecture` | DB schema, SSR patterns, shared modules, routing, SEO architecture |
| `/cloudflare-deploy` | Deploy commands, wrangler config |

**Setup agent skills:**
| Skill | What it does |
|-------|--------------|
| `/research-discovery` | Seeds starter data during bootstrap |

**Content agent skills:**
| Skill | What it does |
|-------|--------------|
| `/research-discovery` | Coverage overview + discovery workflow |
| `/deep-research` | Deep-dive research on individual items |
| `/research-images` | Find and upload images |
| `/write-script` | Video script generator for short-form content |

**Product agent skills:**
| Skill | What it does |
|-------|--------------|
| `/mini-apps` | Ideas framework + build process for mini apps that drive product-led growth |
| `/delights` | Inventory + ideas bank + principles for site delights |

**SEO agent skills:**
| Skill | What it does |
|-------|--------------|
| `/seo-audit` | Full audit modes — sitemap, content, pages, data |

**Marketing agent skills:**
| Skill | What it does |
|-------|--------------|
| `/outreach` | Campaign types, cold outreach, finding targets |
| `/marketing-ideas` | Brainstorming framework for attention ideas |
| `/partnerships` | Find, evaluate, pitch partners |
| `/programmatic-social` | Generate + post social content programmatically |
| `/write-script` | Video script generator for short-form content |

### Backlog = Idea Parking Lot

`BACKLOG.md` is an **idea parking lot**, not a work queue. Agents discover work by checking state — they don't pull from the backlog.

### Documentation = What Happened

After work completes, always update:
- **CHANGELOG.md** — What changed (Added, Changed, Fixed, Removed)
- **CONTEXT.md** — Why it changed, lessons learned

---

## Tech Stack

| Layer | Technology |
|-------|------------|
| Frontend | Vanilla HTML/JS + Tailwind CDN |
| Hosting | Cloudflare Workers with Static Assets |
| Functions | Cloudflare Workers (compiled from Pages Functions) |
| Database | Cloudflare D1 (SQLite) |
| Storage | Cloudflare R2 |

---

## Quick Reference

**Tech:** Cloudflare Workers + Static Assets + D1 (SQLite) + R2 (images). Vanilla HTML/JS + Tailwind CDN. All pages server-side rendered. No local dev — deploy and test on production.

**Architecture:** Functions are authored as Pages Functions in `functions/`, compiled into a single Worker bundle via `npx wrangler pages functions build --outdir=dist`, and deployed with `wrangler deploy`. Static files in `public/` are served via the `[assets]` binding.

**Environments:** Workers dev (`soccerbars-v2.tinybuild.workers.dev`) and Production (`pitchpubs.com`) via zone-based routes.

### Project Structure

```
/
├── public/                  # Static assets
│   ├── _headers             # Cloudflare cache/security headers
│   ├── favicon.svg          # Site icon
│   └── llms.txt             # AI crawler description
├── functions/               # Source functions (compiled to dist/ on build)
│   ├── _middleware.js        # Short-path redirects, noindex on previews, legacy URL 301s
│   ├── _shared.js           # Barrel re-export
│   ├── _shared/             # Modular shared code
│   │   ├── config.js        # All site constants (single source of truth)
│   │   ├── utils.js         # escapeHtml, slugify, truncate, capitalize
│   │   ├── layout.js        # renderHead (SEO/fonts/colors), renderNav, renderFooter, renderBreadcrumbs
│   │   ├── components.js    # renderCard (with onerror), renderEmptyState, renderPagination (with rel next/prev)
│   │   ├── map.js           # renderMapToggle, renderMap (Leaflet grid/map toggle)
│   │   └── response.js      # renderPage, htmlResponse, jsonResponse, errorResponse
│   ├── index.js             # GET / (homepage with client-side filtering)
│   ├── bars/[[slug]].js     # Browse + detail
│   ├── states/[[slug]].js   # States index + detail (items grouped by city)
│   ├── cities/[[slug]].js   # Cities index + detail (items grouped by category)
│   ├── category/[[slug]].js # Category detail with state filter
│   ├── categories.js        # Categories index
│   ├── best/[[slug]].js     # Best-of ranking pages
│   ├── search.js            # Search (noindex)
│   ├── crew.js              # Team page with Organization schema
│   ├── services/[[slug]].js # Related services
│   ├── about.js, faq.js, contact.js, submit.js  # Info pages
│   ├── robots.txt.js        # Dynamic robots.txt (reads DOMAIN from config)
│   ├── llms-full.txt.js     # Full DB dump for LLM crawlers
│   ├── sitemap.xml.js       # Dynamic sitemap with threshold filtering
│   ├── feed.xml.js          # RSS feed (discoverable via <link> in head)
│   ├── 404.js               # Not found
│   ├── images/[[path]].js   # R2 image proxy
│   └── api/                 # JSON API endpoints
│       ├── categories.js    # GET /api/categories (with counts)
│       ├── items/[[slug]].js# GET /api/items/[slug] (detail)
│       ├── states/[[slug]].js # GET /api/states + /api/states/[slug]
│       └── cities/[[slug]].js # GET /api/cities + /api/cities/[slug]
├── migrations/              # SQL migrations (numbered)
├── scripts/                 # Seed SQL scripts
├── .claude/
│   ├── agents/              # setup, content, product, seo, marketing
│   └── skills/              # 14 skill definitions
├── package.json             # Build/deploy scripts
├── wrangler.toml            # Worker config (main, assets, D1, R2, routes)
├── .gitignore               # dist/, node_modules/, .wrangler/
├── BACKLOG.md               # Idea parking lot
├── CHANGELOG.md             # What changed
└── CONTEXT.md               # Decisions & lessons
```

### Routing

**CRITICAL:** `[[slug]].js` handles both index and detail pages. Don't create `index.js` in the same directory.

```javascript
export async function onRequestGet(context) {
  const slug = context.params.slug?.[0];
  if (!slug) return renderIndexPage(context);
  return renderDetailPage(context, slug);
}
```

### Built-in SEO Architecture

These are baked into the template — no setup needed:

- **Canonical URLs** — `renderHead()` rewrites all canonicals/OG URLs to production `DOMAIN`, never preview URLs
- **Middleware** — Blocks non-production domains from indexing via `X-Robots-Tag: noindex`
- **Sitemap** — Dynamic with threshold filtering: cities/categories need 3+ items. Real `lastmod` dates from DB.
- **Meta titles** — Include counts and location (e.g., "Cafes in Texas - 12 Locations")
- **Meta descriptions** — Include sample item names for richer snippets
- **Search noindex** — `/search?q=*` pages have `noindex` to prevent thin content indexing
- **Pagination hints** — `rel="next/prev"` on browse and category pages
- **RSS discovery** — `<link rel="alternate">` in every page's `<head>`
- **Content auto-linking** — First mention of city/state in detail content gets linked to geographic pages
- **Images-first sorting** — SQL `CASE WHEN` sorts items with images before those without
- **Image onerror** — Broken images gracefully fall back to placeholder
- **Structured data** — JSON-LD on every page (WebSite, Organization with knowsAbout, BreadcrumbList, ItemList, CollectionPage, configurable SCHEMA_TYPE on detail pages)
- **E-E-A-T signals** — Sources with count badge, "Last Researched" date, "How We Research" link, Organization schema

### Deploy Commands

```bash
# Build + Deploy (preferred)
npm run deploy

# Build only (compile functions → dist/)
npm run build

# Deploy only (assumes dist/ exists)
npx wrangler deploy

# Run migration
npx wrangler d1 execute soccerbars-v2-db --file=./migrations/XXX.sql --remote

# Query database
npx wrangler d1 execute soccerbars-v2-db --remote --command "SELECT COUNT(*) FROM bars;"
```
