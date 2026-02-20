# Context

Key decisions, insights, and lessons learned. Update when making significant decisions.

---

## 2026-02-19

### Migration from Custom SoccerBars to Directory Template

The old SoccerBars project had a custom codebase with non-standard routing (city-based instead of template's items-based), no agent system, and limited skill definitions. Rather than incrementally fixing it, we did a clean migration: clone the directory template, configure it for SoccerBars, and move just the data.

**Key decisions:**

**Reuse existing Cloudflare resources vs fresh:** Chose fresh D1/R2 with `-v2` suffix. The old infrastructure stays running until the domain is pointed at the new project. Zero downtime migration.

**CATEGORY_FIELD = 'city':** SoccerBars groups bars by city, not by type/category. Setting `CATEGORY_FIELD` to `city` makes the template's category system work as city grouping. The template's `/categories` page becomes a city index, which is the right mental model for this directory.

**Schema additions:** Added `city_slug`, `neighborhood`, `opens_early`, `website` as SoccerBars-specific columns. Kept template's `content`, `latitude`, `longitude`, `featured`, `updated_at` for future use (old SoccerBars didn't have these).

**Junction tables preserved:** `bar_teams` and `bar_leagues` give SoccerBars unique value — you can browse by team affiliation. These are SoccerBars-specific and not part of the base template schema.

**macOS case-insensitive filesystem gotcha:** `~/Desktop/soccerbars` and `~/Desktop/SoccerBars` are the same directory on macOS. Used `soccerbars-v2` as the directory name to avoid the collision.

---

### README as Living Doc

The README was bloated with maintenance-heavy lists (19-row pages table, 14-row skills table, agents table, SEO features list, commands, project structure). Every structural change required updating the README too. Decided: **the README is for the product story, not an inventory.**

New structure: Overview (what this directory is about), Taste (mood/palette/font), Product (features shipped), Agents (how the system works). First three are placeholders the setup agent fills during bootstrap; product agent updates the Product section as features ship. The Agents section is permanent since the agent system doesn't change per directory.

All the removed content already lives in CLAUDE.md (always-loaded context), agents (autonomous workers), and skills (detailed playbooks). Nothing was lost.

### Three Project Structures to Sync

Discovered that project structure is documented in three places: CLAUDE.md, `/project-architecture` skill, and README. When `robots.txt.js` and `llms-full.txt.js` were added to the codebase, they were missing from the skill. Rule going forward: structural changes update CLAUDE.md and `/project-architecture` (full trees), README just references the skill.

### Architecture Philosophy Belongs in the Skill

The architecture philosophy (simplest stack, config-driven, SSR over SPA, edge not server, no local dev) was only in the README. When we slimmed the README, it almost got lost. Moved it to `/project-architecture` skill where agents actually read it.

### Setup Agent Fills README

The setup agent now has step 3k to fill README placeholder sections (Overview, Taste, Product) during bootstrap. The product agent updates the Product section after shipping features. This keeps the README current without manual maintenance.

---

### Map Module — Split Rendering Pattern

The map feature uses a **split rendering pattern**: `renderMapToggle()` returns just the toggle buttons (placed inline in toolbars/headers), while `renderMap()` returns the container + data blob + client-side JS (placed after the grid). This prevents layout bugs — a 500px map container inside a flex toolbar would break the layout.

Both functions return `''` if no items have coordinates, so pages without geographic data show no toggle at all. Leaflet CSS/JS is loaded conditionally via `mapEnabled` in `renderHead()`, computed from `items.some(i => i.latitude && i.longitude)`.

**Client-side JS lives in the template literal** — the IIFE is embedded in `renderMap()` output. Key gotcha: template literal escaping for onerror handlers needs `\\\\'none\\\\'` to produce `\\'none\\'` in the browser. Pagination DOM lookup is lazy (inside `setView()`) because the map script tag appears before pagination in the DOM order.

### API Convention — States + Cities

Added `/api/states` and `/api/cities` following the same patterns as `/api/items` and `/api/categories`. All API endpoints: CORS headers, JSON responses, `limit`/`offset` pagination with `hasMore` meta, parsed `sources` JSON. City slug format is `city-name-state` (e.g., `austin-tx`), matching the SSR city detail page convention.

---

### SpookFinder Gap Closure — What to Keep Generic

Key decision: **not everything from SpookFinder belongs in the template.** Tours are haunted-place-specific. Easter eggs like cursor-following eyes are brand-specific. The template should adopt the *structural patterns* (geographic hierarchy, dense internal linking, multiple related sections) but not theme-specific features.

**What we adopted:** Geographic page hierarchy, 3-section related items pattern, client-side filtering, short-path category routes, services page type (generic, not "tours"), ambient effects system (toggleable), crew page.

**What we skipped:** Theme-specific easter eggs, Three.js particle effects, dark-only theme, SpookFinder's specific page designs. These are brand decisions, not template patterns.

