-- Detroit Metro Area Soccer Bars
-- Added: 2026-02-20
-- 12 bars across Detroit metro area (Detroit, Hamtramck, Royal Oak, Warren, Plymouth)
-- Detroit City FC (USL Championship) has strong supporter culture with Northern Guard Supporters
-- Premier League supporter clubs: Liverpool at Thomas Magee's, Arsenal at McShane's,
--   Chelsea at Royal Oak Brewery, Man City at Royal Oak Brewery, Tottenham at Mercury Burger Bar,
--   Celtic at Collect Beer Bar

-- Add cities to cities table
INSERT OR IGNORE INTO cities (name, slug, state, is_world_cup_host) VALUES ('Detroit', 'detroit', 'Michigan', 0);
INSERT OR IGNORE INTO cities (name, slug, state, is_world_cup_host) VALUES ('Hamtramck', 'hamtramck', 'Michigan', 0);
INSERT OR IGNORE INTO cities (name, slug, state, is_world_cup_host) VALUES ('Royal Oak', 'royal-oak', 'Michigan', 0);
INSERT OR IGNORE INTO cities (name, slug, state, is_world_cup_host) VALUES ('Warren', 'warren-mi', 'Michigan', 0);
INSERT OR IGNORE INTO cities (name, slug, state, is_world_cup_host) VALUES ('Plymouth', 'plymouth-mi', 'Michigan', 0);

-- Add Detroit City FC to teams table
INSERT OR IGNORE INTO teams (slug, name, league) VALUES ('detroit-city-fc', 'Detroit City FC', 'USL Championship');

-- ============================================================
-- BARS
-- ============================================================

-- 1. Thomas Magee's Sporting House Whiskey Bar - THE Detroit soccer bar, Official LFC Detroit home
INSERT INTO bars (slug, name, description, city, city_slug, state, neighborhood, address, opens_early, website, sources, source_count)
VALUES (
  'thomas-magees-detroit',
  'Thomas Magee''s Sporting House Whiskey Bar',
  'The undisputed soccer bar of Detroit. Home to LFC Detroit, the official Liverpool supporters club that has swelled from 80 members to over 500 since 2013. Owner Erik Olson keeps the bar open for every Liverpool match regardless of kickoff time. Features authentic Anfield memorabilia including a wood-carved You''ll Never Walk Alone motto and metal replica of the Shankly Gates. Located in the historic Eastern Market district, the bar broadcasts all Premier League matches plus F1.',
  'Detroit', 'detroit', 'Michigan', 'Eastern Market',
  '1408 E Fisher Service Dr, Detroit, MI 48207',
  1,
  'https://thomasmagees.com',
  '["https://www.detroitnews.com/story/sports/soccer/2018/07/24/detroit-liverpool-fans-walk-walk-supporting-english-soccer-club/824694002/", "https://americanscouser.com/lfc-olsc-spotlight-detroit-supporters-club/", "https://www.liverpoolfc.com/fans/official-lfc-supporters-clubs/north-america", "https://www.premierleague.com/usa-bar-finder", "https://www.cbsnews.com/detroit/news/best-bars-to-watch-premier-league-soccer-in-detroit/", "https://www.goodrec.com/blog/where-to-watch-soccer-detroit-10-best-soccer-bars"]',
  6
);

-- 2. Detroit City Clubhouse - Official DCFC bar and restaurant inside the Fieldhouse
INSERT INTO bars (slug, name, description, city, city_slug, state, neighborhood, address, opens_early, website, sources, source_count)
VALUES (
  'detroit-city-clubhouse',
  'Detroit City Clubhouse',
  'Detroit''s dedicated soccer bar and restaurant, located inside the Detroit City Fieldhouse -- the training facility for Detroit City FC. Opens at 9 AM on weekends for Premier League brunch with English beef pies and warm apple pie alongside craft beer. This is where you watch DCFC road matches, catch every Premier League kickoff, and feel the heartbeat of Detroit''s soccer culture. West Ham''s Detroit Hammers supporters also gather here.',
  'Detroit', 'detroit', 'Michigan', 'Lafayette Park',
  '3401 E Lafayette St, Detroit, MI 48207',
  1,
  'https://detroitcityclubhouse.com',
  '["https://detroitcityclubhouse.com/", "https://www.detcityfc.com/clubhouse", "https://www.cbsnews.com/detroit/news/best-bars-to-watch-premier-league-soccer-in-detroit/", "https://www.goodrec.com/blog/where-to-watch-soccer-detroit-10-best-soccer-bars", "https://visitdetroit.com/inside-the-d/soccer-fans/"]',
  5
);

