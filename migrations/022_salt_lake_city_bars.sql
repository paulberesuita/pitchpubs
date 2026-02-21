-- Salt Lake City, Utah Soccer Bars
-- Added: 2026-02-20
-- 12 soccer bars across Salt Lake City metro area (SLC, Taylorsville)
-- Real Salt Lake (MLS since 2005) makes this a key soccer market
-- Sources: GoodRec, Soccer.Town, GameWatch.info, Flanker SLC, Salt Lake Tribune,
--          ABC4, Arsenal.com, Tottenham Hotspur official, American Outlaws,
--          SportsBars.com, BigSoccer, TripAdvisor, Yelp, Gastronomic SLC,
--          Shades Brewing, Visit Salt Lake, City Cast Salt Lake

-- Add Salt Lake City and Taylorsville to cities table
INSERT OR IGNORE INTO cities (name, slug, state, is_world_cup_host) VALUES ('Salt Lake City', 'salt-lake-city', 'Utah', 0);
INSERT OR IGNORE INTO cities (name, slug, state, is_world_cup_host) VALUES ('Taylorsville', 'taylorsville', 'Utah', 0);

-- Add Real Salt Lake to teams table
INSERT OR IGNORE INTO teams (slug, name, league) VALUES ('real-salt-lake', 'Real Salt Lake', 'MLS');

-- ============================================================
-- BARS
-- ============================================================

-- 1. Fiddler's - Utah Gooners (Arsenal) home bar, reopened 2025 under new ownership
INSERT INTO bars (slug, name, description, city, city_slug, state, neighborhood, address, opens_early, website, sources, source_count)
VALUES (
  'fiddlers-slc',
  'Fiddler''s',
  'The official home of the Utah Gooners, Salt Lake City''s Arsenal supporters club, in the heart of Sugar House. Originally Fiddler''s Elbow since the 1990s, the bar closed in August 2024 and reopened in mid-2025 under new ownership as simply Fiddler''s, a 21+ pub reimagined by a local couple who grew up with the original. Features 19 big screens with all premium sports channels, scratch-made food including pizza from the original oven, craft cocktails, and local beer. Arsenal fans have called this their match-day home for years.',
  'Salt Lake City', 'salt-lake-city', 'Utah', 'Sugar House',
  '1063 E 2100 S, Salt Lake City, UT 84106',
  1,
  'https://www.fiddlerssugarhouse.com',
  '["https://www.arsenal.com/usa/fanzone-usa/usa-supporters-club/salt-lake-city-ut", "https://www.soccer.town/pubs/salt-lake-city/fiddlers", "https://www.sltrib.com/artsliving/food/2025/06/24/utah-couple-opens-fiddlers-sugar/", "https://gastronomicslc.com/2025/06/14/multi-decade-neighborhood-bar-returns-to-sugar-house/", "https://sportsbars.com/best-sports-bars-in-salt-lake-city-2025-the-definitive-guide-to-real-venues/"]',
  5
);

-- 2. Beer Bar - American Outlaws Salt Lake City home bar
INSERT INTO bars (slug, name, description, city, city_slug, state, neighborhood, address, opens_early, website, sources, source_count)
VALUES (
  'beer-bar-slc',
  'Beer Bar',
  'The official home bar of AO Salt Lake City, the local American Outlaws chapter supporting the U.S. Men''s and Women''s National Teams. A roomy, modern hangout in downtown SLC supplying 140+ brews, beer cocktails, and German-inspired eats. Also a gathering spot for Manchester City and Everton supporters, plus Real Salt Lake fans on match days. Open daily from 11 AM (10 AM Sundays), with a 4.4-star Google rating from over 1,500 reviews.',
  'Salt Lake City', 'salt-lake-city', 'Utah', 'Central City',
  '161 E 200 S, Salt Lake City, UT 84111',
  0,
  'https://beerbarslc.com',
  '["https://theamericanoutlaws.com/chapters/salt-lake-city", "https://www.soccer.town/pubs/salt-lake-city/beer-bar", "https://gamewatch.info/teams/world-cup-soccer/cities/salt-lake-city-ut", "https://www.yelp.com/biz/beer-bar-salt-lake-city"]',
  4
);

