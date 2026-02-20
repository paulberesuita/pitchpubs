import fs from 'fs';
import path from 'path';
import { fileURLToPath } from 'url';

const __dirname = path.dirname(fileURLToPath(import.meta.url));
const USER_AGENT = 'SoccerBars/1.0 (https://soccerbars.fyi)';
const DELAY_MS = 1100;

function sleep(ms) {
  return new Promise(resolve => setTimeout(resolve, ms));
}

async function geocode(query) {
  const url = `https://nominatim.openstreetmap.org/search?q=${encodeURIComponent(query)}&format=json&limit=1&countrycodes=us`;
  const res = await fetch(url, { headers: { 'User-Agent': USER_AGENT } });
  const data = await res.json();
  if (data.length > 0) {
    return { lat: parseFloat(data[0].lat), lng: parseFloat(data[0].lon) };
  }
  return null;
}

// Failures with cleaned addresses (remove suite/unit numbers, fix road names)
const retries = [
  { id: 106, name: "Sportsbook Bishop Arts", query: "233 W 7th St, Dallas, TX 75208" },
  { id: 115, name: "Tom's Watch Bar", query: "1201 Caroline St, Houston, TX 77002" },
  { id: 220, name: "Finnegans Brew Co", query: "817 5th Ave S, Minneapolis, MN 55404" },
  { id: 244, name: "The 12th Man by Hooligans", query: "12206 Copper Way, Charlotte, NC 28277" },
  { id: 289, name: "Kiwi's Pub & Grill", query: "801 W State Road 436, Altamonte Springs, FL 32714" },
  { id: 294, name: "The Sideline at XL Soccer World", query: "825 Courtland St, Orlando, FL 32804" },
  { id: 302, name: "Tom's Watch Bar - Coors Field", query: "1601 19th St, Denver, CO 80202" },
  { id: 309, name: "Origins Sports Bar & Grill", query: "266 S Downing St, Denver, CO 80209" },
  { id: 316, name: "BD Riley's Irish Pub", query: "1905 Aldrich St, Austin, TX 78723" },
];

async function main() {
  const results = [];
  const stillFailed = [];

  for (const bar of retries) {
    const result = await geocode(bar.query);
    if (result) {
      results.push({ id: bar.id, name: bar.name, lat: result.lat, lng: result.lng });
      console.log(`OK: ${bar.name} -> ${result.lat}, ${result.lng}`);
    } else {
      // Try with just name + city + state
      await sleep(DELAY_MS);
      const fallback = await geocode(`${bar.name}, ${bar.query.split(',').slice(-2).join(',').trim()}`);
      if (fallback) {
        results.push({ id: bar.id, name: bar.name, lat: fallback.lat, lng: fallback.lng });
        console.log(`FALLBACK: ${bar.name} -> ${fallback.lat}, ${fallback.lng}`);
      } else {
        stillFailed.push(bar);
        console.log(`FAIL: ${bar.name}`);
      }
      await sleep(DELAY_MS);
    }
    await sleep(DELAY_MS);
  }

  // Append to migration file
  if (results.length > 0) {
    const migrationPath = path.join(__dirname, '..', 'migrations', '003_geocode_bars.sql');
    let sql = fs.readFileSync(migrationPath, 'utf8');
    sql += `\n-- Retry batch: ${results.length} additional bars geocoded\n`;
    for (const r of results) {
      const safeName = r.name.replace(/'/g, "''");
      sql += `UPDATE bars SET latitude = ${r.lat}, longitude = ${r.lng} WHERE id = ${r.id}; -- ${safeName} (retry)\n`;
    }
    fs.writeFileSync(migrationPath, sql);
    console.log(`\nAppended ${results.length} UPDATE statements to migration file`);
  }

  if (stillFailed.length > 0) {
    console.log(`\nStill failed (${stillFailed.length}):`);
    for (const f of stillFailed) {
      console.log(`  ID ${f.id}: ${f.name} - ${f.query}`);
    }
  }
}

main().catch(console.error);
