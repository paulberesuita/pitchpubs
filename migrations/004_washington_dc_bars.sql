-- Washington DC Soccer Bars
-- Added: 2026-02-20
-- 19 bars in the Washington DC metro area (DC proper + Arlington VA)

-- Add Washington DC to cities table
INSERT OR IGNORE INTO cities (name, slug, state, is_world_cup_host) VALUES ('Washington', 'washington-dc', 'DC', 0);
-- Add Arlington to cities table (well-known soccer bar hub across the river)
INSERT OR IGNORE INTO cities (name, slug, state, is_world_cup_host) VALUES ('Arlington', 'arlington-va', 'VA', 0);

-- ============================================================
-- BARS
-- ============================================================

-- 1. Lucky Bar - THE legendary DC soccer bar, Dupont Circle
INSERT INTO bars (slug, name, description, city, city_slug, state, neighborhood, address, opens_early, website, sources, source_count)
VALUES (
  'lucky-bar-dc',
  'Lucky Bar',
  'The legendary DC soccer bar where Arsenal, Manchester United, and Manchester City supporters have gathered every weekend morning for years. Three big screens and 22 TVs total make it the gold standard for Premier League viewing in the capital.',
  'Washington', 'washington-dc', 'DC', 'Dupont Circle',
  '1221 Connecticut Ave NW, Washington, DC 20036',
  1,
  'https://www.luckybardc.com',
  '["https://www.washingtonpost.com/dc-md-va/2025/08/15/best-dc-soccer-bars-watching-premier-league/", "https://www.timeout.com/washington-dc/bars/lucky-bar", "https://www.washingtonpost.com/road-to-recovery/2020/09/22/lucky-bar-soccer-fans-coronavirus/", "https://www.goodrec.com/blog/where-to-watch-soccer-washington-dc-10-best-soccer-bars"]',
  4
);

-- 2. The Queen Vic - Official Liverpool FC bar on H Street
INSERT INTO bars (slug, name, description, city, city_slug, state, neighborhood, address, opens_early, website, sources, source_count)
VALUES (
  'queen-vic-dc',
  'The Queen Vic',
  'DC''s only official Liverpool FC bar, this British gastropub on H Street opens for all LFC matches regardless of kickoff time. Dark-wooded and brick-walled with pub classics, full English breakfast, and a no-reservations policy.',
  'Washington', 'washington-dc', 'DC', 'H Street NE',
  '1206 H St NE, Washington, DC 20002',
  1,
  'https://www.thequeenvicdc.com',
  '["https://www.washingtonpost.com/dc-md-va/2025/08/15/best-dc-soccer-bars-watching-premier-league/", "https://www.goodrec.com/blog/where-to-watch-soccer-washington-dc-10-best-soccer-bars", "https://www.lfcdc.net/pubs", "https://www.yelp.com/biz/the-queen-vic-washington"]',
  4
);

-- 3. Exiles Bar - Liverpool FC watch bar on U Street
INSERT INTO bars (slug, name, description, city, city_slug, state, neighborhood, address, opens_early, website, sources, source_count)
VALUES (
  'exiles-bar-dc',
  'Exiles Bar',
  'One of DC''s most established soccer bars on the U Street corridor and a proud Liverpool FC watch location. Every game shown with sound on all TVs and projectors across their outdoor patio, downstairs bar, upstairs bar, and private back room.',
  'Washington', 'washington-dc', 'DC', 'U Street Corridor',
  '1610 U St NW, Washington, DC 20009',
  1,
  'https://www.exilesbar.com',
  '["https://www.exilesbar.com/liverpool-fc", "https://www.fanzo.com/en-us/bars-pubs/washington-dc/9824", "https://www.washingtonpost.com/dc-md-va/2025/08/15/best-dc-soccer-bars-watching-premier-league/", "https://www.yelp.com/biz/exiles-bar-washington"]',
  4
);

-- 4. Franklin Hall - Official Arsenal bar (DC Armoury home pub)
INSERT INTO bars (slug, name, description, city, city_slug, state, neighborhood, address, opens_early, website, sources, source_count)
VALUES (
  'franklin-hall-dc',
  'Franklin Hall',
  'The official home pub of DC Armoury, Washington''s Arsenal supporters club. This expansive beer hall opens early for every Arsenal match with 20 TVs and a 60-foot bar. Three blocks north of U Street metro on the Green Line.',
  'Washington', 'washington-dc', 'DC', 'U Street Corridor',
  '1348 Florida Ave NW, Washington, DC 20009',
  1,
  'https://www.franklinhalldc.com',
  '["https://www.franklinhalldc.com/blog/official-arsenal-bar-washington-dc-franklin-hall", "https://www.arsenal.com/usa/fanzone-usa/usa-supporters-club/washington-dc", "https://www.dcarmoury.com/faq", "https://www.washingtonpost.com/dc-md-va/2025/08/15/best-dc-soccer-bars-watching-premier-league/"]',
  4
);

