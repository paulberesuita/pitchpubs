-- Georgia New Bars -- 7 bars added
-- Added: 2026-02-20
-- New discoveries from Atlanta United pub partner list, supporter club research,
-- and community soccer bar directories.
-- Sources: atlutd.com (Pub Partner Program), tottenhamhotspur.com (Atlanta Spurs),
--          atlspurs.com, mannysgrantpark.com, eltesoroatl.com, chiringa.com,
--          moondogpubandgrub.com, silverbackspark.com, roswelljunction.com,
--          sweetwaterbrew.com, discoveratlanta.com, yelp.com, accessatlanta.com

-- Add new cities
INSERT OR IGNORE INTO cities (name, slug, state, is_world_cup_host) VALUES ('Chamblee', 'chamblee', 'Georgia', 0);
INSERT OR IGNORE INTO cities (name, slug, state, is_world_cup_host) VALUES ('Roswell', 'roswell', 'Georgia', 0);

-- ============================================================
-- NEW BARS
-- ============================================================

-- 1. Manny's Grant Park -- Atlanta Spurs (Tottenham) official home bar
INSERT INTO bars (slug, name, description, city, city_slug, state, neighborhood, address, opens_early, website, sources, source_count)
VALUES (
  'mannys-grant-park-atlanta',
  'Manny''s Grant Park',
  'Official home bar of the Atlanta Spurs, Tottenham Hotspur''s recognized supporters'' club in Atlanta (est. 2012). Every Spurs match day, the pub fills with fans in Lilywhite kits cheering on the team together. A cozy neighborhood pub with quality pub food, family-friendly atmosphere, and a spacious patio. Conveniently located off I-20 near Oakland Cemetery and the Eastside Beltline, less than a mile from the MLK MARTA stop. Free street parking and a lot behind the pub.',
  'Atlanta', 'atlanta', 'Georgia', 'Grant Park',
  '580 Woodward Ave SE, Atlanta, GA 30312',
  1,
  'https://mannysgrantpark.com/',
  '["https://www.atlspurs.com/home-bar/", "https://www.tottenhamhotspur.com/fans/supporters-clubs/join-a-club/atlanta-spurs/", "https://mannysgrantpark.com/sports", "https://www.goodrec.com/blog/where-to-watch-soccer-atlanta-10-best-soccer-bars", "https://www.yelp.com/biz/mannys-grant-park-atlanta"]',
  5
);

-- 2. El Tesoro -- ATLUTD pub partner, 7000sqft patio soccer hub
INSERT INTO bars (slug, name, description, city, city_slug, state, neighborhood, address, opens_early, website, sources, source_count)
VALUES (
  'el-tesoro-atlanta',
  'El Tesoro',
  'A rustic and dynamic neighborhood taqueria that doubles as one of Atlanta''s most vibrant soccer viewing destinations. Official Atlanta United Pub Partner with a newly renovated 7,000-square-foot outdoor patio that fills with enthusiastic soccer fans on match days. Traditional Mexican food from 2nd-generation family recipes originating from Guerrero State, a full espresso bar, and creative cocktails. Located on Atlanta''s Eastside in Edgewood.',
  'Atlanta', 'atlanta', 'Georgia', 'Edgewood',
  '1374 Arkwright Pl SE, Atlanta, GA 30317',
  0,
  'https://www.eltesoroatl.com/',
  '["https://www.atlutd.com/fans/pub-partner-program", "https://discoveratlanta.com/stories/things-to-do/where-to-watch-soccer-in-atlanta/", "https://www.yelp.com/biz/el-tesoro-atlanta-3", "https://www.accessatlanta.com/atlanta-things-to-do/your-guide-to-the-best-spots-to-root-for-atlanta-united/"]',
  4
);

-- 3. Chiringa -- ATLUTD pub partner, surfside cuisine on the Beltline
INSERT INTO bars (slug, name, description, city, city_slug, state, neighborhood, address, opens_early, website, sources, source_count)
VALUES (
  'chiringa-atlanta',
  'Chiringa',
  'Vibrant surfside cuisine spot on Atlanta''s Beltline in Old Fourth Ward. Official Atlanta United Pub Partner serving elevated ingredients, clean proteins, and fresh fish alongside fresh-squeezed cocktails. A come-as-you-are counter-service spot with a beach-time vibe and open-air seating. Soccer on screens during match days in one of Atlanta''s most walkable neighborhoods.',
  'Atlanta', 'atlanta', 'Georgia', 'Old Fourth Ward',
  '678 Edgewood Ave NE Ste 4, Atlanta, GA 30307',
  0,
  'https://chiringa.com/',
  '["https://www.atlutd.com/fans/pub-partner-program", "https://chiringa.com/old-fourth-ward", "https://www.yelp.com/biz/chiringa-atlanta-2"]',
  3
);

