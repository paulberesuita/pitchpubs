/**
 * API: States
 * GET /api/states — All states with item counts
 * GET /api/states/[slug] — Items in a state with pagination
 */

import { TABLE_NAME } from '../../_shared/config.js';
import { jsonResponse } from '../../_shared/response.js';

export async function onRequestGet(context) {
  const { env, request, params } = context;
  const slug = params.slug?.[0];

  if (!slug) {
    return handleList(env);
  }
  return handleDetail(env, request, slug);
}

/**
 * All states with item counts
 * GET /api/states
 */
async function handleList(env) {
  try {
    const { results: states } = await env.DB.prepare(
      `SELECT state, COUNT(*) as count
       FROM ${TABLE_NAME}
       WHERE state IS NOT NULL AND state != ''
       GROUP BY state
       ORDER BY count DESC, state ASC`
    ).all();

    return jsonResponse({ data: states || [] });

  } catch (error) {
    console.error('API states list error:', error);
    return jsonResponse({ error: 'Internal server error' }, 500);
  }
}

/**
 * Items in a state with pagination
 * GET /api/states/[slug]?limit=50&offset=0
 */
async function handleDetail(env, request, slug) {
  try {
    // Find state by slug match (same pattern as SSR page)
    const stateResult = await env.DB.prepare(
      `SELECT DISTINCT state FROM ${TABLE_NAME}
       WHERE LOWER(REPLACE(REPLACE(state, ' ', '-'), '.', '')) = ?
       LIMIT 1`
    ).bind(slug.toLowerCase()).first();

    if (!stateResult) {
      return jsonResponse({ error: 'Not found' }, 404);
    }

    const stateName = stateResult.state;
    const url = new URL(request.url);
    const limit = Math.min(100, Math.max(1, parseInt(url.searchParams.get('limit')) || 50));
    const offset = Math.max(0, parseInt(url.searchParams.get('offset')) || 0);

    const { results: items } = await env.DB.prepare(
      `SELECT * FROM ${TABLE_NAME}
       WHERE state = ?
       ORDER BY city ASC, name ASC
       LIMIT ? OFFSET ?`
    ).bind(stateName, limit, offset).all();

    const countResult = await env.DB.prepare(
      `SELECT COUNT(*) as count FROM ${TABLE_NAME} WHERE state = ?`
    ).bind(stateName).first();

    const total = countResult?.count || 0;

    // Parse sources for each item
    for (const item of items) {
      if (item.sources) {
        try { item.sources = JSON.parse(item.sources); } catch (e) { /* keep as string */ }
      }
    }

    return jsonResponse({
      data: items || [],
      meta: { state: stateName, total, limit, offset, hasMore: offset + limit < total }
    });

  } catch (error) {
    console.error('API state detail error:', error);
    return jsonResponse({ error: 'Internal server error' }, 500);
  }
}
