# Context

Key decisions, insights, and lessons learned. Update when making significant decisions.

---

## 2026-02-26

### New-Directory Template Audit -- Preview Domains in Structured Data Are the Biggest SEO Risk

Comparing soccerbars-v2 against the new-directory template revealed that the most dangerous gap was preview deploy URLs leaking into JSON-LD structured data. Cloudflare Pages generates unique preview URLs like `f38e74f7.soccerbars-v2.pages.dev` for every deploy. If Google crawls these (and it does -- they're publicly accessible), it indexes non-canonical domain references in structured data, diluting the production domain's authority.

**The fix is a single IIFE in `renderHead`.** It detects the request origin, compares it to `PROD_BASE`, and does a global string replace on the serialized JSON-LD. This is more robust than requiring every page to use `PROD_BASE` manually in JSON-LD objects (which was the old approach and was inconsistently applied). The same `toProd()` helper rewrites `rel prev/next` pagination URLs.

**`nofollow` on external links is the second-biggest win.** With ~490 bars each potentially having a `source_url`, the site was passing link equity to hundreds of external bar websites through "Visit Website" CTAs, sidebar links, and source citation links. Adding `rel="nofollow"` to all of these keeps authority within the site. The template had this from the start.

**`noindex` on 404 responses prevents thin content indexing.** The site generates 404 responses for invalid slugs (e.g., `/bars/does-not-exist`). Without `noindex`, these could be indexed as real pages with thin content. The middleware now also intercepts Cloudflare's default 404 and serves the custom branded page instead.

**`stale-while-revalidate` is a free performance win.** The old 5-minute `max-age` meant frequent origin hits. The new `max-age=3600, stale-while-revalidate=86400` serves cached content for 1 hour, then serves stale content for up to 24 hours while revalidating in the background. Users never see a slow page, and origin load drops significantly.

**Homepage FAQ puts FAQPage schema on the highest-authority page.** The existing `/faq` page had FAQPage schema, but that page has low authority. Moving FAQ content (with schema) to the homepage gives Google the richest structured data on the page that ranks highest. The dedicated `/faq` page is kept for users who navigate there directly.

**Pattern established: template as audit baseline.** The new-directory template should be the reference for any new SEO or infrastructure patterns. When the template gets a new feature, check if existing directories need it too.

---

## 2026-02-22

### Salt Lake City Deep Research -- Utah's Unique Bar Culture Shapes a Distinctive Soccer Ecosystem

Salt Lake City has 11 soccer bars that split into four distinct tiers by soccer identity:

**Tier 1: Bars with verified EPL supporter club affiliations.** Fiddler's (Utah Gooners / Arsenal, listed on arsenal.com), Legends Pub & Grill (SLC Spurs / Tottenham, listed on tottenhamhotspur.com), Beer Bar (AO Salt Lake City / USMNT+USWNT, Manchester City, Everton). These three bars have formal supporter club ties verified through official club directories. The SLC Spurs are one of 106 new Official Supporters' Clubs welcomed in the most recent intake, making them among the newest Tottenham chapters in the US.

**Tier 2: Official RSL Pub Partners with strong soccer identity.** Dick N' Dixie's (RSL players visit after home games -- the only bar in SLC with a player-presence claim), Piper Down Pub (Irish Times Best Irish Pub in the World competition, official RSL Pub), Poplar Street Pub (RSL Soapbox calls it "Salt Lake's truest soccer bar," scarves on walls), Shades Brewing (RSL watch parties with $5 pizza/$3 beer specials). These bars are designated RSL Pubs or have deep soccer culture without formal EPL supporter clubs.

**Tier 3: Large venues with soccer programming.** Flanker Kitchen (60+ screens, 630 capacity, Carver Road Hospitality chain), Gracie's (35 screens, 295 seats, official RSL watch party location). These are premium sports bars that accommodate soccer within a broader entertainment concept.

**Tier 4: European-identity pubs with soccer ties.** The Bruce Scottish Pub (only Scottish pub in Utah, Champions League events, opened April 2024), The Green Pig Pub (World Cup viewing destination, 10 screens, award-winning rooftop). These bars have European DNA that aligns with soccer culture but lack formal supporter club affiliations.

**Utah's liquor laws shape the soccer bar landscape in unique ways.** Legends Pub & Grill is notable as one of the few family-friendly soccer bars in the state -- minors are welcome with an accompanying adult, which is unusual given Utah's strict licensing environment. Shades Brewing is 21-plus due to brewery licensing, with limited hours (closing at 7 PM most weekdays) that restrict its viability for early-morning EPL matches. The Bruce Scottish Pub operates under restaurant licensing that allows broader hours. These licensing nuances mean fans must choose their venue based on kickoff time, family needs, and drink preferences in ways that don't apply in most other US cities.

**The Ty Burrell / Beer Bar connection is the most celebrity-backed soccer bar in the database.** Beer Bar at 161 E 200 South is co-owned by actor Ty Burrell (Phil Dunphy on Modern Family) alongside extended family members. It opened in April 2014 as a sister concept to the cocktail bar Bar X, with a menu developed by chef Viet Pham (Food & Wine Best New Chef 2011). The German beer hall atmosphere -- communal tables, 150+ beers, gourmet bratwursts -- gives AO Salt Lake City watch parties a distinctly Continental feel unlike any other American Outlaws chapter venue in the database.

**Piper Down's naming story is the most Utah-specific origin in the database.** The founders wanted to name the bar "Temple Bar" after Dublin's famous district. Utah state officials (many Mormon) blocked the name because "temple" refers to LDS houses of worship. The founders pivoted to "Piper Down" but defiantly named an interior room "Temple Bar" anyway. This conflict between Utah's dominant religious culture and its bar scene is a recurring theme -- it explains why family-friendly licensing at Legends matters, why brewery hours at Shades are restricted, and why having an Irish pub named after Irish geography was seen as culturally provocative.

**Bridget Gordon's Green Pig Pub is the most bootstrapped bar in our database.** She mortgaged her house, sold her car and motorcycle, completed construction in 10 weeks, then worked 18-hour shifts seven days a week for nine months without a day off. The bar's furniture, glassware, and bar counter are relics from the closed Port O'Call nightclub where she bartended for 12 years. Former Mayor Ralph Becker praised the pub's eco-friendly construction at the grand opening. The rooftop patio, voted Best Patio by City Weekly, overlooks the Wasatch Mountains -- a viewing experience unique to Salt Lake City among all bars in our database.

**Dick N' Dixie's player connection is unique.** Co-owner Will Bourne told the Salt Lake Tribune that RSL players regularly visit after home games: "You almost always see one or more of them after a home game." No other bar in our 489+ bar database has a documented claim of regular player visits from their local MLS team. This transforms a dive bar with no food kitchen and a jukebox into one of the most authentic soccer gathering spots in the city.

---

### Cincinnati Deep Research -- FC Cincinnati's Match Day Ecosystem is the Most Structured in MLS

Cincinnati has 10 soccer bars that map cleanly onto three tiers by their relationship to FC Cincinnati's match day rituals:

**Tier 1: Match day infrastructure.** Northern Row (The Pride's home, March departure point since 2021), Samuel Adams Taproom (Die Innenstadt + The Briogaid staging ground), The Pitch (purpose-built soccer bar across from TQL, Cincy Gooners + Queen City Mafia home), Rhinehaus (5 EPL supporter groups, FC Cincinnati Pub Partner, opens 7 AM weekends). These four bars are formally embedded in FC Cincinnati's supporter culture and The March pregame tradition.

**Tier 2: Authentic pubs with organic soccer identity.** Hap's Irish Pub (family-owned since 1974, opens 7:45 AM for EPL, cash only, proper Guinness), Nicholson's Pub (founded 1997, Cincinnati's first gastropub, 200+ scotch whiskies, Cafe Royal Circle Bar-inspired), O'Malley's in the Alley (second oldest bar in Cincinnati, since 1892, former speakeasy, European atmosphere), The Pub at Rookwood (Premier League mural, same ownership as Nicholson's, early openings on request). These are venues where soccer viewing grew naturally from British/Irish pub DNA rather than supporter club affiliation.

**Tier 3: Neighborhood bars with soccer programming.** Higher Gravity (400+ beers, all EPL shown, Northside craft beer culture, BYOF), Second Place (Littlefield team's second concept, tin ceilings/exposed brick, bourbon slushies, 4 TVs). These bars show soccer as part of a broader sports and community identity.

**The March is the most structured pregame tradition we've documented.** Seven supporter groups depart from designated bars (Northern Row, Samuel Adams, OTR Stillhouse, Holiday Spirits, Symphony Hotel, The Pitch) and converge at Findlay Market ~70 minutes before kickoff. The Corteo at Washington Park includes coordinated chanting, drumming, and smoke before the final procession to TQL Stadium via 14th Street. This level of formalized, multi-bar coordination exceeds what we've seen in Atlanta, Portland, or Seattle.

**The Bailey at TQL Stadium is designed to amplify supporter culture.** The 3,100-capacity safe-standing section sits at a 34-degree angle at the stadium's north end. Nine recognized supporter groups (under The Incline Collective umbrella) coordinate tifos, chants, and blue-and-orange smoke. TQL Stadium won a Global "Best Venue" Award, partly because of this supporter section design.

**Cincinnati's geographic layout creates natural bar corridors.** OTR bars (Rhinehaus, Northern Row, The Pitch, Samuel Adams) cluster along the route from Findlay Market to TQL Stadium. Hyde Park bars (Hap's, The Pub at Rookwood) serve eastern suburban fans. Northside bars (Higher Gravity, Second Place) serve the creative/artistic neighborhood. Downtown bars (Nicholson's, O'Malley's) fill the center. This is the most geographically diverse soccer bar distribution we've mapped in a mid-size city.

**Source quality was excellent.** Key sources: Cincinnati Soccer Talk match day guides (2021, 2023), The Pride website (TQL Stadium guide, Northern Row partnership announcement), CityBeat (The Pitch opening, Second Place profile, pub roundups), Cincinnati Refined (9 Premier League bars guide), Ticketmaster FC Cincinnati supporters page (Die Innenstadt, The Pride, The Briogaid details), Scarves & Spikes (away day recommendations), Haus & Home Magazine (Nicholson's profile), newsrecord.org (The Pub soccer/rugby coverage), Soapbox Media (Higher Gravity + Second Place openings), Visit Cincy (FC Cincinnati locals guide).

---

### St. Louis Deep Research -- America's Original Soccer Capital with the Deepest Supporter Infrastructure in MLS

St. Louis has 10 soccer bars that reveal the most layered supporter ecosystem of any MLS market in our database. The city's soccer culture predates every other American city -- the first reported game was played in 1875, The Hill neighborhood produced six members of the 1950 World Cup team, and SLU has 10 NCAA men's soccer championships. When CITY SC launched in 2023, it did not create soccer culture in St. Louis; it gave existing culture a professional home.

**The match-day corridor is the most concentrated soccer zone in our database.** Within a few blocks of Energizer Park in Downtown West, four bars form an integrated match-day experience: Schlafly Tap Room (north, Louligan Street block party), The Pitch (southeast, 6:30 AM EPL openings), Maggie O'Brien's (south, since 1979), and Beffa's (west, STL Santos gathering point, since 1898). No other MLS stadium has this density of distinct, long-established bars within walking distance.

**The St. Louligans are the most well-documented supporter group in our database.** Founded in 2010 by Mitch Morice and Brad DeMunbrun from seven fragmented groups, they have a permanent street sign (Louligan Street), a brewery collaboration (Brewligans IPA with 2nd Shift Brewing), a match-day beer (Supporter's Session with Schlafly), an annual charity match, a podcast, and over $60,000 raised for local charities in a single season. Their skull-and-crossbones flag inspired by FC St. Pauli reflects an independent, community-first ethos unique among American supporter groups.

**STL Santos is the most distinctive Hispanic supporter group in our database.** Led predominantly by Hispanic and Latina women, they bring luchador masks, Latin food, music, and merch to Beffa's before marching to the stadium. Their presence at a fourth-generation family-owned tavern established in 1898 creates a match-day scene that bridges St. Louis's immigrant history with its present.

**Amsterdam Tavern (est. 2008) is the pre-MLS anchor.** Home to American Outlaws STL (29th chapter, est. 2010) and nominated for America's Best Soccer Bar by Men in Blazers, it has been the primary soccer bar for nearly two decades. Its partnership with The Dam restaurant (food next door, beer at Amsterdam) is a unique model we have not seen elsewhere. Co-owner Jeff Lyell's quote captures its identity: "The thing that makes us different is that everyone comes to our bar and we show all the matches, and everybody gets along."

**Llywelyn's is the only bar in our database hosting both an EPL and a Bundesliga supporter group.** Gateway Gooners (Arsenal) and Mia San STL (Bayern Munich) both call this 1975-founded Welsh/Celtic pub home, making it the European football hub of suburban St. Louis. Most bars host one club or none; dual-league hosting is rare.

**The Pitch Athletic Club (opened Feb 27, 2023) has the richest historical provenance of any soccer bar in our database.** Its walnut woodwork was salvaged from Tony Faust's restaurant, which occupied the same site since 1889. The 9,200 sqft space was designed by The Lawrence Group to honor both the building's history and St. Louis's soccer legacy, with memorabilia dedicated to SLU's championship programs. It opens at 6:30 AM on weekends for EPL -- one of the earliest openings of any soccer bar we've documented.

**Source quality for St. Louis was excellent.** Key sources: stlcitysc.com CITY Supporter Series profiles of St. Louligans, stlsoccernews.com Away Fan's Guide, stlmag.com soccer bars and CITY on Tap coverage, stlpartnership.com Beffa's history, saucemagazine.com Amsterdam Tavern and Pitch first-look reviews, feastmagazine.com 2nd Shift Brewing and Pitch profiles, do314.com event listings, untappd.com Brewligans beer entries, internationaltaphouse.com About page, llywelynspub.com history page, theamericanoutlaws.com chapter directory, thelawrencegroup.com Pitch history, KSDK and stltoday.com first home match coverage.

---

### Las Vegas Deep Research -- World Cup 2026 Watch Destination with Four Distinct Soccer Bar Tiers

Las Vegas has 12 soccer bars that fall into four clear tiers by soccer identity:

**Tier 1: Dedicated soccer pubs with supporter clubs.** Crown & Anchor (founded 1995, Crystal Palace/Everton/Newcastle, US Soccer Federation sponsor), McMullan's (Liverpool OLSC, Shenanigans room, charity program), Hennessey's (American Outlaws USMNT/USWNT since 2011), Jackpot (Sin City Gooners / Arsenal America). These four bars have formal supporter club affiliations verified through official club directories (arsenal.com, premierleague.com USA Bar Finder, theamericanoutlaws.com).

**Tier 2: Authentic Irish/German pubs with strong soccer culture.** Ri Ra (EPL Breakfast Club, built from real Irish pub shipped from Ireland, Visit Las Vegas 2026 World Cup venue), Nine Fine Irishmen (built by Irish Pub Company, shipped from Ireland, Premier League on screens), Hofbrauhaus (Bayern Munich viewing parties, Bundesliga-first venue, 2022 World Cup coverage in Review-Journal). These bars don't host formal supporter clubs but have institutional-level soccer programming.

**Tier 3: Premium sports bars with soccer commitment.** Flanker Kitchen (30x9ft LED wall, 50+ screens, opened 2023, full-season soccer), The Front Yard (18ft big screen, Ellis Island Brewery, 350 capacity), Blondies (60+ TVs, 7 AM Strip opening for EPL). These are general sports bars that actively accommodate soccer, particularly early-morning EPL and major tournaments.

**Tier 4: Neighborhood bars with soccer ties.** Four Kegs (since 1977, sponsors 2 local soccer teams, Food Network fame), Kickers (women-owned, 17 TVs, listed on Fanzo as soccer bar). These are locals' bars where soccer is one of many sports shown.

**Crown & Anchor's Tropicana closure (July 2024) was the biggest recent disruption.** After nearly 30 years, the original location at 1350 E Tropicana closed. The Spring Mountain Road "Little Crown & Anchor" (opened 2008) carries on, but the loss of the original location mirrors patterns we've seen in other cities -- Baltimore's Abbey Burger, Atlanta's Elsewhere Brewing, Indianapolis's Union Jack Pub Speedway. The Crown & Anchor brand survived because it had opened a second location seven years before the original closed. Single-location soccer bars are the most vulnerable.

**McMullan's Liverpool charity program is the most unique supporter club activity in our database.** The "$1 per participating spectator per Liverpool goal" donation to the Nevada Partnership for Homeless Youth has raised over $10,000. No other supporter club in our 489-bar database has a formalized charity-per-goal program tied to match viewing. The program was profiled in Desert Companion (KNPR) in November 2022.

**Las Vegas has the most 24/7 soccer bars of any city in our database.** Crown & Anchor, McMullan's, Jackpot, Kickers, and Four Kegs all operate 24 hours. This is unique to Las Vegas's hospitality culture and means no kickoff time is inaccessible. Even the "early" Strip bars (Blondies at 7 AM, Flanker at 7 AM weekdays) open hours before equivalent bars in other cities.

**Source quality for Las Vegas was high.** Key sources included: KNPR/Desert Companion profile of McMullan's Liverpool club (the richest single-source document for any bar in this research), Las Vegas Review-Journal World Cup coverage, Visit Las Vegas official 2026 World Cup guide, Premier League USA Bar Finder, arsenal.com supporter club directory, theamericanoutlaws.com chapter page, Irish Pub Company case studies, Las Vegas Magazine, neighborhoods.com soccer pub guide, Fanzo listings.

---

### Atlanta Image Gap Closed -- Wix Sites Require Blog/Press Workarounds

The last two Atlanta bars without images (Chiringa and SweetWater Brewery) were both cases where the bar's own website blocked scraping. Chiringa uses Wix which renders images client-side (no extractable URLs in page source). SweetWater uses Incapsula WAF that blocks all automated access. The previous session noted these as "unable to source."

**The fix was to look at third-party sites that wrote about the bars.** Adventures in Atlanta (adventuresinatlanta.com, WordPress) had a Chiringa review with direct JPG URLs. Absolute Beer (absolutebeer.com, WordPress) had a SweetWater brewery profile page with an exterior banner photo. WordPress-hosted blogs remain the most reliable image source when official sites block scraping -- the wp-content/uploads paths are predictable and directly downloadable.

**Pattern confirmed:** When a bar's own site is behind Wix, Squarespace, Cloudflare challenge pages, or WAFs, the best approach is to search for food blogs, travel blogs, local news sites, and brewery/bar review sites that wrote about the venue. These third-party WordPress sites almost always have extractable images.

---

### Thin Descriptions -- Supporter Group Research Reveals Philadelphia's EPL Ecosystem

Fixing 12 thin descriptions (under 200 chars) required researching each bar's actual soccer credentials. The most valuable source was mcfcphilly.com/EPL, which maintains a complete map of every EPL supporter group in Philadelphia and their home bars for the current season. This single page provided verified team-to-bar mappings for all 8 Philadelphia bars.

**The Black Taxi as a multi-club venue is unusual.** Most bars host one supporter group. The Black Taxi in Fairmount hosts three -- Aston Villa (Philadelphia Lions), Crystal Palace (Philly Palace), and Leeds United Philadelphia. This likely works because all three are smaller clubs whose supporters don't overlap on the match calendar often enough to conflict. The pattern is different from Tir na nOg, which hosts Brentford, Chelsea, Man City, and Wolves -- Tir na nOg is more of a "catch-all" whereas Black Taxi specifically attracts mid-table/lower-table English club fans.

**Jose Pistola's Fulham connection is well-established but easily confused.** Multiple sources (Fanzo, general EPL bar lists) tag Jose Pistola's as a Liverpool bar, likely because the bar itself shows Liverpool matches and uses #YoullNeverGuacAlone. But the mcfcphilly.com EPL map and the official Fulham FC international supporters page both confirm it as the home of Phulham -- Philadelphia's Fulham FC supporters group. The Fulham connection is the specific supporter club affiliation; Liverpool is what they also show because it's popular.

**Victoria Freehouse is the OLSC Philadelphia origin story.** Liverpool FC's own website (liverpoolfc.com) documents that the Official Liverpool FC Supporters Club Philadelphia formed through fans gathering informally at The Victoria Freehouse in Old City. This is a stronger soccer credential than "shows Premier League games" -- it's a founding location for an official supporters club.

**Hilltown Tavern Brighton connection needs verification.** The mcfcphilly.com source lists Brighton at Urban Saloon, not Hilltown Tavern. BillyPenn 2025 also says Urban Saloon for Brighton (Philly Seagulls). The original DB had Brighton at Hilltown -- this may have been accurate at a prior point or may have been an error. Removed the Brighton claim from the description and positioned Hilltown as a strong neutral EPL morning venue instead, which is accurate per multiple sources.

**SD TapRoom's "all sports packages" claim is significant.** Their own website explicitly states they subscribe to all packages and play sound for major events. This is a specific, verifiable claim that most bars don't make. Combined with 11 flat-screen TVs and a 10-foot projector, it positions SD TapRoom as one of the better-equipped soccer viewing venues in Pacific Beach.

---

## 2026-02-21

### SEO Fixes — Structured Data Must Always Use Production Domain

The core issue: every page constructed `baseUrl` from `url.protocol + '//' + url.host`, which works for rendering links but leaks preview domains (e.g., `1a23cb5b.soccerbars-v2.pages.dev`) into JSON-LD structured data and OG meta tags. Search engines crawling preview URLs would index non-canonical domains in structured data.

**Pattern established:** `PROD_BASE` (from config.js) is the single source of truth for all SEO-facing URLs. `baseUrl` (from request) is only for rendering page links. Every JSON-LD block, OG image, robots.txt sitemap, and BreadcrumbList now uses `PROD_BASE`.

**JSON-LD image field was a separate bug.** The OG image fix in `renderHead()` handled meta tags, but JSON-LD objects in `bars/[[slug]].js` and `services/[[slug]].js` spread `item.image_url` directly from the DB (relative paths like `bars/atlanta/foo.jpg`). Fixed by applying the same `startsWith('http')` check inline.

**Google Search Console submitted.** Site had 0 indexed pages (brand new `pitchpubs.com` domain after rebrand). Sitemap submitted with 637 URLs. SEO audit confirmed: valid XML, all URLs use production domain, `/search` excluded, robots.txt correctly references sitemap. Expect indexing to begin within days to weeks.

**State normalization was overdue.** The DB had a mix of abbreviations (CA, TX, NY) and full names (Georgia, Arizona, Indiana) — newer city expansions used full names, older ones used abbreviations. This caused duplicate state pages (`/states/ca` and `/states/california`). Migration 055 normalized everything to full names. The `STATE_NAMES` lookup map in index.js handles both formats as a fallback.

---

## 2026-02-20

### Georgia/Atlanta Deep Quality Pass -- EPL Supporter Ecosystem Mapped

Atlanta is a World Cup 2026 host city, and the original 15 bars in the database had significant quality gaps: all 15 images were broken (referenced R2 paths with no actual files), zero EPL supporter club affiliations despite Atlanta having one of the strongest supporter ecosystems in the Southeast, and only 1 bar had a content profile.

**The Fado Midtown/Buckhead split is the most important find.** Unlike most cities where EPL supporter clubs scatter across different bars, Atlanta concentrates three supporter groups at Fado Midtown (Man Utd, Chelsea, American Outlaws) and one at Fado Buckhead (Liverpool). This mirrors the Baltimore model (each club has a dedicated bar) but with two Fado locations as the anchor rather than five separate pubs. Arsenal and Man City both chose Brewhouse Cafe, the "America's Best Soccer Bar" per Men in Blazers, creating a two-hub system: Fado for Big Six EPL clubs + USMNT, Brewhouse for Arsenal + Man City + general soccer culture.

**Manny's Grant Park as the Tottenham bar is a genuine find.** The Atlanta Spurs (est. 2012) meet at this cozy neighborhood pub in Grant Park, creating the only dedicated Spurs bar in our Georgia coverage. The pub is not on any of the standard "best soccer bars" lists (Discover Atlanta, Matador, etc.) -- it was only findable through the official Tottenham Hotspur supporters club directory. This reinforces that official club supporter directories (arsenal.com, liverpoolfc.com, tottenhamhotspur.com, chelseafc.com, manutd.com, mancity.com) are the most reliable source for EPL bar mappings, ahead of general soccer bar lists.

**The Atlanta United Pub Partner program is the largest in our database.** The 2025 list includes 15 official partners spanning Atlanta proper, Buckhead, Chamblee, Roswell, and Decatur. This is more than any other MLS team we've researched (Charlotte FC had 8, STL CITY SC had 6). The breadth reflects Atlanta United's massive fan base (highest average MLS attendance, 70,000+ at Mercedes-Benz Stadium). Several partners are non-traditional soccer venues: El Tesoro (Mexican taqueria), Chiringa (surfside cuisine), SweetWater (brewery), Willie B's (at a soccer complex).

**Elsewhere Brewing closed, disrupting the Man City ecosystem.** Elsewhere Greenhouse in West Midtown was the ATL Cityzens' original home for Manchester City watch parties. After Elsewhere closed both locations (pandemic/economic challenges), the ATL Cityzens moved to Brewhouse Cafe. This is the same pattern we've seen in other cities (Baltimore's Charm City Gooners moving from closed Abbey Burger to Liv's Tavern, Indianapolis's MUFC Indy moving from Chatham Tap to Brew Link). Bar closures force supporter clubs to migrate, and the migration typically goes toward the strongest remaining soccer bar rather than a new venue.

**Hudson FC is Atlanta's cautionary tale.** A purpose-built soccer bar opened in 2017 in Brookhaven at 4058 Peachtree Rd, it was specifically designed for soccer fans with screens everywhere and international sports focus. It closed in October 2019 -- the owner said the location was not ideal for a soccer bar despite being successful. The Chelsea supporters (Atlanta Blues CFC) used it before moving to Fado Midtown. This echoes the broader pattern: dedicated soccer bars struggle to sustain themselves on soccer alone; the most durable soccer bars are pubs and restaurants that add soccer culture to an already strong base business.

**Image sourcing was the biggest challenge.** Atlanta bar websites are heavily behind Cloudflare, Wix, Squarespace, and SpotApps CDNs that block or limit scraping. Fado's official site returned 403. The best image sources were: brewhousecafe.com (Squarespace, direct URLs), fourdollarjacks.com (webp format, reliable CDN), atlantaeats.com (WordPress, direct JPG URLs), partyslate.com (event venue photos), and irishpubcompany.com (Fado construction photos). SweetWater Brewing uses Incapsula WAF that blocks all automated access. Three bars (SweetWater, Chiringa, The Tavern at Battery) remain without R2 images.

**State normalization lesson.** The original Atlanta data used "GA" as the state code, while all newer expansions use full state names ("Georgia", "Indiana", "Wisconsin", etc.). The migration normalizes to "Georgia" in both the bars and cities tables. This inconsistency should be caught during initial data entry going forward.

---

### Tier 2 Expansion -- 5 Cities in Parallel, Pre-Assigned Migration Numbers

Ran 5 content agents in parallel for Phoenix, New Orleans, Milwaukee, Baltimore, and Indianapolis. Pre-assigned migration numbers (037-051) eliminated the collision problem from Tier 1. All agents respected their assigned numbers — zero conflicts.

**Tier 2 markets are trickier than Tier 1.** More closures to filter (Phoenix lost 4 bars — Rosie McCaffrey's demolished 2022, Walter Station, Tilted Kilt, Jersey D's). Fewer established soccer bars overall, but the ones that exist tend to have deeper supporter club roots. Baltimore's 6 EPL clubs each with a dedicated bar is remarkable for a non-MLS city.

**Session total: 341 → 482 bars across 61 cities in 31 states.** Growth came from: content quality sweep (profiles/images/affiliations), then 4 Tier 1 cities (+46), then 5 Tier 1 cities (+50), then 5 Tier 2 cities (+45).

---

### Indianapolis Metro Expansion -- USL City with Deep Supporter Club Ecosystem

Indianapolis is a mid-size market without an MLS team, but Indy Eleven (USL Championship since 2014) and a remarkably well-organized EPL supporter club ecosystem make it a strong soccer bar city. The Brickyard Battalion (Indy Eleven's supporter group, founded 2011) predates the team itself.

**Union Jack Pub is the gravitational center of Indianapolis soccer.** Operating since 1979 in Broad Ripple, Union Jack is the longest-running soccer bar we have added (45+ years). It hosts three distinct supporter groups: LFC Indy (Official Liverpool Supporters Club), American Outlaws Indianapolis (USMNT/USWNT), and the Brickyard Battalion (Indy Eleven away games). Over 100 Brickyard Battalion members packed the pub for away games. No other bar in our database hosts both a Premier League OLSC, an American Outlaws chapter, AND a USL supporters group simultaneously.

**Chatham Tap is the rare bar that self-identifies as a "Soccer Pub" in its branding.** Most bars we add are Irish pubs or sports bars that happen to show soccer -- Chatham Tap literally uses "Soccer Pub" as its tagline on chathamtap.com. Founded September 2007 on Mass Ave, it spawned the Indy Gooners (Arsenal, 2005), MUFC Indy (Manchester United, 2021), and runs a dedicated "Soccer Breakfast" program. Three locations (Mass Ave, Fishers, Butler University) make it the most distributed soccer pub brand in any city we cover.

**Supporter club migration pattern.** The Indy Gooners originally met at Chatham Tap Mass Ave but now gather at Chatham Tap Fishers. MUFC Indy was born at Chatham Tap but moved to Brew Link Brewpub Downtown. The Indy Spurs (300+ members, since 2013) chose Centerpoint Brewing over traditional pubs. This migration from established soccer bars to breweries mirrors what we saw in Pittsburgh (Cork Harbour displacing Piper's) and Sacramento (Zebra Club retaining two clubs while newer venues emerged).

**Mass Ave is Indianapolis's soccer corridor.** Chatham Tap and Ralston's Drafthouse are both on Massachusetts Avenue, creating a two-block stretch where Arsenal, Man United, and Bayern Munich all have designated viewing spots. This corridor concentration is similar to Pittsburgh's South Side (Carson Street) or St. Louis's Downtown West stadium cluster.

**Bayern Munich in Indianapolis is a unique find.** Ralston's Drafthouse hosting FC Bayern watch parties at 9:30 AM for Bundesliga is one of the few Bundesliga-specific supporter meetups in our database (alongside Mia San STL at Llywelyn's in St. Louis). Most American cities default to EPL-only supporter culture.

**Image sourcing lesson: Cloudflare challenge pages block image extraction.** Union Jack Pub's website (unionjackpub.co) returns a Cloudflare "Just a moment..." challenge page that blocks all scraping. Had to source the image from an IBJ (Indianapolis Business Journal) article about the pub's relocation instead. Wix-hosted sites (Chatham Tap, Centerpoint, Ralston's) and SpotApps-hosted sites (Brew Link) both yielded extractable image URLs from their page source.

**Excluded bars and reasoning:**
- Fox and Hound (CLOSED per Yelp Nov 2025)
- Brugge Brasserie (CLOSED 2020, pandemic casualty)
- Claddagh Irish Pub (CLOSED, both downtown and Plainfield locations)
- Union Jack Pub Speedway (CLOSED July 2022 after 41 years, labor shortage)
- Chatham Tap Butler (on university campus, less soccer-specific atmosphere)
- The Hangar (between stadiums, general sports bar)
- District Tap (generic sports bar despite 60 taps)
- Twin Peaks, Yard House (chain sports bars, no soccer identity)
- Havana Sports Lounge, All Stars Sports Lounge (general sports bars from GoodRec with no soccer evidence)

---

### Milwaukee Metro Expansion -- German Heritage Meets English Pub Culture

Milwaukee is a unique soccer bar market because its German heritage gives it a genuine Bundesliga/beer hall identity alongside the typical British pub scene. The city has five organized EPL supporter clubs plus a Bayern Munich fan group, making it one of the most supporter-dense non-MLS cities in the database.

**The Highbury Pub is Milwaukee's soccer origin story.** Named after Arsenal's legendary Highbury Stadium, owner Joe Katz opened the Bay View bar in 2004. The Brew City Gunners (Arsenal supporters, founded 2013) and American Outlaws Milwaukee both call it home. The bar opens at 6:30 AM on Saturdays and fills seats before noon. Soccer.Town rates it 83/100 with a soccer immersion score of 46 -- the highest in Milwaukee. It is the closest thing Milwaukee has to a dedicated soccer bar in the Pittsburgh "Piper's Pub" mold.

**Red Lion Pub and Three Lions Pub are a sister bar network covering two supporter clubs.** Both are under the same ownership and show identical league slates (10+ competitions). Red Lion (Lower East Side, since 2011) hosts the Milwaukee Spurs (Tottenham, founded 2006, officially registered 2014 -- the largest supporter group in Wisconsin). Three Lions (Shorewood) hosts LFC MKE (Liverpool). They run a "supporter group partnership program" offering membership cards, discounts, and merch to attract more clubs. This is the first bar pair in our database that explicitly recruits supporter groups through an incentive program.

**Nomad World Pub is the World Cup bar, not the EPL bar.** Unlike other cities where one bar dominates both weekly EPL and tournament viewing, Milwaukee splits them. The Highbury and Red Lion/Three Lions own weekly EPL. Nomad World Pub owns the tournaments -- its 2014 World Cup watch party drew 15,000+ fans and forced Brady Street to close. Owner Mike Eitel has hosted World Cup parties since 1998. The Nomad Coffee Bar (added 2021) opens at 6:30 AM daily for morning soccer fans, making it a legitimate 6:30 AM EPL venue too.

**Old German Beer Hall is a genuine Bundesliga home, not just a gimmick.** Mia San Milwaukee, the official Bayern Munich fan club, meets there for every match, and wearing Bayern kit earns half-price liters. This is only the second Bundesliga-first bar in our database (after Hofbrauhaus Pittsburgh). Milwaukee's German heritage (Old World Third Street, Usinger's Sausage, Lakefront Brewery) makes a Bayern Munich bar feel natural here in a way it wouldn't in most US cities.

**SportClub and Nomad are brother bars under the same ownership.** SportClub (2018, downtown) is the upscale version of Nomad (1997, Brady Street). This is the first confirmed sibling-bar pair in Milwaukee soccer where both venues prioritize soccer. The shared DNA means they coordinate on major tournament coverage.

**Leeds United Americas confirmed Brass Boar's Den as the Wisconsin home.** This is the first Leeds United affiliation in our database. Leeds Americas (luamericas.com) maintains a state-by-state bar directory, which is a new source for English second-tier club affiliations. Worth checking for other EFL Championship clubs with American bar networks.

**West Allis and South Milwaukee as Milwaukee metro.** West Allis (Brass Boar's Den) is technically a separate city but sits within Milwaukee's urban core at National Avenue. Listed under "Milwaukee" city with "West Allis" as neighborhood, same pattern as South Pasadena under St. Petersburg. South Milwaukee (Moran's Pub) is 10 miles from downtown and got its own city entry.

**Image sourcing notes:** FourDollarJacks covered 7 of 10 bars. For Red Lion, the best image came from The Rooftop Guide (therooftopguide.com), a bar-specific site with direct image URLs. For SportClub, Urban Milwaukee's WordPress hosted an exterior photo. Three Lions Pub used a Squarespace-hosted image from North Shore Family Adventures blog showing Liverpool fans at the pub. No bars required fallback to generic sources.

**Excluded bars and why:**
- House of Guinness (Waukesha -- 20+ miles from Milwaukee, separate exurban city)
- Jack's American Pub (general sports bar, AO Milwaukee confirmed at Highbury not here)
- County Clare Irish Inn (closed permanently 2020)
- Kegel's Inn (German restaurant, no soccer evidence beyond general sports)
- Who's On Third (Packers/Brewers bar, no soccer identity)

---

### New Orleans Expansion -- Single-Bar Epicenter Model with Deep Cultural Roots

New Orleans is a unique soccer bar market. Unlike cities with MLS teams that generate pub partner networks, or cities with multiple strong EPL pubs competing for fans, New Orleans has one overwhelmingly dominant soccer bar -- Finn McCool's Irish Pub -- with everything else being secondary viewing options.

**Finn McCool's is the most culturally significant soccer bar in our entire database.** A 2009 memoir ("Finn McCool's Football Club" by Stephen Rea) documented the pub's soccer community and its survival through Hurricane Katrina. WWNO (New Orleans public radio) featured the pub during the 2022 World Cup as "a melting pot of cultures." The bar hosts at least four supporter groups: Krewe of Arsenal (founded 2010, verified on arsenal.com), New Orleans Celtic Supporters Club (verified on celticbars.com), New Orleans Spurs (official Tottenham Hotspur OSC), and USMNT fans. Owner Sean Kennedy, from Galway, has owned the pub since 2016 and previously coached soccer in New Orleans for 25+ years.

**The American Outlaws chapter is at Rendezvous Tavern, not Finn McCool's.** This is unusual -- in most cities, the AO chapter meets at the same bar as EPL supporter groups. In New Orleans, AO NOLA is at the Rendezvous Tavern on Magazine Street in the Irish Channel, while the EPL clubs are all at Finn McCool's in Mid-City. AO NOLA's chapter page notes it is "currently rebuilding and seeking new leadership," which explains the separation.

**The Premier League USA Bar Finder listed three New Orleans bars:** Finn McCool's, The Bell, and The Prytania Bar. The Bell is a proper British gastropub on Esplanade Avenue that opened recently and focuses more on food (raw bar, oysters, British pub fare) than sports, but it does have two TVs and was featured in Garden & Gun magazine. The Prytania Bar is a laid-back neighborhood bar in the Garden District with 7 TVs. Neither has the soccer culture of Finn McCool's, but the PL Bar Finder listing gives them credibility as legitimate EPL viewing spots.

**The Rusty Nail surprised as the second-strongest soccer bar.** SportsBars.com ranked it as the top soccer viewing venue in New Orleans (above Finn McCool's), noting its "British pub, Soccer, Cocktails" identity and 25 screens in a 180-person space. However, The Rusty Nail's actual hours (4 PM weekdays, 11 AM weekends) don't match the "opens early for Premier League" claim from GoodRec. This is a data quality concern -- the bar may open early for specific big matches only.

**New Orleans's bar scene is geographically dispersed.** Unlike Pittsburgh (two corridors), Tampa (concentrated in SoHo/Ybor/Downtown), or St. Louis (stadium cluster), New Orleans's 8 bars span 7 different neighborhoods across the city -- Mid-City, Lower Garden District, Bywater, Faubourg St. John, Garden District, Riverbend, Irish Channel, and French Quarter. No two bars are in the same neighborhood. This reflects New Orleans's neighborhood-centric culture.

**Excluded the American Sports Saloon (1200 Decatur).** This was once a dedicated soccer bar with a soccer events page, but it closed per Yelp (November 2025). A new "Vieux Sports Saloon" operates at 541 Decatur -- it mentions soccer but appears to be a general French Quarter sports bar.

**Image sourcing diversified across many platforms.** WWNO/NPR's Brightspot CDN provided the Finn McCool's photo (World Cup crowd shot). Garden & Gun's WordPress hosted The Bell interior. Scoundrel's Field Guide (a dive bar review blog) had J&J's. NolPlaces (a NOLA neighborhood guide) had Cooter Brown's. The Rendezvous Tavern's own WordPress and ryansirishpubinc.shop completed the set. 100% coverage on first pass.

---

### Phoenix Metro Expansion -- Six EPL Supporter Clubs Mapped to Home Bars

Phoenix is unique in our database because it has the most organized EPL supporter club ecosystem mapped to specific home bars. Six of the "Big Six" supporter groups have dedicated Phoenix-area homes: Manchester United at George & Dragon, Liverpool at Crown Public House, Manchester City at The Kettle Black, Arsenal at Yucca Tap Room, Tottenham at Fibber Magees, and Chelsea at O'Kelley's. This is the first city where we have all six mapped.

**The Cronkite News (ASU journalism) article was the single most valuable source.** A September 2023 feature by Cronkite News mapped the entire EPL supporter landscape in Phoenix, naming specific bars for Man Utd (George & Dragon), Man City (The Kettle Black), Arsenal (Yucca Tap Room), Tottenham (Fibber Magees), Chelsea (Jersey D's -- now closed, moved to O'Kelley's), and Liverpool (Crown Public House). This one article provided the research backbone that we cross-referenced against official team supporter club pages.

**Phoenix's bar closures are brutal.** Five previously documented soccer bars are permanently closed: Rosie McCaffrey's (demolished 2024 for a BMW dealership), Tilted Kilt (the entire chain collapsed), Walter Station Brewery (closed taproom to focus on distribution), Jersey D's Tavern (Chelsea's old home), and Rula Bula (Tempe's beloved Irish pub, closed 2021). This is the highest closure rate of any city we've researched. Arizona's extreme heat, post-COVID lease renegotiations, and construction boom (Rosie McCaffrey's was literally bulldozed for a car lot) are all factors.

**Phoenix Rising FC's bar partnership model is thin but verified.** Unlike MLS teams with formal pub partner lists (SDFC, Charlotte FC, STL CITY SC), Phoenix Rising (USL) partnered with the Cold Beers & Cheeseburgers chain for away watch parties and Four Peaks for World Cup events. The chain partnership is too generic for our directory (no soccer identity), but Four Peaks hosting the Rising head coach for a Mexico-Poland World Cup watch party is a strong enough connection.

**The Kettle Black's owner is the story.** Jimmy Culleton from Dublin is a lifelong Man City fan who opens the pub at any hour for City matches -- including 4:30 AM Arizona time. This is the pattern we see in the strongest soccer bars: an owner who IS a fan, not just a business operator who shows games. Same as David Wimberley (Man Utd since 1968) at George & Dragon and Seamus McCaffrey (Celtic) at his namesake pub.

**Yucca Tap Room is the most impressive venue setup for a supporter group.** The Arizona Gooners (200+ members) have their own dedicated room at the Yucca Tap Room with 5 TVs, a projector screen, a dedicated sound system, a room-specific bar, pool table, and private bathrooms. This is more infrastructure than most official MLS pub partners provide. The bar opens at 6 AM every day specifically for Arsenal matches.

**The Rose and Crown to Crown Public House transition is a good case study.** The Rose and Crown was the original Liverpool bar at Heritage Square. When the city reclaimed the Heritage Square location, the pub merged with Coach's Corner (a sports bar) to become Crown Public House at 333 E Jefferson. The Liverpool OLSC Phoenix followed the pub to its new location. The Premier League USA Bar Finder still lists it under the old "Rose and Crown" name, which can confuse researchers.

**Metro-wide coverage was the right approach for Phoenix.** Unlike cities like Pittsburgh or Sacramento where bars cluster downtown, Phoenix metro bars are spread across 6 cities spanning 30+ miles. Including Scottsdale (K O'Donnell's), Glendale (Tim Finnegan's), Chandler (Fibber Magees), Mesa (O'Kelley's), and Tempe (Yucca Tap Room, Four Peaks) alongside Phoenix proper gives a more accurate picture of the soccer bar landscape. This is the most geographically dispersed metro we've covered.

**Excluded bars and reasoning:**
- Rosie McCaffrey's -- demolished 2024, building bulldozed for Chapman BMW display lot
- Tilted Kilt Pub & Eatery -- permanently closed (both Phoenix and Tempe), chain collapsed nationwide
- Walter Station Brewery -- closed taproom April 2025 to focus on beer distribution
- Jersey D's Tavern (Chandler) -- permanently closed December 2025 (Chelsea supporters moved to O'Kelley's)
- Rula Bula Irish Pub (Tempe) -- closed 2021, pop-up events at ASU stadium only
- The Harp Pub (Mesa) -- permanently closed per Yelp
- Pub Rock Live (Scottsdale) -- primarily a live music venue, soccer only on Phoenix Rising game days
- Cold Beers & Cheeseburgers -- chain with no soccer identity beyond Phoenix Rising away watch parties
- Twin Peaks, STADIUM, CAPS Sports Grill, Boulders on Broadway -- general sports bars, no soccer-specific identity

---

### Baltimore Expansion -- EPL Supporter Ecosystem Distinct from DC

Baltimore has a genuinely independent soccer bar scene from Washington DC (40 miles south). While DC has 17 bars anchored by The Queen Vic and Lucky Bar, Baltimore's scene is built around five organized EPL supporter clubs that each claimed a home bar, creating a remarkably well-mapped supporter-to-bar ecosystem for a non-MLS city.

**The supporter club density is unusual for a non-MLS market.** Six verified supporter groups have dedicated home bars: LFC Baltimore (Liverpool, OLSC since 2006) at Smaltimore, Charm City Reds (Man Utd, since 2010) at Todd Conner's, Charm City Gooners (Arsenal, since 2009, 250+ members) at Liv's Tavern, Baltimore Spurs (Tottenham, since 2012, 87 members) at Lighthouse Tavern, Baltimore Blaugrana (Barcelona penya) at Max's Taphouse, and Chelsea supporters at Slainte. This level of organized supporter culture rivals some MLS cities.

**The Charm City Gooners venue migration is instructive.** Founded 2009, the Gooners watched at Abbey Burger Bistro Federal Hill for over a decade (the owner painted one wall red with the Gooners crab-and-cannon logo). When Abbey Federal Hill closed in late 2024, the Gooners moved to The Perch (1110 S Charles) and then Liv's Tavern (1113 S Charles) -- literally next door to each other on Charles Street. Arsenal.com still lists Abbey as the official pub (stale data), but the Instagram account confirms Liv's Tavern. This venue migration pattern is common when a supporter club's home bar closes.

**The Baltimore Spurs also migrated.** Baltimore Magazine's 2022 sports bar guide lists Ryleigh's Oyster (Timonium, 15 miles north) as the Spurs home. By 2024-2025, the Tottenham official website lists Lighthouse Tavern (Canton) as their clubhouse. The move makes sense -- Timonium is suburban, while Canton is in the heart of Baltimore's bar district.

**Fells Point and Canton form a two-neighborhood soccer corridor.** 7 of 9 bars are in Fells Point (4) or Canton (3), with only Liv's Tavern (Federal Hill) and Captain Larry's (Riverside) outside this cluster. The Fells Point waterfront (Thames St / Broadway) has Slainte, Todd Conner's, Abbey Burger, and Max's within a 3-block walk. Canton's O'Donnell Square area has Claddagh and Smaltimore within a block of each other.

**Slainte is the clear epicenter.** Every source names Slainte Irish Pub as Baltimore's number one soccer bar -- Baltimore Sun, CBS Baltimore, Baltimore Magazine, GoodRec, Yelp all agree. It has 18 HDTVs, carries every soccer channel available, opens at 7 AM daily, and was featured on Diners, Drive-Ins & Dives. Chelsea supporters claim it as their home, but it welcomes all clubs.

**Claddagh Pub has the deepest soccer roots.** "Baltimore's Original Irish & Soccer Pub" since 1995, it's a continuation of a family-owned Irish pub from Chase Street in downtown Baltimore dating to the 1970s. It brands itself explicitly as a soccer pub in its website title -- unusual for a bar to lead with soccer identity over Irish identity.

**Max's Taphouse is the most unexpected soccer bar.** Known nationally as one of America's great beer bars (114 drafts, 1000+ bottles), Max's became a soccer destination through the Baltimore Blaugrana, a Barcelona supporters club (penya). This is the only Barcelona-affiliated bar in our database -- most bars align with EPL clubs.

**Image sourcing notes:** FourDollarJacks CDN provided images for 4 of 9 bars (Slainte, Smaltimore, Claddagh, Lighthouse). FellsPoint.com's WordPress served Todd Conner's and Abbey Burger. Visit Baltimore (baltimore.org) had Max's Taphouse. The Baltimore Banner had a professional Liv's Tavern interior shot. SouthBMore.com directory CloudFront CDN had Captain Larry's. 100% image coverage achieved on first pass.

**Excluded and why:**
- Abbey Burger Federal Hill (closed Jan 2025, original Charm City Gooners home)
- The Life of Reilly (closed, Butchers Hill)
- The Perch (limited hours, Gooners interim location before Liv's)
- Ryleigh's Oyster (Timonium suburb, Spurs moved to Lighthouse)
- Union Jack's Columbia (30 miles out, not Baltimore proper)
- Sean Bolan's, Bel Air (not Baltimore)
- Mick O'Shea's (no soccer-specific confirmation despite being an Irish pub)

---

### Tampa / St. Petersburg Expansion -- Two-City Metro with Distinct Soccer Identities

Tampa and St. Petersburg are 25 miles apart across Tampa Bay but have distinct soccer bar cultures. Tampa's scene is dominated by Irish pubs that double as supporter club homes, while St. Pete has more British-owned pubs focused on the EPL viewing experience.

**MacDinton's is the clear epicenter.** Every source names MacDinton's SoHo as the number one soccer bar in Tampa. It hosts 4+ supporter clubs under one roof: Gulf Coast Gooners (Arsenal, since 2010), Toon Army Tampa Bay (Newcastle), plus Man Utd and Man City supporters. The Liverpool OLSC Tampa Bay was born here before moving to Maloney's. MacDinton's had a St. Pete location too, but it closed April 2022.

**Liverpool has the strongest organized presence.** Two bars are dedicated Liverpool homes: Maloney's Local (OLSC Tampa Bay, official since 2008) in Tampa and The Horse & Jockey (Pinellas County LFC Supporters) in South Pasadena. The Horse & Jockey was purchased by Liverpool native Lea Doyle in 2008.

**St. Pete's soccer bar scene is newer and growing fast.** Dublin Drop (March 2025) and Green Turtle Brewery (2025) both opened in 2025 specifically to capture the soccer pub market. Green Turtle is the only bar in St. Pete with traditional English cask ales on hand-pulled beer engines.

**The Horse & Jockey is technically in South Pasadena** (~6,000 population within St. Pete metro). Listed under St. Petersburg because every local guide includes it as a St. Pete bar and creating a separate city entry for 1 bar is excessive.

**No Tampa Bay Rowdies bar partner program exists.** Unlike MLS teams that publish official pub partner lists, the Rowdies (USL) do not have a formal bar partnership. Ralph's Mob (supporters since 2010) uses Thirsty First for pre-game, but it is a general sports bar. Yeoman's Cask & Lion is the closest to a Rowdies bar.

**Image URL format lesson:** Existing convention stores image_url WITHOUT the `/images/` prefix (e.g., `bars/st-louis/file.jpg`). The `renderCard` component auto-prepends `/images/`. Corrected Tampa images to match this convention with city subdirectories (`bars/tampa/`, `bars/st-petersburg/`).

---

### San Jose Metro Expansion -- Silicon Valley's MLS Ecosystem

San Jose has the San Jose Earthquakes (MLS since 1996) and Bay FC (NWSL since 2024, also at PayPal Park), making it one of the few US cities with both an MLS and NWSL team sharing a stadium. The soccer bar landscape reflects this dual identity.

**Key insight -- The "Team 408" official bar network is thin but verified.** Unlike Charlotte FC or St. Louis CITY SC which have 10+ pub partners, the Earthquakes only officially recognize two watch party venues: O'Flaherty's Irish Pub and The Old Wagon Saloon & Grill, both on San Pedro Street in downtown. This actually makes them more valuable -- if the team picks only two, those two are the real deal. The Old Wagon opens at 5am for World Cup matches (earlier than any bar in our database) and O'Flaherty's opens at 7am for all Liverpool fixtures.

**Jack's Bar & Lounge is the most soccer-connected bar we have added to date.** It holds four simultaneous soccer affiliations: Silicon Valley Gooners (Arsenal, official since 2014 per arsenal.com), San Jose Earthquakes Team 408, Bay FC Bridge Brigade watch parties, and an American Outlaws chapter. The Arsenal connection was verified directly on arsenal.com's official supporters club page, which names Jack's as the meeting venue and notes the owner is an Arsenal fan who will open at any time Arsenal plays. Opening at 6am on weekends for EPL is verified on Yelp and Fanzo.

**Bay FC (NWSL) is a new data source for bar affiliations.** Bay FC's Bridge Brigade supporters organize watch parties at Jack's, JTown Pizza, and Taplands (Santa Clara). This is the second NWSL team affiliation in our database (after Boston Legacy FC at Drawdown Brewing). As more NWSL teams grow their supporter culture, bar partnerships will follow.

**The Britannia Arms split creates a naming challenge.** Britannia Arms Downtown rebranded to "The Brit" but retains the Britannia Arms name on Yelp, Visit San Jose, and Foursquare. The Almaden location kept the "Britannia Arms" name. We used "The Brit" for downtown (matching their current website thebritsj.com) and "Britannia Arms Almaden" for the southern location (matching britanniaarms.com). Both are independent operations despite the shared heritage.

**Silicon Valley suburbs are genuine soccer destinations, not filler.** Duke of Edinburgh (Cupertino, 1983) predates the modern American soccer bar trend by decades -- everything inside was literally shipped from England. St. Stephen's Green (Mountain View) is Irish-owned and bills itself as a "Premier All Sports Irish Bar." Double D's (Los Gatos) has won Mercury News Best Sports Bar every year since opening and is an Earthquakes watch party location on GameWatch.info. These aren't padding -- they serve real soccer communities in areas with no nearby alternatives.

**Visit San Jose (sanjose.org) uses Simpleview CMS with reliable CDN images.** Same pattern as Visit Cincy (Cincinnati) -- relative URLs under `/sites/default/files/styles/listing_detail_image/public/` that resolve to full-size webp images. Covered 5 of 10 bars (O'Flaherty's, Jack's, Old Wagon, The Brit, Rookies Willow Glen). SF Station CDN covered Britannia Arms Almaden and Rookies Downtown. Duke of Edinburgh and St. Stephen's Green have their own Squarespace and Cloudflare Images CDNs respectively.

**Excluded bars and why:**
- Wicked Chicken (Santa Clara) -- permanently closed per Yelp (December 2025)
- La Catalana -- tapas restaurant, not a soccer bar despite appearing on GoodRec list
- The Plex / Penalty Box -- indoor soccer facility with a bar, not a soccer-watching bar
- Zone 8 Sports Bar -- inside Casino M8trix, general sports bar with no soccer-specific identity
- The Caravan Lounge -- live music venue, not sports-focused
- Hapa's Brewing -- craft brewery on GameWatch.info but no evidence of soccer programming
- Pancho's Sports Bar -- Latin sports bar, no soccer-specific sources beyond Yelp generic listing

---

### Pittsburgh Expansion -- USL City with Deep EPL Supporter Culture

Pittsburgh is a mid-size market without an MLS team, but the Riverhounds SC (USL Championship) and an unusually organized EPL supporter ecosystem make it a strong soccer bar city. Key lessons:

**Piper's Pub is Pittsburgh's soccer origin story.** The South Side pub opened in 1999 and became the city's first dedicated soccer bar. The Steel Army (Riverhounds supporters) held their founding meeting there in 2007. Even after closing during COVID and reopening with limited weekend-only hours, Piper's remains the spiritual home of Pittsburgh soccer. It's on the Premier League USA Bar Finder and hosts the official Pittsburgh Spurs (Tottenham). The Pitch on Butler was opened by a Piper's Pub veteran (Bryan Muha) on Boxing Day 2023 -- a direct lineage from Pittsburgh's original soccer bar.

**Cork Harbour is the new epicenter.** Opened October 2022 in Lawrenceville, Cork Harbour rapidly became Pittsburgh's most loaded soccer schedule -- EPL, Bundesliga, Champions League, Eredivisie, Scottish Premiership. It hosts both the Steel City Gooners (Arsenal, an Arsenal America branch) and the Pittsburgh Celtic Supporters Club (est. 2020). CelticBars.com and Arsenal America both list it as the official home. This is a pattern we've seen in other cities -- a newer Irish pub displaces the old guard (Piper's) as the day-to-day soccer hub while the original retains cultural significance.

**Pittsburgh's bar scene clusters in two corridors.** South Side (Carson Street) has Piper's Pub, Jack's Bar, and Hofbrauhaus -- the historic soccer bar strip. Lawrenceville (Butler Street + 43rd) has Cork Harbour, The Pitch on Butler, and Thunderbird Cafe -- the new soccer bar corridor. North Side has Mike's Beer Bar and Monterey Pub. Morningside's Bulldog Pub is the lone outlier in the East End. This two-corridor pattern is different from cities like St. Louis (stadium cluster + neighborhood hub) or Detroit (scattered by supporter group).

**The Riverhounds-Mike's Beer Bar partnership model.** Mike's Beer Bar became the official Riverhounds watch party home in 2022 -- complete with a custom Riverhounds Amber Lager brewed by Straub Brewery, stadium signage, and a presenting partnership for Community Heroes Night. This is a lighter version of the MLS pub partner model (no 60+ bar lists like SDFC or Charlotte FC), but it gives us a verified team-bar connection.

**Supporter groups are well-organized but small.** Pittsburgh Spurs (Tottenham) at Piper's Pub, Steel City Gooners (Arsenal) at Cork Harbour, Pittsburgh Celtic SC at Cork Harbour, Crystal Palace supporters at Thunderbird Cafe. The LFC Pittsburgh club (OLSC, class of 2014) meets at Industry Public House in North Fayette -- too far from the city center to include. No Chelsea, Manchester United, or Manchester City supporter clubs found in Pittsburgh.

**FourDollarJacks + p2bars continue to be reliable image sources.** FourDollarJacks provided images for Bulldog Pub, Monterey Pub, and The Pitch on Butler. A new discovery: p2bars.com (same CDN pattern as FourDollarJacks, using img.p2bars.com) had Jack's Bar images. Pittsburgh Magazine's feature article on Cork Harbour had professional photos. Visit Pittsburgh's IDSS/Imgix CDN had Mike's Beer Bar. All 9 bars achieved 100% image coverage on first pass.

**Excluded bars and reasoning:** Claddagh Irish Pub closed permanently in 2019. Oliver's Pourhouse is in Greensburg (30+ miles out). Carmella's Plates & Pints appeared on Yelp soccer bar lists but is really a cocktail/whiskey bar with 700+ whiskies -- no soccer-specific evidence. Mullaney's Harp & Fiddle is a genuine Irish pub in the Strip District but closed Sunday/Monday and no soccer sources confirmed it. Industry Public House (LFC Pittsburgh home) is in North Fayette Township, a suburb 15 miles from downtown.

---

### Salt Lake City Expansion -- MLS Pioneer Market with Strong Supporter Ecosystem

Salt Lake City is one of the earliest MLS markets (Real Salt Lake since 2005) and has a mature but dispersed soccer bar scene. Unlike newer MLS expansion cities where the team creates the bar ecosystem (St. Louis, Charlotte), RSL's 20+ year history means soccer bars evolved organically alongside the club.

**The supporter club network is the most valuable research layer.** Four verified EPL supporter groups have dedicated home bars: Utah Gooners (Arsenal) at Fiddler's, SLC Spurs (Tottenham) at Legends Pub & Grill, Salt Lake City Reds (Liverpool) at Crossroads Bar & Grill, and AO Salt Lake City (USMNT) at Beer Bar. The Soccer.Town directory also lists Manchester City and Everton supporters at Beer Bar. These verified team-bar affiliations are the strongest data points in the whole SLC dataset.

**The Fiddler's Elbow closure/rebrand is a cautionary tale.** The bar closed in August 2024 after decades in Sugar House, then reopened mid-2025 under new ownership as simply "Fiddler's." Arsenal.com's fan page still lists "Fiddler's Elbow" as the Utah Gooners home. We listed it under the new name ("Fiddler's") since that is what is currently operating. This is a good example of why always verifying current operating status matters -- older sources can be dangerously stale.

**RSL watch party venues are real but have weaker soccer credentials.** GameWatch.info lists 19 RSL watch party locations, but many are generic sports bars with no soccer-specific identity (A Bar Named Sue, Beer Bar, Twist, Bourbon House, etc.). We included only those with multiple corroborating sources confirming soccer as a primary identity: Piper Down (Irish pub, Irish Times competition entry), Poplar Street Pub (30 screens, 3 floors), Gracie's (35 screens, opens early). Excluded the more generic options that just happen to show RSL.

**Dick N' Dixie's as a unique archetype.** The Salt Lake Tribune described it as a bar where "the game of choice is soccer" with "RSL paraphernalia on the walls" and "RSL players often stopping by after home games." This dive-bar-meets-soccer-shrine archetype is rare in our database -- most RSL bars are polished sports bars. It adds texture to the SLC collection.

**Flanker Kitchen + Sporting Club is the most ambitious venue we have.** At 17,500 sqft with 60+ LED screens (including two 20-foot displays), it dwarfs every other bar in our database. It actively markets itself as a soccer destination with a dedicated landing page for "where to watch soccer games in Salt Lake City" that functions as its own mini guide. This self-positioning as the soccer authority in SLC is unusual for a sports bar.

**Image sourcing strategy:** FourDollarJacks CDN continued to be the most reliable source (7 of 12 bars). Official websites worked for Flanker (WordPress), Crossroads (Webflow CDN), and The Bruce (Webflow CDN). Gastronomic SLC's reopening article provided a timely interior photo of the newly rebranded Fiddler's. Squarespace CDN served Beer Bar and Shades Brewing.

**Excluded bars and why:**
- Bout Time Pub & Grub, Rio Grande (CLOSED per Yelp Oct 2025, replaced by The Bruce)
- Trolley Wing Co, 2148 S 900 E (CLOSED per Yelp Feb 2026)
- Ice Haus (hockey-focused gastropub, weak soccer credentials)
- Big Willies (Utah Hockey Club watch party venue, not soccer-specific)
- Brickyard Bar ("Home of the Utes," college sports focus)
- Calle (futsal court/event venue, not a traditional watch bar)
- The Point After (Murray suburb, general sports bar despite 40 TVs)
- Tailgate Tavern (neighborhood dive, no soccer-specific identity)
- Bar 110 West / Paxton Pub / Neutral Ground / Duffy's (GoodRec filler picks with no soccer sourcing)

---

### Sacramento Expansion -- First California City, USL Market with MLS Aspirations

Sacramento is an interesting case because it has a strong soccer culture driven by Sacramento Republic FC (USL Championship) despite not (yet) having an MLS team. The club's MLS bid was placed on hold in 2021 when investor Ron Burkle pulled out, but a new Railyards stadium was approved in 2025 and the club is pursuing MLS expansion with new tribal ownership (Wilton Rancheria).

**Supporter clubs define the bar landscape.** Unlike MLS cities with official pub partner programs that hand us a ready-made list, Sacramento's soccer bar scene is built from the ground up by EPL supporter clubs and grassroots groups:
- River City Red Devils (Manchester United, founded 2012) claimed the Zebra Club in 2013
- Sacramento Spurs (Tottenham, 75+ members, founded 2014) joined at the same Zebra Club
- Sacramento Gooners (Arsenal) operate from Henry's Lounge
- LFC Sacramento (Official Liverpool Supporters Club) operate from Fieldhouse American Sports Pub
- American Outlaws Sacramento (USMNT) also at Henry's Lounge

The Zebra Club is the undisputed center of Sacramento soccer. A Yahoo News/Sacramento Bee feature article confirmed nearly 100 fans packed in for the Europa League final, making it the only bar in the market with documented large-scale soccer events.

**Republic FC's Blood, Sweat & Beers Council is the closest thing to a pub partner program.** Rather than direct bar partnerships, Republic FC created a "brewing council" led by Jackrabbit Brewing Company. Member breweries host watch parties and feature their beers at matches. Sky River Casino's 32 Brews Street Gastropub is the official casino watch party venue, but it's inside a casino complex (less useful for our directory).

**Sacramento's British pub heritage is strong for a non-MLS city.** Fox & Goose Public House (1975) is one of the oldest British pubs in California, named after the owner's hometown pub in Hebden Bridge, Yorkshire. Streets of London in West Sacramento is a proper British pub with Premier League and rugby on screens. These institutions predate the modern American soccer bar trend.

**de Vere's Irish Pub closure is a significant loss.** de Vere's was THE Premier League bar in Sacramento, opening as early as 2:30 AM for matches. It closed in October 2021 due to pandemic losses. CBS Sacramento still lists it in their "best bars to watch Premier League" article (published before closure), which can cause confusion for researchers who don't verify current status.

**West Sacramento as a separate city:** Like Covington KY (Cincinnati) and Hamtramck MI (Detroit), West Sacramento is technically a separate city across the Sacramento River. Created a separate city entry for Streets of London and Jackrabbit Brewing. Tower Bridge -- the actual bridge connecting Sacramento and West Sacramento -- is the namesake of the Tower Bridge Battalion supporter group.

**Excluded and why:**
- de Vere's Irish Pub (CLOSED October 2021)
- Hot Italian (CLOSED, replaced by 5 Tacos & Beers)
- Tapa the World (primarily a Spanish tapas restaurant, not a soccer bar)
- Clubhouse 56 (general sports bar, no soccer identity)
- Sean Finnegan's (Irish pub in Old Sacramento, no soccer-specific programming)
- 32 Brews Street Gastropub (inside Sky River Casino, not a traditional bar)

---

### St. Louis Expansion -- MLS Team Launch Creates Rich Ecosystem

St. Louis is a fascinating case study in how an MLS expansion team (St. Louis CITY SC, 2023) creates an entire ecosystem of soccer bars where none existed before. The city had Amsterdam Tavern since 2008 as its sole dedicated soccer venue. Once CITY SC arrived, the landscape exploded:

**The CITY on Tap network is the best single source.** St. Louis CITY SC's "CITY on Tap presented by Michelob ULTRA" program officially partners with bars citywide. St. Louis Magazine's playoff watch party guide + KSDK's season watch party list provided the complete roster of partner venues. This is the same pattern seen with Charlotte FC's bar network and San Diego FC's pub partners -- MLS teams create verified bar lists for us.

**Supporter groups are deeply organized.** The St. Louligans (founded 2010) are the anchor -- they have a branded beer (Brewligans IPA at 2nd Shift Brewing), an official pre-match street party at Schlafly Tap Room, and a longtime home bar at International Tap House Soulard. Beyond the Louligans, EPL supporter groups (Gateway Gooners for Arsenal, Mia San STL for Bayern Munich) have established Llywelyn's Pub in Webster Groves as the European football hub. STL Santos (Hispanic supporters) gather at Beffa's and The Marquee.

**Stadium proximity creates a bar cluster.** Energizer Park (formerly CITYPARK) at Market & 20th spawned The Pitch Athletic Club across the street, and elevated existing bars like Maggie O'Brien's and Schlafly Tap Room into de facto soccer bars. This is different from cities where soccer bars are scattered -- in St. Louis, there is a clear Downtown West cluster around the stadium plus a neighborhood hub in Tower Grove South (Amsterdam Tavern).

**FourDollarJacks.com as a new image source.** Discovered this bar directory that hosts Google-sourced images on their own CDN (img.fourdollarjacks.com). Every bar listing has 8-10 photos in webp format that are directly fetchable. Useful for bars with Wix sites (like International Tap House) or those behind paywalls. Found excellent images for both iTap (outdoor beer tap fountain) and Beffa's (CITY SC fans on match day).

**Excluded bars and why:**
- DB Cooper's Safe House (temporarily closed as of June 2025)
- Armory STL (permanently closed per Yelp Feb 2026)
- Hattrick's Irish Sports Pub (O'Fallon -- too far from city core)
- 9 Mile Garden (Affton food truck garden, not a traditional bar)
- McGurk's Irish Pub (primarily Irish music/garden, weak soccer credentials)
- Pat Connolly Tavern (historic Irish pub, no soccer-specific connection despite being CITY on Tap)

---

### Detroit City Expansion -- Soccer Culture Drives Bar Discovery

Detroit has a uniquely strong soccer culture for a city without an MLS team. Detroit City FC (USL Championship) and its Northern Guard Supporters have built a grassroots soccer community that rivals many MLS cities. This meant the research approach was different from typical city expansions.

**Key insight -- Supporter clubs are the backbone:** Detroit's soccer bar scene is defined by EPL supporter clubs that each claimed their own pub. A 2019 Detroit News article described how multi-club Soccer Saturdays at the now-closed Red Fox English Pub splintered as groups grew -- Liverpool to Thomas Magee's, Arsenal to McShane's, Chelsea/Man City to Royal Oak Brewery, Tottenham to Mercury Burger Bar. This fragmentation is actually a sign of a healthy soccer community.

**MI Football Social as a research source:** The MI Football Social app/network connects Michigan soccer fans with pubs showing matches. It confirmed supporter club home bars that other sources only hinted at, including Celtic supporters at Collect Beer Bar and West Ham at Detroit City Clubhouse.

**DCFC pre-match bars are legitimate soccer bars:** Fowling Warehouse and New Dodge Lounge are not traditional soccer-watching bars (no EPL brunch, no big screens). But they are essential to Detroit's soccer culture as the March to the Match staging grounds. Including them captures what makes Detroit's soccer scene distinctive -- the matchday experience starts at the bar, not the stadium.

**Hamtramck vs Detroit distinction matters:** Fowling Warehouse, New Dodge Lounge, and Motor City Sports Bar are technically in Hamtramck (an independent city surrounded by Detroit). Created a separate Hamtramck city entry to keep data accurate, similar to how Arlington was separated from Washington DC.

**Suburban bars expand the metro picture:** Royal Oak Brewery (Royal Oak), Commonwealth Club (Warren), and Sean O'Callaghan's (Plymouth) are 15-30 minutes from downtown Detroit. Including them shows the full metro soccer ecosystem. The Commonwealth Club is especially unique -- an English expat social club since 1962 that predates the modern American soccer bar trend by decades.

**OnTheGrid.city is an excellent image source for Detroit bars.** Their S3-hosted photos of Mercury Burger Bar and Fowling Warehouse are high-quality professional shots, directly downloadable, and cover many independent Detroit venues that don't have accessible images on their own sites.

---

### Adding Cincinnati -- FC Cincinnati's MLS Ecosystem Is a Research Gold Mine

Researched Cincinnati soccer bars from scratch. Cincinnati's FC Cincinnati (MLS) has created a strong organized soccer ecosystem that makes research easier than most cities.

**What makes Cincinnati unique as a research target:**

1. **The Incline Collective** -- FC Cincinnati's supporter groups are organized under a single umbrella body (inclinecincy.com/groups). This single page lists all groups (Die Innenstadt, The Pride, The Briogaid, 5th Line, etc.) and their meeting locations. This is unusual -- most cities require hunting across 10+ separate supporter club websites.

2. **FC Cincinnati Pub Partners (60+)** -- FCC publishes an official pub partner list (fccincinnati.com/matchday/pub-partners/). While the actual list is behind an Apple Maps guide (not scrapeable), the annual announcement articles name key partners. Cross-referencing the pub partner program with soccer bar lists from other sources creates high-confidence matches.

3. **The March** -- FC Cincinnati's pregame ritual (all supporter groups walk from Northern Row Brewery to TQL Stadium) creates a natural geographic anchor. Bars near the march route and TQL Stadium are reliable soccer bars.

4. **EPL supporter groups at Rhinehaus** -- The Rhinehaus bar page explicitly lists all the supporter groups that meet there: LFC Cincinnati, Ohio Blues, Cincy Gooners, Cincy Villains, Cincy Hammers. This level of self-identification is rare and gives us verified team affiliations without needing to cross-reference external sources.

**Covington KY as a Cincinnati suburb:** Two of the best soccer bars (Molly Malone's and Cock & Bull) are technically in Covington, Kentucky, across the Ohio River. Created a separate city entry for Covington rather than mislabeling them as Cincinnati. Same approach used for Arlington VA with DC.

**Closed bar pattern continues:** Fifty West Brewing (Yelp says CLOSED), Lachey's (closed 2018), Cock & Bull Hyde Park (closed), Cock & Bull Glendale (closed). Four of ~16 candidates were closed. This ~25% closure rate matches what we saw in DC (Across the Pond, Fado). Lesson: always verify current status before adding.

**Image sourcing for Cincinnati was unusually easy.** Visit Cincy (visitcincy.com) uses Simpleview CMS with directly accessible CDN URLs for most bars. Cincinnati Refined (cincinnatirefined.com) has accessible images for all their articles. Cincinnati Design Awards had professional Phil Armstrong photos of The Pitch Cincy interior. OpenTable worked for Nicholson's. Only Hap's Irish Pub required going to a third-party aggregator (fourdollarjacks.com) since the official site is Wix.

---

### Las Vegas City Expansion -- Research Methodology for a World Cup Host City

Las Vegas is distinctive from previous city expansions (like DC) because it is a tourism/hospitality city rather than a residential one. This changes the bar landscape significantly:

**Strip vs. Locals divide:** Las Vegas soccer bars split cleanly into two categories: (1) Strip resort bars inside casino properties (Ri Ra at Mandalay Bay, Flanker at Mandalay Bay, Blondies at Planet Hollywood, Nine Fine Irishmen at NYNY) and (2) locals bars in residential neighborhoods (McMullan's in Spring Valley, Crown & Anchor in Chinatown, Four Kegs off Jones Blvd, Jackpot Bar on Jones). The Strip bars cater to tourists and visiting fans; the locals bars are where the supporter clubs actually meet. Both matter for different reasons -- a visiting fan checking SoccerBars during a Vegas trip needs the Strip options, while a local Arsenal or Liverpool supporter needs the neighborhood pubs.

**24/7 bars change the "opens early" calculus:** In most cities, "opens early for morning Premier League" is a meaningful differentiator. In Las Vegas, 8 of 12 bars are open 24/7 by default. McMullan's, Crown & Anchor, Four Kegs, Kickers, and Jackpot never close. The question becomes not "do they open early" but "do they actually show soccer at 4:30 AM PT for a 12:30 PM GMT kickoff?" McMullan's website explicitly lists every match; most 24/7 bars do not guarantee soccer will be on the screens.

**Supporter clubs are fewer but verified:** Found only 3 specific team affiliations with dedicated supporter presence: Liverpool FC at McMullan's (official LFC supporters club), Arsenal FC at Jackpot Bar (official Arsenal America branch), and USMNT at Hennessey's (American Outlaws since 2011). Crystal Palace and Everton historically at Crown & Anchor's now-closed Tropicana location -- unclear if these groups moved to the Spring Mountain location. Most Vegas bars are general sports bars that show soccer rather than dedicated team bars.

**Crown & Anchor closure complication:** The original Crown & Anchor on Tropicana (opened 1995) closed suddenly in July 2024. The "Little Crown & Anchor" at 4755 Spring Mountain is the surviving location. The Premier League USA Bar Finder still lists the old Tropicana address. We included the Spring Mountain location, which is open and operating, but it is a smaller venue than the original.

**Hofbrauhaus as a soccer bar archetype:** This is our first German beer hall in the database. It represents a distinct archetype from the Irish/British pub model -- it primarily shows Bundesliga and German national team matches, plus World Cup, rather than Premier League. This is valuable diversity for a directory that is heavily EPL-weighted.

**Best research sources for Las Vegas (ranked):**
1. Las Vegas Review-Journal (reviewjournal.com/neon) -- Best local journalism, World Cup coverage, Crown & Anchor closure photos
2. GoodRec top-10 list (goodrec.com) -- Comprehensive soccer bar ranking with ratings
3. Neighborhoods.com soccer pub list -- 5 curated picks with good detail
4. Upbeat Vegas footy guide -- British-authored, understands soccer bar culture
5. Premier League USA Bar Finder -- Crown & Anchor listed
6. Official websites (mcmullansirishpub.com/sports, rira.com, flankerlv.com) -- Sports schedules and match listings
7. American Outlaws / Arsenal America / Liverpool FC -- Supporter club directories for verified affiliations
8. Fanzo/MatchPint CDN -- Images for 2 bars (Kickers, The Front Yard)

**Image sourcing notes:** The Las Vegas Review-Journal (neon.reviewjournal.com) was the single best image source -- provided photos for both Crown & Anchor and Hofbrauhaus from feature articles. WordPress blog articles (The Gate for Ri Ra) and official websites (McMullan's Webflow CDN, Flanker WordPress, Jackpot WordPress, Blondies direct, Kickers Squarespace) covered most others. Las Vegas Magazine provided Nine Fine Irishmen. MatchPint/Fanzo CDN worked for Kickers and The Front Yard. All 12 bars got images -- 100% coverage on first pass.

---

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
