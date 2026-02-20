/**
 * Map view toggle + Leaflet integration
 *
 * Two functions used together:
 *   renderMapToggle(items)  — inline toggle buttons (place in toolbar/header)
 *   renderMap(items)        — map container + data + JS (place after grid)
 *
 * Both return '' if no items have coordinates. Leaflet is only loaded
 * via mapEnabled flag in renderHead() when items have lat/lng.
 */

import { ITEMS_PATH, CATEGORY_FIELD } from './config.js';

/**
 * Render grid/map toggle buttons (inline in toolbar).
 * Returns empty string if no items have coordinates.
 */
export function renderMapToggle(items) {
  const count = items.filter(i => i.latitude && i.longitude).length;
  if (count === 0) return '';

  return `
  <div class="flex items-center gap-1 bg-surface border border-border rounded-xl p-1" id="view-toggle">
    <button data-view="grid" class="text-sm font-medium px-4 py-1.5 rounded-lg bg-primary text-white transition-all">Grid</button>
    <button data-view="map" class="text-sm font-medium px-4 py-1.5 rounded-lg text-muted hover:text-primary transition-all">Map (${count})</button>
  </div>
  `;
}

/**
 * Render map container, data blob, and client-side JS.
 * Place after the grid div, not inside toolbar/header flex containers.
 * Returns empty string if no items have coordinates.
 */
export function renderMap(items, { basePath = ITEMS_PATH } = {}) {
  const mappable = items.filter(i => i.latitude && i.longitude);
  if (mappable.length === 0) return '';

  const mapData = mappable.map(i => ({
    lat: i.latitude,
    lng: i.longitude,
    name: i.name,
    slug: i.slug,
    category: i[CATEGORY_FIELD] || '',
    city: i.city || '',
    state: i.state || '',
    image_url: i.image_url || ''
  }));

  return `
  <div id="map-container" class="hidden rounded-2xl border border-border overflow-hidden relative z-0" style="height: 500px;"></div>
  <script type="application/json" id="map-data">${JSON.stringify(mapData)}</script>
  <script>
  (function() {
    var toggle = document.getElementById('view-toggle');
    var grid = document.getElementById('directory-grid');
    var mapContainer = document.getElementById('map-container');
    var mapInstance = null;

    if (!toggle || !grid || !mapContainer) return;

    function esc(s) {
      var d = document.createElement('div');
      d.textContent = s;
      return d.innerHTML;
    }

    var buttons = toggle.querySelectorAll('button');

    function setView(view) {
      var pagination = document.querySelector('[aria-label="Pagination"]');
      buttons.forEach(function(b) {
        if (b.dataset.view === view) {
          b.className = 'text-sm font-medium px-4 py-1.5 rounded-lg bg-primary text-white transition-all';
        } else {
          b.className = 'text-sm font-medium px-4 py-1.5 rounded-lg text-muted hover:text-primary transition-all';
        }
      });

      if (view === 'map') {
        grid.classList.add('hidden');
        if (pagination) pagination.classList.add('hidden');
        mapContainer.classList.remove('hidden');
        if (!mapInstance) initMap();
        else mapInstance.invalidateSize();
      } else {
        grid.classList.remove('hidden');
        if (pagination) pagination.classList.remove('hidden');
        mapContainer.classList.add('hidden');
      }
    }

    function initMap() {
      var data = JSON.parse(document.getElementById('map-data').textContent);
      mapInstance = L.map('map-container', { scrollWheelZoom: false });
      L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
        attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a>',
        maxZoom: 18
      }).addTo(mapInstance);

      var bounds = [];
      data.forEach(function(item) {
        var latlng = [item.lat, item.lng];
        bounds.push(latlng);
        var imgHtml = item.image_url
          ? '<img src="' + esc(item.image_url) + '" alt="" style="width:120px;height:80px;object-fit:cover;border-radius:6px;margin-bottom:6px;" onerror="this.style.display=\\'none\\'">'
          : '';
        var popup = '<div style="text-align:center;min-width:130px;">'
          + imgHtml
          + '<div style="font-weight:600;font-size:13px;margin-bottom:2px;">' + esc(item.name) + '</div>'
          + (item.city ? '<div style="font-size:11px;color:#78716c;">' + esc(item.city) + (item.state ? ', ' + esc(item.state) : '') + '</div>' : '')
          + '<a href="/${basePath}/' + encodeURIComponent(item.slug) + '" style="display:inline-block;margin-top:6px;font-size:12px;color:#1c1917;font-weight:500;">View &rarr;</a>'
          + '</div>';
        L.marker(latlng).addTo(mapInstance).bindPopup(popup);
      });

      if (bounds.length > 0) {
        mapInstance.fitBounds(bounds, { padding: [40, 40], maxZoom: 13 });
      }
    }

    buttons.forEach(function(b) {
      b.addEventListener('click', function() { setView(b.dataset.view); });
    });
  })();
  </script>
  `;
}
