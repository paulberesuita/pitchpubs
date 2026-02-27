/**
 * Submit Page
 * GET /submit
 * POST /submit (form submission)
 */

import {
  SITE_NAME, TABLE_NAME, CATEGORY_FIELD,
  escapeHtml, slugify, renderHead, renderNav, renderFooter, renderBreadcrumbs,
  renderPage, htmlResponse
} from './_shared.js';

export async function onRequestGet(context) {
  const { env, request } = context;
  const url = new URL(request.url);
  const baseUrl = `${url.protocol}//${url.host}`;
  const success = url.searchParams.get('success') === 'true';

  // Get categories for dropdown
  let categories = [];
  try {
    const { results } = await env.DB.prepare(
      `SELECT DISTINCT ${CATEGORY_FIELD} as category FROM ${TABLE_NAME} WHERE ${CATEGORY_FIELD} IS NOT NULL ORDER BY ${CATEGORY_FIELD}`
    ).all();
    categories = results.map(r => r.category);
  } catch (e) {
    // Table may not exist yet
  }

  const head = renderHead({
    title: 'Submit',
    description: `Submit a new item to ${SITE_NAME}. Help grow our directory with your contribution.`,
    url: `${baseUrl}/submit`
  });

  const categoryOptions = categories.length > 0
    ? categories.map(cat => `<option value="${escapeHtml(cat)}">${escapeHtml(cat)}</option>`).join('\n')
    : '';

  const body = `
  ${renderNav('/submit')}
      ${renderBreadcrumbs([
        { label: 'Home', href: '/' },
        { label: 'Submit' }
      ], baseUrl)}

  <!-- Content -->
  <main class="max-w-2xl mx-auto px-6 py-14">
    <h1 class="font-display text-3xl md:text-5xl font-bold tracking-tight mb-4 animate-fade-in-up">Submit an Item</h1>
    <p class="text-lg text-muted mb-10 animate-fade-in-up stagger-2 leading-relaxed">Know something that should be in our directory? Submit it here.</p>

    ${success ? `
    <div class="p-5 bg-success-bg border border-success/20 rounded-2xl mb-10">
      <p class="font-medium text-success">Submission received! We'll review it and add it to the directory.</p>
    </div>
    ` : ''}

    <form method="POST" action="/submit" class="bg-surface rounded-2xl border border-border p-8 md:p-10 space-y-7 animate-fade-in-up stagger-3">

      <div>
        <label class="block text-sm font-medium mb-2.5" for="name">Name *</label>
        <input
          type="text"
          id="name"
          name="name"
          required
          placeholder="Item name"
          class="w-full bg-white border border-border rounded-xl px-4 py-3 focus:outline-none transition-all"
        >
      </div>

      <div>
        <label class="block text-sm font-medium mb-2.5" for="website">Website URL</label>
        <input
          type="url"
          id="website"
          name="website"
          placeholder="https://..."
          class="w-full bg-white border border-border rounded-xl px-4 py-3 focus:outline-none transition-all"
        >
      </div>

      <div>
        <label class="block text-sm font-medium mb-2.5" for="description">Description *</label>
        <textarea
          id="description"
          name="description"
          required
          rows="4"
          placeholder="Describe this item..."
          class="w-full bg-white border border-border rounded-xl px-4 py-3 focus:outline-none resize-none transition-all"
        ></textarea>
        <p class="text-sm text-muted mt-2">What is it? What makes it special?</p>
      </div>

      <div>
        <label class="block text-sm font-medium mb-2.5" for="category">Category *</label>
        <select
          id="category"
          name="category"
          required
          class="w-full bg-white border border-border rounded-xl px-4 py-3 focus:outline-none transition-all"
        >
          <option value="">Select category...</option>
          ${categoryOptions}
          <option value="_new">+ Suggest New Category</option>
        </select>
      </div>

      <div id="new-category-field" class="hidden">
        <label class="block text-sm font-medium mb-2.5" for="new_category">New Category Name</label>
        <input
          type="text"
          id="new_category"
          name="new_category"
          placeholder="Category name"
          class="w-full bg-white border border-border rounded-xl px-4 py-3 focus:outline-none transition-all"
        >
      </div>

      <div>
        <label class="block text-sm font-medium mb-2.5" for="submitter_email">Your Email (optional)</label>
        <input
          type="email"
          id="submitter_email"
          name="submitter_email"
          placeholder="you@example.com"
          class="w-full bg-white border border-border rounded-xl px-4 py-3 focus:outline-none transition-all"
        >
        <p class="text-sm text-muted mt-2">We'll notify you when your submission is approved.</p>
      </div>

      <div class="border-t border-border pt-7">
        <button
          type="submit"
          class="w-full bg-primary hover:bg-primary-hover text-white font-medium py-3.5 rounded-xl transition-all duration-200"
        >
          Submit Item
        </button>
        <p class="text-sm text-muted text-center mt-5">All submissions are reviewed before being published.</p>
      </div>

    </form>
  </main>

  <script>
    // Show/hide new category field
    const categorySelect = document.getElementById('category');
    const newCategoryField = document.getElementById('new-category-field');

    categorySelect.addEventListener('change', function() {
      if (this.value === '_new') {
        newCategoryField.classList.remove('hidden');
      } else {
        newCategoryField.classList.add('hidden');
      }
    });
  </script>

  ${renderFooter()}
  `;

  return htmlResponse(renderPage(head, body));
}

export async function onRequestPost(context) {
  const { env, request } = context;
  const url = new URL(request.url);

  try {
    const formData = await request.formData();
    const name = formData.get('name');
    const website = formData.get('website');
    const description = formData.get('description');
    let category = formData.get('category');
    const newCategory = formData.get('new_category');
    const submitterEmail = formData.get('submitter_email');

    // Use new category if selected
    if (category === '_new' && newCategory) {
      category = newCategory;
    }

    // Generate slug
    const slug = slugify(name);

    // Store in submissions table for review
    await env.DB.prepare(
      `INSERT INTO submissions (name, slug, description, category, source_url, email, created_at)
       VALUES (?, ?, ?, ?, ?, ?, datetime('now'))`
    ).bind(name, slug, description, category, website || null, submitterEmail || null).run();

    // Redirect to success
    return Response.redirect(`${url.origin}/submit?success=true`, 303);

  } catch (error) {
    console.error('Submit form error:', error);
    return Response.redirect(`${url.origin}/submit?error=true`, 303);
  }
}
