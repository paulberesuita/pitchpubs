-- Cincinnati Soccer Bars
-- Added: 2026-02-20
-- 12 bars in the Cincinnati metro area (Cincinnati OH + Covington KY)
-- Cincinnati is a strong soccer market with FC Cincinnati (MLS) at TQL Stadium
-- FC Cincinnati has 60+ pub partners and multiple supporter groups under The Incline Collective

-- Add Cincinnati to cities table
INSERT OR IGNORE INTO cities (name, slug, state, is_world_cup_host) VALUES ('Cincinnati', 'cincinnati', 'OH', 0);
-- Add Covington KY (across the river, essential Cincinnati soccer bar territory)
INSERT OR IGNORE INTO cities (name, slug, state, is_world_cup_host) VALUES ('Covington', 'covington-ky', 'KY', 0);

-- Add FC Cincinnati to teams table
INSERT OR IGNORE INTO teams (slug, name, league) VALUES ('fc-cincinnati', 'FC Cincinnati', 'MLS');

-- ============================================================
-- BARS
-- ============================================================

-- 1. Rhinehaus - THE soccer bar of Cincinnati, OTR
-- Home to LFC Cincinnati, Ohio Blues, Cincy Gooners, Cincy Villains, Cincy Hammers
-- FC Cincinnati Pub Partner, 14 55-inch 4K TVs + projector
INSERT INTO bars (slug, name, description, city, city_slug, state, neighborhood, address, opens_early, website, sources, source_count)
VALUES (
  'rhinehaus-cincinnati',
  'Rhinehaus',
  'THE soccer bar of Cincinnati. This Over-the-Rhine institution opened in 2013 and quickly became the hub where soccer fans unite. Equipped with 14 55-inch 4K TVs and a projector, each tuned to a different match. Official FC Cincinnati Pub Partner and home bar for LFC Cincinnati, Ohio Blues, Cincy Gooners, Cincy Villains, and Cincy Hammers supporter groups. Opens early on weekends for Premier League with audio dedicated to whichever match has the most supporters present.',
  'Cincinnati', 'cincinnati', 'OH', 'Over-the-Rhine',
  '119 E 12th St, Cincinnati, OH 45202',
  1,
  'http://www.rhinehausbar.com',
  '["https://cincinnatirefined.com/eat-drink/9-great-cincinnati-bars-to-watch-premier-league-soccer", "https://www.goodrec.com/blog/where-to-watch-soccer-cincinnati-10-best-soccer-bars", "https://www.visitcincy.com/blog/post/best-sports-bars-in-the-cincy-region/", "https://www.visitcincy.com/listing/rhinehaus/6610/"]',
  4
);

-- 2. The Pitch Cincy - Purpose-built soccer bar across from TQL Stadium
-- 50 TVs, 2-story Samsung 4K video wall, Cincy Gooners home, 600 capacity
INSERT INTO bars (slug, name, description, city, city_slug, state, neighborhood, address, opens_early, website, sources, source_count)
VALUES (
  'the-pitch-cincinnati',
  'The Pitch Cincy',
  'A purpose-built soccer bar directly across from TQL Stadium, opened in 2021 in a former church building. Features 50 TVs and a two-story Samsung 4K video wall -- the best TV setup in Cincinnati. Home of the Cincy Gooners (Arsenal supporters). Carries Champions League, MLS Direct Kick, English Premier League, and multiple international soccer leagues. Stadium-view rooftop patio, rotating food trucks, and 600-person capacity across two floors.',
  'Cincinnati', 'cincinnati', 'OH', 'West End',
  '1430 Central Pkwy, Cincinnati, OH 45202',
  1,
  'https://www.thepitchcincy.com',
  '["https://www.citybeat.com/food-drink/soccerthemed-sports-bar-the-pitch-cincy-to-open-across-from-fc-cincinnati-stadium-12265097/", "https://www.goodrec.com/blog/where-to-watch-soccer-cincinnati-10-best-soccer-bars", "https://www.visitcincy.com/blog/post/best-sports-bars-in-the-cincy-region/", "https://www.cincygooners.com/matchday"]',
  4
);

