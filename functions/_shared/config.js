/**
 * Site configuration — updated during setup
 *
 * These constants are the first things configured when setting up a new directory.
 * During setup, Claude derives all values from the user's directory idea.
 */

// Setup flag — the setup agent flips this to true when bootstrap is complete
export const CONFIGURED = false;

export const SITE_NAME = 'DeskCafe';
export const DOMAIN = 'directory-template-y9q.pages.dev';
export const PROD_BASE = DOMAIN.startsWith('http') ? DOMAIN : `https://${DOMAIN}`;
export const TABLE_NAME = 'items';
export const ITEMS_PATH = 'cafes';
export const CATEGORY_FIELD = 'category';

// Schema.org type for detail pages — pick the most specific type during setup
// Examples: 'LocalBusiness', 'Restaurant', 'TouristAttraction', 'Product', 'SoftwareApplication'
export const SCHEMA_TYPE = 'LocalBusiness';

// Expertise areas for Organization schema (E-E-A-T signal)
// Customize during setup to match directory topic
export const EXPERTISE_AREAS = ['work-friendly cafes', 'remote work spaces', 'cafe reviews'];

// Homepage filter pills — what users filter by first
// 'states' for location-based directories (cafes, restaurants, haunted places)
// 'categories' for non-location directories (tools, books, products)
export const HOMEPAGE_FILTER = 'states';

// Short-path category routes — maps short URLs to category slugs
// e.g., '/quiet-spots' → '/category/quiet-spots'
// Targets shorter keywords for programmatic SEO
// Customize during setup to match your category names
export const SHORT_PATHS = {
  // 'short-url': 'category-slug'
  // Example: 'quiet-spots': 'quiet-spots',
};

// Ambient effects — optional visual polish layer
// Toggle during setup based on directory mood
export const EFFECTS = {
  grain: false,       // Subtle noise/grain texture overlay on hero sections
  countUp: true,      // Animate numbers counting up when they scroll into view
};
