-- Tampa / St. Petersburg, Florida Soccer Bars
-- Added: 2026-02-20
-- 10 soccer bars across Tampa (5) and St. Petersburg (5)
-- Tampa Bay Rowdies (USL Championship) and strong EPL pub culture
-- Sources: ilovetheburg.com, GoodRec, BritishFlorida.com, Premier League USA Bar Finder,
--          First Touch Online, Creative Loafing Tampa, Axios Tampa Bay, Visit St Pete Clearwater,
--          American Outlaws, Arsenal America, Liverpool FC OLSC, Tottenham Hotspur official,
--          official bar websites, Yelp, TripAdvisor

-- Add cities to cities table
INSERT OR IGNORE INTO cities (name, slug, state, is_world_cup_host) VALUES ('Tampa', 'tampa', 'Florida', 0);
INSERT OR IGNORE INTO cities (name, slug, state, is_world_cup_host) VALUES ('St. Petersburg', 'st-petersburg', 'Florida', 0);

-- Add Tampa Bay Rowdies to teams table
INSERT OR IGNORE INTO teams (slug, name, league) VALUES ('tampa-bay-rowdies', 'Tampa Bay Rowdies', 'USL Championship');

-- ============================================================
-- BARS - TAMPA
-- ============================================================

-- 1. MacDinton's Irish Pub - THE soccer bar of Tampa
INSERT INTO bars (slug, name, description, city, city_slug, state, neighborhood, address, opens_early, website, sources, source_count)
VALUES (
  'macdintons-irish-pub-tampa',
  'MacDinton''s Irish Pub',
  'Tampa''s undisputed number one soccer bar in the SoHo district. MacDinton''s is the exclusive Tampa venue for FA Cup, EPL, and Champions League matches, with sound on and every screen dedicated to the beautiful game on match days. The bar hosts multiple supporter clubs under one roof: Gulf Coast Gooners (Arsenal, founded 2010), Toon Army Tampa Bay (Newcastle), plus Manchester United, Manchester City, and Tampa Hammers supporters. The Official Liverpool Supporters Club of Tampa Bay was born here before moving to Maloney''s. Opens at 11 AM on weekends for morning matches.',
  'Tampa', 'tampa', 'Florida', 'SoHo',
  '405 S Howard Ave, Tampa, FL 33606',
  1,
  'https://macdintons.com/soho/',
  '["https://ilovetheburg.com/st-pete-soccer-bars-clubs/", "https://macdintons.com/soccer-games/", "https://www.arsenal.com/usa/fanzone-usa/usa-supporters-club/tampa-fl", "https://firsttouchonline.com/best-soccer-bars-in-florida/", "https://www.goodrec.com/blog/where-to-watch-soccer-tampa-10-best-soccer-bars", "https://www.yelp.com/biz/macdintons-irish-pub-tampa"]',
  6
);

-- 2. Maloney's Local Irish Pub - Official LFC Tampa Bay home
INSERT INTO bars (slug, name, description, city, city_slug, state, neighborhood, address, opens_early, website, sources, source_count)
VALUES (
  'maloneys-local-tampa',
  'Maloney''s Local Irish Pub',
  'The official home of the Liverpool FC Supporters Club of Tampa Bay (OLSC since 2008), Maloney''s is a downtown Irish pub packed with Reds fans every match day. Opened in 2015, the pub features large TVs both inside and on the patio, gameday drink specials, and Irish-inspired bar food. The OLSC Tampa Bay was the first officially recognized supporters club in the Tampa area and offers members priority access to Liverpool home match tickets.',
  'Tampa', 'tampa', 'Florida', 'Downtown',
  '1120 E Kennedy Blvd, Tampa, FL 33602',
  1,
  'https://www.maloneyslocalirishpub.com',
  '["https://www.lfctampa.com/about", "https://ilovetheburg.com/st-pete-soccer-bars-clubs/", "https://www.liverpoolfc.com/fans/official-lfc-supporters-clubs/north-america", "https://firsttouchonline.com/liverpool-supporters-in-florida/", "https://www.yelp.com/biz/maloneys-local-irish-pub-tampa-3"]',
  5
);

