# Changelog

What we shipped. Update after each feature.

---

## 2026-02-19

### Agent & Docs Alignment

**Added:**
- Setup agent (`.claude/agents/setup.md`) — bootstraps new directories from idea to deployed site
- Architecture philosophy section in `/project-architecture` skill
- "No local dev" context in `/cloudflare-deploy` skill
- Step 3k in setup agent to fill README placeholder sections
- Product agent updates README Product section after shipping features
- Memory note for keeping project structures in sync

**Changed:**
- README rewritten as living doc — Overview, Taste, Product are placeholders filled by agents; Agents section is permanent
- All agent terminology unified to "mini apps" (was "interactive tools" / "mini-tools" in some places)
- All 5 agents now have Skill tool in their toolset
- Project structures in CLAUDE.md, README, and `/project-architecture` synced to actual files on disk
- `robots.txt` documented as dynamic (`functions/robots.txt.js`), not static

**Removed:**
- `examples/` directory (14 files, ~5000 lines) — setup agent uses `/tasty-design` skill instead
- Maintenance-heavy lists from README (pages table, SEO features, skills table, commands, project structure)

**Fixed:**
- `tasty-design` skill referenced "CLAUDE.md setup flow" instead of "setup agent"
- `project-architecture` skill was missing `robots.txt.js` and `llms-full.txt.js`

---

### Map View Toggle + API Expansion

**Map View (Leaflet + OpenStreetMap):**
- **Added:** `functions/_shared/map.js` — `renderMapToggle()` (inline toggle buttons) + `renderMap()` (Leaflet container, JSON data blob, client-side JS)
- **Added:** Grid/map toggle on browse, state detail, and city detail pages — only appears when items have lat/lng coordinates
- **Changed:** `renderHead()` accepts `mapEnabled` flag to conditionally load Leaflet CSS/JS from CDN
- **Changed:** Leaflet loaded only on pages with mappable items (not site-wide)
- Map pins show popup with image, name, city, and link to detail page
- Scroll wheel zoom disabled (prevents hijacking page scroll)
- Map container uses `relative z-0` to contain Leaflet's z-indexes below sticky nav

**API Expansion:**
- **Added:** `functions/api/states/[[slug]].js` — `GET /api/states` (list with counts) + `GET /api/states/[slug]` (items with pagination)
- **Added:** `functions/api/cities/[[slug]].js` — `GET /api/cities` (list with counts, `?state=` filter) + `GET /api/cities/[slug]` (items with pagination)

**Sample Data:**
- **Added:** `scripts/seed_sample_10.sql` — 10 sample cafes with real coordinates across 10 US cities

---

### SpookFinder Gap Analysis — Batch 1 & 2 Implementation

Closed all major gaps between the directory template and SpookFinder's battle-tested patterns.

**Geographic Pages (Batch 1):**
- **Added:** `functions/states/[[slug]].js` — states index + state detail, items grouped by city with sidebar
- **Added:** `functions/cities/[[slug]].js` — cities index + city detail, items grouped by category with related cities
- **Added:** Nav updated with States and Cities links (desktop + mobile)
- **Added:** Geographic breadcrumbs: Home > State > City > Item

**Detail Page Enhancements (Batch 1):**
- **Changed:** Detail pages now have 3 related sections (SpookFinder pattern): "More in [City]", "More in [State]", "More [Category]" — 12+ internal links per page vs 3 before
- **Added:** Google Maps embed on detail pages when coordinates exist
- **Added:** "Last Researched" framing for updated_at in sidebar
- **Changed:** JSON-LD uses domain-specific `SCHEMA_TYPE` (configurable in config.js)

**Client-Side Filtering (Batch 1):**
- **Added:** State dropdown filter on category pages with client-side JS, "Showing X of Y" counter

**Short-Path Category Routes (Batch 1):**
- **Added:** `SHORT_PATHS` config in config.js — maps short URLs to category pages via middleware 301 redirect
- **Changed:** Middleware now handles short-path rewrites before legacy URL redirects

**Team/Crew Page (Batch 2):**
- **Added:** `functions/crew.js` — team page with member cards, fun facts, Organization schema with member data
- Uses `EXPERTISE_AREAS` from config for `knowsAbout` in JSON-LD (E-E-A-T)

**Services/Related Businesses Page Type (Batch 2):**
- **Added:** `migrations/002_services.sql` — services table with booking_url, price_range, linked_items
- **Added:** `functions/services/[[slug]].js` — services index with city filter + detail page with linked items, booking CTA, LocalBusiness schema
- Gracefully renders empty state if services table doesn't exist yet

**Ambient Effects System (Batch 2):**
- **Added:** `EFFECTS` config — toggleable grain texture, parallax tilt, count-up animations
- **Added:** `.grain-bg` CSS class — SVG noise texture overlay for hero sections
- **Added:** `.parallax-hero` — subtle mouse-follow tilt on detail page hero images
- **Added:** `.count-up` — animates numeric text counting up on scroll (ease-out cubic)
- All effects are optional and configurable per-directory in config.js

---

