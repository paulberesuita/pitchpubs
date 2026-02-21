-- Indianapolis, Indiana Soccer Bars
-- Added: 2026-02-20
-- 8 soccer bars across Indianapolis (6), Carmel (1), and Fishers (1)
-- Indy Eleven (USL Championship) and growing Midwest soccer culture
-- Sources: Indianapolis Monthly, GoodRec, GameWatch.info, Premier League USA Bar Finder,
--          arsenal.com, tottenhamhotspur.com, liverpoolfc.com, theamericanoutlaws.com,
--          mufcindy.com, indygooners.com, indyspurs.com, brickyardbattalion.com,
--          Visit Indy, Axios Indianapolis, WRTV, IBJ, Do317, Yelp, TripAdvisor,
--          Live Soccer TV, chathamtap.com, unionjackpub.co, brockwaypub.com

-- Add cities to cities table
INSERT OR IGNORE INTO cities (name, slug, state, is_world_cup_host) VALUES ('Indianapolis', 'indianapolis', 'Indiana', 0);
INSERT OR IGNORE INTO cities (name, slug, state, is_world_cup_host) VALUES ('Carmel', 'carmel', 'Indiana', 0);
INSERT OR IGNORE INTO cities (name, slug, state, is_world_cup_host) VALUES ('Fishers', 'fishers', 'Indiana', 0);

-- Add Indy Eleven to teams table
INSERT OR IGNORE INTO teams (slug, name, league) VALUES ('indy-eleven', 'Indy Eleven', 'USL Championship');

-- ============================================================
-- BARS - INDIANAPOLIS
-- ============================================================

-- 1. Union Jack Pub - THE soccer bar of Indianapolis since 1979
INSERT INTO bars (slug, name, description, city, city_slug, state, neighborhood, address, opens_early, website, sources, source_count)
VALUES (
  'union-jack-pub-indianapolis',
  'Union Jack Pub',
  'Indianapolis''s original soccer bar, serving the Broad Ripple community for over 45 years since 1979. Union Jack is THE place to catch soccer in Indy -- home to LFC Indy (Official Liverpool Supporters Club), American Outlaws Indianapolis (USMNT/USWNT), and the Brickyard Battalion (Indy Eleven supporters since 2011). The English-style pub opens early on weekends for morning Premier League and Champions League matches, with a Saturday and Sunday brunch menu timed to kickoff. Eleven TVs show every major league. Britain meets USA on the menu with Fish & Chips, Deep Dish Pizza, Scotch Eggs, and the Big Ben Breakfast.',
  'Indianapolis', 'indianapolis', 'Indiana', 'Broad Ripple',
  '924 Broad Ripple Ave, Indianapolis, IN 46220',
  1,
  'https://unionjackpub.co/',
  '["https://www.unionjackpub.co/soccer/", "https://www.indianapolismonthly.com/arts-and-culture/entertainment/where-to-catch-soccer-fever", "https://lfcindy.com/", "https://theamericanoutlaws.com/chapters/indianapolis", "https://brickyardbattalion.com/", "https://www.visitindy.com/directory/union-jack-pub-broad-ripple/", "https://gamewatch.info/teams/world-cup-soccer/cities/indianapolis-in", "https://www.yelp.com/biz/union-jack-pub-indianapolis-2"]',
  8
);

