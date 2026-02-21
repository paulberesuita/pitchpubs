-- Georgia/Atlanta Quality Enrichment
-- Added: 2026-02-20
-- Fixes image URLs (all 15 bars had broken R2 references), adds EPL supporter club
-- team affiliations, expands league tags, updates descriptions, normalizes state to "Georgia"
-- Sources: arsenal.com (Atlanta Gooners), liverpoolfc.com (OLSC Atlanta),
--          chelseainamerica.com (Atlanta Blues CFC), tottenhamhotspur.com (Atlanta Spurs),
--          atlmufc.com (ATLMUFC), mancityatlcityzens.com (ATL Cityzens),
--          theamericanoutlaws.com (AO Atlanta), atlutd.com (Pub Partner Program),
--          discoveratlanta.com, matadornetwork.com, atlantaeats.com, scarvesandspikes.com,
--          yelp.com, midtownatl.com, fourdollarjacks.com, brewhousecafe.com

-- ============================================================
-- FIX STATE: Normalize "GA" to "Georgia" for consistency with newer cities
-- ============================================================
UPDATE bars SET state = 'Georgia' WHERE state = 'GA';
UPDATE cities SET state = 'Georgia' WHERE state = 'GA';

-- ============================================================
-- FIX IMAGE URLs: Update to actual R2-uploaded file paths
-- ============================================================
UPDATE bars SET image_url = 'bars/atlanta/brewhouse-cafe-atlanta.jpg' WHERE slug = 'brewhouse-cafe-atlanta';
UPDATE bars SET image_url = 'bars/atlanta/fado-irish-pub-midtown-atlanta.jpg' WHERE slug = 'fado-irish-pub-midtown-atlanta';
UPDATE bars SET image_url = 'bars/atlanta/fado-irish-pub-buckhead-atlanta.jpg' WHERE slug = 'fado-irish-pub-buckhead-atlanta';
UPDATE bars SET image_url = 'bars/atlanta/der-biergarten-atlanta.jpg' WHERE slug = 'der-biergarten-atlanta';
UPDATE bars SET image_url = 'bars/atlanta/the-midway-pub-atlanta.webp' WHERE slug = 'the-midway-pub-atlanta';
UPDATE bars SET image_url = 'bars/atlanta/limerick-junction-pub-atlanta.webp' WHERE slug = 'limerick-junction-pub-atlanta';
UPDATE bars SET image_url = 'bars/atlanta/meehans-public-house-atlanta.jpg' WHERE slug = 'meehans-public-house-atlanta';
UPDATE bars SET image_url = 'bars/atlanta/the-albert-atlanta.jpg' WHERE slug = 'the-albert-atlanta';
UPDATE bars SET image_url = 'bars/atlanta/park-tavern-atlanta.jpg' WHERE slug = 'park-tavern-atlanta';
UPDATE bars SET image_url = 'bars/atlanta/stats-brewpub-atlanta.jpg' WHERE slug = 'stats-brewpub-atlanta';
UPDATE bars SET image_url = 'bars/atlanta/the-pub-at-eav-atlanta.jpg' WHERE slug = 'the-pub-at-eav-atlanta';
UPDATE bars SET image_url = 'bars/atlanta/sports-and-social-atlanta.jpg' WHERE slug = 'sports-and-social-atlanta';
UPDATE bars SET image_url = 'bars/atlanta/brewdog-atlanta.jpg' WHERE slug = 'brewdog-atlanta';
UPDATE bars SET image_url = 'bars/atlanta/osullivans-irish-pub-decatur.webp' WHERE slug = 'osullivans-irish-pub-decatur';
-- The Tavern at Battery: keep existing image_url but note no verified R2 file yet

-- ============================================================
-- ADD EPL SUPPORTER CLUB TEAM AFFILIATIONS
-- ============================================================

-- Arsenal FC --> Brewhouse Cafe (Atlanta Gooners home since 2011, confirmed on arsenal.com)
INSERT OR IGNORE INTO bar_teams (bar_id, team_slug, team_name)
SELECT id, 'arsenal-fc', 'Arsenal FC' FROM bars WHERE slug = 'brewhouse-cafe-atlanta';

