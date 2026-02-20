-- Services/Tours table — optional monetization layer
-- Represents related businesses, tours, or services that link to directory items
-- Examples: ghost tours (haunted), coworking spaces (cafes), guided hikes (trails)
--
-- Enable by creating this table and adding data.
-- The services page type only renders if this table has rows.

CREATE TABLE IF NOT EXISTS services (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  slug TEXT UNIQUE NOT NULL,
  name TEXT NOT NULL,
  description TEXT,
  content TEXT,                                -- Long-form rich content

  -- Classification
  service_type TEXT,                           -- e.g., 'tour', 'coworking', 'class'

  -- Location
  city TEXT,
  state TEXT,

  -- Business details
  price_range TEXT,                            -- e.g., '$25-45', 'Free', '$$$'
  booking_url TEXT,                            -- Affiliate or direct booking link
  website_url TEXT,

  -- Media
  image_url TEXT,

  -- Linked items (JSON array of item slugs)
  linked_items TEXT,

  -- Source tracking
  sources TEXT,
  source_count INTEGER DEFAULT 0,

  featured INTEGER DEFAULT 0,
  created_at TEXT DEFAULT (datetime('now')),
  updated_at TEXT DEFAULT (datetime('now'))
);

CREATE INDEX IF NOT EXISTS idx_services_slug ON services(slug);
CREATE INDEX IF NOT EXISTS idx_services_type ON services(service_type);
CREATE INDEX IF NOT EXISTS idx_services_city ON services(city);
CREATE INDEX IF NOT EXISTS idx_services_state ON services(state);
CREATE INDEX IF NOT EXISTS idx_services_featured ON services(featured);
