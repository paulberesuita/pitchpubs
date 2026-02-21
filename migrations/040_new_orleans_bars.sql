-- New Orleans, Louisiana Soccer Bars
-- Added: 2026-02-20
-- 8 soccer bars in New Orleans, Louisiana (first bars in the state)
-- Finn McCool's is the undisputed soccer epicenter with 4+ supporter clubs
-- Sources: WWNO, nola.com/Times-Picayune, Arsenal.com, CelticBars.com, Tottenham Hotspur official,
--          American Outlaws, Premier League USA Bar Finder, GoodRec, SportsBars.com, Foursquare,
--          GameWatch.info, TripAdvisor, Yelp, official bar websites

-- Add city to cities table
INSERT OR IGNORE INTO cities (name, slug, state, is_world_cup_host) VALUES ('New Orleans', 'new-orleans', 'Louisiana', 0);

-- ============================================================
-- BARS
-- ============================================================

-- 1. Finn McCool's Irish Pub - THE soccer bar of New Orleans
INSERT INTO bars (slug, name, description, city, city_slug, state, neighborhood, address, opens_early, website, sources, source_count)
VALUES (
  'finn-mccools-new-orleans',
  'Finn McCool''s Irish Pub',
  'The undisputed soccer bar of New Orleans and arguably the most storied football pub in the American South. Owned by Galway native Sean Kennedy since 2016, Finn McCool''s is home to at least four supporter groups: the Krewe of Arsenal (New Orleans Gooners, founded 2010), the New Orleans Celtic Supporters Club, the New Orleans Spurs (official Tottenham Hotspur OSC), and a regular contingent of Liverpool, Chelsea, Everton, and Rangers fans. The pub opens at 10 AM on weekends for the full English Premier League schedule and shows Scottish Premiership, Champions League, MLS, and every US National Team match. During the 2022 World Cup, WWNO reported the pub became a ''melting pot of cultures'' with fans from France, Morocco, Croatia, Australia, and more. A 2009 memoir -- ''Finn McCool''s Football Club'' by Stephen Rea -- documented the pub''s soccer community and its survival through Hurricane Katrina. Nine indoor TVs and two outdoor screens. Over 50 Irish whiskeys and perfectly poured Guinness.',
  'New Orleans', 'new-orleans', 'Louisiana', 'Mid-City',
  '3701 Banks St, New Orleans, LA 70119',
  1,
  'https://finnmccools.com/',
  '["https://www.wwno.org/news/2022-12-09/during-the-world-cup-finn-mccools-becomes-a-melting-pot-of-cultures-were-open-to-any-team", "https://www.arsenal.com/usa/fanzone-usa/usa-supporters-club/new-orleans-la", "https://www.celticbars.com/celtic-bar/finn-mccools-irish-pub/", "https://www.tottenhamhotspur.com/fans/supporters-clubs/join-a-club/new-orleans-spurs/", "https://www.premierleague.com/en/usa-bar-finder", "https://www.goodrec.com/blog/where-to-watch-soccer-new-orleans-10-best-soccer-bars", "https://sportsbars.com/best-sports-bars-in-new-orleans-2025-the-definitive-guide-to-real-venues/", "https://www.yelp.com/biz/finn-mccools-irish-pub-new-orleans"]',
  8
);

-- 2. The Rusty Nail - 25-screen soccer and whiskey destination
INSERT INTO bars (slug, name, description, city, city_slug, state, neighborhood, address, opens_early, website, sources, source_count)
VALUES (
  'rusty-nail-new-orleans',
  'The Rusty Nail',
  'Where the Lower Garden District meets the Warehouse District, The Rusty Nail defines international sports viewing in New Orleans with 25 screens in a 180-person space. The bar specializes in Premier League and Champions League matches, opening early on weekends for morning kickoffs. Beyond the screens, The Rusty Nail is a serious whiskey destination with over 275 unique bottles spanning American, Irish, Scotch, and international varieties, plus 16 rotating craft beer taps. The covered tropical patio is a standout feature, and neighboring Sidecar Patio and Oyster Bar provides food. Rated 4.6 with over 800 reviews on Yelp.',
  'New Orleans', 'new-orleans', 'Louisiana', 'Lower Garden District',
  '1100 Constance St, New Orleans, LA 70130',
  1,
  'https://rustynailnola.com/',
  '["https://sportsbars.com/best-sports-bars-in-new-orleans-2025-the-definitive-guide-to-real-venues/", "https://www.goodrec.com/blog/where-to-watch-soccer-new-orleans-10-best-soccer-bars", "https://foursquare.com/top-places/new-orleans/best-places-soccer", "https://www.whereyat.com/best-new-orleans-sports-bars", "https://www.yelp.com/biz/the-rusty-nail-new-orleans"]',
  5
);