-- 4. Moondog Pub & Grub -- ATLUTD pub partner in Chamblee, large venue
INSERT INTO bars (slug, name, description, city, city_slug, state, neighborhood, address, opens_early, website, sources, source_count)
VALUES (
  'moondog-pub-chamblee',
  'Moondog Pub & Grub',
  'Community-driven, dog-friendly craft beer pub and scratch kitchen in Chamblee. Official Atlanta United Pub Partner with a large venue loaded with screens for match day viewing. Named Best Bar Food in Metro Atlanta. Fried pickles and cheese curds are standout menu items alongside a massive craft beer selection. Spacious dog-friendly patio with board games, giant Jenga, and cornhole.',
  'Chamblee', 'chamblee', 'Georgia', NULL,
  '5077 Peachtree Rd, Chamblee, GA 30341',
  0,
  'https://www.moondogpubandgrub.com/',
  '["https://www.atlutd.com/fans/pub-partner-program", "https://www.yelp.com/biz/moondog-pub-and-grub-chamblee", "https://www.businessdebut.com/moondog-pub-and-grub-now-open-in-chamblee-with-craft-beer-and-scratch-kitchen/", "https://atlrestaurantreviews.com/chamblee-restaurant-named-best-bar-food-in-metro-atlanta/"]',
  4
);

-- 5. SweetWater Brewery -- Official ATL United craft beer partner
INSERT INTO bars (slug, name, description, city, city_slug, state, neighborhood, address, opens_early, website, sources, source_count)
VALUES (
  'sweetwater-brewery-atlanta',
  'SweetWater Brewery',
  'The largest independent craft brewery in the Southeast and official craft beer partner of Atlanta United. The taproom pours 24 beers on tap plus a full menu from their brewery kitchen. TV viewing areas throughout for all Atlanta United matches, with official watch parties for away games. The annual Block Party kicks off each MLS season here. Co-branded Rowdy Peach IPA celebrates the partnership. Pet-friendly patio with a stage for live music.',
  'Atlanta', 'atlanta', 'Georgia', 'Lindbergh',
  '195 Ottley Dr NE, Atlanta, GA 30324',
  0,
  'https://www.sweetwaterbrew.com/',
  '["https://www.atlutd.com/fans/pub-partner-program", "https://www.atlutd.com/news/atlanta-united-launches-rowdy-peach-ipa-beer-sweetwater-brewing-company", "https://ir.tilray.com/news-releases/news-release-details/sweetwater-brewing-teams-major-league-soccers-atlanta-united-fc", "https://www.yelp.com/biz/sweetwater-brewing-company-atlanta"]',
  4
);

-- 6. Willie B's Bar & Grill -- At Silverbacks Park, field-side soccer bar
INSERT INTO bars (slug, name, description, city, city_slug, state, neighborhood, address, opens_early, website, sources, source_count)
VALUES (
  'willie-bs-atlanta',
  'Willie B''s Bar & Grill',
  'Field-side bar and restaurant at Silverbacks Park, Atlanta''s premier multi-sport complex. Official Atlanta United Pub Partner with a panoramic view of the stadium field from a massive covered patio. A unique soccer bar experience -- watch matches on screens while actual soccer games happen on the pitches around you. Full-service bar with an international menu. Open weekends from 9 AM for morning matches.',
  'Atlanta', 'atlanta', 'Georgia', 'Doraville',
  '3200 Atlanta Silverbacks Way, Atlanta, GA 30340',
  1,
  'https://williebs.com/',
  '["https://www.atlutd.com/fans/pub-partner-program", "https://silverbackspark.com/willie-bs/", "https://www.yelp.com/biz/willie-b-s-bar-and-grill-doraville-2"]',
  3
);

-- 7. The Tavern at Roswell Junction -- ATLUTD pub partner in Roswell
INSERT INTO bars (slug, name, description, city, city_slug, state, neighborhood, address, opens_early, website, sources, source_count)
VALUES (
  'tavern-roswell-junction',
  'The Tavern at Roswell Junction',
  'A lively dining and entertainment destination in historic Roswell, just south of the square. Official Atlanta United Pub Partner in a 12,000-square-foot space with 7 unique food concepts, three bars, outdoor patios, a stage, an arcade, and TVs everywhere. A family-friendly sports viewing hub with cornhole, games, and a welcoming atmosphere for soccer fans in Atlanta''s northern suburbs.',
  'Roswell', 'roswell', 'Georgia', NULL,
  '340 S Atlanta St, Roswell, GA 30075',
  0,
  'https://roswelljunction.com/',
  '["https://www.atlutd.com/fans/pub-partner-program", "https://roswelljunction.com/", "https://discoveratlanta.com/stories/things-to-do/where-to-watch-soccer-in-atlanta/"]',
  3
);

-- ============================================================
-- TEAM AFFILIATIONS FOR NEW BARS
-- ============================================================

-- Manny's Grant Park: Tottenham Hotspur (Atlanta Spurs home)
INSERT OR IGNORE INTO bar_teams (bar_id, team_slug, team_name)
SELECT id, 'tottenham-hotspur', 'Tottenham Hotspur' FROM bars WHERE slug = 'mannys-grant-park-atlanta';

