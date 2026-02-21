-- Geocode Tampa / St. Petersburg bars
-- Coordinates from US Census Geocoding API
-- Added: 2026-02-20

-- Tampa bars
UPDATE bars SET latitude = 27.940977, longitude = -82.483063 WHERE slug = 'macdintons-irish-pub-tampa';
UPDATE bars SET latitude = 27.950623, longitude = -82.447613 WHERE slug = 'maloneys-local-tampa';
UPDATE bars SET latitude = 27.961043, longitude = -82.440131 WHERE slug = 'james-joyce-ybor-tampa';
UPDATE bars SET latitude = 27.947110, longitude = -82.454842 WHERE slug = 'yeomans-cask-lion-tampa';
UPDATE bars SET latitude = 27.926055, longitude = -82.453129 WHERE slug = 'molly-malones-tampa';

-- St. Petersburg bars
UPDATE bars SET latitude = 27.771481, longitude = -82.637025 WHERE slug = 'mary-margarets-st-pete';
UPDATE bars SET latitude = 27.758126, longitude = -82.736524 WHERE slug = 'horse-and-jockey-st-pete';
UPDATE bars SET latitude = 27.772174, longitude = -82.634467 WHERE slug = 'dublin-drop-st-pete';
UPDATE bars SET latitude = 27.771148, longitude = -82.640751 WHERE slug = 'green-turtle-brewery-st-pete';
UPDATE bars SET latitude = 27.828446, longitude = -82.648729 WHERE slug = 'jacks-london-grill-st-pete';