-- Liverpool FC --> Fado Buckhead (OLSC Atlanta home, confirmed on liverpoolfc.com)
INSERT OR IGNORE INTO bar_teams (bar_id, team_slug, team_name)
SELECT id, 'liverpool-fc', 'Liverpool FC' FROM bars WHERE slug = 'fado-irish-pub-buckhead-atlanta';

-- Manchester United FC --> Fado Midtown (ATLMUFC home, confirmed on atlmufc.com and midtownatl.com)
INSERT OR IGNORE INTO bar_teams (bar_id, team_slug, team_name)
SELECT id, 'manchester-united-fc', 'Manchester United FC' FROM bars WHERE slug = 'fado-irish-pub-midtown-atlanta';

-- Chelsea FC --> Fado Midtown (Atlanta Blues CFC, confirmed on chelseainamerica.com)
INSERT OR IGNORE INTO bar_teams (bar_id, team_slug, team_name)
SELECT id, 'chelsea-fc', 'Chelsea FC' FROM bars WHERE slug = 'fado-irish-pub-midtown-atlanta';

-- Manchester City FC --> Brewhouse Cafe (ATL Cityzens home, confirmed on mancityatlcityzens.com)
INSERT OR IGNORE INTO bar_teams (bar_id, team_slug, team_name)
SELECT id, 'manchester-city-fc', 'Manchester City FC' FROM bars WHERE slug = 'brewhouse-cafe-atlanta';

-- US Men's National Team --> Fado Midtown (American Outlaws Atlanta chapter, confirmed on theamericanoutlaws.com)
INSERT OR IGNORE INTO bar_teams (bar_id, team_slug, team_name)
SELECT id, 'us-mens-national-team', 'US Men''s National Team' FROM bars WHERE slug = 'fado-irish-pub-midtown-atlanta';

-- ============================================================
-- EXPAND LEAGUE AFFILIATIONS
-- (Many bars only had MLS; adding Premier League, Champions League, etc.)
-- ============================================================

-- Fado Midtown: add Premier League, Champions League, International
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'premier-league', 'Premier League' FROM bars WHERE slug = 'fado-irish-pub-midtown-atlanta';
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'champions-league', 'Champions League' FROM bars WHERE slug = 'fado-irish-pub-midtown-atlanta';
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'international', 'International' FROM bars WHERE slug = 'fado-irish-pub-midtown-atlanta';

-- Fado Buckhead: add Premier League, Champions League
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'premier-league', 'Premier League' FROM bars WHERE slug = 'fado-irish-pub-buckhead-atlanta';
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'champions-league', 'Champions League' FROM bars WHERE slug = 'fado-irish-pub-buckhead-atlanta';

-- Der Biergarten: add Premier League, Bundesliga, Champions League, International
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'premier-league', 'Premier League' FROM bars WHERE slug = 'der-biergarten-atlanta';
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'bundesliga', 'Bundesliga' FROM bars WHERE slug = 'der-biergarten-atlanta';
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'champions-league', 'Champions League' FROM bars WHERE slug = 'der-biergarten-atlanta';
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'international', 'International' FROM bars WHERE slug = 'der-biergarten-atlanta';

-- Limerick Junction: add Premier League
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'premier-league', 'Premier League' FROM bars WHERE slug = 'limerick-junction-pub-atlanta';

-- Meehan's: add Premier League
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'premier-league', 'Premier League' FROM bars WHERE slug = 'meehans-public-house-atlanta';

-- The Albert: add Premier League
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'premier-league', 'Premier League' FROM bars WHERE slug = 'the-albert-atlanta';

-- Park Tavern: add Premier League, International
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'premier-league', 'Premier League' FROM bars WHERE slug = 'park-tavern-atlanta';
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'international', 'International' FROM bars WHERE slug = 'park-tavern-atlanta';

