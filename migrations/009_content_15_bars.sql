-- Migration 009: Rich content profiles for 15 bars across 8 cities
-- Cities: Charlotte, Columbus, Portland, Kansas City, Austin, Nashville, San Diego, Minneapolis
-- Each bar gets a 200-400 word profile following the established 6-section format

-- ============================================================
-- CHARLOTTE (1 bar)
-- ============================================================

-- Courtyard Hooligans (Charlotte) - Charlotte's OG soccer bar since 2009
UPDATE bars SET content = '<h3>The Vibe</h3>
<p>Tucked into Brevard Court -- the narrow alley locals call "The Alley" -- in Uptown Charlotte, Courtyard Hooligans has been the city''s original soccer bar since 2009. Co-founded by Mark Krehbiel and Kristian Pedersen, two soccer fans who wanted to give Charlotte''s football community a proper home, Hooligans has spent over fifteen years earning its reputation as the place where diehard supporters gather. The brick-lined walls are draped with scarves and jerseys from clubs around the world, and the low-key atmosphere feels more like a neighborhood local than a polished sports bar.</p>

<h3>The Setup</h3>
<p>The ground floor packs 30-plus screens into an intimate space, with game sound piped through for featured matches. Upstairs, The Upper Deck adds a second bar and more seating for overflow crowds. Outside, the patio spills into the alley courtyard, giving the place its name and a unique open-air feel during warm weather. It is not a huge bar, and regulars will tell you it does not need to be -- the tight quarters amplify the atmosphere.</p>

<h3>Match Day Experience</h3>
<p>Hooligans opens early on weekends for Premier League and international matches, and the energy ramps up fast. Chelsea and Manchester United supporters groups meet here regularly, and the QC Outlaws -- Charlotte''s chapter of the American Outlaws -- call Hooligans home for USMNT watch parties. On December 17, 2019, when David Tepper walked in hours after Charlotte''s MLS expansion was officially unveiled, the entire bar erupted into spontaneous chants. That moment captured what Hooligans has always been: the beating heart of Charlotte''s soccer culture.</p>

<h3>Food and Drink</h3>
<p>The drink list is built for volume: over 40 bottled beers plus rotating drafts, with pint cans starting around four dollars. Mixed drinks and shots round out the menu. The food leans casual -- pizza and bar snacks -- which suits the crowd just fine. You come here for the match, not a sit-down dinner.</p>

<h3>Who Goes There</h3>
<p>Courtyard Hooligans draws a true mix of Charlotte''s soccer community. Premier League supporters, Charlotte FC fans, international supporters passing through, and USMNT die-hards all share space. During World Cup 2022, general manager Brandon Burton had to triple and quadruple orders to keep up with demand. As regular patron Mamadou Keita put it, he has been coming here for World Cups since 2014. If you are a regular, you are family.</p>

<h3>Insider Tips</h3>
<p>Arrive early for big matches -- seating is limited and fills fast. The patio is first-come, first-served and the best spot on pleasant days. Street parking around Brevard Court can be tight, so rideshare is the easier option. If the ground floor is packed, head upstairs to The Upper Deck for more breathing room.</p>'
WHERE slug = 'courtyard-hooligans-charlotte';

-- ============================================================
-- COLUMBUS (2 bars)
-- ============================================================

-- Fado Irish Pub Easton (Columbus) - Authentic Irish pub, Crew partner
UPDATE bars SET content = '<h3>The Vibe</h3>
<p>Fado Irish Pub sits inside Easton Town Center, but step through the door and the shopping mall outside disappears. Irish owned and operated, the pub features four distinct interior zones -- each designed to capture a different era of Irish pub culture: a country cottage pub, a traditional pub-shop, a Victorian Dublin pub, and a historic Gaelic pub. All the decor is authentic, sourced directly from Ireland, creating an atmosphere that feels genuinely transported rather than themed.</p>

<h3>The Setup</h3>
<p>Multiple screens are positioned throughout each room, with the main viewing area set up for the biggest matches of the day. The bar opens early on weekends for European soccer, with Premier League kickoffs drawing the morning crowd. The layout means you can find a quieter corner or plant yourself in the thick of it, depending on the match and your mood.</p>

<h3>Match Day Experience</h3>
<p>Fado is an official Columbus Crew Pub Network member, hosting away match watch parties for Crew fans who cannot make the trip. On those days, the pub fills with Black and Gold supporters who bring the same energy they would to Lower.com Field. Beyond MLS, the pub attracts the most eclectic group of international soccer fans in Columbus -- you will find supporters of several Premier League clubs and various international teams sharing tables and trading banter. The bar also serves as a hub for USMNT matches.</p>

<h3>Food and Drink</h3>
<p>The kitchen serves traditional Irish fare done right: shepherd''s pie, fish and chips, corned beef and cabbage, and bangers and mash. The bar pours what many locals consider the best Guinness in Columbus, alongside a solid European and craft beer lineup and housemade cocktails. Everything is made from scratch, which sets it apart from chain pub fare.</p>

<h3>Who Goes There</h3>
<p>Columbus Crew faithful, Premier League supporters, Irish expats, and general football fans all converge here. The Easton location makes it accessible from all over the metro area, and the pub draws from both the suburban east side and central Columbus. Families are welcome during daytime hours, and the atmosphere skews more communal than rowdy.</p>

