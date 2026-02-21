-- Milwaukee, Wisconsin Soccer Bars
-- Added: 2026-02-20
-- 10 soccer bars across Milwaukee (8), Shorewood (1), and South Milwaukee (1)
-- Strong German/English pub scene with organized EPL supporter clubs
-- Sources: OnMilwaukee, Milwaukee Record, Yahoo Sports/Milwaukee Journal Sentinel, TMJ4,
--          Soccer.Town, GameWatch.info, Premier League USA Bar Finder, arsenal.com (Brew City Gunners),
--          tottenhamhotspur.com (Milwaukee Spurs), liverpoolfc.com (LFC MKE), Leeds Americas,
--          Bavarian Football Works (Mia San Milwaukee), American Outlaws,
--          official bar websites, Yelp, TripAdvisor, Urban Milwaukee, FourSquare

-- Add cities to cities table
INSERT OR IGNORE INTO cities (name, slug, state, is_world_cup_host) VALUES ('Milwaukee', 'milwaukee', 'Wisconsin', 0);
INSERT OR IGNORE INTO cities (name, slug, state, is_world_cup_host) VALUES ('Shorewood', 'shorewood', 'Wisconsin', 0);
INSERT OR IGNORE INTO cities (name, slug, state, is_world_cup_host) VALUES ('South Milwaukee', 'south-milwaukee', 'Wisconsin', 0);

-- ============================================================
-- BARS - MILWAUKEE
-- ============================================================

-- 1. The Highbury Pub - Milwaukee's soccer shrine, Arsenal bar, AO Milwaukee home
INSERT INTO bars (slug, name, description, city, city_slug, state, neighborhood, address, opens_early, website, sources, source_count)
VALUES (
  'highbury-pub-milwaukee',
  'The Highbury Pub',
  'Milwaukee''s original soccer shrine, named after Arsenal''s legendary Highbury Stadium. Owner Joe Katz opened the Bay View pub in 2004, and it has been filling seats at 6:30 AM for early kickoffs ever since. The Brew City Gunners (Arsenal supporters, founded 2013, registered with Arsenal America 2014) watch every match here, and American Outlaws Milwaukee calls it home for USMNT games. Chelsea, Borussia Dortmund, and Manchester City fans are also regulars. Famous for its enormous Bloody Marys served with half a grilled cheese, free morning soup, and a magic coffee ritual. The bar gets loud before noon on match days.',
  'Milwaukee', 'milwaukee', 'Wisconsin', 'Bay View',
  '2322 S Kinnickinnic Ave, Milwaukee, WI 53207',
  1,
  'https://www.thehighbury.com/',
  '["https://www.arsenal.com/usa/fanzone-usa/usa-supporters-club/milwaukee-wi", "https://theamericanoutlaws.com/chapters/milwaukee", "https://www.soccer.town/pubs/milwaukee/the-highbury-pub", "https://onmilwaukee.com/articles/milwaukee-soccer-bars", "https://urbanmilwaukee.com/2014/03/17/taverns-highbury-pub-is-for-soccer-lovers/", "https://sports.yahoo.com/theres-bar-european-soccer-f1-100256689.html"]',
  6
);

-- 2. Red Lion Pub - British pub, MKE Spurs (Tottenham) home
INSERT INTO bars (slug, name, description, city, city_slug, state, neighborhood, address, opens_early, website, sources, source_count)
VALUES (
  'red-lion-pub-milwaukee',
  'Red Lion Pub',
  'A proper British pub on Tannery Row since 2011, Red Lion is one of Milwaukee''s top soccer destinations with a striking Union Jack ceiling, classic British decor, and a full English menu. The bar is the official home of the Milwaukee Spurs (Tottenham Hotspur supporters, founded 2006, officially registered 2014 -- the largest supporter group in Wisconsin). Shows Premier League, Champions League, Europa League, FA Cup, League Cup, Bundesliga, La Liga, and EFL Championship. Opens early on Saturdays for EPL with upstairs and downstairs viewing areas, plus a riverside rooftop patio.',
  'Milwaukee', 'milwaukee', 'Wisconsin', 'Lower East Side',
  '1850 N Water St, Milwaukee, WI 53202',
  1,
  'https://www.redlionpubmke.com/',
  '["https://www.tottenhamhotspur.com/fans/supporters-clubs/north-america/milwaukee-spurs/", "https://redlionpubmke.com/milwaukee-downtown-red-lion-pub-soccer-fans", "https://sports.yahoo.com/theres-bar-european-soccer-f1-100256689.html", "https://onmilwaukee.com/articles/milwaukee-soccer-bars", "https://www.yelp.com/biz/red-lion-pub-milwaukee"]',
  5
);

