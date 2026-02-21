-- Phoenix Metro Area, Arizona Soccer Bars
-- Added: 2026-02-20
-- 10 soccer bars across Phoenix (4), Tempe (2), Scottsdale (1), Glendale (1), Chandler (1), Mesa (1)
-- Phoenix Rising FC (USL Championship) and a large expat community with organized EPL supporter clubs
-- Sources: Cronkite News / ASU / KJZZ, Arizona Sports, Phoenix New Times, Arizona Foothills Magazine,
--          Premier League USA Bar Finder, GoodRec, Neighborhoods.com, GameWatch.info,
--          Arsenal America / arsenal.com, Chelsea in America / chelseafc.com, Tottenham Hotspur official,
--          Liverpool FC OLSC, American Outlaws, CelticBars.com, AZ Soccer, Live Soccer TV,
--          p2bars.com, FourDollarJacks, official bar websites, Yelp, TripAdvisor

-- Add cities to cities table
INSERT OR IGNORE INTO cities (name, slug, state, is_world_cup_host) VALUES ('Phoenix', 'phoenix', 'Arizona', 0);
INSERT OR IGNORE INTO cities (name, slug, state, is_world_cup_host) VALUES ('Tempe', 'tempe', 'Arizona', 0);
INSERT OR IGNORE INTO cities (name, slug, state, is_world_cup_host) VALUES ('Scottsdale', 'scottsdale', 'Arizona', 0);
INSERT OR IGNORE INTO cities (name, slug, state, is_world_cup_host) VALUES ('Glendale', 'glendale', 'Arizona', 0);
INSERT OR IGNORE INTO cities (name, slug, state, is_world_cup_host) VALUES ('Chandler', 'chandler', 'Arizona', 0);
INSERT OR IGNORE INTO cities (name, slug, state, is_world_cup_host) VALUES ('Mesa', 'mesa', 'Arizona', 0);

-- Add Phoenix Rising FC to teams table
INSERT OR IGNORE INTO teams (slug, name, league) VALUES ('phoenix-rising', 'Phoenix Rising FC', 'USL Championship');

-- ============================================================
-- BARS - PHOENIX
-- ============================================================

-- 1. George & Dragon English Pub - THE soccer pub of Phoenix since 1995
INSERT INTO bars (slug, name, description, city, city_slug, state, neighborhood, address, opens_early, website, sources, source_count)
VALUES (
  'george-dragon-phoenix',
  'George & Dragon English Pub',
  'Phoenix''s original and most authentic English pub, opened on February 15, 1995 by David Wimberley and his mother Anne after moving from the UK. George & Dragon is a mid-Phoenix institution where footy matches air on TVs above the bar surrounded by jerseys and flags of beloved clubs. Packed to the walls every four years for the World Cup, and crowded every weekend morning for Premier League breakfast viewing. Home of the Phoenix Red Devils (Manchester United supporters, founded 2015) -- owner David has been a United fan since 1968. Award-winning fish and chips, bangers and mash, Cornish pasties, and imported English beers including Smithwick''s and Boddingtons on tap. Voted Best Pub multiple times by Phoenix New Times.',
  'Phoenix', 'phoenix', 'Arizona', 'Uptown',
  '4240 N Central Ave, Phoenix, AZ 85012',
  0,
  'https://www.gndphx.com/',
  '["https://cronkitenews.azpbs.org/2023/09/12/phoenix-premier-league-soccer-support-groups-grow-in-phoenix-pubs/", "https://www.phoenixnewtimes.com/food-drink/george-and-dragon-phoenix-english-pub-oral-history-11442800/", "https://coppercourier.com/2023/05/19/george-and-dragon-phoenix-authentic-english-pub-2/", "https://gamewatch.info/teams/world-cup-soccer/bars/george-and-dragon-english-pub-4240-north-central-avenue-casa-de-alegria-phoenix-az-united-states", "https://www.goodrec.com/blog/where-to-watch-soccer-phoenix-10-best-soccer-bars", "https://www.yelp.com/biz/george-and-dragon-pub-phoenix"]',
  6
);

