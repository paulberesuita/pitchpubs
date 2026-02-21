-- St. Louis, Missouri Soccer Bars
-- Added: 2026-02-20
-- 10 soccer bars in the St. Louis metro area
-- St. Louis CITY SC (MLS, joined 2023) makes this a prime soccer market
-- Sources: St. Louis Magazine, KSDK, Feast Magazine, STL Soccer News, GoodRec,
--          GameWatch.info, Fanzo, Sauce Magazine, St. Louligans, supporter club sites

-- Add St. Louis to cities table
INSERT OR IGNORE INTO cities (name, slug, state, is_world_cup_host) VALUES ('St. Louis', 'st-louis', 'Missouri', 0);

-- Add St. Louis CITY SC to teams table
INSERT OR IGNORE INTO teams (slug, name, league) VALUES ('st-louis-city-sc', 'St. Louis CITY SC', 'MLS');

-- ============================================================
-- BARS
-- ============================================================

-- 1. Amsterdam Tavern - THE soccer bar of St. Louis since 2008
INSERT INTO bars (slug, name, description, city, city_slug, state, neighborhood, address, opens_early, website, sources, source_count)
VALUES (
  'amsterdam-tavern-stl',
  'Amsterdam Tavern',
  'St. Louis''s premier soccer bar since 2008. Located in Tower Grove South with walls covered in scarves and jerseys from dozens of European clubs, Amsterdam Tavern opens early every weekend morning for Premier League and European matches. Named a top soccer bar in America by Sauce Magazine, with craft beers and food from neighboring restaurant The Dam.',
  'St. Louis', 'st-louis', 'Missouri', 'Tower Grove South',
  '3175 Morganford Rd, St. Louis, MO 63116',
  1,
  'https://amsterdamtavern.com',
  '["https://www.stlmag.com/news/sports/soccer-bars-in-st-louis/", "https://www.goodrec.com/blog/where-to-watch-soccer-st-louis-10-best-soccer-bars", "https://www.saucemagazine.com/places-2/amsterdam-tavern-nominated-for-americas-best-soccer-bar-17508515/", "https://gamewatch.info/teams/st-louis-city-sc", "https://stlsoccernews.com/away-fans-guide/", "https://www.fanzo.com/en-us/bars-pubs/st-louis/9893"]',
  6
);

-- 2. The Pitch Athletic Club & Tavern - Soccer-themed bar at Union Station
INSERT INTO bars (slug, name, description, city, city_slug, state, neighborhood, address, opens_early, website, sources, source_count)
VALUES (
  'the-pitch-stl',
  'The Pitch Athletic Club & Tavern',
  'A 9,200-square-foot soccer-themed bar at Union Station, directly across from CITYPARK (now Energizer Park). Designed like a European pub with leather seating and walls covered in St. Louis soccer history memorabilia. Opens for Premier League matches on weekend mornings and serves as a prime pre-game and post-game destination for CITY SC fans.',
  'St. Louis', 'st-louis', 'Missouri', 'Downtown West',
  '2 S 20th St, St. Louis, MO 63103',
  1,
  'https://www.thepitch-stl.com',
  '["https://www.stlmag.com/news/sports/soccer-bars-in-st-louis/", "https://www.ksdk.com/article/entertainment/the-pitch-athletic-club-and-tavern-soccer-sports-bar-downtown-st-louis/63-3fb985ca-7559-4bf9-abd8-2ddacec03dc0", "https://www.feastmagazine.com/restaurants/the-pitch-athletic-club-tavern-at-union-station-brings-st-louis-sports-fans-a-place/article_545c6d24-cf09-11ed-8af5-a74a4eca4e9f.html", "https://stlsoccernews.com/away-fans-guide/", "https://www.fanzo.com/en-us/bars-pubs/st-louis/9893"]',
  5
);

-- 3. International Tap House (Soulard) - St. Louligans home bar
INSERT INTO bars (slug, name, description, city, city_slug, state, neighborhood, address, opens_early, website, sources, source_count)
VALUES (
  'international-tap-house-soulard',
  'International Tap House',
  'The St. Louligans'' home away from the stadium in the historic Soulard neighborhood. This craft beer destination with 40+ rotating taps and hundreds of bottles has been the longtime watch party hub for St. Louis''s original supporter group. Founded by college soccer players, iTap always has the match on. Named a Top 100 Craft Beer Bar by Draft Magazine.',
  'St. Louis', 'st-louis', 'Missouri', 'Soulard',
  '1711 S 9th St, St. Louis, MO 63104',
  0,
  'https://www.internationaltaphouse.com',
  '["https://www.uslsoccer.com/news_article/show/797113", "https://gamewatch.info/teams/st-louis-city-sc", "https://www.fanzo.com/en-us/bars-pubs/st-louis/9893", "https://www.stlmag.com/news/sports/soccer-bars-in-st-louis/"]',
  4
);