-- STATS Brewpub: add Premier League, Champions League, La Liga, Bundesliga, International
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'premier-league', 'Premier League' FROM bars WHERE slug = 'stats-brewpub-atlanta';
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'champions-league', 'Champions League' FROM bars WHERE slug = 'stats-brewpub-atlanta';
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'la-liga', 'La Liga' FROM bars WHERE slug = 'stats-brewpub-atlanta';
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'bundesliga', 'Bundesliga' FROM bars WHERE slug = 'stats-brewpub-atlanta';
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'international', 'International' FROM bars WHERE slug = 'stats-brewpub-atlanta';

-- The Pub @ EAV: add Premier League
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'premier-league', 'Premier League' FROM bars WHERE slug = 'the-pub-at-eav-atlanta';

-- The Tavern: add Premier League
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'premier-league', 'Premier League' FROM bars WHERE slug = 'the-tavern-battery-atlanta';

-- Sports & Social: add Premier League
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'premier-league', 'Premier League' FROM bars WHERE slug = 'sports-and-social-atlanta';

-- BrewDog: add Premier League, Champions League, La Liga, Bundesliga, Serie A
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'premier-league', 'Premier League' FROM bars WHERE slug = 'brewdog-atlanta';
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'champions-league', 'Champions League' FROM bars WHERE slug = 'brewdog-atlanta';
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'la-liga', 'La Liga' FROM bars WHERE slug = 'brewdog-atlanta';
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'bundesliga', 'Bundesliga' FROM bars WHERE slug = 'brewdog-atlanta';
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'serie-a', 'Serie A' FROM bars WHERE slug = 'brewdog-atlanta';

-- O'Sullivan's: add Premier League
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'premier-league', 'Premier League' FROM bars WHERE slug = 'osullivans-irish-pub-decatur';

-- Brewhouse: add Champions League, International, FIFA World Cup (already has PL, MLS, La Liga, Serie A, Bundesliga)
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'champions-league', 'Champions League' FROM bars WHERE slug = 'brewhouse-cafe-atlanta';
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'international', 'International' FROM bars WHERE slug = 'brewhouse-cafe-atlanta';
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'fifa-world-cup', 'FIFA World Cup' FROM bars WHERE slug = 'brewhouse-cafe-atlanta';

-- Midway: add Champions League, International (already has MLS, PL)
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'champions-league', 'Champions League' FROM bars WHERE slug = 'the-midway-pub-atlanta';
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'international', 'International' FROM bars WHERE slug = 'the-midway-pub-atlanta';

-- ============================================================
-- ENRICH DESCRIPTIONS (rewrite thin ones with verified details)
-- ============================================================

-- Fado Midtown: add EPL supporter club info + AO chapter
UPDATE bars SET description = 'Authentic Irish pub with 32 screens in a 250-seat venue, interior designed and constructed in Ireland. Official Atlanta United Pub Partner and the epicenter of Atlanta''s EPL supporter culture -- home to ATLMUFC (Manchester United), Atlanta Blues CFC (Chelsea), and the American Outlaws Atlanta chapter (USMNT). Opens early for Premier League, Champions League, and international matches. Known for excellent whiskey selection and traditional Irish atmosphere.',
source_count = 6,
sources = '["https://discoveratlanta.com/stories/things-to-do/where-to-watch-soccer-in-atlanta/", "https://www.atlutd.com/fans/pub-partner-program", "https://www.yelp.com/biz/fado-irish-pub-atlanta-15", "https://www.cbsnews.com/atlanta/news/best-bars-to-watch-premier-league-soccer-in-atlanta/", "https://atlmufc.com/", "https://www.midtownatl.com/post/love-local-fado-midtown-embraces-shamrocks-and-soccer"]'
WHERE slug = 'fado-irish-pub-midtown-atlanta';

