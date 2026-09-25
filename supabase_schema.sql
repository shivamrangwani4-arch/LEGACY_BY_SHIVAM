-- ========================================================
-- LEGACY BY SHIVAM RANGWANI (EST. 2026) - DATABASE SCHEMA
-- Run this script in your Supabase SQL Editor:
-- https://supabase.com/dashboard/project/vuquknseojgxeluplwcr/sql/new
-- ========================================================

-- 1. ORDERS TABLE (Tracks All Cash on Delivery & Online Orders)
CREATE TABLE IF NOT EXISTS public.orders (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    order_number TEXT UNIQUE NOT NULL,
    customer_name TEXT NOT NULL,
    phone TEXT NOT NULL,
    email TEXT NOT NULL,
    address TEXT NOT NULL,
    city TEXT NOT NULL,
    postal_code TEXT,
    payment_method TEXT DEFAULT 'COD',
    total_amount NUMERIC NOT NULL,
    currency TEXT DEFAULT 'PKR',
    items JSONB NOT NULL,
    status TEXT DEFAULT 'pending', -- 'pending', 'processing', 'dispatched', 'delivered', 'cancelled'
    created_at TIMESTAMPTZ DEFAULT timezone('utc'::text, now()) NOT NULL
);

-- 2. NEWSLETTER SUBSCRIBERS TABLE
CREATE TABLE IF NOT EXISTS public.newsletter_subscribers (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    email TEXT UNIQUE NOT NULL,
    subscribed_at TIMESTAMPTZ DEFAULT timezone('utc'::text, now()) NOT NULL
);

-- 3. CUSTOMER INQUIRIES & WHATSAPP LOGS
CREATE TABLE IF NOT EXISTS public.inquiries (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    customer_name TEXT,
    phone TEXT,
    message TEXT,
    created_at TIMESTAMPTZ DEFAULT timezone('utc'::text, now()) NOT NULL
);

-- ========================================================
-- ROW LEVEL SECURITY (RLS) POLICIES
-- These policies allow your website visitors to submit orders
-- and subscribe using your publishable anon key.
-- ========================================================

-- Enable Row Level Security on all tables
ALTER TABLE public.orders ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.newsletter_subscribers ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.inquiries ENABLE ROW LEVEL SECURITY;

-- Drop existing policies if any to prevent duplicates
DROP POLICY IF EXISTS "Allow public insert on orders" ON public.orders;
DROP POLICY IF EXISTS "Allow public select on orders" ON public.orders;
DROP POLICY IF EXISTS "Allow public insert on newsletter" ON public.newsletter_subscribers;
DROP POLICY IF EXISTS "Allow public insert on inquiries" ON public.inquiries;

-- Policy 1: Allow any customer to create/place an order
CREATE POLICY "Allow public insert on orders" 
ON public.orders 
FOR INSERT 
TO anon, authenticated 
WITH CHECK (true);

-- Policy 2: Allow customers to view orders (e.g. order tracking)
CREATE POLICY "Allow public select on orders" 
ON public.orders 
FOR SELECT 
TO anon, authenticated 
USING (true);

-- Policy 3: Allow customers to join VIP newsletter
CREATE POLICY "Allow public insert on newsletter" 
ON public.newsletter_subscribers 
FOR INSERT 
TO anon, authenticated 
WITH CHECK (true);

-- Policy 4: Allow inquiries
CREATE POLICY "Allow public insert on inquiries" 
ON public.inquiries 
FOR INSERT 
TO anon, authenticated 
WITH CHECK (true);

-- ========================================================
-- HELPFUL INDEXES FOR HIGH-SPEED QUERIES
-- ========================================================
CREATE INDEX IF NOT EXISTS idx_orders_order_number ON public.orders(order_number);
CREATE INDEX IF NOT EXISTS idx_orders_phone ON public.orders(phone);
CREATE INDEX IF NOT EXISTS idx_orders_city ON public.orders(city);
CREATE INDEX IF NOT EXISTS idx_orders_created_at ON public.orders(created_at DESC);