-- 4. Llywelyn''s Pub (Webster Groves) - Gateway Gooners & Mia San STL home
INSERT INTO bars (slug, name, description, city, city_slug, state, neighborhood, address, opens_early, website, sources, source_count)
VALUES (
  'llywelyns-pub-webster-groves',
  'Llywelyn''s Pub',
  'The home bar of both Gateway Gooners (Arsenal supporters) and Mia San STL (Bayern Munich supporters), this Welsh-themed pub in charming Webster Groves is the EPL and European football hub of suburban St. Louis. Also served as the St. Louligans away-match watch location for Saint Louis FC. Part of a small local chain with Celtic roots.',
  'St. Louis', 'st-louis', 'Missouri', 'Webster Groves',
  '17 W Moody Ave, Webster Groves, MO 63119',
  0,
  'https://llywelynspub.com/webster-groves',
  '["https://www.fleurdenoise.com/stl-supporter-groups", "https://gamewatch.info/teams/st-louis-city-sc", "https://www.stlmag.com/news/sports/soccer-bars-in-st-louis/", "https://soccerstl.net/2019/08/08/english-premier-league-supporters-groups-in-st-louis/"]',
  4
);

-- 5. Schlafly Tap Room - St. Louligans pre-match party HQ
INSERT INTO bars (slug, name, description, city, city_slug, state, neighborhood, address, opens_early, website, sources, source_count)
VALUES (
  'schlafly-tap-room',
  'Schlafly Tap Room',
  'St. Louis''s original craft brewery (since 1991) and the home of the legendary St. Louligans pre-match street party. For every CITY SC home game, the Louligans block off the street next to the Tap Room for food trucks, merch tents, live music, and charity fundraising before marching together into Energizer Park. Located steps from the stadium.',
  'St. Louis', 'st-louis', 'Missouri', 'Downtown West',
  '2100 Locust St, St. Louis, MO 63103',
  0,
  'https://www.schlafly.com/tap-room',
  '["https://stlsoccernews.com/away-fans-guide/", "https://do314.com/events/2024/6/8/stl-city-pre-match-street-party-tickets", "https://www.stltoday.com/news/local/so-you-want-to-be-a-st-louligan-here-s-what-to-know-about-the/article_0d353485-e13e-5131-809c-ed2e5c55c286.html", "https://www.ksdk.com/article/sports/soccer/st-louis-city-sc/where-watch-st-louis-city-sc-first-home-match-bar-party-open/63-673a1a20-848e-4326-ad12-fcb206ee9c5d"]',
  4
);

-- 6. 2nd Shift Brewing - St. Louligans brewery partner on The Hill
INSERT INTO bars (slug, name, description, city, city_slug, state, neighborhood, address, opens_early, website, sources, source_count)
VALUES (
  '2nd-shift-brewing-stl',
  '2nd Shift Brewing',
  'Family-run brewery on The Hill, St. Louis''s historic Italian neighborhood, and the official brewing partner of the St. Louligans. Home of Brewligans IPA, brewed specifically for St. Louis''s longest-running soccer supporter group. A gathering spot for supporters before and after matches since the Saint Louis FC era.',
  'St. Louis', 'st-louis', 'Missouri', 'The Hill',
  '1601 Sublette Ave, St. Louis, MO 63110',
  0,
  'https://www.2ndshiftbrewing.com',
  '["https://www.stlmag.com/news/sports/soccer-bars-in-st-louis/", "https://untappd.com/b/2nd-shift-brewing-brewligans/884026", "https://stlouligans.com/"]',
  3
);

-- 7. Fox & Hounds Tavern - English pub at the Cheshire Inn
INSERT INTO bars (slug, name, description, city, city_slug, state, neighborhood, address, opens_early, website, sources, source_count)
VALUES (
  'fox-and-hounds-tavern-stl',
  'Fox & Hounds Tavern',
  'A cozy English pub tucked inside the historic Cheshire Inn, with a stone fireplace, leather chairs, and an atmosphere straight out of a British hunting lodge. The menu features Liverpool Wings tossed in ale hot sauce, Bangers and Mash, and Shepherd''s Pie. An impressive selection of Irish, American, and Scottish whiskeys and the adventurous yard of ale tradition.',
  'St. Louis', 'st-louis', 'Missouri', 'Clayton-Tamm',
  '6300 Clayton Rd, St. Louis, MO 63117',
  0,
  'https://www.cheshirestl.com/dining/fox-and-hounds',
  '["https://www.goodrec.com/blog/where-to-watch-soccer-st-louis-10-best-soccer-bars", "https://www.stlmag.com/First-Look-Fox-Hounds-Tavern/", "https://www.yelp.com/biz/fox-and-hounds-tavern-saint-louis-3"]',
  3
);

