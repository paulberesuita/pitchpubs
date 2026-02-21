-- Pittsburgh, Pennsylvania Soccer Bars
-- Added: 2026-02-20
-- 9 soccer bars in Pittsburgh, Pennsylvania
-- Pittsburgh Riverhounds SC (USL Championship) and strong EPL supporter culture
-- Sources: Visit Pittsburgh, CBS Pittsburgh, Premier League USA Bar Finder, GameWatch.info,
--          Steel City Gooners, Pittsburgh CSC, Riverhounds SC, American Scouser,
--          Tottenham Hotspur official, Pittsburgh Post-Gazette, WPXI, Yelp, TribLive

-- Add Pittsburgh to cities table
INSERT OR IGNORE INTO cities (name, slug, state, is_world_cup_host) VALUES ('Pittsburgh', 'pittsburgh', 'Pennsylvania', 0);

-- Add Pittsburgh Riverhounds SC to teams table
INSERT OR IGNORE INTO teams (slug, name, league) VALUES ('pittsburgh-riverhounds', 'Pittsburgh Riverhounds SC', 'USL Championship');

-- ============================================================
-- BARS
-- ============================================================

-- 1. Piper's Pub - THE soccer bar of Pittsburgh since 1999
INSERT INTO bars (slug, name, description, city, city_slug, state, neighborhood, address, opens_early, website, sources, source_count)
VALUES (
  'pipers-pub-pittsburgh',
  'Piper''s Pub',
  'Pittsburgh''s original soccer bar since 1999, Piper''s Pub is where the city''s soccer culture took root. The Steel Army -- Pittsburgh Riverhounds'' first supporters group -- held their founding meeting here in 2007. Listed on the Premier League''s official USA Bar Finder, the South Side institution opens at 8:30 AM on weekends for early EPL matches and shows Champions League, FA Cup, Europa League, and Coppa Italia. Home to Pittsburgh Spurs, the official Tottenham Hotspur supporters club. After closing during COVID in 2021, Piper''s reopened for limited weekend service with a bare-bones brunch of boxtys, scotch eggs, and sausage rolls alongside local brewery cans.',
  'Pittsburgh', 'pittsburgh', 'Pennsylvania', 'South Side',
  '1828 E Carson St, Pittsburgh, PA 15203',
  1,
  'https://www.piperspub.com',
  '["https://www.premierleague.com/usa-bar-finder/bar/2188/pipers-pub", "https://www.visitpittsburgh.com/blog/where-to-watch-soccer-in-pittsburgh/", "https://www.cbsnews.com/pittsburgh/news/best-bars-to-watch-premier-league-soccer-in-pittsburgh/", "https://www.tottenhamhotspur.com/fans/supporters-clubs/join-a-club/pittsburgh-spurs/", "https://www.pghindependent.com/post/breaking-pipers-pub-reopens", "https://gamewatch.info/soccer-bars/cities/pittsburgh-pa"]',
  6
);

-- 2. Cork Harbour Pub - Steel City Gooners + Pittsburgh Celtic SC home
INSERT INTO bars (slug, name, description, city, city_slug, state, neighborhood, address, opens_early, website, sources, source_count)
VALUES (
  'cork-harbour-pub-pittsburgh',
  'Cork Harbour Pub',
  'Opened in October 2022, Cork Harbour quickly became Pittsburgh''s most soccer-obsessed pub. This authentic Irish bar in Lawrenceville is the official home of both the Steel City Gooners (Arsenal supporters, an Arsenal America branch) and the Pittsburgh Celtic Supporters Club (est. 2020). The soccer schedule is arguably the most loaded in the city -- full slates of EPL, Bundesliga, UEFA Champions League, and Eredivisie matches. Features Irish whiskeys, craft cocktails, Guinness on draft, Tuesday trivia, Thursday live Irish music, and Wednesday pierogi night.',
  'Pittsburgh', 'pittsburgh', 'Pennsylvania', 'Lawrenceville',
  '181 43rd St, Pittsburgh, PA 15201',
  0,
  'https://www.corkharbourpgh.com',
  '["https://www.visitpittsburgh.com/blog/where-to-watch-soccer-in-pittsburgh/", "https://www.steelcitygooners.com/matchdays", "https://www.pittsburghcsc.com/about-us", "https://www.celticbars.com/celtic-bar/cork-harbour-pub/", "https://arsenalamerica.com/branches/", "https://www.yelp.com/biz/cork-harbour-pub-pittsburgh"]',
  6
);

