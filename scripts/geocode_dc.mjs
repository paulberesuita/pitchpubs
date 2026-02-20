// Geocode DC/Arlington bars using Nominatim
// Rate limit: 1 request per second

const bars = [
  { id: 323, slug: "lucky-bar-dc", address: "1221 Connecticut Ave NW, Washington, DC 20036" },
  { id: 324, slug: "queen-vic-dc", address: "1206 H St NE, Washington, DC 20002" },
  { id: 325, slug: "exiles-bar-dc", address: "1610 U St NW, Washington, DC 20009" },
  { id: 326, slug: "franklin-hall-dc", address: "1348 Florida Ave NW, Washington, DC 20009" },
  { id: 327, slug: "irish-channel-dc", address: "500 H St NW, Washington, DC 20001" },
  { id: 328, slug: "the-artemis-dc", address: "3605 14th St NW, Washington, DC 20010" },
  { id: 329, slug: "public-bar-live-dc", address: "1214 18th St NW, Washington, DC 20036" },
  { id: 330, slug: "toms-watch-bar-dc", address: "1250 Half St SE, Washington, DC 20003" },
  { id: 331, slug: "elephant-and-castle-dc", address: "1201 Pennsylvania Ave NW, Washington, DC 20004" },
  { id: 332, slug: "kirwans-on-the-wharf-dc", address: "749 Wharf St SW, Washington, DC 20024" },
  { id: 333, slug: "walters-sports-bar-dc", address: "10 N St SE, Washington, DC 20003" },
  { id: 334, slug: "suzie-qs-dc", address: "71 Potomac Ave SE, Washington, DC 20003" },
  { id: 335, slug: "lous-city-bar-dc", address: "1400 Irving St NW, Washington, DC 20010" },
  { id: 336, slug: "nanny-obriens-dc", address: "3319 Connecticut Ave NW, Washington, DC 20008" },
  { id: 337, slug: "the-big-board-dc", address: "421 H St NE, Washington, DC 20002" },
  { id: 338, slug: "the-commodore-dc", address: "1636 17th St NW, Washington, DC 20009" },
  { id: 339, slug: "sports-and-social-dc", address: "1314 U St NW, Washington, DC 20009" },
  { id: 340, slug: "irelands-four-courts-arlington", address: "2051 Wilson Blvd, Arlington, VA 22201" },
  { id: 341, slug: "crystal-city-sports-pub-arlington", address: "529 23rd St S, Arlington, VA 22202" },
];

const sleep = (ms) => new Promise((r) => setTimeout(r, ms));

async function geocode(address) {
  const url = `https://nominatim.openstreetmap.org/search?q=${encodeURIComponent(address)}&format=json&limit=1`;
  const res = await fetch(url, {
    headers: { "User-Agent": "SoccerBars/1.0 (content-agent)" },
  });
  const data = await res.json();
  if (data.length > 0) {
    return { lat: parseFloat(data[0].lat), lon: parseFloat(data[0].lon) };
  }
  return null;
}

const results = [];
const failed = [];

for (const bar of bars) {
  const coords = await geocode(bar.address);
  if (coords) {
    console.log(`OK: ${bar.slug} -> ${coords.lat}, ${coords.lon}`);
    results.push({ ...bar, ...coords });
  } else {
    console.log(`FAIL: ${bar.slug} (${bar.address})`);
    failed.push(bar);
  }
  await sleep(1100);
}

// Generate SQL
let sql = "-- Geocode DC/Arlington bars\n";
for (const r of results) {
  sql += `UPDATE bars SET latitude = ${r.lat}, longitude = ${r.lon} WHERE id = ${r.id};\n`;
}

if (failed.length > 0) {
  sql += "\n-- FAILED (need manual geocoding):\n";
  for (const f of failed) {
    sql += `-- ${f.slug}: ${f.address}\n`;
  }
}

const fs = await import("fs");
fs.writeFileSync("/Users/paulberesuita/Desktop/soccerbars-v2/migrations/005_geocode_dc.sql", sql);
console.log(`\nDone. ${results.length} geocoded, ${failed.length} failed.`);
console.log("SQL written to migrations/005_geocode_dc.sql");