-- 3. Molly Malone''s - The original Cincy soccer bar since 2007
-- Irish-owned, EPL at 7am, fantasy EPL league, organized trips to Old Trafford/Anfield
INSERT INTO bars (slug, name, description, city, city_slug, state, neighborhood, address, opens_early, website, sources, source_count)
VALUES (
  'molly-malones-covington',
  'Molly Malone''s Irish Pub',
  'The original Cincinnati soccer bar since 2007. This authentic Irish-owned pub at the foot of the Roebling Bridge has been packing all three floors for soccer long before FC Cincinnati existed. Shows EPL and Bundesliga live at 7am, runs a fantasy Premier League with prizes, and has organized supporter trips to Old Trafford and Anfield. FC Cincinnati watch party location with shuttles to home matches. BuzzFeed named it among the best Irish bars in every state.',
  'Covington', 'covington-ky', 'KY', 'Roebling Point',
  '112 E 4th St, Covington, KY 41011',
  1,
  'https://mollymalonesirishpub.com/covington/',
  '["https://cincinnatirefined.com/eat-drink/9-great-cincinnati-bars-to-watch-premier-league-soccer", "https://mollymalonesirishpub.com/covington/sports/", "https://www.visitcincy.com/blog/post/best-sports-bars-in-the-cincy-region/", "https://nkytribune.com/2015/05/soccer-fans-find-a-home-at-molly-malones-where-everybody-knows-your-club-shares-love-of-the-sport/"]',
  4
);

-- 4. Hap''s Irish Pub - True soccer pub in Hyde Park, 40+ years
-- Opens 7:45am for Liverpool/Arsenal/Man Utd, EPL/UEFA/Bundesliga, cash only
INSERT INTO bars (slug, name, description, city, city_slug, state, neighborhood, address, opens_early, website, sources, source_count)
VALUES (
  'haps-irish-pub-cincinnati',
  'Hap''s Irish Pub',
  'A true soccer pub that has been a Hyde Park institution for over 40 years. Opens at 7:45am when Liverpool, Arsenal, Manchester United, or any big name is playing, and regularly by 9am on Sundays. Shows EPL, UEFA Champions League, Concacaf, and Bundesliga alongside rugby, hurling, and cricket. Known for proper pints of Guinness, a serious Irish whiskey selection, and steel-tip darts. Cash only.',
  'Cincinnati', 'cincinnati', 'OH', 'Hyde Park',
  '3510 Erie Ave, Cincinnati, OH 45208',
  1,
  'https://hapspub.com',
  '["https://cincinnatirefined.com/eat-drink/9-great-cincinnati-bars-to-watch-premier-league-soccer", "https://www.goodrec.com/blog/where-to-watch-soccer-cincinnati-10-best-soccer-bars", "https://www.thedrunkenmallard.com/post/hap-s-irish-pub-cincinnati-oh", "https://www.yelp.com/biz/haps-irish-pub-inc-cincinnati"]',
  4
);

-- 5. Northern Row Brewery & Distillery - The Pride (FC Cincinnati supporters) home base
-- March to TQL departs from here, brewed "Supporter" kolsch with The Pride
INSERT INTO bars (slug, name, description, city, city_slug, state, neighborhood, address, opens_early, website, sources, source_count)
VALUES (
  'northern-row-brewery-cincinnati',
  'Northern Row Brewery & Distillery',
  'Home of The Pride, FC Cincinnati''s oldest supporters group, since the 2021 season. The March to TQL Stadium -- the iconic pregame walk uniting all FC Cincinnati supporter groups -- departs from Northern Row 90 minutes before every home match. Northern Row brewed "Supporter," a blood orange kolsch, in collaboration with The Pride. Shows FC Cincinnati matches on multiple projectors when fans stay to watch rather than march.',
  'Cincinnati', 'cincinnati', 'OH', 'Over-the-Rhine',
  '111 W McMicken Ave, Cincinnati, OH 45202',
  0,
  'https://www.northernrow.com',
  '["https://www.thepridecincy.com/announcements/2021/1/19/our-march-starts-at-northern-row-west-end-stadium-pub-partner", "https://www.thepridecincy.com/matchday-info", "https://cincinnatisoccertalk.com/2021/05/12/match-day-guide-tql-stadium/", "https://www.northernrow.com/events/fcc-pre-game-party-august-27-2022"]',
  4
);