-- 3. The Bulldog Pub - East End soccer destination with early EPL opens
INSERT INTO bars (slug, name, description, city, city_slug, state, neighborhood, address, opens_early, website, sources, source_count)
VALUES (
  'bulldog-pub-pittsburgh',
  'The Bulldog Pub',
  'A neighborhood pub in Morningside that has quietly become one of Pittsburgh''s best soccer bars since opening in 2013. Named after the legendary Morningside Bulldogs youth football team, The Bulldog Pub opens at 7 AM on Saturdays for the earliest Premier League kickoffs and runs a #BulldogBrunchLeague on weekends with build-your-own breakfast sandwiches and breakfast pizzas. The full slate of matches runs every day of the week. European charm meets Pittsburgh grit in this family-friendly pub with craft beers, wings, and a welcoming outdoor patio.',
  'Pittsburgh', 'pittsburgh', 'Pennsylvania', 'Morningside',
  '1818 Morningside Ave, Pittsburgh, PA 15206',
  1,
  'https://thebulldogpub.com',
  '["https://www.visitpittsburgh.com/blog/where-to-watch-soccer-in-pittsburgh/", "https://www.pittsburghmagazine.com/what-makes-the-bulldog-pub-much-more-than-just-a-neighborhood-watering-hole/", "https://www.yelp.com/biz/bulldog-pub-pittsburgh", "https://www.fourdollarjacks.com/bars-near-me/the-bulldog-pub"]',
  4
);

-- 4. Mike's Beer Bar - Official Riverhounds watch party home
INSERT INTO bars (slug, name, description, city, city_slug, state, neighborhood, address, opens_early, website, sources, source_count)
VALUES (
  'mikes-beer-bar-pittsburgh',
  'Mike''s Beer Bar',
  'The official watch party home of the Pittsburgh Riverhounds since 2022, Mike''s Beer Bar sits on the North Shore next to PNC Park with over 80 rotating craft taps and 500+ bottles -- 350 of them local Pennsylvania brews. Owner Mike Sukitch partnered with the Riverhounds to host every away match on the big screens, complete with a custom Riverhounds Amber Lager brewed by Straub Brewery. Also a prime spot for World Cup and international matches. The signature Steak on a Stone is served sizzling-hot at your table.',
  'Pittsburgh', 'pittsburgh', 'Pennsylvania', 'North Shore',
  '110 Federal St, Pittsburgh, PA 15212',
  0,
  'https://mikesbeerbar.com',
  '["https://www.riverhounds.com/news/2022/03/04/hounds-mikes-beer-bar/", "https://www.visitpittsburgh.com/blog/where-to-watch-soccer-in-pittsburgh/", "https://www.oursportscentral.com/services/releases/mikes-beer-bar-becomes-official-watch-party-home-of-the-hounds/n-5797288", "https://gamewatch.info/soccer-bars/cities/pittsburgh-pa", "https://www.yelp.com/biz/mike-s-beer-bar-pittsburgh"]',
  5
);

-- 5. Monterey Pub - Irish pub in Mexican War Streets with EPL atmosphere
INSERT INTO bars (slug, name, description, city, city_slug, state, neighborhood, address, opens_early, website, sources, source_count)
VALUES (
  'monterey-pub-pittsburgh',
  'Monterey Pub',
  'A piece of Ireland in Pittsburgh''s Mexican War Streets, Monterey Pub has built a loyal following of football supporters on the North Side. The pub opens at 10 AM on Saturdays for Premier League matches and goes big for World Cup and major international tournaments. Irish pub fare including bangers and mash, shepherd''s pie, and fish and chips make this a proper matchday destination. The modernly historic setting in one of Pittsburgh''s most charming neighborhoods draws supporters who want atmosphere with their football.',
  'Pittsburgh', 'pittsburgh', 'Pennsylvania', 'Mexican War Streets',
  '1227 Monterey St, Pittsburgh, PA 15212',
  1,
  'https://www.themontereypub.com',
  '["https://www.visitpittsburgh.com/blog/where-to-watch-soccer-in-pittsburgh/", "https://www.yelp.com/biz/monterey-pub-pittsburgh", "https://triblive.com/lifestyles/food-drink/north-sides-monterey-pub-reopens-after-being-close-for-more-than-a-year/", "https://acrosspittsburgh.com/food-drink/bars/monterey-pub"]',
  4
);

