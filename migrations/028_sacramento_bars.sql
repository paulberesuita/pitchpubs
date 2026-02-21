-- Sacramento, California Soccer Bars
-- Added: 2026-02-20
-- 9 soccer bars across Sacramento and West Sacramento
-- Sacramento Republic FC (USL Championship) is pursuing MLS expansion with a new Railyards stadium
-- Sources: CBS Sacramento, Yahoo News, Yelp, Fanzo, GameWatch.info, Arsenal.com,
--          Liverpool FC OLSC, American Outlaws, River City Red Devils, Sacramento Spurs,
--          First Touch Online, Premier League USA Bar Finder, FourDollarJacks

-- Add Sacramento and West Sacramento to cities table
INSERT OR IGNORE INTO cities (name, slug, state, is_world_cup_host) VALUES ('Sacramento', 'sacramento', 'California', 0);
INSERT OR IGNORE INTO cities (name, slug, state, is_world_cup_host) VALUES ('West Sacramento', 'west-sacramento', 'California', 0);

-- Add Sacramento Republic FC to teams table
INSERT OR IGNORE INTO teams (slug, name, league) VALUES ('sacramento-republic-fc', 'Sacramento Republic FC', 'USL Championship');

-- ============================================================
-- BARS
-- ============================================================

-- 1. Zebra Club - THE soccer bar of Sacramento
INSERT INTO bars (slug, name, description, city, city_slug, state, neighborhood, address, opens_early, website, sources, source_count)
VALUES (
  'zebra-club-sacramento',
  'Zebra Club',
  'The undisputed soccer bar of Sacramento. This Midtown dive bar on the corner of 19th and P has been the home of the River City Red Devils (Manchester United supporters) since 2013 and the Sacramento Spurs (Tottenham supporters, 75+ members) since 2014. An official Premier League USA watch bar with 11+ flatscreens and a heated outdoor patio, the Zebra Club opens at 6 AM daily, making it the go-to spot for early morning EPL matches. Nearly 100 fans packed in for the Europa League final.',
  'Sacramento', 'sacramento', 'California', 'Midtown',
  '1900 P St, Sacramento, CA 95811',
  1,
  'https://www.zebraclubbarsacramento.com',
  '["https://www.yahoo.com/news/looking-die-hard-soccer-fans-160000399.html", "https://gamewatch.info/teams/world-cup-soccer/bars/the-zebra-club-1900-p-street-midtown-sacramento-ca-united-states", "https://www.rivercityreddevils.com/", "https://www.instagram.com/sacramento_spurs/", "https://www.cbsnews.com/sacramento/news/best-bars-to-watch-premier-league-soccer-in-sacramento/", "https://www.fourdollarjacks.com/bars-near-me/the-zebra-club"]',
  6
);

-- 2. Bonn Lair - Euro pub atmosphere since 1993
INSERT INTO bars (slug, name, description, city, city_slug, state, neighborhood, address, opens_early, website, sources, source_count)
VALUES (
  'bonn-lair-sacramento',
  'Bonn Lair',
  'A cozy East Sacramento pub with an aged Euro atmosphere, established in 1993 by Dave Boyet and named after his wife Bonnie. Bonn Lair always has soccer going from across the pond, with a strong selection of UK and European beers to match. Known for its fish and chips, shepherd''s pie, and giant pretzels, plus a dartboard in the back. The kind of neighborhood pub where regulars watch Premier League and Champions League on weekend mornings.',
  'Sacramento', 'sacramento', 'California', 'East Sacramento',
  '3651 J St, Sacramento, CA 95816',
  0,
  'https://bonn-lair.edan.io',
  '["https://www.cbsnews.com/sacramento/news/best-bars-to-watch-premier-league-soccer-in-sacramento/", "https://www.fanzo.com/en-us/bar/252262/bonn-lair", "https://www.yelp.com/biz/bonn-lair-sacramento", "https://wanderlog.com/place/details/1406455/bonn-lair"]',
  4
);

