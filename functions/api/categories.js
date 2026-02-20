/**
 * API: Categories
 * GET /api/categories
 *
 * Returns all categories with item counts.
 */

import { TABLE_NAME, CATEGORY_FIELD } from '../_shared/config.js';
import { jsonResponse } from '../_shared/response.js';

export async function onRequestGet(context) {
  const { env } = context;

  try {
    const { results } = await env.DB.prepare(
      `SELECT ${CATEGORY_FIELD} as category, COUNT(*) as count
       FROM ${TABLE_NAME}
       WHERE ${CATEGORY_FIELD} IS NOT NULL
       GROUP BY ${CATEGORY_FIELD}
       ORDER BY count DESC`
    ).all();

    return jsonResponse({ data: results || [] });

  } catch (error) {
    console.error('API categories error:', error);
    return jsonResponse({ error: 'Internal server error' }, 500);
  }
}
