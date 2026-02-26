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

// Homepage FAQ — shown below the grid with FAQPage structured data for rich results
export const HOMEPAGE_FAQ = [
  {
    question: 'What is PitchPubs?',
    answer: `${SITE_NAME} is a curated directory of soccer-friendly bars across America. We help fans find the best spots to watch Premier League, Champions League, MLS, La Liga, and World Cup matches — bars where football is the main event, not background noise.`
  },
  {
    question: 'How do you pick which bars to include?',
    answer: 'We verify every bar through supporter communities, local fan groups, Google reviews, Reddit, and social media. A bar makes our list when it consistently shows soccer matches, has a genuine fan atmosphere, and is recommended by the local soccer community.'
  },
  {
    question: 'Can I submit a bar?',
    answer: 'Yes! Click the Submit button and tell us about it. Include details like what leagues they show, whether they open early, and if any supporter groups watch there. We review every submission before publishing.'
  },
  {
    question: 'How is this different from just searching Google Maps?',
    answer: 'Google Maps tells you a place exists. We tell you if it\'s actually worth going to for soccer. We verify match coverage, fan atmosphere, early opens, and supporter group affiliations — things you can\'t get from a pin on a map.'
  },
  {
    question: `Is ${SITE_NAME} free?`,
    answer: 'Completely free. Browse bars, search by city or team, and find your next match-day spot without paying anything. No account required.'
  }
];

// Ambient effects
export const EFFECTS = {
  grain: false,
  countUp: true,
};