-- 3. Legends Pub & Grill - SLC Spurs (Tottenham) and Aston Villa supporters home
INSERT INTO bars (slug, name, description, city, city_slug, state, neighborhood, address, opens_early, website, sources, source_count)
VALUES (
  'legends-pub-grill-slc',
  'Legends Pub & Grill',
  'Home of the SLC Spurs, the official Tottenham Hotspur supporters club in Salt Lake City, and Aston Villa supporters. With 45+ screens and seating for 380, Legends has the most screens of any soccer bar in the metro area. Opens at 10 AM on Saturdays for morning Premier League kickoffs (9 AM and later). Features a private VIP room for large group match viewings, a full kitchen with pub food, and free parking right off the TRAX line. One of the few family-friendly sports bars in Utah.',
  'Salt Lake City', 'salt-lake-city', 'Utah', 'Granary District',
  '677 S 200 W, Salt Lake City, UT 84101',
  1,
  'https://www.whylegends.com',
  '["https://www.tottenhamhotspur.com/fans/supporters-clubs/join-a-club/salt-lake-city-spurs/", "https://www.soccer.town/pubs/salt-lake-city/legends-pub-grill-downtown", "https://sportsbars.com/best-sports-bars-in-salt-lake-city-2025-the-definitive-guide-to-real-venues/", "https://thecitizenslc.com/2025/08/guide-to-sports-teams-slc/", "https://www.yelp.com/biz/legends-sports-pub-salt-lake-city"]',
  5
);

-- 4. Dick N' Dixie's - RSL players' hangout with soccer paraphernalia
INSERT INTO bars (slug, name, description, city, city_slug, state, neighborhood, address, opens_early, website, sources, source_count)
VALUES (
  'dick-n-dixies-slc',
  'Dick N'' Dixie''s',
  'A beloved Salt Lake City dive bar where Real Salt Lake runs deep. RSL paraphernalia covers the walls and players are known to stop by after home games. Despite its dive-bar charm with karaoke, pool tables, and budget-friendly drinks, the game of choice here is soccer. Features 25 screens across a 245-seat venue, open 15 hours a day, 365 days a year. A fixture of the downtown SLC scene and a genuine supporters'' gathering spot.',
  'Salt Lake City', 'salt-lake-city', 'Utah', 'Central City',
  '479 E 300 S, Salt Lake City, UT 84111',
  0,
  'https://dickndixies.com',
  '["https://archive.sltrib.com/article.php?id=55832422&itype=CMSID", "https://www.goodrec.com/blog/where-to-watch-soccer-salt-lake-city-10-best-soccer-bars", "https://sportsbars.com/best-sports-bars-in-salt-lake-city-2025-the-definitive-guide-to-real-venues/", "https://gamewatch.info/teams/real-salt-lake"]',
  4
);

-- 5. Piper Down Pub - Irish pub with RSL watch parties since 2003
INSERT INTO bars (slug, name, description, city, city_slug, state, neighborhood, address, opens_early, website, sources, source_count)
VALUES (
  'piper-down-pub-slc',
  'Piper Down Pub',
  'A genuine Irish pub serving the Salt Lake community since 2003, nestled in the Ballpark neighborhood. Piper Down is an official Real Salt Lake watch party location and one of the most atmospheric places to catch a match in the city. Ice-cold Guinness on tap, a top-notch selection of whiskeys, old-style Irish dishes, and a vast vegan menu. Features a beautiful outdoor patio with fire pit and overhead heaters, pool tables, and live entertainment throughout the week. The Irish Times once featured it in their Best Irish Pub in the World competition.',
  'Salt Lake City', 'salt-lake-city', 'Utah', 'Ballpark',
  '1492 S State St, Salt Lake City, UT 84115',
  1,
  'https://piperdownpub.com',
  '["https://gamewatch.info/teams/real-salt-lake", "https://www.goodrec.com/blog/where-to-watch-soccer-salt-lake-city-10-best-soccer-bars", "https://www.irishtimes.com/life-and-style/abroad/generation-emigration/best-irish-pub-in-the-world-competition-entry-piper-down-salt-lake-city-utah-1.2123079", "https://www.yelp.com/biz/piper-down-pub-salt-lake-city-2"]',
  4
);