-- 3. Nomad World Pub - Legendary World Cup bar, Brady Street institution
INSERT INTO bars (slug, name, description, city, city_slug, state, neighborhood, address, opens_early, website, sources, source_count)
VALUES (
  'nomad-world-pub-milwaukee',
  'Nomad World Pub',
  'Milwaukee''s most iconic soccer bar and a Brady Street institution since 1997. Owner Mike Eitel has hosted World Cup parties since 1998, and during the 2014 tournament a crowd of over 15,000 forced the closure of Brady Street for the USA match. Opens at 6:30 AM on weekends for Premier League and 11 AM Tuesday/Wednesday for Champions League. The Nomad Coffee Bar (added 2021) serves food and coffee for morning soccer fans starting at 6:30 AM daily. Summer block parties spill into the street with outdoor screens for major tournaments. Brother bar to SportClub downtown.',
  'Milwaukee', 'milwaukee', 'Wisconsin', 'Brady Street',
  '1401 E Brady St, Milwaukee, WI 53202',
  1,
  'https://nomadworldpub.com/',
  '["https://nomadworldpub.com/", "https://onmilwaukee.com/articles/milwaukee-soccer-bars", "https://milwaukeerecord.com/sports/11-milwaukee-soccer-bars-perfect-for-enjoying-the-world-cup/", "https://urbanmilwaukee.com/2022/10/12/nomad-world-pub-will-host-month-long-world-cup-celebration/", "https://sports.yahoo.com/theres-bar-european-soccer-f1-100256689.html", "https://www.visitmilwaukee.org/listing/nomad-world-pub/1089/"]',
  6
);

-- 4. Old German Beer Hall - Bavarian beer hall, Mia San Milwaukee (Bayern Munich)
INSERT INTO bars (slug, name, description, city, city_slug, state, neighborhood, address, opens_early, website, sources, source_count)
VALUES (
  'old-german-beer-hall-milwaukee',
  'Old German Beer Hall',
  'A Bavarian beer hall on Old World Third Street that opened in 2005 as a replica of Munich''s famous Hofbrauhaus, complete with tables and benches shipped from Germany. Home of Mia San Milwaukee, the official Bayern Munich fan club, where wearing Bayern kit earns you half-price liters on match days. The hall serves Hofbrau Munich beer and traditional festival food -- pretzels, bratwursts, schnitzel -- in a 400-year German beer hall tradition. In a city built on its Deutschland heritage, this is the natural home for Bundesliga fans.',
  'Milwaukee', 'milwaukee', 'Wisconsin', 'Westown',
  '1009 N Old World Third St, Milwaukee, WI 53203',
  0,
  'https://oldgermanbeerhall.com/',
  '["https://www.soccer.town/pubs/milwaukee/old-german-beer-hall", "https://www.bavarianfootballworks.com/2018/9/21/17885360/bayern-munich-the-mia-san-milwaukee-all-or-nothing-schalke-robert-lewandowski-corentin-tolisso-coman", "https://onmilwaukee.com/articles/milwaukee-soccer-bars", "https://www.tmj4.com/sports/the-best-soccer-bars-in-the-milwaukee-area-to-watch-the-world-cup-2022", "https://www.yelp.com/biz/old-german-beer-hall-milwaukee"]',
  5
);