-- 2. Crown Public House - Official Liverpool FC OLSC Phoenix home
INSERT INTO bars (slug, name, description, city, city_slug, state, neighborhood, address, opens_early, website, sources, source_count)
VALUES (
  'crown-public-house-phoenix',
  'Crown Public House',
  'The official viewing bar for all Liverpool FC matches in Phoenix, home to the OLSC Phoenix (Official Liverpool Supporters Club, founded 2013). The pub is the reborn Rose and Crown -- after the city reclaimed its Heritage Square location, the pub merged with a sports bar (formerly Coach''s Corner) to create Crown Public House in downtown Phoenix. Nestled between Chase Field (Diamondbacks) and Footprint Center (Suns), the pub offers a proper British atmosphere with a full food menu of wings, poutine with hand-cut fries and cheese curds, and traditional pub grub. Named Best British Pub by Phoenix New Times in 2022. Opens for all Liverpool matches regardless of kick-off time.',
  'Phoenix', 'phoenix', 'Arizona', 'Downtown',
  '333 E Jefferson St, Phoenix, AZ 85004',
  1,
  'https://crownpublichouse.com/',
  '["https://www.lfcphx.org/location", "https://arizonasports.com/story/1410021/phoenixs-rose-and-crown-pub-is-home-for-valley-fans-of-liverpool/", "https://www.phoenixnewtimes.com/best-of/2022/food-and-drink/best-british-pub-14545684", "https://www.liverpoolfc.com/fans/official-lfc-supporters-clubs/north-america", "https://www.premierleague.com/usa-bar-finder/bar/2025/the-rose-and-crown", "https://www.yelp.com/biz/crown-public-house-phoenix"]',
  6
);

-- 3. The Kettle Black Kitchen & Pub - Manchester City (Phoenix Desert Blues) home
INSERT INTO bars (slug, name, description, city, city_slug, state, neighborhood, address, opens_early, website, sources, source_count)
VALUES (
  'kettle-black-phoenix',
  'The Kettle Black Kitchen & Pub',
  'Home of the Phoenix Desert Blues, the official Manchester City supporters club in Arizona (founded 2014, moved to The Kettle Black in 2016). Owner Jimmy Culleton, a Dublin native and lifelong Man City fan, opens the pub for every City match no matter the kick-off time -- including 4:30 AM starts on Arizona time. Listed on the official Premier League USA Bar Finder. The gastropub serves elevated Irish pub fare with outstanding fish and chips, craft cocktails, and a strong draft selection. Located in downtown Phoenix within walking distance of the Footprint Center.',
  'Phoenix', 'phoenix', 'Arizona', 'Downtown',
  '1 N 1st St #108, Phoenix, AZ 85004',
  1,
  'https://thekettleblackpub.com/',
  '["https://cronkitenews.azpbs.org/2023/09/12/phoenix-premier-league-soccer-support-groups-grow-in-phoenix-pubs/", "https://www.premierleague.com/usa-bar-finder/bar/1986/the-kettle-black", "https://www.kjzz.org/2019-05-12/content-937091-manchester-city-supporters-celebrate-teams-title-phoenix", "https://www.fanzo.com/en-us/bar/252355/the-kettle-black-kitchen-pub", "https://www.goodrec.com/blog/where-to-watch-soccer-phoenix-10-best-soccer-bars", "https://www.yelp.com/biz/the-kettle-black-kitchen-and-pub-phoenix"]',
  6
);

-- 4. Seamus McCaffrey's Irish Pub - Celtic FC connection, 30+ year institution
INSERT INTO bars (slug, name, description, city, city_slug, state, neighborhood, address, opens_early, website, sources, source_count)
VALUES (
  'seamus-mccaffreys-phoenix',
  'Seamus McCaffrey''s Irish Pub',
  'Downtown Phoenix''s iconic Irish pub, pouring pints and serving comfort food for more than three decades since opening in 1991. Owner Seamus McCaffrey co-founded the Bobby Murdoch Phoenix Celtic Supporters Club, connecting the pub to Glasgow Celtic FC. Situated at the back of the historic Hotel San Carlos, the pub features one of the best whiskey selections in Phoenix with Irish whiskey and single malt Scotch leading the way, alongside perfectly poured Guinness. The kitchen serves Irish classics including boxty, shepherd''s pie, fish and chips, and hearty sandwiches. Live music and traditional Irish atmosphere make this a proper cultural institution.',
  'Phoenix', 'phoenix', 'Arizona', 'Downtown',
  '18 W Monroe St, Phoenix, AZ 85003',
  0,
  'https://seamusmccaffreys.com/',
  '["https://www.phoenixnewtimes.com/food-drink/seamus-mccaffreys-phoenix-irish-pub-st-patricks-day-parties-andrew-mirtich-11537156/", "https://phoenixcsc.com/", "https://www.celticbars.com/cscs/", "https://seamusmccaffreys.com/about/", "https://www.yelp.com/biz/seamus-mccaffreys-phoenix"]',
  5
);