-- 5. Irish Channel - Official Tottenham Spurs bar (DC Spurs home)
INSERT INTO bars (slug, name, description, city, city_slug, state, neighborhood, address, opens_early, website, sources, source_count)
VALUES (
  'irish-channel-dc',
  'Irish Channel',
  'Home of DC Spurs, the official Tottenham Hotspur supporters group founded in 2007. This Irish restaurant and pub near Gallery Place metro is a Spurs-only bar on match days, and also a DC United official Heineken bar partner.',
  'Washington', 'washington-dc', 'DC', 'Chinatown',
  '500 H St NW, Washington, DC 20001',
  1,
  'https://www.irishchanneldc.com',
  '["https://dcspurs.org/visit/", "https://www.irishchanneldc.com/official-watch-party", "https://www.dcunited.com/fans/bar-partners", "https://www.tottenhamhotspur.com/fans/supporters-clubs/join-a-club/washington-dc-spurs/"]',
  4
);

-- 6. The Artemis - Premier DC soccer bar in Columbia Heights
INSERT INTO bars (slug, name, description, city, city_slug, state, neighborhood, address, opens_early, website, sources, source_count)
VALUES (
  'the-artemis-dc',
  'The Artemis',
  'A dedicated soccer and sports bar spread across two floors with 20 HD TVs showcasing European soccer including Premier League and Champions League. Full bars on each level and three outdoor spaces in the heart of Columbia Heights.',
  'Washington', 'washington-dc', 'DC', 'Columbia Heights',
  '3605 14th St NW, Washington, DC 20010',
  1,
  'https://theartemisdc.com',
  '["https://theartemisdc.com/", "https://www.goodrec.com/blog/where-to-watch-soccer-washington-dc-10-best-soccer-bars", "https://www.petworthnews.org/blog/artemis-bar", "https://www.washingtonpost.com/dc-md-va/2025/08/15/best-dc-soccer-bars-watching-premier-league/"]',
  4
);

-- 7. Public Bar Live - Multi-floor sports bar, soccer specialty
INSERT INTO bars (slug, name, description, city, city_slug, state, neighborhood, address, opens_early, website, sources, source_count)
VALUES (
  'public-bar-live-dc',
  'Public Bar Live',
  'A three-level nightclub and sports bar in Dupont Circle with over 40 screens, multiple floors, and comfortable seating. International soccer is its specialty, and it doubles as a DC United official Heineken bar partner.',
  'Washington', 'washington-dc', 'DC', 'Dupont Circle',
  '1214 18th St NW, Washington, DC 20036',
  0,
  'https://www.publicbarlive.com',
  '["https://www.publicbarlive.com/", "https://www.dcunited.com/fans/bar-partners", "https://washington.org/visit-dc/best-sports-bars-washington-dc", "https://www.goodrec.com/blog/where-to-watch-soccer-washington-dc-10-best-soccer-bars"]',
  4
);

-- 8. Tom's Watch Bar - Navy Yard mega sports bar
INSERT INTO bars (slug, name, description, city, city_slug, state, neighborhood, address, opens_early, website, sources, source_count)
VALUES (
  'toms-watch-bar-dc',
  'Tom''s Watch Bar',
  'A massive Navy Yard sports bar near Nationals Park with an oversized stadium screen and numerous HD TVs. Part of a national chain, it provides a premier viewing experience for all major soccer leagues and is a DC United bar partner.',
  'Washington', 'washington-dc', 'DC', 'Navy Yard',
  '1250 Half St SE, Washington, DC 20003',
  0,
  'https://tomswatchbar.com/navy-yard/',
  '["https://tomswatchbar.com/navy-yard/", "https://www.goodrec.com/blog/where-to-watch-soccer-washington-dc-10-best-soccer-bars", "https://www.dcunited.com/fans/bar-partners"]',
  3
);