-- 5. SportClub - Upscale soccer viewing, brother bar to Nomad
INSERT INTO bars (slug, name, description, city, city_slug, state, neighborhood, address, opens_early, website, sources, source_count)
VALUES (
  'sportclub-milwaukee',
  'SportClub',
  'An upscale sports bar in downtown Milwaukee''s hotel district, opened in 2018 as the brother bar to soccer favorite Nomad World Pub. SportClub takes a refined approach to match-day viewing -- champagne happy hours, an elevated bar menu, and TV screens throughout the sprawling space including an outdoor patio. A block from Cathedral Square Park, it serves as a World Cup and major tournament destination with the same soccer-first DNA as its sibling on Brady Street. Listed on GameWatch.info for World Cup Soccer watch parties.',
  'Milwaukee', 'milwaukee', 'Wisconsin', 'East Town',
  '750 N Jefferson St, Milwaukee, WI 53202',
  0,
  'https://sportclubmke.com/',
  '["https://sportclubmke.com/", "https://onmilwaukee.com/articles/sportclub-bar-milwaukee-downtown-sports", "https://onmilwaukee.com/articles/milwaukee-soccer-bars", "https://gamewatch.info/teams/world-cup-soccer/bars/sportclub-750-north-jefferson-street-east-town-milwaukee-wi-united-states", "https://www.visitmilwaukee.org/plan-a-visit/food-drink/soccer-bars/"]',
  5
);

-- 6. Puddler's Hall - Historic Bay View tavern, Manchester City supporters
INSERT INTO bars (slug, name, description, city, city_slug, state, neighborhood, address, opens_early, website, sources, source_count)
VALUES (
  'puddlers-hall-milwaukee',
  'Puddler''s Hall',
  'Milwaukee''s second-oldest tavern, originally opened in 1873 as a union hall for Milwaukee Iron Company puddlers and boilers. This Bay View institution has found new life as a gathering spot for Manchester City supporters on match days. The historic Cream City brick building features large TVs, locally sourced pizzas, table tennis, darts, and a rotating craft beer selection. A neighborhood treasure where 150 years of working-class history meets the modern beautiful game.',
  'Milwaukee', 'milwaukee', 'Wisconsin', 'Bay View',
  '2461 S St Clair St, Milwaukee, WI 53207',
  0,
  'https://puddlershall.com/',
  '["https://www.soccer.town/pubs/milwaukee/puddler-s-hall-bay-view-s-historic-tavern", "https://onmilwaukee.com/articles/milwaukee-soccer-bars", "https://www.yelp.com/biz/puddlers-hall-milwaukee"]',
  3
);

-- 7. Bremen Cafe - Riverwest dive bar, Saturday morning EPL
INSERT INTO bars (slug, name, description, city, city_slug, state, neighborhood, address, opens_early, website, sources, source_count)
VALUES (
  'bremen-cafe-milwaukee',
  'Bremen Cafe',
  'A beloved Riverwest corner dive bar that shows English soccer every Saturday morning alongside cheap pints, pinball machines, and some of the best free live music in Milwaukee. Named after Bremen, Germany, the cafe sells liter steins at discount prices -- one of only a few non-German bars in town to do so. Originally opened as a cafe in 2004, it evolved into a neighborhood institution where the soccer crowd arrives in the morning and the music crowd takes over at night.',
  'Milwaukee', 'milwaukee', 'Wisconsin', 'Riverwest',
  '901 E Clarke St, Milwaukee, WI 53212',
  0,
  'https://bremencafe.com/',
  '["https://milwaukeerecord.com/sports/11-milwaukee-soccer-bars-perfect-for-enjoying-the-world-cup/", "https://gamewatch.info/teams/world-cup-soccer/bars/bremen-cafe-901-east-clarke-street-riverwest-milwaukee-wi-united-states", "https://www.yelp.com/biz/bremen-caf%C3%A9-milwaukee-2"]',
  3
);