**Services vs Tours:** Reframed "tours" as "services" — a generic related-businesses page type that works for any directory. A cafe directory might list coworking spaces. A trail directory might list guided hikes. The page type is the same; the content is topic-specific.

**Effects as opt-in:** Grain texture and parallax are disabled/enabled via `EFFECTS` config. Not every directory needs atmospheric effects — a tools directory probably doesn't want grain, but a food directory might. The infrastructure exists but defaults are conservative.

---

## 2026-02-18

### TBC Design System — Why The Browser Company

Researched The Browser Company's design language across Arc, Dia, and their brand. The core insight: **warmth over coldness**. Every TBC product uses warm cream backgrounds instead of pure white, warm dark brown text instead of black, and warm-tinted borders. This single shift transforms a generic directory into something that feels considered and premium.

**Key design decisions:**

**Warm cream background (`#FFFCEC`)** — The most impactful change. TBC never uses pure white. The cream creates an inviting, slightly vintage feel that makes the whole site feel intentional.

**Noise/grain texture** — TBC overlays a subtle noise pattern on colored sections. We use an inline SVG filter (no external file needed). Gives hero sections a tactile, paper-like quality.

**Translucent surfaces with backdrop blur** — Cards use `rgba(255,255,255,0.60)` + blur. Creates depth and layering without heavy shadows.

**Large border radii (20px cards, 28-40px heroes)** — Everything feels soft and touchable. No sharp corners. TBC uses 20-40px across all products.

**Springy hover interactions** — `translateY(-4px) scale(1.02)` on hover, `scale(0.98)` on press. Not linear transitions — uses `cubic-bezier(0.4, 0, 0.2, 1)`. The interface feels organic.

**Epilogue as display font** — TBC invests in distinctive display typefaces. Epilogue is free (Google Fonts) and has similar personality to their custom fonts (warm, geometric, confident). Body stays Inter.

**Accent blue (`#3139FB`)** — TBC's brand blue for CTAs and links. More vibrant and intentional than using the primary text color for buttons.

**Scroll reveal with IntersectionObserver** — Cards animate in with staggered delays as you scroll. Cascading flow creates the "interface that breathes" feeling TBC is known for.

---

### Gap Analysis: Template vs Haunted Places

Compared this template against the fully-built haunted-places project (SpookFinder, 1,332+ items, 30 states, live at spookfinder.com). The goal: make sure every new directory built from this template benefits from months of battle-tested learnings.

**Key decisions:**

**Modular shared code:** Split `_shared.js` into `_shared/` directory with 5 modules. Keeps barrel re-export for backward compat. This prevents the single-file-becomes-unmanageable problem that happened with SpookFinder's early architecture.

**Schema supports location from day one:** Added city, state, latitude, longitude, address even though not every directory is geographic. SpookFinder had to add these via migrations later — having them from the start means no painful ALTER TABLE when a directory inevitably needs location.

**Sources built into schema:** `sources` (JSON array) and `source_count` fields are in the initial migration. E-E-A-T signals (source attribution, methodology link, verified count) are now on detail pages. This was a major post-launch addition for SpookFinder.

**API layer from the start:** Added `/api/items`, `/api/items/[slug]`, `/api/categories` with CORS. SpookFinder needed 8 API endpoints for mini-tools and client-side filtering — having the base API from day one unblocks product features.

**SEO learnings baked in (not just documented):**
- Sitemap uses `updated_at` for lastmod, falls back to fixed date (never "today") — SpookFinder's traffic dropped when Google lost trust in inflated lastmod dates
- `_headers` file for security + caching from day one
- Image dimensions on all `<img>` tags (CLS fix)
- Footer includes "How We Research" trust nav link

**Submissions actually work:** The submit form now stores in a `submissions` table instead of console.log. Was a TODO since the template was created.

### Agent & Skill System Overhaul

Ported the proven agent/skill architecture from the haunted-places project. Key philosophy changes:

**Agents as autonomous workers:** Agents no longer wait for "build it" — they check state, present findings, recommend actions, and execute. This eliminates the back-and-forth "advisor mode" loop.

**New agent boundaries:**
- **Content** owns data + content pages (was split across SEO agent)
- **Product** owns UX + tools + delights (absorbed mini-apps)
- **SEO** is technical-only (no data responsibilities)
- **Marketing** owns distribution (replaced outreach with broader scope)

**Backlog as idea parking lot:** Agents discover work by checking state (querying DB, scanning files), not by pulling from a backlog. The backlog is just where ideas go so they don't get lost.

**No more bootstrap:** Removed the multi-phase bootstrap flow. Projects start by configuring directly.

**Key learnings:**
- Autonomous agents are more effective than advisor-mode agents
- Separating content (data) from SEO (technical) gives clearer ownership
- Marketing is broader than outreach — social, partnerships, creative ideas
- Skills should be concise and actionable, not comprehensive reference docs
