-- Base schema for directory items
-- Rename "items" to match your directory (e.g., tools, places, restaurants)
-- Rename "category" to match your grouping (e.g., cuisine, genre, type)
--
-- Location fields (city, state, latitude, longitude) are optional.
-- Not every directory is location-based, but the schema supports it from day one
-- so you don't need migrations later when you inevitably need it.

CREATE TABLE IF NOT EXISTS items (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  slug TEXT UNIQUE NOT NULL,
  name TEXT NOT NULL,
  description TEXT,                            -- Short summary (1-2 sentences)
  content TEXT,                                -- Long-form rich content (500+ chars)
  category TEXT,

  -- Location (optional — leave NULL for non-geographic directories)
  city TEXT,
  state TEXT,                                  -- State, region, or country code
  address TEXT,
  latitude REAL,
  longitude REAL,

  -- Media & links
  image_url TEXT,
  source_url TEXT,                             -- Primary external link

  -- Source tracking for E-E-A-T credibility
  sources TEXT,                                -- JSON array of source URLs
  source_count INTEGER DEFAULT 0,              -- Number of independent sources

  featured INTEGER DEFAULT 0,
  created_at TEXT DEFAULT (datetime('now')),
  updated_at TEXT DEFAULT (datetime('now'))
);

-- Indexes for common queries
CREATE INDEX IF NOT EXISTS idx_items_slug ON items(slug);
CREATE INDEX IF NOT EXISTS idx_items_category ON items(category);
CREATE INDEX IF NOT EXISTS idx_items_featured ON items(featured);
CREATE INDEX IF NOT EXISTS idx_items_created_at ON items(created_at);
CREATE INDEX IF NOT EXISTS idx_items_state ON items(state);
CREATE INDEX IF NOT EXISTS idx_items_city ON items(city);

-- Submissions table — stores user-submitted items for review
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
  status TEXT DEFAULT 'pending',               -- pending, approved, rejected
  created_at TEXT DEFAULT (datetime('now'))
);

CREATE INDEX IF NOT EXISTS idx_submissions_status ON submissions(status);