-- 3. McShane's Irish Pub & Whiskey Bar - Arsenal Detroit home in Corktown
INSERT INTO bars (slug, name, description, city, city_slug, state, neighborhood, address, opens_early, website, sources, source_count)
VALUES (
  'mcshanes-irish-pub-detroit',
  'McShane''s Irish Pub & Whiskey Bar',
  'The home of Arsenal Detroit, where Gunners supporters have carved out their own patch in Corktown near the site of old Tiger Stadium. This Irish pub features 21 big-screen TVs, 26 draft lines with 15 Michigan craft beers, and opens at 10 AM on weekends for early Premier League matches. The exterior is painted Arsenal red, and the staff welcome the supporters club with open arms.',
  'Detroit', 'detroit', 'Michigan', 'Corktown',
  '1460 Michigan Ave, Detroit, MI 48216',
  1,
  'https://mcshanespub.com',
  '["https://www.arsenal.com/usa/fanzone-usa/usa-supporters-club/detroit-mi", "https://www.detroitnews.com/story/sports/soccer/2019/09/06/detroit-area-tottenham-supporters-opt-spur-english-premier-league-club-among-their-own/2203521001/", "https://www.premierleague.com/usa-bar-finder", "https://www.cbsnews.com/detroit/news/best-bars-to-watch-premier-league-soccer-in-detroit/"]',
  4
);

-- 4. Mercury Burger Bar - Tottenham/Detroit Spurs watch bar in Corktown
INSERT INTO bars (slug, name, description, city, city_slug, state, neighborhood, address, opens_early, website, sources, source_count)
VALUES (
  'mercury-burger-bar-detroit',
  'Mercury Burger Bar',
  'A Corktown institution known for craft burgers and soccer. Listed on the Premier League''s official USA Bar Finder, Mercury became the home of Detroit Spurs -- the official Tottenham Hotspur supporters club -- drawing 70+ fans for North London Derbies. Previously the central hub for multi-club Soccer Saturdays before supporter groups scattered to their own pubs. Still a reliable spot for Saturday morning matches alongside poutine and old-school milkshakes.',
  'Detroit', 'detroit', 'Michigan', 'Corktown',
  '2163 Michigan Ave, Detroit, MI 48216',
  0,
  'https://mercuryburgerbar.com',
  '["https://www.detroitnews.com/story/sports/soccer/2019/09/06/detroit-area-tottenham-supporters-opt-spur-english-premier-league-club-among-their-own/2203521001/", "https://www.premierleague.com/usa-bar-finder/bar/2058/mercury-bar", "https://firsttouchonline.com/tottenham-supporters-in-michigan/", "https://www.tottenhamhotspur.com/fans/supporters-clubs/join-a-club/detroit-spurs/"]',
  4
);

-- 5. Fowling Warehouse - Official DCFC pre-match bar in Hamtramck
INSERT INTO bars (slug, name, description, city, city_slug, state, neighborhood, address, opens_early, website, sources, source_count)
VALUES (
  'fowling-warehouse-hamtramck',
  'Fowling Warehouse',
  'The official pre-match bar of Detroit City FC, where the legendary March to the Match begins. Supporters gather at this converted 1919 axle factory to play fowling -- hurling a football at bowling pins -- before drumming, chanting, and singing their way through the streets of Hamtramck to Keyworth Stadium. Features 30 fowling lanes, a 200-seat beer garden, and a massive bar. Open since 2014, this is where DCFC culture comes alive on match day.',
  'Hamtramck', 'hamtramck', 'Michigan', NULL,
  '3901 Christopher St, Hamtramck, MI 48211',
  0,
  'https://fowlingwarehouse.com/detroit/',
  '["https://visitdetroit.com/inside-the-d/your-guide-to-attending-a-detroit-city-fc-match/", "https://visitdetroit.com/inside-the-d/soccer-fans/", "https://www.detcityfc.com/matchday/know-before-you-go/", "https://www.metrotimes.com/news/new-dodge-lounge-presents-northern-guard-march-to-the-match-39844573"]',
  4
);

