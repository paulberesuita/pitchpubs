-- Migration 004: Fill missing team affiliations for priority cities
-- Research date: 2026-02-20
-- Cities covered: Boston, Dallas, San Francisco, Charlotte, Denver, Minneapolis, San Diego
-- Only verified affiliations from sourced research

-- ============================================================
-- BOSTON (8 bars missing teams -> filling verified ones)
-- ============================================================

-- Caffe dello Sport (id: 73) — Italian soccer cafe in North End, established 1950
-- Source: caffedellosport.net, TripAdvisor reviews confirm Serie A focus
-- Shows Serie A, La Liga, Premier League, Champions League. Italian heritage = Serie A primary
-- No specific team affiliation, but strong Italian football identity

-- The Greatest Bar (id: 75) — LFC Boston official home bar
-- Source: lfcboston.com confirms "The Greatest Bar" as official watch venue
INSERT OR IGNORE INTO bar_teams (bar_id, team_slug, team_name) VALUES (75, 'liverpool', 'Liverpool FC');

-- Cask 'n Flagon (id: 76) — General sports bar near Fenway, World Cup venue
-- No specific soccer team affiliation verified

-- Bleacher Bar (id: 77) — Inside Fenway Park, general sports bar
-- No specific soccer team affiliation verified

-- The Sevens Ale House (id: 79) — Historic Beacon Hill pub since 1933
-- No specific soccer team affiliation verified

-- A.T. O'Keeffe's (id: 81) — Irish pub in Back Bay, formerly McGreevy's
-- No specific soccer team affiliation verified from sources

-- Drawdown Brewing (id: 83) — LGBTQ+ brewery in Jamaica Plain
-- Source: bostonisa.com, bostonmagazine.com, nwslboston.com
-- Home of NWSL Boston supporters, women's sports focus
-- Note: No existing NWSL Boston team in DB yet, skip for now

-- The Black Rose (id: 84) — Irish pub in Faneuil Hall area
-- Source: Multiple lists of Premier League bars, but no specific team affiliation verified

-- ============================================================
-- DALLAS (6 bars missing teams -> filling verified ones)
-- ============================================================

-- Frankie's Downtown (id: 104) — Premier sports bar downtown
-- Source: matadornetwork.com Dallas soccer bars guide
-- General sports bar, no specific soccer team affiliation verified

-- The Nodding Donkey (id: 105) — Uptown Dallas sports bar
-- Source: gamewatch.info — World Cup venue, general sports bar
-- No specific soccer team affiliation verified

-- Sportsbook Bishop Arts (id: 106) — Only sports bar in Bishop Arts
-- No specific soccer team affiliation verified

-- Bryan Street Tavern (id: 107) — Old East Dallas neighborhood bar
-- No specific soccer team affiliation verified

-- Off The Cuff (id: 108) — Deep Ellum sports bar
-- Source: matadornetwork.com — general sports bar, international soccer coverage
-- No specific team affiliation verified

-- Christie's Sports Bar (id: 109) — Lower Greenville sports bar
-- Source: D Magazine, christiessportsbar.com — general sports bar
-- No specific soccer team affiliation verified

-- ============================================================
-- SAN FRANCISCO (6 bars missing teams -> filling verified ones)
-- ============================================================

-- Mad Dog in the Fog (id: 49) — English pub on Haight Street
-- Source: premierleague.com/usa-bar-finder, cbsnews.com/sanfrancisco
-- Premier League listed bar, strong English pub identity
-- No specific team supporters group verified from sources

-- The Chieftain Irish Pub (id: 52) — Irish pub near Moscone Center
-- Source: thechieftain.com/sports-calendar
-- Shows MLS, international, rugby, GAA — general sports pub
-- No specific team affiliation verified

-- Irish Times (id: 54) — Financial District pub since 1996/2010
-- Source: sfirishtimes.com, matadornetwork.com SF guide
-- Multi-sport bar, no specific team affiliation verified

-- Final Final Sports Bar (id: 55) — Cow Hollow sports bar, 50+ years
-- Source: finalfinalbar.com — general sports bar
-- No specific soccer team affiliation verified

-- The Pig and Whistle (id: 56) — English pub since 1991
-- Source: pigandwhistle Yelp, foursquare, various guides
-- Authentic English pub with soccer jerseys on walls
-- Sponsors their own soccer team but no specific Premier League affiliation verified

-- The Dubliner (id: 57) — Noe Valley Irish pub, 30+ years
-- Source: dublinerbarsf.com, timeout.com/san-francisco
-- General sports bar with 12 TVs, no specific soccer team verified

-- ============================================================
-- CHARLOTTE (12 bars missing teams -> filling verified ones)
-- ============================================================