-- 3. James Joyce Irish Pub & Eatery - Tampa Ybor Spurs home
INSERT INTO bars (slug, name, description, city, city_slug, state, neighborhood, address, opens_early, website, sources, source_count)
VALUES (
  'james-joyce-ybor-tampa',
  'James Joyce Irish Pub & Eatery',
  'Home of the Tampa Ybor Spurs, the official Tottenham Hotspur supporters club in Tampa''s historic Ybor City district. The award-winning pub boasts 50 craft beers on tap and runs a ''50 Tap Challenge'' where completing all drafts in 30 days earns you a soccer jersey. Live Irish traditional music on weekends adds to the authentic atmosphere. Ybor may be known for cigars, but this spot is all about the footy.',
  'Tampa', 'tampa', 'Florida', 'Ybor City',
  '1724 E 8th Ave, Tampa, FL 33605',
  0,
  'http://www.jamesjoyceybor.com',
  '["https://www.tottenhamhotspur.com/fans/supporters-clubs/join-a-club/tampa-ybor-spurs/", "https://ilovetheburg.com/st-pete-soccer-bars-clubs/", "https://firsttouchonline.com/tottenham-supporters-in-florida/", "https://www.premierleague.com/usa-bar-finder/bar/2084/cookie-policy", "https://www.yelp.com/biz/james-joyce-irish-pub-and-eatery-tampa"]',
  5
);

-- 4. Yeoman's Cask & Lion - British pub with EPL brunch
INSERT INTO bars (slug, name, description, city, city_slug, state, neighborhood, address, opens_early, website, sources, source_count)
VALUES (
  'yeomans-cask-lion-tampa',
  'Yeoman''s Cask & Lion',
  'A proper British pub in downtown Tampa celebrating English culture since the late 1980s. Yeoman''s features a dozen TVs and bar tables dedicated to Premier League Soccer and Rowdies matches, with a weekend brunch menu timed to coincide with early-morning EPL kickoffs. The menu runs from fish and chips to bangers, pasties, pies, and curries. Now also features a Topgolf Swing Suite for between-match entertainment, just blocks from Amalie Arena.',
  'Tampa', 'tampa', 'Florida', 'Downtown',
  '202 N Morgan St, Tampa, FL 33602',
  1,
  'https://www.yelp.com/biz/yeomans-topgolf-swing-suite-tampa-2',
  '["https://ilovetheburg.com/st-pete-soccer-bars-clubs/", "https://www.britishflorida.com/pubs-across-fl", "https://www.visittampabay.com/listings/yeomans-cask-&-lion/10724/", "https://www.yelp.com/biz/yeomans-topgolf-swing-suite-tampa-2"]',
  4
);

-- 5. Molly Malone's Irish Pub - Irish-owned Davis Islands pub
INSERT INTO bars (slug, name, description, city, city_slug, state, neighborhood, address, opens_early, website, sources, source_count)
VALUES (
  'molly-malones-tampa',
  'Molly Malone''s Irish Pub',
  'An authentic Irish pub on Davis Islands owned by Dublin natives, Molly Malone''s has been a Tampa soccer destination since 2013. Listed on the official Premier League USA Bar Finder, the pub shows Premier League, Champions League, World Cup, and rugby on multiple screens. Named after the great Molly Malone of Dublin, the bar also features live music, open mics, and ukulele nights alongside hearty Irish fare.',
  'Tampa', 'tampa', 'Florida', 'Davis Islands',
  '304 E Davis Blvd, Tampa, FL 33606',
  0,
  'https://www.mollymalonestampa.com',
  '["https://www.premierleague.com/en/usa-bar-finder", "https://www.mollymalonestampa.com", "https://authenticflorida.com/an-authentic-florida-irish-pub-road-trip/", "https://www.yelp.com/biz/molly-malones-irish-pub-tampa"]',
  4
);

-- ============================================================
-- BARS - ST. PETERSBURG
-- ============================================================