<h3>Insider Tips</h3>
<p>If you want sound for a specific match, ask the staff early -- they are accommodating but the main sound goes to the featured game. Weekend brunch is popular even among non-soccer fans, so arrive early to claim your spot. The Victorian Dublin room tends to be the liveliest during big matches. Parking at Easton is never an issue.</p>'
WHERE slug = 'fado-irish-pub-easton-columbus';

-- Endeavor Brewing (Columbus) - Save The Crew HQ, brewstillery
UPDATE bars SET content = '<h3>The Vibe</h3>
<p>Endeavor Brewing occupies a Grandview Heights space at 909 West 5th Avenue that carries real weight in Columbus soccer history. This is where the Save The Crew movement had its most defining moments. When then-owner Anthony Precourt threatened to relocate the Columbus Crew to Austin in 2017, hundreds of supporters flocked to Endeavor''s taproom to organize, rally, and refuse to let their club die. When new ownership was finally secured in 2018, it was announced here -- fans streaming in by the dozens and then hundreds, chanting under a giant banner that read "We ain''t goin'' nowhere."</p>

<h3>The Setup</h3>
<p>The taproom features an open main room with a long bar, plus a back room that opens for special occasions and significant soccer matches. Screens are positioned throughout for match viewing, and the space strikes a balance between craft brewery and sports bar. Endeavor holds the unique distinction of being Columbus''s only "brewstillery" -- a combined brewery and distillery under one roof, with a small in-house still producing gin, vodka, rum, and whiskey alongside the beer program.</p>

<h3>Match Day Experience</h3>
<p>As an official Crew Pub Network member, Endeavor hosts away match watch parties that reliably draw passionate supporters. The bar opens at 11:30 AM on weekends for Premier League games, and the atmosphere during Champions League nights and World Cup matches gets genuinely electric. The Save The Crew history gives the space an emotional gravity that most sports bars simply cannot replicate -- supporters who were here during the movement treat the place with a reverence you can feel.</p>

<h3>Food and Drink</h3>
<p>The beer lineup is adventurous and rotates regularly. Signature offerings include Icelandic Saga, an Icelandic-style ale, and Holy Ground, a stout brewed with Cork, Ireland-sourced malt. The in-house distillery adds creative cocktails to the mix. Food is available via rotating food truck partnerships and occasional pop-ups rather than a permanent kitchen.</p>

<h3>Who Goes There</h3>
<p>Columbus Crew supporters form the core, but the appeal extends to craft beer enthusiasts and anyone who appreciates a taproom with genuine character. The Grandview neighborhood location draws a mix of young professionals, families during daytime hours, and dedicated football fans on match days. Many regulars were part of the Save The Crew movement and consider Endeavor a second home.</p>

<h3>Insider Tips</h3>
<p>The back room is the best spot during big matches -- it gets loud and communal in the best way. Try the house spirits if you are not a beer drinker; the gin is particularly good. Street parking on 5th Avenue fills up on weekends, so check the side streets. The KC Streetcar is not available here, but rideshare drops you right at the door.</p>'
WHERE slug = 'endeavor-brewing-columbus';

-- ============================================================
-- PORTLAND (2 bars)
-- ============================================================

-- GOL Soccer Bar (Portland) - Dedicated soccer bar, Hawthorne
UPDATE bars SET content = '<h3>The Vibe</h3>
<p>GOL Soccer Bar landed on Hawthorne Boulevard in 2019 when owners Peter Mahr and Lynda Peel set out to preserve the celebration of the beautiful game while creating a proper neighborhood hangout. Located in inner Southeast Portland at 1739 SE Hawthorne, GOL fills the space with a European feel that matches the football on screen. The name says it all -- this is a bar built by soccer fans, for soccer fans, in a city that takes its football seriously.</p>

<h3>The Setup</h3>
<p>Multiple screens line the interior, with sound dedicated to the main match. A heated and covered outdoor porch extends the viewing area and keeps Portland''s famously damp weather from dampening the experience. The bar is Portland Timbers-centric but shows everything: MLS, Premier League, Champions League, La Liga, Bundesliga, and all international tournaments. On weekends, the doors open at 7 AM for early European kickoffs.</p>

<h3>Match Day Experience</h3>
<p>GOL draws a committed crowd of Portland Timbers supporters alongside fans of clubs from around the world. The Saturday and Sunday morning scene is where the bar really shines -- regulars filter in before dawn for Premier League matches, coffee in hand, building energy as the goals come in. For Timbers matches, the atmosphere ratchets up to a level that feels like a warm-up for Providence Park. The bar also hosts Trivia Tuesdays and comedy nights to keep things lively on off-days.</p>

<h3>Food and Drink</h3>
<p>The bar serves a solid selection of local and imported beers on tap, backed by an impressive three-door beer fridge stocked with canned and bottled options, ciders, and seltzers. On weekends from 7 AM to 2 PM, GOL serves a full brunch menu that includes breakfast burritos, eggs benedict, chicken and waffles, and bottomless mimosas. The five-dollar tall boy and shot happy hour is a local favorite.</p>

<h3>Who Goes There</h3>
<p>GOL attracts the Hawthorne neighborhood crowd -- a mix of Timbers Army members, Premier League early risers, international football fans, and families who appreciate the welcoming daytime atmosphere. Minors are welcome until 8 PM, making it one of the more accessible soccer bars for families with kids. The vibe is inclusive and knowledgeable without being cliquish.</p>

