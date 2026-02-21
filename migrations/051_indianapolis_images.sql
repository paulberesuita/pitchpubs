-- Indianapolis / Carmel / Fishers bar images
-- All images uploaded to R2: soccerbars-v2-images/bars/{city}/
-- Added: 2026-02-20
-- Sources: IBJ (Union Jack), Wix/chathamtap.com (Chatham Tap Mass Ave, Fishers),
--          Wix/centerpointbrewing.com (Centerpoint), SpotApps/brewlinkbrewing.com (Brew Link),
--          Wix/ralstonsdraft.house (Ralston's), tomswatchbar.com WordPress (Tom's),
--          Visit Hamilton County / Simpleview CDN (Brockway)

-- Indianapolis bars
UPDATE bars SET image_url = 'bars/indianapolis/union-jack-pub-indianapolis.jpg' WHERE slug = 'union-jack-pub-indianapolis';
UPDATE bars SET image_url = 'bars/indianapolis/chatham-tap-mass-ave.jpg' WHERE slug = 'chatham-tap-mass-ave';
UPDATE bars SET image_url = 'bars/indianapolis/centerpoint-brewing-indianapolis.jpg' WHERE slug = 'centerpoint-brewing-indianapolis';
UPDATE bars SET image_url = 'bars/indianapolis/brew-link-brewpub-indianapolis.jpg' WHERE slug = 'brew-link-brewpub-indianapolis';
UPDATE bars SET image_url = 'bars/indianapolis/ralstons-drafthouse-indianapolis.jpg' WHERE slug = 'ralstons-drafthouse-indianapolis';
UPDATE bars SET image_url = 'bars/indianapolis/toms-watch-bar-indianapolis.png' WHERE slug = 'toms-watch-bar-indianapolis';

-- Carmel
UPDATE bars SET image_url = 'bars/carmel/brockway-pub-carmel.jpg' WHERE slug = 'brockway-pub-carmel';

-- Fishers
UPDATE bars SET image_url = 'bars/fishers/chatham-tap-fishers.jpg' WHERE slug = 'chatham-tap-fishers';
