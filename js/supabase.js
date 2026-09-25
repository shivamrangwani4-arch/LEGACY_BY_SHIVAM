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
