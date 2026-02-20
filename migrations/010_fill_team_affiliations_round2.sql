-- Migration 009: Fill team affiliations for Denver, San Diego, Boston, Dallas, San Francisco
-- Research date: 2026-02-20
-- Sources: Official supporter club websites, Premier League USA Bar Finder,
--          MLS team pub partner programs, SoccerNation, Matador Network, local press

-- ============================================================
-- STEP 1: Add new teams to teams table
-- ============================================================

-- San Diego FC (MLS, joined 2025)
INSERT OR IGNORE INTO teams (slug, name, league) VALUES ('san-diego-fc', 'San Diego FC', 'MLS');

-- Boston Legacy FC (NWSL, joining 2026)
INSERT OR IGNORE INTO teams (slug, name, league) VALUES ('boston-legacy-fc', 'Boston Legacy FC', 'NWSL');

-- ============================================================
-- STEP 2: Add verified team affiliations to bar_teams
-- ============================================================

-- ---- DENVER ----

-- British Bulldog (id 298) - Chelsea FC
-- Source: Rocky Mountain Blues official WordPress (rockymountainblues.wordpress.com)
-- "Rocky Mountain Blues are residents of The British Bulldog in Denver, CO"
-- The RMBs are an officially sanctioned Chelsea FC supporters group
INSERT OR IGNORE INTO bar_teams (bar_id, team_slug, team_name)
VALUES (298, 'chelsea', 'Chelsea FC');

-- ---- SAN DIEGO ----

-- Shakespeare Pub & Grille (id 188) - Chelsea FC, Manchester United
-- Source: SoccerNation (soccernation.com/soccer-bars-of-san-diego-part-1)
-- Source: The Voyageer (thevoyageer.com/2018/02/san-diego-soccer-pubs)
-- Source: Shakespeare Pub Instagram (@shakespearepubsoccer)
-- "Home to Chelsea and Man Utd supporters"
-- "You'll find fans of Manchester United, Manchester City, and Chelsea in strong numbers"
-- Note: Red Devils of San Diego (Man Utd) started at Shakespeare before moving to Liberty Call
INSERT OR IGNORE INTO bar_teams (bar_id, team_slug, team_name)
VALUES (188, 'chelsea', 'Chelsea FC');
INSERT OR IGNORE INTO bar_teams (bar_id, team_slug, team_name)
VALUES (188, 'manchester-united', 'Manchester United');

-- Shakespeare Pub & Grille (id 188) - San Diego FC
-- Source: shakespearepub.com/major-league-soccer/san-diego-football-club
-- Shows all SDFC matches, official Modelo game day activations
INSERT OR IGNORE INTO bar_teams (bar_id, team_slug, team_name)
VALUES (188, 'san-diego-fc', 'San Diego FC');

-- Fairplay (id 193) - San Diego FC
-- Source: sandiegofc.com/club/events/pub-partner (Official SDFC Pub Partner, Central SD)
INSERT OR IGNORE INTO bar_teams (bar_id, team_slug, team_name)
VALUES (193, 'san-diego-fc', 'San Diego FC');

-- SD TapRoom (id 196) - San Diego FC
-- Source: sandiegofc.com/club/events/pub-partner (Official SDFC Pub Partner, Beaches)
INSERT OR IGNORE INTO bar_teams (bar_id, team_slug, team_name)
VALUES (196, 'san-diego-fc', 'San Diego FC');

-- Knotty Barrel (id 197) - San Diego FC
-- Source: sandiegofc.com/club/events/pub-partner (Official SDFC Pub Partner, North County)
INSERT OR IGNORE INTO bar_teams (bar_id, team_slug, team_name)
VALUES (197, 'san-diego-fc', 'San Diego FC');

-- Also add San Diego FC to existing San Diego bars that are pub partners:
-- Bluefoot Bar & Lounge (id 190) - listed as SDFC Pub Partner (Central SD)
INSERT OR IGNORE INTO bar_teams (bar_id, team_slug, team_name)
VALUES (190, 'san-diego-fc', 'San Diego FC');

-- O'Brien's Pub (id 191) - listed as SDFC Pub Partner (Central SD)
INSERT OR IGNORE INTO bar_teams (bar_id, team_slug, team_name)
VALUES (191, 'san-diego-fc', 'San Diego FC');

-- ---- BOSTON ----