-- 6. Mary Margaret's Olde Irish Tavern - American Outlaws + multi-club hub
INSERT INTO bars (slug, name, description, city, city_slug, state, neighborhood, address, opens_early, website, sources, source_count)
VALUES (
  'mary-margarets-st-pete',
  'Mary Margaret''s Olde Irish Tavern',
  'The beating heart of soccer in downtown St. Petersburg. Mary Margaret''s is the chapter bar for the American Outlaws St. Petersburg (US National Team supporters) and hosts dedicated fans of Arsenal, Liverpool, Chelsea, Manchester United, and Celtic (St Pete Shamrock supporters). TVs run both indoors and on the outdoor patio with sound on for the main match. Outstanding Irish food including a full Irish breakfast. Can reach standing-room-only capacity for big matches.',
  'St. Petersburg', 'st-petersburg', 'Florida', 'Downtown',
  '29 3rd St N, St. Petersburg, FL 33701',
  1,
  'https://marymargarets.com',
  '["https://aostpetersburg.com/", "https://ilovetheburg.com/st-pete-soccer-bars-clubs/", "https://theamericanoutlaws.com/chapters/st-petersburg", "https://www.livesoccertv.com/pubs/florida/", "https://www.yelp.com/biz/mary-margarets-olde-irish-tavern-st-petersburg"]',
  5
);

-- 7. The Horse & Jockey - Since 1987, Liverpool-owned British pub
INSERT INTO bars (slug, name, description, city, city_slug, state, neighborhood, address, opens_early, website, sources, source_count)
VALUES (
  'horse-and-jockey-st-pete',
  'The Horse & Jockey',
  'Pinellas County''s original football-crazed bar, serving proper British pub fare since 1987. Purchased by Liverpool native Lea Doyle in 2008, the Horse & Jockey is the official home of the Liverpool Supporters Club in Pinellas County and screens every Liverpool match live. The menu features hearty English fare: curries, pies, fish and chips, Cornish pasties, and bangers and mash. Twenty beers on tap, opens early for big EPL matches, and conveniently located near a SunRunner stop.',
  'St. Petersburg', 'st-petersburg', 'Florida', 'South Pasadena',
  '1155 Pasadena Ave S, South Pasadena, FL 33707',
  1,
  'https://horseandjockeypub.us',
  '["https://ilovetheburg.com/horse-jockey-south-pasadena/", "https://ilovetheburg.com/st-pete-soccer-bars-clubs/", "https://www.britishflorida.com/pubs-across-fl", "https://www.yelp.com/biz/horse-and-jockey-british-pub-and-restaurant-south-pasadena", "https://www.tripadvisor.com/Restaurant_Review-g11695415-d495510-Reviews-Horse_Jockey_Pub-South_Pasadena_Florida.html"]',
  5
);

-- 8. Dublin Drop - Newest and biggest dedicated soccer bar downtown
INSERT INTO bars (slug, name, description, city, city_slug, state, neighborhood, address, opens_early, website, sources, source_count)
VALUES (
  'dublin-drop-st-pete',
  'Dublin Drop',
  'Opened in March 2025, Dublin Drop is downtown St. Pete''s newest and largest Irish bar dedicated to soccer by square footage. The bar opens at 9 AM for scheduled soccer matches and shows Champions League, Premier League, Bundesliga, La Liga, Serie A, Europa League, and UEFA Nations League. Expect a rowdy atmosphere, 16 variations of the signature Dublin Drop cocktail, beer and shot specials, and hearty Irish eats from neighboring Who''s on First. Part of the Drink St. Pete Group.',
  'St. Petersburg', 'st-petersburg', 'Florida', 'Downtown',
  '129 1st Ave N, St. Petersburg, FL 33701',
  1,
  'https://www.dublindropstpete.com',
  '["https://ilovetheburg.com/st-pete-soccer-bars-clubs/", "https://stpetecatalyst.com/zaps/new-irish-bar-opens-in-downtown-st-pete/", "https://www.herestpetersburg.com/dublin-drop-irish-bar-st-petersburg/", "https://www.yelp.com/biz/dublin-drop-st-petersburg"]',
  4
);

