-- Las Vegas Soccer Bars
-- Added: 2026-02-20
-- 12 soccer bars in Las Vegas, Nevada
-- Las Vegas is a FIFA World Cup 2026 host city (Allegiant Stadium)

-- Add Las Vegas to cities table
INSERT OR IGNORE INTO cities (name, slug, state, is_world_cup_host) VALUES ('Las Vegas', 'las-vegas', 'NV', 1);

-- Add Las Vegas Lights FC to teams table (USL Championship)
INSERT OR IGNORE INTO teams (slug, name, league) VALUES ('las-vegas-lights', 'Las Vegas Lights FC', 'USL Championship');

-- ============================================================
-- BARS
-- ============================================================

-- 1. McMullan's Irish Pub - Home of Official Liverpool Supporters Club of Las Vegas
INSERT INTO bars (slug, name, description, city, city_slug, state, neighborhood, address, opens_early, website, sources, source_count)
VALUES (
  'mcmullans-irish-pub-las-vegas',
  'McMullan''s Irish Pub',
  'The home of the Official Liverpool Supporters Club of Las Vegas, open 24/7 and showing every Premier League match, Champions League, World Cup, and more. This beloved Irish pub near the Orleans Hotel has been a gathering spot for soccer fans since 2002, with a full English breakfast, Sunday roast, and an authentic pub atmosphere that draws both locals and visitors.',
  'Las Vegas', 'las-vegas', 'NV', 'Spring Valley',
  '4650 W Tropicana Ave, Las Vegas, NV 89103',
  1,
  'https://www.mcmullansirishpub.com',
  '["https://www.mcmullansirishpub.com/sports", "https://www.reviewjournal.com/sports/lights-fc-soccer/liverpool-fans-celebrate-champions-league-win-at-las-vegas-pub-1677274/", "https://upbeatvegas.com/5-places-to-watch-the-footy-or-soccer-in-las-vegas/", "https://www.neighborhoods.com/blog/5-great-soccer-pubs-in-las-vegas", "https://www.goodrec.com/blog/where-to-watch-soccer-las-vegas-10-best-soccer-bars", "https://www.reviewjournal.com/local/local-las-vegas/electrifying-atmospheres-draw-soccer-fans-to-world-cup-watch-parties-2686661/"]',
  6
);

-- 2. Crown & Anchor Pub - Las Vegas's home for soccer, British pub with supporter groups
INSERT INTO bars (slug, name, description, city, city_slug, state, neighborhood, address, opens_early, website, sources, source_count)
VALUES (
  'crown-and-anchor-las-vegas',
  'Crown & Anchor Pub',
  'An authentic 24/7 British pub that bills itself as Las Vegas''s home for soccer. A U.S. Soccer Federation sponsor with satellite dishes broadcasting European, South American, and American soccer, Crown & Anchor has hosted Crystal Palace and Everton supporters groups and is listed on the Premier League USA Bar Finder. The original Tropicana location closed in 2024 after nearly 30 years; the Spring Mountain Road location carries on the tradition.',
  'Las Vegas', 'las-vegas', 'NV', 'Chinatown',
  '4755 Spring Mountain Rd, Las Vegas, NV 89102',
  1,
  'https://www.crownandanchorlv.com',
  '["https://www.premierleague.com/usa-bar-finder/bar/1866/crown--anchor", "https://www.neighborhoods.com/blog/5-great-soccer-pubs-in-las-vegas", "https://upbeatvegas.com/5-places-to-watch-the-footy-or-soccer-in-las-vegas/", "https://www.livesoccertv.com/pubs/nevada/las-vegas/crown-anchor/", "https://neon.reviewjournal.com/dining-out/british-pub-in-las-vegas-closes-its-doors-after-nearly-30-years-3079825/"]',
  5
);

