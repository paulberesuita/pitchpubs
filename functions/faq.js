/**
 * FAQ Page
 * GET /faq
 */

import {
  SITE_NAME,
  escapeHtml, renderHead, renderNav, renderFooter, renderBreadcrumbs,
  renderPage, htmlResponse
} from './_shared.js';

const FAQ_ITEMS = [
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
    answer: 'Yes! If you know a great soccer bar, click the Submit button and tell us about it. Include details like what leagues they show, whether they open early, and if any supporter groups watch there. We review every submission before publishing.'
  },
  {
    question: 'What does "opens early" mean?',
    answer: 'Bars marked "opens early" will open before their normal hours for morning soccer matches — typically for 7:30 AM ET Premier League kickoffs or Champions League games. This is a big deal for fans on the West Coast where matches start at 4:30 AM.'
  },
  {
    question: 'Is PitchPubs free?',
    answer: 'Completely free. Browse bars, search by city or team, and find your next match-day spot without paying anything. No account required.'
  },
  {
    question: 'A bar on here has closed or stopped showing soccer. How do I report it?',
    answer: 'Things change! If a bar has closed, stopped showing matches, or changed in a way that affects its listing, let us know through our contact page. We update listings as quickly as we can.'
  },
  {
    question: 'How is this different from just searching Google Maps?',
    answer: 'Google Maps tells you a place exists. We tell you if it\'s actually worth going to for soccer. We verify match coverage, fan atmosphere, early opens, and supporter group affiliations — things you can\'t get from a pin on a map.'
  }
];

export async function onRequestGet(context) {
  const { request } = context;
  const url = new URL(request.url);
  const baseUrl = `${url.protocol}//${url.host}`;

  // JSON-LD FAQ structured data
  const jsonLd = {
    "@context": "https://schema.org",
    "@type": "FAQPage",
    "mainEntity": FAQ_ITEMS.map(item => ({
      "@type": "Question",
      "name": item.question,
      "acceptedAnswer": {
        "@type": "Answer",
        "text": item.answer
      }
    }))
  };

  const head = renderHead({
    title: 'Frequently Asked Questions',
    description: `Common questions about ${SITE_NAME}. Learn how to use the directory, submit bars, and more.`,
    url: `${baseUrl}/faq`,
    jsonLd
  });

  const faqHtml = FAQ_ITEMS.map((item, i) => `
    <details class="group bg-surface rounded-xl border border-border overflow-hidden">
      <summary class="flex items-center justify-between p-6 cursor-pointer hover:bg-surface transition-colors">
        <h3 class="font-semibold text-lg pr-4">${escapeHtml(item.question)}</h3>
        <svg class="w-5 h-5 text-muted shrink-0 transition-transform group-open:rotate-180" fill="none" stroke="currentColor" viewBox="0 0 24 24">
          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7"></path>
        </svg>
      </summary>
      <div class="px-6 pb-6 text-muted leading-relaxed">
        ${escapeHtml(item.answer)}
      </div>
    </details>
  `).join('\n');

  const body = `
  ${renderNav('/faq')}

  <!-- Breadcrumbs -->
  <div class="border-b border-border">
    <div class="max-w-4xl mx-auto px-6 py-4">
      ${renderBreadcrumbs([
        { label: 'Home', href: '/' },
        { label: 'FAQ' }
      ], baseUrl)}
    </div>
  </div>

  <!-- Content -->
  <main class="max-w-4xl mx-auto px-6 py-12">
    <h1 class="text-3xl md:text-5xl font-bold tracking-tight mb-4">Frequently Asked Questions</h1>
    <p class="text-lg text-muted mb-10">Common questions about ${SITE_NAME}.</p>

    <div class="space-y-4">
      ${faqHtml}
    </div>

    <!-- Still have questions -->
    <div class="mt-12 bg-surface rounded-xl p-8 text-center">
      <h2 class="text-xl font-semibold mb-2">Still have questions?</h2>
      <p class="text-muted mb-6">Can't find what you're looking for? Get in touch with us.</p>
      <a href="/contact" class="bg-accent hover:bg-accent-hover text-white font-medium px-6 py-3 rounded-lg transition-all inline-block">
        Contact Us
      </a>
    </div>
  </main>

  ${renderFooter()}
  `;

  return htmlResponse(renderPage(head, body));
}