-- 8. Maggie O''Brien''s - Irish pub steps from Energizer Park
INSERT INTO bars (slug, name, description, city, city_slug, state, neighborhood, address, opens_early, website, sources, source_count)
VALUES (
  'maggie-obriens-stl',
  'Maggie O''Brien''s',
  'A St. Louis institution since 1979, this Irish pub and restaurant sits just south of Energizer Park on Market Street, making it the quintessential pre-game and post-game stop for CITY SC matches. An official CITY on Tap partner with match-day specials on Michelob Ultra. Multiple screens, hearty Irish fare, and a lively atmosphere.',
  'St. Louis', 'st-louis', 'Missouri', 'Downtown West',
  '2000 Market St, St. Louis, MO 63103',
  0,
  'https://www.maggieobriens.com',
  '["https://stlsoccernews.com/away-fans-guide/", "https://www.stlmag.com/news/sports/soccer-bars-in-st-louis/", "https://www.fanzo.com/en-us/bars-pubs/st-louis/9893", "https://www.yelp.com/biz/maggie-o-briens-saint-louis"]',
  4
);

-- 9. Beffa''s Bar & Restaurant - Historic tavern next to CITYPARK
INSERT INTO bars (slug, name, description, city, city_slug, state, neighborhood, address, opens_early, website, sources, source_count)
VALUES (
  'beffas-stl',
  'Beffa''s Bar & Restaurant',
  'A fourth-generation family-owned tavern just three blocks west of Energizer Park in Midtown. An official CITY on Tap partner, Beffa''s is where STL Santos and other supporter groups gather before marching to the stadium. Match-day specials include $15 buckets. Classic American bar food including wings, burgers, and chicken and waffles at brunch.',
  'St. Louis', 'st-louis', 'Missouri', 'Midtown',
  '2700 Olive St, St. Louis, MO 63103',
  0,
  'https://beffas.com',
  '["https://www.stlmag.com/news/sports/soccer-bars-in-st-louis/", "https://www.stltoday.com/news/local/metro/st-louis-history-soccer-fans-flock-downtown-for-city-scs-first-home-game/article_820a7e4e-7efe-559b-9437-2fd915510ad1.html", "https://www.yelp.com/biz/beffas-bar-and-restaurant-st-louis"]',
  3
);

-- 10. Sports & Social STL - Ballpark Village watch party hub
INSERT INTO bars (slug, name, description, city, city_slug, state, neighborhood, address, opens_early, website, sources, source_count)
VALUES (
  'sports-and-social-stl',
  'Sports & Social STL',
  'The ultimate sports clubhouse inside Ballpark Village with 20+ HD LED TVs, a massive media wall, and stadium sound. An official CITY on Tap partner that offers free shuttles to Energizer Park on match days plus watch parties with $25 buckets and $4 Michelob Ultra drafts. Interactive games including Skee-Ball and Pop-a-Shot between halves.',
  'St. Louis', 'st-louis', 'Missouri', 'Downtown',
  '601 Clark Ave, St. Louis, MO 63102',
  0,
  'https://stlballparkvillage.com/eat-and-drink/sports-and-social',
  '["https://stlballparkvillage.com/Eat-and-Drink/Sports-and-Social/Weekly-Specials/2025-STL-CITY-Watch-Parties", "https://www.stlmag.com/news/sports/soccer-bars-in-st-louis/", "https://www.fanzo.com/en-us/bars-pubs/st-louis/9893"]',
  3
);

-- ============================================================
-- TEAM AFFILIATIONS
-- ============================================================

-- Amsterdam Tavern - shows all leagues/teams, American Outlaws chapter
INSERT OR IGNORE INTO bar_teams (bar_id, team_slug, team_name)
SELECT id, 'st-louis-city-sc', 'St. Louis CITY SC' FROM bars WHERE slug = 'amsterdam-tavern-stl';

-- The Pitch - CITY SC focus
INSERT OR IGNORE INTO bar_teams (bar_id, team_slug, team_name)
SELECT id, 'st-louis-city-sc', 'St. Louis CITY SC' FROM bars WHERE slug = 'the-pitch-stl';

-- International Tap House - St. Louligans / CITY SC
INSERT OR IGNORE INTO bar_teams (bar_id, team_slug, team_name)
SELECT id, 'st-louis-city-sc', 'St. Louis CITY SC' FROM bars WHERE slug = 'international-tap-house-soulard';