-- 3. Ri Ra Irish Pub - EPL Breakfast Club, authentic Irish pub on the Strip
INSERT INTO bars (slug, name, description, city, city_slug, state, neighborhood, address, opens_early, website, sources, source_count)
VALUES (
  'ri-ra-irish-pub-las-vegas',
  'Ri Ra Irish Pub',
  'An authentic Irish pub physically constructed from a restored pub shipped from Ireland to Mandalay Bay. Features an EPL Breakfast Club with 6 AM PT kickoffs on big screens with audio. Hosts Club World Cup and major tournament viewing parties. Serves Guinness on draught and acclaimed fish and chips in a rowdy, energy-filled atmosphere.',
  'Las Vegas', 'las-vegas', 'NV', 'The Strip',
  '3930 Las Vegas Blvd S, Las Vegas, NV 89119',
  1,
  'https://rira.com/las-vegas/',
  '["https://rira.com/las-vegas/pub-talk/epl-breakfast-club-ri-ra/", "https://rira.com/las-vegas/pub-talk/club-world-cup-2025/", "https://upbeatvegas.com/5-places-to-watch-the-footy-or-soccer-in-las-vegas/", "https://www.neighborhoods.com/blog/5-great-soccer-pubs-in-las-vegas", "https://www.visitlasvegas.com/experience/post/where-to-watch-the-world-cup-in-las-vegas/"]',
  5
);

-- 4. Hofbrauhaus Las Vegas - German beer hall with World Cup and Bayern Munich viewing
INSERT INTO bars (slug, name, description, city, city_slug, state, neighborhood, address, opens_early, website, sources, source_count)
VALUES (
  'hofbrauhaus-las-vegas',
  'Hofbrauhaus Las Vegas',
  'The first and only German beer hall in Las Vegas, an exact replica of the legendary Hofbrauhaus in Munich. Hosts FIFA World Cup and Bayern Munich viewing parties in an 18,000-square-foot beer garden with big screen TVs. The electrifying atmosphere of schnitzels, sausages, and world-famous German beer makes it a natural destination for international soccer fans.',
  'Las Vegas', 'las-vegas', 'NV', 'Paradise',
  '4510 Paradise Rd, Las Vegas, NV 89169',
  0,
  'https://www.hofbrauhauslasvegas.com',
  '["https://news3lv.com/news/local/hofbruhaus-las-vegas-hosting-fifa-world-cup-viewing-parties", "https://www.reviewjournal.com/local/local-las-vegas/electrifying-atmospheres-draw-soccer-fans-to-world-cup-watch-parties-2686661/", "https://www.neighborhoods.com/blog/5-great-soccer-pubs-in-las-vegas", "https://www.visitlasvegas.com/experience/post/where-to-watch-the-world-cup-in-las-vegas/"]',
  4
);

-- 5. Hennessey's Tavern - American Outlaws Las Vegas home bar since 2011
INSERT INTO bars (slug, name, description, city, city_slug, state, neighborhood, address, opens_early, website, sources, source_count)
VALUES (
  'hennesseys-tavern-las-vegas',
  'Hennessey''s Tavern',
  'Home bar of the American Outlaws Las Vegas chapter since 2011, the 65th chapter of the nationwide U.S. Soccer supporters group. Located at the corner of Las Vegas Boulevard and Fremont Street in downtown, Hennessey''s hosts USMNT and USWNT watch parties and opens early for morning World Cup matches with breakfast service.',
  'Las Vegas', 'las-vegas', 'NV', 'Downtown',
  '425 Fremont St #110, Las Vegas, NV 89101',
  1,
  'https://www.hennesseyslasvegas.com',
  '["https://aolasvegas.com/", "https://theamericanoutlaws.com/chapters/las-vegas", "https://www.reviewjournal.com/local/local-las-vegas/electrifying-atmospheres-draw-soccer-fans-to-world-cup-watch-parties-2686661/", "https://www.reviewjournal.com/sports/sports-columns/sam-gordon/gordon-living-and-dying-with-u-s-at-world-cup-watch-parties-2687484/"]',
  4
);