-- ============================================================
-- BARS - TEMPE
-- ============================================================

-- 5. Yucca Tap Room - Arizona Gooners (Arsenal, 200+ members) home
INSERT INTO bars (slug, name, description, city, city_slug, state, neighborhood, address, opens_early, website, sources, source_count)
VALUES (
  'yucca-tap-room-tempe',
  'Yucca Tap Room',
  'Home of the Arizona Gooners, the official Arsenal supporters club in the Phoenix metro (established 2011, over 200 members). The Yucca Tap Room is Tempe''s original live music venue with 40+ years of history, but its back room has been transformed into Arsenal''s Arizona fortress -- complete with 5 TVs, a projector screen, a dedicated sound system, its own bar with a wide beer selection, pool table, and private bathrooms. Opens at 6 AM every day of the year to accommodate early Arsenal kick-offs, regularly drawing 20-30 supporters for matches. Listed on arsenal.com as the official Phoenix-area supporters club venue.',
  'Tempe', 'tempe', 'Arizona', NULL,
  '29 W Southern Ave, Tempe, AZ 85282',
  1,
  'https://yuccatap.com/',
  '["https://www.arsenal.com/usa/fanzone-usa/usa-supporters-club/phoenix-az", "https://www.arizonagooners.com/about.html", "https://cronkitenews.azpbs.org/2023/09/12/phoenix-premier-league-soccer-support-groups-grow-in-phoenix-pubs/", "https://firsttouchonline.com/arsenal-supporters-clubs-usa/", "https://www.livesoccertv.com/pubs/arizona/", "https://www.yelp.com/biz/yucca-tap-room-tempe"]',
  6
);

-- 6. Four Peaks Brewing Company - Phoenix Rising FC watch party venue, iconic Tempe brewery
INSERT INTO bars (slug, name, description, city, city_slug, state, neighborhood, address, opens_early, website, sources, source_count)
VALUES (
  'four-peaks-tempe',
  'Four Peaks Brewing Company',
  'Tempe''s legendary craft brewery housed inside a 100-year-old former creamery and ice factory on 8th Street, and an official Phoenix Rising FC watch party venue. Four Peaks hosted World Cup watch parties with the Phoenix Rising head coach in attendance and provides fans a gathering spot for big matches with towering ceilings, giant roll-up garage doors, and TVs throughout. The 8th Street Pub is the original location offering the best selection of Four Peaks beers alongside brewpub fare including flatbreads, pretzels, and sandwiches. Opens at 9 AM on weekends for morning matches.',
  'Tempe', 'tempe', 'Arizona', NULL,
  '1340 E 8th St #104, Tempe, AZ 85281',
  1,
  'https://www.fourpeaks.com/8th-street-pub',
  '["https://www.fourpeaks.com/events/phoenix-rising-watch-party/", "https://www.oursportscentral.com/services/releases/phoenix-rising-fc-to-host-eight-world-cup-watch-parties-group-stage/n-5898571", "https://cronkitenews.azpbs.org/2021/10/27/phoenix-rising-fans-watch-parties-to-show-support/", "https://gamewatch.info/teams/world-cup-soccer/bars/four-peaks-brewing-company-1340-east-8th-street-tempe-az-united-states", "https://www.livesoccertv.com/pubs/arizona/", "https://www.yelp.com/biz/four-peaks-brewing-tempe-2"]',
  6
);