-- 9. Elephant & Castle - British pub on Pennsylvania Ave
INSERT INTO bars (slug, name, description, city, city_slug, state, neighborhood, address, opens_early, website, sources, source_count)
VALUES (
  'elephant-and-castle-dc',
  'Elephant & Castle',
  'A proper British pub two blocks from the National Mall serving fish and chips, bangers and mash, and pies while showing live football. Home of Penya Barcelonista Washington DC, the official FC Barcelona supporters club, and a DC United bar partner.',
  'Washington', 'washington-dc', 'DC', 'Downtown',
  '1201 Pennsylvania Ave NW, Washington, DC 20004',
  0,
  'https://www.elephantcastle.com/en/locations/dc/washington/1201-pennsylvania-avenue-nw',
  '["https://www.elephantcastle.com/en/locations/dc/washington/1201-pennsylvania-avenue-nw", "https://fcbarcelonadc.com/elephant-and-castle-map/", "https://www.dcunited.com/fans/bar-partners", "https://www.washingtonpost.com/dc-md-va/2025/08/15/best-dc-soccer-bars-watching-premier-league/"]',
  4
);

-- 10. Kirwan's on the Wharf - Irish pub at The Wharf
INSERT INTO bars (slug, name, description, city, city_slug, state, neighborhood, address, opens_early, website, sources, source_count)
VALUES (
  'kirwans-on-the-wharf-dc',
  'Kirwan''s on the Wharf',
  'A traditional Irish pub at DC''s waterfront Wharf development with three distinct bars across multiple rooms. Shows overseas soccer, hurling, and Gaelic football, and serves as a DC United official Heineken bar partner.',
  'Washington', 'washington-dc', 'DC', 'The Wharf',
  '749 Wharf St SW, Washington, DC 20024',
  0,
  'https://www.kirwansonthewharf.com',
  '["https://www.kirwansonthewharf.com/", "https://www.dcunited.com/fans/bar-partners", "https://wharflifedc.com/eat-and-drink/restaurants/kirwans/"]',
  3
);

-- 11. Walters Sports Bar - Navy Yard, named after Walter Johnson
INSERT INTO bars (slug, name, description, city, city_slug, state, neighborhood, address, opens_early, website, sources, source_count)
VALUES (
  'walters-sports-bar-dc',
  'Walters Sports Bar',
  'Named after legendary Washington Senators pitcher Walter Johnson, this Navy Yard sports bar sits adjacent to Nationals Park with over 30 TVs and a 24-tap self-pour beer wall. A DC United bar partner with great sight lines for soccer.',
  'Washington', 'washington-dc', 'DC', 'Navy Yard',
  '10 N St SE, Washington, DC 20003',
  0,
  'https://www.waltersdc.com',
  '["https://www.waltersdc.com/", "https://www.dcunited.com/fans/bar-partners", "https://www.goodrec.com/blog/where-to-watch-soccer-washington-dc-10-best-soccer-bars"]',
  3
);

-- 12. Suzie Q's - Fulham FC supporters bar in Navy Yard
INSERT INTO bars (slug, name, description, city, city_slug, state, neighborhood, address, opens_early, website, sources, source_count)
VALUES (
  'suzie-qs-dc',
  'Suzie Q''s',
  'A retro-inspired neighborhood bar in Navy Yard that has become the home of DC''s Fulham FC supporters. Watch every Fulham match here with a laid-back atmosphere, affordable drinks, and great BBQ.',
  'Washington', 'washington-dc', 'DC', 'Navy Yard',
  '71 Potomac Ave SE, Washington, DC 20003',
  1,
  'https://www.suzieqsdc.com',
  '["https://www.suzieqsdc.com/what-we-are-about/blog-post-title-one-472rk", "https://www.suzieqsdc.com/press-on-suzies/blog-post-title-two-nw5ln", "https://www.washingtonpost.com/dc-md-va/2025/08/15/best-dc-soccer-bars-watching-premier-league/"]',
  3
);

-- 13. Lou's City Bar - Official Arsenal bar in Columbia Heights
INSERT INTO bars (slug, name, description, city, city_slug, state, neighborhood, address, opens_early, website, sources, source_count)
VALUES (
  'lous-city-bar-dc',
  'Lou''s City Bar',
  'Named the number one sports bar in DC, Lou''s is an official Arsenal bar with 24 taps, 23 HDTVs, a 140-inch HD projector screen, and an outdoor patio with TVs. Also a DC United partner bar serving brick oven pizzas and wings.',
  'Washington', 'washington-dc', 'DC', 'Columbia Heights',
  '1400 Irving St NW, Washington, DC 20010',
  1,
  'https://www.louscitybar.com',
  '["https://www.louscitybar.com/", "https://www.livesoccertv.com/pubs/district-of-columbia/washington/lou-s-city-bar/", "https://mybartender.com/places/best-soccer-bars-washington-dc/", "https://www.insidehook.com/drinks/dc-sports-bars"]',
  4
);