-- 6. Four Kegs Sports Pub - Local soccer team sponsor since 1977
INSERT INTO bars (slug, name, description, city, city_slug, state, neighborhood, address, opens_early, website, sources, source_count)
VALUES (
  'four-kegs-las-vegas',
  'Four Kegs Sports Pub',
  'A Las Vegas institution since 1977 that sponsors two local soccer teams and has been a go-to spot for soccer fans for decades. Featured on Food Network''s Diners, Drive-Ins and Dives, this 24-hour neighborhood sports pub on Jones Boulevard has over 1,300 Yelp reviews and a loyal following among the local soccer community.',
  'Las Vegas', 'las-vegas', 'NV', 'West Las Vegas',
  '276 N Jones Blvd #B, Las Vegas, NV 89107',
  1,
  'http://www.fourkegs.com',
  '["https://www.neighborhoods.com/blog/5-great-soccer-pubs-in-las-vegas", "https://www.goodrec.com/blog/where-to-watch-soccer-las-vegas-10-best-soccer-bars", "https://www.dinersdriveinsdiveslocations.com/four-kegs-sports-pub-nevada.html"]',
  3
);

-- 7. Flanker Kitchen + Sports Bar - Award-winning sports bar with 50+ screens
INSERT INTO bars (slug, name, description, city, city_slug, state, neighborhood, address, opens_early, website, sources, source_count)
VALUES (
  'flanker-kitchen-las-vegas',
  'Flanker Kitchen + Sports Bar',
  'An award-winning sports bar inside Mandalay Bay that plays every soccer game all season long. Features a massive 30-by-9-foot LED wall and 50-plus LED screens throughout the space. Chef Daniel Ontiveros curates scratch-made burgers, wings, and tacos alongside 40 draft beers. Hosts soccer watch parties and offers private viewing rooms for groups up to 60.',
  'Las Vegas', 'las-vegas', 'NV', 'The Strip',
  '3950 Las Vegas Blvd S #215, Las Vegas, NV 89119',
  1,
  'https://flankerlv.com',
  '["https://flankerlv.com/book-an-event/where-to-watch-soccer-games-in-las-vegas/", "https://www.goodrec.com/blog/where-to-watch-soccer-las-vegas-10-best-soccer-bars", "https://lasvegasmagazine.com/dining/2025/oct/06/game-day-tastes-so-much-better-at-flanker-kitchen/", "https://www.visitlasvegas.com/experience/post/where-to-watch-the-world-cup-in-las-vegas/"]',
  4
);

-- 8. Jackpot Bar & Grill - Official Arsenal America branch, Las Vegas Gooners home
INSERT INTO bars (slug, name, description, city, city_slug, state, neighborhood, address, opens_early, website, sources, source_count)
VALUES (
  'jackpot-bar-grill-las-vegas',
  'Jackpot Bar & Grill',
  'The official Arsenal America branch location in Las Vegas, where the local Gooners gather to watch every Arsenal match. This 24/7 neighborhood bar and grill on Jones Boulevard serves as the dedicated home for Arsenal supporters in the Las Vegas valley.',
  'Las Vegas', 'las-vegas', 'NV', 'Spring Valley',
  '4485 S Jones Blvd, Las Vegas, NV 89103',
  1,
  'https://www.jackpotbarlv.com',
  '["https://arsenalamerica.com/branches/", "https://firsttouchonline.com/arsenal-supporters-clubs-usa/", "https://www.arsenal.com/usa/fanzone-usa/usa-supporters-club/las-vegas-nv"]',
  3
);