<h3>Insider Tips</h3>
<p>The covered porch is the best seat in the house on mild days. For early morning matches, the brunch menu pairs perfectly with the 7 AM kickoffs. GOL is closed on Mondays, so plan accordingly. Street parking on Hawthorne fills fast on weekends, but side streets a block south usually have spots. Check their social media for Trivia Tuesday cancellations.</p>'
WHERE slug = 'gol-soccer-bar-portland';

-- Horse Brass Pub (Portland) - Institution since 1976, craft beer pioneer
UPDATE bars SET content = '<h3>The Vibe</h3>
<p>The Horse Brass Pub has anchored the corner of Belmont Street in Southeast Portland since 1976, making it one of the oldest and most storied pubs in the Pacific Northwest. The legend of its founding is pure Portland: owner Don Younger reportedly acquired the bar after a long night of drinking, waking up the next morning to find the bill of sale scrawled on a cocktail napkin in his shirt pocket. Under Younger''s stewardship until his death in 2011, the Horse Brass became the spiritual home of Portland''s craft beer revolution and a gathering place for football fans, dart throwers, and Anglophiles alike.</p>

<h3>The Setup</h3>
<p>Walking in feels like stepping into a genuine English pub. Dark wood, exposed beams, a giant Union Jack on the wall, and dense British signage cover every surface. A 1980 Willamette Week description captured it perfectly: "From the giant Union Jack on the wall to the poster of Lord Kitchener beckoning to the youth of Britain, this place seems English to the core." Screens show Premier League matches on weekends, and dartboards line the back wall -- the pub has fielded dart teams since its earliest days.</p>

<h3>Match Day Experience</h3>
<p>Horse Brass does not try to compete with Portland''s dedicated soccer bars on volume of matches shown. What it offers instead is an authentically British context for watching football. Premier League weekends draw English expats and longtime regulars who have been watching matches here for decades. The atmosphere is more pub than sports bar -- conversation flows, pints are savored, and the football is part of the fabric rather than the sole focus. A soccer team called the Original Horse Brass Range was established here as early as 1977.</p>

<h3>Food and Drink</h3>
<p>The beer program is legendary. Younger was the first Portland publican to champion craft beer in the early 1980s, offering tap handles to pioneering breweries like Widmer, BridgePort, Deschutes, and Rogue before anyone else would. Today, approximately 50 beers rotate on tap. The menu features authentic British fare: steak and ale pie, Scotch eggs, fish and chips, bangers and mash, chicken pot pie, and shepherd''s pie. The pub also stocks 25 to 30 varieties of English candy bars, a quirky touch that has endured for decades.</p>

<h3>Who Goes There</h3>
<p>The Horse Brass draws a fiercely loyal crowd. English expats who have been coming for 20-plus years, craft beer devotees who know the pub''s role in Portland brewing history, dart league regulars, and soccer fans who prefer watching football in a real pub rather than a sports bar. Julia Silverman of Portland Monthly called it "perhaps the most authentic of Portland''s British pubs" -- a title the regulars take seriously.</p>

<h3>Insider Tips</h3>
<p>The pub can get crowded during big Premier League matches, so arrive early for a table with a good screen view. The steak and ale pie is the menu standout. If you are a craft beer enthusiast, ask the bartenders about the pub''s history -- many of them know the Don Younger stories firsthand. Street parking on Belmont is metered but generally manageable outside of weekend evenings.</p>'
WHERE slug = 'horse-brass-pub-portland';

-- ============================================================
-- KANSAS CITY (2 bars)
-- ============================================================

-- No Other Pub (Kansas City) - Official Sporting KC bar
UPDATE bars SET content = '<h3>The Vibe</h3>
<p>No Other Pub takes its name from the Sporting Kansas City supporters'' chant -- "No Other Club" -- and delivers on that promise as the official bar of Sporting KC. Located on the second level of the KC Live! Block in the Power and Light District, this 21,000-square-foot venue is part sports bar, part gaming parlor, part social lounge. It opened as a partnership between Sporting KC and the Power and Light District and has been the downtown hub for Kansas City soccer culture ever since, celebrating its 10th anniversary in February 2026 with a packed season-opener watch party.</p>

<h3>The Setup</h3>
<p>The centerpiece is a massive 10-foot by 15-foot video wall that dominates the main viewing area. Beyond the screens, the pub features four full-size bowling lanes, shuffleboard, a golf simulator, darts, table tennis, pool, and beer pong. Two full bars serve the space -- one dedicated to Kansas City-area craft beers on tap -- and a fast-casual taco stand provides quick bites. The sheer scale of the venue means there is always room, even on the busiest match days.</p>

<h3>Match Day Experience</h3>
<p>No Other Pub is home to the official Sporting KC watch parties, and it doubles as a transportation depot for all Sporting KC home games at Children''s Mercy Park. Fans wearing Sporting gear get four-dollar domestic drafts on match days, which keeps the crowd decked out in Sporting Blue. The pub has hosted landmark events including MLS All-Star Week, MLS Cup celebrations, and World Cup watch parties. The energy during Sporting KC playoff matches rivals the stadium atmosphere.</p>