-- 9. Green Turtle Brewery & Public House - English pub with cask ales
INSERT INTO bars (slug, name, description, city, city_slug, state, neighborhood, address, opens_early, website, sources, source_count)
VALUES (
  'green-turtle-brewery-st-pete',
  'Green Turtle Brewery & Public House',
  'The only bar in St. Petersburg with authentic English cask ales, hand-pulled on traditional beer engines at cellar temperature. This small-batch craft brewery opened in 2025 in the former Cycle Brewing space and is run by husband-and-wife duo Todd and Colleen. Opens early on Saturdays for 7:30 AM Premier League matches and Sundays at 9 AM. Partners with neighboring Jack''s London Grill for traditional English pub fare including fish and chips, scotch eggs, and shepherd''s pie.',
  'St. Petersburg', 'st-petersburg', 'Florida', 'Downtown',
  '534 Central Ave, St. Petersburg, FL 33701',
  1,
  'https://greenturtlebrewing.com',
  '["https://ilovetheburg.com/green-turtle-brewery-st-pete/", "https://www.axios.com/local/tampa-bay/2025/11/20/st-pete-green-turtle-brewing-cycle", "https://www.britishflorida.com/pubs-across-fl", "https://www.visitstpeteclearwater.com/profile/green-turtle-brewery-public-house/142690", "https://www.yelp.com/biz/green-turtle-brewery-and-public-house-st-petersburg"]',
  5
);

-- 10. Jack's London Grill - British-owned EPL destination in North St. Pete
INSERT INTO bars (slug, name, description, city, city_slug, state, neighborhood, address, opens_early, website, sources, source_count)
VALUES (
  'jacks-london-grill-st-pete',
  'Jack''s London Grill',
  'The go-to for Premier League action in North St. Pete, Jack''s London Grill has served some of the best fish and chips in town for over a decade. Owned and operated since 2013 by chef Peter Leonavicius, who moved to Tampa Bay from London in the 1980s, the pub is named after the Union Jack. The menu features shepherd''s pie, bangers and mash, steak and ale pie, scotch eggs, and bread pudding alongside a complete lineup of soccer matches. Ranked #7 of 681 restaurants in St. Petersburg on TripAdvisor.',
  'St. Petersburg', 'st-petersburg', 'Florida', 'North St. Petersburg',
  '1050 62nd Ave N, St. Petersburg, FL 33702',
  0,
  'https://jackslondongrill.com',
  '["https://ilovetheburg.com/st-pete-soccer-bars-clubs/", "https://www.britishflorida.com/pubs-across-fl", "https://jackslondongrill.com", "https://www.visitstpeteclearwater.com/profile/jacks-london-grill/140185", "https://www.yelp.com/biz/jacks-london-grill-st-petersburg"]',
  5
);

-- ============================================================
-- TEAM AFFILIATIONS
-- ============================================================

-- MacDinton's - Gulf Coast Gooners (Arsenal), Newcastle (Toon Army), Man Utd, Man City
INSERT OR IGNORE INTO bar_teams (bar_id, team_slug, team_name)
SELECT id, 'arsenal', 'Arsenal FC' FROM bars WHERE slug = 'macdintons-irish-pub-tampa';
INSERT OR IGNORE INTO bar_teams (bar_id, team_slug, team_name)
SELECT id, 'newcastle', 'Newcastle United' FROM bars WHERE slug = 'macdintons-irish-pub-tampa';
INSERT OR IGNORE INTO bar_teams (bar_id, team_slug, team_name)
SELECT id, 'manchester-united', 'Manchester United FC' FROM bars WHERE slug = 'macdintons-irish-pub-tampa';
INSERT OR IGNORE INTO bar_teams (bar_id, team_slug, team_name)
SELECT id, 'manchester-city', 'Manchester City FC' FROM bars WHERE slug = 'macdintons-irish-pub-tampa';

-- Maloney's - Liverpool FC (OLSC Tampa Bay)
INSERT OR IGNORE INTO bar_teams (bar_id, team_slug, team_name)
SELECT id, 'liverpool', 'Liverpool FC' FROM bars WHERE slug = 'maloneys-local-tampa';

-- James Joyce - Tottenham Hotspur (Tampa Ybor Spurs)
INSERT OR IGNORE INTO bar_teams (bar_id, team_slug, team_name)
SELECT id, 'tottenham-hotspur', 'Tottenham Hotspur' FROM bars WHERE slug = 'james-joyce-ybor-tampa';

-- Yeoman's - Tampa Bay Rowdies
INSERT OR IGNORE INTO bar_teams (bar_id, team_slug, team_name)
SELECT id, 'tampa-bay-rowdies', 'Tampa Bay Rowdies' FROM bars WHERE slug = 'yeomans-cask-lion-tampa';