-- 2. Chatham Tap Mass Ave - Self-branded "Soccer Pub" on Mass Ave
INSERT INTO bars (slug, name, description, city, city_slug, state, neighborhood, address, opens_early, website, sources, source_count)
VALUES (
  'chatham-tap-mass-ave',
  'Chatham Tap',
  'Indianapolis''s self-proclaimed Soccer Pub, Chatham Tap on Mass Ave has been the heartbeat of the city''s soccer scene since opening in September 2007. Soccer scarves and banners adorn the walls, and international fans chat up last week''s match over award-winning wings and imported craft beer. The pub opens early for their Soccer Breakfast, showing EPL, Champions League, World Cup, and European Championships. Home to the Indy Gooners (Arsenal, since 2005 -- one of the first Arsenal America affiliates) and birthplace of MUFC Indy (Manchester United, founded 2021). TripAdvisor reviewers call it the best bar to watch soccer in Indianapolis.',
  'Indianapolis', 'indianapolis', 'Indiana', 'Mass Ave',
  '719 Massachusetts Ave, Indianapolis, IN 46204',
  1,
  'https://www.chathamtap.com/',
  '["https://www.chathamtap.com/about", "https://www.indianapolismonthly.com/arts-and-culture/entertainment/where-to-catch-soccer-fever", "https://www.arsenal.com/usa/fanzone-usa/usa-supporters-club/indianapolis-in", "https://mufcindy.com/chatham-tap/", "https://www.tripadvisor.com/ShowUserReviews-g37209-d2354654-r130758257-Chatham_Tap_Mass_Ave-Indianapolis_Indiana.html", "https://gamewatch.info/teams/world-cup-soccer/cities/indianapolis-in", "https://www.yelp.com/biz/chatham-tap-mass-ave-indianapolis"]',
  7
);

-- 3. Centerpoint Brewing - Indy Spurs (Tottenham) official home
INSERT INTO bars (slug, name, description, city, city_slug, state, neighborhood, address, opens_early, website, sources, source_count)
VALUES (
  'centerpoint-brewing-indianapolis',
  'Centerpoint Brewing',
  'The official home of the Indy Spurs, Indianapolis''s Tottenham Hotspur supporters club (est. 2013, 300+ members strong). This dog-friendly brewery on Brookside Avenue opens early on weekends and midweek specifically for Indy Spurs match viewings, making it a dedicated soccer destination beyond a typical craft brewery. A large selection of IPAs pairs well with the Spurs'' attacking football. Children and dogs are welcome at all match viewings. Also has a second taproom in Broad Ripple at 6320 Guilford Ave.',
  'Indianapolis', 'indianapolis', 'Indiana', 'Near-Eastside',
  '1125 E Brookside Ave, Indianapolis, IN 46202',
  1,
  'https://www.centerpointbrewing.com/',
  '["https://indyspurs.com/", "https://www.tottenhamhotspur.com/fans/supporters-clubs/join-a-club/indianapolis-spurs/", "https://firsttouchonline.com/tottenham-hotspur-supporters/", "https://www.yelp.com/biz/centerpoint-brewing-indianapolis"]',
  4
);

-- 4. Brew Link Brewpub Downtown - MUFC Indy (Manchester United) current home
INSERT INTO bars (slug, name, description, city, city_slug, state, neighborhood, address, opens_early, website, sources, source_count)
VALUES (
  'brew-link-brewpub-indianapolis',
  'Brew Link Brewpub Downtown',
  'The current home pub for MUFC Indy, the official Manchester United Supporters'' Club of Indianapolis (founded August 2021, became officially recognized in under five months). This veteran-owned and operated brewpub on Capitol Avenue pours 24 unique beers on tap alongside freshly made food. MUFC Indy members watch every Red Devils match here and earn points on Brew Link receipts redeemable for discounts, giveaways, and status upgrades. The backroom accommodates the growing club with a private viewing space.',
  'Indianapolis', 'indianapolis', 'Indiana', 'Downtown',
  '714 N Capitol Ave, Indianapolis, IN 46204',
  0,
  'https://brewlinkbrewing.com',
  '["https://mufcindy.com/brew-link/", "https://mufcindy.com/about/", "https://www.visitindy.com/listing/brew-link-brewpub-downtown/233889/", "https://www.yelp.com/biz/brew-link-brewing-indianapolis-2"]',
  4
);

