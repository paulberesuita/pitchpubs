-- San Jose Metro Area Soccer Bars
-- Added: 2026-02-20
-- 10 soccer bars across the San Jose/Silicon Valley metro area
-- SJ Earthquakes (MLS, 1996) and Bay FC (NWSL, 2024) make this a key soccer market
-- Sources: SJ Earthquakes official (sjearthquakes.com), Premier League USA Bar Finder,
--          GoodRec, GameWatch.info, Fanzo, Mercury News, Metro Silicon Valley,
--          Arsenal.com (Silicon Valley Gooners), LFC Silicon Valley, Yelp, Visit San Jose,
--          San Jose Spotlight, Bay FC official

-- Add cities to cities table
INSERT OR IGNORE INTO cities (name, slug, state, is_world_cup_host) VALUES ('San Jose', 'san-jose', 'CA', 0);
INSERT OR IGNORE INTO cities (name, slug, state, is_world_cup_host) VALUES ('Cupertino', 'cupertino', 'CA', 0);
INSERT OR IGNORE INTO cities (name, slug, state, is_world_cup_host) VALUES ('Mountain View', 'mountain-view', 'CA', 0);
INSERT OR IGNORE INTO cities (name, slug, state, is_world_cup_host) VALUES ('Los Gatos', 'los-gatos', 'CA', 0);

-- Add San Jose Earthquakes to teams table
INSERT OR IGNORE INTO teams (slug, name, league) VALUES ('san-jose-earthquakes', 'San Jose Earthquakes', 'MLS');
-- Add Bay FC to teams table
INSERT OR IGNORE INTO teams (slug, name, league) VALUES ('bay-fc', 'Bay FC', 'NWSL');

-- ============================================================
-- BARS
-- ============================================================

-- 1. O'Flaherty's Irish Pub - Official Earthquakes watch party venue, LFC Silicon Valley home
INSERT INTO bars (slug, name, description, city, city_slug, state, neighborhood, address, opens_early, website, sources, source_count)
VALUES (
  'oflahertys-irish-pub-sj',
  'O''Flaherty''s Irish Pub',
  'An authentic Irish pub in San Pedro Square founded in 2002 by Ray and Marie from Ireland, with furniture, bar fixtures, and memorabilia shipped directly from the old country. One of only two official San Jose Earthquakes watch party venues, hosting viewing parties for every away match. Also the home of LFC Silicon Valley, the official Liverpool FC supporters club, opening at 7am for all Liverpool fixtures. With 52 beers on tap and traditional Irish fare like fish and chips and shepherd''s pie, O''Flaherty''s is open 365 days a year.',
  'San Jose', 'san-jose', 'CA', 'San Pedro Square',
  '25 N San Pedro St, San Jose, CA 95110',
  1,
  'https://www.oflahertyspub.com',
  '["https://www.sjearthquakes.com/fans/watchparty", "https://www.sjearthquakes.com/news/news-earthquakes-to-host-2024-copa-america-and-uefa-euro-2024viewing-parties-in-multiple-san-jose-locations", "https://www.mercurynews.com/2022/11/19/san-jose-earthquakes-to-host-world-cup-viewing-parties-in-downtown-san-jose/", "https://lfcsiliconvalley.com/", "https://www.liverpoolfc.com/fans/official-lfc-supporters-clubs/north-america", "https://www.goodrec.com/blog/where-to-watch-soccer-san-jose-10-best-soccer-bars"]',
  6
);

-- 2. Jack's Bar & Lounge - Japantown institution, Earthquakes, Arsenal, Bay FC, American Outlaws
INSERT INTO bars (slug, name, description, city, city_slug, state, neighborhood, address, opens_early, website, sources, source_count)
VALUES (
  'jacks-bar-sj',
  'Jack''s Bar & Lounge',
  'A Japantown institution for over 60 years and the most soccer-connected bar in Silicon Valley. Home of the Silicon Valley Gooners (official Arsenal supporters club since 2014), an official San Jose Earthquakes Team 408 watch party venue, a Bay FC Bridge Brigade watch party host, and a chapter of the American Outlaws. The owner is an Arsenal fan who opens the doors at 6am on weekends for Premier League and Champions League matches. Spacious back patio with heaters, lush greenery, and its own bar.',
  'San Jose', 'san-jose', 'CA', 'Japantown',
  '167 E Taylor St, San Jose, CA 95112',
  1,
  'https://jacksbar.com',
  '["https://www.arsenal.com/usa/fanzone-usa/usa-supporters-club/san-jose-ca", "https://www.sjearthquakes.com/news/jacks-bar-and-lounge-hosting-viewing-party-quakes-vs-minnesota-united-july-3", "https://gamewatch.info/teams/san-jose-earthquakes", "https://bayfc.com/", "https://www.fanzo.com/en-us/bars-pubs/san-jose/9813", "https://www.goodrec.com/blog/where-to-watch-soccer-san-jose-10-best-soccer-bars"]',
  6
);