-- 6. New Dodge Lounge - Northern Guard Supporters pre-match bar
INSERT INTO bars (slug, name, description, city, city_slug, state, neighborhood, address, opens_early, website, sources, source_count)
VALUES (
  'new-dodge-lounge-hamtramck',
  'New Dodge Lounge',
  'The official pre-match bar of the Northern Guard Supporters, Detroit City FC''s legendary independent supporter group. Under new ownership since 2022, this bi-level venue on Joseph Campau is where the March to the Match assembles before every DCFC home game. Supporters gather for drinks and camaraderie before drumming, chanting, and parading through Hamtramck''s streets to Keyworth Stadium. Also a beloved live music venue with a top-tier sound system.',
  'Hamtramck', 'hamtramck', 'Michigan', NULL,
  '8850 Joseph Campau Ave, Hamtramck, MI 48212',
  0,
  'https://www.instagram.com/new_dodge_lounge/',
  '["https://www.metrotimes.com/news/new-dodge-lounge-presents-northern-guard-march-to-the-match-39844573", "https://www.noonelikes.us/match-day", "https://www.detcityfc.com/matchday/know-before-you-go/", "https://www.hourdetroit.com/sports-topics/a-new-season-for-detroit-city-fc/"]',
  4
);

-- 7. Royal Oak Brewery - Chelsea (Motor City Blues) + Man City (Metro Detroit Blues) home
INSERT INTO bars (slug, name, description, city, city_slug, state, neighborhood, address, opens_early, website, sources, source_count)
VALUES (
  'royal-oak-brewery',
  'Royal Oak Brewery',
  'Oakland County''s oldest brewpub since 1995, and the shared home of two Premier League supporter clubs: the Motor City Blues (official Chelsea FC in America chapter) and the Metro Detroit Blues (official Manchester City supporters branch). Listed on the Premier League''s official USA Bar Finder. The brewery''s comfortable atmosphere and central location where I-75 and I-696 meet make it the natural gathering point for EPL fans across the northern suburbs.',
  'Royal Oak', 'royal-oak', 'Michigan', 'Downtown Royal Oak',
  '215 E 4th St, Royal Oak, MI 48067',
  0,
  'https://royaloakbrewery.com',
  '["https://www.chelseainamerica.com/motorcityblueschelseasupporters", "https://www.mancity.com/supporters-clubs/metro-detroit-blues-687", "https://www.premierleague.com/usa-bar-finder/bar/2059/the-royal-oak-brewery", "https://www.detroitnews.com/story/sports/soccer/2019/09/06/detroit-area-tottenham-supporters-opt-spur-english-premier-league-club-among-their-own/2203521001/"]',
  4
);

-- 8. Nemo's Bar - Classic Corktown sports bar with soccer cred
INSERT INTO bars (slug, name, description, city, city_slug, state, neighborhood, address, opens_early, website, sources, source_count)
VALUES (
  'nemos-bar-detroit',
  'Nemo''s Bar',
  'A Detroit institution since the 1960s near the old Tiger Stadium site, Nemo''s was named the No. 2 sports bar in the country by Sports Illustrated. This family-run bar in Corktown shows international soccer alongside all major sports, and is consistently listed among Detroit''s top soccer viewing spots. Famous for their burgers and chili, with a welcoming vibe that draws a cross-section of Detroit sports fans.',
  'Detroit', 'detroit', 'Michigan', 'Corktown',
  '1384 Michigan Ave, Detroit, MI 48216',
  0,
  'https://nemosdetroit.com',
  '["https://www.goodrec.com/blog/where-to-watch-soccer-detroit-10-best-soccer-bars", "https://www.cbsnews.com/detroit/news/best-bars-to-watch-premier-league-soccer-in-detroit/", "https://secretdetroit.co/best-sports-bars-detroit/", "https://visitdetroit.com/inside-the-d/sports-bars/"]',
  4
);

-- 9. The Old Shillelagh - Greektown Irish pub since 1975
INSERT INTO bars (slug, name, description, city, city_slug, state, neighborhood, address, opens_early, website, sources, source_count)
VALUES (
  'old-shillelagh-detroit',
  'The Old Shillelagh',
  'Detroit''s number one Irish pub since 1975, this bi-level Greektown institution features 32 screens across a 250-seat venue showing all major professional and college sports plus soccer and UFC. A short walk from every major Detroit venue with complimentary shuttle service. While not a dedicated soccer bar, the Shillelagh is a reliable spot for big soccer events and a Greektown fixture that no sports fan should miss.',
  'Detroit', 'detroit', 'Michigan', 'Greektown',
  '349 Monroe St, Detroit, MI 48226',
  0,
  'https://oldshillelagh.com',
  '["https://visitdetroit.com/inside-the-d/sports-bars/", "https://www.oldshillelagh.com/tv-lineup", "https://www.seenthemagazine.com/food-drink/sports-bar-round-up-to-kick-off-football-season/article_4c169f26-6b1c-11ef-b3c6-9f2b266091bb.html", "https://sportsbars.com/best-sports-bars-in-detroit-2025-the-definitive-guide-to-real-venues/"]',
  4
);

