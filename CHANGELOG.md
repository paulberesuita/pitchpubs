# Changelog

What we shipped. Update after each feature.

---

## 2026-02-20

### Session: Tier 2 City Expansion (5 parallel agents)

Expanded to 5 Tier 2 soccer markets in parallel:

1. **Phoenix metro** — 10 bars across 6 cities (George & Dragon since 1995, all Big Six EPL teams mapped). Migrations 037-039.
2. **New Orleans** — 8 bars (Finn McCool's is THE epicenter — 4 supporter groups, 8 sources). Migrations 040-042.
3. **Milwaukee** — 10 bars (Highbury Pub/Arsenal, Nomad since 1997, Old German Beer Hall/Bayern — unique EPL+Bundesliga identity). Migrations 043-045.
4. **Baltimore** — 9 bars (6 EPL supporter groups each with dedicated home bar, Fells Point/Canton clusters). Migrations 046-048.
5. **Indianapolis** — 8 bars (Union Jack Pub since 1979 — oldest soccer bar in DB, Chatham Tap brands itself "Soccer Pub"). Migrations 049-051.

**45 new bars. Database total: 482 bars across 61 cities in 31 states.**

---

### Indianapolis Metro, Indiana -- 8 Soccer Bars Added

**Added:**
- 8 soccer bars across Indianapolis (6), Carmel (1), and Fishers (1), Indiana
- Indianapolis, Carmel, and Fishers added to cities table (first Indiana cities)
- Indy Eleven added to teams table (USL Championship)
- All 8 bars geocoded with coordinates from US Census Geocoding API
- All 8 bars have images uploaded to R2 (100% image coverage)
- 9 team affiliations: Liverpool FC + USMNT + Indy Eleven (Union Jack Pub), Arsenal FC + Manchester United FC (Chatham Tap), Tottenham Hotspur (Centerpoint Brewing), Manchester United FC (Brew Link), FC Bayern Munich (Ralston's), Arsenal FC (Chatham Tap Fishers)
- 25 league affiliations across Premier League, Champions League, Bundesliga, La Liga, Serie A, FA Cup, MLS, FIFA World Cup, International

**Indianapolis bars (6):**
- Union Jack Pub (Broad Ripple) -- THE soccer bar of Indy since 1979, LFC Indy, American Outlaws, Brickyard Battalion (Indy Eleven)
- Chatham Tap (Mass Ave) -- Self-branded "Soccer Pub," Indy Gooners (Arsenal) origin, MUFC Indy (Man Utd) origin, Soccer Breakfast
- Centerpoint Brewing (Near-Eastside) -- Indy Spurs official home (Tottenham, 300+ members, since 2013)
- Brew Link Brewpub Downtown -- Current MUFC Indy home (Manchester United, founded 2021), veteran-owned
- Ralston's Drafthouse (Mass Ave) -- FC Bayern Munich watch parties, Bundesliga breakfast at 9:30 AM ET
- Tom's Watch Bar (Downtown) -- 10,000 sqft, 135 screens, EPL/La Liga/Bundesliga/Serie A/MLS

**Suburban bars (2):**
- Brockway Pub (Carmel) -- Dublin-inspired Irish pub, Best Guinness in North America, EPL on Live Soccer TV
- Chatham Tap Fishers -- Current Indy Gooners (Arsenal) official home, Arsenal America affiliate

**Image sources:**
- IBJ / Indianapolis Business Journal CDN (Union Jack Pub)
- Wix Static CDN / chathamtap.com (Chatham Tap Mass Ave, Chatham Tap Fishers)
- Wix Static CDN / centerpointbrewing.com (Centerpoint Brewing bar interior)
- SpotApps CDN / brewlinkbrewing.com (Brew Link Brewpub social image)
- Wix Static CDN / ralstonsdraft.house (Ralston's Drafthouse interior)
- WordPress CDN / tomswatchbar.com (Tom's Watch Bar Indianapolis location)
- Visit Hamilton County / Simpleview CDN (Brockway Pub)

**Data quality:**
- All 8 bars have 4-8 verified sources
- 4 bars open early for morning EPL/Champions League (Union Jack, Chatham Tap, Centerpoint, Chatham Tap Fishers, Ralston's)
- Union Jack Pub has the most team affiliations (3): Liverpool, USMNT, Indy Eleven
- First Indiana city in the database

**Excluded bars and why:**
- Fox and Hound (CLOSED per Yelp)
- Brugge Brasserie (CLOSED 2020)
- Claddagh Irish Pub (CLOSED, both downtown and Plainfield)
- Union Jack Pub Speedway (CLOSED July 2022)
- Chatham Tap Butler (university campus, less soccer-specific)
- The Hangar, District Tap, Twin Peaks, Yard House (general sports bars, no soccer identity)
- Havana Sports Lounge, All Stars Sports Lounge (general sports bars)
- The Avg Pub, Dugout Bar, Kip's Pub (GoodRec filler, no soccer evidence)

**Migrations:** `049_indianapolis_bars.sql`, `050_indianapolis_geocode.sql`, `051_indianapolis_images.sql`

---

### Milwaukee Metro, Wisconsin -- 10 Soccer Bars Added

**Added:**
- 10 soccer bars across Milwaukee (8), Shorewood (1), and South Milwaukee (1) -- first bars in Wisconsin
- Milwaukee, Shorewood, and South Milwaukee added to cities table
- Leeds United FC added to teams table (EFL Championship)
- All 10 bars geocoded with coordinates from US Census Geocoding API
- All 10 bars have images uploaded to R2 (100% image coverage)
- 7 team affiliations: Arsenal FC + USMNT (The Highbury), Tottenham Hotspur (Red Lion), Liverpool FC (Three Lions), Bayern Munich (Old German Beer Hall), Manchester City FC (Puddler's Hall), Leeds United FC (Brass Boar's Den)
- 38 league affiliations across Premier League, Champions League, Europa League, FA Cup, Bundesliga, La Liga, EFL Championship, International, FIFA World Cup

**Milwaukee bars (8):**
- The Highbury Pub (Bay View) -- Milwaukee's soccer shrine since 2004, Brew City Gunners (Arsenal), AO Milwaukee (USMNT), opens 6:30 AM
- Red Lion Pub (Lower East Side) -- British pub since 2011, Milwaukee Spurs (Tottenham), Union Jack ceiling, rooftop patio
- Nomad World Pub (Brady Street) -- Legendary World Cup bar since 1997, 15,000+ for 2014 USA match, opens 6:30 AM for EPL
- Old German Beer Hall (Westown) -- Hofbrauhaus replica since 2005, Mia San Milwaukee (Bayern Munich), half-price liters in kit
- SportClub (East Town) -- Upscale brother bar to Nomad, opened 2018, champagne happy hours, World Cup destination
- Puddler's Hall (Bay View) -- Milwaukee's second-oldest tavern (1873), Manchester City supporters
- Bremen Cafe (Riverwest) -- Dive bar, Saturday morning EPL, liter steins, free live music
- Brass Boar's Den Pub (West Allis) -- Leeds United Wisconsin home per Leeds Americas

**Shorewood (1):**
- Three Lions Pub -- Sister bar to Red Lion, LFC MKE (Liverpool), World Cup/Euro street festivals for 10+ years

**South Milwaukee (1):**
- Moran's Pub -- Family-owned Irish pub since 1995, owner from Birmingham, named Best Bar to Watch Soccer

**Image sources:**
- FourDollarJacks CDN (Highbury, Nomad, Old German, Puddler's, Bremen, Brass Boar's, Moran's -- 7 bars)
- The Rooftop Guide (Red Lion Pub rooftop)
- Urban Milwaukee WordPress (SportClub exterior)
- Squarespace CDN via North Shore Family Adventures (Three Lions Pub Liverpool fans)

**Data quality:**
- All 10 bars have 3-6 verified sources
- 4 bars open early for morning Premier League (Highbury 6:30 AM, Red Lion 9 AM Sat, Nomad 6:30 AM, Three Lions early EPL)
- Milwaukee is the first Wisconsin city in the database

**Migrations:** `043_milwaukee_bars.sql`, `044_milwaukee_geocode.sql`, `045_milwaukee_images.sql`

---

### New Orleans, Louisiana -- 8 Soccer Bars Added

**Added:**
- 8 soccer bars in New Orleans, Louisiana (first bars in the state)
- New Orleans added to cities table
- All 8 bars geocoded with coordinates from US Census Geocoding API
- All 8 bars have images uploaded to R2 (100% image coverage)
- 5 team affiliations: Arsenal FC, Celtic FC, Tottenham Hotspur, USMNT x2 (Finn McCool's + Rendezvous Tavern)
- 18 league affiliations across Premier League, Scottish Premiership, Champions League, MLS, FIFA World Cup

**Bars by neighborhood:**
- **Mid-City (1):** Finn McCool's Irish Pub -- THE soccer bar of New Orleans, home to Krewe of Arsenal, New Orleans CSC (Celtic), New Orleans Spurs (Tottenham), 8 sources, subject of a 2009 memoir
- **Lower Garden District (1):** The Rusty Nail -- 25 screens, 180 capacity, opens early for EPL/UCL, 275+ whiskeys
- **Bywater (1):** J&J's Sports Lounge -- European Soccer HQ, World Cup Madness, opens 9 AM daily
- **Faubourg St. John (1):** The Bell -- British pub in historic house, on Premier League USA Bar Finder
- **Garden District (1):** The Prytania Bar -- On Premier League USA Bar Finder, 7 TVs with sound system
- **Riverbend (1):** Cooter Brown's Tavern & Oyster Bar -- Since 1977, 400+ beers, 30 screens, 200 capacity
- **Irish Channel (1):** Rendezvous Tavern -- American Outlaws New Orleans chapter home bar
- **French Quarter (1):** Ryan's Irish Pub -- Decatur Street Irish pub, TripAdvisor-recommended for EPL

**Image sources:**
- WWNO/NPR Brightspot CDN (Finn McCool's World Cup crowd photo)
- SpotApps CDN (The Rusty Nail social share hero)
- Scoundrel's Field Guide WordPress (J&J's interior)
- Garden & Gun WordPress (The Bell interior by DBS photography)
- FourDollarJacks CDN (The Prytania Bar)
- NolPlaces WordPress (Cooter Brown's exterior)
- Rendezvous Tavern WordPress (interior)
- ryansirishpubinc.shop (Ryan's Irish Pub interior)

**Research sources:**
- WWNO (Finn McCool's World Cup 2022 feature)
- nola.com/Times-Picayune (The Bell review, Finn McCool's ownership)
- Arsenal.com (Krewe of Arsenal -- official supporters club page)
- CelticBars.com (New Orleans CSC at Finn McCool's)
- Tottenham Hotspur official (New Orleans Spurs OSC)
- American Outlaws (New Orleans chapter at Rendezvous Tavern)
- Premier League USA Bar Finder (Finn McCool's, The Bell, The Prytania Bar)
- GoodRec (top 10 soccer bars New Orleans)
- SportsBars.com (definitive guide 2025)
- Foursquare, TripAdvisor forums, GameWatch.info, Yelp

**Excluded bars and why:**
- Sovereign Pub (British pub but weak soccer-specific evidence, no supporter groups)
- Mid-City Yacht Club (general sports bar, no soccer identity)
- High Grace NOLA (upscale dive bar, soccer secondary to cocktails)
- Vieux Sports Saloon (French Quarter general sports bar, vague soccer mention)
- Manning's (casino sports bar, no soccer-specific programming)
- Pat O'Brien's (famous for Hurricanes, not a soccer destination)
- Erin Rose (French Quarter dive, no real soccer identity)
- Finnegan's Easy (Irish pub, no soccer-specific sources)
- LINK Sports Bar (general sports bar, only GoodRec listing)

**Data quality:**
- All 8 bars have 3-8 verified sources
- 5 bars open early for morning EPL/UCL matches
- Finn McCool's has the most sources (8) of any bar in this batch
- 3 bars on the official Premier League USA Bar Finder

**Migrations:** `040_new_orleans_bars.sql`, `041_new_orleans_geocode.sql`, `042_new_orleans_images.sql`

---

### Phoenix Metro Area, Arizona -- 10 Soccer Bars Added

**Added:**
- 10 soccer bars across 6 Arizona cities: Phoenix (4), Tempe (2), Scottsdale (1), Glendale (1), Chandler (1), Mesa (1)
- 6 new cities added to cities table: Phoenix, Tempe, Scottsdale, Glendale, Chandler, Mesa (first Arizona cities)
- Phoenix Rising FC added to teams table (USL Championship)
- All 10 bars geocoded with coordinates from US Census Geocoding API
- All 10 bars have images uploaded to R2 (100% image coverage)
- 8 team affiliations: Manchester United (George & Dragon), Liverpool FC (Crown Public House), Manchester City (Kettle Black), Celtic FC (Seamus McCaffrey's), Arsenal FC (Yucca Tap Room), Phoenix Rising FC (Four Peaks), Tottenham Hotspur (Fibber Magees), Chelsea FC (O'Kelley's)
- 28 league affiliations across Premier League, Champions League, FA Cup, La Liga, Serie A, Ligue 1, Scottish Premiership, MLS, FIFA World Cup

**Phoenix bars (4):**
- George & Dragon English Pub (Uptown) -- THE soccer pub since 1995, Phoenix Red Devils (Man Utd) home, voted Best Pub by Phoenix New Times
- Crown Public House (Downtown) -- OLSC Phoenix (Liverpool FC, founded 2013), formerly Rose & Crown, Best British Pub 2022
- The Kettle Black Kitchen & Pub (Downtown) -- Phoenix Desert Blues (Man City, founded 2014), Irish-owned, on PL USA Bar Finder
- Seamus McCaffrey's Irish Pub (Downtown) -- Co-founded Bobby Murdoch Phoenix Celtic Supporters Club, 30+ year institution

**Tempe bars (2):**
- Yucca Tap Room -- Arizona Gooners (Arsenal, est. 2011, 200+ members), dedicated room with 5 TVs + projector, opens 6 AM daily
- Four Peaks Brewing Company -- Official Phoenix Rising FC watch party venue, iconic 100-year-old former creamery

**Scottsdale (1):**
- K O'Donnell's Sports Bar & Grill -- 75+ TVs, beIN Sports (EPL, La Liga, Serie A, Ligue 1, Champions League), family-owned since 2005

**Glendale (1):**
- Tim Finnegan's Irish Restaurant and Pub -- "Only official US soccer bar in Arizona," on PL USA Bar Finder, Buzzfeed World Cup pick

**Chandler (1):**
- Fibber Magees -- Arizona Spurs (Tottenham, est. 2014, 150+ members), authentic Irish pub, KJZZ Champions League coverage

**Mesa (1):**
- O'Kelley's Sports Bar & Grill -- Phoenix Blues (Chelsea, via Chelsea in America), 50+ TVs, opens 6 AM Mon-Sat

**Image sources:**
- p2bars.com CDN (George & Dragon, Yucca Tap Room, Fibber Magees)
- FourDollarJacks CDN (Crown Public House, Kettle Black, Seamus McCaffrey's)
- Four Peaks official / builder.io CDN (Four Peaks hero image)
- K O'Donnell's WordPress (daily specials food/drink photo)
- Tim Finnegan's SpotApps CDN (restaurant interior)
- O'Kelley's SpotApps CDN (storefront exterior)

**Data quality:**
- All 10 bars have 4-6 verified sources
- 5 bars open early for morning matches (Crown Public House, Kettle Black, Yucca Tap Room, Four Peaks, O'Kelley's)
- 6 verified EPL supporter groups mapped to home bars: Man Utd, Liverpool, Man City, Arsenal, Tottenham, Chelsea
- Phoenix metro is now the most comprehensively mapped supporter-to-bar ecosystem in the database

**Excluded bars and why:**
- Rosie McCaffrey's (demolished 2024, building razed for BMW dealership)
- Tilted Kilt Pub & Eatery (permanently closed, both Phoenix and Tempe locations)
- Walter Station Brewery (closed taproom April 2025)
- Jersey D's Tavern (permanently closed December 2025)
- Rula Bula Irish Pub (closed 2021)
- The Harp Pub Mesa (permanently closed)
- Pub Rock Live (primarily music venue, soccer ancillary to Phoenix Rising game days)
- Cold Beers & Cheeseburgers (chain sports bar, no soccer identity beyond Rising partnership)
- Twin Peaks / STADIUM / CAPS Sports Grill (chain/general sports bars, no soccer-specific identity)

**Migrations:** `037_phoenix_bars.sql`, `038_phoenix_geocode.sql`, `039_phoenix_images.sql`

---

### Baltimore, Maryland -- 9 Soccer Bars Added

**Added:**
- 9 soccer bars in Baltimore, Maryland (first bars in the state)
- Baltimore added to cities table
- All 9 bars geocoded with coordinates (US Census Geocoder + OpenStreetMap Nominatim)
- All 9 bars have images uploaded to R2 (100% image coverage)
- 7 team affiliations: Chelsea FC (Slainte), Liverpool FC (Smaltimore/LFC Baltimore), Manchester United FC (Todd Conner's/Charm City Reds), West Ham United (Abbey Burger Fells Point), Tottenham Hotspur (Lighthouse Tavern/Baltimore Spurs), Arsenal FC (Liv's Tavern/Charm City Gooners), FC Barcelona (Max's Taphouse/Baltimore Blaugrana)
- 20 league affiliations across Premier League, Champions League, FA Cup, La Liga, MLS, FIFA World Cup

**Bars by neighborhood:**
- **Fells Point (4):** Slainte Irish Pub (THE soccer bar, 18 HDTVs, opens 7 AM, Chelsea home), Todd Conner's (Charm City Reds/Man Utd since 2010), Abbey Burger Bistro (West Ham fans), Max's Taphouse (Baltimore Blaugrana/Barcelona, 114 draft lines)
- **Canton (3):** Smaltimore (LFC Baltimore OLSC since 2006, free shots on Liverpool goals), Claddagh Pub (original Irish & Soccer Pub since 1995), Lighthouse Tavern (Baltimore Spurs/Tottenham, 87 members)
- **Federal Hill (1):** Liv's Tavern (Charm City Gooners/Arsenal, 18'x8' screen, 250+ members)
- **Riverside (1):** Captain Larry's (neighborhood soccer pub, Latvian-American flair)

**Image sources:**
- FourDollarJacks CDN (Slainte, Smaltimore, Claddagh, Lighthouse Tavern)
- FellsPoint.com WordPress (Todd Conner's, Abbey Burger)
- Visit Baltimore / baltimore.org (Max's Taphouse)
- Baltimore Banner (Liv's Tavern interior)
- SouthBMore directory CloudFront (Captain Larry's)

**Research sources:**
- Baltimore Sun "5 Baltimore-area pubs to celebrate Premier League soccer"
- CBS Baltimore "Best Bars To Watch Premier League Soccer In Baltimore"
- Baltimore Magazine "Ultimate Baltimore Sports Bar Guide"
- GoodRec "Where to Watch Soccer in Baltimore"
- GameWatch.info Baltimore listings
- LFC Baltimore official website (OLSC since 2006)
- Arsenal.com (Charm City Gooners, 250+ members)
- Tottenham Hotspur official (Baltimore Spurs, 87 members)
- First Touch Online (Man Utd supporters, Tottenham supporters)
- Baltimore Blaugrana website (FC Barcelona penya)
- Baltimore Banner, Baltimore Fishbowl, Yelp, TripAdvisor, Foursquare

**Excluded bars and why:**
- Abbey Burger Bistro Federal Hill (CLOSED per Yelp Jan 2025, was original Charm City Gooners home)
- The Life of Reilly (CLOSED per Yelp, was in Butchers Hill)
- The Perch (Federal Hill, limited hours closed Mon-Wed, Gooners moved to Liv's Tavern)
- Ryleigh's Oyster (Timonium, Baltimore Spurs moved to Lighthouse Tavern)
- Union Jack's (Columbia, MD -- 30+ miles from Baltimore city center)
- Sean Bolan's Irish Pub (Bel Air -- not in Baltimore)
- Mick O'Shea's (Irish pub but no confirmed soccer-specific programming)
- Benders, City Limits, Fielder's Tavern (general sports bars, no soccer identity)
- Mt Royal Tavern, Delia Foley's, Wiley Gunters (Yelp soccer bar results but no soccer-specific evidence)

**Data quality:**
- All 9 bars have 3-6 verified sources
- 4 bars open early for morning EPL (Slainte 7 AM, Smaltimore 10 AM weekends, Claddagh 9 AM weekends, Liv's Tavern)
- Bar count: 437 -> 446 (Baltimore adds 9; total now 482 with parallel city additions)
- Baltimore is the first Maryland city

**Migrations:** `046_baltimore_bars.sql`, `047_baltimore_geocode.sql`, `048_baltimore_images.sql`

---

### Tampa / St. Petersburg, Florida -- 10 Soccer Bars Added

**Added:**
- 10 soccer bars across Tampa (5) and St. Petersburg (5), Florida
- Tampa and St. Petersburg added to cities table (first Florida cities)
- Tampa Bay Rowdies added to teams table (USL Championship)
- All 10 bars geocoded with coordinates from US Census Geocoding API
- All 10 bars have images uploaded to R2 (100% image coverage)
- 10 team affiliations: Arsenal FC, Newcastle United, Manchester United FC, Manchester City FC (MacDinton's), Liverpool FC (Maloney's + Horse & Jockey), Tottenham Hotspur (James Joyce), Tampa Bay Rowdies (Yeoman's), USMNT + Celtic FC (Mary Margaret's)
- 27 league affiliations across Premier League, FA Cup, Champions League, La Liga, Serie A, Bundesliga, Europa League, MLS, FIFA World Cup

**Tampa bars (5):**
- MacDinton's Irish Pub (SoHo) -- THE soccer bar of Tampa, Gulf Coast Gooners (Arsenal), Toon Army (Newcastle), Man Utd/City
- Maloney's Local Irish Pub (Downtown) -- Official OLSC Tampa Bay home (Liverpool FC, since 2008)
- James Joyce Irish Pub & Eatery (Ybor City) -- Tampa Ybor Spurs official home (Tottenham)
- Yeoman's Cask & Lion (Downtown) -- British pub since late 1980s, EPL brunch, Rowdies
- Molly Malone's Irish Pub (Davis Islands) -- Dublin-owned, on Premier League USA Bar Finder

**St. Petersburg bars (5):**
- Mary Margaret's Olde Irish Tavern (Downtown) -- American Outlaws St. Pete chapter, multi-club hub
- The Horse & Jockey (South Pasadena) -- Since 1987, Liverpool-owned, Pinellas County LFC Supporters
- Dublin Drop (Downtown) -- Opened March 2025, largest dedicated soccer bar, shows 6 leagues
- Green Turtle Brewery & Public House (Downtown) -- Only cask ales in St. Pete, opens for 7:30 AM EPL
- Jack's London Grill (North St. Pete) -- British-owned since 2013, TripAdvisor #7 of 681

**Migrations:** `031_tampa_bars.sql`, `032_tampa_geocode.sql`, `033_tampa_images.sql`

---

### San Jose Metro Area -- 10 Soccer Bars Added

**Added:**
- 10 soccer bars across 4 Silicon Valley cities: San Jose (7), Cupertino (1), Mountain View (1), Los Gatos (1)
- 4 new cities added to cities table: San Jose, Cupertino, Mountain View, Los Gatos
- 2 new teams: San Jose Earthquakes (MLS), Bay FC (NWSL)
- All 10 bars geocoded with coordinates for map view
- All 10 bars have images uploaded to R2 (100% image coverage)
- 8 team affiliations: San Jose Earthquakes (5 bars), Liverpool FC, Arsenal FC, Bay FC
- 24 league affiliations across Premier League, MLS, Champions League, NWSL, FIFA World Cup

**Bars by tier:**
- **Official Earthquakes watch party venues:** O'Flaherty's Irish Pub (San Pedro Square), The Old Wagon Saloon & Grill (San Pedro Square)
- **Supporter group HQs:** O'Flaherty's (LFC Silicon Valley -- Liverpool), Jack's Bar & Lounge (Silicon Valley Gooners -- Arsenal, American Outlaws, Bay FC Bridge Brigade)
- **British pubs with EPL:** The Brit (Britannia Arms Downtown, 25 TVs), Britannia Arms Almaden (Premier League USA Bar Finder), Duke of Edinburgh (Cupertino, since 1983), St. Stephen's Green (Mountain View, Irish)
- **Sports bars:** Rookies Sports Lodge Willow Glen (Premier League USA Bar Finder, 22+ screens), Rookies Sports Lodge Downtown (35+ 4K TVs), Double D's Sports Grille (Los Gatos, Mercury News Best Sports Bar)

**Image sources:**
- Squarespace CDN (O'Flaherty's hero, Duke of Edinburgh bar interior)
- Visit San Jose / Simpleview CMS (Jack's, Old Wagon Saloon, The Brit, Rookies Willow Glen)
- SF Station CDN (Britannia Arms Almaden, Rookies Downtown)
- Cloudflare Images / imagedelivery.net (St. Stephen's Green)
- WordPress / doubleds.com (Double D's outdoor patio)

**Data quality:**
- All 10 bars have 3-6 verified sources
- 5 bars open early for morning Premier League/Champions League (O'Flaherty's 7am, Jack's 6am, Old Wagon 5am, The Brit, Britannia Arms Almaden 9am weekends)
- Jack's Bar is the most soccer-connected venue: Arsenal (Silicon Valley Gooners since 2014), SJ Earthquakes (Team 408), Bay FC (Bridge Brigade), American Outlaws

**Total bar count:** 387 -> 397 (from this session)
**San Jose metro coverage:** 10 bars, 10/10 images (100%), 10/10 geocoded

**Migrations:** `025_san_jose_bars.sql`, `026_san_jose_geocode.sql`, `027_san_jose_images.sql`

---

### Pittsburgh, Pennsylvania -- 9 Soccer Bars Added

**Added:**
- 9 soccer bars in Pittsburgh, Pennsylvania (first bars in the state)
- Pittsburgh added to cities table
- Pittsburgh Riverhounds SC added to teams table (USL Championship)
- All 9 bars geocoded with coordinates for map view
- All 9 bars have images uploaded to R2 (100% image coverage)
- 5 team affiliations: Tottenham Hotspur (Piper's Pub), Arsenal FC + Celtic FC (Cork Harbour), Pittsburgh Riverhounds SC (Mike's Beer Bar), Crystal Palace (Thunderbird Cafe)
- 30 league affiliations across Premier League, Champions League, Europa League, FA Cup, Serie A, Bundesliga, Scottish Premiership, MLS, International, FIFA World Cup

**Bars by neighborhood:**
- **South Side (3):** Piper's Pub (THE soccer bar since 1999, Tottenham home), Jack's Bar (7 AM opens, dive bar), Hofbrauhaus Pittsburgh (German beer hall, World Cup)
- **Lawrenceville (3):** Cork Harbour Pub (Steel City Gooners + Pittsburgh CSC home, most loaded schedule), The Pitch on Butler (purpose-built soccer bar by Piper's Pub vet), Thunderbird Cafe & Music Hall (Crystal Palace supporters)
- **North Side (2):** Mike's Beer Bar (official Riverhounds watch party home, 80+ taps), Monterey Pub (Irish pub, EPL atmosphere)
- **Morningside (1):** The Bulldog Pub (7 AM Saturday opens, #BulldogBrunchLeague)

**Image sources:**
- Pittsburgh Manifold/Independent (Piper's Pub reopening article)
- Pittsburgh Magazine (Cork Harbour Pub St. Patrick's feature)
- FourDollarJacks CDN (Bulldog Pub, Monterey Pub, The Pitch on Butler)
- Visit Pittsburgh / IDSS Imgix (Mike's Beer Bar)
- Hofbrauhaus Pittsburgh official WordPress (hero image)
- p2bars CDN (Jack's Bar neon glass block exterior)
- NextPittsburgh WordPress (Thunderbird Cafe building)

**Research sources:**
- Visit Pittsburgh top 6 soccer bars guide
- CBS Pittsburgh Premier League bars list
- Premier League USA Bar Finder (Piper's Pub, Thunderbird Cafe)
- GameWatch.info Pittsburgh listings
- Steel City Gooners / Arsenal America (Cork Harbour)
- Pittsburgh Celtic Supporters Club / CelticBars.com (Cork Harbour)
- Tottenham Hotspur official supporters clubs (Pittsburgh Spurs at Piper's)
- Riverhounds SC official announcement (Mike's Beer Bar partnership)
- American Scouser (LFC Pittsburgh OLSC spotlight)
- WPXI (The Pitch on Butler opening)
- Pittsburgh Magazine, TribLive, Yelp, FourSquare

**Excluded bars and why:**
- Claddagh Irish Pub (permanently closed since 2019)
- Oliver's Pourhouse (Greensburg, 30+ miles from Pittsburgh)
- Carmella's Plates & Pints (cocktail bar, weak soccer credentials)
- Bigham Tavern (general sports bar, only World Cup mention)
- Mullaney's Harp & Fiddle (no soccer evidence, closed Sun/Mon)
- Industry Public House (North Fayette, far from city core)

**Data quality:**
- All 9 bars have 3-6 verified sources
- 4 bars open early for morning Premier League (Piper's, Bulldog, Monterey, Jack's)
- Bar count: 387 -> 437 (with other cities added in parallel)
- Pittsburgh is the 2nd Pennsylvania city after Philadelphia

**Migrations:** `034_pittsburgh_bars.sql`, `035_pittsburgh_geocode.sql`, `036_pittsburgh_images.sql`

---

### Salt Lake City & Taylorsville, Utah -- 12 Soccer Bars Added

**Added:**
- 12 soccer bars across Salt Lake City (11) and Taylorsville (1), Utah
- Salt Lake City and Taylorsville added to cities table
- Real Salt Lake added to teams table (MLS, joined 2005)
- All 12 bars geocoded with coordinates from US Census Geocoder
- All 12 bars have images uploaded to R2 (100% image coverage)
- 10 team affiliations (Real Salt Lake x7, Arsenal FC, Tottenham Hotspur, Liverpool FC)
- 26 league affiliations (Premier League, MLS, Champions League, FIFA World Cup)

**Bars by type:**
- **Supporter club HQs:** Fiddler's (Utah Gooners/Arsenal), Legends Pub & Grill (SLC Spurs/Tottenham), Beer Bar (AO Salt Lake City/USMNT), Crossroads Bar & Grill (Salt Lake City Reds/Liverpool)
- **RSL-focused bars:** Dick N' Dixie's (RSL paraphernalia, player hangout), Shades Brewing (RSL watch parties)
- **RSL watch party venues:** Piper Down Pub, Poplar Street Pub, Gracie's
- **Major sports complexes:** Flanker Kitchen + Sporting Club (17,500 sqft, 60+ screens)
- **British/Scottish pubs:** The Bruce Scottish Pub (Scottish fare, UEFA events), Piper Down Pub (Irish pub since 2003)
- **Downtown icons:** The Green Pig Pub (World Cup hub, voted best sports bar)

**Image sources:**
- Gastronomic SLC (Fiddler's interior, 2025 reopening article)
- Squarespace CDN (Beer Bar exterior, Shades Brewing taproom)
- FourDollarJacks CDN (Legends, Dick N' Dixie's, Piper Down, Green Pig, Flanker, Poplar Street, Gracie's)
- Flanker official website (venue interior, Canon 5D Mark III photo)
- Crossroads official Webflow CDN (bar interior)
- The Bruce official Webflow CDN (pub interior)

**Research notes:**
- Fiddler's Elbow closed August 2024, reopened mid-2025 as "Fiddler's" under new ownership -- listed under new name
- Bout Time Pub (Rio Grande) CLOSED, replaced by The Bruce Scottish Pub -- excluded Bout Time, included The Bruce
- Trolley Wing Co (2148 S 900 E) CLOSED -- excluded
- Salt Lake City has 4 verified EPL supporter groups with dedicated bars (Arsenal, Tottenham, Liverpool, plus Man City/Everton at Beer Bar)

**Total bar count:** 425 -> 437
**Utah coverage:** 12 bars, 12/12 images (100%), 12/12 geocoded

**Migrations:** `022_salt_lake_city_bars.sql`, `023_salt_lake_city_geocode.sql`, `024_salt_lake_city_images.sql`

---

### Sacramento & West Sacramento, California -- 9 Soccer Bars Added

**Added:**
- 9 soccer bars across Sacramento (7) and West Sacramento (2), California
- Sacramento and West Sacramento added to cities table (first California cities)
- Sacramento Republic FC added to teams table (USL Championship)
- All 9 bars geocoded with coordinates for map view
- All 9 bars have images uploaded to R2 (100% image coverage)
- 7 team affiliations: Manchester United FC, Tottenham Hotspur FC (Zebra Club), Arsenal FC + USMNT (Henry's Lounge), Liverpool FC (Fieldhouse), Sacramento Republic FC (Tom's Watch Bar, Jackrabbit Brewing)
- 20 league affiliations across Premier League, Champions League, Europa League, MLS, International, FIFA World Cup

**Bars by tier:**
- **THE soccer bar:** Zebra Club (Midtown) -- Official PL USA watch bar, River City Red Devils (Man United since 2013) + Sacramento Spurs (Tottenham, 75+ members since 2014), opens 6 AM, 6 sources
- **Supporter group HQs:** Henry's Lounge (Sacramento Gooners + American Outlaws), Fieldhouse (LFC Sacramento)
- **British/Irish pubs:** Fox & Goose Public House (est. 1975, named after Yorkshire pub), Streets of London (West Sacramento), Pitch and Fiddle (Irish pub named for the soccer pitch)
- **Euro pub:** Bonn Lair (est. 1993, European atmosphere, UK/Euro beers)
- **Sports bar:** Tom's Watch Bar (360-degree screens, Republic FC watch parties, DOCO downtown)
- **Brewery partner:** Jackrabbit Brewing Company (Republic FC Blood, Sweat & Beers Council)

**Excluded bars and why:**
- de Vere's Irish Pub (CLOSED October 2021, pandemic casualty)
- Hot Italian (CLOSED, replaced by 5 Tacos & Beers)
- Tapa the World (Spanish tapas restaurant, not a soccer bar)
- Clubhouse 56 (general sports bar, no soccer-specific identity)
- Sean Finnegan's (Irish pub in Old Sacramento, no soccer credentials)

**Image sources:**
- FourDollarJacks CDN (Zebra Club, Henry's Lounge, Tom's Watch Bar)
- Scoundrel's Field Guide WordPress (Bonn Lair exterior)
- California Through My Lens WordPress (Fox & Goose)
- Squarespace CDN (Fieldhouse interior/TVs, Pitch and Fiddle, Jackrabbit Brewing events)
- Streets of London WordPress (British pub storefront)

**Total bar count:** 387 -> 396 (plus bars added by parallel agents)
**Sacramento coverage:** 9 bars, 9/9 images (100%), 9/9 geocoded

**Migrations:** `028_sacramento_bars.sql`, `029_sacramento_geocode.sql`, `030_sacramento_images.sql`

---

### St. Louis, Missouri -- 10 Soccer Bars Added

**Added:**
- 10 soccer bars in St. Louis and Webster Groves, Missouri
- St. Louis added to cities table
- St. Louis CITY SC added to teams table (MLS, joined 2023)
- All 10 bars geocoded with coordinates for map view
- All 10 bars have images uploaded to R2
- 12 team affiliations (9 bars affiliated with St. Louis CITY SC, 1 with Arsenal FC, 1 with Bayern Munich)
- 27 league affiliations (Premier League, MLS, Champions League, La Liga, Serie A, Bundesliga, FIFA World Cup)

**Bars by tier:**
- **Dedicated soccer bars:** Amsterdam Tavern (Tower Grove South), The Pitch Athletic Club & Tavern (Union Station), International Tap House (Soulard), Llywelyn's Pub (Webster Groves)
- **Supporter group HQs:** Schlafly Tap Room (St. Louligans pre-match party), 2nd Shift Brewing (Brewligans IPA), Llywelyn's (Gateway Gooners + Mia San STL)
- **CITY on Tap partners:** Maggie O'Brien's, Beffa's Bar & Restaurant, Sports & Social STL
- **English pub:** Fox & Hounds Tavern (Cheshire Inn)

**Image sources:**
- Amsterdam Tavern official website (storefront exterior)
- Explore St. Louis (The Pitch interior, Schlafly Tap Room)
- Cheshire Inn / Galaxy CDN (Fox & Hounds fireplace interior)
- Squarespace CDN (2nd Shift Brewing patio sunset)
- SpotOn CDN (Llywelyn's Pub interior)
- FourDollarJacks CDN (International Tap House beer tap fountain, Beffa's CITY SC match day)
- eVisitorGuide (Maggie O'Brien's food/Guinness)
- Sitecore/Cordish CDN (Sports & Social bar interior)

**Total bar count:** 341 -> 375 (with other cities added in parallel)
**St. Louis coverage:** 10 bars, 10/10 images (100%), 10/10 geocoded

**Migrations:** `011_st_louis_bars.sql`, `012_geocode_st_louis.sql`, `013_st_louis_images.sql`

---

### Detroit Metro Area -- 12 Soccer Bars Added

**Added:**
- 12 soccer bars across 5 Michigan cities: Detroit (7), Hamtramck (2), Royal Oak (1), Warren (1), Plymouth (1)
- 5 new cities added to cities table: Detroit, Hamtramck, Royal Oak, Warren, Plymouth
- 1 new team: Detroit City FC (USL Championship)
- 10 team affiliations: Liverpool FC, Arsenal FC, Chelsea FC, Manchester City FC, Tottenham Hotspur, Detroit City FC (3 bars), West Ham United, Celtic FC
- 19 league affiliations across Premier League, Champions League, MLS, Scottish Premiership, FIFA World Cup
- All 12 bars geocoded with coordinates from US Census Geocoding API
- All 12 bars have images (100% coverage) uploaded to R2

**Notable Detroit bars:**
- Thomas Magee's Sporting House Whiskey Bar (Eastern Market) -- THE Detroit soccer bar, official LFC Detroit home (500+ members), best EPL bar in Michigan
- Detroit City Clubhouse (Lafayette Park) -- DCFC's own bar inside the Fieldhouse, Premier League brunch, West Ham supporters
- McShane's Irish Pub (Corktown) -- Arsenal Detroit home, 21 screens, exterior painted Arsenal red
- Royal Oak Brewery (Royal Oak) -- Shared home of Motor City Blues (Chelsea) and Metro Detroit Blues (Man City)
- Fowling Warehouse (Hamtramck) -- Official DCFC pre-match bar, March to the Match starting point
- New Dodge Lounge (Hamtramck) -- Northern Guard Supporters pre-match bar
- The Commonwealth Club (Warren) -- English expat social club since 1962, British soccer viewing
- Collect Beer Bar (East Village) -- Detroit Celtic Supporters Club home

**Research sources:**
- Detroit News soccer bar features (2018, 2019), CBS Detroit, GoodRec top 10
- Premier League USA Bar Finder, Fanzo/MatchPint
- Official supporter club websites: LFC Detroit (OLSC), Arsenal.com, Chelsea in America, Man City official, Tottenham official, Detroit Celtic SC, Northern Guard Supporters
- Detroit City FC official (detcityfc.com), Visit Detroit soccer guide
- MI Football Social network

**Image sources:**
- Vox CDN (Thomas Magee's), Google Maps Place Photos (Detroit City Clubhouse), Wanderlog CDN (McShane's, Old Shillelagh), OnTheGrid S3 (Mercury Burger Bar, Fowling Warehouse), FourDollarJacks (Nemo's Bar), PartySlate (New Dodge Lounge), SpotApps/SpotHopper (Royal Oak Brewery), Macomb Daily WordPress (Commonwealth Club), Plymouth Chamber CDN (Sean O'Callaghan's), ArcPublishing/ClickOnDetroit (Collect Beer Bar)

**Data quality:**
- All 12 bars have 3-6 verified sources confirming soccer credentials
- 3 bars open early for morning Premier League matches (Thomas Magee's, Detroit City Clubhouse, McShane's)
- Bar count: 375 -> 387

**Migrations:** `013_detroit_bars.sql`, `014_geocode_detroit.sql`

---

### Cincinnati & Covington City Expansion -- 12 Soccer Bars Added

**Added:**
- 12 soccer bars across Cincinnati, OH (10) and Covington, KY (2)
- Cincinnati and Covington added to the cities table
- FC Cincinnati added to the teams table
- All 12 bars geocoded with coordinates for map view
- All 12 bars have images uploaded to R2 (100% image coverage)
- 14 team affiliations (FC Cincinnati across 7 bars, Liverpool/Arsenal/Aston Villa/West Ham at Rhinehaus, Arsenal at The Pitch)
- 40 league affiliations (Premier League, MLS, Champions League, Bundesliga, World Cup, GAA)

**Notable bars:**
- Rhinehaus (OTR) -- THE soccer bar of Cincinnati, 14 4K TVs, home to 6 supporter groups (LFC Cincinnati, Ohio Blues, Cincy Gooners, Cincy Villains, Cincy Hammers)
- The Pitch Cincy (West End) -- Purpose-built soccer bar across from TQL Stadium, 50 TVs + 2-story video wall, Cincy Gooners (Arsenal) home, 600 capacity
- Molly Malone's (Covington) -- The original Cincy soccer bar since 2007, Irish-owned, EPL at 7am, organized trips to Old Trafford and Anfield
- Hap's Irish Pub (Hyde Park) -- True soccer pub, 40+ years, opens 7:45am for big EPL matches, cash only
- Northern Row Brewery (OTR) -- The Pride (FC Cincinnati first supporters group) home base, The March to TQL departs here

**Data quality:**
- All bars have 3-4 verified sources (GoodRec, Cincinnati Refined, Visit Cincy, CityBeat, FC Cincinnati pub partners, supporter club sites)
- Excluded 8+ candidates that were closed or had weak soccer credentials (Fifty West, Lachey's, Cock & Bull Hyde Park/Glendale, Knockback Nats, Murphy's, Arnold's, Fowling Warehouse)
- Total bar count increased by 12
- 2 new cities: Cincinnati (OH), Covington (KY)

**Migrations:** `012_cincinnati_bars.sql`, `013_geocode_cincinnati.sql`, `014_cincinnati_images.sql`

---

### Las Vegas City Expansion -- 12 Soccer Bars Added

**Added:**
- 12 soccer bars in Las Vegas, Nevada (new city, first bars in the state)
- Las Vegas added to cities table as a FIFA World Cup 2026 host city (Allegiant Stadium)
- Las Vegas Lights FC added to teams table (USL Championship)
- 12 images uploaded to R2 and linked (100% image coverage)
- All 12 bars geocoded with coordinates for map view
- 6 team affiliations: Liverpool FC, Crystal Palace, Everton, Arsenal FC, Bayern Munich, USMNT
- 57 league affiliations across Premier League, Champions League, World Cup, MLS, Bundesliga, La Liga, Serie A, and more
- 8 of 12 bars confirmed to open early for morning Premier League matches

**Notable bars:**
- McMullan's Irish Pub (Spring Valley) -- Official Liverpool FC Supporters Club of Las Vegas, 6 sources
- Crown & Anchor Pub (Chinatown) -- "Las Vegas's home for soccer," Premier League USA Bar Finder, US Soccer Federation sponsor
- Ri Ra Irish Pub (The Strip) -- EPL Breakfast Club with 6 AM PT kickoffs, authentic Irish pub shipped from Ireland
- Hofbrauhaus Las Vegas (Paradise) -- German beer hall with FIFA World Cup and Bayern Munich viewing parties
- Hennessey's Tavern (Downtown) -- American Outlaws Las Vegas home bar since 2011 (65th chapter)
- Jackpot Bar & Grill (Spring Valley) -- Official Arsenal America branch location

**Data quality:**
- All bars have 3-6 verified sources (Premier League Bar Finder, Review-Journal, GoodRec, Neighborhoods.com, Fanzo, official club sites)
- Total bar count: 341 -> 353
- Total cities: now includes Las Vegas, NV (1st Nevada city)

**Migrations:** `014_las_vegas_bars.sql`, `015_geocode_las_vegas.sql`, `016_las_vegas_images.sql`

---

### Session: Content Quality Sweep (3 parallel workstreams)

Ran a full content audit and executed three priorities in parallel:

1. **15 rich profiles written** — Top 1-2 bars in all 8 cities that had zero content (Charlotte, Columbus, Portland, Kansas City, Austin, Nashville, San Diego, Minneapolis). Content coverage: 21 → 36 bars, 0 cities with 10+ bars and no profiles.
2. **3 DC bar images found** — Irish Channel, Suzie Q's, Lou's City Bar. Image coverage: 338 → 341 (100%). Lou's City Bar flagged as possibly closed.
3. **12 team affiliations added** — San Diego FC pub partners (5 bars), Chelsea/Man Utd supporter bars in Denver/SF/San Diego, Boston Legacy FC (NWSL). Team coverage: 233 → 245 bars (72%).

**Migrations:** `009_content_15_bars.sql`, `010_fill_team_affiliations_round2.sql`

---

### Rich Content Profiles for 15 Bars Across 8 Cities

**Added:**
- Detailed 200-400 word write-ups for 15 bars across 8 cities that previously had zero content profiles
- All profiles follow the established 6-section format: The Vibe, The Setup, Match Day Experience, Food and Drink, Who Goes There, Insider Tips
- Content stored in `bars.content` field as structured HTML
- All content sourced from official websites, news articles, supporter club sites, and verified reviews

**Bars with new content by city:**
- Charlotte: Courtyard Hooligans -- Charlotte's OG soccer bar since 2009, Save The Crew era David Tepper visit
- Columbus: Fado Irish Pub (Easton) -- Four authentic Irish interiors, Crew Pub Network; Endeavor Brewing -- Save The Crew movement HQ, Columbus's only brewstillery
- Portland: GOL Soccer Bar -- Dedicated soccer bar since 2019 on Hawthorne; Horse Brass Pub -- Portland institution since 1976, Don Younger's craft beer pioneer pub
- Kansas City: No Other Pub -- Official 21,000 sqft Sporting KC bar with bowling/gaming; Johnny's Tavern -- Cauldron and American Outlaws home base
- Austin: Haymaker -- Austin Chronicle Best Sports Bar 2023/2024, American Outlaws HQ; Mister Tramps -- Scottish-owned Tottenham bar with soccer field floor since 2009
- Nashville: Fogg Street Lawn Club -- Official Nashville SC pub with rooftop lawn bowling; Fleet Street Pub -- Manchester-born owner's underground English pub on Printers Alley
- San Diego: Shakespeare Pub -- British expat institution since 1990, Best Fish & Chips in USA 2017; Princess Pub -- San Diego's original British pub since 1984, Scouse-owned Liverpool FC home
- Minneapolis: Brit's Pub -- 30+ year institution with rooftop lawn bowling, Pub of Year 2025; The Local -- 11,000 sqft Irish pub, world's #1 Jameson seller four years running

**Content coverage:**
- Before: 21 bars with content across 15 cities
- After: 36 bars with content across 23 cities
- All 8 target cities went from 0 profiles to 1-2 profiles each

**Migration:** `009_content_15_bars.sql`

---

### Team Affiliation Round 2 -- 7 Bars in 4 Cities + 2 New MLS/NWSL Teams

**Added:**
- 12 new team affiliations across 8 bars in 4 cities:
  - Denver: The British Bulldog (Chelsea FC via Rocky Mountain Blues)
  - San Diego: Shakespeare Pub (Chelsea FC, Manchester United, San Diego FC), Fairplay (San Diego FC), SD TapRoom (San Diego FC), Knotty Barrel (San Diego FC), Bluefoot Bar (San Diego FC), O'Brien's Pub (San Diego FC)
  - Boston: Drawdown Brewing (Boston Legacy FC)
  - San Francisco: Mad Dog in the Fog (Chelsea FC via SF Bay Area Blues)
- 2 new teams added to teams table: San Diego FC (MLS), Boston Legacy FC (NWSL)
- San Diego FC pub partner affiliations verified from official sandiegofc.com/club/events/pub-partner page

**Research methodology:**
- Verified Rocky Mountain Blues as official Chelsea FC supporters at British Bulldog (rockymountainblues.wordpress.com)
- Shakespeare Pub confirmed as Chelsea/Man Utd home bar via SoccerNation and The Voyageer
- San Diego FC Pub Partner list scraped from official SDFC website -- 4 bars in our DB are partners
- Mad Dog in the Fog confirmed as SF Bay Area Blues (Chelsea) home via premierleague.com USA Bar Finder
- Drawdown Brewing confirmed as Boston Legacy FC hub via Matador Network and NWSL Boston ISA events
- 26 bars in Dallas, Denver, Boston, SF researched with no verifiable team affiliation -- documented as general sports bars in migration comments

**Team coverage by city (before -> after):**
| City | Before | After |
|------|--------|-------|
| San Diego | 42% (5/12) | 75% (9/12) |
| San Francisco | 45% (5/11) | 55% (6/11) |
| Denver | 43% (6/14) | 50% (7/14) |
| Boston | 36% (4/11) | 45% (5/11) |
| Dallas | 45% (5/11) | 45% (5/11) -- no new affiliations found |

**Overall:** 233 bars with teams -> 245 bars with teams (72% of 341)

**Migration:** `009_fill_team_affiliations_round2.sql`

---

### Final 3 DC Bar Images -- 100% Coverage Maintained at 341 Bars

**Added:**
- Images for the last 3 Washington DC bars that were missing images:
  - Irish Channel (Chinatown) -- exterior photo from Downtown DC / Google Maps Place Photos showing the burgundy awning and brick building on H Street
  - Suzie Q's (Navy Yard) -- exterior photo from PoPville showing the "Cold Beer Suzie Q's Sold Here" signage with outdoor picnic tables
  - Lou's City Bar (Columbia Heights) -- Arsenal supporters match day atmosphere photo from PoPville showing packed bar watching soccer on big screens
- 3 new images uploaded to R2 bucket `soccerbars-v2-images` at `bars/washington/`

**Image coverage:** 341/341 bars (100%) -- zero bars missing images across the entire database

**Sources:**
- Irish Channel: Downtown DC business directory (Google Maps Place Photos CDN)
- Suzie Q's: PoPville opening announcement article (May 2025)
- Lou's City Bar: PoPville sports bar feature article (July 2023, photo credit Joe Newman)

**Note:** Lou's City Bar appears to have permanently closed as of April 2025 per PoPville reporting. May need to be flagged or removed in a future data quality pass.

---

### Washington DC & Arlington -- 19 Soccer Bars Added

**Added:**
- 19 soccer bars across Washington DC (17) and Arlington, VA (2)
- Washington DC and Arlington added to the cities table
- 2 new cities: Washington (DC) and Arlington (VA)
- 16 of 19 bars have images (84% coverage) uploaded to R2
- All 19 bars geocoded with coordinates for map view
- 38 team affiliations including DC United, Arsenal, Liverpool, Tottenham, Chelsea, Manchester United, FC Barcelona, Fulham, Crystal Palace
- 86 league affiliations (Premier League, MLS, Champions League, La Liga, Serie A, Bundesliga, FIFA World Cup, GAA)

**Notable DC bars:**
- Lucky Bar (Dupont Circle) -- THE legendary DC soccer bar, Arsenal/Man United/Man City
- The Queen Vic (H Street) -- Official Liverpool FC bar
- Exiles Bar (U Street) -- Liverpool FC watch bar
- Franklin Hall (U Street) -- Official Arsenal bar, DC Armoury home pub
- Irish Channel (Chinatown) -- Official Tottenham Spurs bar, DC Spurs home
- The Artemis (Columbia Heights) -- Premier soccer bar with 20 HD TVs
- Elephant & Castle (Downtown) -- FC Barcelona supporters, British pub
- Ireland's Four Courts (Arlington) -- Named top 100 soccer bar by Men in Blazers, Chelsea/Crystal Palace
- Suzie Q's (Navy Yard) -- Fulham FC supporters bar

**Data quality:**
- All bars have 3-5 verified sources (Washington Post, Fanzo, GoodRec, DC United, supporter club sites)
- 10 bars confirmed as opening early for morning Premier League matches
- Total bar count: 322 -> 341

**Migrations:**
- `004_washington_dc_bars.sql` -- 19 bars, team/league affiliations, cities
- `005_geocode_dc.sql` -- Coordinates for all 19 bars
- `006_dc_images.sql` + `007_dc_images2.sql` -- Image URL updates

---

### Rich Long-Form Content for 16 Iconic Soccer Bars

**Added:**
- Detailed 200-400 word write-ups for 16 bars across major cities, covering: The Vibe, The Setup, Match Day Experience, Food & Drink, Who Goes There, and Insider Tips
- Content stored in `bars.content` field as structured HTML with `<h3>` subheadings and `<p>` paragraphs
- All content sourced from official websites, reviews, articles, and supporter group pages

**Bars with new content:**
- Atlanta: Brewhouse Cafe (id 1) -- America's Best Soccer Bar per Men in Blazers
- Boston: The Banshee (id 71) -- Boston's #1 soccer bar
- Chicago: AJ Hudson's Public House (id 268) -- Chicago's original soccer pub since 1992
- Denver: The Celtic on Market (id 297) -- 40+ screens, 12+ supporter clubs
- Houston: The Phoenix on Westheimer (id 112), Social Beer Garden HTX (id 111)
- Los Angeles: Joxer Daly's (id 124), Lucky Baldwin's Pub (id 127)
- New York: Football Factory at Legends (id 157), Smithfield Hall (id 158), Banter Bar (id 176)
- Orlando: Harp & Celt Irish Pub (id 285), Murphy's Pub Orlando (id 286)
- Philadelphia: Cavanaugh's Headhouse (id 21)
- San Francisco: Danny Coyle's (id 47)
- Seattle: The Atlantic Crossing (id 59)

**Changed:**
- Detail page (`functions/bars/[[slug]].js`) now renders `content` field as trusted HTML instead of escaping it, with Tailwind prose styling for `<h3>` and `<p>` elements
- Description fallback still escaped for safety
- Auto-linking of city/state mentions works in both HTML content and plain description modes

---

### Fill Team & League Affiliations for Priority Cities

**Added:**
- 14 new team affiliations across 12 bars in 4 cities:
  - Boston: The Greatest Bar (Liverpool FC via LFC Boston)
  - Charlotte: Courtyard Hooligans (Tottenham Hotspur, USMNT), Big Ben (Crystal Palace, West Ham United), The Workman's Friend (Charlotte FC), Kilted Buffalo (Charlotte FC), HopFly Brewing (Charlotte FC), Salud Beer Shop (Arsenal FC), Gin Mill South End (Charlotte FC), Queen Park Social (Charlotte FC)
  - Minneapolis: The Local (Minnesota United FC), Kieran's Irish Pub (USMNT)
- Charlotte FC added as new team slug in bar_teams (5 bars in Charlotte FC bar network)
- 39 new league affiliations across 29 bars in all 7 priority cities
- League coverage in priority cities jumped to 100% for 6 of 7 cities (Boston at 82%)

**Research methodology:**
- Verified affiliations from official supporters club websites (lfcboston.com, charlottefootballclub.com/bar-network)
- Cross-referenced Premier League USA Bar Finder, Matador Network city guides, local news articles
- Used `INSERT OR IGNORE` to safely handle any existing data
- Documented unverified bars with comments explaining why no affiliation was added

**Migration:** `004_fill_team_affiliations.sql`

**Team coverage by city (before -> after):**
| City | Before | After |
|------|--------|-------|
| Charlotte | 25% (4/16) | 75% (12/16) |
| Minneapolis | 33% (3/9) | 56% (5/9) |
| Boston | 27% (3/11) | 36% (4/11) |

**Overall:** 211 bars with teams -> 222 bars with teams (69% of 322)

---

### 100% Image Coverage -- All 20 Missing Bar Images Uploaded

**Added:**
- Images for all 20 bars that were missing images, bringing coverage from 93.8% (302/322) to 100% (322/322)
- 20 new images uploaded to R2 bucket `soccerbars-v2-images`

**Bars with new images:**
- Boston: The Greatest Bar (from Discotech)
- Houston: Ron's Pub (from TripAdvisor CDN), Social Beer Garden HTX (from 365 Things Houston)
- Los Angeles: La Chuperia (from Fanzo/MatchPint CDN), Rock & Reilly's (from TimeOut), Shannon's On Pine (from Visit Long Beach), Springbok Bar & Grill (from TimeOut), Trademark Brewing (from Visit Long Beach), Wirtshaus (from TimeOut)
- New York: Flannery's Bar (from Tottenham Hotspur official), Football Factory at Legends (from Sideways NYC), New York Beer Company (from MurphGuide)
- Orlando: Burton's Thornton Park (from Downtown Orlando), Fixtion (from OpenTable), The Castle Irish Pub (from Scott Joseph Orlando), The Sideline at XL Soccer World (from Fanzo/MatchPint CDN), Yard Bar (from Untappd)
- Portland: Calcio Soccer Bar (from Untappd), GOL Soccer Bar (from Portland Monthly/Cloudinary)
- Somerville: Parlor Sports (from Boston Magazine)

**Image naming convention:** `bars/[city-lowercase]/[slug].jpg` matching existing pattern

---

### Fix League Name Duplicates

**Fixed:**
- Standardized "Champions League" (17 rows) to "UEFA Champions League" -- was showing as two separate leagues
- Standardized "Major League Soccer" (4 rows) to "MLS" -- was showing as two separate leagues

---

### Geocode All 322 Bars

**Added:**
- Latitude and longitude coordinates for all 322 bars (100% coverage, was 0%)
- Migration `003_geocode_bars.sql` with 322 UPDATE statements
- Geocoding script `scripts/geocode_bars.mjs` using Nominatim/OpenStreetMap API
- Retry script `scripts/geocode_retry.mjs` for handling addresses with suite/unit numbers

**Fixed:**
- Rivercrest (Astoria, Queens) was geocoded to Albany, NY due to Queens-style "33-15" address format -- corrected to proper Astoria coordinates

**Data quality:**
- All coordinates verified within continental US bounds (lat 25.75-47.68, lng -122.75 to -71.05)
- Outlier detection run: only 1 bar needed correction out of 322
- 313 bars geocoded on first pass, 7 on retry with simplified addresses, 2 manually looked up

---

### Homepage Redesign — Minimalist Directory Layout

**Added:**
- Infinite scroll on homepage — loads 24 bars at a time via `/api/items` endpoint as user scrolls
- City dropdown filter — all 22 cities with bar counts
- Order by dropdown — Latest, Name (A to Z), Name (Z to A)
- State filter pills with full state names (California, not CA) in horizontal scrollable row
- Scroll fade hint on pills row — gradient fades out at right edge, disappears when fully scrolled
- Expandable inline search — search icon expands to input field, filters cards in real time client-side
- Sort support added to `/api/items` endpoint (latest, az, za)

**Changed:**
- Container width expanded from `max-w-5xl` (1024px) to `max-w-7xl` (1280px) across all pages
- Grid changed from 3 columns to 4 columns on desktop
- Hero simplified — removed search bar, just headline + tagline
- Removed features strip, Featured Cities section, Popular Leagues section from homepage
- Removed border under navigation header
- Reduced spacing between hero and directory listings
- Nav links simplified: Browse, Cities, Leagues, About (removed States, Categories)
- Custom dropdown chevrons with proper spacing (replaced cramped native carets)
- Replaced pagination with infinite scroll

**Removed:**
- Features strip section
- Featured Cities cards section
- Popular Leagues cards/pills section
- Server-side pagination on homepage

---

## 2026-02-19

### SoccerBars Migration to Directory Template

**Added:**
- Fresh Cloudflare infrastructure: Pages project (`soccerbars-v2`), D1 (`soccerbars-v2-db`), R2 (`soccerbars-v2-images`)
- SoccerBars schema: `bars` table with `city_slug`, `neighborhood`, `opens_early`, `website` columns
- Junction tables: `bar_teams`, `bar_leagues` for team/league affiliations
- Lookup tables: `cities` (with World Cup host flag), `teams`
- Soccer bar design: pitch green accent (`#166534`), Epilogue/Inter fonts
- SoccerBars content: homepage hero, about page, FAQ, llms.txt

**Changed:**
- Template table `items` renamed to `bars`
- Template folder `cafes/` renamed to `bars/`
- `CATEGORY_FIELD` set to `city` (geographic directory, not category-based)
- `SCHEMA_TYPE` set to `BarOrClub`

**Migrated:**
- 322 bars from old SoccerBars D1 (was 310 at plan time, grew to 322)
- 284 bar-team affiliations
- 436 bar-league affiliations
- 21 cities and 49 teams
- 302 images from old R2 bucket

---

### Agent & Docs Alignment

**Added:**
- Setup agent (`.claude/agents/setup.md`) — bootstraps new directories from idea to deployed site
- Architecture philosophy section in `/project-architecture` skill
- "No local dev" context in `/cloudflare-deploy` skill
- Step 3k in setup agent to fill README placeholder sections
- Product agent updates README Product section after shipping features
- Memory note for keeping project structures in sync

**Changed:**
- README rewritten as living doc — Overview, Taste, Product are placeholders filled by agents; Agents section is permanent
- All agent terminology unified to "mini apps" (was "interactive tools" / "mini-tools" in some places)
- All 5 agents now have Skill tool in their toolset
- Project structures in CLAUDE.md, README, and `/project-architecture` synced to actual files on disk
- `robots.txt` documented as dynamic (`functions/robots.txt.js`), not static

**Removed:**
- `examples/` directory (14 files, ~5000 lines) — setup agent uses `/tasty-design` skill instead
- Maintenance-heavy lists from README (pages table, SEO features, skills table, commands, project structure)

**Fixed:**
- `tasty-design` skill referenced "CLAUDE.md setup flow" instead of "setup agent"
- `project-architecture` skill was missing `robots.txt.js` and `llms-full.txt.js`

---

### Map View Toggle + API Expansion

**Map View (Leaflet + OpenStreetMap):**
- **Added:** `functions/_shared/map.js` — `renderMapToggle()` (inline toggle buttons) + `renderMap()` (Leaflet container, JSON data blob, client-side JS)
- **Added:** Grid/map toggle on browse, state detail, and city detail pages — only appears when items have lat/lng coordinates
- **Changed:** `renderHead()` accepts `mapEnabled` flag to conditionally load Leaflet CSS/JS from CDN
- **Changed:** Leaflet loaded only on pages with mappable items (not site-wide)
- Map pins show popup with image, name, city, and link to detail page
- Scroll wheel zoom disabled (prevents hijacking page scroll)
- Map container uses `relative z-0` to contain Leaflet's z-indexes below sticky nav

**API Expansion:**
- **Added:** `functions/api/states/[[slug]].js` — `GET /api/states` (list with counts) + `GET /api/states/[slug]` (items with pagination)
- **Added:** `functions/api/cities/[[slug]].js` — `GET /api/cities` (list with counts, `?state=` filter) + `GET /api/cities/[slug]` (items with pagination)

**Sample Data:**
- **Added:** `scripts/seed_sample_10.sql` — 10 sample cafes with real coordinates across 10 US cities

---

### SpookFinder Gap Analysis — Batch 1 & 2 Implementation

Closed all major gaps between the directory template and SpookFinder's battle-tested patterns.

**Geographic Pages (Batch 1):**
- **Added:** `functions/states/[[slug]].js` — states index + state detail, items grouped by city with sidebar
- **Added:** `functions/cities/[[slug]].js` — cities index + city detail, items grouped by category with related cities
- **Added:** Nav updated with States and Cities links (desktop + mobile)
- **Added:** Geographic breadcrumbs: Home > State > City > Item

**Detail Page Enhancements (Batch 1):**
- **Changed:** Detail pages now have 3 related sections (SpookFinder pattern): "More in [City]", "More in [State]", "More [Category]" — 12+ internal links per page vs 3 before
- **Added:** Google Maps embed on detail pages when coordinates exist
- **Added:** "Last Researched" framing for updated_at in sidebar
- **Changed:** JSON-LD uses domain-specific `SCHEMA_TYPE` (configurable in config.js)

**Client-Side Filtering (Batch 1):**
- **Added:** State dropdown filter on category pages with client-side JS, "Showing X of Y" counter

**Short-Path Category Routes (Batch 1):**
- **Added:** `SHORT_PATHS` config in config.js — maps short URLs to category pages via middleware 301 redirect
- **Changed:** Middleware now handles short-path rewrites before legacy URL redirects

**Team/Crew Page (Batch 2):**
- **Added:** `functions/crew.js` — team page with member cards, fun facts, Organization schema with member data
- Uses `EXPERTISE_AREAS` from config for `knowsAbout` in JSON-LD (E-E-A-T)

**Services/Related Businesses Page Type (Batch 2):**
- **Added:** `migrations/002_services.sql` — services table with booking_url, price_range, linked_items
- **Added:** `functions/services/[[slug]].js` — services index with city filter + detail page with linked items, booking CTA, LocalBusiness schema
- Gracefully renders empty state if services table doesn't exist yet

**Ambient Effects System (Batch 2):**
- **Added:** `EFFECTS` config — toggleable grain texture, parallax tilt, count-up animations
- **Added:** `.grain-bg` CSS class — SVG noise texture overlay for hero sections
- **Added:** `.parallax-hero` — subtle mouse-follow tilt on detail page hero images
- **Added:** `.count-up` — animates numeric text counting up on scroll (ease-out cubic)
- All effects are optional and configurable per-directory in config.js

---

## 2026-02-18

### TBC Design System — The Browser Company Aesthetic

Complete design overhaul inspired by The Browser Company (Arc, Dia). Research covered arc.net, diabrowser.com, thebrowser.company, and extracted core design principles.

**Design Tokens:**
- **Changed:** Background from cold `#faf9f7` to warm cream `#FFFCEC` (TBC signature)
- **Changed:** Text from pure black to warm dark brown `#37352F`
- **Changed:** Borders from cold gray to warm-tinted `rgba(20, 13, 7, 0.08)`
- **Added:** Accent color `#3139FB` (TBC blue) for CTAs and interactive elements
- **Added:** Translucent surfaces `rgba(255, 255, 255, 0.60)` with backdrop blur
- **Added:** 3-tier shadow system (sm/md/lg) + card shadow matching TBC patterns
- **Added:** Large border radii (16-40px) — soft, approachable geometry

**Typography:**
- **Added:** Epilogue as display font (similar personality to TBC's custom typefaces)
- **Changed:** All headings use `font-display` for personality, body stays Inter

**Interactions:**
- **Added:** Springy card hover — `translateY(-4px) scale(1.02)` on hover, `scale(0.98)` on press
- **Added:** Noise/grain texture overlay on hero sections (inline SVG, no external file)
- **Added:** Scroll reveal animations with staggered delays via IntersectionObserver
- **Added:** Glass morphism nav (backdrop-blur + translucent bg)
- **Changed:** All transitions use `cubic-bezier(0.4, 0, 0.2, 1)` easing

**Pages Updated:**
- Homepage: noise-bg hero gradient, generous 32-40 padding, scroll reveal grid
- Browse: noise-bg filter bar, staggered card reveal
- Detail: rounded-3xl header card, accent CTAs, reveal sections
- Categories: card-hover + reveal on category cards
- Best-of: noise-bg header, accent rank badges, stagger reveal
- Search: glass input, accent buttons
- Submit: rounded-3xl form card, translucent inputs
- About: updated heading styles, accent links
- Nav: glass morphism, rounded-2xl mobile menu items
- Footer: generous 16px padding, display font branding

---

### Gap Analysis: Align Template with Haunted Places Learnings

Deep comparison of template vs battle-tested haunted-places project. Backported key patterns:

**Architecture:**
- **Changed:** Split monolithic `_shared.js` into modular `_shared/` directory (config, utils, layout, components, response). Barrel re-export preserves backward compat.
- **Changed:** Database schema enriched — added `content` (long-form), `city`, `state`, `address`, `latitude`, `longitude`, `sources` (JSON array), `source_count`. Location-ready from day one.
- **Added:** `submissions` table in initial migration (was a TODO — submit form now actually stores data)
- **Added:** API layer — `GET /api/items` (filters: category, state, city, search, pagination), `GET /api/items/[slug]`, `GET /api/categories`
- **Added:** `jsonResponse()` helper with CORS headers

**SEO & E-E-A-T:**
- **Added:** Source attribution section on detail pages (inline sources, count badge, methodology link)
- **Added:** Location display in detail sidebar with Google Maps link
- **Added:** Last Updated date in detail sidebar
- **Fixed:** Sitemap uses `updated_at` for lastmod (not `created_at`). Falls back to `2025-01-01` instead of today's date to prevent lastmod inflation.
- **Fixed:** Contact page email uses DOMAIN constant instead of `[DOMAIN]` placeholder
- **Added:** `public/_headers` — security headers, image caching, API CORS
- **Added:** `public/llms.txt` — AI crawler description
- **Added:** Plausible analytics snippet (commented out, ready to enable during setup)

**UX:**
- **Added:** Mobile hamburger menu with slide-out nav
- **Added:** Image dimensions (`width`/`height`) on all `<img>` tags for CLS prevention
- **Added:** "How We Research" link in footer trust nav
- **Added:** Search now includes `content` field (long-form text)
- **Changed:** Card component shows location (city, state) when available
- **Changed:** `truncate()` utility added for text excerpts

### Agent & Skill System Overhaul
- **Changed:** Agents from "advisors that recommend" to autonomous workers that check state and execute
- **Changed:** Agent boundaries — content (data+pages), product (UX+tools+delights), seo (technical only), marketing (distribution)
- **Changed:** Backlog from "work queue" to idea parking lot
- **Changed:** Skill names — design-system->tasty-design, coding-standards->project-architecture, optimize-seo->seo-audit, build-tool->mini-tools, cold-campaign->outreach, research-data->research-discovery
- **Added:** Content agent (owns data and content pages)
- **Added:** Marketing agent (owns distribution, outreach, partnerships, social)
- **Added:** 6 new skills — deep-research, delights, marketing-ideas, partnerships, programmatic-social, write-script
- **Removed:** Mini-apps agent (absorbed into Product)
- **Removed:** Outreach agent (replaced by Marketing)
- **Removed:** Bootstrap flow
- **Removed:** Skills — add-to-backlog, build-seo-page, query-data, verify-data
- **Removed:** STRUCTURE.md references