-- 3. The Old Wagon Saloon & Grill - Official Earthquakes watch party, opens 5am for matches
INSERT INTO bars (slug, name, description, city, city_slug, state, neighborhood, address, opens_early, website, sources, source_count)
VALUES (
  'old-wagon-saloon-sj',
  'The Old Wagon Saloon & Grill',
  'A modern bar with Old West charm in the heart of San Pedro Square and one of only two official San Jose Earthquakes watch party venues. The Old Wagon opens as early as 5am for World Cup, Copa America, and Euro matches, with complimentary donuts from Stan''s Donuts for morning viewers. Season ticket holders receive a free beer during viewing parties. Located on the recently pedestrianized stretch of N. San Pedro Street, steps from the SAP Center.',
  'San Jose', 'san-jose', 'CA', 'San Pedro Square',
  '73 N San Pedro St, San Jose, CA 95110',
  1,
  'https://theoldwagonsaloon.com',
  '["https://www.sjearthquakes.com/fans/watchparty", "https://www.sjearthquakes.com/news/news-earthquakes-to-host-2024-copa-america-and-uefa-euro-2024viewing-parties-in-multiple-san-jose-locations", "https://www.mercurynews.com/2022/11/19/san-jose-earthquakes-to-host-world-cup-viewing-parties-in-downtown-san-jose/", "https://gamewatch.info/teams/san-jose-earthquakes"]',
  4
);

-- 4. The Brit (Britannia Arms Downtown) - British pub, 25 TVs, San Pedro Square
INSERT INTO bars (slug, name, description, city, city_slug, state, neighborhood, address, opens_early, website, sources, source_count)
VALUES (
  'the-brit-sj',
  'The Brit',
  'San Jose''s premier British pub at San Pedro Square, rebranded from the original Britannia Arms Downtown. Features 25 TVs showing up to 15 different competitions at once, 19 beers on tap plus 2 hard ciders, and a spacious 3,000-square-foot heated patio with full-service bar. Opens early for Euro and World Cup matches. Runner-up for Best British Pub in Metro Silicon Valley''s Best of 2022. Traditional British dishes including famous fish and chips, Shepherd''s Pie, and British Bangers.',
  'San Jose', 'san-jose', 'CA', 'San Pedro Square',
  '173 W Santa Clara St, San Jose, CA 95113',
  1,
  'https://www.thebritsj.com',
  '["https://www.metrosiliconvalley.com/the-brit-sports-pub-patio/", "https://gamewatch.info/teams/san-jose-earthquakes", "https://www.sanjose.org/listings/britannia-arms", "https://www.goodrec.com/blog/where-to-watch-soccer-san-jose-10-best-soccer-bars", "https://www.fanzo.com/en-us/bars-pubs/san-jose/9813"]',
  5
);

-- 5. Britannia Arms Almaden - British pub, opens early weekends for EPL
INSERT INTO bars (slug, name, description, city, city_slug, state, neighborhood, address, opens_early, website, sources, source_count)
VALUES (
  'britannia-arms-almaden',
  'Britannia Arms Almaden',
  'San Jose''s original British American pub in the Almaden Valley, sister location to The Brit downtown. Opens at 9am on weekends for Premier League and European football matches, with live-telecast soccer events from the UK a staple of early morning programming. Listed on the Premier League USA Bar Finder. Authentic pub menu with craft beers, a large patio, and beer garden in a neighborhood setting. Also opens early for Euro and World Cup tournaments.',
  'San Jose', 'san-jose', 'CA', 'Almaden Valley',
  '5027 Almaden Expy, San Jose, CA 95118',
  1,
  'https://britanniaarms.com',
  '["https://www.premierleague.com/usa-bar-finder/bar/1966/rookies-sports-lodge-willow-glen", "https://gamewatch.info/teams/san-jose-earthquakes", "https://www.sanjose.org/listings/britannia-arms", "https://eventseeker.com/venue/161135-britannia-arms-almaden-san-jose-ca"]',
  4
);