-- Fado Buckhead: add Liverpool OLSC info
UPDATE bars SET description = 'Three-story Irish pub with rooftop patios in Buckhead Village. Official Atlanta United Pub Partner and home of OLSC Atlanta, the Official Liverpool Supporters Club, who gather here for every Reds match. Shows Premier League, Champions League, international matches, and all ATLUTD games. Interior designed in Ireland. Free parking validation for 3 hours.',
source_count = 5,
sources = '["https://discoveratlanta.com/stories/things-to-do/where-to-watch-soccer-in-atlanta/", "https://www.atlutd.com/fans/pub-partner-program", "https://www.yelp.com/biz/fad%C3%B3-irish-pub-atlanta-16", "https://www.tripadvisor.com/Restaurant_Review-g60898-d444235-Reviews-Fado_Irish_Pub-Atlanta_Georgia.html", "https://www.olscatlanta.com/"]'
WHERE slug = 'fado-irish-pub-buckhead-atlanta';

-- Der Biergarten: add World Cup relevance
UPDATE bars SET description = 'Authentic German beer garden with 7,000+ square feet of indoor/outdoor space, steps from Mercedes-Benz Stadium. Long-time Atlanta United supporters headquarters. Premium German beer on tap, traditional cuisine, Fussball tables, and shuffleboard. Hosts major watch parties with ticket giveaways. A prime World Cup 2026 viewing destination given its proximity to the stadium, Georgia Aquarium, and CNN Center.',
source_count = 5,
sources = '["https://discoveratlanta.com/stories/things-to-do/where-to-watch-soccer-in-atlanta/", "https://www.atlutd.com/fans/pub-partner-program", "https://www.yelp.com/biz/der-biergarten-atlanta", "https://matadornetwork.com/read/soccer-bars-in-atlanta/", "https://scarvesandspikes.com/atlanta-world-cup-bars/"]'
WHERE slug = 'der-biergarten-atlanta';

-- The Midway Pub: add Footie Mob detail
UPDATE bars SET description = 'Home of Footie Mob, one of Atlanta United''s original and largest independent supporter clubs. Hosts away match watch parties that pack the bar with passionate fans in Five Stripes gear. Known for a huge beer selection, garlic pretzels, chicken fingers, and a dog-friendly patio in the heart of East Atlanta Village. Big screen TVs and a projector for all the action. Opens early for Premier League.',
source_count = 5,
sources = '["https://discoveratlanta.com/stories/things-to-do/where-to-watch-soccer-in-atlanta/", "https://www.yelp.com/biz/the-midway-pub-atlanta", "https://matadornetwork.com/read/soccer-bars-in-atlanta/", "https://www.theinfatuation.com/atlanta/reviews/midway-pub", "https://www.fourdollarjacks.com/bars-near-me/the-midway-pub"]'
WHERE slug = 'the-midway-pub-atlanta';

-- Meehan's Public House: add soccer detail
UPDATE bars SET description = 'Laid-back Irish pub in a landmark downtown building near Georgia Aquarium, World of Coca-Cola, and Mercedes-Benz Stadium. Known for proper pints, traditional Irish fare, and a warm, convivial atmosphere. Shows Premier League every weekend morning and all major soccer matches on multiple screens. Walking distance from World Cup 2026 venues, making it a natural pre-match gathering spot.',
source_count = 5,
sources = '["https://discoveratlanta.com/stories/things-to-do/where-to-watch-soccer-in-atlanta/", "https://www.yelp.com/biz/meehans-public-house-downtown-atlanta-2", "https://matadornetwork.com/read/soccer-bars-in-atlanta/", "https://www.cbsnews.com/atlanta/news/best-bars-to-watch-premier-league-soccer-in-atlanta/", "https://www.atlantaeats.com/blog/best-soccer-bars-atlanta/"]'
WHERE slug = 'meehans-public-house-atlanta';

-- STATS Brewpub: add more detail
UPDATE bars SET description = 'Massive 16,000-square-foot multi-level sports bar with 70+ screens and seven independent audio zones. Working brewery on-site crafting its own beers. Industrial-meets-chic vibe with exposed brick and steel. Steps from Mercedes-Benz Stadium, making it a prime spot for big international matches, Champions League nights, and World Cup 2026 viewing. Opens early for major soccer events.',
source_count = 4,
sources = '["https://discoveratlanta.com/stories/things-to-do/where-to-watch-soccer-in-atlanta/", "https://www.yelp.com/biz/stats-brewpub-atlanta", "https://sportsbars.com/best-sports-bars-in-atlanta-2025-the-definitive-guide-to-real-venues/", "https://matadornetwork.com/read/soccer-bars-in-atlanta/"]'
WHERE slug = 'stats-brewpub-atlanta';