<h3>Food and Drink</h3>
<p>The menu runs broader than typical pub fare: small plates, shareable platters, salads, tacos, flatbreads, and sandwiches alongside vegetarian options. The two bars keep the drinks flowing efficiently even when the venue is packed. The local craft beer selection on one of the bars gives Kansas City breweries a proper showcase alongside the standard domestic and import options.</p>

<h3>Who Goes There</h3>
<p>Sporting KC season ticket holders, casual fans looking for the big-screen experience, downtown professionals, and visitors exploring the Power and Light District all find their way here. The gaming options -- bowling, ping pong, golf simulator -- draw people who are not necessarily soccer fans, creating an interesting mix of committed supporters and curious newcomers on match days.</p>

<h3>Insider Tips</h3>
<p>For Sporting KC watch parties, arrive at least 30 minutes before kickoff to get a spot near the video wall. If you are heading to Children''s Mercy Park for a home match, the pub runs transportation -- check their schedule for departure times. The bowling lanes and golf simulator can be reserved for private groups. Parking in the Power and Light District garages is the easiest option.</p>'
WHERE slug = 'no-other-pub-kansas-city';

-- Johnny's Tavern (Kansas City) - Cauldron HQ, American Outlaws
UPDATE bars SET content = '<h3>The Vibe</h3>
<p>Johnny''s Tavern in the Power and Light District is where Kansas City''s most passionate soccer supporters gather. As the official home base for The Cauldron -- Sporting KC''s largest and most vocal supporters group -- and the Kansas City chapter of the American Outlaws, this century-old Kansas institution carries serious match-day credentials. Located directly across the street from T-Mobile Center, Johnny''s blends the energy of a dedicated supporters'' bar with the accessibility of a downtown sports pub.</p>

<h3>The Setup</h3>
<p>Fifty-two large HDTVs cover every angle of the main floor, equipped with full sports packages including NBA League Pass, NFL Sunday Ticket, and Fox Soccer. The setup ensures that no matter which match is on, there is a screen showing it. The bar is large enough to absorb big crowds without feeling cramped, with booth seating, high-tops, and standing room around the bar.</p>

<h3>Match Day Experience</h3>
<p>When Sporting KC plays an away match, The Cauldron turns Johnny''s into a sea of Sporting Blue. The atmosphere is loud, organized, and genuine -- chants ring out, goals are celebrated with the same intensity as at Children''s Mercy Park, and anyone wearing Cauldron or SKC apparel gets discounts on draft beer. USMNT matches through the American Outlaws draw an equally fervent crowd. Johnny''s has hosted watch parties across all nine of its Kansas City and Lawrence locations, but the Power and Light spot is the flagship.</p>

<h3>Food and Drink</h3>
<p>The menu is classic American tavern fare done well: burgers, wings, sandwiches, and appetizers built for sharing during a long match day. The beer list is extensive with domestic, craft, and import options on draft and in bottles. Prices are reasonable for a downtown location, especially with the SKC apparel discount on match days.</p>

<h3>Who Goes There</h3>
<p>The Cauldron members and American Outlaws form the core, but Johnny''s draws broadly from Kansas City''s soccer community. Sporting KC families, Premier League fans, college students from nearby universities, and downtown workers all make appearances. The partnership between Johnny''s and Sporting KC is a natural fit -- both are locally rooted Kansas institutions.</p>

<h3>Insider Tips</h3>
<p>Wear your Sporting KC or Cauldron gear for the draft beer discount -- it is real and it stacks up over a full match. For USMNT qualifiers and World Cup matches, arrive well in advance as the American Outlaws chapter packs the place. The Power and Light District location is the one to visit for soccer; the other Johnny''s locations are more general sports bars. Garage parking nearby is plentiful.</p>'
WHERE slug = 'johnnys-tavern-power-light-kansas-city';

-- ============================================================
-- AUSTIN (2 bars)
-- ============================================================

-- Haymaker (Austin) - American Outlaws HQ, Best Sports Bar
UPDATE bars SET content = '<h3>The Vibe</h3>
<p>Haymaker sits on Manor Road in East Austin and has built itself into the undisputed center of the city''s soccer bar scene. Voted Best Sports Bar by Austin Chronicle readers in both 2023 and 2024, it serves as the unofficial headquarters for the Austin chapter of the American Outlaws and the home base for Chelsea and Manchester City supporters. The space is deceptively large -- an indoor-outdoor layout with garage-door openings that blur the line between inside and outside, giving the whole place an open, energetic feel even when it is packed to capacity.</p>

<h3>The Setup</h3>
<p>Ample TVs cover every wall and sightline, and the sound system is dedicated to the main match. Haymaker opens early on weekends -- 6:30 AM on Saturdays and 7:30 AM on Sundays -- for Premier League kickoffs, which is a commitment that separates it from bars that merely tolerate morning soccer. The dog-friendly patio extends the viewing area significantly, and there is plenty of both indoor and outdoor seating.</p>

<h3>Match Day Experience</h3>
<p>USMNT matches are the main event, with the American Outlaws chapter filling the bar with red, white, and blue and bringing organized chants that echo off the walls. Chelsea and Manchester City supporters hold regular watch parties, and Aston Villa and Everton groups have also made Haymaker their Austin home. For World Cup and major tournament matches, the bar fills early and stays packed -- getting a table for a USA game requires arriving well before kickoff. The communal energy is the real draw: strangers become friends over shared goals.</p>