-- 6. Higher Gravity (Northside) - All EPL games, 400+ beers, FC Cincinnati
INSERT INTO bars (slug, name, description, city, city_slug, state, neighborhood, address, opens_early, website, sources, source_count)
VALUES (
  'higher-gravity-cincinnati',
  'Higher Gravity',
  'A craft beer haven in Northside that doubles as ground zero for soccer fans. All English Premier League games are shown on their TVs, alongside FC Cincinnati and other major matches. With over 400 beers and 150 wines plus a full cocktail bar, you can watch the beautiful game with one of the best drink selections in the city. Also has a second location at Summit Park in Blue Ash.',
  'Cincinnati', 'cincinnati', 'OH', 'Northside',
  '4106 Hamilton Ave, Cincinnati, OH 45223',
  0,
  'https://highergravitycrafthaus.com',
  '["https://www.visitcincy.com/blog/post/best-sports-bars-in-the-cincy-region/", "https://www.goodrec.com/blog/where-to-watch-soccer-cincinnati-10-best-soccer-bars", "https://www.citybeat.com/cincinnati/the-best-sports-bars-to-watch-the-game-in-greater-cincinnati-according-to-our-readers/", "https://www.visitcincy.com/listing/higher-gravity-northside/6608/"]',
  4
);

-- 7. Cock & Bull (Mainstrasse) - English pub since 1999, Covington
-- Voted best fish & chips, 35+ rotating taps, Premier League viewing
INSERT INTO bars (slug, name, description, city, city_slug, state, neighborhood, address, opens_early, website, sources, source_count)
VALUES (
  'cock-and-bull-covington',
  'Cock & Bull Public House',
  'An English pub in Historic Mainstrasse Village since 1999, voted best fish and chips in Cincinnati. More than 35 rotating taps of craft beer make this a destination for beer lovers, while Premier League matches on the screens draw the football faithful. The Covington flagship is the last standing of three original locations, keeping the British pub tradition alive across the river.',
  'Covington', 'covington-ky', 'KY', 'Mainstrasse Village',
  '601 Main St, Covington, KY 41011',
  0,
  'https://cockandbullcincinnati.com',
  '["https://cincinnatirefined.com/eat-drink/9-great-cincinnati-bars-to-watch-premier-league-soccer", "https://www.yelp.com/biz/cock-and-bull-covington-6", "https://www.visitcincy.com/listing/cock-&-bull-public-house-covington/5528/"]',
  3
);

-- 8. Nicholson''s Pub - Scottish tavern downtown, Premier League
-- Same management group as The Pub at Rookwood, 100+ single malt scotch
INSERT INTO bars (slug, name, description, city, city_slug, state, neighborhood, address, opens_early, website, sources, source_count)
VALUES (
  'nicholsons-pub-cincinnati',
  'Nicholson''s Pub',
  'Cincinnati''s first and finest gastropub, built in the style of a genuine Scottish tavern with inspiration from public houses throughout Great Britain. Located downtown across from the Aronoff Center with the largest selection of single malt scotch in the region -- over 100 varieties. Shows Premier League matches and serves classic British pub fare including scotch eggs and fish and chips.',
  'Cincinnati', 'cincinnati', 'OH', 'Downtown',
  '625 Walnut St, Cincinnati, OH 45202',
  0,
  'https://nicholsonspub.com',
  '["https://cincinnatirefined.com/eat-drink/9-great-cincinnati-bars-to-watch-premier-league-soccer", "https://www.newsrecord.org/sports/the-pub-serves-soccer-rugby-fans/article_01b3a62c-5fcd-11e5-b18a-3f3568356270.html", "https://www.yelp.com/biz/nicholsons-cincinnati"]',
  3
);