-- 3. Fox & Goose Public House - British pub since 1975
INSERT INTO bars (slug, name, description, city, city_slug, state, neighborhood, address, opens_early, website, sources, source_count)
VALUES (
  'fox-and-goose-sacramento',
  'Fox & Goose Public House',
  'Sacramento''s original British pub, opened in 1975 by Bill and Denise Dalton and named after Bill''s hometown pub in Hebden Bridge, Yorkshire. Located in a historic 1913 brick building on the R Street Corridor, just four blocks from the state Capitol. The menu is an authentic British affair: fish and chips, bangers and mash, shepherd''s pie, and olallieberry scones. Weekly pub quiz, live music, and open mic nights round out the experience.',
  'Sacramento', 'sacramento', 'California', 'Midtown',
  '1001 R St, Sacramento, CA 95811',
  0,
  'https://www.foxandgoosepub.com',
  '["https://en.wikipedia.org/wiki/Fox_%26_Goose_Public_House", "https://www.cbsnews.com/sacramento/news/sacramento-fox-goose-celebrates-50-years/", "https://www.yelp.com/biz/fox-and-goose-public-house-sacramento-3", "https://www.cbsnews.com/sacramento/news/best-bars-to-watch-premier-league-soccer-in-sacramento/"]',
  4
);

-- 4. Henry's Lounge - Arsenal + American Outlaws home
INSERT INTO bars (slug, name, description, city, city_slug, state, neighborhood, address, opens_early, website, sources, source_count)
VALUES (
  'henrys-lounge-sacramento',
  'Henry''s Lounge',
  'The home pub of the Sacramento Gooners (Arsenal supporters) and American Outlaws Sacramento (USMNT supporters). Originally in downtown Sacramento since 1986, Henry''s reopened in Midtown in 2021 as a sports bar, grill, and arcade with an interesting collection of vintage pinball machines. Special early openings for Arsenal Premier League matches, plus US national team watch parties through the official American Outlaws chapter.',
  'Sacramento', 'sacramento', 'California', 'Midtown',
  '2019 O St, Sacramento, CA 95811',
  1,
  'https://www.henrysloungesacramento.com',
  '["https://www.arsenal.com/usa/fanzone-usa/usa-supporters-club/sacramento", "https://theamericanoutlaws.com/chapters/sacramento", "https://firsttouchonline.com/best-soccer-bars-in-california/", "https://sportsbarfinder.com/details/henrys-lounge-sacramento-ca", "https://www.fanzo.com/en-us/bar/149546/henrys-lounge"]',
  5
);

-- 5. Fieldhouse American Sports Pub - LFC Sacramento home
INSERT INTO bars (slug, name, description, city, city_slug, state, neighborhood, address, opens_early, website, sources, source_count)
VALUES (
  'fieldhouse-sacramento',
  'Fieldhouse American Sports Pub',
  'The official home of LFC Sacramento, the city''s Official Liverpool FC Supporters Club. This Arden-area sports pub features 28 taps and multiple large screens spread across a spacious layout. Liverpool supporters gather here for every match during the Premier League season. Extended weekend hours with Saturday opening at 10 AM and Sunday at 10 AM make it a reliable option for catching morning Premier League fixtures.',
  'Sacramento', 'sacramento', 'California', 'Arden-Arcade',
  '1833 Fulton Ave, Sacramento, CA 95825',
  1,
  'https://www.fieldhousesac.com',
  '["https://www.liverpoolfc.com/fans/official-lfc-supporters-clubs/north-america", "https://www.yelp.com/biz/fieldhouse-american-sports-pub-sacramento-2", "https://firsttouchonline.com/liverpool-supporters-soccer-bars-in-california/"]',
  3
);

-- 6. Streets of London Pub - British pub in West Sacramento
INSERT INTO bars (slug, name, description, city, city_slug, state, neighborhood, address, opens_early, website, sources, source_count)
VALUES (
  'streets-of-london-west-sac',
  'Streets of London Pub',
  'A British-inspired pub in West Sacramento that is one of the only spots in the Sacramento area to play most Premier League matches and cater to rugby fans as well. Inspired by the warm corner pubs of Britain, Streets of London features a full bar, British-inspired dishes including fish and chips, and an extensive craft beer selection. Indoor and outdoor seating with big screens for watching the beautiful game.',
  'West Sacramento', 'west-sacramento', 'California', NULL,
  '2200 Lake Washington Blvd, West Sacramento, CA 95691',
  0,
  'https://streetsoflondonpub.com',
  '["https://www.cbsnews.com/sacramento/news/best-bars-to-watch-premier-league-soccer-in-sacramento/", "https://www.yelp.com/biz/streets-of-london-pub-west-sacramento", "https://www.westsacramentochamber.com/list/member/streets-of-london-pub-10915", "https://maps.roadtrippers.com/us/west-sacramento-ca/food-drink/streets-of-london-pub-west-sacramento-ca--1"]',
  4
);

