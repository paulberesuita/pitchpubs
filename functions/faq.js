/**
 * FAQ Page
 * GET /faq
 */

import {
  SITE_NAME,
  escapeHtml, renderHead, renderNav, renderFooter, renderBreadcrumbs,
  renderPage, htmlResponse
} from './_shared.js';

// FAQ items tailored for DeskCafe
const FAQ_ITEMS = [
  {
    question: 'What is DeskCafe?',
    answer: `${SITE_NAME} is a curated directory of work-friendly cafes. We help remote workers, freelancers, and digital nomads find cafes with fast WiFi, good seating, and the right vibe for getting work done.`
  },
  {
    question: 'How do you pick which cafes to include?',
    answer: 'Every cafe is visited or verified by remote workers before being listed. We check WiFi speed, outlet availability, seating comfort, noise levels, and whether the cafe actually welcomes laptop workers. Not every good cafe is a good work cafe.'
  },
  {
    question: 'Can I submit a cafe?',
    answer: 'Yes! If you know a great work-friendly cafe, click the Submit button and tell us about it. Include details like WiFi quality, hours, and what makes it good for working. We review every submission before publishing.'
  },
  {
    question: 'What do the categories mean?',
    answer: 'We group cafes by what they do best. "Fast WiFi" means reliable, high-speed internet. "Quiet & Focused" is for deep work with minimal noise. "Social & Buzzy" is for collaborative energy. "Late Night" stays open past normal hours. "Outdoor" has patios or garden workspaces.'
  },
  {
    question: 'Is DeskCafe free?',
    answer: 'Completely free. Browse cafes, read reviews, and find your next workspace without paying anything. No account required.'
  },
  {
    question: 'A cafe on here has closed or changed. How do I report it?',
    answer: 'Things change! If a cafe has closed, moved, dropped its WiFi quality, or stopped welcoming remote workers, let us know through our contact page. We update listings as quickly as we can.'
  },
  {
    question: 'Do you verify WiFi speeds?',
    answer: 'Yes. We test or collect speed reports from real users at each location. If a cafe claims "fast WiFi" but can barely load a webpage, it won\'t make our list.'
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
    description: `Common questions about ${SITE_NAME}. Learn how to use the directory, submit items, and more.`,
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
      <a href="/contact" class="bg-primary hover:bg-primary-hover text-white font-medium px-6 py-3 rounded-lg transition-all inline-block">
        Contact Us
      </a>
    </div>
  </main>

  ${renderFooter()}
  `;

  return htmlResponse(renderPage(head, body));
}