-- 14. Nanny O'Brien's - Irish pub showing soccer since 1993
INSERT INTO bars (slug, name, description, city, city_slug, state, neighborhood, address, opens_early, website, sources, source_count)
VALUES (
  'nanny-obriens-dc',
  'Nanny O''Brien''s',
  'A beloved Cleveland Park Irish pub showing European football since 1993, one block south of the Cleveland Park metro. Known for its commitment to soccer, great beers, and trivia nights. Also a DC United bar partner.',
  'Washington', 'washington-dc', 'DC', 'Cleveland Park',
  '3319 Connecticut Ave NW, Washington, DC 20008',
  0,
  'https://nannyobriens.com',
  '["https://nannyobriens.com/location/", "https://www.dcunited.com/fans/bar-partners", "https://gamewatch.info/sports-bars/nanny-o-briens-3319-connecticut-avenue-northwest-cleveland-park-washington-dc-united-states"]',
  3
);

-- 15. The Big Board - Sports bar on H Street NE
INSERT INTO bars (slug, name, description, city, city_slug, state, neighborhood, address, opens_early, website, sources, source_count)
VALUES (
  'the-big-board-dc',
  'The Big Board',
  'A lively H Street sports bar with gourmet burgers, locally sourced ingredients, and a full suite of sports subscriptions including for soccer. Multiple screens and a casual, enthusiastic crowd make it a reliable spot for catching matches.',
  'Washington', 'washington-dc', 'DC', 'H Street NE',
  '421 H St NE, Washington, DC 20002',
  0,
  'https://thebigboarddc.com',
  '["https://thebigboarddc.com/", "https://www.goodrec.com/blog/where-to-watch-soccer-washington-dc-10-best-soccer-bars", "https://www.yelp.com/biz/the-big-board-washington"]',
  3
);

-- 16. The Commodore - Dupont Circle gastropub, DC United partner
INSERT INTO bars (slug, name, description, city, city_slug, state, neighborhood, address, opens_early, website, sources, source_count)
VALUES (
  'the-commodore-dc',
  'The Commodore',
  'Dupont Circle''s premier neighborhood gastropub and a DC United bar partner with guaranteed coverage of all United matches. Known for craft burgers, 10 beer taps, and a dedicated sports-watching atmosphere.',
  'Washington', 'washington-dc', 'DC', 'Dupont Circle',
  '1636 17th St NW, Washington, DC 20009',
  0,
  'https://www.commodoredc.com',
  '["https://www.commodoredc.com/", "https://www.dcunited.com/fans/bar-partners", "https://www.yelp.com/biz/the-commodore-washington"]',
  3
);

-- 17. Sports & Social DC - Massive U Street sports venue
INSERT INTO bars (slug, name, description, city, city_slug, state, neighborhood, address, opens_early, website, sources, source_count)
VALUES (
  'sports-and-social-dc',
  'Sports & Social DC',
  'DC''s premier sports watching destination at 14th and U Street with a 25-foot big screen and over a dozen HDTVs. State-of-the-art viewing for all major soccer leagues in a modern, spacious setting.',
  'Washington', 'washington-dc', 'DC', 'U Street Corridor',
  '1314 U St NW, Washington, DC 20009',
  0,
  'https://sportsandsocial.com/dc/',
  '["https://sportsandsocial.com/dc/", "https://www.fanzo.com/en-us/bar/157157/sport-social-u-street-dc", "https://www.yelp.com/biz/sports-and-social-dc-washington"]',
  3
);

-- 18. Ireland's Four Courts - THE soccer embassy of the DMV (Arlington)
INSERT INTO bars (slug, name, description, city, city_slug, state, neighborhood, address, opens_early, website, sources, source_count)
VALUES (
  'irelands-four-courts-arlington',
  'Ireland''s Four Courts',
  'Named one of the 100 best soccer bars in America by Men in Blazers and called the embassy of soccer in the DMV by the Washington Post. Home to Chelsea (Beltway Blues) and Crystal Palace supporters with 29 years of hospitality, famous wings, and legendary Guinness pours.',
  'Arlington', 'arlington-va', 'VA', 'Courthouse',
  '2051 Wilson Blvd, Arlington, VA 22201',
  1,
  'https://www.irelandsfourcourts.com',
  '["https://www.irelandsfourcourts.com/sports/", "https://www.chelseainamerica.com/beltwayblueschelseasupporters", "https://www.premierleague.com/usa-bar-finder/bar/1918/irelands-four-courts", "https://www.washingtonpost.com/dc-md-va/2025/08/15/best-dc-soccer-bars-watching-premier-league/", "https://www.dcunited.com/fans/bar-partners"]',
  5
);