-- 10. The Commonwealth Club - English expat social club since 1962
INSERT INTO bars (slug, name, description, city, city_slug, state, neighborhood, address, opens_early, website, sources, source_count)
VALUES (
  'commonwealth-club-warren',
  'The Commonwealth Club',
  'Among the oldest English expat social clubs in America, established in 1962 by English immigrants who came to work at the GM Technical Center. British soccer viewing is one of its main creeds alongside Friday night fish fry, dart leagues, and British trivia. Open to all walks of life despite its Commonwealth origins. A unique piece of Detroit''s British sporting heritage where you can watch the Premier League in an authentic English club setting.',
  'Warren', 'warren-mi', 'Michigan', NULL,
  '30088 Dequindre Rd, Warren, MI 48092',
  0,
  'https://commonwealthclubmi.com',
  '["https://www.cbsnews.com/detroit/news/best-bars-to-watch-premier-league-soccer-in-detroit/", "https://www.macombdaily.com/2022/07/10/commonwealth-club-celebrates-60th-anniversary/", "https://commonwealthclubmi.com/faq/"]',
  3
);

-- 11. Sean O'Callaghan's - Irish pub with Premier League & Champions League
INSERT INTO bars (slug, name, description, city, city_slug, state, neighborhood, address, opens_early, website, sources, source_count)
VALUES (
  'sean-ocallaghans-plymouth',
  'Sean O''Callaghan''s',
  'A Victorian-style Irish public house in downtown Plymouth featuring custom mahogany woodwork and hand-crafted stained glass. Soccer takes top billing on the televisions here, with dedicated Premier League and Champions League viewing events. Certified Guinness pub with 24 taps focusing on Michigan and European craft beers, over 100 Irish whiskeys, and authentic Irish dishes including shepherd''s pie and fish and chips.',
  'Plymouth', 'plymouth-mi', 'Michigan', 'Downtown Plymouth',
  '821 Penniman Ave, Plymouth, MI 48170',
  0,
  'https://www.seanocallaghanspub.com',
  '["https://www.seanocallaghanspub.com/event/premier-league-soccer/", "https://www.cbsnews.com/detroit/news/best-bars-to-watch-premier-league-soccer-in-detroit/", "https://www.yelp.com/biz/sean-o-callaghans-plymouth-3"]',
  3
);

-- 12. Collect Beer Bar - Detroit Celtic Supporters Club home
INSERT INTO bars (slug, name, description, city, city_slug, state, neighborhood, address, opens_early, website, sources, source_count)
VALUES (
  'collect-beer-bar-detroit',
  'Collect Beer Bar',
  'The home bar of the Detroit Celtic Supporters Club. Originally opened in 2018 on Gratiot in Eastern Market, Collect reopened in 2024 in a new East Village location with a large patio and indoor space. A curated beer bar with excellent selections of craft beer, wine, cider, and kombucha. On match days, Detroit''s Celtic faithful gather here to watch Scottish Premiership and European football in a relaxed, community-oriented setting.',
  'Detroit', 'detroit', 'Michigan', 'East Village',
  '9301 Kercheval Ave, Detroit, MI 48214',
  0,
  'https://www.collect-beerbar.com',
  '["https://www.celticbars.com/celtic-bar/collect-beer-bar/", "https://detroitcsc.com/", "https://www.wxyz.com/news/c%C3%B8llect-beer-bar-reopens-in-detroits-east-village"]',
  3
);

-- ============================================================
-- TEAM AFFILIATIONS
-- ============================================================

-- Thomas Magee's - Liverpool
INSERT INTO bar_teams (bar_id, team_slug, team_name)
SELECT id, 'liverpool', 'Liverpool FC' FROM bars WHERE slug = 'thomas-magees-detroit';

-- Detroit City Clubhouse - Detroit City FC, West Ham
INSERT INTO bar_teams (bar_id, team_slug, team_name)
SELECT id, 'detroit-city-fc', 'Detroit City FC' FROM bars WHERE slug = 'detroit-city-clubhouse';
INSERT INTO bar_teams (bar_id, team_slug, team_name)
SELECT id, 'west-ham', 'West Ham United' FROM bars WHERE slug = 'detroit-city-clubhouse';

-- McShane's - Arsenal
INSERT INTO bar_teams (bar_id, team_slug, team_name)
SELECT id, 'arsenal', 'Arsenal FC' FROM bars WHERE slug = 'mcshanes-irish-pub-detroit';

