-- Phoenix Metro Area Image URLs
-- All 10 bars with images uploaded to R2
-- Image URL format: path without /images/ prefix (renderCard auto-prepends it)
-- Sources: p2bars.com CDN, FourDollarJacks CDN, Four Peaks official (builder.io CDN),
--          K O'Donnell's WordPress, Tim Finnegan's SpotApps CDN, O'Kelley's SpotApps CDN

UPDATE bars SET image_url = 'bars/phoenix/george-dragon-english-pub.webp' WHERE slug = 'george-dragon-phoenix';
UPDATE bars SET image_url = 'bars/phoenix/crown-public-house.webp' WHERE slug = 'crown-public-house-phoenix';
UPDATE bars SET image_url = 'bars/phoenix/kettle-black-kitchen-pub.webp' WHERE slug = 'kettle-black-phoenix';
UPDATE bars SET image_url = 'bars/phoenix/seamus-mccaffreys-irish-pub.webp' WHERE slug = 'seamus-mccaffreys-phoenix';
UPDATE bars SET image_url = 'bars/tempe/yucca-tap-room.webp' WHERE slug = 'yucca-tap-room-tempe';
UPDATE bars SET image_url = 'bars/tempe/four-peaks-brewing.jpg' WHERE slug = 'four-peaks-tempe';
UPDATE bars SET image_url = 'bars/scottsdale/kodonnells-sports-bar.jpg' WHERE slug = 'kodonnells-scottsdale';
UPDATE bars SET image_url = 'bars/glendale/tim-finnegans-irish-pub.jpg' WHERE slug = 'tim-finnegans-glendale';
UPDATE bars SET image_url = 'bars/chandler/fibber-magees.webp' WHERE slug = 'fibber-magees-chandler';
UPDATE bars SET image_url = 'bars/mesa/okelleys-sports-bar.jpg' WHERE slug = 'okelleys-mesa';
