-- SoccerBars schema — bars directory with team/league affiliations

-- Main bars table (extends template items schema)
CREATE TABLE IF NOT EXISTS bars (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  slug TEXT UNIQUE NOT NULL,
  name TEXT NOT NULL,
  description TEXT,
  content TEXT,
  category TEXT,

  -- Location
  city TEXT NOT NULL,
  city_slug TEXT NOT NULL,
  state TEXT NOT NULL,
  neighborhood TEXT,
  address TEXT,
  latitude REAL,
  longitude REAL,

  -- Bar-specific
  opens_early INTEGER DEFAULT 0,
  website TEXT,

  -- Media & links
  image_url TEXT,
  source_url TEXT,

  -- Source tracking for E-E-A-T
  sources TEXT,
  source_count INTEGER DEFAULT 1,

  featured INTEGER DEFAULT 0,
  created_at TEXT DEFAULT (datetime('now')),
  updated_at TEXT DEFAULT (datetime('now'))
);

-- Junction table for bar-team affiliations
CREATE TABLE IF NOT EXISTS bar_teams (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  bar_id INTEGER NOT NULL,
  team_slug TEXT NOT NULL,
  team_name TEXT NOT NULL,
  FOREIGN KEY (bar_id) REFERENCES bars(id) ON DELETE CASCADE,
  UNIQUE(bar_id, team_slug)
);

-- Junction table for leagues a bar shows
CREATE TABLE IF NOT EXISTS bar_leagues (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  bar_id INTEGER NOT NULL,
  league_slug TEXT NOT NULL,
  league_name TEXT NOT NULL,
  FOREIGN KEY (bar_id) REFERENCES bars(id) ON DELETE CASCADE,
  UNIQUE(bar_id, league_slug)
);

-- Cities lookup table
CREATE TABLE IF NOT EXISTS cities (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  slug TEXT UNIQUE NOT NULL,
  name TEXT NOT NULL,
  state TEXT NOT NULL,
  is_world_cup_host INTEGER DEFAULT 0
);

-- Teams lookup table
CREATE TABLE IF NOT EXISTS teams (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  slug TEXT UNIQUE NOT NULL,
  name TEXT NOT NULL,
  league TEXT
);

-- Submissions table
CREATE TABLE IF NOT EXISTS submissions (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT NOT NULL,
  slug TEXT,
  description TEXT NOT NULL,
  category TEXT,
  city TEXT,
  state TEXT,
  source_url TEXT,
  email TEXT,
  status TEXT DEFAULT 'pending',
  created_at TEXT DEFAULT (datetime('now'))
);

-- Indexes
CREATE INDEX IF NOT EXISTS idx_bars_slug ON bars(slug);
CREATE INDEX IF NOT EXISTS idx_bars_city_slug ON bars(city_slug);
CREATE INDEX IF NOT EXISTS idx_bars_state ON bars(state);
CREATE INDEX IF NOT EXISTS idx_bars_city ON bars(city);
CREATE INDEX IF NOT EXISTS idx_bars_category ON bars(category);
CREATE INDEX IF NOT EXISTS idx_bars_featured ON bars(featured);
CREATE INDEX IF NOT EXISTS idx_bars_created_at ON bars(created_at);
CREATE INDEX IF NOT EXISTS idx_bar_teams_team_slug ON bar_teams(team_slug);
CREATE INDEX IF NOT EXISTS idx_bar_teams_bar_id ON bar_teams(bar_id);
CREATE INDEX IF NOT EXISTS idx_bar_leagues_league_slug ON bar_leagues(league_slug);
CREATE INDEX IF NOT EXISTS idx_bar_leagues_bar_id ON bar_leagues(bar_id);
CREATE INDEX IF NOT EXISTS idx_cities_state ON cities(state);
CREATE INDEX IF NOT EXISTS idx_cities_world_cup ON cities(is_world_cup_host);
CREATE INDEX IF NOT EXISTS idx_submissions_status ON submissions(status);