-- Mercury Burger Bar - Tottenham
INSERT INTO bar_teams (bar_id, team_slug, team_name)
SELECT id, 'tottenham-hotspur', 'Tottenham Hotspur' FROM bars WHERE slug = 'mercury-burger-bar-detroit';

-- Fowling Warehouse - Detroit City FC
INSERT INTO bar_teams (bar_id, team_slug, team_name)
SELECT id, 'detroit-city-fc', 'Detroit City FC' FROM bars WHERE slug = 'fowling-warehouse-hamtramck';

-- New Dodge Lounge - Detroit City FC
INSERT INTO bar_teams (bar_id, team_slug, team_name)
SELECT id, 'detroit-city-fc', 'Detroit City FC' FROM bars WHERE slug = 'new-dodge-lounge-hamtramck';

-- Royal Oak Brewery - Chelsea, Manchester City
INSERT INTO bar_teams (bar_id, team_slug, team_name)
SELECT id, 'chelsea', 'Chelsea FC' FROM bars WHERE slug = 'royal-oak-brewery';
INSERT INTO bar_teams (bar_id, team_slug, team_name)
SELECT id, 'manchester-city', 'Manchester City FC' FROM bars WHERE slug = 'royal-oak-brewery';

-- Collect Beer Bar - Celtic
INSERT INTO bar_teams (bar_id, team_slug, team_name)
SELECT id, 'celtic', 'Celtic FC' FROM bars WHERE slug = 'collect-beer-bar-detroit';

-- ============================================================
-- LEAGUE AFFILIATIONS
-- ============================================================

-- Thomas Magee's - Premier League, Champions League, MLS
INSERT INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'premier-league', 'Premier League' FROM bars WHERE slug = 'thomas-magees-detroit';
INSERT INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'champions-league', 'UEFA Champions League' FROM bars WHERE slug = 'thomas-magees-detroit';

-- Detroit City Clubhouse - Premier League, USL/MLS, Champions League
INSERT INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'premier-league', 'Premier League' FROM bars WHERE slug = 'detroit-city-clubhouse';
INSERT INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'champions-league', 'UEFA Champions League' FROM bars WHERE slug = 'detroit-city-clubhouse';
INSERT INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'mls', 'MLS' FROM bars WHERE slug = 'detroit-city-clubhouse';

-- McShane's - Premier League, Champions League
INSERT INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'premier-league', 'Premier League' FROM bars WHERE slug = 'mcshanes-irish-pub-detroit';
INSERT INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'champions-league', 'UEFA Champions League' FROM bars WHERE slug = 'mcshanes-irish-pub-detroit';

-- Mercury Burger Bar - Premier League
INSERT INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'premier-league', 'Premier League' FROM bars WHERE slug = 'mercury-burger-bar-detroit';

-- Royal Oak Brewery - Premier League, Champions League
INSERT INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'premier-league', 'Premier League' FROM bars WHERE slug = 'royal-oak-brewery';
INSERT INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'champions-league', 'UEFA Champions League' FROM bars WHERE slug = 'royal-oak-brewery';

-- Nemo's Bar - Premier League, Champions League
INSERT INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'premier-league', 'Premier League' FROM bars WHERE slug = 'nemos-bar-detroit';
INSERT INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'champions-league', 'UEFA Champions League' FROM bars WHERE slug = 'nemos-bar-detroit';

-- Old Shillelagh - Premier League, World Cup
INSERT INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'premier-league', 'Premier League' FROM bars WHERE slug = 'old-shillelagh-detroit';
INSERT INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'world-cup', 'FIFA World Cup' FROM bars WHERE slug = 'old-shillelagh-detroit';

-- Commonwealth Club - Premier League
INSERT INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'premier-league', 'Premier League' FROM bars WHERE slug = 'commonwealth-club-warren';

-- Sean O'Callaghan's - Premier League, Champions League
INSERT INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'premier-league', 'Premier League' FROM bars WHERE slug = 'sean-ocallaghans-plymouth';
INSERT INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'champions-league', 'UEFA Champions League' FROM bars WHERE slug = 'sean-ocallaghans-plymouth';

-- Collect Beer Bar - Scottish Premiership, Champions League
INSERT INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'scottish-premiership', 'Scottish Premiership' FROM bars WHERE slug = 'collect-beer-bar-detroit';
INSERT INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'champions-league', 'UEFA Champions League' FROM bars WHERE slug = 'collect-beer-bar-detroit';