-- 7. Pitch and Fiddle - Irish pub named for the soccer pitch
INSERT INTO bars (slug, name, description, city, city_slug, state, neighborhood, address, opens_early, website, sources, source_count)
VALUES (
  'pitch-and-fiddle-sacramento',
  'Pitch and Fiddle',
  'An Irish pub whose name says it all: the Pitch is the field soccer and rugby are played on, and the Fiddle is the classic Irish instrument. Together they create the perfect spot to enjoy your favorite match with great music, food, and drinks. Located on La Riviera Drive with multiple screens showing matches, shepherd''s pie on the menu, and a lively atmosphere from 11 AM daily. A neighborhood favorite for soccer fans in the eastern suburbs.',
  'Sacramento', 'sacramento', 'California', 'La Riviera',
  '8704 La Riviera Dr, Sacramento, CA 95826',
  0,
  'https://www.fiddlelariv.com',
  '["https://www.yelp.com/biz/pitch-and-fiddle-sacramento-2", "https://www.totalhappyhour.com/happy-hour-for-pitch-and-fiddle-in-sacramento-ca-95826/", "https://maps.roadtrippers.com/us/sacramento-ca/food-drink/pitch-and-fiddle"]',
  3
);

-- 8. Tom's Watch Bar - Downtown sports destination
INSERT INTO bars (slug, name, description, city, city_slug, state, neighborhood, address, opens_early, website, sources, source_count)
VALUES (
  'toms-watch-bar-sacramento',
  'Tom''s Watch Bar',
  'Sacramento''s premier sports-watching destination in DOCO, directly adjacent to Golden 1 Center. Founded in 2014, Tom''s defines the ultimate game-day experience with 360-degree screens, oversized stadium displays, and a lively fan atmosphere. The go-to spot for Sacramento Republic FC watch parties, plus coverage of Premier League, MLS, Champions League, and World Cup matches. Expertly crafted burgers, wings, and cocktails.',
  'Sacramento', 'sacramento', 'California', 'Downtown',
  '414 K St, Ste 180, Sacramento, CA 95814',
  0,
  'https://tomswatchbar.com/sacramento/',
  '["https://tomswatchbar.com/sacramento/", "https://www.visitsacramento.com/listing/toms-watch-bar/8183/", "https://www.yelp.com/biz/toms-watch-bar-sacramento", "https://www.fourdollarjacks.com/bars-near-me/tom-s-watch-bar-on-k-street"]',
  4
);

-- 9. Jackrabbit Brewing Company - Republic FC brewing partner
INSERT INTO bars (slug, name, description, city, city_slug, state, neighborhood, address, opens_early, website, sources, source_count)
VALUES (
  'jackrabbit-brewing-west-sac',
  'Jackrabbit Brewing Company',
  'The craft brewery partner of Sacramento Republic FC and leader of the club''s Blood, Sweat & Beers Council, a collective of regional breweries that host watch parties for Republic FC matches. Located in West Sacramento''s industrial district with 30 taps pouring 1-2 new releases weekly. The family- and dog-friendly taproom holds 200 people with indoor and outdoor seating. Food trucks rotate in to complement the brews.',
  'West Sacramento', 'west-sacramento', 'California', NULL,
  '1323 Terminal St, West Sacramento, CA 95691',
  0,
  'https://www.jackrabbitbrewingcompany.com',
  '["https://www.sacrepublicfc.com/news/2022/03/09/republic-fc-welcomes-jackrabbit-brewing-companyto-new-blood-sweat-beers-council/", "https://fox40.com/sports/soccer/sacramento-republic-fc/republic-fc-jackrabbit-brewery-launch-new-ipa/", "https://www.yelp.com/biz/jackrabbit-brewing-company-west-sacramento"]',
  3
);

-- ============================================================
-- TEAM AFFILIATIONS
-- ============================================================

-- Zebra Club - Man United (River City Red Devils) and Tottenham (Sacramento Spurs)
INSERT OR IGNORE INTO bar_teams (bar_id, team_slug, team_name)
SELECT id, 'manchester-united', 'Manchester United FC' FROM bars WHERE slug = 'zebra-club-sacramento';
INSERT OR IGNORE INTO bar_teams (bar_id, team_slug, team_name)
SELECT id, 'tottenham', 'Tottenham Hotspur FC' FROM bars WHERE slug = 'zebra-club-sacramento';