-- 6. The Green Pig Pub - Downtown icon, World Cup watch party hub
INSERT INTO bars (slug, name, description, city, city_slug, state, neighborhood, address, opens_early, website, sources, source_count)
VALUES (
  'the-green-pig-pub-slc',
  'The Green Pig Pub',
  'Established in 2009 by the experienced staff from the beloved Port O Call, The Green Pig has been voted best sports bar in SLC and is one of the city''s most popular World Cup and Premier League viewing destinations. Located in the heart of downtown, it features 10 flatscreen TVs with all major sports packages, a classic pub setting downstairs, and an award-winning indoor/outdoor rooftop bar overlooking downtown architecture and the Rocky Mountains. Known for its eco-friendly ethos, accommodating vegan and gluten-free menus, and a packed entertainment calendar from Blues Jams to Drag Bingo.',
  'Salt Lake City', 'salt-lake-city', 'Utah', 'Downtown',
  '31 E 400 S, Salt Lake City, UT 84111',
  0,
  'https://thegreenpigpub.com',
  '["https://www.soccer.town/pubs/salt-lake-city/the-green-pig-pub", "https://gamewatch.info/teams/world-cup-soccer/cities/salt-lake-city-ut", "https://thecitizenslc.com/2025/08/guide-to-sports-teams-slc/", "https://www.goodrec.com/blog/where-to-watch-soccer-salt-lake-city-10-best-soccer-bars", "https://saltlake.citycast.fm/best/the-best-places-to-watch-the-game"]',
  5
);

-- 7. Flanker Kitchen + Sporting Club - 17,500 sqft mega sports complex
INSERT INTO bars (slug, name, description, city, city_slug, state, neighborhood, address, opens_early, website, sources, source_count)
VALUES (
  'flanker-slc',
  'Flanker Kitchen + Sporting Club',
  'A 17,500-square-foot multi-concept sports complex near the Delta Center featuring over 60 LED screens and two 20-foot massive displays with 400+ square feet of viewing area. Flanker broadcasts every Real Salt Lake match and all major soccer events, with a dedicated game-day brunch on Saturdays and Sundays complete with food and drink specials. The complex includes three distinguished bars, a polished casual restaurant, private karaoke suites, sports simulators, and capacity for up to 630 guests. Salt Lake City''s biggest and most immersive soccer viewing experience.',
  'Salt Lake City', 'salt-lake-city', 'Utah', 'Rio Grande',
  '6 N Rio Grande St Suite 35, Salt Lake City, UT 84101',
  0,
  'https://www.flankerslc.com',
  '["https://www.flankerslc.com/where-to-watch-soccer-games-in-salt-lake-city/", "https://gastronomicslc.com/2022/08/21/this-salt-lake-bar-wants-to-be-your-new-home-for-the-big-game/", "https://www.yelp.com/biz/flanker-kitchen-and-sporting-club-salt-lake-city", "https://www.visitsaltlake.com/listing/flanker-kitchen-&-sporting-club/70516/"]',
  4
);

-- 8. Crossroads Bar & Grill - Salt Lake City Reds (Liverpool) home bar
INSERT INTO bars (slug, name, description, city, city_slug, state, neighborhood, address, opens_early, website, sources, source_count)
VALUES (
  'crossroads-bar-grill-taylorsville',
  'Crossroads Bar & Grill',
  'Home of the Salt Lake City Reds, a Liverpool FC supporters group founded by Anfield season-ticket holder Billy Taylor with just six members. Now averaging 30+ fans per game including midweek matches, the group fills this Taylorsville bar with Liverpool chants that startled bartender Christy Van Emmerik the first time a full bar started singing out of nowhere. General Manager John Julian reached out to the Reds after another local soccer bar closed, and the partnership has created one of Utah''s most passionate soccer atmospheres. Over 70 Liverpool supporters gathered here for key matches.',
  'Taylorsville', 'taylorsville', 'Utah', NULL,
  '5592 S Redwood Rd, Taylorsville, UT 84123',
  1,
  'https://www.crossroadsbarandgrill.com',
  '["https://www.abc4.com/news/local-news/liverpool-fc-supporters-utah/", "https://sports.yahoo.com/article/magic-utah-based-liverpool-group-172015056.html", "https://www.soccer.town/pubs/salt-lake-city/crossroads-bar-grill", "https://www.instagram.com/lfcutah/"]',
  4
);