-- 5. Ralston's Drafthouse - FC Bayern Munich watch parties on Mass Ave
INSERT INTO bars (slug, name, description, city, city_slug, state, neighborhood, address, opens_early, website, sources, source_count)
VALUES (
  'ralstons-drafthouse-indianapolis',
  'Ralston''s Drafthouse',
  'A Mass Ave gastropub that has become the home for FC Bayern Munich supporters in Indianapolis. Ralston''s hosts Bayern watch parties in the all-ages backroom, typically at breakfast time around 9:30 AM ET for Bundesliga matches. Beyond Bayern, the outdoor patio on Mass Ave and the indoor space with shuffleboard and darts make it a popular spot for catching European football. An outstanding craft beer list rounds out the experience. Open since the Mass Ave revival, Ralston''s has cultivated a loyal soccer following alongside its broader gastropub identity.',
  'Indianapolis', 'indianapolis', 'Indiana', 'Mass Ave',
  '635 Massachusetts Ave, Indianapolis, IN 46204',
  1,
  'https://www.ralstonsdraft.house',
  '["https://www.visitindy.com/listing/ralstons-drafthouse/220185/", "https://downtownindy.org/go/ralstons-drafthouse", "https://www.yelp.com/biz/ralstons-drafthouse-indianapolis", "https://www.tripadvisor.com/Restaurant_Review-g37209-d3612029-Reviews-Ralston_s_Drafthouse-Indianapolis_Indiana.html"]',
  4
);

-- 6. Tom's Watch Bar - 135 screens, multi-league soccer destination
INSERT INTO bars (slug, name, description, city, city_slug, state, neighborhood, address, opens_early, website, sources, source_count)
VALUES (
  'toms-watch-bar-indianapolis',
  'Tom''s Watch Bar',
  'A 10,000-square-foot sports viewing colossus just blocks from Lucas Oil Stadium and Gainbridge Fieldhouse, with 135 high-definition screens providing 360-degree viewing from every seat. Tom''s Watch Bar carries highly curated soccer programming: English Premier League, La Liga, Bundesliga, Serie A, MLS, Champions League, and both men''s and women''s World Cup. Multiple central oversized stadium screens make this the largest dedicated sports viewing space in Indianapolis. Open daily from 11 AM with elevated pub fare and a wide craft beer and cocktail selection.',
  'Indianapolis', 'indianapolis', 'Indiana', 'Downtown',
  '140 S Illinois St, Indianapolis, IN 46204',
  0,
  'https://tomswatchbar.com/indianapolis/',
  '["https://tomswatchbar.com/indianapolis/", "https://www.visitindy.com/listing/toms-watch-bar/397663568/", "https://www.visitindiana.com/blog/post/calling-all-sports-fans-theres-a-new-bar-in-town/", "https://www.goodrec.com/blog/where-to-watch-soccer-indianapolis-10-best-soccer-bars", "https://www.yelp.com/biz/toms-watch-bar-indianapolis"]',
  5
);

-- ============================================================
-- BARS - CARMEL (SUBURB)
-- ============================================================

-- 7. Brockway Pub - Dublin-inspired Irish pub with EPL viewing
INSERT INTO bars (slug, name, description, city, city_slug, state, neighborhood, address, opens_early, website, sources, source_count)
VALUES (
  'brockway-pub-carmel',
  'Brockway Pub',
  'Indiana''s best Irish pub, the Brockway is a Dublin-inspired industrial pub in the heart of Carmel that brings authentic Irish culture north of the Indianapolis city center. Listed on Live Soccer TV as a soccer pub, customers come in soccer shorts and business attire alike for European League Soccer and a perfect ice cold pint. Awards include Top Irish Pub in Indiana, Best Guinness Pint in North America, Best Pint in Indianapolis, and ESPN''s Best Burger. The menu features 5-star rated fish and chips alongside proper Irish fare.',
  'Carmel', 'carmel', 'Indiana', 'Old Meridian',
  '12525 Old Meridian St, Ste 150, Carmel, IN 46032',
  0,
  'https://brockwaypub.com/',
  '["https://brockwaypub.com/", "https://www.livesoccertv.com/pubs/indiana/", "https://www.visithamiltoncounty.com/listing/brockway-public-house/1279/", "https://www.tripadvisor.com/Restaurant_Review-g36990-d1455656-Reviews-Brockway_Pub-Carmel_Hamilton_County_Indiana.html", "https://www.yelp.com/biz/brockway-pub-carmel"]',
  5
);