## 2026-02-18

### TBC Design System — The Browser Company Aesthetic

Complete design overhaul inspired by The Browser Company (Arc, Dia). Research covered arc.net, diabrowser.com, thebrowser.company, and extracted core design principles.

**Design Tokens:**
- **Changed:** Background from cold `#faf9f7` to warm cream `#FFFCEC` (TBC signature)
- **Changed:** Text from pure black to warm dark brown `#37352F`
- **Changed:** Borders from cold gray to warm-tinted `rgba(20, 13, 7, 0.08)`
- **Added:** Accent color `#3139FB` (TBC blue) for CTAs and interactive elements
- **Added:** Translucent surfaces `rgba(255, 255, 255, 0.60)` with backdrop blur
- **Added:** 3-tier shadow system (sm/md/lg) + card shadow matching TBC patterns
- **Added:** Large border radii (16-40px) — soft, approachable geometry

**Typography:**
- **Added:** Epilogue as display font (similar personality to TBC's custom typefaces)
- **Changed:** All headings use `font-display` for personality, body stays Inter

**Interactions:**
- **Added:** Springy card hover — `translateY(-4px) scale(1.02)` on hover, `scale(0.98)` on press
- **Added:** Noise/grain texture overlay on hero sections (inline SVG, no external file)
- **Added:** Scroll reveal animations with staggered delays via IntersectionObserver
- **Added:** Glass morphism nav (backdrop-blur + translucent bg)
- **Changed:** All transitions use `cubic-bezier(0.4, 0, 0.2, 1)` easing

**Pages Updated:**
- Homepage: noise-bg hero gradient, generous 32-40 padding, scroll reveal grid
- Browse: noise-bg filter bar, staggered card reveal
- Detail: rounded-3xl header card, accent CTAs, reveal sections
- Categories: card-hover + reveal on category cards
- Best-of: noise-bg header, accent rank badges, stagger reveal
- Search: glass input, accent buttons
- Submit: rounded-3xl form card, translucent inputs
- About: updated heading styles, accent links
- Nav: glass morphism, rounded-2xl mobile menu items
- Footer: generous 16px padding, display font branding

---

### Gap Analysis: Align Template with Haunted Places Learnings

Deep comparison of template vs battle-tested haunted-places project. Backported key patterns:

**Architecture:**
- **Changed:** Split monolithic `_shared.js` into modular `_shared/` directory (config, utils, layout, components, response). Barrel re-export preserves backward compat.
- **Changed:** Database schema enriched — added `content` (long-form), `city`, `state`, `address`, `latitude`, `longitude`, `sources` (JSON array), `source_count`. Location-ready from day one.
- **Added:** `submissions` table in initial migration (was a TODO — submit form now actually stores data)
- **Added:** API layer — `GET /api/items` (filters: category, state, city, search, pagination), `GET /api/items/[slug]`, `GET /api/categories`
- **Added:** `jsonResponse()` helper with CORS headers

**SEO & E-E-A-T:**
- **Added:** Source attribution section on detail pages (inline sources, count badge, methodology link)
- **Added:** Location display in detail sidebar with Google Maps link
- **Added:** Last Updated date in detail sidebar
- **Fixed:** Sitemap uses `updated_at` for lastmod (not `created_at`). Falls back to `2025-01-01` instead of today's date to prevent lastmod inflation.
- **Fixed:** Contact page email uses DOMAIN constant instead of `[DOMAIN]` placeholder
- **Added:** `public/_headers` — security headers, image caching, API CORS
- **Added:** `public/llms.txt` — AI crawler description
- **Added:** Plausible analytics snippet (commented out, ready to enable during setup)

**UX:**
- **Added:** Mobile hamburger menu with slide-out nav
- **Added:** Image dimensions (`width`/`height`) on all `<img>` tags for CLS prevention
- **Added:** "How We Research" link in footer trust nav
- **Added:** Search now includes `content` field (long-form text)
- **Changed:** Card component shows location (city, state) when available
- **Changed:** `truncate()` utility added for text excerpts

### Agent & Skill System Overhaul
- **Changed:** Agents from "advisors that recommend" to autonomous workers that check state and execute
- **Changed:** Agent boundaries — content (data+pages), product (UX+tools+delights), seo (technical only), marketing (distribution)
- **Changed:** Backlog from "work queue" to idea parking lot
- **Changed:** Skill names — design-system->tasty-design, coding-standards->project-architecture, optimize-seo->seo-audit, build-tool->mini-tools, cold-campaign->outreach, research-data->research-discovery
- **Added:** Content agent (owns data and content pages)
- **Added:** Marketing agent (owns distribution, outreach, partnerships, social)
- **Added:** 6 new skills — deep-research, delights, marketing-ideas, partnerships, programmatic-social, write-script
- **Removed:** Mini-apps agent (absorbed into Product)
- **Removed:** Outreach agent (replaced by Marketing)
- **Removed:** Bootstrap flow
- **Removed:** Skills — add-to-backlog, build-seo-page, query-data, verify-data
- **Removed:** STRUCTURE.md references