-- 9. The Pub at Rookwood - British pub in Hyde Park, Premier League mural
-- FC Cincinnati supporter spot, managed by same group as Nicholson''s
INSERT INTO bars (slug, name, description, city, city_slug, state, neighborhood, address, opens_early, website, sources, source_count)
VALUES (
  'the-pub-rookwood-cincinnati',
  'The Pub at Rookwood',
  'A British pub at Rookwood Commons in Hyde Park featuring a central bar with a Premier League mural and an atmosphere blending British hospitality with American flair. Opens early on weekends for Premier League upon request and has become a popular FC Cincinnati supporter spot. Serves classic English dishes like fish and chips alongside a full pub menu. Same management group as Nicholson''s downtown.',
  'Cincinnati', 'cincinnati', 'OH', 'Hyde Park',
  '2692 Edmondson Rd, Cincinnati, OH 45208',
  0,
  'https://experiencethepub.com/locations/rookwood/',
  '["https://cincinnatirefined.com/eat-drink/9-great-cincinnati-bars-to-watch-premier-league-soccer", "https://www.newsrecord.org/sports/the-pub-serves-soccer-rugby-fans/article_01b3a62c-5fcd-11e5-b18a-3f3568356270.html", "https://www.yelp.com/biz/the-pub-rookwood-cincinnati"]',
  3
);

-- 10. Second Place - Northside sports bar, opens early for soccer
INSERT INTO bars (slug, name, description, city, city_slug, state, neighborhood, address, opens_early, website, sources, source_count)
VALUES (
  'second-place-cincinnati',
  'Second Place',
  'A neighborhood sports bar in Northside from the team behind The Littlefield that opens early for all the big soccer matches. Four TVs screening local and international soccer in an unassuming, welcoming space with a pool table, dart boards, and board games. Known for bourbon slushies, a deep draft list, and free popcorn. No manufactured sports bar atmosphere -- just genuine love for the game.',
  'Cincinnati', 'cincinnati', 'OH', 'Northside',
  '3936 Spring Grove Ave, Cincinnati, OH 45223',
  1,
  'https://secondplacebar.com',
  '["https://www.goodrec.com/blog/where-to-watch-soccer-cincinnati-10-best-soccer-bars", "https://www.citybeat.com/food-drink/northsides-second-place-is-no-runnerup-12218718/", "https://cincinnatirefined.com/eat-drink/photos-inside-northside-cincinnati-second-place-sports-bar"]',
  3
);

-- 11. O''Malley''s in the Alley - Second oldest bar in Cincinnati, Premier League
INSERT INTO bars (slug, name, description, city, city_slug, state, neighborhood, address, opens_early, website, sources, source_count)
VALUES (
  'omalleys-in-the-alley-cincinnati',
  'O''Malley''s in the Alley',
  'The second oldest bar in Cincinnati and a downtown institution where European football has found a natural home. This no-nonsense Irish pub shows Premier League alongside Reds and Bengals games, with knowledgeable bartenders and a loyal neighborhood crowd that makes you feel like part of the family. Classic bar fare, proper pints, and a vibe that money cannot buy.',
  'Cincinnati', 'cincinnati', 'OH', 'Downtown',
  '25 W Ogden Pl, Cincinnati, OH 45202',
  0,
  'https://omalleyscincy.com',
  '["https://cincinnatirefined.com/eat-drink/9-great-cincinnati-bars-to-watch-premier-league-soccer", "https://ohiosharp.com/top-5-sports-bars-in-cincinnati/", "https://www.yelp.com/biz/o-malleys-in-the-alley-cincinnati-2"]',
  3
);