-- 9. Poplar Street Pub - Downtown RSL watch party venue with 3 floors
INSERT INTO bars (slug, name, description, city, city_slug, state, neighborhood, address, opens_early, website, sources, source_count)
VALUES (
  'poplar-street-pub-slc',
  'Poplar Street Pub',
  'A downtown institution with 3 floors and 3 bars, Poplar Street is an official Real Salt Lake watch party venue with 30 screens spread across its 290-person venue. Features fresh, never-frozen pub food, hand-made pizza, cold beer and cocktails, three pool tables at $1 per game, and a fire-pit patio. Open daily from 11 AM to 1 AM, with Sunday brunch and live music on weekends. A laid-back, unpretentious gathering spot for SLC soccer fans in the heart of downtown.',
  'Salt Lake City', 'salt-lake-city', 'Utah', 'Downtown',
  '242 S 200 W, Salt Lake City, UT 84101',
  0,
  'https://poplarstreetpub.com',
  '["https://gamewatch.info/teams/real-salt-lake", "https://www.visitsaltlake.com/listing/poplar-street-pub/58588/", "https://sportsbars.com/best-sports-bars-in-salt-lake-city-2025-the-definitive-guide-to-real-venues/", "https://www.yelp.com/biz/poplar-street-pub-salt-lake-city"]',
  4
);

-- 10. Gracie's - Downtown sports bar and RSL watch party location
INSERT INTO bars (slug, name, description, city, city_slug, state, neighborhood, address, opens_early, website, sources, source_count)
VALUES (
  'gracies-slc',
  'Gracie''s',
  'A downtown staple for brunch, dinner, cocktails, live music, and nightlife, Gracie''s doubles as an official Real Salt Lake watch party location. With 35 screens across a 295-seat venue, an award-winning patio, and a robust calendar of special events, it draws a lively crowd for every major soccer match. Opens at 10 AM on weekends for morning kickoffs. American pub food, all-day breakfast, and a pool table in a laid-back atmosphere that transitions from game day to nightlife seamlessly.',
  'Salt Lake City', 'salt-lake-city', 'Utah', 'Rio Grande',
  '326 S West Temple, Salt Lake City, UT 84101',
  1,
  'https://www.graciesslc.com',
  '["https://gamewatch.info/teams/real-salt-lake", "https://sportsbars.com/best-sports-bars-in-salt-lake-city-2025-the-definitive-guide-to-real-venues/", "https://threebestrated.com/sports-bars-in-salt-lake-city-ut", "https://www.yelp.com/biz/gracies-salt-lake-city"]',
  4
);

-- 11. The Bruce Scottish Pub - Scottish-themed pub with European soccer
INSERT INTO bars (slug, name, description, city, city_slug, state, neighborhood, address, opens_early, website, sources, source_count)
VALUES (
  'the-bruce-scottish-pub-slc',
  'The Bruce Scottish Pub',
  'A Scottish-themed sports pub at The Gateway, opened April 2024 as a tribute to local restaurateur William Ray Bruce, a descendant of Robert the Bruce, King of Scots. Serves signature Fish N'' Chips, hearty Steak & Ale Pies, Bangers & Mash, and classic pub fare. Hosts European soccer events including UEFA Champions League finals with food specials and giveaways. Open daily from 10 AM to 1 AM, located directly across from the Delta Center, making it a prime pre-game destination.',
  'Salt Lake City', 'salt-lake-city', 'Utah', 'The Gateway',
  '169 S Rio Grande St, Salt Lake City, UT 84101',
  1,
  'https://www.brucepub.com',
  '["https://www.fox13now.com/the-place/the-bruce-is-a-scottish-themed-pub-in-utah", "https://atthegateway.com/directory/dining/the-bruce-scottish-pub/", "https://www.yelp.com/biz/the-bruce-scottish-pub-salt-lake-city", "https://www.cityweekly.net/utah/the-bruce-scottish-pub/Location?oid=21611308"]',
  4
);