-- 8. Brass Boar's Den Pub - Leeds United Wisconsin home (West Allis suburb)
-- NOTE: West Allis is technically a separate city within the Milwaukee metro,
-- but every Milwaukee soccer guide includes it. Using Milwaukee city entry
-- since creating a separate West Allis city for 1 bar is excessive.
INSERT INTO bars (slug, name, description, city, city_slug, state, neighborhood, address, opens_early, website, sources, source_count)
VALUES (
  'brass-boars-den-milwaukee',
  'Brass Boar''s Den Pub',
  'The official home of Leeds United Wisconsin, a chapter of Leeds Americas, this West Allis sports bar built its identity around soccer viewing with multiple TVs dedicated to English football. Located on National Avenue in a neighborhood of dive bars and blue-collar establishments, it blends classic Milwaukee dive bar charm with a genuine soccer following. Pool tables, dartboards, and craft cocktails fill the gaps between matches. West Allis is technically a separate city but sits within Milwaukee''s urban core.',
  'Milwaukee', 'milwaukee', 'Wisconsin', 'West Allis',
  '7127 W National Ave, West Allis, WI 53214',
  0,
  'https://www.instagram.com/boarsdenpub/',
  '["https://www.luamericas.com/wisconsin", "https://www.soccer.town/pubs/milwaukee/brass-boar-s-den-pub", "https://www.yelp.com/biz/brass-boars-den-pub-west-allis"]',
  3
);

-- ============================================================
-- BARS - SHOREWOOD (Milwaukee suburb)
-- ============================================================

-- 9. Three Lions Pub - LFC MKE (Liverpool) home, sister bar to Red Lion
INSERT INTO bars (slug, name, description, city, city_slug, state, neighborhood, address, opens_early, website, sources, source_count)
VALUES (
  'three-lions-pub-shorewood',
  'Three Lions Pub',
  'The Shorewood sister bar to Red Lion Pub, Three Lions is the official home of LFC MKE (Milwaukee''s Liverpool supporters club). This British pub has hosted World Cup and European Cup street festivals for over 10 years, showing the same comprehensive slate of leagues as Red Lion: Premier League, Champions League, Europa League, FA Cup, Bundesliga, La Liga, and EFL Championship. Opens early for all Premier League matches with plenty of room inside plus a sidewalk patio. Genuine British pub fare alongside popular local and imported taps.',
  'Shorewood', 'shorewood', 'Wisconsin', null,
  '4515 N Oakland Ave, Shorewood, WI 53211',
  1,
  'https://threelionspub.com/',
  '["https://threelionspub.com/milwaukee-shorewood-three-lions-pub-soccer-fans", "https://www.liverpoolfc.com/fans/official-lfc-supporters-clubs/north-america", "https://onmilwaukee.com/articles/milwaukee-soccer-bars", "https://sports.yahoo.com/theres-bar-european-soccer-f1-100256689.html", "https://www.yelp.com/biz/three-lions-pub-shorewood"]',
  5
);

-- ============================================================
-- BARS - SOUTH MILWAUKEE
-- ============================================================

-- 10. Moran's Pub - Irish pub, owner from Birmingham, Best Soccer Bar
INSERT INTO bars (slug, name, description, city, city_slug, state, neighborhood, address, opens_early, website, sources, source_count)
VALUES (
  'morans-pub-south-milwaukee',
  'Moran''s Pub',
  'A family-owned Irish sports pub since 1995, founded by Jim Moran and now run by son James -- who came to Milwaukee from Birmingham, England to play college soccer at MSOE. Named Best Bar to Watch Soccer by Shepherd Express, Moran''s is where fans of England, Mexico, and clubs from Everton to Manchester United gather for EPL and Bundesliga matches. The pub underwent a $250,000 renovation during COVID, revealing original Cream City brick and tin ceilings. Over 50 beers including 10 on draft, plus trivia nights and block parties. Nearly 30 years of soccer and community.',
  'South Milwaukee', 'south-milwaukee', 'Wisconsin', null,
  '912 Milwaukee Ave, South Milwaukee, WI 53172',
  0,
  'https://moranspub.com/',
  '["https://moranspub.com/", "https://onmilwaukee.com/articles/hidden-gem-morans-pub-south-milwaukee", "https://www.soccer.town/pubs/milwaukee/moran-s-pub", "https://sports.yahoo.com/theres-bar-european-soccer-f1-100256689.html", "https://milwaukeerecord.com/sports/11-milwaukee-soccer-bars-perfect-for-enjoying-the-world-cup/", "https://www.yelp.com/biz/morans-pub-south-milwaukee"]',
  6
);