-- 12. Samuel Adams Taproom - Die Innenstadt (FC Cincinnati supporters) pregame hub
INSERT INTO bars (slug, name, description, city, city_slug, state, neighborhood, address, opens_early, website, sources, source_count)
VALUES (
  'samuel-adams-taproom-cincinnati',
  'Samuel Adams Cincinnati Taproom',
  'The official pregame gathering spot for Die Innenstadt, FC Cincinnati''s largest independent supporters club. Located on Logan Street in OTR just minutes from TQL Stadium, the taproom fills with orange and blue on match days. Features an on-site microbrewery with exclusive small-batch beers, Boston Beer staples on tap, and a rotating lineup of taproom-only brews. The perfect launchpad for The March to the stadium.',
  'Cincinnati', 'cincinnati', 'OH', 'Over-the-Rhine',
  '1727 Logan St, Cincinnati, OH 45202',
  0,
  'https://www.samadamscincy.com',
  '["https://blog.ticketmaster.com/fc-cincinnati-supporters/", "https://inclinecincy.com/groups", "https://www.visitcincy.com/listing/samuel-adams-taproom-cincinnati/5306/"]',
  3
);

-- ============================================================
-- TEAM AFFILIATIONS
-- ============================================================

-- Rhinehaus -- FC Cincinnati pub partner, home to multiple EPL supporter groups
INSERT INTO bar_teams (bar_id, team_slug, team_name) VALUES ((SELECT id FROM bars WHERE slug = 'rhinehaus-cincinnati'), 'fc-cincinnati', 'FC Cincinnati');
INSERT INTO bar_teams (bar_id, team_slug, team_name) VALUES ((SELECT id FROM bars WHERE slug = 'rhinehaus-cincinnati'), 'liverpool', 'Liverpool FC');
INSERT INTO bar_teams (bar_id, team_slug, team_name) VALUES ((SELECT id FROM bars WHERE slug = 'rhinehaus-cincinnati'), 'arsenal', 'Arsenal');
INSERT INTO bar_teams (bar_id, team_slug, team_name) VALUES ((SELECT id FROM bars WHERE slug = 'rhinehaus-cincinnati'), 'aston-villa', 'Aston Villa');
INSERT INTO bar_teams (bar_id, team_slug, team_name) VALUES ((SELECT id FROM bars WHERE slug = 'rhinehaus-cincinnati'), 'west-ham', 'West Ham United');

-- The Pitch -- Cincy Gooners home, FC Cincinnati adjacent
INSERT INTO bar_teams (bar_id, team_slug, team_name) VALUES ((SELECT id FROM bars WHERE slug = 'the-pitch-cincinnati'), 'arsenal', 'Arsenal');
INSERT INTO bar_teams (bar_id, team_slug, team_name) VALUES ((SELECT id FROM bars WHERE slug = 'the-pitch-cincinnati'), 'fc-cincinnati', 'FC Cincinnati');

-- Molly Malone''s -- FC Cincinnati watch party location
INSERT INTO bar_teams (bar_id, team_slug, team_name) VALUES ((SELECT id FROM bars WHERE slug = 'molly-malones-covington'), 'fc-cincinnati', 'FC Cincinnati');

-- Northern Row -- The Pride home base (FC Cincinnati)
INSERT INTO bar_teams (bar_id, team_slug, team_name) VALUES ((SELECT id FROM bars WHERE slug = 'northern-row-brewery-cincinnati'), 'fc-cincinnati', 'FC Cincinnati');

-- Higher Gravity -- FC Cincinnati pub partner
INSERT INTO bar_teams (bar_id, team_slug, team_name) VALUES ((SELECT id FROM bars WHERE slug = 'higher-gravity-cincinnati'), 'fc-cincinnati', 'FC Cincinnati');