-- 19. Crystal City Sports Pub - Major Arlington soccer pub
INSERT INTO bars (slug, name, description, city, city_slug, state, neighborhood, address, opens_early, website, sources, source_count)
VALUES (
  'crystal-city-sports-pub-arlington',
  'Crystal City Sports Pub',
  'A massive three-level Arlington sports pub open from 8 AM daily with four viewing areas for supporters. A DC United bar partner and Liverpool FC secondary pub, it has been a go-to for soccer fans across the DMV for years.',
  'Arlington', 'arlington-va', 'VA', 'Crystal City',
  '529 23rd St S, Arlington, VA 22202',
  1,
  'https://www.ccsportspub.com',
  '["https://www.ccsportspub.com/", "https://www.lfcdc.net/pubs", "https://www.dcunited.com/fans/bar-partners", "https://www.yelp.com/biz/crystal-city-sports-pub-arlington-2"]',
  4
);

-- ============================================================
-- TEAM AFFILIATIONS
-- ============================================================

-- Lucky Bar teams
INSERT INTO bar_teams (bar_id, team_slug, team_name) VALUES ((SELECT id FROM bars WHERE slug = 'lucky-bar-dc'), 'arsenal', 'Arsenal');
INSERT INTO bar_teams (bar_id, team_slug, team_name) VALUES ((SELECT id FROM bars WHERE slug = 'lucky-bar-dc'), 'manchester-united', 'Manchester United');
INSERT INTO bar_teams (bar_id, team_slug, team_name) VALUES ((SELECT id FROM bars WHERE slug = 'lucky-bar-dc'), 'manchester-city', 'Manchester City');

-- Queen Vic teams
INSERT INTO bar_teams (bar_id, team_slug, team_name) VALUES ((SELECT id FROM bars WHERE slug = 'queen-vic-dc'), 'liverpool', 'Liverpool');

-- Exiles Bar teams
INSERT INTO bar_teams (bar_id, team_slug, team_name) VALUES ((SELECT id FROM bars WHERE slug = 'exiles-bar-dc'), 'liverpool', 'Liverpool');

-- Franklin Hall teams
INSERT INTO bar_teams (bar_id, team_slug, team_name) VALUES ((SELECT id FROM bars WHERE slug = 'franklin-hall-dc'), 'arsenal', 'Arsenal');

-- Irish Channel teams
INSERT INTO bar_teams (bar_id, team_slug, team_name) VALUES ((SELECT id FROM bars WHERE slug = 'irish-channel-dc'), 'tottenham', 'Tottenham Hotspur');
INSERT INTO bar_teams (bar_id, team_slug, team_name) VALUES ((SELECT id FROM bars WHERE slug = 'irish-channel-dc'), 'dc-united', 'D.C. United');

-- Elephant & Castle teams
INSERT INTO bar_teams (bar_id, team_slug, team_name) VALUES ((SELECT id FROM bars WHERE slug = 'elephant-and-castle-dc'), 'barcelona', 'FC Barcelona');

-- Suzie Q's teams
INSERT INTO bar_teams (bar_id, team_slug, team_name) VALUES ((SELECT id FROM bars WHERE slug = 'suzie-qs-dc'), 'fulham', 'Fulham');

-- Lou's City Bar teams
INSERT INTO bar_teams (bar_id, team_slug, team_name) VALUES ((SELECT id FROM bars WHERE slug = 'lous-city-bar-dc'), 'arsenal', 'Arsenal');
INSERT INTO bar_teams (bar_id, team_slug, team_name) VALUES ((SELECT id FROM bars WHERE slug = 'lous-city-bar-dc'), 'dc-united', 'D.C. United');

-- Ireland's Four Courts teams
INSERT INTO bar_teams (bar_id, team_slug, team_name) VALUES ((SELECT id FROM bars WHERE slug = 'irelands-four-courts-arlington'), 'chelsea', 'Chelsea');
INSERT INTO bar_teams (bar_id, team_slug, team_name) VALUES ((SELECT id FROM bars WHERE slug = 'irelands-four-courts-arlington'), 'crystal-palace', 'Crystal Palace');

-- Crystal City Sports Pub teams
INSERT INTO bar_teams (bar_id, team_slug, team_name) VALUES ((SELECT id FROM bars WHERE slug = 'crystal-city-sports-pub-arlington'), 'liverpool', 'Liverpool');
INSERT INTO bar_teams (bar_id, team_slug, team_name) VALUES ((SELECT id FROM bars WHERE slug = 'crystal-city-sports-pub-arlington'), 'dc-united', 'D.C. United');