-- ============================================================
-- BAR - SCOTTSDALE
-- ============================================================

-- 7. K O'Donnell's Sports Bar & Grill - Scottsdale's premier soccer bar, 75+ TVs
INSERT INTO bars (slug, name, description, city, city_slug, state, neighborhood, address, opens_early, website, sources, source_count)
VALUES (
  'kodonnells-scottsdale',
  'K O''Donnell''s Sports Bar & Grill',
  'Scottsdale''s self-proclaimed best soccer bar, family-owned since 2005 when founded by legendary poker player Kevin O''Donnell (sold to his daughter Jennifer in 2013). K O''Donnell''s carries the beIN Sports Network, covering Premier League, La Liga, Ligue 1, Serie A, and Champions League across more than 75 TVs inside and on an expansive shaded patio. Each table has personal audio boxes so fans can tune into their preferred match. Also features 16 rotating local drafts, scratch-made food, weekend brunch, daily specials, and twice-daily happy hours.',
  'Scottsdale', 'scottsdale', 'Arizona', 'North Scottsdale',
  '14850 N Northsight Blvd, Scottsdale, AZ 85260',
  0,
  'https://kodonnells.com/',
  '["https://kodonnells.com/scottsdale-soccer-bar/", "https://www.experiencescottsdale.com/stories/post/scottsdales-sports-bar-heavy-hitters/", "https://www.neighborhoods.com/blog/5-great-soccer-pubs-in-the-phoenix-metro", "https://www.livesoccertv.com/pubs/arizona/", "https://www.yelp.com/biz/k-o-donnell-s-sports-bar-and-grill-scottsdale"]',
  5
);

-- ============================================================
-- BAR - GLENDALE
-- ============================================================

-- 8. Tim Finnegan's Irish Restaurant and Pub - "Only official US soccer bar in AZ"
INSERT INTO bars (slug, name, description, city, city_slug, state, neighborhood, address, opens_early, website, sources, source_count)
VALUES (
  'tim-finnegans-glendale',
  'Tim Finnegan''s Irish Restaurant and Pub',
  'Billed as the only official U.S. soccer bar in Arizona, Tim Finnegan''s was named by Buzzfeed as one of the top bars in the country to watch the World Cup. Listed on the Premier League USA Bar Finder and formerly the home of the Phoenix Desert Blues (Manchester City, before they moved to The Kettle Black in 2016). The pub blends traditional Irish decor with a contemporary style, serving USDA Prime beef, shepherd''s pie with choice lamb, and fresh mussels alongside a strong selection of Irish and craft beers. A destination for EPL and international football fans across the northwest Valley.',
  'Glendale', 'glendale', 'Arizona', NULL,
  '17045 N 59th Ave #103, Glendale, AZ 85308',
  0,
  'https://timfinnegans.com/',
  '["https://www.premierleague.com/usa-bar-finder/bar/2026/tim-finnegans", "https://www.neighborhoods.com/blog/5-great-soccer-pubs-in-the-phoenix-metro", "https://cronkitenews.azpbs.org/2023/09/12/phoenix-premier-league-soccer-support-groups-grow-in-phoenix-pubs/", "https://experienceglendaleaz.com/listing/tim-finnegans-irish-restaurant-and-pub/141/", "https://www.yelp.com/biz/tim-finnegans-irish-restaurant-and-pub-glendale"]',
  5
);

-- ============================================================
-- BAR - CHANDLER
-- ============================================================