-- The Pub at Rookwood -- FC Cincinnati supporter spot
INSERT INTO bar_teams (bar_id, team_slug, team_name) VALUES ((SELECT id FROM bars WHERE slug = 'the-pub-rookwood-cincinnati'), 'fc-cincinnati', 'FC Cincinnati');

-- Samuel Adams Taproom -- Die Innenstadt home (FC Cincinnati)
INSERT INTO bar_teams (bar_id, team_slug, team_name) VALUES ((SELECT id FROM bars WHERE slug = 'samuel-adams-taproom-cincinnati'), 'fc-cincinnati', 'FC Cincinnati');

-- ============================================================
-- LEAGUE AFFILIATIONS
-- ============================================================

-- All Cincinnati bars show Premier League
INSERT INTO bar_leagues (bar_id, league_slug, league_name) VALUES ((SELECT id FROM bars WHERE slug = 'rhinehaus-cincinnati'), 'premier-league', 'Premier League');
INSERT INTO bar_leagues (bar_id, league_slug, league_name) VALUES ((SELECT id FROM bars WHERE slug = 'the-pitch-cincinnati'), 'premier-league', 'Premier League');
INSERT INTO bar_leagues (bar_id, league_slug, league_name) VALUES ((SELECT id FROM bars WHERE slug = 'molly-malones-covington'), 'premier-league', 'Premier League');
INSERT INTO bar_leagues (bar_id, league_slug, league_name) VALUES ((SELECT id FROM bars WHERE slug = 'haps-irish-pub-cincinnati'), 'premier-league', 'Premier League');
INSERT INTO bar_leagues (bar_id, league_slug, league_name) VALUES ((SELECT id FROM bars WHERE slug = 'northern-row-brewery-cincinnati'), 'premier-league', 'Premier League');
INSERT INTO bar_leagues (bar_id, league_slug, league_name) VALUES ((SELECT id FROM bars WHERE slug = 'higher-gravity-cincinnati'), 'premier-league', 'Premier League');
INSERT INTO bar_leagues (bar_id, league_slug, league_name) VALUES ((SELECT id FROM bars WHERE slug = 'cock-and-bull-covington'), 'premier-league', 'Premier League');
INSERT INTO bar_leagues (bar_id, league_slug, league_name) VALUES ((SELECT id FROM bars WHERE slug = 'nicholsons-pub-cincinnati'), 'premier-league', 'Premier League');
INSERT INTO bar_leagues (bar_id, league_slug, league_name) VALUES ((SELECT id FROM bars WHERE slug = 'the-pub-rookwood-cincinnati'), 'premier-league', 'Premier League');
INSERT INTO bar_leagues (bar_id, league_slug, league_name) VALUES ((SELECT id FROM bars WHERE slug = 'second-place-cincinnati'), 'premier-league', 'Premier League');
INSERT INTO bar_leagues (bar_id, league_slug, league_name) VALUES ((SELECT id FROM bars WHERE slug = 'omalleys-in-the-alley-cincinnati'), 'premier-league', 'Premier League');
INSERT INTO bar_leagues (bar_id, league_slug, league_name) VALUES ((SELECT id FROM bars WHERE slug = 'samuel-adams-taproom-cincinnati'), 'premier-league', 'Premier League');