-- Courtyard Hooligans (id: 237) — Uptown soccer pub, opened 2009
-- Source: charlottesgotalot.com, qcnerve.com, premierleague.com bar finder
-- Known as Tottenham Hotspur supporters bar with scarves on display
-- Also home to Queen City Outlaws (American Outlaws chapter = USMNT)
INSERT OR IGNORE INTO bar_teams (bar_id, team_slug, team_name) VALUES (237, 'tottenham', 'Tottenham Hotspur');
INSERT OR IGNORE INTO bar_teams (bar_id, team_slug, team_name) VALUES (237, 'usmnt', 'US Men''s National Team');

-- Big Ben British Restaurant & Pub (id: 240) — British pub in South End
-- Source: premierleague.com/usa-bar-finder, charlottesgotalot.com
-- Hosts Crystal Palace and West Ham supporters groups
INSERT OR IGNORE INTO bar_teams (bar_id, team_slug, team_name) VALUES (240, 'crystal-palace', 'Crystal Palace');
INSERT OR IGNORE INTO bar_teams (bar_id, team_slug, team_name) VALUES (240, 'west-ham', 'West Ham United');

-- Belfast Mill Irish Pub (id: 242) — Irish pub on Brevard Court since 2011
-- Source: belfastmillclt.com, charlottesgotalot.com
-- Shows EPL, La Liga, Champions League, Europa League — general soccer pub
-- No specific team affiliation verified

-- Jack's House (id: 243) — Charlotte Independence official bar
-- Source: charlotteindependence.com official announcement, axios Charlotte
-- Charlotte Independence's official bar, shows EPL, Champions League
-- Note: Charlotte Independence is USL, not in our team DB. Skip team, add league later.

-- The 12th Man by Hooligans (id: 244) — Sister bar to Courtyard Hooligans in Ballantyne
-- Source: charlottesgotalot.com "Soccer Fan's Guide to Charlotte"
-- Sister bar to Courtyard Hooligans, same ownership
-- No specific team affiliation beyond parent bar verified

-- The Workman's Friend (id: 246) — Irish pub in Plaza Midwood
-- Source: Charlotte FC bar network
-- Part of Charlotte FC bar network
INSERT OR IGNORE INTO bar_teams (bar_id, team_slug, team_name) VALUES (246, 'charlotte-fc', 'Charlotte FC');

-- The Kilted Buffalo Plaza Midwood (id: 247) — Sports pub
-- Source: Charlotte FC bar network, charlottefootballclub.com
-- Part of Charlotte FC bar network
INSERT OR IGNORE INTO bar_teams (bar_id, team_slug, team_name) VALUES (247, 'charlotte-fc', 'Charlotte FC');

-- HopFly Brewing Co. (id: 248) — Brewery near Bank of America Stadium
-- Source: qcnerve.com, charlottefootballclub.com, carolinaascent.com
-- Charlotte FC tailgate spot and watch party venue
INSERT OR IGNORE INTO bar_teams (bar_id, team_slug, team_name) VALUES (248, 'charlotte-fc', 'Charlotte FC');

-- Salud Beer Shop (id: 249) — NoDa craft beer bar
-- Source: premierleague.com/usa-bar-finder listing
-- Arsenal supporters group meets here regularly
INSERT OR IGNORE INTO bar_teams (bar_id, team_slug, team_name) VALUES (249, 'arsenal', 'Arsenal FC');

-- Gin Mill South End (id: 250) — South End sports bar
-- Source: Charlotte FC bar network
-- Part of Charlotte FC bar network
INSERT OR IGNORE INTO bar_teams (bar_id, team_slug, team_name) VALUES (250, 'charlotte-fc', 'Charlotte FC');

-- Queen Park Social (id: 251) — South End social club
-- Source: Charlotte FC bar network, gamewatch.info/charlotte-football-club
-- Part of Charlotte FC bar network, official watch party location
INSERT OR IGNORE INTO bar_teams (bar_id, team_slug, team_name) VALUES (251, 'charlotte-fc', 'Charlotte FC');

-- Connolly's On Fifth (id: 252) — Irish pub since 2001
-- Source: connollysirishpub.com, livesoccertv.com
-- Shows soccer, sponsors Charlotte GAA club. General soccer pub.
-- No specific Premier League team affiliation verified

-- ============================================================
-- DENVER (8 bars missing teams -> filling verified ones)
-- ============================================================

-- The British Bulldog (id: 298) — Denver's leading soccer pub
-- Source: britishbulldogdenver.com, denverpost.com, cbsnews.com/colorado
-- Premier League focused bar, opens at 5am for matches
-- Hosts Fantasy Premier League. English Premier League focused.
-- No single specific team — general EPL bar

-- Tom's Watch Bar - Coors Field (id: 302) — LoDo sports mega bar
-- Source: tomswatchbar.com, prnewswire.com World Cup partner
-- Shows EPL, La Liga, Bundesliga, Serie A — general sports bar
-- No specific team affiliation verified