-- ============================================================
-- TEAM AFFILIATIONS
-- ============================================================

-- The Highbury Pub: Brew City Gunners (Arsenal), AO Milwaukee (USMNT)
INSERT INTO bar_teams (bar_id, team_slug, team_name)
SELECT id, 'arsenal', 'Arsenal FC' FROM bars WHERE slug = 'highbury-pub-milwaukee';

INSERT INTO bar_teams (bar_id, team_slug, team_name)
SELECT id, 'usmnt', 'US Men''s National Team' FROM bars WHERE slug = 'highbury-pub-milwaukee';

-- Red Lion Pub: MKE Spurs (Tottenham)
INSERT INTO bar_teams (bar_id, team_slug, team_name)
SELECT id, 'tottenham', 'Tottenham Hotspur' FROM bars WHERE slug = 'red-lion-pub-milwaukee';

-- Three Lions Pub: LFC MKE (Liverpool)
INSERT INTO bar_teams (bar_id, team_slug, team_name)
SELECT id, 'liverpool', 'Liverpool FC' FROM bars WHERE slug = 'three-lions-pub-shorewood';

-- Old German Beer Hall: Mia San Milwaukee (Bayern Munich)
INSERT INTO bar_teams (bar_id, team_slug, team_name)
SELECT id, 'bayern-munich', 'Bayern Munich' FROM bars WHERE slug = 'old-german-beer-hall-milwaukee';

-- Puddler's Hall: Manchester City
INSERT INTO bar_teams (bar_id, team_slug, team_name)
SELECT id, 'manchester-city', 'Manchester City FC' FROM bars WHERE slug = 'puddlers-hall-milwaukee';

-- Brass Boar's Den Pub: Leeds United
-- First, add Leeds United to teams table (new team)
INSERT OR IGNORE INTO teams (slug, name, league) VALUES ('leeds-united', 'Leeds United FC', 'EFL Championship');

INSERT INTO bar_teams (bar_id, team_slug, team_name)
SELECT id, 'leeds-united', 'Leeds United FC' FROM bars WHERE slug = 'brass-boars-den-milwaukee';

-- ============================================================
-- LEAGUE AFFILIATIONS
-- ============================================================

-- The Highbury Pub: Premier League, Bundesliga, Champions League, International, FIFA World Cup
INSERT INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'premier-league', 'Premier League' FROM bars WHERE slug = 'highbury-pub-milwaukee';
INSERT INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'bundesliga', 'Bundesliga' FROM bars WHERE slug = 'highbury-pub-milwaukee';
INSERT INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'champions-league', 'UEFA Champions League' FROM bars WHERE slug = 'highbury-pub-milwaukee';
INSERT INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'international', 'International' FROM bars WHERE slug = 'highbury-pub-milwaukee';
INSERT INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'world-cup', 'FIFA World Cup' FROM bars WHERE slug = 'highbury-pub-milwaukee';

-- Red Lion Pub: Premier League, Champions League, Europa League, FA Cup, Bundesliga, La Liga, EFL Championship, FIFA World Cup
INSERT INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'premier-league', 'Premier League' FROM bars WHERE slug = 'red-lion-pub-milwaukee';
INSERT INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'champions-league', 'UEFA Champions League' FROM bars WHERE slug = 'red-lion-pub-milwaukee';
INSERT INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'europa-league', 'Europa League' FROM bars WHERE slug = 'red-lion-pub-milwaukee';
INSERT INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'fa-cup', 'FA Cup' FROM bars WHERE slug = 'red-lion-pub-milwaukee';
INSERT INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'bundesliga', 'Bundesliga' FROM bars WHERE slug = 'red-lion-pub-milwaukee';
INSERT INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'la-liga', 'La Liga' FROM bars WHERE slug = 'red-lion-pub-milwaukee';
INSERT INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'championship', 'EFL Championship' FROM bars WHERE slug = 'red-lion-pub-milwaukee';
INSERT INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'world-cup', 'FIFA World Cup' FROM bars WHERE slug = 'red-lion-pub-milwaukee';