-- Mary Margaret's - USMNT (American Outlaws), Celtic (St Pete Shamrock)
INSERT OR IGNORE INTO bar_teams (bar_id, team_slug, team_name)
SELECT id, 'usmnt', 'US Men''s National Team' FROM bars WHERE slug = 'mary-margarets-st-pete';
INSERT OR IGNORE INTO bar_teams (bar_id, team_slug, team_name)
SELECT id, 'celtic', 'Celtic FC' FROM bars WHERE slug = 'mary-margarets-st-pete';

-- Horse & Jockey - Liverpool FC (Pinellas County supporters)
INSERT OR IGNORE INTO bar_teams (bar_id, team_slug, team_name)
SELECT id, 'liverpool', 'Liverpool FC' FROM bars WHERE slug = 'horse-and-jockey-st-pete';

-- ============================================================
-- LEAGUE AFFILIATIONS
-- ============================================================

-- MacDinton's - EPL, FA Cup, Champions League, La Liga, Europa League
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'premier-league', 'Premier League' FROM bars WHERE slug = 'macdintons-irish-pub-tampa';
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'fa-cup', 'FA Cup' FROM bars WHERE slug = 'macdintons-irish-pub-tampa';
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'champions-league', 'UEFA Champions League' FROM bars WHERE slug = 'macdintons-irish-pub-tampa';
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'la-liga', 'La Liga' FROM bars WHERE slug = 'macdintons-irish-pub-tampa';
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'europa-league', 'Europa League' FROM bars WHERE slug = 'macdintons-irish-pub-tampa';

-- Maloney's - Premier League
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'premier-league', 'Premier League' FROM bars WHERE slug = 'maloneys-local-tampa';

-- James Joyce - Premier League
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'premier-league', 'Premier League' FROM bars WHERE slug = 'james-joyce-ybor-tampa';

-- Yeoman's - Premier League, MLS (Rowdies)
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'premier-league', 'Premier League' FROM bars WHERE slug = 'yeomans-cask-lion-tampa';
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'mls', 'MLS' FROM bars WHERE slug = 'yeomans-cask-lion-tampa';

-- Molly Malone's - Premier League, Champions League, World Cup
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'premier-league', 'Premier League' FROM bars WHERE slug = 'molly-malones-tampa';
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'champions-league', 'UEFA Champions League' FROM bars WHERE slug = 'molly-malones-tampa';
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'world-cup', 'FIFA World Cup' FROM bars WHERE slug = 'molly-malones-tampa';

-- Mary Margaret's - Premier League, MLS, La Liga, World Cup
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'premier-league', 'Premier League' FROM bars WHERE slug = 'mary-margarets-st-pete';
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'mls', 'MLS' FROM bars WHERE slug = 'mary-margarets-st-pete';
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'la-liga', 'La Liga' FROM bars WHERE slug = 'mary-margarets-st-pete';
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'world-cup', 'FIFA World Cup' FROM bars WHERE slug = 'mary-margarets-st-pete';

-- Horse & Jockey - Premier League
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'premier-league', 'Premier League' FROM bars WHERE slug = 'horse-and-jockey-st-pete';

-- Dublin Drop - Premier League, Champions League, Bundesliga, La Liga, Serie A, Europa League
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'premier-league', 'Premier League' FROM bars WHERE slug = 'dublin-drop-st-pete';
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'champions-league', 'UEFA Champions League' FROM bars WHERE slug = 'dublin-drop-st-pete';
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'bundesliga', 'Bundesliga' FROM bars WHERE slug = 'dublin-drop-st-pete';
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'la-liga', 'La Liga' FROM bars WHERE slug = 'dublin-drop-st-pete';
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'serie-a', 'Serie A' FROM bars WHERE slug = 'dublin-drop-st-pete';
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'europa-league', 'Europa League' FROM bars WHERE slug = 'dublin-drop-st-pete';

-- Green Turtle - Premier League
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'premier-league', 'Premier League' FROM bars WHERE slug = 'green-turtle-brewery-st-pete';

-- Jack's London Grill - Premier League, World Cup
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'premier-league', 'Premier League' FROM bars WHERE slug = 'jacks-london-grill-st-pete';
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'world-cup', 'FIFA World Cup' FROM bars WHERE slug = 'jacks-london-grill-st-pete';