-- ============================================================
-- BARS - FISHERS (SUBURB)
-- ============================================================

-- 8. Chatham Tap Fishers - Indy Gooners (Arsenal) current official home
INSERT INTO bars (slug, name, description, city, city_slug, state, neighborhood, address, opens_early, website, sources, source_count)
VALUES (
  'chatham-tap-fishers',
  'Chatham Tap Fishers',
  'The current official home of the Indy Gooners, Indianapolis''s Arsenal FC Supporters Club and Arsenal America affiliate (granted official status in 2005). Chatham Tap''s Fishers location opened in June 2010 as the second outlet of the beloved Soccer Pub brand and brings the same soccer-first atmosphere -- scarves on walls, EPL on screens, award-winning wings on plates. Arsenal match viewings are family-friendly events with dedicated big screens and communal singing. Pre-match traditions include Italian dinners before North London Derbies.',
  'Fishers', 'fishers', 'Indiana', null,
  '8211 E 116th St, Suite 120, Fishers, IN 46038',
  1,
  'https://www.chathamtap.com/fishers',
  '["https://www.indygooners.com/", "https://www.arsenal.com/usa/fanzone-usa/usa-supporters-club/indianapolis-in", "https://arsenalamerica.com/branches/", "https://www.chathamtap.com/fishers", "https://www.yelp.com/biz/chatham-tap-fishers-fishers"]',
  5
);

-- ============================================================
-- TEAM AFFILIATIONS
-- ============================================================

-- Union Jack Pub - Liverpool FC (LFC Indy), USMNT (American Outlaws), Indy Eleven (Brickyard Battalion)
INSERT OR IGNORE INTO bar_teams (bar_id, team_slug, team_name)
SELECT id, 'liverpool', 'Liverpool FC' FROM bars WHERE slug = 'union-jack-pub-indianapolis';
INSERT OR IGNORE INTO bar_teams (bar_id, team_slug, team_name)
SELECT id, 'usmnt', 'US Men''s National Team' FROM bars WHERE slug = 'union-jack-pub-indianapolis';
INSERT OR IGNORE INTO bar_teams (bar_id, team_slug, team_name)
SELECT id, 'indy-eleven', 'Indy Eleven' FROM bars WHERE slug = 'union-jack-pub-indianapolis';

-- Chatham Tap Mass Ave - Arsenal FC (Indy Gooners origin), Manchester United FC (MUFC Indy origin)
INSERT OR IGNORE INTO bar_teams (bar_id, team_slug, team_name)
SELECT id, 'arsenal', 'Arsenal FC' FROM bars WHERE slug = 'chatham-tap-mass-ave';
INSERT OR IGNORE INTO bar_teams (bar_id, team_slug, team_name)
SELECT id, 'manchester-united', 'Manchester United FC' FROM bars WHERE slug = 'chatham-tap-mass-ave';

-- Centerpoint Brewing - Tottenham Hotspur (Indy Spurs)
INSERT OR IGNORE INTO bar_teams (bar_id, team_slug, team_name)
SELECT id, 'tottenham', 'Tottenham Hotspur' FROM bars WHERE slug = 'centerpoint-brewing-indianapolis';

-- Brew Link Brewpub - Manchester United FC (MUFC Indy current home)
INSERT OR IGNORE INTO bar_teams (bar_id, team_slug, team_name)
SELECT id, 'manchester-united', 'Manchester United FC' FROM bars WHERE slug = 'brew-link-brewpub-indianapolis';