<h3>Food and Drink</h3>
<p>The beer list is massive -- over 40 taps plus an extensive can selection. The food menu leans hearty: burgers, open-faced sandwiches, wings, and one of the few places in Austin serving poutine, which has become a match-day staple. Prices are fair for East Austin, and the kitchen keeps up even when the bar is slammed during big matches.</p>

<h3>Who Goes There</h3>
<p>American Outlaws members, Premier League supporter groups, Austin FC fans, families with kids and dogs on weekend mornings, and East Austin locals who appreciate a bar that takes soccer seriously without pretension. The crowd skews young and diverse, reflecting the Manor Road neighborhood''s character. Many regulars also frequent Haymaker''s sister bar, Black Sheep Lodge, in South Austin.</p>

<h3>Insider Tips</h3>
<p>For USA matches, arrive 45 minutes to an hour early. The patio is dog-friendly but fills fast on nice mornings. Try the poutine -- it pairs perfectly with an early match and a cold draft. If Haymaker is too packed, Black Sheep Lodge in Zilker shows the same matches with a similarly committed crowd. Street parking on Manor Road is limited; the side streets east of the bar are your best bet.</p>'
WHERE slug = 'haymaker-austin';

-- Mister Tramps (Austin) - Tottenham bar, Scottish owners, soccer field floor
UPDATE bars SET content = '<h3>The Vibe</h3>
<p>Mister Tramps has been a North Austin soccer institution since 2009, built from scratch by owner Alfredo Cedrone, who grew up in Scotland and modeled the pub on the neighborhood locals he missed -- places where the community gathered around sport, conversation, and a proper pint. The bar sits at 8565 Research Boulevard, off Highway 183, and has earned its reputation as one of the most authentically soccer-obsessed pubs in Texas. PBS Austin featured Mister Tramps in its "Austin Revealed" series on food and community, recognizing the pub''s role as a genuine neighborhood gathering place.</p>

<h3>The Setup</h3>
<p>Flat-screen TVs surround the entire bar, ensuring every seat has a view. The standout feature is a private room with a miniature soccer field built into the floor and equipped with three 120-inch televisions -- the only setup of its kind on any Austin soccer bar list. The main bar area is comfortable and unpretentious, with the kind of worn-in character that comes from fifteen years of passionate supporters filling the seats.</p>

<h3>Match Day Experience</h3>
<p>Since 2012, Mister Tramps has been the home base for Austin Spurs, the official Tottenham Hotspur supporters club. Every Sunday at 8 AM, 30 to 50 Spurs supporters pack the bar with every TV tuned to Tottenham -- no exceptions, no split screens. The commitment is absolute. The bar also shows Italian, English, and Scottish football, reflecting the owner''s background. Mister Tramps was previously the Austin home of the American Outlaws before the group moved to Haymaker.</p>

<h3>Food and Drink</h3>
<p>The kitchen serves solid pub fare with some unexpected depth: The Club sandwich with chicken, turkey, bacon, and avocado is a regular favorite, and the Crawfish Bisque Soup shows a Cajun influence you would not expect from a Scottish-owned soccer pub. The bar hosts FIFA video game tournaments, adding a gaming dimension to the football culture. Beer selection covers local craft options alongside imports.</p>

<h3>Who Goes There</h3>
<p>Austin Spurs members are the backbone, but Mister Tramps draws a broad mix of North Austin soccer fans, Italian football followers, rugby supporters, and families during the daytime. The location off Research Boulevard makes it the go-to for anyone north of the river who does not want to trek to East Austin for a soccer bar. The atmosphere is welcoming and unpretentious -- regulars are quick to make newcomers feel at home.</p>

<h3>Insider Tips</h3>
<p>If you are a Tottenham supporter, Sunday morning at Mister Tramps is non-negotiable. The private room with the soccer field floor and 120-inch screens is the best viewing experience in the house -- ask about availability for group bookings. The parking lot is large and free, which is a rarity among Austin soccer bars. Get there before 8 AM on Spurs match days to guarantee a seat.</p>'
WHERE slug = 'mister-tramps-austin';

-- ============================================================
-- NASHVILLE (2 bars)
-- ============================================================

-- Fogg Street Lawn Club (Nashville) - Official Nashville SC pub
UPDATE bars SET content = '<h3>The Vibe</h3>
<p>Fogg Street Lawn Club opened in downtown Nashville in September 2024 as something the city had never seen: a multi-level British-inspired sports pub with rooftop lawn bowling and skyline views. Created by Thom and Angela Dahle, Fogg Street quickly earned the title of Official Pub of Nashville SC, anchoring its identity in soccer while offering experiences that go well beyond a standard sports bar. The venue sits at 648 Fogg Street, a short walk from Broadway, and brings a distinctly British sensibility to Music City.</p>

<h3>The Setup</h3>
<p>The ground floor houses a 2,500-square-foot indoor soccer and rugby pub with screens covering every wall. Upstairs, an 8,000-square-foot rooftop features eight British lawn bowling rinks with covered VIP seating and panoramic views of the Nashville skyline. In winter, the rooftop transforms for Bavarian ice stock curling with heated cabins. The venue operates on multiple levels -- literally and figuratively -- giving visitors the choice between an intimate pub experience and a sprawling rooftop social scene.</p>

