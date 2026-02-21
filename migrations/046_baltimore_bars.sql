-- Baltimore, Maryland Soccer Bars
-- Added: 2026-02-20
-- 9 soccer bars in Baltimore, Maryland
-- Strong EPL supporter culture: LFC Baltimore (Liverpool, OLSC since 2006), Charm City Gooners (Arsenal),
-- Charm City Reds (Man Utd, since 2010), Baltimore Spurs (Tottenham, since 2012), Baltimore Blaugrana (Barcelona)
-- Sources: Baltimore Sun, CBS Baltimore, Baltimore Magazine, Baltimore Fishbowl, Premier League USA Bar Finder,
--          GameWatch.info, GoodRec, First Touch Online, arsenal.com, tottenhamhotspur.com, liverpoolfc.com,
--          LFC Baltimore website, Baltimore Blaugrana website, Visit Baltimore, Yelp, TripAdvisor, Foursquare

-- Add Baltimore to cities table
INSERT OR IGNORE INTO cities (name, slug, state, is_world_cup_host) VALUES ('Baltimore', 'baltimore', 'Maryland', 0);

-- ============================================================
-- BARS
-- ============================================================

-- 1. Sláinte Irish Pub & Restaurant - THE soccer bar of Baltimore
INSERT INTO bars (slug, name, description, city, city_slug, state, neighborhood, address, opens_early, website, sources, source_count)
VALUES (
  'slainte-irish-pub-baltimore',
  'Sláinte Irish Pub & Restaurant',
  'Voted best soccer bar in Baltimore, Sláinte is the city''s undisputed football headquarters on the Fells Point waterfront. Open from 7 AM daily, the pub packs 18 HD TVs carrying every soccer channel: NBC, Fox Sports, Fox Soccer Plus, beIN Sports, Univision, UEFA channels, and MLS Direct Kick. Chelsea supporters pack the bar for early morning EPL matches with sound on, but all clubs are welcome at this diplomatic Irish pub. Established in 2004, Sláinte serves a full Irish breakfast alongside its eclectic gourmet menu and has been a Taste of Guinness winner. Live acoustic Irish sessions Thursday through Saturday nights.',
  'Baltimore', 'baltimore', 'Maryland', 'Fells Point',
  '1700 Thames St, Baltimore, MD 21231',
  1,
  'http://www.slaintepub.com',
  '["https://www.baltimoresun.com/food-drink/bs-fe-baltimore-soccer-bars-and-pubs-20220715-n4kpt5in6vbnfazzbyu2uyl4ua-list.html", "https://www.cbsnews.com/baltimore/news/best-bars-to-watch-premier-league-soccer-in-baltimore/", "https://www.baltimoremagazine.com/section/fooddrink/ultimate-sports-bar-guide/", "https://www.goodrec.com/blog/where-to-watch-soccer-baltimore-10-best-soccer-bars", "https://gamewatch.info/soccer-bars/cities/baltimore-md", "http://www.slaintepub.com/soccer.html"]',
  6
);

-- 2. Smaltimore - Official LFC Baltimore home
INSERT INTO bars (slug, name, description, city, city_slug, state, neighborhood, address, opens_early, website, sources, source_count)
VALUES (
  'smaltimore-baltimore',
  'Smaltimore',
  'The official home of LFC Baltimore, Baltimore''s one and only Official Liverpool Supporters Club founded in 2006. This Canton bar is a Reds-only zone on match days -- all Liverpool fans are invited for every Premier League, FA Cup, Champions League, and Carabao Cup match, with free shots poured every time Liverpool scores. Smaltimore features 48 draft lines with a dynamic beer exchange pricing system, a menu of burgers and sushi, and also serves as a fan club home for Penn State and the New York Giants. Opens at 10 AM on weekends for morning EPL fixtures.',
  'Baltimore', 'baltimore', 'Maryland', 'Canton',
  '2522 Fait Ave, Baltimore, MD 21224',
  1,
  'http://www.smaltimoremd.com',
  '["https://lfcbaltimore.com/", "https://www.liverpoolfc.com/fans/official-lfc-supporters-clubs/north-america", "https://www.baltimoremagazine.com/section/fooddrink/ultimate-sports-bar-guide/", "https://www.cbsnews.com/baltimore/news/best-bars-to-watch-premier-league-soccer-in-baltimore/", "https://gamewatch.info/soccer-bars/cities/baltimore-md"]',
  5
);