-- Drawdown Brewing (id 83) - Boston Legacy FC
-- Source: Matador Network (matadornetwork.com/read/soccer-bars-in-boston)
-- "Drawdown will be a hub for the brand new Boston Legacy FC team in the NWSL"
-- Source: Boston Calendar event - Boston Legacy FC founders met with fans at Drawdown
-- Source: NWSL Boston ISA (bostonisa.com) membership kickoff held at Drawdown
INSERT OR IGNORE INTO bar_teams (bar_id, team_slug, team_name)
VALUES (83, 'boston-legacy-fc', 'Boston Legacy FC');

-- ---- SAN FRANCISCO ----

-- Mad Dog in the Fog (id 49) - Chelsea FC
-- Source: premierleague.com/usa-bar-finder/bar/1889/mad-dog-in-the-fog
-- Source: SFBayAreaBlues on X (official SF Bay Area Chelsea supporters)
-- "SF Bay Area Blues meet for all Chelsea matches at Mad Dog in the Fog"
INSERT OR IGNORE INTO bar_teams (bar_id, team_slug, team_name)
VALUES (49, 'chelsea', 'Chelsea FC');

-- ============================================================
-- STEP 3: Bars researched but NO specific team affiliation found
-- These are general sports bars that show all matches.
-- Documented here for transparency -- do NOT add fake affiliations.
-- ============================================================

-- DENVER (no team affiliation verified):
-- Tom's Watch Bar (id 302) - Chain sports bar, shows all leagues. National Club America deal is chain-wide, not local supporter group.
-- Society Sports and Spirits (id 303) - Alumni bar for NFL/college teams, not soccer-specific.
-- Highland Tavern (id 304) - Neighborhood bar with TVs, no soccer supporter group.
-- Highland Tap and Burger (id 305) - Burger restaurant with TVs, no soccer supporter group.
-- Sobo 151 Czech Bar & Grill (id 306) - Czech bar focused on hockey, shows some soccer. No specific team.
-- GB Fish & Chips (id 307) - British restaurant, soccer jerseys on wall, sponsors Denver Kickers. No specific PL team.
-- Raices Brewing (id 308) - Latin American soccer focus, packed for CONMEBOL/CONCACAF. No specific team affiliation.

-- SAN DIEGO (no team affiliation verified):
-- The Field Irish Pub (id 194) - Authentic Irish pub, shows PL and rugby. No specific supporter group.
-- Nolita Hall (id 198) - Beer hall for big events (World Cup). "They rep no team, so all sports fans are welcome."
-- True North Tavern (id 199) - North Park gastropub. Best Sports Bar award but no soccer team affiliation.

-- BOSTON (no team affiliation verified):
-- Caffe dello Sport (id 73) - Italian cafe showing all calcio. No specific Italian or English team affiliation.
-- Cask 'n Flagon (id 76) - Historic Fenway bar, primarily baseball. Shows PL mornings but no team supporter group.
-- Bleacher Bar (id 77) - Under Fenway bleachers. Major tournament venue but no specific team group.
-- The Sevens Ale House (id 79) - Beacon Hill dive bar since 1933. Shows soccer but no supporter group.
-- A.T. O'Keeffe's (id 81) - Back Bay Irish pub (formerly McGreevy's). No soccer supporter group found.
-- The Black Rose (id 84) - Faneuil Hall Irish institution since 1976. Shows Irish football, no PL supporter group.

-- DALLAS (no team affiliation verified):
-- Frankie's Downtown (id 104) - Best Sports Bar award. Shows World Cup/tournaments. No specific team group.
-- The Nodding Donkey (id 105) - Uptown sports bar. General game day spot, no soccer team affiliation.
-- Off The Cuff (id 108) - Deep Ellum sports bar. World Cup/Champions League venue. No team group.
-- Sportsbook Bishop Arts (id 106) - New (2024) Bishop Arts sports bar. "No teams affiliated yet."
-- Bryan Street Tavern (id 107) - Pizza and craft beer neighborhood bar. Sponsors adult soccer leagues but no team group.
-- Christie's Sports Bar (id 109) - 69 TVs across 3 floors. General sports bar, no soccer team affiliation.

-- SAN FRANCISCO (no team affiliation verified):
-- Final Final Sports Bar (id 55) - 90-year-old Marina sports bar. Recently renovated. No soccer team group.
-- The Chieftain Irish Pub (id 52) - SoMa Irish pub. Shows European soccer and rugby. No specific team.
-- Irish Times (id 54) - Financial District Irish pub. "Put on whatever game you request." No team affiliation.
-- The Pig and Whistle (id 56) - Inner Richmond English pub. Has pub soccer/cricket teams. No PL supporter group.
-- The Dubliner (id 57) - Noe Valley Irish pub since 1987. Every sports package on 12 TVs. No specific team.