-- 9. The Front Yard at Ellis Island - Beer garden with 18-foot big screen
INSERT INTO bars (slug, name, description, city, city_slug, state, neighborhood, address, opens_early, website, sources, source_count)
VALUES (
  'the-front-yard-las-vegas',
  'The Front Yard at Ellis Island',
  'A two-story indoor-outdoor beer garden at Ellis Island Casino and Brewery featuring an 18-foot big screen TV and HD screens on both floors. The 350-capacity venue combines craft beers from the on-site Ellis Island Brewery with a lush garden atmosphere, a second-floor atrium with Strip views, and retractable ceiling shades for year-round game-day viewing.',
  'Las Vegas', 'las-vegas', 'NV', 'East of Strip',
  '4178 Koval Ln, Las Vegas, NV 89109',
  0,
  'https://www.ellisislandcasino.com/the-front-yard',
  '["https://www.fanzo.com/en-us/bar/153010/the-front-yard-ellis-island-casino", "https://www.goodrec.com/blog/where-to-watch-soccer-las-vegas-10-best-soccer-bars", "https://splashmags.com/index.php/2025/03/the-front-yard-ellis-island/"]',
  3
);

-- 10. Kickers Gaming & Sports Bar - Downtown soccer-friendly bar, 24/7
INSERT INTO bars (slug, name, description, city, city_slug, state, neighborhood, address, opens_early, website, sources, source_count)
VALUES (
  'kickers-las-vegas',
  'Kickers Gaming & Sports Bar',
  'A women-owned gaming and sports bar one mile north of Fremont Street with 17 TVs showing soccer, including MLS, and every major sporting event. Open 24/7 with craft beers, cocktails, shuffleboard, and Golden Tee. Listed on Fanzo as a soccer bar and rated 4.7 stars with a loyal local following.',
  'Las Vegas', 'las-vegas', 'NV', 'Downtown',
  '931 Las Vegas Blvd N, Las Vegas, NV 89101',
  1,
  'https://www.kickerslv.com',
  '["https://www.kickerslv.com/sports", "https://www.fanzo.com/en-us/bar/149215/kickers-gaming-sports-bar", "https://www.goodrec.com/blog/where-to-watch-soccer-las-vegas-10-best-soccer-bars"]',
  3
);

-- 11. Blondies Sports Bar & Grill - On-Strip, opens early for morning matches
INSERT INTO bars (slug, name, description, city, city_slug, state, neighborhood, address, opens_early, website, sources, source_count)
VALUES (
  'blondies-sports-bar-las-vegas',
  'Blondies Sports Bar & Grill',
  'A high-energy sports bar in the Miracle Mile Shops at Planet Hollywood that opens at 7 AM for early morning Premier League matches. Over 60 TVs throughout the venue and one of the few bars on the Strip that shows soccer with the sound on. Beer pong tables, food and drink specials, and a prime Strip location make it popular with visiting fans.',
  'Las Vegas', 'las-vegas', 'NV', 'The Strip',
  '3663 Las Vegas Blvd S, Las Vegas, NV 89109',
  1,
  'https://www.blondieslasvegas.com',
  '["https://www.blondieslasvegas.com/", "https://upbeatvegas.com/5-places-to-watch-the-footy-or-soccer-in-las-vegas/", "https://gamewatch.info/teams/world-cup-soccer/cities/las-vegas-nv"]',
  3
);

-- 12. Nine Fine Irishmen - Authentic Irish pub at New York-New York
INSERT INTO bars (slug, name, description, city, city_slug, state, neighborhood, address, opens_early, website, sources, source_count)
VALUES (
  'nine-fine-irishmen-las-vegas',
  'Nine Fine Irishmen',
  'One of the most iconic Irish pubs in the world, built in Ireland and shipped to the heart of Las Vegas at New York-New York. Acclaimed by AOL as one of the Top 5 Bars in Las Vegas within three months of opening. Shows Premier League and major soccer matches with live Irish music, craft cocktails, and a menu of classic Irish fare on the Strip.',
  'Las Vegas', 'las-vegas', 'NV', 'The Strip',
  '3790 Las Vegas Blvd S, Las Vegas, NV 89109',
  0,
  'https://www.ninefineirishmen.com',
  '["https://irishpubcompany.com/project/nine-fine-irishmen/", "https://www.yelp.com/search?find_desc=Premier+League&find_loc=Las+Vegas,+NV", "https://lasvegasmagazine.com/entertainment/2024/jan/05/nine-fine-irishmen-new-york-las-vegas-strip/"]',
  3
);

