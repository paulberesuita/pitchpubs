# Changelog

What we shipped. Update after each feature.

---

## 2026-02-20

### Session: Content Quality Sweep (3 parallel workstreams)

Ran a full content audit and executed three priorities in parallel:

1. **15 rich profiles written** — Top 1-2 bars in all 8 cities that had zero content (Charlotte, Columbus, Portland, Kansas City, Austin, Nashville, San Diego, Minneapolis). Content coverage: 21 → 36 bars, 0 cities with 10+ bars and no profiles.
2. **3 DC bar images found** — Irish Channel, Suzie Q's, Lou's City Bar. Image coverage: 338 → 341 (100%). Lou's City Bar flagged as possibly closed.
3. **12 team affiliations added** — San Diego FC pub partners (5 bars), Chelsea/Man Utd supporter bars in Denver/SF/San Diego, Boston Legacy FC (NWSL). Team coverage: 233 → 245 bars (72%).

**Migrations:** `009_content_15_bars.sql`, `010_fill_team_affiliations_round2.sql`

---

### Rich Content Profiles for 15 Bars Across 8 Cities

**Added:**
- Detailed 200-400 word write-ups for 15 bars across 8 cities that previously had zero content profiles
- All profiles follow the established 6-section format: The Vibe, The Setup, Match Day Experience, Food and Drink, Who Goes There, Insider Tips
- Content stored in `bars.content` field as structured HTML
- All content sourced from official websites, news articles, supporter club sites, and verified reviews

**Bars with new content by city:**
- Charlotte: Courtyard Hooligans -- Charlotte's OG soccer bar since 2009, Save The Crew era David Tepper visit
- Columbus: Fado Irish Pub (Easton) -- Four authentic Irish interiors, Crew Pub Network; Endeavor Brewing -- Save The Crew movement HQ, Columbus's only brewstillery
- Portland: GOL Soccer Bar -- Dedicated soccer bar since 2019 on Hawthorne; Horse Brass Pub -- Portland institution since 1976, Don Younger's craft beer pioneer pub
- Kansas City: No Other Pub -- Official 21,000 sqft Sporting KC bar with bowling/gaming; Johnny's Tavern -- Cauldron and American Outlaws home base
- Austin: Haymaker -- Austin Chronicle Best Sports Bar 2023/2024, American Outlaws HQ; Mister Tramps -- Scottish-owned Tottenham bar with soccer field floor since 2009
- Nashville: Fogg Street Lawn Club -- Official Nashville SC pub with rooftop lawn bowling; Fleet Street Pub -- Manchester-born owner's underground English pub on Printers Alley
- San Diego: Shakespeare Pub -- British expat institution since 1990, Best Fish & Chips in USA 2017; Princess Pub -- San Diego's original British pub since 1984, Scouse-owned Liverpool FC home
- Minneapolis: Brit's Pub -- 30+ year institution with rooftop lawn bowling, Pub of Year 2025; The Local -- 11,000 sqft Irish pub, world's #1 Jameson seller four years running

**Content coverage:**
- Before: 21 bars with content across 15 cities
- After: 36 bars with content across 23 cities
- All 8 target cities went from 0 profiles to 1-2 profiles each

**Migration:** `009_content_15_bars.sql`

---

### Team Affiliation Round 2 -- 7 Bars in 4 Cities + 2 New MLS/NWSL Teams

**Added:**
- 12 new team affiliations across 8 bars in 4 cities:
  - Denver: The British Bulldog (Chelsea FC via Rocky Mountain Blues)
  - San Diego: Shakespeare Pub (Chelsea FC, Manchester United, San Diego FC), Fairplay (San Diego FC), SD TapRoom (San Diego FC), Knotty Barrel (San Diego FC), Bluefoot Bar (San Diego FC), O'Brien's Pub (San Diego FC)
  - Boston: Drawdown Brewing (Boston Legacy FC)
  - San Francisco: Mad Dog in the Fog (Chelsea FC via SF Bay Area Blues)
- 2 new teams added to teams table: San Diego FC (MLS), Boston Legacy FC (NWSL)
- San Diego FC pub partner affiliations verified from official sandiegofc.com/club/events/pub-partner page