-- MLS (FC Cincinnati bars and soccer-focused bars)
INSERT INTO bar_leagues (bar_id, league_slug, league_name) VALUES ((SELECT id FROM bars WHERE slug = 'rhinehaus-cincinnati'), 'mls', 'MLS');
INSERT INTO bar_leagues (bar_id, league_slug, league_name) VALUES ((SELECT id FROM bars WHERE slug = 'the-pitch-cincinnati'), 'mls', 'MLS');
INSERT INTO bar_leagues (bar_id, league_slug, league_name) VALUES ((SELECT id FROM bars WHERE slug = 'molly-malones-covington'), 'mls', 'MLS');
INSERT INTO bar_leagues (bar_id, league_slug, league_name) VALUES ((SELECT id FROM bars WHERE slug = 'northern-row-brewery-cincinnati'), 'mls', 'MLS');
INSERT INTO bar_leagues (bar_id, league_slug, league_name) VALUES ((SELECT id FROM bars WHERE slug = 'higher-gravity-cincinnati'), 'mls', 'MLS');
INSERT INTO bar_leagues (bar_id, league_slug, league_name) VALUES ((SELECT id FROM bars WHERE slug = 'the-pub-rookwood-cincinnati'), 'mls', 'MLS');
INSERT INTO bar_leagues (bar_id, league_slug, league_name) VALUES ((SELECT id FROM bars WHERE slug = 'samuel-adams-taproom-cincinnati'), 'mls', 'MLS');

-- Champions League (dedicated soccer bars)
INSERT INTO bar_leagues (bar_id, league_slug, league_name) VALUES ((SELECT id FROM bars WHERE slug = 'rhinehaus-cincinnati'), 'champions-league', 'UEFA Champions League');
INSERT INTO bar_leagues (bar_id, league_slug, league_name) VALUES ((SELECT id FROM bars WHERE slug = 'the-pitch-cincinnati'), 'champions-league', 'UEFA Champions League');
INSERT INTO bar_leagues (bar_id, league_slug, league_name) VALUES ((SELECT id FROM bars WHERE slug = 'molly-malones-covington'), 'champions-league', 'UEFA Champions League');
INSERT INTO bar_leagues (bar_id, league_slug, league_name) VALUES ((SELECT id FROM bars WHERE slug = 'haps-irish-pub-cincinnati'), 'champions-league', 'UEFA Champions League');

-- Bundesliga (bars that explicitly show Bundesliga)
INSERT INTO bar_leagues (bar_id, league_slug, league_name) VALUES ((SELECT id FROM bars WHERE slug = 'molly-malones-covington'), 'bundesliga', 'Bundesliga');
INSERT INTO bar_leagues (bar_id, league_slug, league_name) VALUES ((SELECT id FROM bars WHERE slug = 'haps-irish-pub-cincinnati'), 'bundesliga', 'Bundesliga');

-- World Cup (all soccer-dedicated bars)
INSERT INTO bar_leagues (bar_id, league_slug, league_name) VALUES ((SELECT id FROM bars WHERE slug = 'rhinehaus-cincinnati'), 'world-cup', 'FIFA World Cup');
INSERT INTO bar_leagues (bar_id, league_slug, league_name) VALUES ((SELECT id FROM bars WHERE slug = 'the-pitch-cincinnati'), 'world-cup', 'FIFA World Cup');
INSERT INTO bar_leagues (bar_id, league_slug, league_name) VALUES ((SELECT id FROM bars WHERE slug = 'molly-malones-covington'), 'world-cup', 'FIFA World Cup');
INSERT INTO bar_leagues (bar_id, league_slug, league_name) VALUES ((SELECT id FROM bars WHERE slug = 'haps-irish-pub-cincinnati'), 'world-cup', 'FIFA World Cup');
INSERT INTO bar_leagues (bar_id, league_slug, league_name) VALUES ((SELECT id FROM bars WHERE slug = 'northern-row-brewery-cincinnati'), 'world-cup', 'FIFA World Cup');
INSERT INTO bar_leagues (bar_id, league_slug, league_name) VALUES ((SELECT id FROM bars WHERE slug = 'higher-gravity-cincinnati'), 'world-cup', 'FIFA World Cup');

-- GAA (Irish pubs)
INSERT INTO bar_leagues (bar_id, league_slug, league_name) VALUES ((SELECT id FROM bars WHERE slug = 'molly-malones-covington'), 'gaa', 'GAA');
INSERT INTO bar_leagues (bar_id, league_slug, league_name) VALUES ((SELECT id FROM bars WHERE slug = 'haps-irish-pub-cincinnati'), 'gaa', 'GAA');
