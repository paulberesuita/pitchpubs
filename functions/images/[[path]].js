/**
 * R2 Image Proxy
 * GET /images/*
 *
 * Serves images from R2 bucket with caching
 */

export async function onRequestGet(context) {
  const { env, params } = context;

  // Get the full path from params
  const pathParts = params.path || [];
  const key = pathParts.join('/');

  if (!key) {
    return new Response('Not found', { status: 404 });
  }

  try {
    // Get object from R2
    const object = await env.IMAGES.get(key);

    if (!object) {
      return new Response('Image not found', { status: 404 });
    }

    // Determine content type
    const ext = key.split('.').pop()?.toLowerCase();
    const contentTypes = {
      'jpg': 'image/jpeg',
      'jpeg': 'image/jpeg',
      'png': 'image/png',
      'gif': 'image/gif',
      'webp': 'image/webp',
      'svg': 'image/svg+xml',
      'ico': 'image/x-icon'
    };

    const contentType = object.httpMetadata?.contentType
      || contentTypes[ext]
      || 'application/octet-stream';

    // Return image with aggressive caching (images don't change)
    return new Response(object.body, {
      headers: {
        'Content-Type': contentType,
        'Cache-Control': 'public, max-age=31536000, immutable', // 1 year
        'ETag': object.httpEtag || object.etag,
      }
    });

  } catch (error) {
    console.error('Image proxy error:', error);
    return new Response('Error loading image', { status: 500 });
  }
}