-- ============================================================
-- TEAM AFFILIATIONS
-- ============================================================

-- McMullan's Irish Pub - Liverpool FC
INSERT INTO bar_teams (bar_id, team_slug, team_name)
SELECT id, 'liverpool', 'Liverpool FC' FROM bars WHERE slug = 'mcmullans-irish-pub-las-vegas';

-- Crown & Anchor - Crystal Palace, Everton
INSERT INTO bar_teams (bar_id, team_slug, team_name)
SELECT id, 'crystal-palace', 'Crystal Palace FC' FROM bars WHERE slug = 'crown-and-anchor-las-vegas';
INSERT INTO bar_teams (bar_id, team_slug, team_name)
SELECT id, 'everton', 'Everton FC' FROM bars WHERE slug = 'crown-and-anchor-las-vegas';

-- Hennessey's Tavern - USMNT
INSERT INTO bar_teams (bar_id, team_slug, team_name)
SELECT id, 'usmnt', 'US Men''s National Team' FROM bars WHERE slug = 'hennesseys-tavern-las-vegas';

-- Hofbrauhaus - Bayern Munich
INSERT INTO bar_teams (bar_id, team_slug, team_name)
SELECT id, 'bayern-munich', 'Bayern Munich' FROM bars WHERE slug = 'hofbrauhaus-las-vegas';

-- Jackpot Bar & Grill - Arsenal FC
INSERT INTO bar_teams (bar_id, team_slug, team_name)
SELECT id, 'arsenal', 'Arsenal FC' FROM bars WHERE slug = 'jackpot-bar-grill-las-vegas';

-- ============================================================
-- LEAGUE AFFILIATIONS
-- ============================================================

-- McMullan's Irish Pub - All major leagues
INSERT INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'premier-league', 'Premier League' FROM bars WHERE slug = 'mcmullans-irish-pub-las-vegas';
INSERT INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'champions-league', 'UEFA Champions League' FROM bars WHERE slug = 'mcmullans-irish-pub-las-vegas';
INSERT INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'world-cup', 'FIFA World Cup' FROM bars WHERE slug = 'mcmullans-irish-pub-las-vegas';
INSERT INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'la-liga', 'La Liga' FROM bars WHERE slug = 'mcmullans-irish-pub-las-vegas';
INSERT INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'serie-a', 'Serie A' FROM bars WHERE slug = 'mcmullans-irish-pub-las-vegas';
INSERT INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'bundesliga', 'Bundesliga' FROM bars WHERE slug = 'mcmullans-irish-pub-las-vegas';
INSERT INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'mls', 'MLS' FROM bars WHERE slug = 'mcmullans-irish-pub-las-vegas';
INSERT INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'fa-cup', 'FA Cup' FROM bars WHERE slug = 'mcmullans-irish-pub-las-vegas';
INSERT INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'europa-league', 'Europa League' FROM bars WHERE slug = 'mcmullans-irish-pub-las-vegas';
INSERT INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'scottish-premiership', 'Scottish Premiership' FROM bars WHERE slug = 'mcmullans-irish-pub-las-vegas';
INSERT INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'ligue-1', 'Ligue 1' FROM bars WHERE slug = 'mcmullans-irish-pub-las-vegas';

