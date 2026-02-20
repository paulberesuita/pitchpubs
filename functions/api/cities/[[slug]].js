/**
 * API: Cities
 * GET /api/cities — All cities with item counts (optional ?state= filter)
 * GET /api/cities/[slug] — Items in a city with pagination
 */

import { TABLE_NAME } from '../../_shared/config.js';
import { slugify } from '../../_shared/utils.js';
import { jsonResponse } from '../../_shared/response.js';

export async function onRequestGet(context) {
  const { env, request, params } = context;
  const slug = params.slug?.[0];

  if (!slug) {
    return handleList(env, request);
  }
  return handleDetail(env, request, slug);
}

/**
 * All cities with item counts
 * GET /api/cities?state=TX
 */
async function handleList(env, request) {
  try {
    const url = new URL(request.url);
    const stateFilter = url.searchParams.get('state');

    let query = `SELECT city, state, COUNT(*) as count
       FROM ${TABLE_NAME}
       WHERE city IS NOT NULL AND city != ''`;
    const bindings = [];

    if (stateFilter) {
      query += ` AND state = ?`;
      bindings.push(stateFilter);
    }

    query += ` GROUP BY city, state ORDER BY count DESC, city ASC`;

    const { results: cities } = await env.DB.prepare(query).bind(...bindings).all();

    return jsonResponse({ data: cities || [] });

  } catch (error) {
    console.error('API cities list error:', error);
    return jsonResponse({ error: 'Internal server error' }, 500);
  }
}

/**
 * Items in a city with pagination
 * GET /api/cities/[slug]?limit=50&offset=0
 * Slug format: city-name-state (e.g., austin-tx)
 */
async function handleDetail(env, request, slug) {
  try {
    // Find city by matching slugified "city-state" combinations
    const { results: allCities } = await env.DB.prepare(
      `SELECT DISTINCT city, state FROM ${TABLE_NAME}
       WHERE city IS NOT NULL AND city != ''`
    ).all();

    const match = allCities.find(c =>
      slugify(c.city + '-' + c.state) === slug.toLowerCase()
    );

    if (!match) {
      return jsonResponse({ error: 'Not found' }, 404);
    }

    const { city: cityName, state: stateName } = match;
    const url = new URL(request.url);
    const limit = Math.min(100, Math.max(1, parseInt(url.searchParams.get('limit')) || 50));
    const offset = Math.max(0, parseInt(url.searchParams.get('offset')) || 0);

    const { results: items } = await env.DB.prepare(
      `SELECT * FROM ${TABLE_NAME}
       WHERE city = ? AND state = ?
       ORDER BY name ASC
       LIMIT ? OFFSET ?`
    ).bind(cityName, stateName, limit, offset).all();

    const countResult = await env.DB.prepare(
      `SELECT COUNT(*) as count FROM ${TABLE_NAME} WHERE city = ? AND state = ?`
    ).bind(cityName, stateName).first();

    const total = countResult?.count || 0;

    // Parse sources for each item
    for (const item of items) {
      if (item.sources) {
        try { item.sources = JSON.parse(item.sources); } catch (e) { /* keep as string */ }
      }
    }

    return jsonResponse({
      data: items || [],
      meta: { city: cityName, state: stateName, total, limit, offset, hasMore: offset + limit < total }
    });

  } catch (error) {
    console.error('API city detail error:', error);
    return jsonResponse({ error: 'Internal server error' }, 500);
  }
}