-- 6. Rookies Sports Lodge (Willow Glen) - Premier League Bar Finder, family-owned, 22+ screens
INSERT INTO bars (slug, name, description, city, city_slug, state, neighborhood, address, opens_early, website, sources, source_count)
VALUES (
  'rookies-sports-lodge-willow-glen',
  'Rookies Sports Lodge',
  'A family-owned sports bar in the Willow Glen neighborhood and one of San Jose''s most popular spots for watching soccer. Listed on the Premier League USA Bar Finder, Rookies features 22+ HDTV screens including a 90-inch and three 80-inch screens, plus a tailgate room for private groups of up to 45. The most-viewed Earthquakes bar on GameWatch.info. Known for house-made burgers, sweet potato fries, and New American cuisine. Almost every sports package available.',
  'San Jose', 'san-jose', 'CA', 'Willow Glen',
  '1535 Meridian Ave, San Jose, CA 95125',
  0,
  'https://rookieslodge.com',
  '["https://www.premierleague.com/usa-bar-finder/bar/1966/rookies-sports-lodge-willow-glen", "https://gamewatch.info/teams/san-jose-earthquakes", "https://www.goodrec.com/blog/where-to-watch-soccer-san-jose-10-best-soccer-bars", "https://www.sanjose.org/listings/rookies-sports-lodge", "https://www.fanzo.com/en-us/bars-pubs/san-jose/9813"]',
  5
);

-- 7. Rookies Sports Lodge (Downtown) - 35+ 4K TVs, downtown San Jose
INSERT INTO bars (slug, name, description, city, city_slug, state, neighborhood, address, opens_early, website, sources, source_count)
VALUES (
  'rookies-sports-lodge-downtown',
  'Rookies Sports Lodge Downtown',
  'The downtown outpost of San Jose''s beloved family-owned sports bar, located on the iconic corner of South 1st and San Fernando in the Historic District. Over thirty-five 4K TVs ensure every match is covered, with a Luxury Box private room featuring three huge 4K TVs and premium surround sound for up to 16 guests. A heated covered patio accommodates up to 300 guests for watch parties. Scratch-made New American cuisine including pizzas, sandwiches, and burgers.',
  'San Jose', 'san-jose', 'CA', 'Downtown',
  '99 S 1st St, San Jose, CA 95113',
  0,
  'https://rookieslodge.com/san-jose-rookies-willow-glen-downtown',
  '["https://www.sanjose.org/listings/rookies-sports-lodge-downtown", "https://www.fanzo.com/en-us/bars-pubs/san-jose/9813", "https://www.goodrec.com/blog/where-to-watch-soccer-san-jose-10-best-soccer-bars"]',
  3
);

-- 8. Duke of Edinburgh - Cupertino, authentic British pub since 1983
INSERT INTO bars (slug, name, description, city, city_slug, state, neighborhood, address, opens_early, website, sources, source_count)
VALUES (
  'duke-of-edinburgh-cupertino',
  'Duke of Edinburgh',
  'The dream of three Englishmen and one American who wanted to build an authentic British pub in California, the Duke has been a Silicon Valley institution since Halloween 1983. Everything inside -- the bar, ceiling, carpet, wallpaper, lamps -- was made in England, packed in containers, and shipped to California. On any given night, regulars can be found watching a football match or throwing darts. The Duke has sponsored adult soccer teams for decades. Classic menu of fish and chips, bangers and mash, and Beef Wellington, with Guinness and Old Speckled Hen on tap.',
  'Cupertino', 'cupertino', 'CA', NULL,
  '10801 N Wolfe Rd, Cupertino, CA 95014',
  0,
  'https://www.theduke.com',
  '["https://sanjosespotlight.com/beloved-cupertino-bar-pub-duke-of-edinburgh-could-face-last-call/", "https://localnewsmatters.org/2023/11/28/beloved-cupertino-pub-could-face-last-call-the-duke-has-remained-a-fixture-for-40-years/", "https://www.mercurynews.com/2011/01/31/cocktail-chronicles-the-duke-of-edinburgh-in-cupertino/", "https://www.goodrec.com/blog/where-to-watch-soccer-san-jose-10-best-soccer-bars"]',
  4
);