-- Llywelyn's - Arsenal (Gateway Gooners) and Bayern Munich (Mia San STL)
INSERT OR IGNORE INTO bar_teams (bar_id, team_slug, team_name)
SELECT id, 'arsenal', 'Arsenal FC' FROM bars WHERE slug = 'llywelyns-pub-webster-groves';
INSERT OR IGNORE INTO bar_teams (bar_id, team_slug, team_name)
SELECT id, 'bayern-munich', 'Bayern Munich' FROM bars WHERE slug = 'llywelyns-pub-webster-groves';
INSERT OR IGNORE INTO bar_teams (bar_id, team_slug, team_name)
SELECT id, 'st-louis-city-sc', 'St. Louis CITY SC' FROM bars WHERE slug = 'llywelyns-pub-webster-groves';

-- Schlafly Tap Room - St. Louligans / CITY SC
INSERT OR IGNORE INTO bar_teams (bar_id, team_slug, team_name)
SELECT id, 'st-louis-city-sc', 'St. Louis CITY SC' FROM bars WHERE slug = 'schlafly-tap-room';

-- 2nd Shift Brewing - St. Louligans / CITY SC
INSERT OR IGNORE INTO bar_teams (bar_id, team_slug, team_name)
SELECT id, 'st-louis-city-sc', 'St. Louis CITY SC' FROM bars WHERE slug = '2nd-shift-brewing-stl';

-- Maggie O'Brien's - CITY on Tap / CITY SC
INSERT OR IGNORE INTO bar_teams (bar_id, team_slug, team_name)
SELECT id, 'st-louis-city-sc', 'St. Louis CITY SC' FROM bars WHERE slug = 'maggie-obriens-stl';

-- Beffa's - CITY on Tap / CITY SC
INSERT OR IGNORE INTO bar_teams (bar_id, team_slug, team_name)
SELECT id, 'st-louis-city-sc', 'St. Louis CITY SC' FROM bars WHERE slug = 'beffas-stl';

-- Sports & Social - CITY on Tap / CITY SC
INSERT OR IGNORE INTO bar_teams (bar_id, team_slug, team_name)
SELECT id, 'st-louis-city-sc', 'St. Louis CITY SC' FROM bars WHERE slug = 'sports-and-social-stl';

-- ============================================================
-- LEAGUE AFFILIATIONS
-- ============================================================

-- Amsterdam Tavern - all major leagues
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'premier-league', 'Premier League' FROM bars WHERE slug = 'amsterdam-tavern-stl';
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'mls', 'MLS' FROM bars WHERE slug = 'amsterdam-tavern-stl';
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'champions-league', 'UEFA Champions League' FROM bars WHERE slug = 'amsterdam-tavern-stl';
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'la-liga', 'La Liga' FROM bars WHERE slug = 'amsterdam-tavern-stl';
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'serie-a', 'Serie A' FROM bars WHERE slug = 'amsterdam-tavern-stl';
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'bundesliga', 'Bundesliga' FROM bars WHERE slug = 'amsterdam-tavern-stl';
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'world-cup', 'FIFA World Cup' FROM bars WHERE slug = 'amsterdam-tavern-stl';

-- The Pitch - MLS, Premier League
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'premier-league', 'Premier League' FROM bars WHERE slug = 'the-pitch-stl';
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'mls', 'MLS' FROM bars WHERE slug = 'the-pitch-stl';
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'champions-league', 'UEFA Champions League' FROM bars WHERE slug = 'the-pitch-stl';

-- International Tap House - MLS, Premier League
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'premier-league', 'Premier League' FROM bars WHERE slug = 'international-tap-house-soulard';
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'mls', 'MLS' FROM bars WHERE slug = 'international-tap-house-soulard';

-- Llywelyn's - EPL, Bundesliga, MLS
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'premier-league', 'Premier League' FROM bars WHERE slug = 'llywelyns-pub-webster-groves';
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'bundesliga', 'Bundesliga' FROM bars WHERE slug = 'llywelyns-pub-webster-groves';
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'mls', 'MLS' FROM bars WHERE slug = 'llywelyns-pub-webster-groves';

-- Schlafly Tap Room - MLS
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'mls', 'MLS' FROM bars WHERE slug = 'schlafly-tap-room';

-- 2nd Shift Brewing - MLS
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'mls', 'MLS' FROM bars WHERE slug = '2nd-shift-brewing-stl';

-- Fox & Hounds - Premier League
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'premier-league', 'Premier League' FROM bars WHERE slug = 'fox-and-hounds-tavern-stl';

-- Maggie O'Brien's - MLS, Premier League
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'mls', 'MLS' FROM bars WHERE slug = 'maggie-obriens-stl';
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'premier-league', 'Premier League' FROM bars WHERE slug = 'maggie-obriens-stl';

-- Beffa's - MLS
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'mls', 'MLS' FROM bars WHERE slug = 'beffas-stl';

-- Sports & Social - MLS, Premier League
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'mls', 'MLS' FROM bars WHERE slug = 'sports-and-social-stl';
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'premier-league', 'Premier League' FROM bars WHERE slug = 'sports-and-social-stl';