-- 6. The Pitch on Butler - Purpose-built soccer bar by Piper's Pub veteran
INSERT INTO bars (slug, name, description, city, city_slug, state, neighborhood, address, opens_early, website, sources, source_count)
VALUES (
  'the-pitch-on-butler-pittsburgh',
  'The Pitch on Butler',
  'Born from Piper''s Pub DNA, The Pitch on Butler opened on Boxing Day 2023 when Piper''s veteran Bryan Muha and partner Mercedes Farrell transformed the former No Names Pub into Lawrenceville''s dedicated soccer bar. A 40-tap system pours local and imported craft beers alongside a full kitchen serving smashburgers. The outdoor patio with a big screen is the summer sweet spot for afternoon matches, while the spacious indoor bar with multiple TVs handles the packed Saturday morning EPL slate. Live entertainment on the small stage rounds out evenings.',
  'Pittsburgh', 'pittsburgh', 'Pennsylvania', 'Lawrenceville',
  '4717 Butler St, Pittsburgh, PA 15201',
  0,
  'https://www.thepitchonbutler.com',
  '["https://www.visitpittsburgh.com/blog/where-to-watch-soccer-in-pittsburgh/", "https://www.wpxi.com/news/local/pipers-pub-vet-partner-debut-new-pitch-butler-soccer-bar-lawrenceville/CPM7JBEJWBEU3FTNUW4ZNCVCFQ/", "https://www.yelp.com/biz/the-pitch-on-butler-pittsburgh", "https://www.fourdollarjacks.com/bars-near-me/the-pitch-on-butler"]',
  4
);

-- 7. Hofbrauhaus Pittsburgh - German beer hall for World Cup and Bundesliga
INSERT INTO bars (slug, name, description, city, city_slug, state, neighborhood, address, opens_early, website, sources, source_count)
VALUES (
  'hofbrauhaus-pittsburgh',
  'Hofbrauhaus Pittsburgh',
  'Modeled after the legendary 400-year-old Hofbrauhaus in Munich, this South Side beer hall is Pittsburgh''s home for German football and World Cup viewing. The Bier Hall features authentically brewed German beer overseen by a German Brew Master, traditional Bavarian food, and live music -- creating an atmosphere that feels like watching the match in Munich. Located in SouthSide Works overlooking the waterfront with the city skyline as a backdrop. A prime destination for Bundesliga, World Cup, and European Championship matches.',
  'Pittsburgh', 'pittsburgh', 'Pennsylvania', 'South Side',
  '2705 S Water St, Pittsburgh, PA 15203',
  0,
  'https://www.hofbrauhauspittsburgh.com',
  '["https://gamewatch.info/teams/world-cup-soccer/bars/hofbrauhaus-pittsburgh-2705-s-water-st-south-side-flats-pittsburgh-pa-united-states", "https://www.visitpittsburgh.com/directory/hofbrauhaus-pittsburgh/", "https://www.yelp.com/biz/hofbrauhaus-pittsburgh-pittsburgh-6"]',
  3
);

-- 8. Jack's Bar - Early-opening dive bar for morning Premier League
INSERT INTO bars (slug, name, description, city, city_slug, state, neighborhood, address, opens_early, website, sources, source_count)
VALUES (
  'jacks-bar-pittsburgh',
  'Jack''s Bar',
  'This no-frills South Side dive bar opens at 7 AM on weekdays and 9 AM on Sundays, making it one of the earliest-opening spots for Premier League matches in Pittsburgh. Cheap drinks -- shots, pitchers, imports on draft -- and zero pretension. Jack''s is the kind of place where you can catch a 7:30 AM kickoff with a cold domestic and nobody bats an eye. Listed on CBS Pittsburgh''s best Premier League bars and a fixture of the South Side''s Carson Street soccer bar corridor alongside Piper''s Pub.',
  'Pittsburgh', 'pittsburgh', 'Pennsylvania', 'South Side',
  '1117 E Carson St, Pittsburgh, PA 15203',
  1,
  NULL,
  '["https://www.cbsnews.com/pittsburgh/news/best-bars-to-watch-premier-league-soccer-in-pittsburgh/", "https://www.yelp.com/biz/jacks-bar-pittsburgh-2", "https://gamewatch.info/soccer-bars/cities/pittsburgh-pa"]',
  3
);