<h3>Match Day Experience</h3>
<p>Fogg Street shows every televised soccer match, including 6 AM Premier League kickoffs that draw the early-morning faithful. Nashville SC match days bring the largest crowds, with the pub''s official partnership ensuring pre-match energy, watch parties for away games, and post-match gatherings. Manchester City supporters and Newcastle United fans also hold regular watch parties here. The indoor pub is where the serious viewing happens; the rooftop is where the celebration continues.</p>

<h3>Food and Drink</h3>
<p>The British-inspired menu includes pub classics alongside brunch options and a kids'' menu. Draft pints run around seven dollars during happy hour, with cocktails and Jack and Coke specials rounding out the drink list. The rooftop cabins can be reserved for groups, with food and drink minimums that make them ideal for watch parties of eight to twelve people.</p>

<h3>Who Goes There</h3>
<p>Nashville SC supporters form the core, but the venue''s unique offerings -- lawn bowling, rooftop views, ice curling -- draw a broader crowd than a typical soccer pub. Downtown hotel guests, bachelorette parties discovering the rooftop, Premier League early risers, and families during daytime hours all mix with the dedicated football crowd. The venue is all-ages friendly, which sets it apart from many Nashville bars.</p>

<h3>Insider Tips</h3>
<p>Reserve a rooftop cabin for group watch parties -- they fill up quickly for Nashville SC matches. The indoor pub on the ground floor is the better choice for serious football viewing; the rooftop is more social. For 6 AM Premier League matches, the crowd is small but dedicated. The venue is a short walk from Lower Broadway but far enough to avoid the tourist chaos. OpenTable reservations are available for both the pub and rooftop.</p>'
WHERE slug = 'fogg-street-lawn-club-nashville';

-- Fleet Street Pub (Nashville) - English-owned, Printers Alley
UPDATE bars SET content = '<h3>The Vibe</h3>
<p>Fleet Street Pub occupies a basement space on historic Printers Alley in downtown Nashville, and stepping through its door feels like descending into a proper English local. Owner Ian Wrigley, originally from Manchester, named the pub after London''s famous newspaper row -- a fitting choice given that Printers Alley was once the hub of the publishing industry in the American Southeast. The entrance is marked by a sign reminiscent of the London Underground, and the interior delivers on that promise: low ceilings, dark wood, English football club flags, and the unmistakable atmosphere of a pub that exists for the love of the game.</p>

<h3>The Setup</h3>
<p>The underground space is intimate but well-equipped with screens positioned for match viewing throughout. Fleet Street carries satellite feeds for UK and European league soccer, which means it shows matches that many American sports bars cannot access. The pub is 21-plus only, keeping the atmosphere firmly adult and focused. Seating fills quickly during big matches, which adds to the communal, shoulder-to-shoulder feel.</p>

<h3>Match Day Experience</h3>
<p>Fleet Street routinely opens as early as 9 AM for Premier League matches, drawing English expats and American fans who set their alarms for the 6-hour time difference. The pub is home to Nashville''s Arsenal supporters, the Gooners, and also serves Nashville SC as a hub for the broader football community. With a Manchester-born owner, the pub has a natural lean toward English football culture -- the banter is real, the knowledge runs deep, and the chants come naturally.</p>

<h3>Food and Drink</h3>
<p>The menu is unapologetically British. The shepherd''s pie and fish and chips are both excellent, and the "Arsenal Breakfast" -- a full English with two eggs, bacon, banger, baked beans, charred tomato, toast, and orange marmalade -- is served all day. Multiple English beers are on draft, and the Scotch whisky selection reflects the owner''s British roots. This is one of the few places in Nashville where you can get a proper pint of English bitter.</p>

<h3>Who Goes There</h3>
<p>English expats, Arsenal supporters, Nashville SC fans, Vanderbilt students and faculty, and anyone in Nashville who wants to watch football in an authentic British pub. The Printers Alley location means tourists sometimes stumble in, but the regulars set the tone -- this is a football pub first. The 21-plus policy keeps it focused and conversational rather than chaotic.</p>

<h3>Insider Tips</h3>
<p>Order the Arsenal Breakfast during an early morning match -- it is the most authentic full English in Nashville. The pub is underground and can be easy to miss; look for the Tube-style sign on Printers Alley. Arrive 15 minutes early for Premier League mornings, as the small space fills fast. If you are visiting Nashville for a Broadway night out, Fleet Street is a perfect pre-show stop that feels worlds away from the honky-tonks above.</p>'
WHERE slug = 'fleet-street-pub-nashville';

-- ============================================================
-- SAN DIEGO (2 bars)
-- ============================================================

-- Shakespeare Pub (San Diego) - British pub since 1990, award-winning fish and chips
UPDATE bars SET content = '<h3>The Vibe</h3>
<p>Shakespeare Pub and Grille has been a fixture on India Street in Mission Hills since 1990, established by British expats who wanted to build an authentic piece of home in San Diego. The Old World English Tudor-style interior -- dark wood, low lighting, and pub memorabilia -- creates an atmosphere that feels genuinely transported from England rather than merely inspired by it. Large picture windows let natural light into the main room, while a wraparound patio deck gives the pub a distinctly Southern California outdoor dimension that no actual English pub could offer.</p>

<h3>The Setup</h3>
<p>Multiple screens are positioned throughout the interior and patio for match viewing. Shakespeare opens early for Premier League, Champions League, and FA Cup matches, and the sound goes to the biggest game of the day. The pub also shows rugby, NFL, MLB, and NBA, but soccer is the clear priority and the reason most regulars walk through the door. First Touch magazine named Shakespeare one of the best soccer bars in the USA.</p>

