/**
 * Barrel re-export — all shared utilities
 *
 * This file re-exports everything from the _shared/ modules so existing
 * imports continue to work: import { ... } from './_shared.js'
 *
 * Modules:
 *   _shared/config.js     — Site constants (SITE_NAME, DOMAIN, etc.)
 *   _shared/utils.js      — Utility functions (escapeHtml, slugify, truncate)
 *   _shared/layout.js     — Layout components (renderHead, renderNav, renderFooter, renderBreadcrumbs)
 *   _shared/components.js — UI components (renderCard, renderEmptyState, renderPagination)
 *   _shared/response.js   — Response helpers (renderPage, htmlResponse, jsonResponse, errorResponse)
 */

export { SITE_NAME, DOMAIN, PROD_BASE, TABLE_NAME, ITEMS_PATH, CATEGORY_FIELD, SCHEMA_TYPE, EXPERTISE_AREAS, SHORT_PATHS, HOMEPAGE_FILTER } from './_shared/config.js';
export { escapeHtml, slugify, truncate, capitalize } from './_shared/utils.js';
export { renderHead, renderNav, renderFooter, renderBreadcrumbs } from './_shared/layout.js';
export { renderCard, renderEmptyState, renderPagination } from './_shared/components.js';
export { renderMapToggle, renderMap } from './_shared/map.js';
export { renderPage, htmlResponse, jsonResponse, errorResponse } from './_shared/response.js';