-- 3. J&J's Sports Lounge - European soccer HQ in the Bywater
INSERT INTO bars (slug, name, description, city, city_slug, state, neighborhood, address, opens_early, website, sources, source_count)
VALUES (
  'jjs-sports-lounge-new-orleans',
  'J&J''s Sports Lounge',
  'Tucked in the Bywater at the corner of France and Dauphine, J&J''s is New Orleans'' self-proclaimed European Soccer headquarters and home of World Cup Madness. The neighborhood bar has a massive projector screen plus flat-screen TVs throughout, carrying all NFL and MLB packages alongside a deep commitment to European football. Open daily from 9 AM, J&J''s offers 12 draft beers with $3 PBRs always available, pool tables, a jukebox, and a courtyard with the pub cats roaming freely. The bar hosts cookouts and potlucks during big matches, creating a genuinely communal atmosphere.',
  'New Orleans', 'new-orleans', 'Louisiana', 'Bywater',
  '800 France St, New Orleans, LA 70117',
  1,
  'http://www.jjssportslounge.com/',
  '["https://www.goodrec.com/blog/where-to-watch-soccer-new-orleans-10-best-soccer-bars", "https://www.neworleans.com/listing/j&js-sport-lounge/33948/", "https://www.tripadvisor.com/Attraction_Review-g60864-d5834156-Reviews-J_J_s_Sports_Lounge-New_Orleans_Louisiana.html", "https://www.yelp.com/biz/j-and-js-sports-lounge-new-orleans"]',
  4
);

-- 4. The Bell - British pub on Esplanade Avenue
INSERT INTO bars (slug, name, description, city, city_slug, state, neighborhood, address, opens_early, website, sources, source_count)
VALUES (
  'the-bell-new-orleans',
  'The Bell',
  'A proper British pub perched along sunny Esplanade Avenue in a historic house with a wraparound porch and sun-drenched patio. The Bell brings the spirit of the London gastropub to New Orleans with a menu inspired by institutions like Sweetings, St. John, and Rochelle Canteen, alongside a raw bar and oyster program. Listed on the official Premier League USA Bar Finder, the pub shows soccer matches on two TVs in the pub room. The fireplace-warmed dining room and lush patio plantings create an atmosphere more refined than a typical sports bar -- this is for fans who want a perfectly poured Guinness and fried oysters with their morning fixture.',
  'New Orleans', 'new-orleans', 'Louisiana', 'Faubourg St. John',
  '3125 Esplanade Ave, New Orleans, LA 70119',
  0,
  'https://thebellnola.com/',
  '["https://www.premierleague.com/en/usa-bar-finder", "https://www.nola.com/gambit/food_drink/the-bell-serves-british-pub-fare-in-faugborg-st-john/article_14fd3f9e-f9ed-11ef-a19b-eb21f78c4830.html", "https://www.yelp.com/biz/the-bell-new-orleans"]',
  3
);

-- 5. The Prytania Bar - Neighborhood bar on Premier League Bar Finder
INSERT INTO bars (slug, name, description, city, city_slug, state, neighborhood, address, opens_early, website, sources, source_count)
VALUES (
  'prytania-bar-new-orleans',
  'The Prytania Bar',
  'A simple, laid-back neighborhood watering hole on the cusp of the historic Garden District, listed on the official Premier League USA Bar Finder. The Prytania Bar features 7 TVs with a great sound system around a 360-degree bar, and opens at 10:30 AM on Saturdays and 11:30 AM on Sundays for weekend EPL fixtures. The bar runs a generous 2-for-1 happy hour from 3-7 PM Monday through Friday with daily rotating drink specials. Live music adds to the atmosphere on select nights. No frills, no pretension -- just the match, a cold one, and good company.',
  'New Orleans', 'new-orleans', 'Louisiana', 'Garden District',
  '3445 Prytania St, New Orleans, LA 70115',
  1,
  'https://www.facebook.com/PrytaniaBar/',
  '["https://www.premierleague.com/en/usa-bar-finder", "https://gamewatch.info/teams/michigan-wolverines/bars/the-prytania-bar-3445-prytania-street-touro-new-orleans-la-united-states", "https://www.yelp.com/biz/the-prytania-bar-new-orleans-2"]',
  3
);