-- Ralston's Drafthouse - FC Bayern Munich
INSERT OR IGNORE INTO bar_teams (bar_id, team_slug, team_name)
SELECT id, 'bayern-munich', 'FC Bayern Munich' FROM bars WHERE slug = 'ralstons-drafthouse-indianapolis';

-- Chatham Tap Fishers - Arsenal FC (Indy Gooners current home)
INSERT OR IGNORE INTO bar_teams (bar_id, team_slug, team_name)
SELECT id, 'arsenal', 'Arsenal FC' FROM bars WHERE slug = 'chatham-tap-fishers';

-- ============================================================
-- LEAGUE AFFILIATIONS
-- ============================================================

-- Union Jack Pub - Premier League, Champions League, MLS (Indy Eleven), World Cup, International
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'premier-league', 'Premier League' FROM bars WHERE slug = 'union-jack-pub-indianapolis';
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'champions-league', 'UEFA Champions League' FROM bars WHERE slug = 'union-jack-pub-indianapolis';
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'mls', 'MLS' FROM bars WHERE slug = 'union-jack-pub-indianapolis';
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'world-cup', 'FIFA World Cup' FROM bars WHERE slug = 'union-jack-pub-indianapolis';
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'international', 'International' FROM bars WHERE slug = 'union-jack-pub-indianapolis';

-- Chatham Tap Mass Ave - Premier League, Champions League, World Cup, FA Cup
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'premier-league', 'Premier League' FROM bars WHERE slug = 'chatham-tap-mass-ave';
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'champions-league', 'UEFA Champions League' FROM bars WHERE slug = 'chatham-tap-mass-ave';
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'world-cup', 'FIFA World Cup' FROM bars WHERE slug = 'chatham-tap-mass-ave';
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'fa-cup', 'FA Cup' FROM bars WHERE slug = 'chatham-tap-mass-ave';

-- Centerpoint Brewing - Premier League
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'premier-league', 'Premier League' FROM bars WHERE slug = 'centerpoint-brewing-indianapolis';

-- Brew Link Brewpub - Premier League
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'premier-league', 'Premier League' FROM bars WHERE slug = 'brew-link-brewpub-indianapolis';

-- Ralston's Drafthouse - Bundesliga, Premier League
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'bundesliga', 'Bundesliga' FROM bars WHERE slug = 'ralstons-drafthouse-indianapolis';
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'premier-league', 'Premier League' FROM bars WHERE slug = 'ralstons-drafthouse-indianapolis';

-- Tom's Watch Bar - Premier League, La Liga, Bundesliga, Serie A, Champions League, MLS, World Cup
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'premier-league', 'Premier League' FROM bars WHERE slug = 'toms-watch-bar-indianapolis';
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'la-liga', 'La Liga' FROM bars WHERE slug = 'toms-watch-bar-indianapolis';
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'bundesliga', 'Bundesliga' FROM bars WHERE slug = 'toms-watch-bar-indianapolis';
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'serie-a', 'Serie A' FROM bars WHERE slug = 'toms-watch-bar-indianapolis';
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'champions-league', 'UEFA Champions League' FROM bars WHERE slug = 'toms-watch-bar-indianapolis';
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'mls', 'MLS' FROM bars WHERE slug = 'toms-watch-bar-indianapolis';
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'world-cup', 'FIFA World Cup' FROM bars WHERE slug = 'toms-watch-bar-indianapolis';

-- Brockway Pub - Premier League
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'premier-league', 'Premier League' FROM bars WHERE slug = 'brockway-pub-carmel';

-- Chatham Tap Fishers - Premier League, Champions League, World Cup
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'premier-league', 'Premier League' FROM bars WHERE slug = 'chatham-tap-fishers';
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'champions-league', 'UEFA Champions League' FROM bars WHERE slug = 'chatham-tap-fishers';
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'world-cup', 'FIFA World Cup' FROM bars WHERE slug = 'chatham-tap-fishers';