-- 9. St. Stephen's Green - Mountain View, Irish pub, Premier League
INSERT INTO bars (slug, name, description, city, city_slug, state, neighborhood, address, opens_early, website, sources, source_count)
VALUES (
  'st-stephens-green-mv',
  'St. Stephen''s Green',
  'An authentic, Irish-owned and managed pub and restaurant on Castro Street in downtown Mountain View since 1999. Billed as a Premier All Sports Irish Bar, St. Stephen''s Green features multiple screens broadcasting major sporting events including rugby and soccer, with an electrifying atmosphere during big matches. Opens at 9:45am on Sundays and 11am on Saturdays for early fixtures. Traditional Irish fare with great burgers and a selection of 35 worldwide premium and craft beers including Guinness from Ireland. Indoor and outdoor heated seating.',
  'Mountain View', 'mountain-view', 'CA', 'Downtown',
  '223 Castro St, Mountain View, CA 94041',
  0,
  'https://ststephensgreen.com',
  '["https://www.goodrec.com/blog/where-to-watch-soccer-san-jose-10-best-soccer-bars", "https://www.livesoccertv.com/pubs/california/", "https://evendo.com/locations/california/mountain-view/bar/st-stephen-s-green"]',
  3
);

-- 10. Double D's Sports Grille - Los Gatos, 34 screens, Mercury News Best Sports Bar
INSERT INTO bars (slug, name, description, city, city_slug, state, neighborhood, address, opens_early, website, sources, source_count)
VALUES (
  'double-ds-los-gatos',
  'Double D''s Sports Grille',
  'Brothers Dean and Darin Devincenzi opened this family-friendly sports bar in 1996, and it has won the Mercury News''s Best Sports Bar in Silicon Valley award every year since. Features 34 big screens and a newly built outdoor patio for watching matches. Listed as an Earthquakes watch party location on GameWatch.info. Rotating taps, craft cocktails, and a menu of wings, calamari, burgers, and Italian-American entrees. Located on charming N. Santa Cruz Avenue in downtown Los Gatos.',
  'Los Gatos', 'los-gatos', 'CA', 'Downtown',
  '354 N Santa Cruz Ave, Los Gatos, CA 95030',
  0,
  'https://doubleds.com',
  '["https://gamewatch.info/teams/san-jose-earthquakes", "https://www.goodrec.com/blog/where-to-watch-soccer-san-jose-10-best-soccer-bars", "https://www.mercurynews.com/", "https://www.yelp.com/biz/double-ds-sports-grille-los-gatos-2"]',
  4
);

-- ============================================================
-- TEAM AFFILIATIONS
-- ============================================================

-- O'Flaherty's - Liverpool FC (LFC Silicon Valley), San Jose Earthquakes
INSERT OR IGNORE INTO bar_teams (bar_id, team_slug, team_name)
SELECT id, 'liverpool', 'Liverpool FC' FROM bars WHERE slug = 'oflahertys-irish-pub-sj';
INSERT OR IGNORE INTO bar_teams (bar_id, team_slug, team_name)
SELECT id, 'san-jose-earthquakes', 'San Jose Earthquakes' FROM bars WHERE slug = 'oflahertys-irish-pub-sj';

-- Jack's - Arsenal FC (Silicon Valley Gooners), San Jose Earthquakes, Bay FC
INSERT OR IGNORE INTO bar_teams (bar_id, team_slug, team_name)
SELECT id, 'arsenal', 'Arsenal FC' FROM bars WHERE slug = 'jacks-bar-sj';
INSERT OR IGNORE INTO bar_teams (bar_id, team_slug, team_name)
SELECT id, 'san-jose-earthquakes', 'San Jose Earthquakes' FROM bars WHERE slug = 'jacks-bar-sj';
INSERT OR IGNORE INTO bar_teams (bar_id, team_slug, team_name)
SELECT id, 'bay-fc', 'Bay FC' FROM bars WHERE slug = 'jacks-bar-sj';

-- Old Wagon Saloon - San Jose Earthquakes
INSERT OR IGNORE INTO bar_teams (bar_id, team_slug, team_name)
SELECT id, 'san-jose-earthquakes', 'San Jose Earthquakes' FROM bars WHERE slug = 'old-wagon-saloon-sj';

-- The Brit - no specific team affiliation (general sports bar)