-- Three Lions Pub: Premier League, Champions League, Europa League, FA Cup, Bundesliga, La Liga, EFL Championship, FIFA World Cup
INSERT INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'premier-league', 'Premier League' FROM bars WHERE slug = 'three-lions-pub-shorewood';
INSERT INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'champions-league', 'UEFA Champions League' FROM bars WHERE slug = 'three-lions-pub-shorewood';
INSERT INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'europa-league', 'Europa League' FROM bars WHERE slug = 'three-lions-pub-shorewood';
INSERT INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'fa-cup', 'FA Cup' FROM bars WHERE slug = 'three-lions-pub-shorewood';
INSERT INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'bundesliga', 'Bundesliga' FROM bars WHERE slug = 'three-lions-pub-shorewood';
INSERT INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'la-liga', 'La Liga' FROM bars WHERE slug = 'three-lions-pub-shorewood';
INSERT INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'championship', 'EFL Championship' FROM bars WHERE slug = 'three-lions-pub-shorewood';
INSERT INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'world-cup', 'FIFA World Cup' FROM bars WHERE slug = 'three-lions-pub-shorewood';

-- Nomad World Pub: Premier League, Champions League, FIFA World Cup, International
INSERT INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'premier-league', 'Premier League' FROM bars WHERE slug = 'nomad-world-pub-milwaukee';
INSERT INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'champions-league', 'UEFA Champions League' FROM bars WHERE slug = 'nomad-world-pub-milwaukee';
INSERT INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'world-cup', 'FIFA World Cup' FROM bars WHERE slug = 'nomad-world-pub-milwaukee';
INSERT INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'international', 'International' FROM bars WHERE slug = 'nomad-world-pub-milwaukee';

-- Old German Beer Hall: Bundesliga, FIFA World Cup
INSERT INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'bundesliga', 'Bundesliga' FROM bars WHERE slug = 'old-german-beer-hall-milwaukee';
INSERT INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'world-cup', 'FIFA World Cup' FROM bars WHERE slug = 'old-german-beer-hall-milwaukee';

-- SportClub: Premier League, Champions League, FIFA World Cup
INSERT INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'premier-league', 'Premier League' FROM bars WHERE slug = 'sportclub-milwaukee';
INSERT INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'champions-league', 'UEFA Champions League' FROM bars WHERE slug = 'sportclub-milwaukee';
INSERT INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'world-cup', 'FIFA World Cup' FROM bars WHERE slug = 'sportclub-milwaukee';

-- Puddler's Hall: Premier League
INSERT INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'premier-league', 'Premier League' FROM bars WHERE slug = 'puddlers-hall-milwaukee';

-- Bremen Cafe: Premier League, FIFA World Cup
INSERT INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'premier-league', 'Premier League' FROM bars WHERE slug = 'bremen-cafe-milwaukee';
INSERT INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'world-cup', 'FIFA World Cup' FROM bars WHERE slug = 'bremen-cafe-milwaukee';

-- Brass Boar's Den: Premier League, EFL Championship
INSERT INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'premier-league', 'Premier League' FROM bars WHERE slug = 'brass-boars-den-milwaukee';
INSERT INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'championship', 'EFL Championship' FROM bars WHERE slug = 'brass-boars-den-milwaukee';

-- Moran's Pub: Premier League, Bundesliga, FIFA World Cup, International
INSERT INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'premier-league', 'Premier League' FROM bars WHERE slug = 'morans-pub-south-milwaukee';
INSERT INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'bundesliga', 'Bundesliga' FROM bars WHERE slug = 'morans-pub-south-milwaukee';
INSERT INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'world-cup', 'FIFA World Cup' FROM bars WHERE slug = 'morans-pub-south-milwaukee';
INSERT INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'international', 'International' FROM bars WHERE slug = 'morans-pub-south-milwaukee';