-- 9. Fibber Magees - Arizona Spurs (Tottenham, 150+ members) home
INSERT INTO bars (slug, name, description, city, city_slug, state, neighborhood, address, opens_early, website, sources, source_count)
VALUES (
  'fibber-magees-chandler',
  'Fibber Magees',
  'Home of the Arizona Spurs, the official Tottenham Hotspur supporters club in Arizona (established 2014, 150+ members). The Arizona Spurs meet at Fibber Magees on every matchday to cheer on the Lilywhites, and the pub reaches its peak atmosphere for big Champions League and North London derby fixtures. An authentic Irish pub since opening in Chandler, Fibber Magees serves traditional fare including homemade brown and soda breads, fish and chips, shepherd''s pie, and bangers and mash. The pub also features a generous patio, live Irish music, quiz nights, and open mic events.',
  'Chandler', 'chandler', 'Arizona', NULL,
  '1989 W Elliot Rd, Chandler, AZ 85224',
  0,
  'https://www.fibbermageespub.com/',
  '["https://www.tottenhamhotspur.com/fans/supporters-clubs/join-a-club/arizona-spurs/", "https://kjzz.org/content/977771/tottenham-hotspurs-fc-fans-flock-fibber-magees-champions-league-final", "https://arizonaspurs.com/", "https://cronkitenews.azpbs.org/2023/09/12/phoenix-premier-league-soccer-support-groups-grow-in-phoenix-pubs/", "https://thebracephx.com/tottenham-hotspurs-arizona-spurs/", "https://www.yelp.com/biz/fibber-magees-chandler-3"]',
  6
);

-- ============================================================
-- BAR - MESA
-- ============================================================

-- 10. O'Kelley's Sports Bar & Grill - Phoenix Blues (Chelsea supporters) home
INSERT INTO bars (slug, name, description, city, city_slug, state, neighborhood, address, opens_early, website, sources, source_count)
VALUES (
  'okelleys-mesa',
  'O''Kelley''s Sports Bar & Grill',
  'Home of the Phoenix Blues, the official Chelsea FC supporters club in the Phoenix metro area (affiliated with Chelsea in America). O''Kelley''s has been a Mesa neighborhood institution since 2001 in the Dobson Ranch area, featuring over 50 TVs for sports viewing. The bar opens at 6 AM Monday through Saturday, making it one of the earliest-opening sports bars in the Valley -- ideal for morning Premier League and Champions League matches. Also offers live music, pool, karaoke, poker nights, trivia, darts, and off-track betting alongside a full food menu.',
  'Mesa', 'mesa', 'Arizona', 'Dobson Ranch',
  '2120 W Guadalupe Rd #16, Mesa, AZ 85202',
  1,
  'https://okelleysbar.com/',
  '["https://www.chelseainamerica.com/locals/phoenix-blues", "https://www.chelseafc.com/en/our-official-supporters-clubs", "https://okelleysbar.com/", "https://www.yelp.com/biz/o-kelley-s-sports-bar-and-grill-mesa-5"]',
  4
);

-- ============================================================
-- TEAM AFFILIATIONS
-- ============================================================

-- George & Dragon - Manchester United (Phoenix Red Devils)
INSERT OR IGNORE INTO bar_teams (bar_id, team_slug, team_name)
SELECT id, 'manchester-united', 'Manchester United FC' FROM bars WHERE slug = 'george-dragon-phoenix';

-- Crown Public House - Liverpool FC (OLSC Phoenix)
INSERT OR IGNORE INTO bar_teams (bar_id, team_slug, team_name)
SELECT id, 'liverpool', 'Liverpool FC' FROM bars WHERE slug = 'crown-public-house-phoenix';

-- The Kettle Black - Manchester City (Phoenix Desert Blues)
INSERT OR IGNORE INTO bar_teams (bar_id, team_slug, team_name)
SELECT id, 'manchester-city', 'Manchester City FC' FROM bars WHERE slug = 'kettle-black-phoenix';

-- Seamus McCaffrey's - Celtic FC (Bobby Murdoch Phoenix CSC)
INSERT OR IGNORE INTO bar_teams (bar_id, team_slug, team_name)
SELECT id, 'celtic', 'Celtic FC' FROM bars WHERE slug = 'seamus-mccaffreys-phoenix';

-- Yucca Tap Room - Arsenal (Arizona Gooners)
INSERT OR IGNORE INTO bar_teams (bar_id, team_slug, team_name)
SELECT id, 'arsenal', 'Arsenal FC' FROM bars WHERE slug = 'yucca-tap-room-tempe';

-- Four Peaks - Phoenix Rising FC
INSERT OR IGNORE INTO bar_teams (bar_id, team_slug, team_name)
SELECT id, 'phoenix-rising', 'Phoenix Rising FC' FROM bars WHERE slug = 'four-peaks-tempe';