**Research methodology:**
- Verified Rocky Mountain Blues as official Chelsea FC supporters at British Bulldog (rockymountainblues.wordpress.com)
- Shakespeare Pub confirmed as Chelsea/Man Utd home bar via SoccerNation and The Voyageer
- San Diego FC Pub Partner list scraped from official SDFC website -- 4 bars in our DB are partners
- Mad Dog in the Fog confirmed as SF Bay Area Blues (Chelsea) home via premierleague.com USA Bar Finder
- Drawdown Brewing confirmed as Boston Legacy FC hub via Matador Network and NWSL Boston ISA events
- 26 bars in Dallas, Denver, Boston, SF researched with no verifiable team affiliation -- documented as general sports bars in migration comments

**Team coverage by city (before -> after):**
| City | Before | After |
|------|--------|-------|
| San Diego | 42% (5/12) | 75% (9/12) |
| San Francisco | 45% (5/11) | 55% (6/11) |
| Denver | 43% (6/14) | 50% (7/14) |
| Boston | 36% (4/11) | 45% (5/11) |
| Dallas | 45% (5/11) | 45% (5/11) -- no new affiliations found |

**Overall:** 233 bars with teams -> 245 bars with teams (72% of 341)

**Migration:** `009_fill_team_affiliations_round2.sql`

---

### Final 3 DC Bar Images -- 100% Coverage Maintained at 341 Bars

**Added:**
- Images for the last 3 Washington DC bars that were missing images:
  - Irish Channel (Chinatown) -- exterior photo from Downtown DC / Google Maps Place Photos showing the burgundy awning and brick building on H Street
  - Suzie Q's (Navy Yard) -- exterior photo from PoPville showing the "Cold Beer Suzie Q's Sold Here" signage with outdoor picnic tables
  - Lou's City Bar (Columbia Heights) -- Arsenal supporters match day atmosphere photo from PoPville showing packed bar watching soccer on big screens
- 3 new images uploaded to R2 bucket `soccerbars-v2-images` at `bars/washington/`

**Image coverage:** 341/341 bars (100%) -- zero bars missing images across the entire database

**Sources:**
- Irish Channel: Downtown DC business directory (Google Maps Place Photos CDN)
- Suzie Q's: PoPville opening announcement article (May 2025)
- Lou's City Bar: PoPville sports bar feature article (July 2023, photo credit Joe Newman)

**Note:** Lou's City Bar appears to have permanently closed as of April 2025 per PoPville reporting. May need to be flagged or removed in a future data quality pass.

---

### Washington DC & Arlington -- 19 Soccer Bars Added

**Added:**
- 19 soccer bars across Washington DC (17) and Arlington, VA (2)
- Washington DC and Arlington added to the cities table
- 2 new cities: Washington (DC) and Arlington (VA)
- 16 of 19 bars have images (84% coverage) uploaded to R2
- All 19 bars geocoded with coordinates for map view
- 38 team affiliations including DC United, Arsenal, Liverpool, Tottenham, Chelsea, Manchester United, FC Barcelona, Fulham, Crystal Palace
- 86 league affiliations (Premier League, MLS, Champions League, La Liga, Serie A, Bundesliga, FIFA World Cup, GAA)

**Notable DC bars:**
- Lucky Bar (Dupont Circle) -- THE legendary DC soccer bar, Arsenal/Man United/Man City
- The Queen Vic (H Street) -- Official Liverpool FC bar
- Exiles Bar (U Street) -- Liverpool FC watch bar
- Franklin Hall (U Street) -- Official Arsenal bar, DC Armoury home pub
- Irish Channel (Chinatown) -- Official Tottenham Spurs bar, DC Spurs home
- The Artemis (Columbia Heights) -- Premier soccer bar with 20 HD TVs
- Elephant & Castle (Downtown) -- FC Barcelona supporters, British pub
- Ireland's Four Courts (Arlington) -- Named top 100 soccer bar by Men in Blazers, Chelsea/Crystal Palace
- Suzie Q's (Navy Yard) -- Fulham FC supporters bar

**Data quality:**
- All bars have 3-5 verified sources (Washington Post, Fanzo, GoodRec, DC United, supporter club sites)
- 10 bars confirmed as opening early for morning Premier League matches
- Total bar count: 322 -> 341

**Migrations:**
- `004_washington_dc_bars.sql` -- 19 bars, team/league affiliations, cities
- `005_geocode_dc.sql` -- Coordinates for all 19 bars
- `006_dc_images.sql` + `007_dc_images2.sql` -- Image URL updates