-- 3. Todd Conner's - Home of Charm City Reds (Manchester United)
INSERT INTO bars (slug, name, description, city, city_slug, state, neighborhood, address, opens_early, website, sources, source_count)
VALUES (
  'todd-conners-baltimore',
  'Todd Conner''s',
  'The official home of the Charm City Reds, Baltimore''s Manchester United supporters group that started in 2010 as a nomadic tribe of fans before finding a permanent pub at this Fells Point corner bar. Established in 2007 at the corner of Broadway and Aliceanna, Todd Conner''s has become the go-to for Red Devils match days with a loyal crowd, great craft beers, and outstanding pub food including the Maryland Grilled Cheese packed with crab meat and Old Bay. Open 11 AM to 2 AM daily.',
  'Baltimore', 'baltimore', 'Maryland', 'Fells Point',
  '700 S Broadway, Baltimore, MD 21231',
  0,
  'https://toddconners.com',
  '["https://www.baltimoresun.com/food-drink/bs-fe-baltimore-soccer-bars-and-pubs-20220715-n4kpt5in6vbnfazzbyu2uyl4ua-list.html", "https://firsttouchonline.com/man-utd-supporters-in-the-usa/", "https://www.baltimoremagazine.com/section/fooddrink/ultimate-sports-bar-guide/", "https://gamewatch.info/soccer-bars/cities/baltimore-md", "https://www.yelp.com/biz/todd-conners-baltimore"]',
  5
);

-- 4. Claddagh Pub - Baltimore's Original Irish & Soccer Pub
INSERT INTO bars (slug, name, description, city, city_slug, state, neighborhood, address, opens_early, website, sources, source_count)
VALUES (
  'claddagh-pub-baltimore',
  'Claddagh Pub',
  'Baltimore''s original Irish and soccer pub, family-owned since 1995 in the heart of Canton on O''Donnell Street. The Claddagh is a continuation of a family-owned Irish pub that operated on Chase Street downtown in the 1970s and 80s. With multiple bars, tons of TVs for match day viewing, a lively courtyard, and regular live music, it draws soccer fans alongside lovers of their renowned crab cakes and wings. Opens early on weekends -- 9 AM Saturday and Sunday -- for morning Premier League and Champions League action. Free oysters on the half shell during big sporting events.',
  'Baltimore', 'baltimore', 'Maryland', 'Canton',
  '2918 O''Donnell St, Baltimore, MD 21224',
  1,
  'https://claddaghbaltimore.com',
  '["https://claddaghbaltimore.com/", "https://gamewatch.info/soccer-bars/cities/baltimore-md", "https://www.yelp.com/biz/claddagh-pub-baltimore-2", "https://www.tripadvisor.com/Restaurant_Review-g60811-d492694-Reviews-Claddagh_Pub-Baltimore_Maryland.html"]',
  4
);

-- 5. Abbey Burger Bistro (Fells Point) - West Ham United fans
INSERT INTO bars (slug, name, description, city, city_slug, state, neighborhood, address, opens_early, website, sources, source_count)
VALUES (
  'abbey-burger-fells-point-baltimore',
  'Abbey Burger Bistro',
  'The Fells Point outpost of Baltimore''s beloved burger chain is where West Ham United supporters gather for Premier League matches. Nearly every inch of the walls is covered in HD TVs from the front of the bar through the dining room, making it an ideal game-watching spot. Owner Russ Miller built the Abbey''s soccer identity from the ground up -- the restaurant also hosted the Charm City Gooners (Arsenal) at its now-closed Federal Hill location for over a decade. The Fells Point menu features exotic game burgers including wild boar, red deer, and camel alongside Guinness drafts.',
  'Baltimore', 'baltimore', 'Maryland', 'Fells Point',
  '811 S Broadway, Baltimore, MD 21231',
  0,
  'https://www.abbeyburger.com',
  '["https://www.baltimoresun.com/food-drink/bs-fe-baltimore-soccer-bars-and-pubs-20220715-n4kpt5in6vbnfazzbyu2uyl4ua-list.html", "https://www.cbsnews.com/baltimore/news/best-bars-to-watch-premier-league-soccer-in-baltimore/", "https://www.baltimoremagazine.com/section/fooddrink/ultimate-sports-bar-guide/", "https://gamewatch.info/soccer-bars/cities/baltimore-md"]',
  4
);

-- 6. Lighthouse Tavern - Official Baltimore Spurs home (Tottenham)
INSERT INTO bars (slug, name, description, city, city_slug, state, neighborhood, address, opens_early, website, sources, source_count)
VALUES (
  'lighthouse-tavern-baltimore',
  'Lighthouse Tavern',
  'The official clubhouse of the Baltimore Spurs, a Tottenham Hotspur supporters club founded in 2012 that now boasts 87+ members. Located between the Fells Point and Canton neighborhoods on Clinton Street, the Lighthouse sits across from a soccer field and is the perfect post-match hangout. The cozy sports bar features outside tables, multiple TVs, great beer selection, and a welcoming neighborhood atmosphere. The Baltimore Spurs were inspired by a 2012 pre-season friendly where Spurs drew 0-0 with Liverpool in front of 40,000 fans at M&T Bank Stadium.',
  'Baltimore', 'baltimore', 'Maryland', 'Canton',
  '1226 S Clinton St, Baltimore, MD 21224',
  0,
  'https://www.yelp.com/biz/lighthouse-tavern-baltimore',
  '["https://www.tottenhamhotspur.com/fans/supporters-clubs/join-a-club/baltimore-spurs/", "https://firsttouchonline.com/tottenham-fans-in-the-usa/", "https://www.baltimoremagazine.com/section/fooddrink/ultimate-sports-bar-guide/", "https://www.yelp.com/biz/lighthouse-tavern-baltimore"]',
  4
);