-- Henry's Lounge - Arsenal (Sacramento Gooners) and USMNT (American Outlaws)
INSERT OR IGNORE INTO bar_teams (bar_id, team_slug, team_name)
SELECT id, 'arsenal', 'Arsenal FC' FROM bars WHERE slug = 'henrys-lounge-sacramento';
INSERT OR IGNORE INTO bar_teams (bar_id, team_slug, team_name)
SELECT id, 'usmnt', 'US Men''s National Team' FROM bars WHERE slug = 'henrys-lounge-sacramento';

-- Fieldhouse - Liverpool FC (LFC Sacramento)
INSERT OR IGNORE INTO bar_teams (bar_id, team_slug, team_name)
SELECT id, 'liverpool', 'Liverpool FC' FROM bars WHERE slug = 'fieldhouse-sacramento';

-- Tom's Watch Bar - Sacramento Republic FC
INSERT OR IGNORE INTO bar_teams (bar_id, team_slug, team_name)
SELECT id, 'sacramento-republic-fc', 'Sacramento Republic FC' FROM bars WHERE slug = 'toms-watch-bar-sacramento';

-- Jackrabbit Brewing - Sacramento Republic FC
INSERT OR IGNORE INTO bar_teams (bar_id, team_slug, team_name)
SELECT id, 'sacramento-republic-fc', 'Sacramento Republic FC' FROM bars WHERE slug = 'jackrabbit-brewing-west-sac';

-- ============================================================
-- LEAGUE AFFILIATIONS
-- ============================================================

-- Zebra Club - Premier League, Europa League, World Cup
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'premier-league', 'Premier League' FROM bars WHERE slug = 'zebra-club-sacramento';
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'europa-league', 'Europa League' FROM bars WHERE slug = 'zebra-club-sacramento';
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'champions-league', 'UEFA Champions League' FROM bars WHERE slug = 'zebra-club-sacramento';
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'world-cup', 'FIFA World Cup' FROM bars WHERE slug = 'zebra-club-sacramento';

-- Bonn Lair - Premier League, Champions League, World Cup
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'premier-league', 'Premier League' FROM bars WHERE slug = 'bonn-lair-sacramento';
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'champions-league', 'UEFA Champions League' FROM bars WHERE slug = 'bonn-lair-sacramento';
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'world-cup', 'FIFA World Cup' FROM bars WHERE slug = 'bonn-lair-sacramento';

-- Fox & Goose - Premier League
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'premier-league', 'Premier League' FROM bars WHERE slug = 'fox-and-goose-sacramento';

-- Henry's Lounge - Premier League, International
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'premier-league', 'Premier League' FROM bars WHERE slug = 'henrys-lounge-sacramento';
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'international', 'International' FROM bars WHERE slug = 'henrys-lounge-sacramento';
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'world-cup', 'FIFA World Cup' FROM bars WHERE slug = 'henrys-lounge-sacramento';

-- Fieldhouse - Premier League, Champions League
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'premier-league', 'Premier League' FROM bars WHERE slug = 'fieldhouse-sacramento';
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'champions-league', 'UEFA Champions League' FROM bars WHERE slug = 'fieldhouse-sacramento';

-- Streets of London - Premier League
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'premier-league', 'Premier League' FROM bars WHERE slug = 'streets-of-london-west-sac';

-- Pitch and Fiddle - Premier League
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'premier-league', 'Premier League' FROM bars WHERE slug = 'pitch-and-fiddle-sacramento';

-- Tom's Watch Bar - MLS, Premier League, Champions League, World Cup
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'mls', 'MLS' FROM bars WHERE slug = 'toms-watch-bar-sacramento';
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'premier-league', 'Premier League' FROM bars WHERE slug = 'toms-watch-bar-sacramento';
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'champions-league', 'UEFA Champions League' FROM bars WHERE slug = 'toms-watch-bar-sacramento';
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'world-cup', 'FIFA World Cup' FROM bars WHERE slug = 'toms-watch-bar-sacramento';

-- Jackrabbit Brewing - USL (not in our leagues table, use MLS as closest)
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'mls', 'MLS' FROM bars WHERE slug = 'jackrabbit-brewing-west-sac';
