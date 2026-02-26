/**
 * API: Items
 * GET /api/items — List items with filters
 * GET /api/items/[slug] — Single item detail
 *
 * NOTE: [[slug]].js handles BOTH routes (same pattern as SSR pages)
 */

import { TABLE_NAME, CATEGORY_FIELD } from '../../_shared/config.js';
import { jsonResponse } from '../../_shared/response.js';

export async function onRequestGet(context) {
  const { env, request, params } = context;
  const slug = params.slug?.[0];

  if (!slug) {
    return handleList(env, request);
  }
  return handleDetail(env, slug);
}

/**
 * List items with filters and pagination
 * GET /api/items?category=X&state=X&city=X&q=X&limit=50&offset=0
 */
async function handleList(env, request) {
  const url = new URL(request.url);

  try {
    const category = url.searchParams.get('category');
    const state = url.searchParams.get('state');
    const city = url.searchParams.get('city');
    const query = url.searchParams.get('q');
    const featured = url.searchParams.get('featured');
    const limit = Math.min(100, Math.max(1, parseInt(url.searchParams.get('limit')) || 50));
    const offset = Math.max(0, parseInt(url.searchParams.get('offset')) || 0);

    const conditions = [];
    const bindings = [];

    if (featured === '1') {
      conditions.push(`featured = 1`);
    }
    if (category) {
      conditions.push(`${CATEGORY_FIELD} = ?`);
      bindings.push(category);
    }
    if (state) {
      conditions.push(`state = ?`);
      bindings.push(state);
    }
    if (city) {
      conditions.push(`city = ?`);
      bindings.push(city);
    }
    if (query) {
      conditions.push(`(name LIKE ? OR description LIKE ? OR content LIKE ?)`);
      const pattern = `%${query}%`;
      bindings.push(pattern, pattern, pattern);
    }

    const whereClause = conditions.length > 0
      ? `WHERE ${conditions.join(' AND ')}`
      : '';

    const sort = url.searchParams.get('sort') || '';
    const sortOptions = {
      'latest': 'created_at DESC',
      'az': 'name ASC',
      'za': 'name DESC',
      '': 'CASE WHEN image_url IS NOT NULL AND image_url != \'\' THEN 0 ELSE 1 END, name ASC'
    };
    const orderBy = sortOptions[sort] || sortOptions[''];

    const { results: items } = await env.DB.prepare(
      `SELECT * FROM ${TABLE_NAME} ${whereClause} ORDER BY ${orderBy} LIMIT ? OFFSET ?`
    ).bind(...bindings, limit, offset).all();

    const countResult = await env.DB.prepare(
      `SELECT COUNT(*) as count FROM ${TABLE_NAME} ${whereClause}`
    ).bind(...bindings).first();

    const total = countResult?.count || 0;

    return jsonResponse({
      data: items || [],
      meta: { total, limit, offset, hasMore: offset + limit < total }
    });

  } catch (error) {
    console.error('API items list error:', error);
    return jsonResponse({ error: 'Internal server error' }, 500);
  }
}

/**
 * Single item by slug
 * GET /api/items/[slug]
 */
async function handleDetail(env, slug) {
  try {
    const item = await env.DB.prepare(
      `SELECT * FROM ${TABLE_NAME} WHERE slug = ?`
    ).bind(slug).first();

    if (!item) {
      return jsonResponse({ error: 'Not found' }, 404);
    }

    if (item.sources) {
      try { item.sources = JSON.parse(item.sources); } catch (e) { /* keep as string */ }
    }

    return jsonResponse({ data: item });

  } catch (error) {
    console.error('API item detail error:', error);
    return jsonResponse({ error: 'Internal server error' }, 500);
  }
}