-- 9. Thunderbird Cafe & Music Hall - Crystal Palace supporters home
INSERT INTO bars (slug, name, description, city, city_slug, state, neighborhood, address, opens_early, website, sources, source_count)
VALUES (
  'thunderbird-cafe-pittsburgh',
  'Thunderbird Cafe & Music Hall',
  'A Lawrenceville institution since 2000, the Thunderbird Cafe is both a beloved live music venue and the home of Pittsburgh''s Crystal Palace supporters group, who gather here regularly for matches. Listed on the Premier League''s official USA Bar Finder, this historic building -- originally an 1890 bakery turned tavern in 1933 -- brings an eclectic vibe to soccer viewing. The cafe side offers a more intimate setting for watching matches, while the music hall hosts top national and local acts on evenings.',
  'Pittsburgh', 'pittsburgh', 'Pennsylvania', 'Lawrenceville',
  '4053 Butler St, Pittsburgh, PA 15201',
  0,
  'https://thunderbirdmusichall.com',
  '["https://www.premierleague.com/usa-bar-finder/bar/2190/epl-invitational", "https://gamewatch.info/soccer-bars/cities/pittsburgh-pa", "https://www.yelp.com/biz/thunderbird-cafe-and-music-hall-pittsburgh"]',
  3
);

-- ============================================================
-- TEAM AFFILIATIONS
-- ============================================================

-- Piper's Pub - Tottenham Hotspur (Pittsburgh Spurs official SC)
INSERT INTO bar_teams (bar_id, team_slug, team_name)
SELECT id, 'tottenham', 'Tottenham Hotspur' FROM bars WHERE slug = 'pipers-pub-pittsburgh';

-- Cork Harbour - Arsenal FC (Steel City Gooners)
INSERT INTO bar_teams (bar_id, team_slug, team_name)
SELECT id, 'arsenal', 'Arsenal FC' FROM bars WHERE slug = 'cork-harbour-pub-pittsburgh';

-- Cork Harbour - Celtic FC (Pittsburgh Celtic Supporters Club)
INSERT INTO bar_teams (bar_id, team_slug, team_name)
SELECT id, 'celtic', 'Celtic FC' FROM bars WHERE slug = 'cork-harbour-pub-pittsburgh';

-- Mike's Beer Bar - Pittsburgh Riverhounds SC
INSERT INTO bar_teams (bar_id, team_slug, team_name)
SELECT id, 'pittsburgh-riverhounds', 'Pittsburgh Riverhounds SC' FROM bars WHERE slug = 'mikes-beer-bar-pittsburgh';

-- Thunderbird Cafe - Crystal Palace (supporters group)
INSERT INTO bar_teams (bar_id, team_slug, team_name)
SELECT id, 'crystal-palace', 'Crystal Palace' FROM bars WHERE slug = 'thunderbird-cafe-pittsburgh';

-- ============================================================
-- LEAGUE AFFILIATIONS
-- ============================================================

-- Piper's Pub (EPL, Champions League, Europa League, FA Cup, Serie A, World Cup)
INSERT INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'premier-league', 'Premier League' FROM bars WHERE slug = 'pipers-pub-pittsburgh';
INSERT INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'champions-league', 'UEFA Champions League' FROM bars WHERE slug = 'pipers-pub-pittsburgh';
INSERT INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'europa-league', 'Europa League' FROM bars WHERE slug = 'pipers-pub-pittsburgh';
INSERT INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'fa-cup', 'FA Cup' FROM bars WHERE slug = 'pipers-pub-pittsburgh';
INSERT INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'serie-a', 'Serie A' FROM bars WHERE slug = 'pipers-pub-pittsburgh';
INSERT INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'world-cup', 'FIFA World Cup' FROM bars WHERE slug = 'pipers-pub-pittsburgh';