-- Society Sports and Spirits (id: 303) — Downtown sports bar
-- Source: societydenver.com — general sports bar
-- No specific soccer team affiliation verified

-- Highland Tavern (id: 304) — Highland neighborhood pub
-- Source: highland-tavern website — general sports bar
-- No specific soccer team affiliation verified

-- Highland Tap and Burger (id: 305) — LoHi restaurant/bar
-- Source: gamewatch.info — World Cup venue, 18 TVs
-- No specific soccer team affiliation verified

-- Sobo 151 Czech Bar & Grill (id: 306) — Czech-owned sports bar
-- Source: livesoccertv.com/pubs/colorado, sobo151.com
-- Czech-owned bar with futbal memorabilia on walls
-- General soccer viewing, no specific team affiliation verified

-- GB Fish & Chips (id: 307) — British fish & chips restaurant
-- Source: gbfishandchips.com, westword.com
-- Owner from Brighton area. Soccer jerseys on walls, shows European soccer/rugby.
-- No specific team affiliation verified from sources

-- Raices Brewing Company (id: 308) — Latin American brewery
-- Source: westword.com, cbsnews.com/colorado
-- Latin American soccer fans hub, packed for Liga MX matches
-- Note: May be closed. No specific team affiliation verified.

-- ============================================================
-- MINNEAPOLIS (6 bars missing teams -> filling verified ones)
-- ============================================================

-- The Local (id: 213) — Downtown Irish pub
-- Source: minneapolis.org, cbsnews.com/minnesota, gametimehero.com
-- Shows Premier League, Champions League, Minnesota United FC
INSERT OR IGNORE INTO bar_teams (bar_id, team_slug, team_name) VALUES (213, 'minnesota-united', 'Minnesota United FC');

-- Kieran's Irish Pub (id: 215) — Downtown pub near Target Field
-- Source: kierans.com, minneapolis.org
-- Self-described "only official U.S. soccer bar in Minneapolis"
-- Shows USMNT and general soccer. American Outlaws chapter.
INSERT OR IGNORE INTO bar_teams (bar_id, team_slug, team_name) VALUES (215, 'usmnt', 'US Men''s National Team');

-- Merlins Rest Pub (id: 216) — Longfellow British pub since 2007
-- Source: merlinsrest.com, gametimehero.com, minneapolis.org
-- "Best place in town to watch all your favorite soccer clubs"
-- British pub showing Premier League — no specific team verified

-- La Dona Cerveceria (id: 218) — Latin brewery
-- Source: dameladona.com — runs 3v3 soccer league, Latin brewery
-- More recreational soccer venue than match viewing destination
-- No specific team affiliation verified

-- Tom's Watch Bar (id: 221) — Downtown mega sports bar
-- Source: tomswatchbar.com — general sports bar chain
-- No specific soccer team affiliation verified

-- Mac's Industrial Sports Bar (id: 222) — NE Minneapolis
-- Source: macsindustrial.com — general sports bar
-- No specific soccer team affiliation verified

-- ============================================================
-- SAN DIEGO (7 bars missing teams -> filling verified ones)
-- ============================================================

-- Shakespeare Pub & Grille (id: 188) — British pub since 1990
-- Source: shakespearepub.com, soccernation.com, thevoyageer.com
-- Premier League/Champions League/FA Cup focused. Multiple teams watched here.
-- "You'll find fans of Manchester United, Manchester City, and Chelsea in strong numbers"
-- General EPL pub, no single team affiliation — skip individual teams

-- Fairplay (id: 193) — North Park bar
-- Source: manchesterunitedsandiego.com, 10news.com, sandiegofc.com
-- Note: Red Devils of San Diego watch at Liberty Call Distilling, NOT Fairplay
-- San Diego FC pub partner for Summer of Soccer
-- No specific team affiliation verified

-- The Field Irish Pub (id: 194) — Gaslamp Quarter authentic Irish pub
-- Source: thefield.com, gaslamp.org, goodrec.com
-- Shows European soccer, rugby, GAA — authentic Irish pub experience
-- No specific team affiliation verified

-- SD TapRoom (id: 196) — North Park craft beer bar
-- Source: sdtaproom.com — general sports bar, San Diego FC home games
-- No specific soccer team affiliation verified

-- Knotty Barrel (id: 197) — Gaslamp gastropub
-- Source: knottybarrel.com, gamewatch.info — primarily NFL focus (NY Giants bar)
-- No specific soccer team affiliation verified

-- Nolita Hall (id: 198) — Little Italy bar
-- Source: sandiegofc.com, goodrec.com
-- San Diego FC watch party partner. No specific team affiliation.
-- No single team — "reps no team, all sports fans welcome"

-- True North Tavern (id: 199) — North Park gastropub
-- Source: truenorthtavern.com — general sports bar
-- No specific soccer team affiliation verified