-- DC United affiliations for official bar partners
INSERT INTO bar_teams (bar_id, team_slug, team_name) VALUES ((SELECT id FROM bars WHERE slug = 'toms-watch-bar-dc'), 'dc-united', 'D.C. United');
INSERT INTO bar_teams (bar_id, team_slug, team_name) VALUES ((SELECT id FROM bars WHERE slug = 'kirwans-on-the-wharf-dc'), 'dc-united', 'D.C. United');
INSERT INTO bar_teams (bar_id, team_slug, team_name) VALUES ((SELECT id FROM bars WHERE slug = 'walters-sports-bar-dc'), 'dc-united', 'D.C. United');
INSERT INTO bar_teams (bar_id, team_slug, team_name) VALUES ((SELECT id FROM bars WHERE slug = 'public-bar-live-dc'), 'dc-united', 'D.C. United');
INSERT INTO bar_teams (bar_id, team_slug, team_name) VALUES ((SELECT id FROM bars WHERE slug = 'nanny-obriens-dc'), 'dc-united', 'D.C. United');
INSERT INTO bar_teams (bar_id, team_slug, team_name) VALUES ((SELECT id FROM bars WHERE slug = 'the-commodore-dc'), 'dc-united', 'D.C. United');
INSERT INTO bar_teams (bar_id, team_slug, team_name) VALUES ((SELECT id FROM bars WHERE slug = 'irelands-four-courts-arlington'), 'dc-united', 'D.C. United');

-- ============================================================
-- LEAGUE AFFILIATIONS
-- ============================================================

-- All DC bars show Premier League
INSERT INTO bar_leagues (bar_id, league_slug, league_name) VALUES ((SELECT id FROM bars WHERE slug = 'lucky-bar-dc'), 'premier-league', 'Premier League');
INSERT INTO bar_leagues (bar_id, league_slug, league_name) VALUES ((SELECT id FROM bars WHERE slug = 'queen-vic-dc'), 'premier-league', 'Premier League');
INSERT INTO bar_leagues (bar_id, league_slug, league_name) VALUES ((SELECT id FROM bars WHERE slug = 'exiles-bar-dc'), 'premier-league', 'Premier League');
INSERT INTO bar_leagues (bar_id, league_slug, league_name) VALUES ((SELECT id FROM bars WHERE slug = 'franklin-hall-dc'), 'premier-league', 'Premier League');
INSERT INTO bar_leagues (bar_id, league_slug, league_name) VALUES ((SELECT id FROM bars WHERE slug = 'irish-channel-dc'), 'premier-league', 'Premier League');
INSERT INTO bar_leagues (bar_id, league_slug, league_name) VALUES ((SELECT id FROM bars WHERE slug = 'the-artemis-dc'), 'premier-league', 'Premier League');
INSERT INTO bar_leagues (bar_id, league_slug, league_name) VALUES ((SELECT id FROM bars WHERE slug = 'public-bar-live-dc'), 'premier-league', 'Premier League');
INSERT INTO bar_leagues (bar_id, league_slug, league_name) VALUES ((SELECT id FROM bars WHERE slug = 'toms-watch-bar-dc'), 'premier-league', 'Premier League');
INSERT INTO bar_leagues (bar_id, league_slug, league_name) VALUES ((SELECT id FROM bars WHERE slug = 'elephant-and-castle-dc'), 'premier-league', 'Premier League');
INSERT INTO bar_leagues (bar_id, league_slug, league_name) VALUES ((SELECT id FROM bars WHERE slug = 'kirwans-on-the-wharf-dc'), 'premier-league', 'Premier League');
INSERT INTO bar_leagues (bar_id, league_slug, league_name) VALUES ((SELECT id FROM bars WHERE slug = 'walters-sports-bar-dc'), 'premier-league', 'Premier League');
INSERT INTO bar_leagues (bar_id, league_slug, league_name) VALUES ((SELECT id FROM bars WHERE slug = 'suzie-qs-dc'), 'premier-league', 'Premier League');
INSERT INTO bar_leagues (bar_id, league_slug, league_name) VALUES ((SELECT id FROM bars WHERE slug = 'lous-city-bar-dc'), 'premier-league', 'Premier League');
INSERT INTO bar_leagues (bar_id, league_slug, league_name) VALUES ((SELECT id FROM bars WHERE slug = 'nanny-obriens-dc'), 'premier-league', 'Premier League');
INSERT INTO bar_leagues (bar_id, league_slug, league_name) VALUES ((SELECT id FROM bars WHERE slug = 'the-big-board-dc'), 'premier-league', 'Premier League');
INSERT INTO bar_leagues (bar_id, league_slug, league_name) VALUES ((SELECT id FROM bars WHERE slug = 'the-commodore-dc'), 'premier-league', 'Premier League');
INSERT INTO bar_leagues (bar_id, league_slug, league_name) VALUES ((SELECT id FROM bars WHERE slug = 'sports-and-social-dc'), 'premier-league', 'Premier League');
INSERT INTO bar_leagues (bar_id, league_slug, league_name) VALUES ((SELECT id FROM bars WHERE slug = 'irelands-four-courts-arlington'), 'premier-league', 'Premier League');
INSERT INTO bar_leagues (bar_id, league_slug, league_name) VALUES ((SELECT id FROM bars WHERE slug = 'crystal-city-sports-pub-arlington'), 'premier-league', 'Premier League');