-- 7. Max's Taphouse - Baltimore Blaugrana (Barcelona) watch parties
INSERT INTO bars (slug, name, description, city, city_slug, state, neighborhood, address, opens_early, website, sources, source_count)
VALUES (
  'maxs-taphouse-baltimore',
  'Max''s Taphouse',
  'Family-owned since 1986, Max''s Taphouse in Fells Point is a Baltimore institution and one of the most iconic beer bars in the country with 114 draft lines, 4 hand-pulled cask lines, and over 1,000 bottles and cans. It''s also the official watch party home of Baltimore Blaugrana, the local FC Barcelona supporters club (penya) that gathers for Champions League and La Liga matches. The main bar, Mobtown Lounge, and spacious outdoor seating all offer vibrant game-day atmospheres. In-house smoked BBQ pairs perfectly with any European fixture.',
  'Baltimore', 'baltimore', 'Maryland', 'Fells Point',
  '737 S Broadway, Baltimore, MD 21231',
  0,
  'https://maxs.com',
  '["https://www.baltimoreblaugrana.com/", "https://www.goodrec.com/blog/where-to-watch-soccer-baltimore-10-best-soccer-bars", "https://baltimore.org/listings/maxs-taphouse/", "https://www.yelp.com/biz/maxs-taphouse-baltimore-2"]',
  4
);

-- 8. Liv's Tavern - Charm City Gooners (Arsenal) current home
INSERT INTO bars (slug, name, description, city, city_slug, state, neighborhood, address, opens_early, website, sources, source_count)
VALUES (
  'livs-tavern-baltimore',
  'Liv''s Tavern',
  'The current match day home of the Charm City Gooners, Baltimore''s official Arsenal America branch with 250+ members established in 2009. Located in Federal Hill on Charles Street, Liv''s Tavern took over the beloved Mother''s space and features a mammoth 18-by-8-foot screen -- one of the biggest in the neighborhood -- making it a premier destination for watching Arsenal and other Premier League matches. The Gooners previously gathered at Abbey Burger Bistro (Federal Hill, now closed) before moving here. Named after the co-owner''s daughter, the tavern is dedicated to community.',
  'Baltimore', 'baltimore', 'Maryland', 'Federal Hill',
  '1113 S Charles St, Baltimore, MD 21230',
  1,
  'https://www.livstavern.com',
  '["https://www.instagram.com/charmcitygooners/", "https://www.arsenal.com/usa/fanzone-usa/usa-supporters-club/baltimore-md", "https://www.thebanner.com/culture/food-drink/livs-tavern-federal-hill-mothers-purple-patio-BG7XXZNOVZHRZHS5EDUAHSLT4M/", "https://www.southbmore.com/2025/03/12/livs-tavern-to-replace-mothers-in-federal-hill/"]',
  4
);

-- 9. Captain Larry's - Neighborhood soccer pub in Riverside
INSERT INTO bars (slug, name, description, city, city_slug, state, neighborhood, address, opens_early, website, sources, source_count)
VALUES (
  'captain-larrys-baltimore',
  'Captain Larry''s',
  'A South Baltimore neighborhood bar and grill with a unique local-meets-Latvian flair, Captain Larry''s in Riverside is a registered soccer pub on Live Soccer TV and GameWatch.info. The menu features fresh local favorites like jumbo lump crab cakes, fish tacos, and daily seasonal specials alongside local art shows every other month. Family-friendly with weekend hours starting at noon on Saturdays and 10 AM on Sundays. A quieter alternative to the Fells Point and Canton soccer bar clusters.',
  'Baltimore', 'baltimore', 'Maryland', 'Riverside',
  '601 E Fort Ave, Baltimore, MD 21230',
  0,
  'https://www.yelp.com/biz/captain-larrys-bar-and-grill-baltimore-2',
  '["https://www.livesoccertv.com/pubs/maryland/baltimore/captain-larrys/", "https://gamewatch.info/soccer-bars/cities/baltimore-md", "https://www.yelp.com/biz/captain-larrys-bar-and-grill-baltimore-2"]',
  3
);

-- ============================================================
-- TEAM AFFILIATIONS
-- ============================================================