---

### Rich Long-Form Content for 16 Iconic Soccer Bars

**Added:**
- Detailed 200-400 word write-ups for 16 bars across major cities, covering: The Vibe, The Setup, Match Day Experience, Food & Drink, Who Goes There, and Insider Tips
- Content stored in `bars.content` field as structured HTML with `<h3>` subheadings and `<p>` paragraphs
- All content sourced from official websites, reviews, articles, and supporter group pages

**Bars with new content:**
- Atlanta: Brewhouse Cafe (id 1) -- America's Best Soccer Bar per Men in Blazers
- Boston: The Banshee (id 71) -- Boston's #1 soccer bar
- Chicago: AJ Hudson's Public House (id 268) -- Chicago's original soccer pub since 1992
- Denver: The Celtic on Market (id 297) -- 40+ screens, 12+ supporter clubs
- Houston: The Phoenix on Westheimer (id 112), Social Beer Garden HTX (id 111)
- Los Angeles: Joxer Daly's (id 124), Lucky Baldwin's Pub (id 127)
- New York: Football Factory at Legends (id 157), Smithfield Hall (id 158), Banter Bar (id 176)
- Orlando: Harp & Celt Irish Pub (id 285), Murphy's Pub Orlando (id 286)
- Philadelphia: Cavanaugh's Headhouse (id 21)
- San Francisco: Danny Coyle's (id 47)
- Seattle: The Atlantic Crossing (id 59)

**Changed:**
- Detail page (`functions/bars/[[slug]].js`) now renders `content` field as trusted HTML instead of escaping it, with Tailwind prose styling for `<h3>` and `<p>` elements
- Description fallback still escaped for safety
- Auto-linking of city/state mentions works in both HTML content and plain description modes

---

### Fill Team & League Affiliations for Priority Cities

**Added:**
- 14 new team affiliations across 12 bars in 4 cities:
  - Boston: The Greatest Bar (Liverpool FC via LFC Boston)
  - Charlotte: Courtyard Hooligans (Tottenham Hotspur, USMNT), Big Ben (Crystal Palace, West Ham United), The Workman's Friend (Charlotte FC), Kilted Buffalo (Charlotte FC), HopFly Brewing (Charlotte FC), Salud Beer Shop (Arsenal FC), Gin Mill South End (Charlotte FC), Queen Park Social (Charlotte FC)
  - Minneapolis: The Local (Minnesota United FC), Kieran's Irish Pub (USMNT)
- Charlotte FC added as new team slug in bar_teams (5 bars in Charlotte FC bar network)
- 39 new league affiliations across 29 bars in all 7 priority cities
- League coverage in priority cities jumped to 100% for 6 of 7 cities (Boston at 82%)

**Research methodology:**
- Verified affiliations from official supporters club websites (lfcboston.com, charlottefootballclub.com/bar-network)
- Cross-referenced Premier League USA Bar Finder, Matador Network city guides, local news articles
- Used `INSERT OR IGNORE` to safely handle any existing data
- Documented unverified bars with comments explaining why no affiliation was added

**Migration:** `004_fill_team_affiliations.sql`

**Team coverage by city (before -> after):**
| City | Before | After |
|------|--------|-------|
| Charlotte | 25% (4/16) | 75% (12/16) |
| Minneapolis | 33% (3/9) | 56% (5/9) |
| Boston | 27% (3/11) | 36% (4/11) |

**Overall:** 211 bars with teams -> 222 bars with teams (69% of 322)

---

### 100% Image Coverage -- All 20 Missing Bar Images Uploaded

**Added:**
- Images for all 20 bars that were missing images, bringing coverage from 93.8% (302/322) to 100% (322/322)
- 20 new images uploaded to R2 bucket `soccerbars-v2-images`