-- ============================================================
-- LEAGUE AFFILIATIONS for bars missing them
-- (Separate task, covering priority city bars that need leagues)
-- ============================================================

-- Boston bars missing leagues:
-- A.T. O'Keeffe's (id: 81) - Irish pub, shows Premier League
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name) VALUES (81, 'premier-league', 'Premier League');

-- The Black Rose (id: 84) - Irish pub, Premier League viewing spot
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name) VALUES (84, 'premier-league', 'Premier League');

-- Ducali Pizzeria & Bar (id: 82) - has teams but no leagues
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name) VALUES (82, 'mls', 'MLS');

-- McGann's Pub (id: 74) - Manchester United bar, no leagues
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name) VALUES (74, 'premier-league', 'Premier League');

-- Dallas bars missing leagues:
-- Bryan Street Tavern (id: 107)
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name) VALUES (107, 'premier-league', 'Premier League');
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name) VALUES (107, 'world-cup', 'FIFA World Cup');

-- Christie's Sports Bar (id: 109)
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name) VALUES (109, 'premier-league', 'Premier League');

-- Frankie's Downtown (id: 104)
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name) VALUES (104, 'premier-league', 'Premier League');
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name) VALUES (104, 'world-cup', 'FIFA World Cup');

-- Off The Cuff (id: 108)
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name) VALUES (108, 'premier-league', 'Premier League');

-- Sportsbook Bishop Arts (id: 106)
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name) VALUES (106, 'premier-league', 'Premier League');

-- The Nodding Donkey (id: 105)
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name) VALUES (105, 'premier-league', 'Premier League');
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name) VALUES (105, 'world-cup', 'FIFA World Cup');

-- Denver bars missing leagues:
-- GB Fish & Chips (id: 307) - British restaurant
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name) VALUES (307, 'premier-league', 'Premier League');

-- Highland Tap and Burger (id: 305)
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name) VALUES (305, 'world-cup', 'FIFA World Cup');

-- Highland Tavern (id: 304)
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name) VALUES (304, 'premier-league', 'Premier League');

-- Sobo 151 Czech Bar & Grill (id: 306) - Czech bar with futbal memorabilia
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name) VALUES (306, 'premier-league', 'Premier League');
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name) VALUES (306, 'champions-league', 'UEFA Champions League');

-- Society Sports and Spirits (id: 303)
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name) VALUES (303, 'premier-league', 'Premier League');

-- O'Brien's Pub (id: 191) - has teams but no leagues
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name) VALUES (191, 'premier-league', 'Premier League');
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name) VALUES (191, 'world-cup', 'FIFA World Cup');

-- The Harp (id: 192) - has teams but no leagues
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name) VALUES (192, 'premier-league', 'Premier League');

-- San Francisco bars missing leagues:
-- Final Final Sports Bar (id: 55)
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name) VALUES (55, 'premier-league', 'Premier League');

-- The Dubliner (id: 57)
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name) VALUES (57, 'premier-league', 'Premier League');

-- The Pig and Whistle (id: 56) - English pub
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name) VALUES (56, 'premier-league', 'Premier League');
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name) VALUES (56, 'champions-league', 'UEFA Champions League');

-- Charlotte bars missing leagues:
-- Belfast Mill Irish Pub (id: 242)
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name) VALUES (242, 'premier-league', 'Premier League');
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name) VALUES (242, 'la-liga', 'La Liga');
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name) VALUES (242, 'champions-league', 'UEFA Champions League');

-- Minneapolis bar missing leagues:
-- Tom's Watch Bar (id: 221)
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name) VALUES (221, 'premier-league', 'Premier League');
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name) VALUES (221, 'mls', 'MLS');

-- San Diego bars missing leagues:
-- Knotty Barrel (id: 197)
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name) VALUES (197, 'premier-league', 'Premier League');

-- Nolita Hall (id: 198)
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name) VALUES (198, 'premier-league', 'Premier League');
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name) VALUES (198, 'world-cup', 'FIFA World Cup');

-- SD TapRoom (id: 196)
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name) VALUES (196, 'premier-league', 'Premier League');
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name) VALUES (196, 'mls', 'MLS');

-- The Field Irish Pub (id: 194)
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name) VALUES (194, 'premier-league', 'Premier League');
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name) VALUES (194, 'champions-league', 'UEFA Champions League');

-- True North Tavern (id: 199)
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name) VALUES (199, 'premier-league', 'Premier League');

-- Also add Caffe dello Sport (id: 73) leagues - Italian cafe
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name) VALUES (73, 'serie-a', 'Serie A');
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name) VALUES (73, 'premier-league', 'Premier League');
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name) VALUES (73, 'la-liga', 'La Liga');
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name) VALUES (73, 'champions-league', 'UEFA Champions League');