-- Crown & Anchor - Premier League, Champions League, World Cup, La Liga, MLS
INSERT INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'premier-league', 'Premier League' FROM bars WHERE slug = 'crown-and-anchor-las-vegas';
INSERT INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'champions-league', 'UEFA Champions League' FROM bars WHERE slug = 'crown-and-anchor-las-vegas';
INSERT INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'world-cup', 'FIFA World Cup' FROM bars WHERE slug = 'crown-and-anchor-las-vegas';
INSERT INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'la-liga', 'La Liga' FROM bars WHERE slug = 'crown-and-anchor-las-vegas';
INSERT INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'mls', 'MLS' FROM bars WHERE slug = 'crown-and-anchor-las-vegas';

-- Ri Ra Irish Pub - Premier League, Champions League, World Cup
INSERT INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'premier-league', 'Premier League' FROM bars WHERE slug = 'ri-ra-irish-pub-las-vegas';
INSERT INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'champions-league', 'UEFA Champions League' FROM bars WHERE slug = 'ri-ra-irish-pub-las-vegas';
INSERT INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'world-cup', 'FIFA World Cup' FROM bars WHERE slug = 'ri-ra-irish-pub-las-vegas';

-- Hofbrauhaus - Bundesliga, World Cup
INSERT INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'bundesliga', 'Bundesliga' FROM bars WHERE slug = 'hofbrauhaus-las-vegas';
INSERT INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'world-cup', 'FIFA World Cup' FROM bars WHERE slug = 'hofbrauhaus-las-vegas';

-- Hennessey's Tavern - World Cup, MLS, International
INSERT INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'world-cup', 'FIFA World Cup' FROM bars WHERE slug = 'hennesseys-tavern-las-vegas';
INSERT INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'mls', 'MLS' FROM bars WHERE slug = 'hennesseys-tavern-las-vegas';
INSERT INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'international', 'International' FROM bars WHERE slug = 'hennesseys-tavern-las-vegas';

-- Four Kegs - Premier League, MLS
INSERT INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'premier-league', 'Premier League' FROM bars WHERE slug = 'four-kegs-las-vegas';
INSERT INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'mls', 'MLS' FROM bars WHERE slug = 'four-kegs-las-vegas';

-- Flanker - Premier League, Champions League, MLS, World Cup, La Liga
INSERT INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'premier-league', 'Premier League' FROM bars WHERE slug = 'flanker-kitchen-las-vegas';
INSERT INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'champions-league', 'UEFA Champions League' FROM bars WHERE slug = 'flanker-kitchen-las-vegas';
INSERT INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'mls', 'MLS' FROM bars WHERE slug = 'flanker-kitchen-las-vegas';
INSERT INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'world-cup', 'FIFA World Cup' FROM bars WHERE slug = 'flanker-kitchen-las-vegas';
INSERT INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'la-liga', 'La Liga' FROM bars WHERE slug = 'flanker-kitchen-las-vegas';

-- Jackpot Bar & Grill - Premier League
INSERT INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'premier-league', 'Premier League' FROM bars WHERE slug = 'jackpot-bar-grill-las-vegas';

-- The Front Yard - Premier League, MLS
INSERT INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'premier-league', 'Premier League' FROM bars WHERE slug = 'the-front-yard-las-vegas';
INSERT INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'mls', 'MLS' FROM bars WHERE slug = 'the-front-yard-las-vegas';

-- Kickers - Premier League, MLS
INSERT INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'premier-league', 'Premier League' FROM bars WHERE slug = 'kickers-las-vegas';
INSERT INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'mls', 'MLS' FROM bars WHERE slug = 'kickers-las-vegas';

-- Blondies - Premier League, World Cup
INSERT INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'premier-league', 'Premier League' FROM bars WHERE slug = 'blondies-sports-bar-las-vegas';
INSERT INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'world-cup', 'FIFA World Cup' FROM bars WHERE slug = 'blondies-sports-bar-las-vegas';

-- Nine Fine Irishmen - Premier League
INSERT INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'premier-league', 'Premier League' FROM bars WHERE slug = 'nine-fine-irishmen-las-vegas';