-- Cork Harbour (EPL, Bundesliga, Champions League, Eredivisie, Scottish Premiership, World Cup)
INSERT INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'premier-league', 'Premier League' FROM bars WHERE slug = 'cork-harbour-pub-pittsburgh';
INSERT INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'bundesliga', 'Bundesliga' FROM bars WHERE slug = 'cork-harbour-pub-pittsburgh';
INSERT INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'champions-league', 'UEFA Champions League' FROM bars WHERE slug = 'cork-harbour-pub-pittsburgh';
INSERT INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'scottish-premiership', 'Scottish Premiership' FROM bars WHERE slug = 'cork-harbour-pub-pittsburgh';
INSERT INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'world-cup', 'FIFA World Cup' FROM bars WHERE slug = 'cork-harbour-pub-pittsburgh';

-- Bulldog Pub (EPL, Champions League, World Cup)
INSERT INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'premier-league', 'Premier League' FROM bars WHERE slug = 'bulldog-pub-pittsburgh';
INSERT INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'champions-league', 'UEFA Champions League' FROM bars WHERE slug = 'bulldog-pub-pittsburgh';
INSERT INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'world-cup', 'FIFA World Cup' FROM bars WHERE slug = 'bulldog-pub-pittsburgh';

-- Mike's Beer Bar (USL Championship, MLS, World Cup, Premier League)
INSERT INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'premier-league', 'Premier League' FROM bars WHERE slug = 'mikes-beer-bar-pittsburgh';
INSERT INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'mls', 'MLS' FROM bars WHERE slug = 'mikes-beer-bar-pittsburgh';
INSERT INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'world-cup', 'FIFA World Cup' FROM bars WHERE slug = 'mikes-beer-bar-pittsburgh';
INSERT INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'international', 'International' FROM bars WHERE slug = 'mikes-beer-bar-pittsburgh';

-- Monterey Pub (EPL, World Cup, International)
INSERT INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'premier-league', 'Premier League' FROM bars WHERE slug = 'monterey-pub-pittsburgh';
INSERT INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'world-cup', 'FIFA World Cup' FROM bars WHERE slug = 'monterey-pub-pittsburgh';
INSERT INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'international', 'International' FROM bars WHERE slug = 'monterey-pub-pittsburgh';

-- The Pitch on Butler (EPL, Champions League, World Cup)
INSERT INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'premier-league', 'Premier League' FROM bars WHERE slug = 'the-pitch-on-butler-pittsburgh';
INSERT INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'champions-league', 'UEFA Champions League' FROM bars WHERE slug = 'the-pitch-on-butler-pittsburgh';
INSERT INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'world-cup', 'FIFA World Cup' FROM bars WHERE slug = 'the-pitch-on-butler-pittsburgh';

-- Hofbrauhaus Pittsburgh (Bundesliga, World Cup, International)
INSERT INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'bundesliga', 'Bundesliga' FROM bars WHERE slug = 'hofbrauhaus-pittsburgh';
INSERT INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'world-cup', 'FIFA World Cup' FROM bars WHERE slug = 'hofbrauhaus-pittsburgh';
INSERT INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'international', 'International' FROM bars WHERE slug = 'hofbrauhaus-pittsburgh';

-- Jack's Bar (EPL, World Cup)
INSERT INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'premier-league', 'Premier League' FROM bars WHERE slug = 'jacks-bar-pittsburgh';
INSERT INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'world-cup', 'FIFA World Cup' FROM bars WHERE slug = 'jacks-bar-pittsburgh';

-- Thunderbird Cafe (EPL, World Cup)
INSERT INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'premier-league', 'Premier League' FROM bars WHERE slug = 'thunderbird-cafe-pittsburgh';
INSERT INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'world-cup', 'FIFA World Cup' FROM bars WHERE slug = 'thunderbird-cafe-pittsburgh';