-- All new bars: Atlanta United FC (pub partners)
INSERT OR IGNORE INTO bar_teams (bar_id, team_slug, team_name)
SELECT id, 'atlanta-united-fc', 'Atlanta United FC' FROM bars WHERE slug = 'mannys-grant-park-atlanta';
INSERT OR IGNORE INTO bar_teams (bar_id, team_slug, team_name)
SELECT id, 'atlanta-united-fc', 'Atlanta United FC' FROM bars WHERE slug = 'el-tesoro-atlanta';
INSERT OR IGNORE INTO bar_teams (bar_id, team_slug, team_name)
SELECT id, 'atlanta-united-fc', 'Atlanta United FC' FROM bars WHERE slug = 'chiringa-atlanta';
INSERT OR IGNORE INTO bar_teams (bar_id, team_slug, team_name)
SELECT id, 'atlanta-united-fc', 'Atlanta United FC' FROM bars WHERE slug = 'moondog-pub-chamblee';
INSERT OR IGNORE INTO bar_teams (bar_id, team_slug, team_name)
SELECT id, 'atlanta-united-fc', 'Atlanta United FC' FROM bars WHERE slug = 'sweetwater-brewery-atlanta';
INSERT OR IGNORE INTO bar_teams (bar_id, team_slug, team_name)
SELECT id, 'atlanta-united-fc', 'Atlanta United FC' FROM bars WHERE slug = 'willie-bs-atlanta';
INSERT OR IGNORE INTO bar_teams (bar_id, team_slug, team_name)
SELECT id, 'atlanta-united-fc', 'Atlanta United FC' FROM bars WHERE slug = 'tavern-roswell-junction';

-- ============================================================
-- LEAGUE AFFILIATIONS FOR NEW BARS
-- ============================================================

-- Manny's Grant Park: Premier League (Spurs home), MLS
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'premier-league', 'Premier League' FROM bars WHERE slug = 'mannys-grant-park-atlanta';
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'mls', 'MLS' FROM bars WHERE slug = 'mannys-grant-park-atlanta';

-- El Tesoro: MLS
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'mls', 'MLS' FROM bars WHERE slug = 'el-tesoro-atlanta';

-- Chiringa: MLS
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'mls', 'MLS' FROM bars WHERE slug = 'chiringa-atlanta';

-- Moondog: MLS, Premier League
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'mls', 'MLS' FROM bars WHERE slug = 'moondog-pub-chamblee';
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'premier-league', 'Premier League' FROM bars WHERE slug = 'moondog-pub-chamblee';

-- SweetWater Brewery: MLS
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'mls', 'MLS' FROM bars WHERE slug = 'sweetwater-brewery-atlanta';

-- Willie B's: MLS, Premier League
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'mls', 'MLS' FROM bars WHERE slug = 'willie-bs-atlanta';
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'premier-league', 'Premier League' FROM bars WHERE slug = 'willie-bs-atlanta';

-- Tavern at Roswell Junction: MLS
INSERT OR IGNORE INTO bar_leagues (bar_id, league_slug, league_name)
SELECT id, 'mls', 'MLS' FROM bars WHERE slug = 'tavern-roswell-junction';

-- ============================================================
-- GEOCODE NEW BARS
-- (Coordinates from Google Maps / US Census Geocoder)
-- ============================================================

UPDATE bars SET latitude = 33.7327, longitude = -84.3705 WHERE slug = 'mannys-grant-park-atlanta';
UPDATE bars SET latitude = 33.7494, longitude = -84.3426 WHERE slug = 'el-tesoro-atlanta';
UPDATE bars SET latitude = 33.7566, longitude = -84.3647 WHERE slug = 'chiringa-atlanta';
UPDATE bars SET latitude = 33.8874, longitude = -84.3067 WHERE slug = 'moondog-pub-chamblee';
UPDATE bars SET latitude = 33.8082, longitude = -84.3698 WHERE slug = 'sweetwater-brewery-atlanta';
UPDATE bars SET latitude = 33.8918, longitude = -84.2819 WHERE slug = 'willie-bs-atlanta';
UPDATE bars SET latitude = 34.0218, longitude = -84.3568 WHERE slug = 'tavern-roswell-junction';

-- ============================================================
-- SET IMAGES FOR NEW BARS
-- ============================================================

UPDATE bars SET image_url = 'bars/atlanta/mannys-grant-park-atlanta.jpg' WHERE slug = 'mannys-grant-park-atlanta';
UPDATE bars SET image_url = 'bars/atlanta/el-tesoro-atlanta.jpg' WHERE slug = 'el-tesoro-atlanta';
-- Chiringa: no usable image sourced yet
-- SweetWater: no usable image sourced yet (site blocks scraping)
UPDATE bars SET image_url = 'bars/chamblee/moondog-pub-chamblee.jpg' WHERE slug = 'moondog-pub-chamblee';
UPDATE bars SET image_url = 'bars/atlanta/willie-bs-atlanta.jpg' WHERE slug = 'willie-bs-atlanta';
UPDATE bars SET image_url = 'bars/roswell/tavern-roswell-junction.jpg' WHERE slug = 'tavern-roswell-junction';