-- 12. Shades Brewing - Craft brewery with RSL watch parties
INSERT INTO bars (slug, name, description, city, city_slug, state, neighborhood, address, opens_early, website, sources, source_count)
VALUES (
  'shades-brewing-slc',
  'Shades Brewing',
  'A Salt Lake City craft brewery positioning itself as the city''s premier soccer watch party destination. Hosts official Real Salt Lake watch parties with game-day specials including $5 pizza slices and $3 local craft beers. Located on the 300 West bike path with a dog-friendly patio, plenty of seating, and big screens for an immersive match-day experience. House favorites include Fabulous Pilsner, Gold Rush IPA, Foggy Goggle Amber Lager, and Craven''s Perch Porter. All fans welcome for a lively supporter atmosphere with raffles and giveaways.',
  'Salt Lake City', 'salt-lake-city', 'Utah', 'Ballpark',
  '1388 S 300 W, Salt Lake City, UT 84115',
  0,
  'https://www.shadesbrewing.beer',
  '["https://www.shadesbrewing.beer/news/watch-real-salt-lake-soccer-at-shades-brewing-game-day-specials-and-watch-parties-in-salt-lake-city", "https://www.shadesbrewing.beer/events", "https://www.flankerslc.com/where-to-watch-soccer-games-in-salt-lake-city/"]',
  3
);

-- ============================================================
-- TEAM AFFILIATIONS
-- ============================================================

-- Fiddler's - Arsenal (Utah Gooners)
INSERT OR IGNORE INTO bar_teams (bar_id, team_slug, team_name)
SELECT id, 'arsenal', 'Arsenal FC' FROM bars WHERE slug = 'fiddlers-slc';

-- Beer Bar - USMNT (American Outlaws), Manchester City, Everton, Real Salt Lake
INSERT OR IGNORE INTO bar_teams (bar_id, team_slug, team_name)
SELECT id, 'real-salt-lake', 'Real Salt Lake' FROM bars WHERE slug = 'beer-bar-slc';

-- Legends Pub & Grill - Tottenham (SLC Spurs), Aston Villa
INSERT OR IGNORE INTO bar_teams (bar_id, team_slug, team_name)
SELECT id, 'tottenham', 'Tottenham Hotspur' FROM bars WHERE slug = 'legends-pub-grill-slc';

-- Dick N' Dixie's - Real Salt Lake
INSERT OR IGNORE INTO bar_teams (bar_id, team_slug, team_name)
SELECT id, 'real-salt-lake', 'Real Salt Lake' FROM bars WHERE slug = 'dick-n-dixies-slc';

-- Piper Down - Real Salt Lake
INSERT OR IGNORE INTO bar_teams (bar_id, team_slug, team_name)
SELECT id, 'real-salt-lake', 'Real Salt Lake' FROM bars WHERE slug = 'piper-down-pub-slc';

-- Flanker - Real Salt Lake
INSERT OR IGNORE INTO bar_teams (bar_id, team_slug, team_name)
SELECT id, 'real-salt-lake', 'Real Salt Lake' FROM bars WHERE slug = 'flanker-slc';

-- Crossroads Bar & Grill - Liverpool FC
INSERT OR IGNORE INTO bar_teams (bar_id, team_slug, team_name)
SELECT id, 'liverpool', 'Liverpool FC' FROM bars WHERE slug = 'crossroads-bar-grill-taylorsville';

-- Poplar Street Pub - Real Salt Lake
INSERT OR IGNORE INTO bar_teams (bar_id, team_slug, team_name)
SELECT id, 'real-salt-lake', 'Real Salt Lake' FROM bars WHERE slug = 'poplar-street-pub-slc';