-- MLS (DC United bars and soccer-focused bars)
INSERT INTO bar_leagues (bar_id, league_slug, league_name) VALUES ((SELECT id FROM bars WHERE slug = 'lucky-bar-dc'), 'mls', 'MLS');
INSERT INTO bar_leagues (bar_id, league_slug, league_name) VALUES ((SELECT id FROM bars WHERE slug = 'the-artemis-dc'), 'mls', 'MLS');
INSERT INTO bar_leagues (bar_id, league_slug, league_name) VALUES ((SELECT id FROM bars WHERE slug = 'public-bar-live-dc'), 'mls', 'MLS');
INSERT INTO bar_leagues (bar_id, league_slug, league_name) VALUES ((SELECT id FROM bars WHERE slug = 'toms-watch-bar-dc'), 'mls', 'MLS');
INSERT INTO bar_leagues (bar_id, league_slug, league_name) VALUES ((SELECT id FROM bars WHERE slug = 'kirwans-on-the-wharf-dc'), 'mls', 'MLS');
INSERT INTO bar_leagues (bar_id, league_slug, league_name) VALUES ((SELECT id FROM bars WHERE slug = 'walters-sports-bar-dc'), 'mls', 'MLS');
INSERT INTO bar_leagues (bar_id, league_slug, league_name) VALUES ((SELECT id FROM bars WHERE slug = 'lous-city-bar-dc'), 'mls', 'MLS');
INSERT INTO bar_leagues (bar_id, league_slug, league_name) VALUES ((SELECT id FROM bars WHERE slug = 'the-commodore-dc'), 'mls', 'MLS');
INSERT INTO bar_leagues (bar_id, league_slug, league_name) VALUES ((SELECT id FROM bars WHERE slug = 'sports-and-social-dc'), 'mls', 'MLS');
INSERT INTO bar_leagues (bar_id, league_slug, league_name) VALUES ((SELECT id FROM bars WHERE slug = 'irelands-four-courts-arlington'), 'mls', 'MLS');
INSERT INTO bar_leagues (bar_id, league_slug, league_name) VALUES ((SELECT id FROM bars WHERE slug = 'crystal-city-sports-pub-arlington'), 'mls', 'MLS');
INSERT INTO bar_leagues (bar_id, league_slug, league_name) VALUES ((SELECT id FROM bars WHERE slug = 'irish-channel-dc'), 'mls', 'MLS');
INSERT INTO bar_leagues (bar_id, league_slug, league_name) VALUES ((SELECT id FROM bars WHERE slug = 'nanny-obriens-dc'), 'mls', 'MLS');

-- Champions League (soccer-dedicated bars)
INSERT INTO bar_leagues (bar_id, league_slug, league_name) VALUES ((SELECT id FROM bars WHERE slug = 'lucky-bar-dc'), 'champions-league', 'UEFA Champions League');
INSERT INTO bar_leagues (bar_id, league_slug, league_name) VALUES ((SELECT id FROM bars WHERE slug = 'queen-vic-dc'), 'champions-league', 'UEFA Champions League');
INSERT INTO bar_leagues (bar_id, league_slug, league_name) VALUES ((SELECT id FROM bars WHERE slug = 'exiles-bar-dc'), 'champions-league', 'UEFA Champions League');
INSERT INTO bar_leagues (bar_id, league_slug, league_name) VALUES ((SELECT id FROM bars WHERE slug = 'the-artemis-dc'), 'champions-league', 'UEFA Champions League');
INSERT INTO bar_leagues (bar_id, league_slug, league_name) VALUES ((SELECT id FROM bars WHERE slug = 'elephant-and-castle-dc'), 'champions-league', 'UEFA Champions League');
INSERT INTO bar_leagues (bar_id, league_slug, league_name) VALUES ((SELECT id FROM bars WHERE slug = 'irelands-four-courts-arlington'), 'champions-league', 'UEFA Champions League');
INSERT INTO bar_leagues (bar_id, league_slug, league_name) VALUES ((SELECT id FROM bars WHERE slug = 'public-bar-live-dc'), 'champions-league', 'UEFA Champions League');
INSERT INTO bar_leagues (bar_id, league_slug, league_name) VALUES ((SELECT id FROM bars WHERE slug = 'franklin-hall-dc'), 'champions-league', 'UEFA Champions League');
INSERT INTO bar_leagues (bar_id, league_slug, league_name) VALUES ((SELECT id FROM bars WHERE slug = 'irish-channel-dc'), 'champions-league', 'UEFA Champions League');