-- 6. Cooter Brown's Tavern & Oyster Bar - Legendary since 1977
INSERT INTO bars (slug, name, description, city, city_slug, state, neighborhood, address, opens_early, website, sources, source_count)
VALUES (
  'cooter-browns-new-orleans',
  'Cooter Brown''s Tavern & Oyster Bar',
  'A New Orleans institution since 1977, Cooter Brown''s anchors the Riverbend neighborhood with 30 screens for 200 guests and an unrivaled beer selection of over 400 bottles plus 45 taps. The bar carries every sports package through DirecTV including international soccer, and the TVs are tuned to Premier League, Champions League, and World Cup matches alongside NFL and college games. The oyster bar is the real draw beyond the screens -- raw Louisiana oysters at half price on Tuesdays. The vintage sports memorabilia and 21-and-over-only policy keep the atmosphere decidedly adult.',
  'New Orleans', 'new-orleans', 'Louisiana', 'Riverbend',
  '509 S Carrollton Ave, New Orleans, LA 70118',
  0,
  'http://www.cooterbrowns.com/',
  '["https://www.goodrec.com/blog/where-to-watch-soccer-new-orleans-10-best-soccer-bars", "https://foursquare.com/top-places/new-orleans/best-places-soccer", "https://www.whereyat.com/best-new-orleans-sports-bars", "https://www.yelp.com/biz/cooter-browns-new-orleans"]',
  4
);

-- 7. Rendezvous Tavern - American Outlaws NOLA chapter home
INSERT INTO bars (slug, name, description, city, city_slug, state, neighborhood, address, opens_early, website, sources, source_count)
VALUES (
  'rendezvous-tavern-new-orleans',
  'Rendezvous Tavern',
  'The official chapter bar of the American Outlaws New Orleans, the city''s US National Team supporters group. This classic Irish Channel dive at 3101 Magazine Street has been many things in its 50-plus-year history -- liquor store, even a brothel -- but today it is an unpretentious neighborhood bar with 12 game TVs, billiards, darts, and the cheapest drink prices in town. AO NOLA gathers here for USMNT, USWNT, and World Cup qualifiers with sound on and flags flying. Open late (until 5 AM on weekends), with amazing food pop-ups and a 3-8 PM happy hour Monday through Friday.',
  'New Orleans', 'new-orleans', 'Louisiana', 'Irish Channel',
  '3101 Magazine St, New Orleans, LA 70115',
  0,
  'https://therendezvoustavern.com/',
  '["https://theamericanoutlaws.com/chapters/new-orleans", "https://www.yelp.com/biz/the-rendezvous-tavern-new-orleans", "https://magazinestreet.com/merchant/the-rendezvous-tavern/"]',
  3
);

-- 8. Ryan's Irish Pub - French Quarter Irish pub with soccer
INSERT INTO bars (slug, name, description, city, city_slug, state, neighborhood, address, opens_early, website, sources, source_count)
VALUES (
  'ryans-irish-pub-new-orleans',
  'Ryan''s Irish Pub',
  'A laid-back Irish dive in the French Quarter on Decatur Street, Ryan''s has been a go-to for visitors and locals looking to catch Premier League matches since long before soccer was trendy in America. Multiple widescreen TVs throughout the bar show English football alongside NFL and other sports, and TripAdvisor forum regulars consistently recommend Ryan''s for EPL viewing in the Quarter. Open from 10:30 AM daily (10 AM on Fridays and Saturdays), the pub does not serve food but staff will happily point you to nearby hidden gems. The energy is electric yet relaxed -- exactly what you want from a French Quarter pub on match day.',
  'New Orleans', 'new-orleans', 'Louisiana', 'French Quarter',
  '241 Decatur St, New Orleans, LA 70130',
  1,
  'https://www.yelp.com/biz/ryans-irish-pub-new-orleans',
  '["https://www.tripadvisor.com/ShowTopic-g60864-i34-k13926922-Sports_Bars_that_would_air_UK_Premier_League_Football-New_Orleans_Louisiana.html", "https://gamewatch.info/teams/st-louis-blues/bars/ryan-s-irish-pub-inc-241-decatur-street-french-quarter-new-orleans-la-united-states", "https://www.yelp.com/biz/ryans-irish-pub-new-orleans"]',
  3
);