-- Britannia Arms Almaden - no specific team affiliation (general British pub)

-- Rookies Willow Glen - San Jose Earthquakes
INSERT OR IGNORE INTO bar_teams (bar_id, team_slug, team_name)
SELECT id, 'san-jose-earthquakes', 'San Jose Earthquakes' FROM bars WHERE slug = 'rookies-sports-lodge-willow-glen';

-- Rookies Downtown - no specific team affiliation

-- Duke of Edinburgh - no specific team affiliation (general British pub)

-- St. Stephen's Green - no specific team affiliation (general Irish pub)

-- Double D's - San Jose Earthquakes
INSERT OR IGNORE INTO bar_teams (bar_id, team_slug, team_name)
SELECT id, 'san-jose-earthquakes', 'San Jose Earthquakes' FROM bars WHERE slug = 'double-ds-los-gatos';

-- ============================================================
-- LEAGUE AFFILIATIONS
-- ============================================================

-- O'Flaherty's - Premier League, MLS, Champions League, World Cup
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'premier-league', 'Premier League' FROM bars WHERE slug = 'oflahertys-irish-pub-sj';
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'mls', 'MLS' FROM bars WHERE slug = 'oflahertys-irish-pub-sj';
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'champions-league', 'UEFA Champions League' FROM bars WHERE slug = 'oflahertys-irish-pub-sj';
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'world-cup', 'FIFA World Cup' FROM bars WHERE slug = 'oflahertys-irish-pub-sj';

-- Jack's - Premier League, MLS, Champions League, NWSL, World Cup
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'premier-league', 'Premier League' FROM bars WHERE slug = 'jacks-bar-sj';
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'mls', 'MLS' FROM bars WHERE slug = 'jacks-bar-sj';
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'champions-league', 'UEFA Champions League' FROM bars WHERE slug = 'jacks-bar-sj';
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'nwsl', 'NWSL' FROM bars WHERE slug = 'jacks-bar-sj';
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'world-cup', 'FIFA World Cup' FROM bars WHERE slug = 'jacks-bar-sj';

-- Old Wagon Saloon - MLS, World Cup
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'mls', 'MLS' FROM bars WHERE slug = 'old-wagon-saloon-sj';
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'world-cup', 'FIFA World Cup' FROM bars WHERE slug = 'old-wagon-saloon-sj';

-- The Brit - Premier League, MLS, World Cup
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'premier-league', 'Premier League' FROM bars WHERE slug = 'the-brit-sj';
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'mls', 'MLS' FROM bars WHERE slug = 'the-brit-sj';
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'world-cup', 'FIFA World Cup' FROM bars WHERE slug = 'the-brit-sj';

-- Britannia Arms Almaden - Premier League, MLS, Champions League, World Cup
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'premier-league', 'Premier League' FROM bars WHERE slug = 'britannia-arms-almaden';
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'mls', 'MLS' FROM bars WHERE slug = 'britannia-arms-almaden';
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'champions-league', 'UEFA Champions League' FROM bars WHERE slug = 'britannia-arms-almaden';
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'world-cup', 'FIFA World Cup' FROM bars WHERE slug = 'britannia-arms-almaden';

-- Rookies Willow Glen - Premier League, MLS
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'premier-league', 'Premier League' FROM bars WHERE slug = 'rookies-sports-lodge-willow-glen';
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'mls', 'MLS' FROM bars WHERE slug = 'rookies-sports-lodge-willow-glen';

-- Rookies Downtown - Premier League, MLS
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'premier-league', 'Premier League' FROM bars WHERE slug = 'rookies-sports-lodge-downtown';
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'mls', 'MLS' FROM bars WHERE slug = 'rookies-sports-lodge-downtown';

-- Duke of Edinburgh - Premier League
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'premier-league', 'Premier League' FROM bars WHERE slug = 'duke-of-edinburgh-cupertino';

-- St. Stephen's Green - Premier League, Champions League
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'premier-league', 'Premier League' FROM bars WHERE slug = 'st-stephens-green-mv';
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'champions-league', 'UEFA Champions League' FROM bars WHERE slug = 'st-stephens-green-mv';

-- Double D's - MLS, Premier League
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'mls', 'MLS' FROM bars WHERE slug = 'double-ds-los-gatos';
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'premier-league', 'Premier League' FROM bars WHERE slug = 'double-ds-los-gatos';
