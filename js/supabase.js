// LEGACY (EST. 2026) - Supabase Integration Client
// Project: https://vuquknseojgxeluplwcr.supabase.co
// Creative Direction by Shivam Rangwani

const SUPABASE_CONFIG = {
  url: 'https://vuquknseojgxeluplwcr.supabase.co',
  anonKey: 'sb_publishable_kne0D_Dc762-JF2aGvGs2g_xCCKmhAr'
};

// Initialize Supabase Client using global window.supabase from CDN
let supabaseClient = null;

function getSupabaseClient() {
  if (supabaseClient) return supabaseClient;
  if (window.supabase && typeof window.supabase.createClient === 'function') {
    try {
      supabaseClient = window.supabase.createClient(SUPABASE_CONFIG.url, SUPABASE_CONFIG.anonKey);
      console.log('✅ Supabase connected for LEGACY BY SHIVAM RANGWANI');
    } catch (err) {
      console.error('❌ Supabase initialization error:', err);
    }
  }
  return supabaseClient;
}

// Auto initialize on load
if (document.readyState === 'loading') {
  document.addEventListener('DOMContentLoaded', getSupabaseClient);
} else {
  getSupabaseClient();
}

/**
 * Save an order to Supabase table `orders`
 */
async function saveOrderToSupabase(orderPayload) {
  const sb = getSupabaseClient();
  if (!sb) {
    console.warn('Supabase is not initialized. Order recorded locally.');
    return { data: null, error: new Error('Supabase not loaded') };
  }

  try {
    const { data, error } = await sb
      .from('orders')
      .insert([{
        order_number: orderPayload.orderNumber,
        customer_name: orderPayload.fullName,
        phone: orderPayload.phone,
        email: orderPayload.email,
        address: orderPayload.address,
        city: orderPayload.city,
        postal_code: orderPayload.postalCode || '',
        payment_method: orderPayload.paymentMethod || 'COD',
        total_amount: orderPayload.totalAmount,
        currency: orderPayload.currency || 'PKR',
        items: orderPayload.items,
        status: 'pending'
      }])
      .select();

    if (error) {
      console.error('Supabase Order Save Error:', error);
      return { data: null, error };
    }

    console.log('🎉 Order recorded in Supabase database:', data);
    return { data, error: null };
  } catch (err) {
    console.error('Supabase Exception:', err);
    return { data: null, error: err };
  }
}

/**
 * Save newsletter email to Supabase table `newsletter_subscribers`
 */
async function saveSubscriberToSupabase(email) {
  const sb = getSupabaseClient();
  if (!sb || !email) return;

  try {
    const { data, error } = await sb
      .from('newsletter_subscribers')
      .insert([{ email: email.trim().toLowerCase() }]);

    if (error) {
      if (error.code !== '23505') {
        console.error('Newsletter error:', error);
      }
      return { data: null, error };
    }
    console.log('Newsletter subscription recorded:', email);
    return { data, error: null };
  } catch (err) {
    console.error('Newsletter exception:', err);
  }
}

/**
 * Fetch live products from Supabase table `products`
 */
async function fetchProductsFromSupabase() {
  const sb = getSupabaseClient();
  if (!sb) return null;

  try {
    const { data, error } = await sb
      .from('products')
      .select('*')
      .eq('in_stock', true)
      .order('created_at', { ascending: false });

    if (error) {
      if (error.code !== 'PGRST205') {
        console.warn('Supabase fetch products notice:', error.message);
      }
      return null;
    }

    if (data && data.length > 0) {
      const formatted = data.map(item => {
        let cat = (item.category || '').toLowerCase();
        let subCat = (item.sub_category || '').toLowerCase();
        if (cat === 'men' || cat === 'women' || cat === 'juniors' || !cat) {
          const n = (item.name || '').toLowerCase();
          if (n.includes('shirt') || n.includes('polo') || n.includes('top') || n.includes('tee') || n.includes('jacket')) {
            cat = 'tops';
            subCat = 'shirts';
          } else if (n.includes('pant') || n.includes('jeans') || n.includes('denim') || n.includes('trouser')) {
            cat = 'pants';
            subCat = 'trousers';
          } else {
            cat = 'tops';
            subCat = 'shirts';
          }
        }

        return {
          id: item.id,
          name: item.name,
          brand: item.brand || 'LEGACY',
          gender: (item.gender || 'men').toLowerCase(),
          category: cat,
          subCategory: subCat,
          price: Number(item.price) || 0,
          originalPrice: item.original_price ? Number(item.original_price) : null,
          tag: item.tag || 'LEGACY ATELIER',
          badge: item.badge || '',
          rating: Number(item.rating || 5.0),
          reviews: Number(item.reviews_count || 1),
          image: item.image,
          secondaryImage: item.secondary_image || item.image,
          colors: Array.isArray(item.colors) ? item.colors : (typeof item.colors === 'string' ? JSON.parse(item.colors) : []),
          sizes: Array.isArray(item.sizes) ? item.sizes : (typeof item.sizes === 'string' ? JSON.parse(item.sizes) : ['S', 'M', 'L', 'XL']),
          description: item.description || '',
          features: Array.isArray(item.features) ? item.features : (typeof item.features === 'string' ? JSON.parse(item.features) : [])
        };
      });

      // Merge Supabase products at the top of the catalog
      const localList = (typeof window !== 'undefined' && Array.isArray(window.PRODUCTS_DATA)) 
        ? [...window.PRODUCTS_DATA] 
        : [];
      const supabaseIds = new Set(formatted.map(p => p.id));
      const remainingLocal = localList.filter(p => !supabaseIds.has(p.id));

      const merged = [...formatted, ...remainingLocal];

      if (typeof window !== 'undefined') {
        window.PRODUCTS_DATA = merged;
      }
      console.log(`✅ Loaded ${formatted.length} Supabase products. Total catalog size: ${merged.length}`);
      return merged;
    }
  } catch (err) {
    console.warn('Error reading products from Supabase:', err);
  }
  return null;
}

/**
 * Bulk sync local PRODUCTS_DATA into Supabase `products` table
 */
async function syncLocalProductsToSupabase() {
  const sb = getSupabaseClient();
  if (!sb) {
    console.error('Supabase client not initialized');
    return { count: 0, error: 'Not initialized' };
  }

  const list = typeof PRODUCTS_DATA !== 'undefined' ? PRODUCTS_DATA : [];
  if (list.length === 0) return { count: 0 };

  const rows = list.map(p => ({
    id: p.id,
    name: p.name,
    brand: p.brand || 'LEGACY',
    gender: p.gender,
    category: p.category,
    sub_category: p.subCategory || p.category,
    price: p.price,
    original_price: p.originalPrice || null,
    tag: p.tag || 'LEGACY ATELIER',
    rating: p.rating || 5.0,
    reviews_count: p.reviews || 1,
    image: p.image,
    secondary_image: p.secondaryImage || p.image,
    colors: p.colors || [],
    sizes: p.sizes || ['S', 'M', 'L', 'XL'],
    description: p.description || '',
    features: p.features || [],
    in_stock: true
  }));

  try {
    const { data, error } = await sb
      .from('products')
      .upsert(rows, { onConflict: 'id' });

    if (error) {
      console.error('Sync to Supabase error:', error);
      return { count: 0, error };
    }

    console.log(`🎉 Successfully synced ${rows.length} products to Supabase!`);
    return { count: rows.length, error: null };
  } catch (err) {
    console.error('Sync exception:', err);
    return { count: 0, error: err };
  }
}