-- Brewhouse Cafe: update source count to include more sources
UPDATE bars SET source_count = 8,
sources = '["https://discoveratlanta.com/stories/things-to-do/where-to-watch-soccer-in-atlanta/", "https://scarvesandspikes.com/2025/03/07/atlantas-own-brewhouse-cafe-voted-americas-best-soccer-bar-by-men-in-blazers/", "https://www.ajc.com/news/the-nations-best-soccer-bar-is-in-atlanta/", "https://www.atlutd.com/fans/pub-partner-program", "https://www.yelp.com/search?find_desc=Soccer+Bars&find_loc=Atlanta,+GA", "https://www.arsenal.com/usa/fanzone-usa/usa-supporters-club/atlanta-ga", "https://www.mancityatlcityzens.com/", "https://www.brewhousecafe.com/play"]'
WHERE slug = 'brewhouse-cafe-atlanta';

-- BrewDog: improve description
UPDATE bars SET description = 'Craft beer bar on the Beltline in Krog District with big screens dedicated to live sports. A proper British-owned brewery (HQ in Scotland) bringing authentic football culture to Atlanta. Fresh craft beer from their Ohio brewery plus experimental brews from on-site tanks. Shows Premier League, Champions League, Bundesliga, La Liga, and Serie A. Board games, arcade machines, shuffleboard, and a relaxed atmosphere for watching matches.',
source_count = 4,
sources = '["https://www.goodrec.com/blog/where-to-watch-soccer-atlanta-10-best-soccer-bars", "https://www.yelp.com/biz/brewdog-atlanta-atlanta", "https://www.thekrogdistrict.com/brewdog", "https://drink.brewdog.com/usa/atlanta"]'
WHERE slug = 'brewdog-atlanta';

-- O'Sullivan's: add more detail
UPDATE bars SET description = 'Authentic Irish pub in the heart of Decatur Square with 350+ whiskeys, including rare Irish, Scotch, and American selections. Official Atlanta United Pub Partner that opens early for weekend Premier League matches. Known for genuine Irish hospitality, cold pints, shepherd''s pie, and a loyal following of Decatur locals. A quieter, more neighborhood-focused alternative to the ITP soccer bars.',
source_count = 4,
sources = '["https://www.atlutd.com/fans/pub-partner-program", "https://www.yelp.com/biz/o-sullivans-pub-decatur", "https://exploregeorgia.org/decatur/food-drink/sports-bar-pubs/osullivans", "https://discoverdekalb.com/directory/osullivans/"]'
WHERE slug = 'osullivans-irish-pub-decatur';

-- Park Tavern: add more detail
UPDATE bars SET description = 'Iconic venue overlooking Piedmont Park with 25+ big-screen HDTVs, set in a 1905 Stone Mountain granite building originally built as horse stables. Official Atlanta United Pub Partner with watch parties for every match. Dog-friendly patio voted best in Atlanta, with stunning Midtown skyline views. On the Beltline. Floor-to-ceiling windows in the Piedmont Room create an unmatched atmosphere for watching soccer.',
source_count = 5,
sources = '["https://discoveratlanta.com/stories/things-to-do/where-to-watch-soccer-in-atlanta/", "https://www.atlutd.com/fans/pub-partner-program", "https://www.yelp.com/biz/park-tavern-atlanta", "https://www.atlantaeats.com/restaurants/park-tavern-2/", "https://www.partyslate.com/venues/park-tavern-piedmont-park"]'
WHERE slug = 'park-tavern-atlanta';

-- Update timestamps
UPDATE bars SET updated_at = datetime('now') WHERE state = 'Georgia';