<h3>Match Day Experience</h3>
<p>Saturday and Sunday mornings transform the pub into a proper football viewing experience. The crowd is a mix of British expats who have been coming since the 1990s and American fans who grew up watching the Premier League. The atmosphere is more pub than sports bar -- conversation and banter flow naturally, and the communal feeling is genuine. During World Cup tournaments and major European finals, the pub fills to capacity and the energy rivals anything in San Diego''s sports bar scene.</p>

<h3>Food and Drink</h3>
<p>The fish and chips are the signature dish, and they have earned it: Shakespeare won Best Fish and Chips in the U.S. in 2017, and the dish has been a local favorite for over three decades. The menu extends to other British classics: bangers and mash, shepherd''s pie, and a full English breakfast. The beer list features popular brands from Britain, Ireland, mainland Europe, and the U.S., with proper English ales given pride of place.</p>

<h3>Who Goes There</h3>
<p>British expats who consider Shakespeare their local, Premier League die-hards, San Diego soccer community regulars, and visitors who come for the award-winning fish and chips and stay for the football. The Mission Hills location draws from the surrounding neighborhoods -- Hillcrest, University Heights, North Park -- and the pub has a loyal following that spans generations. Weekend brunch brings non-soccer fans too, but the morning crowd is firmly football-first.</p>

<h3>Insider Tips</h3>
<p>The fish and chips are as good as advertised -- order them. The patio is the best spot on mild San Diego mornings, but it fills first for big matches. Parking on India Street can be competitive on weekends, so check the side streets. If Shakespeare is too packed, Princess Pub in Little Italy and Bluefoot in North Park are solid alternatives within a short drive.</p>'
WHERE slug = 'shakespeare-pub-san-diego';

-- Princess Pub (San Diego) - Liverpool FC home, Scouse owners, since 1984
UPDATE bars SET content = '<h3>The Vibe</h3>
<p>Princess Pub and Grille opened in 1984, making it San Diego''s original British pub. Tucked into the heart of Little Italy at 1665 India Street, just blocks from the harbor and downtown, the pub is owned and operated by genuine Scousers: owner Gerry Kenny grew up in Halewood on Liverpool''s southeast border, and general manager Dave Evans hails from Bromborough across the River Mersey. That Merseyside DNA runs through everything about the Princess -- from the Liverpool FC banners and plaques to the framed pictures of famous European triumphs that line the walls.</p>

<h3>The Setup</h3>
<p>Ten large HD TVs with surround sound fill the compact interior. The pub punches above its size when it comes to atmosphere, with around 130 supporters packing the space on big match days. For major international matches, the Princess opens as early as 4 AM -- and the crowd shows up. The bar is small enough that every seat feels like the best seat, and the surround sound makes you feel like you are at the ground.</p>

<h3>Match Day Experience</h3>
<p>Since 2014, Princess Pub has been the official home of LFC San Diego, founded by Steven McGlynn and Justin Isaac, who met by chance and discovered their shared passion for Liverpool. What began as half a dozen supporters has grown to hundreds of members, officially recognized by Liverpool FC. On match days, the pub fills with red -- singing, chanting, and celebrating regardless of results. As staff member Liz Hagen put it: "Win, lose or draw, they are always here, and they are always loud." The energy is contagious and welcoming to supporters visiting from out of town.</p>

<h3>Food and Drink</h3>
<p>The bar serves fine European ales alongside domestic and local San Diego craft beers on tap. Traditional British pub food anchors the menu, with the kind of honest, unpretentious fare that pairs well with a morning pint. Bartender Kevin Olivetti calls the Princess "a Liverpool pub" in the truest sense -- the food and drink program serves the community rather than trying to impress critics.</p>

<h3>Who Goes There</h3>
<p>LFC San Diego members are the backbone, but the Princess draws Liverpool supporters from around the world who seek it out when visiting San Diego. Beyond the Reds, the pub attracts British expats, Premier League fans of all clubs, and Little Italy locals who appreciate a proper pub. The diverse membership of LFC San Diego -- people from all backgrounds united by their love of Liverpool -- reflects the inclusive spirit of the pub itself.</p>

<h3>Insider Tips</h3>
<p>For Liverpool matches, arrive 30 minutes early or risk standing room only. The 4 AM openings for European away matches in the Champions League are legendary -- bring coffee, the bar provides the atmosphere. Little Italy parking is manageable in the early morning but gets competitive by midday. If you are an LFC supporter visiting San Diego, introduce yourself to the group -- they are famously welcoming to traveling Reds.</p>'
WHERE slug = 'princess-pub-san-diego';

-- ============================================================
-- MINNEAPOLIS (2 bars)
-- ============================================================

-- Brit's Pub (Minneapolis) - 30+ year institution, rooftop lawn bowling
UPDATE bars SET content = '<h3>The Vibe</h3>
<p>Brit''s Pub has been Minneapolis''s own little corner of the United Kingdom since 1990, when it opened as a small two-room tavern in downtown Minneapolis. Over three decades, it has expanded into a multi-level institution that includes the original pub, the Long Room added in 1994, a world-renowned English Garden Park with lawn bowling installed in 1998, and the Veranda Bar rooftop and Clubhouse cocktail lounge added in 2006. Voted Pub of the Year 2025 by Mpls.St.Paul magazine and named one of the top rooftop bars in America by Thrillist, Brit''s has earned its place as a Minneapolis landmark.</p>