-- Fibber Magees - Tottenham Hotspur (Arizona Spurs)
INSERT OR IGNORE INTO bar_teams (bar_id, team_slug, team_name)
SELECT id, 'tottenham', 'Tottenham Hotspur' FROM bars WHERE slug = 'fibber-magees-chandler';

-- O'Kelley's - Chelsea FC (Phoenix Blues)
INSERT OR IGNORE INTO bar_teams (bar_id, team_slug, team_name)
SELECT id, 'chelsea', 'Chelsea FC' FROM bars WHERE slug = 'okelleys-mesa';

-- ============================================================
-- LEAGUE AFFILIATIONS
-- ============================================================

-- George & Dragon - Premier League, FA Cup, Champions League, World Cup
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'premier-league', 'Premier League' FROM bars WHERE slug = 'george-dragon-phoenix';
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'fa-cup', 'FA Cup' FROM bars WHERE slug = 'george-dragon-phoenix';
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'champions-league', 'UEFA Champions League' FROM bars WHERE slug = 'george-dragon-phoenix';
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'world-cup', 'FIFA World Cup' FROM bars WHERE slug = 'george-dragon-phoenix';

-- Crown Public House - Premier League, Champions League, World Cup
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'premier-league', 'Premier League' FROM bars WHERE slug = 'crown-public-house-phoenix';
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'champions-league', 'UEFA Champions League' FROM bars WHERE slug = 'crown-public-house-phoenix';
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'world-cup', 'FIFA World Cup' FROM bars WHERE slug = 'crown-public-house-phoenix';

-- The Kettle Black - Premier League, Champions League
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'premier-league', 'Premier League' FROM bars WHERE slug = 'kettle-black-phoenix';
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'champions-league', 'UEFA Champions League' FROM bars WHERE slug = 'kettle-black-phoenix';

-- Seamus McCaffrey's - Premier League, Scottish Premiership
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'premier-league', 'Premier League' FROM bars WHERE slug = 'seamus-mccaffreys-phoenix';
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'scottish-premiership', 'Scottish Premiership' FROM bars WHERE slug = 'seamus-mccaffreys-phoenix';

-- Yucca Tap Room - Premier League, FA Cup, Champions League
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'premier-league', 'Premier League' FROM bars WHERE slug = 'yucca-tap-room-tempe';
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'fa-cup', 'FA Cup' FROM bars WHERE slug = 'yucca-tap-room-tempe';
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'champions-league', 'UEFA Champions League' FROM bars WHERE slug = 'yucca-tap-room-tempe';

-- Four Peaks - MLS (Phoenix Rising via USL), World Cup
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'mls', 'MLS' FROM bars WHERE slug = 'four-peaks-tempe';
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'world-cup', 'FIFA World Cup' FROM bars WHERE slug = 'four-peaks-tempe';

-- K O'Donnell's - Premier League, La Liga, Serie A, Ligue 1, Champions League
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'premier-league', 'Premier League' FROM bars WHERE slug = 'kodonnells-scottsdale';
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'la-liga', 'La Liga' FROM bars WHERE slug = 'kodonnells-scottsdale';
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'serie-a', 'Serie A' FROM bars WHERE slug = 'kodonnells-scottsdale';
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'ligue-1', 'Ligue 1' FROM bars WHERE slug = 'kodonnells-scottsdale';
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'champions-league', 'UEFA Champions League' FROM bars WHERE slug = 'kodonnells-scottsdale';

-- Tim Finnegan's - Premier League, World Cup
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'premier-league', 'Premier League' FROM bars WHERE slug = 'tim-finnegans-glendale';
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'world-cup', 'FIFA World Cup' FROM bars WHERE slug = 'tim-finnegans-glendale';

-- Fibber Magees - Premier League, Champions League
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'premier-league', 'Premier League' FROM bars WHERE slug = 'fibber-magees-chandler';
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'champions-league', 'UEFA Champions League' FROM bars WHERE slug = 'fibber-magees-chandler';

-- O'Kelley's - Premier League, Champions League
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'premier-league', 'Premier League' FROM bars WHERE slug = 'okelleys-mesa';
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'champions-league', 'UEFA Champions League' FROM bars WHERE slug = 'okelleys-mesa';