-- Smaltimore - Liverpool FC (LFC Baltimore, OLSC since 2006)
INSERT OR IGNORE INTO bar_teams (bar_id, team_slug, team_name)
SELECT id, 'liverpool', 'Liverpool FC' FROM bars WHERE slug = 'smaltimore-baltimore';

-- Todd Conner's - Manchester United FC (Charm City Reds, since 2010)
INSERT OR IGNORE INTO bar_teams (bar_id, team_slug, team_name)
SELECT id, 'manchester-united', 'Manchester United FC' FROM bars WHERE slug = 'todd-conners-baltimore';

-- Abbey Burger Fells Point - West Ham United
INSERT OR IGNORE INTO bar_teams (bar_id, team_slug, team_name)
SELECT id, 'west-ham', 'West Ham United' FROM bars WHERE slug = 'abbey-burger-fells-point-baltimore';

-- Lighthouse Tavern - Tottenham Hotspur (Baltimore Spurs, since 2012)
INSERT OR IGNORE INTO bar_teams (bar_id, team_slug, team_name)
SELECT id, 'tottenham-hotspur', 'Tottenham Hotspur' FROM bars WHERE slug = 'lighthouse-tavern-baltimore';

-- Max's Taphouse - FC Barcelona (Baltimore Blaugrana)
INSERT OR IGNORE INTO bar_teams (bar_id, team_slug, team_name)
SELECT id, 'barcelona', 'FC Barcelona' FROM bars WHERE slug = 'maxs-taphouse-baltimore';

-- Liv's Tavern - Arsenal FC (Charm City Gooners, 250+ members)
INSERT OR IGNORE INTO bar_teams (bar_id, team_slug, team_name)
SELECT id, 'arsenal', 'Arsenal FC' FROM bars WHERE slug = 'livs-tavern-baltimore';

-- Slainte - Chelsea FC (Chelsea supporters pack the bar)
INSERT OR IGNORE INTO bar_teams (bar_id, team_slug, team_name)
SELECT id, 'chelsea', 'Chelsea FC' FROM bars WHERE slug = 'slainte-irish-pub-baltimore';

-- ============================================================
-- LEAGUE AFFILIATIONS
-- ============================================================

-- Sláinte - Premier League, Champions League, MLS, FA Cup, La Liga, World Cup
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'premier-league', 'Premier League' FROM bars WHERE slug = 'slainte-irish-pub-baltimore';
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'champions-league', 'UEFA Champions League' FROM bars WHERE slug = 'slainte-irish-pub-baltimore';
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'mls', 'MLS' FROM bars WHERE slug = 'slainte-irish-pub-baltimore';
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'fa-cup', 'FA Cup' FROM bars WHERE slug = 'slainte-irish-pub-baltimore';
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'la-liga', 'La Liga' FROM bars WHERE slug = 'slainte-irish-pub-baltimore';
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'world-cup', 'FIFA World Cup' FROM bars WHERE slug = 'slainte-irish-pub-baltimore';

-- Smaltimore - Premier League, FA Cup, Champions League, League Cup
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'premier-league', 'Premier League' FROM bars WHERE slug = 'smaltimore-baltimore';
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'fa-cup', 'FA Cup' FROM bars WHERE slug = 'smaltimore-baltimore';
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'champions-league', 'UEFA Champions League' FROM bars WHERE slug = 'smaltimore-baltimore';

-- Todd Conner's - Premier League
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'premier-league', 'Premier League' FROM bars WHERE slug = 'todd-conners-baltimore';

-- Claddagh Pub - Premier League, Champions League, World Cup
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'premier-league', 'Premier League' FROM bars WHERE slug = 'claddagh-pub-baltimore';
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'champions-league', 'UEFA Champions League' FROM bars WHERE slug = 'claddagh-pub-baltimore';
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'world-cup', 'FIFA World Cup' FROM bars WHERE slug = 'claddagh-pub-baltimore';

-- Abbey Burger Fells Point - Premier League
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'premier-league', 'Premier League' FROM bars WHERE slug = 'abbey-burger-fells-point-baltimore';

-- Lighthouse Tavern - Premier League
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'premier-league', 'Premier League' FROM bars WHERE slug = 'lighthouse-tavern-baltimore';

-- Max's Taphouse - La Liga, Champions League
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'la-liga', 'La Liga' FROM bars WHERE slug = 'maxs-taphouse-baltimore';
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'champions-league', 'UEFA Champions League' FROM bars WHERE slug = 'maxs-taphouse-baltimore';

-- Liv's Tavern - Premier League
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'premier-league', 'Premier League' FROM bars WHERE slug = 'livs-tavern-baltimore';

-- Captain Larry's - Premier League, World Cup
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'premier-league', 'Premier League' FROM bars WHERE slug = 'captain-larrys-baltimore';
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'world-cup', 'FIFA World Cup' FROM bars WHERE slug = 'captain-larrys-baltimore';