<h3>The Setup</h3>
<p>Multiple rooms across multiple levels give Brit''s a versatility that few pubs can match. Screens are positioned throughout for match viewing, with fireplaces creating a warm, genuinely British atmosphere during Minnesota''s long winters. The crown jewel is the 10,000-square-foot lawn bowling green on the rooftop, active from mid-May through mid-September and often opened early for special sporting events. Two pool tables in the Long Room Mezzanine, free WiFi, and an attached parking lot round out the amenities.</p>

<h3>Match Day Experience</h3>
<p>Brit''s is an official Minnesota United FC Loons Watch Spot, hosting MNUFC away match watch parties alongside its legendary Premier League and rugby viewing. The pub opens early on weekends for soccer matches, and complimentary coffee is offered during early morning kickoffs -- a touch that shows how well Brit''s knows its football crowd. The atmosphere during major tournaments is electric, with the rooftop adding overflow capacity and a festive outdoor dimension that no other Minneapolis pub can match.</p>

<h3>Food and Drink</h3>
<p>The menu leans British with pub classics, and the bar program spans proper English ales, local craft beers, and a full cocktail selection. Happy hour and seasonal specials keep things accessible. The Veranda Bar on the rooftop serves a lighter menu during lawn bowling season, and DoorDash delivery is available for those watching from home -- though that rather misses the point.</p>

<h3>Who Goes There</h3>
<p>Minnesota United supporters, Premier League early risers, lawn bowling enthusiasts, downtown professionals, and the British expat community all claim Brit''s as their own. The multi-room, multi-level layout means different crowds can coexist -- serious football watchers in the main pub, social groups on the rooftop, private events in the Clubhouse. The pub has been a gathering place for over 30 years, and the multigenerational regular crowd reflects that history.</p>

<h3>Insider Tips</h3>
<p>The main pub downstairs is the best spot for serious football viewing; the rooftop is better for social watching and lawn bowling between matches. Lawn bowling leagues run on Monday and Tuesday nights in summer, with the Premier and Scottish leagues offering a genuinely competitive experience. The complimentary coffee during early matches is a small thing that makes a big difference on cold Minnesota mornings. The attached parking lot is a rare downtown convenience -- use it.</p>'
WHERE slug = 'brits-pub-minneapolis';

-- The Local (Minneapolis) - Irish pub since 1997, world's #1 Jameson seller
UPDATE bars SET content = '<h3>The Vibe</h3>
<p>The Local opened on December 18, 1997, in a historic 1912 building on the corner of 10th and Nicollet Mall in downtown Minneapolis. At 11,000 square feet, it is one of the largest Irish pubs in North America, but it never feels cavernous -- the design breaks the space into intimate areas that capture the warmth of a genuine Irish local. The building had stood vacant since 1990 before Cara Irish Pubs restored it, maintaining the original architecture''s historical integrity while creating something that feels like it has been here forever. The centerpiece is an 80-foot hand-carved back bar that draws the eye the moment you walk in.</p>

<h3>The Setup</h3>
<p>Screens throughout the pub show Premier League, Champions League, MLS, and international matches. The staff has earned a reputation for going above and beyond for soccer fans -- request a specific match on a specific screen and they will make it happen. The layout includes private rooms, a Whiskey Lounge, and multiple distinct seating areas that give you the option of an intimate corner or a communal table depending on the match and the mood.</p>

<h3>Match Day Experience</h3>
<p>The Local is an MNUFC watch spot and draws committed Minnesota United supporters for away matches. Premier League weekends bring a steady crowd of morning regulars, and the atmosphere during Champions League nights and World Cup tournaments fills the pub to its considerable capacity. The communal Irish pub atmosphere lends itself naturally to soccer viewing -- conversations spark easily, and the shared experience of watching football over a pint is exactly what the space was built for.</p>

<h3>Food and Drink</h3>
<p>The pub serves lunch, dinner, brunch, and late-night menus, with fish and chips as a perennial favorite. The real headline is the whiskey program: The Local is the number-one seller of Jameson Irish Whiskey in the world, four years running. That is not a local superlative -- it is a global one. The bar also pours one of the best pints of Guinness in the Twin Cities, and the broader cocktail and craft beer selections are strong.</p>

<h3>Who Goes There</h3>
<p>Minnesota United supporters, Premier League and Champions League fans, Irish expats, downtown workers on lunch breaks, whiskey enthusiasts, and anyone in Minneapolis looking for a genuine pub experience. The Local has been a community gathering place since 1997 -- birthdays, retirements, celebrations, and match days all happen here. The Cara Irish Pubs group, which also operates Kieran''s Irish Pub in the Warehouse District, understands how to run an authentic Irish pub in America.</p>

<h3>Insider Tips</h3>
<p>Ask for the Whiskey Lounge if you want a quieter viewing experience during a match. The 80-foot back bar is the most impressive architectural feature -- sit at it at least once. For brunch on weekends, the non-soccer crowd arrives around 11 AM, so earlier is better if you want to combine food with football viewing. The pub is directly on the Nicollet Mall transit corridor, making it one of the most accessible soccer bars in the Twin Cities by bus or light rail.</p>'
WHERE slug = 'the-local-minneapolis';
