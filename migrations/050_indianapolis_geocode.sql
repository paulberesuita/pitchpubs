-- Geocode Indianapolis / Carmel / Fishers bars
-- Coordinates from US Census Geocoding API and TwoBeerDudes map data
-- Added: 2026-02-20

-- Indianapolis bars
UPDATE bars SET latitude = 39.869782, longitude = -86.142630 WHERE slug = 'union-jack-pub-indianapolis';
UPDATE bars SET latitude = 39.776600, longitude = -86.146652 WHERE slug = 'chatham-tap-mass-ave';
UPDATE bars SET latitude = 39.784531, longitude = -86.133354 WHERE slug = 'centerpoint-brewing-indianapolis';
UPDATE bars SET latitude = 39.777206, longitude = -86.161402 WHERE slug = 'brew-link-brewpub-indianapolis';
UPDATE bars SET latitude = 39.775962, longitude = -86.147595 WHERE slug = 'ralstons-drafthouse-indianapolis';
UPDATE bars SET latitude = 39.765105, longitude = -86.160053 WHERE slug = 'toms-watch-bar-indianapolis';

-- Carmel
UPDATE bars SET latitude = 39.972076, longitude = -86.151249 WHERE slug = 'brockway-pub-carmel';

-- Fishers
UPDATE bars SET latitude = 39.956579, longitude = -86.024043 WHERE slug = 'chatham-tap-fishers';
