-- Baltimore, Maryland - Geocode bars with coordinates
-- Sources: US Census Geocoding API, OpenStreetMap Nominatim

-- 1. Sláinte Irish Pub & Restaurant - 1700 Thames St (Nominatim)
UPDATE bars SET latitude = 39.2820, longitude = -76.5926 WHERE slug = 'slainte-irish-pub-baltimore';

-- 2. Smaltimore - 2522 Fait Ave (Census)
UPDATE bars SET latitude = 39.2831, longitude = -76.5805 WHERE slug = 'smaltimore-baltimore';

-- 3. Todd Conner's - 700 S Broadway (Census)
UPDATE bars SET latitude = 39.2835, longitude = -76.5936 WHERE slug = 'todd-conners-baltimore';

-- 4. Claddagh Pub - 2918 O'Donnell St (Census)
UPDATE bars SET latitude = 39.2804, longitude = -76.5748 WHERE slug = 'claddagh-pub-baltimore';

-- 5. Abbey Burger Bistro - 811 S Broadway (Census)
UPDATE bars SET latitude = 39.2824, longitude = -76.5931 WHERE slug = 'abbey-burger-fells-point-baltimore';

-- 6. Lighthouse Tavern - 1226 S Clinton St (Census)
UPDATE bars SET latitude = 39.2791, longitude = -76.5696 WHERE slug = 'lighthouse-tavern-baltimore';

-- 7. Max's Taphouse - 737 S Broadway (Census)
UPDATE bars SET latitude = 39.2832, longitude = -76.5931 WHERE slug = 'maxs-taphouse-baltimore';

-- 8. Liv's Tavern - 1113 S Charles St (Census)
UPDATE bars SET latitude = 39.2764, longitude = -76.6143 WHERE slug = 'livs-tavern-baltimore';

-- 9. Captain Larry's - 601 E Fort Ave (Census)
UPDATE bars SET latitude = 39.2729, longitude = -76.6051 WHERE slug = 'captain-larrys-baltimore';