-- ============================================================
-- TEAM AFFILIATIONS
-- ============================================================

-- Finn McCool's - Krewe of Arsenal (Arsenal), New Orleans CSC (Celtic), New Orleans Spurs (Tottenham), USMNT
INSERT OR IGNORE INTO bar_teams (bar_id, team_slug, team_name)
SELECT id, 'arsenal', 'Arsenal FC' FROM bars WHERE slug = 'finn-mccools-new-orleans';
INSERT OR IGNORE INTO bar_teams (bar_id, team_slug, team_name)
SELECT id, 'celtic', 'Celtic FC' FROM bars WHERE slug = 'finn-mccools-new-orleans';
INSERT OR IGNORE INTO bar_teams (bar_id, team_slug, team_name)
SELECT id, 'tottenham-hotspur', 'Tottenham Hotspur' FROM bars WHERE slug = 'finn-mccools-new-orleans';
INSERT OR IGNORE INTO bar_teams (bar_id, team_slug, team_name)
SELECT id, 'usmnt', 'US Men''s National Team' FROM bars WHERE slug = 'finn-mccools-new-orleans';

-- Rendezvous Tavern - American Outlaws NOLA (USMNT)
INSERT OR IGNORE INTO bar_teams (bar_id, team_slug, team_name)
SELECT id, 'usmnt', 'US Men''s National Team' FROM bars WHERE slug = 'rendezvous-tavern-new-orleans';

-- ============================================================
-- LEAGUE AFFILIATIONS
-- ============================================================

-- Finn McCool's - Premier League, Scottish Premiership, Champions League, MLS, World Cup
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'premier-league', 'Premier League' FROM bars WHERE slug = 'finn-mccools-new-orleans';
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'scottish-premiership', 'Scottish Premiership' FROM bars WHERE slug = 'finn-mccools-new-orleans';
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'champions-league', 'UEFA Champions League' FROM bars WHERE slug = 'finn-mccools-new-orleans';
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'mls', 'MLS' FROM bars WHERE slug = 'finn-mccools-new-orleans';
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'world-cup', 'FIFA World Cup' FROM bars WHERE slug = 'finn-mccools-new-orleans';

-- The Rusty Nail - Premier League, Champions League
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'premier-league', 'Premier League' FROM bars WHERE slug = 'rusty-nail-new-orleans';
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'champions-league', 'UEFA Champions League' FROM bars WHERE slug = 'rusty-nail-new-orleans';

-- J&J's - Premier League, Champions League, World Cup
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'premier-league', 'Premier League' FROM bars WHERE slug = 'jjs-sports-lounge-new-orleans';
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'champions-league', 'UEFA Champions League' FROM bars WHERE slug = 'jjs-sports-lounge-new-orleans';
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'world-cup', 'FIFA World Cup' FROM bars WHERE slug = 'jjs-sports-lounge-new-orleans';

-- The Bell - Premier League
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'premier-league', 'Premier League' FROM bars WHERE slug = 'the-bell-new-orleans';

-- The Prytania Bar - Premier League
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'premier-league', 'Premier League' FROM bars WHERE slug = 'prytania-bar-new-orleans';

-- Cooter Brown's - Premier League, Champions League, World Cup
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'premier-league', 'Premier League' FROM bars WHERE slug = 'cooter-browns-new-orleans';
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'champions-league', 'UEFA Champions League' FROM bars WHERE slug = 'cooter-browns-new-orleans';
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'world-cup', 'FIFA World Cup' FROM bars WHERE slug = 'cooter-browns-new-orleans';

-- Rendezvous Tavern - World Cup, MLS
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'world-cup', 'FIFA World Cup' FROM bars WHERE slug = 'rendezvous-tavern-new-orleans';
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'mls', 'MLS' FROM bars WHERE slug = 'rendezvous-tavern-new-orleans';

-- Ryan's Irish Pub - Premier League
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'premier-league', 'Premier League' FROM bars WHERE slug = 'ryans-irish-pub-new-orleans';