**Bars with new images:**
- Boston: The Greatest Bar (from Discotech)
- Houston: Ron's Pub (from TripAdvisor CDN), Social Beer Garden HTX (from 365 Things Houston)
- Los Angeles: La Chuperia (from Fanzo/MatchPint CDN), Rock & Reilly's (from TimeOut), Shannon's On Pine (from Visit Long Beach), Springbok Bar & Grill (from TimeOut), Trademark Brewing (from Visit Long Beach), Wirtshaus (from TimeOut)
- New York: Flannery's Bar (from Tottenham Hotspur official), Football Factory at Legends (from Sideways NYC), New York Beer Company (from MurphGuide)
- Orlando: Burton's Thornton Park (from Downtown Orlando), Fixtion (from OpenTable), The Castle Irish Pub (from Scott Joseph Orlando), The Sideline at XL Soccer World (from Fanzo/MatchPint CDN), Yard Bar (from Untappd)
- Portland: Calcio Soccer Bar (from Untappd), GOL Soccer Bar (from Portland Monthly/Cloudinary)
- Somerville: Parlor Sports (from Boston Magazine)

**Image naming convention:** `bars/[city-lowercase]/[slug].jpg` matching existing pattern

---

### Fix League Name Duplicates

**Fixed:**
- Standardized "Champions League" (17 rows) to "UEFA Champions League" -- was showing as two separate leagues
- Standardized "Major League Soccer" (4 rows) to "MLS" -- was showing as two separate leagues

---

### Geocode All 322 Bars

**Added:**
- Latitude and longitude coordinates for all 322 bars (100% coverage, was 0%)
- Migration `003_geocode_bars.sql` with 322 UPDATE statements
- Geocoding script `scripts/geocode_bars.mjs` using Nominatim/OpenStreetMap API
- Retry script `scripts/geocode_retry.mjs` for handling addresses with suite/unit numbers

**Fixed:**
- Rivercrest (Astoria, Queens) was geocoded to Albany, NY due to Queens-style "33-15" address format -- corrected to proper Astoria coordinates

**Data quality:**
- All coordinates verified within continental US bounds (lat 25.75-47.68, lng -122.75 to -71.05)
- Outlier detection run: only 1 bar needed correction out of 322
- 313 bars geocoded on first pass, 7 on retry with simplified addresses, 2 manually looked up

---

### Homepage Redesign — Minimalist Directory Layout

**Added:**
- Infinite scroll on homepage — loads 24 bars at a time via `/api/items` endpoint as user scrolls
- City dropdown filter — all 22 cities with bar counts
- Order by dropdown — Latest, Name (A to Z), Name (Z to A)
- State filter pills with full state names (California, not CA) in horizontal scrollable row
- Scroll fade hint on pills row — gradient fades out at right edge, disappears when fully scrolled
- Expandable inline search — search icon expands to input field, filters cards in real time client-side
- Sort support added to `/api/items` endpoint (latest, az, za)

**Changed:**
- Container width expanded from `max-w-5xl` (1024px) to `max-w-7xl` (1280px) across all pages
- Grid changed from 3 columns to 4 columns on desktop
- Hero simplified — removed search bar, just headline + tagline
- Removed features strip, Featured Cities section, Popular Leagues section from homepage
- Removed border under navigation header
- Reduced spacing between hero and directory listings
- Nav links simplified: Browse, Cities, Leagues, About (removed States, Categories)
- Custom dropdown chevrons with proper spacing (replaced cramped native carets)
- Replaced pagination with infinite scroll

**Removed:**
- Features strip section
- Featured Cities cards section
- Popular Leagues cards/pills section
- Server-side pagination on homepage

---

## 2026-02-19

### SoccerBars Migration to Directory Template

**Added:**
- Fresh Cloudflare infrastructure: Pages project (`soccerbars-v2`), D1 (`soccerbars-v2-db`), R2 (`soccerbars-v2-images`)
- SoccerBars schema: `bars` table with `city_slug`, `neighborhood`, `opens_early`, `website` columns
- Junction tables: `bar_teams`, `bar_leagues` for team/league affiliations
- Lookup tables: `cities` (with World Cup host flag), `teams`
- Soccer bar design: pitch green accent (`#166534`), Epilogue/Inter fonts
- SoccerBars content: homepage hero, about page, FAQ, llms.txt

**Changed:**
- Template table `items` renamed to `bars`
- Template folder `cafes/` renamed to `bars/`
- `CATEGORY_FIELD` set to `city` (geographic directory, not category-based)
- `SCHEMA_TYPE` set to `BarOrClub`

**Migrated:**
- 322 bars from old SoccerBars D1 (was 310 at plan time, grew to 322)
- 284 bar-team affiliations
- 436 bar-league affiliations
- 21 cities and 49 teams
- 302 images from old R2 bucket

---

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