-- Gracie's - Real Salt Lake
INSERT OR IGNORE INTO bar_teams (bar_id, team_slug, team_name)
SELECT id, 'real-salt-lake', 'Real Salt Lake' FROM bars WHERE slug = 'gracies-slc';

-- Shades Brewing - Real Salt Lake
INSERT OR IGNORE INTO bar_teams (bar_id, team_slug, team_name)
SELECT id, 'real-salt-lake', 'Real Salt Lake' FROM bars WHERE slug = 'shades-brewing-slc';

-- ============================================================
-- LEAGUE AFFILIATIONS
-- ============================================================

-- Fiddler's - Premier League (Arsenal focus), Champions League
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'premier-league', 'Premier League' FROM bars WHERE slug = 'fiddlers-slc';
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'champions-league', 'UEFA Champions League' FROM bars WHERE slug = 'fiddlers-slc';

-- Beer Bar - Premier League, MLS, World Cup
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'premier-league', 'Premier League' FROM bars WHERE slug = 'beer-bar-slc';
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'mls', 'MLS' FROM bars WHERE slug = 'beer-bar-slc';
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'world-cup', 'FIFA World Cup' FROM bars WHERE slug = 'beer-bar-slc';

-- Legends - Premier League, MLS, Champions League
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'premier-league', 'Premier League' FROM bars WHERE slug = 'legends-pub-grill-slc';
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'mls', 'MLS' FROM bars WHERE slug = 'legends-pub-grill-slc';
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'champions-league', 'UEFA Champions League' FROM bars WHERE slug = 'legends-pub-grill-slc';

-- Dick N' Dixie's - MLS, Premier League
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'mls', 'MLS' FROM bars WHERE slug = 'dick-n-dixies-slc';
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'premier-league', 'Premier League' FROM bars WHERE slug = 'dick-n-dixies-slc';

-- Piper Down - MLS, Premier League
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'mls', 'MLS' FROM bars WHERE slug = 'piper-down-pub-slc';
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'premier-league', 'Premier League' FROM bars WHERE slug = 'piper-down-pub-slc';

-- The Green Pig Pub - Premier League, World Cup, MLS
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'premier-league', 'Premier League' FROM bars WHERE slug = 'the-green-pig-pub-slc';
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'world-cup', 'FIFA World Cup' FROM bars WHERE slug = 'the-green-pig-pub-slc';
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'mls', 'MLS' FROM bars WHERE slug = 'the-green-pig-pub-slc';

-- Flanker - MLS, Premier League, Champions League
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'mls', 'MLS' FROM bars WHERE slug = 'flanker-slc';
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'premier-league', 'Premier League' FROM bars WHERE slug = 'flanker-slc';
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'champions-league', 'UEFA Champions League' FROM bars WHERE slug = 'flanker-slc';

-- Crossroads - Premier League (Liverpool focus)
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'premier-league', 'Premier League' FROM bars WHERE slug = 'crossroads-bar-grill-taylorsville';
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'champions-league', 'UEFA Champions League' FROM bars WHERE slug = 'crossroads-bar-grill-taylorsville';

-- Poplar Street Pub - MLS, Premier League
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'mls', 'MLS' FROM bars WHERE slug = 'poplar-street-pub-slc';
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'premier-league', 'Premier League' FROM bars WHERE slug = 'poplar-street-pub-slc';

-- Gracie's - MLS, Premier League
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'mls', 'MLS' FROM bars WHERE slug = 'gracies-slc';
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'premier-league', 'Premier League' FROM bars WHERE slug = 'gracies-slc';

-- The Bruce Scottish Pub - Champions League, Premier League
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'champions-league', 'UEFA Champions League' FROM bars WHERE slug = 'the-bruce-scottish-pub-slc';
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'premier-league', 'Premier League' FROM bars WHERE slug = 'the-bruce-scottish-pub-slc';

-- Shades Brewing - MLS
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'mls', 'MLS' FROM bars WHERE slug = 'shades-brewing-slc';
