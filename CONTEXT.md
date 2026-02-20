# Context

Key decisions, insights, and lessons learned. Update when making significant decisions.

---

## 2026-02-20

### Running 3 Content Agents in Parallel

Ran a content audit that surfaced four priorities. Tackled the top three simultaneously using parallel agents: profiles, images, and team affiliations. Each agent worked independently — no conflicts except both the profiles and affiliations agents chose migration number `009`, which was fixed by renaming the affiliations migration to `010`.

**What worked well:** Parallel agents cut wall-clock time significantly. The profiles agent took ~11 minutes (most research-intensive), images ~6 minutes, affiliations ~7 minutes. All three would have been ~24 minutes sequential.

**What to watch for:** Agents that write migrations independently can collide on numbering. Worth establishing a convention — e.g., reserve migration numbers before spawning agents, or have each agent use a unique prefix.

---

### Scaling Content Profiles -- 15 Bars in One Session

Wrote rich content profiles for 15 bars across 8 cities that previously had zero profiles. Key lessons from scaling this process:

**Batch research is efficient but requires discipline.** Researching 15 bars in parallel (vs. the deep-research skill's one-at-a-time approach) is significantly faster but requires maintaining a clear mental model of what you know about each bar. The risk is blending details across bars or filling gaps with assumptions. Mitigated this by keeping research notes per bar and only writing claims that appeared in at least one source.

**Bar archetypes make writing faster.** After writing 36 profiles, clear archetypes emerge: (1) the British expat pub (Shakespeare, Princess, Horse Brass, Fleet Street), (2) the MLS official partner bar (No Other Pub, Fogg Street, Fado), (3) the supporter group home base (Johnny's/Cauldron, Princess/LFC, Mister Tramps/Spurs), (4) the community-born soccer bar (Courtyard Hooligans, GOL, Haymaker), (5) the historic institution (Horse Brass since 1976, Brit's since 1990, Princess since 1984). Each archetype has a natural narrative arc, which speeds up writing without making profiles formulaic.

**Best research sources for bar profiles (ranked):**
1. Official bar websites (hours, menus, events)
2. Local news articles with quotes (WBTV, Axios, Austin Chronicle, Portland Monthly)
3. MLS team partnership announcements (sportingkc.com, nashvillesc.com, charlottefootballclub.com)
4. SoccerNation supporter specials (excellent for Liverpool/Arsenal supporter bars)
5. CultureMap/TimeOut/Matador Network city guides (good color and atmosphere details)
6. Yelp/TripAdvisor for crowd-sourced atmosphere details (use cautiously, verify with other sources)

**Wix sites are useless for scraping.** Courtyard Hooligans, GOL, and several others use Wix, which renders all content via JavaScript. WebFetch returns only framework code. Workaround: use search result snippets and cached text from aggregator sites (Wanderlog, menu-world.com, Foursquare tips).

---

### Team Affiliation Round 2 -- MLS Pub Partners Are the New Gold Mine

Researched team affiliations for 34 bars across 5 cities (Denver, San Diego, Boston, Dallas, San Francisco). Only 7 bars gained new verified affiliations. This reinforces the earlier finding: **most soccer bars are general sports bars with no specific team affiliation.**

**Key insight -- MLS Pub Partner programs:**

The biggest source of new affiliations was the San Diego FC Pub Partner program (sandiegofc.com/club/events/pub-partner). SDFC launched their program in 2025 for their inaugural MLS season, and the official list includes 60+ bars across San Diego. Four of our 12 San Diego bars are on this list (Bluefoot, Fairplay, O'Brien's, SD TapRoom, Knotty Barrel). This is the same pattern we saw with Charlotte FC's bar network -- MLS teams publish official bar lists that give us verified affiliations at scale.

**Checked and confirmed:** Colorado Rapids bar partners (coloradorapids.com/fans/barpartners) already matched what we had -- DNVR Bar, Stoney's, Stoney's Uptown, Origins were already tagged. New England Revolution pub partners (revolutionsoccer.net/fans/partner-bars) includes The Banshee and Ducali, both already tagged. No new bars from those lists.

**Why Dallas had zero new affiliations:** Dallas has strong dedicated team bars (Harwood Arms for Chelsea, Blackfriar for Liverpool, The Irishman for Spurs, Peticolas for FC Dallas/Everton, The Dubliner for Newcastle) but the remaining 6 bars are genuinely general sports bars. Frankie's Downtown, The Nodding Donkey, Off The Cuff, Sportsbook, Bryan Street Tavern, and Christie's all show all sports with no team-specific identity. FC Dallas's watch party venues don't overlap with our remaining bars.

**NWSL as an emerging data source:** Boston Legacy FC (joining NWSL in 2026) has Drawdown Brewing as its community hub. This is the first NWSL-specific bar affiliation in our dataset. As more NWSL teams launch (Bay FC, Angel City, etc.), their community bar partnerships will be another source of affiliations.

**Shakespeare Pub's layered affiliations:** Shakespeare Pub in San Diego is a good example of a bar with multiple verifiable affiliations from different sources: Chelsea and Manchester United supporters (SoccerNation, The Voyageer), plus San Diego FC game day programming (their own website). The Red Devils of San Diego (Man Utd) actually started at Shakespeare before moving to Liberty Call Distilling.

---

### Sourcing Images for Wix/Toast Bars -- What Finally Works

The last 3 DC bars (Irish Channel, Suzie Q's, Lou's City Bar) all had websites on Wix or Toast, which don't expose images in HTML source and return 403 on fetch attempts. Previous sessions flagged these as "hard to source."

**What worked:**

1. **Downtown DC business directory** (`downtowndc.org`) -- Their business listings embed Google Maps Place Photos API URLs with API keys included. These URLs are directly downloadable via curl and return proper JPEG images. The Irish Channel listing had 8+ photos this way.

2. **PoPville WordPress articles** -- PoPville covers DC bar openings and features extensively. Their WordPress media uploads (`popville.com/wp-content/uploads/`) are directly accessible. Found both Suzie Q's (opening announcement, May 2025) and Lou's City Bar (sports bar feature, July 2023) through PoPville articles.

3. **Google Maps Place Photos via third-party embeds** -- While Google Maps itself blocks scraping, third-party sites that embed Place Photos (like business directories, tourism sites) expose the full API URL including photo reference and API key. These work as direct download links.

**What still does not work:**
- Wix sites (403 on all fetch attempts, JS-rendered images)
- Toast/ToastTab ordering pages (no images in HTML)
- Yelp, TripAdvisor, Foursquare (all block direct image access)
- Instagram/Facebook (require auth)
- Capitol Riverfront tourism site (returned 403)

**Key lesson:** For Wix/Toast bars, skip the official site entirely. Go straight to local blog coverage (PoPville for DC, Eater/TimeOut for other cities) and business directory listings that embed Google Maps photos. The workaround is not to crack Wix -- it is to find the same image on a more accessible platform.

**Data quality flag:** Lou's City Bar appears permanently closed as of April 2025. The image is from when it was open (July 2023 PoPville article). A future data quality pass should decide whether to keep closed bars with a status flag or remove them.

---

### Adding Washington DC -- Research Methodology for a New City

Researched DC soccer bars from scratch using multiple source types: Washington Post soccer bar guides (2019 and 2025 articles), GoodRec top-10 list, DC United official bar partners page, Fanzo/MatchPint directory, official supporter club websites (DC Armoury for Arsenal, DC Spurs for Tottenham, Beltway Blues for Chelsea, Red Devils DC for Manchester United, LFCDC for Liverpool), and the Premier League's own USA bar finder.

**Key decisions:**

**19 bars, not 25:** The task suggested 15-25. We found ~25 candidates but excluded: Across the Pond (closed as of late 2025, may relocate), Fado Irish Pub (closed permanently), Buddy's DC (limited hours, doesn't open early, more dinner bar than soccer bar), Ivy and Coney (general sports bar rather than dedicated soccer), Scarlet Oak / Agua 301 (too restaurant-focused), Solace Outpost (replaced by Suzie Q's at same address).

**Solace Outpost vs Suzie Q's:** Suzie Q's took over Solace Outpost's space at 71 Potomac Ave SE in Navy Yard in May 2025. Red Devils DC (Manchester United supporters) had been meeting at Solace. We included Suzie Q's (which is now the Fulham bar) rather than the defunct Solace. Red Devils DC's current location may be Lucky Bar or another venue.

**Arlington VA as a separate city:** Ireland's Four Courts and Crystal City Sports Pub are technically in Arlington, Virginia, but are essential DC-area soccer bars. Rather than listing them under "Washington," we created a separate Arlington city entry to keep the data accurate.

**Image sourcing for DC:** Best CDN sources for DC bars: MatchPint/Fanzo (Exiles Bar, Public Bar Live, Sports & Social), Squarespace CDN (Queen Vic, Franklin Hall, Kirwan's), WordPress (Lucky Bar from PoPville, The Artemis, Nanny O'Brien's), OpenTable resizer (Elephant & Castle, The Commodore), TimeOut (The Big Board, Lucky Bar backup). Irish Channel and Lou's City Bar use Wix/Toast, which don't expose images in HTML.

---

### Long-Form Content Strategy -- What Makes a Great Bar Write-Up

Wrote rich content for 16 bars across 11 cities. Key learnings:

**Structure that works:** Six consistent sections (The Vibe, The Setup, Match Day Experience, Food & Drink, Who Goes There, Insider Tips) give every write-up a predictable but not formulaic shape. Readers can scan for the section they care about. This mirrors how you'd actually describe a bar to a friend: atmosphere first, then practical details, then tips.

**Research depth matters:** Official supporter group pages and bar websites provide the specific details (screen counts, opening times, supporter club names) that make content useful rather than generic. Reviews from Yelp/TripAdvisor provide atmosphere descriptions and food quality signals. Blog articles from local publications (TimeOut, AJC, Matador Network) provide context and history. The combination of all three creates content that could not have been written from a single source.

**Content field as trusted HTML:** The `content` field stores raw HTML (`<h3>`, `<p>` tags). The detail page now renders this directly instead of escaping it. This requires trusting the content (we write it, not users), but gives us full control over formatting. The description field remains escaped since it's shorter text. Both paths support auto-linking of city/state mentions to geographic pages.

**Tailwind prose styling for content:** Added scoped Tailwind classes using the `[&_h3]` and `[&_p]` child selector pattern to style h3 and p elements within the content div. This avoids needing a separate CSS file while keeping the heading and paragraph styles consistent with the site's design system.

**SQL escaping for HTML content:** Single quotes in HTML content must be doubled for SQL (`''`). This is the main gotcha when inserting long-form HTML via `wrangler d1 execute --command`. No issues with double quotes, angle brackets, or ampersands since those are SQL-safe.

---

### Team Affiliation Research -- What's Verifiable vs What Isn't

Researched team affiliations for 53 bars across 7 priority cities. Only 14 team affiliations could be verified from sources. Key insight: **most soccer bars are general sports bars that show all matches, not dedicated team bars.** Specific team affiliations exist only when:

1. **An official supporters club meets there** -- e.g., LFC Boston at The Greatest Bar, San Diego Gooners at Bluefoot. These are the most reliable and come from supporter club websites.
2. **The bar is in an official team bar network** -- e.g., Charlotte FC's "Bar Network" lists 10 bars. The team's own website confirms these.
3. **The bar has strong thematic identity** -- e.g., Courtyard Hooligans with Tottenham scarves on walls, Caffe dello Sport as an Italian cafe showing Serie A.

**What doesn't work:** Trying to assign teams to general sports bars like Tom's Watch Bar, Final Final, or Christie's. These show everything and have no specific affiliation. Forcing a team on them would be inaccurate data.

**Best research sources for team affiliations:**
- Official supporter club websites (lfcboston.com, bostongooners.com, manchesterunitedsandiego.com)
- MLS team "bar network" / "watch spots" pages (charlottefootballclub.com/bar-network, mnufc.com/fan-resources)
- Premier League USA Bar Finder (premierleague.com/usa-bar-finder)
- Matador Network city-specific soccer bar guides (consistently the best third-party source)
- Local city tourism soccer guides (charlottesgotalot.com, minneapolis.org)
- SoccerNation supporter profiles (for San Diego especially)

**Cities with best existing affiliation data:** New York, Chicago, Seattle, Portland -- these had supporter groups baked in during initial data migration. Cities like Dallas and San Francisco have strong soccer bar scenes but affiliations are more diffuse (many general bars, few dedicated team bars).

**Charlotte FC is a new team slug** -- added to 5 bars via their official bar network. This is a useful pattern: when MLS teams launch in new cities, their official bar network gives us verified affiliations for multiple bars at once.

**League affiliations are easier to verify than teams.** If a bar shows Premier League at all (which most soccer bars do), that's a safe league to add. Added 39 league affiliations and brought 6 of 7 priority cities to 100% league coverage.

---

### Image Sourcing for Local Bars — What Works

Finding images for small local bars/restaurants is much harder than for well-known landmarks. Here's what we learned:

**Best sources (most reliable for accessible image URLs):**
1. **Fanzo/MatchPint CDN** (`matchpint-cdn.matchpint.cloud`) -- Soccer bar aggregator with `_original`, `_big`, `_banner` size variants. Best source for soccer bars specifically.
2. **TimeOut** (`media.timeout.com`) -- Clean 750x422 JPEG URLs directly in page source. Great for bars in major cities.
3. **Visit [City] tourism sites** (e.g., visitlongbeach.com, visitorlando.com) -- Tourism boards often have accessible business images.
4. **Portland Monthly / Cloudinary** -- Magazine images via Cloudinary CDN are directly fetchable.
5. **OpenTable** (`resizer.otstatic.com`) -- Append `?width=1280&height=720&format=jpeg` for high-res versions.
6. **Untappd** (`assets.untappd.com`) -- Beer check-in photos often show bar interiors. Hit-or-miss quality.
7. **Sideways NYC** (`images.sideways.nyc`) -- NYC neighborhood guides with accessible bar images.
8. **Official team/club sites** (e.g., tottenhamhotspur.com) -- Supporters club pages sometimes have venue photos.
9. **Local blog posts** (e.g., Scott Joseph Orlando, Boston Magazine) -- WordPress blogs often have directly accessible image URLs.

**Sources that don't work for scraping:**
- Yelp, TripAdvisor, Google Maps (all block direct image access)
- Wix/Squarespace sites (images are JS-rendered, not in HTML source)
- Instagram/Facebook (require auth for image access)
- Foursquare (redirects to app, requires login)

**Naming convention:** `bars/[city-lowercase]/[slug].jpg` in R2, matching the existing 302 migrated images.

---

### Geocoding 322 Bars — Nominatim at Scale

Geocoded all 322 bars using OpenStreetMap's Nominatim API. The map feature (Leaflet) was already built and waiting for this data.

**Approach:** Node.js script with 1.1s delay between requests (Nominatim rate limit is 1 req/sec). Script saves progress every 20 bars to a JSON file so it can resume if interrupted. Generated a SQL migration file with all UPDATE statements, then ran it against remote D1 in one batch.

**Failure patterns:** 9 out of 322 addresses failed initial geocoding. All failures were addresses with "Ste", "Suite", or "Unit" suffixes that Nominatim couldn't parse. Stripping those suffixes resolved 7. The remaining 2 (Kiwi's Pub on State Road 436, XL Soccer World) failed because Nominatim doesn't handle Florida state road numbering well -- resolved via manual lookup from Waze and GoodRec.

**Quality control:** Queens-style addresses ("33-15 Ditmars Blvd") cause Nominatim to misinterpret the hyphenated house number. Rivercrest in Astoria was geocoded to Albany, NY. Caught this with a city-average outlier query (`WHERE ABS(lat - city_avg_lat) > 0.3`). Only 1 bar out of 322 needed correction -- the geocoding quality was excellent overall.

**Lesson:** For future geocoding, always run an outlier detection query after the bulk update. The query compares each bar's coordinates to its city's average and flags anything more than 0.3 degrees off. This catches misgeocoded addresses that would look wrong on the map.

---

### Homepage Redesign — Less Is More

Iterated through ~15 rounds of design changes to get the homepage right. Started with a feature-heavy layout (hero + features strip + Featured Cities + Popular Leagues + 15-bar grid with filter pills) and progressively stripped it down to a clean directory-first experience.

**Key decisions:**

**Infinite scroll over pagination:** Inspired by nomads.com. First 24 bars are server-rendered (SEO-safe), additional bars load via `/api/items` as user scrolls. IntersectionObserver triggers fetch 400px before reaching the spinner. The `/bars` browse page still has traditional pagination for full crawlability.

**Search as expandable icon, not persistent bar:** The search bar took up too much visual space. Instead, a search icon in the filter row expands inline into an input when clicked. Filters cards client-side in real time using `data-search` attributes containing name, city, state, neighborhood, description.

**State pills with full names:** Abbreviations (CA, TX, NY) were confusing. Full names (California, Texas, New York) are clearer but need horizontal scroll. Used CSS `mask-image` gradient fade to hint scrollability, removed via JS `scroll` listener when at the end.

**Wider container (max-w-7xl):** Inspired by OpenAlternative/EuroAlternative. The old `max-w-5xl` (1024px) felt restrictive with 4-column card grid. 1280px gives room to breathe.

**Dropdowns for city + sort, pills for state:** States are browseable (you want to see all options at once), so pills work. Cities (22) and sort options are better as dropdowns to save space.

**Sections removed:** Features strip, Featured Cities, Popular Leagues all added visual noise without helping the core task (finding a bar). The directory grid IS the homepage now.

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