-- La Liga (Elephant & Castle for Barcelona, plus soccer-focused bars)
INSERT INTO bar_leagues (bar_id, league_slug, league_name) VALUES ((SELECT id FROM bars WHERE slug = 'elephant-and-castle-dc'), 'la-liga', 'La Liga');
INSERT INTO bar_leagues (bar_id, league_slug, league_name) VALUES ((SELECT id FROM bars WHERE slug = 'public-bar-live-dc'), 'la-liga', 'La Liga');
INSERT INTO bar_leagues (bar_id, league_slug, league_name) VALUES ((SELECT id FROM bars WHERE slug = 'the-artemis-dc'), 'la-liga', 'La Liga');

-- Serie A
INSERT INTO bar_leagues (bar_id, league_slug, league_name) VALUES ((SELECT id FROM bars WHERE slug = 'the-artemis-dc'), 'serie-a', 'Serie A');
INSERT INTO bar_leagues (bar_id, league_slug, league_name) VALUES ((SELECT id FROM bars WHERE slug = 'public-bar-live-dc'), 'serie-a', 'Serie A');

-- Bundesliga
INSERT INTO bar_leagues (bar_id, league_slug, league_name) VALUES ((SELECT id FROM bars WHERE slug = 'the-artemis-dc'), 'bundesliga', 'Bundesliga');

-- World Cup (all soccer bars show the World Cup)
INSERT INTO bar_leagues (bar_id, league_slug, league_name) VALUES ((SELECT id FROM bars WHERE slug = 'lucky-bar-dc'), 'world-cup', 'FIFA World Cup');
INSERT INTO bar_leagues (bar_id, league_slug, league_name) VALUES ((SELECT id FROM bars WHERE slug = 'queen-vic-dc'), 'world-cup', 'FIFA World Cup');
INSERT INTO bar_leagues (bar_id, league_slug, league_name) VALUES ((SELECT id FROM bars WHERE slug = 'exiles-bar-dc'), 'world-cup', 'FIFA World Cup');
INSERT INTO bar_leagues (bar_id, league_slug, league_name) VALUES ((SELECT id FROM bars WHERE slug = 'franklin-hall-dc'), 'world-cup', 'FIFA World Cup');
INSERT INTO bar_leagues (bar_id, league_slug, league_name) VALUES ((SELECT id FROM bars WHERE slug = 'irish-channel-dc'), 'world-cup', 'FIFA World Cup');
INSERT INTO bar_leagues (bar_id, league_slug, league_name) VALUES ((SELECT id FROM bars WHERE slug = 'the-artemis-dc'), 'world-cup', 'FIFA World Cup');
INSERT INTO bar_leagues (bar_id, league_slug, league_name) VALUES ((SELECT id FROM bars WHERE slug = 'public-bar-live-dc'), 'world-cup', 'FIFA World Cup');
INSERT INTO bar_leagues (bar_id, league_slug, league_name) VALUES ((SELECT id FROM bars WHERE slug = 'elephant-and-castle-dc'), 'world-cup', 'FIFA World Cup');
INSERT INTO bar_leagues (bar_id, league_slug, league_name) VALUES ((SELECT id FROM bars WHERE slug = 'irelands-four-courts-arlington'), 'world-cup', 'FIFA World Cup');
INSERT INTO bar_leagues (bar_id, league_slug, league_name) VALUES ((SELECT id FROM bars WHERE slug = 'crystal-city-sports-pub-arlington'), 'world-cup', 'FIFA World Cup');

-- GAA (Irish pubs that show Gaelic games)
INSERT INTO bar_leagues (bar_id, league_slug, league_name) VALUES ((SELECT id FROM bars WHERE slug = 'kirwans-on-the-wharf-dc'), 'gaa', 'GAA');
INSERT INTO bar_leagues (bar_id, league_slug, league_name) VALUES ((SELECT id FROM bars WHERE slug = 'irish-channel-dc'), 'gaa', 'GAA');
INSERT INTO bar_leagues (bar_id, league_slug, league_name) VALUES ((SELECT id FROM bars WHERE slug = 'irelands-four-courts-arlington'), 'gaa', 'GAA');
INSERT INTO bar_leagues (bar_id, league_slug, league_name) VALUES ((SELECT id FROM bars WHERE slug = 'nanny-obriens-dc'), 'gaa', 'GAA');
