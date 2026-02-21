/**
 * Site configuration — PitchPubs
 */

export const CONFIGURED = true;

export const SITE_NAME = 'PitchPubs';
export const DOMAIN = 'pitchpubs.com';
export const PROD_BASE = DOMAIN.startsWith('http') ? DOMAIN : `https://${DOMAIN}`;
export const TABLE_NAME = 'bars';
export const ITEMS_PATH = 'bars';
export const CATEGORY_FIELD = 'city';

// Schema.org type for detail pages
export const SCHEMA_TYPE = 'BarOrClub';

// Expertise areas for Organization schema (E-E-A-T signal)
export const EXPERTISE_AREAS = ['soccer bars', 'football pubs', 'World Cup 2026 venues', 'sports bars'];

// Homepage filter pills — states for location-based directory
export const HOMEPAGE_FILTER = 'states';

// Short-path category routes
export const SHORT_PATHS = {};

// Ambient effects
export const EFFECTS = {
  grain: false,
  countUp: true,
};
