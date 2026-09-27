-- ========================================================
-- LEGACY (EST. 2026) - PRODUCTS TABLE & ALL 47 PRODUCTS SEED
-- Run this SQL in your Supabase SQL Editor:
-- https://supabase.com/dashboard/project/vuquknseojgxeluplwcr/sql/new
-- ========================================================

-- 1. CREATE PRODUCTS TABLE
CREATE TABLE IF NOT EXISTS public.products (
    id TEXT PRIMARY KEY DEFAULT ('leg-' || substr(md5(random()::text), 1, 8)),
    name TEXT NOT NULL,
    brand TEXT DEFAULT 'LEGACY',
    gender TEXT NOT NULL, -- men, women, juniors
    category TEXT NOT NULL,
    sub_category TEXT,
    price NUMERIC NOT NULL,
    original_price NUMERIC,
    tag TEXT DEFAULT 'LEGACY ATELIER',
    rating NUMERIC DEFAULT 5.0,
    reviews_count INT DEFAULT 1,
    image TEXT NOT NULL,
    secondary_image TEXT,
    colors JSONB DEFAULT '[]'::jsonb,
    sizes JSONB DEFAULT '["S", "M", "L", "XL"]'::jsonb,
    description TEXT,
    features JSONB DEFAULT '[]'::jsonb,
    in_stock BOOLEAN DEFAULT true,
    created_at TIMESTAMPTZ DEFAULT timezone('utc'::text, now()) NOT NULL
);

-- 2. ROW LEVEL SECURITY (RLS) POLICIES
ALTER TABLE public.products ENABLE ROW LEVEL SECURITY;

DROP POLICY IF EXISTS "Allow public read on products" ON public.products;
DROP POLICY IF EXISTS "Allow public insert on products" ON public.products;
DROP POLICY IF EXISTS "Allow public update on products" ON public.products;
DROP POLICY IF EXISTS "Allow public delete on products" ON public.products;

CREATE POLICY "Allow public read on products" ON public.products FOR SELECT USING (true);
CREATE POLICY "Allow public insert on products" ON public.products FOR INSERT WITH CHECK (true);
CREATE POLICY "Allow public update on products" ON public.products FOR UPDATE USING (true);
CREATE POLICY "Allow public delete on products" ON public.products FOR DELETE USING (true);

-- 3. INSERT ALL 47 CURRENT PRODUCTS
INSERT INTO public.products (id, name, brand, gender, category, sub_category, price, original_price, tag, rating, reviews_count, image, secondary_image, colors, sizes, description, features, in_stock)
VALUES ('leg-jun-01', 'Junior Relaxed Linen Camp Shirt & Baggy Denim Set', 'LEGACY JUNIORS', 'juniors', 'tops', 'shirts', 3690, 4600, 'EDITORIAL FLAGSHIP', 5, 128, './images/junior_boy_resort_streetwear.png', './images/junior_boy_resort_streetwear.png', '[{"name":"Optic White & Bleached Denim","code":"#f0f2f5"}]'::jsonb, '["3-4Y","5-6Y","7-8Y","9-10Y","11-12Y"]'::jsonb, 'Flagship Juniors runway set featuring a breathable Cuban camp-collar button-down shirt paired with architectural loose-fit light wash denim pants. Comfortable all-day luxury streetwear for young trendsetters.', '["100% Breathable Organic Cotton","Relaxed Cuban spread collar","Elastic-back adjustable waistband","Pre-washed buttery soft handfeel"]'::jsonb, true)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  original_price = EXCLUDED.original_price,
  image = EXCLUDED.image,
  secondary_image = EXCLUDED.secondary_image,
  description = EXCLUDED.description,
  colors = EXCLUDED.colors,
  sizes = EXCLUDED.sizes,
  features = EXCLUDED.features;

INSERT INTO public.products (id, name, brand, gender, category, sub_category, price, original_price, tag, rating, reviews_count, image, secondary_image, colors, sizes, description, features, in_stock)
VALUES ('leg-jun-02', 'Daisy Micro-Embroidered Baggy Wide-Leg Denim', 'LEGACY JUNIORS', 'juniors', 'denim', 'wideleg-pants', 3690, 4600, 'ATELIER DENIM', 4.9, 84, './images/junior_daisy_wideleg_jeans.png', './images/junior_daisy_wideleg_jeans.png', '[{"name":"Light Vintage Blue","code":"#8faec7"}]'::jsonb, '["3-4Y","5-6Y","7-8Y","9-10Y","11-12Y"]'::jsonb, 'Comfortable wide-leg fit jeans with delicate scattered daisy floral embroidery. Features a flexible elasticated waistband and durable pure cotton denim wash.', '["100% Ring-Spun Cotton Denim","Delicate floral contrast embroidery","Adjustable inner waist tab","Non-constricting relaxed wide leg"]'::jsonb, true)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  original_price = EXCLUDED.original_price,
  image = EXCLUDED.image,
  secondary_image = EXCLUDED.secondary_image,
  description = EXCLUDED.description,
  colors = EXCLUDED.colors,
  sizes = EXCLUDED.sizes,
  features = EXCLUDED.features;

INSERT INTO public.products (id, name, brand, gender, category, sub_category, price, original_price, tag, rating, reviews_count, image, secondary_image, colors, sizes, description, features, in_stock)
VALUES ('leg-jun-03', 'Cropped Ruffle-Sleeve Embellished Cherry Top', 'LEGACY JUNIORS', 'juniors', 'tops', 't-shirts', 2490, 3100, 'GIRLS TODDLER', 4.9, 67, './images/junior_cropped_cherry_tee.png', './images/junior_cropped_cherry_tee.png', '[{"name":"Pastel Mint","code":"#c2e2d2"}]'::jsonb, '["2-3Y","4-5Y","6-7Y","8-9Y"]'::jsonb, 'Sweet pastel mint cropped silhouette with subtle shoulder ruffles and embroidered cherry patch on chest. Soft combed cotton jersey.', '["100% Combed Cotton Jersey","Embroidered 3D cherry accent","Soft ruffle shoulder detailing","Hypoallergenic dyes"]'::jsonb, true)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  original_price = EXCLUDED.original_price,
  image = EXCLUDED.image,
  secondary_image = EXCLUDED.secondary_image,
  description = EXCLUDED.description,
  colors = EXCLUDED.colors,
  sizes = EXCLUDED.sizes,
  features = EXCLUDED.features;

INSERT INTO public.products (id, name, brand, gender, category, sub_category, price, original_price, tag, rating, reviews_count, image, secondary_image, colors, sizes, description, features, in_stock)
VALUES ('leg-jun-04', 'Polka-Dot ''Always Cute'' French Rib Long-Sleeve', 'LEGACY JUNIORS', 'juniors', 'tops', 't-shirts', 2490, 3100, 'TODDLER ATELIER', 4.8, 53, './images/junior_polka_dot_tee.png', './images/junior_polka_dot_tee.png', '[{"name":"Navy & Vanilla Dot","code":"#1b2838"}]'::jsonb, '["2-3Y","4-5Y","6-7Y","8-9Y"]'::jsonb, 'Deep navy long-sleeve tee with vintage cream polka-dot motif and coral script embroidery. Relaxed toddler fit with stretch collar.', '["Super-stretch cotton modal","Durable pigment-print dots","Contrast chain-stitched lettering","Ribbed comfort cuffs"]'::jsonb, true)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  original_price = EXCLUDED.original_price,
  image = EXCLUDED.image,
  secondary_image = EXCLUDED.secondary_image,
  description = EXCLUDED.description,
  colors = EXCLUDED.colors,
  sizes = EXCLUDED.sizes,
  features = EXCLUDED.features;

INSERT INTO public.products (id, name, brand, gender, category, sub_category, price, original_price, tag, rating, reviews_count, image, secondary_image, colors, sizes, description, features, in_stock)
VALUES ('leg-jun-05', 'Botanical Bouquet Embroidered French Terry Sweatshirt', 'LEGACY JUNIORS', 'juniors', 'tops', 'activewear', 2890, 3600, 'LUXURY FLEECE', 5, 72, './images/junior_mint_flower_sweatshirt.png', './images/junior_mint_flower_sweatshirt.png', '[{"name":"Sage Mint","code":"#b5d8c3"}]'::jsonb, '["3-4Y","5-6Y","7-8Y","9-10Y"]'::jsonb, 'Warm and cozy brushed French terry sweatshirt featuring a colorful embroidered ribbon-tied floral bouquet. Pre-shrunk for effortless laundering.', '["340 GSM Brushed French Terry","High-density multi-color floral embroidery","Ribbed hem and cuffs","Gentle skin-friendly interior"]'::jsonb, true)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  original_price = EXCLUDED.original_price,
  image = EXCLUDED.image,
  secondary_image = EXCLUDED.secondary_image,
  description = EXCLUDED.description,
  colors = EXCLUDED.colors,
  sizes = EXCLUDED.sizes,
  features = EXCLUDED.features;

INSERT INTO public.products (id, name, brand, gender, category, sub_category, price, original_price, tag, rating, reviews_count, image, secondary_image, colors, sizes, description, features, in_stock)
VALUES ('leg-jun-06', 'Drop-Shoulder Character Bunny Summer Boxy Tee', 'LEGACY JUNIORS', 'juniors', 'tops', 't-shirts', 2490, 3100, 'POP ATELIER', 4.9, 61, './images/junior_yellow_graphic_tee.png', './images/junior_yellow_graphic_tee.png', '[{"name":"Buttercup Yellow","code":"#f7d969"}]'::jsonb, '["2-3Y","4-5Y","6-7Y","8-9Y"]'::jsonb, 'Sunshine yellow relaxed boxy tee with cute knot-sleeve details and playful bunny graphic print. Lightweight summer staple.', '["100% Breathable Featherweight Cotton","Cute shoulder tie accents","Silk-screened soft feel graphic","Roomy boxy cut"]'::jsonb, true)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  original_price = EXCLUDED.original_price,
  image = EXCLUDED.image,
  secondary_image = EXCLUDED.secondary_image,
  description = EXCLUDED.description,
  colors = EXCLUDED.colors,
  sizes = EXCLUDED.sizes,
  features = EXCLUDED.features;

INSERT INTO public.products (id, name, brand, gender, category, sub_category, price, original_price, tag, rating, reviews_count, image, secondary_image, colors, sizes, description, features, in_stock)
VALUES ('leg-jun-07', 'Allover Blossom Embroidered Relaxed Wide-Leg Jeans', 'LEGACY JUNIORS', 'juniors', 'denim', 'wideleg-pants', 3690, 4600, 'ATELIER DENIM', 4.9, 95, './images/junior_floral_wideleg_jeans.png', './images/junior_floral_wideleg_jeans.png', '[{"name":"Sky Denim Floral","code":"#7ca2c4"}]'::jsonb, '["3-4Y","5-6Y","7-8Y","9-10Y","11-12Y"]'::jsonb, 'Medium indigo wide-leg jeans covered in hand-stitched style pink blossom embroidery. Soft enzyme washed for a gentle drape.', '["Pure Cotton Enzyme Washed Denim","Allover pink petal micro-embroidery","Relaxed fluid silhouette","Hidden buttonhole elastic adjustments"]'::jsonb, true)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  original_price = EXCLUDED.original_price,
  image = EXCLUDED.image,
  secondary_image = EXCLUDED.secondary_image,
  description = EXCLUDED.description,
  colors = EXCLUDED.colors,
  sizes = EXCLUDED.sizes,
  features = EXCLUDED.features;

INSERT INTO public.products (id, name, brand, gender, category, sub_category, price, original_price, tag, rating, reviews_count, image, secondary_image, colors, sizes, description, features, in_stock)
VALUES ('leg-jun-08', 'Pop Art Mascot Patch Relaxed Straight-Leg Denim', 'LEGACY JUNIORS', 'juniors', 'denim', 'wideleg-pants', 3690, 4600, 'STREETWEAR', 4.8, 77, './images/junior_patch_wideleg_jeans.png', './images/junior_patch_wideleg_jeans.png', '[{"name":"Classic Indigo","code":"#4c6b8b"}]'::jsonb, '["4-5Y","6-7Y","8-9Y","10-11Y","12-13Y"]'::jsonb, 'Authentic 5-pocket denim pants featuring an exclusive pop art mascot embroidery patch on the lower right leg.', '["Heavyweight 11oz durable cotton denim","Tactile embroidered graphic patch","Reinforced bar-tack stitching","Signature Legacy leather waistband patch"]'::jsonb, true)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  original_price = EXCLUDED.original_price,
  image = EXCLUDED.image,
  secondary_image = EXCLUDED.secondary_image,
  description = EXCLUDED.description,
  colors = EXCLUDED.colors,
  sizes = EXCLUDED.sizes,
  features = EXCLUDED.features;

INSERT INTO public.products (id, name, brand, gender, category, sub_category, price, original_price, tag, rating, reviews_count, image, secondary_image, colors, sizes, description, features, in_stock)
VALUES ('leg-jun-09', 'Botanical Bud All-Over Print Acid-Wash Baggy Jeans', 'LEGACY JUNIORS', 'juniors', 'denim', 'wideleg-pants', 3690, 4600, 'ARCHIVE DENIM', 4.9, 82, './images/junior_printed_baggy_jeans.png', './images/junior_printed_baggy_jeans.png', '[{"name":"Acid Cloud Blue","code":"#98b9d6"}]'::jsonb, '["4-5Y","6-7Y","8-9Y","10-11Y","12-13Y"]'::jsonb, 'Trend-forward acid wash light denim featuring an all-over floral rosebud pattern. Wide relaxed cut engineered for freedom of movement.', '["Subtle acid bleach wash","Precision all-over print","Comfort stretch waistband","Durable twin-needle construction"]'::jsonb, true)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  original_price = EXCLUDED.original_price,
  image = EXCLUDED.image,
  secondary_image = EXCLUDED.secondary_image,
  description = EXCLUDED.description,
  colors = EXCLUDED.colors,
  sizes = EXCLUDED.sizes,
  features = EXCLUDED.features;

INSERT INTO public.products (id, name, brand, gender, category, sub_category, price, original_price, tag, rating, reviews_count, image, secondary_image, colors, sizes, description, features, in_stock)
VALUES ('leg-jun-10', '''Snowy State Est. 1996'' Ribbed Crewneck Long-Sleeve', 'LEGACY JUNIORS', 'juniors', 'tops', 't-shirts', 2490, 3100, 'BOYS JUNIOR', 4.9, 89, './images/junior_snowy_state_longsleeve.png', './images/junior_snowy_state_longsleeve.png', '[{"name":"Ecru Cream & Sky Blue","code":"#f4f1ea"}]'::jsonb, '["6-7Y","8-9Y","10-11Y","12-13Y","14-15Y"]'::jsonb, 'Collegiate varsity style ecru long-sleeve tee featuring athletic ''SNOWY STATE'' typography and red varsity felt patch. Breathable cotton interlock.', '["100% Interlock Cotton Knit","Collegiate arch lettering & badge","Ribbed collar and cuffs","Fade-resistant pigment color"]'::jsonb, true)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  original_price = EXCLUDED.original_price,
  image = EXCLUDED.image,
  secondary_image = EXCLUDED.secondary_image,
  description = EXCLUDED.description,
  colors = EXCLUDED.colors,
  sizes = EXCLUDED.sizes,
  features = EXCLUDED.features;

INSERT INTO public.products (id, name, brand, gender, category, sub_category, price, original_price, tag, rating, reviews_count, image, secondary_image, colors, sizes, description, features, in_stock)
VALUES ('leg-jun-11', '''Snow Spirit'' Winter Expedition Graphic Long-Sleeve', 'LEGACY JUNIORS', 'juniors', 'tops', 't-shirts', 2490, 3100, 'BOYS JUNIOR', 4.8, 74, './images/junior_snow_spirit_longsleeve.png', './images/junior_snow_spirit_longsleeve.png', '[{"name":"Charcoal Slate","code":"#2d3136"}]'::jsonb, '["6-7Y","8-9Y","10-11Y","12-13Y","14-15Y"]'::jsonb, 'Deep charcoal long-sleeve graphic top with vibrant ski character illustration. Tough everyday wear with ultra-soft handfeel.', '["Durable heavy combed cotton","High-contrast silk-screen print","Reinforced neck binding","Easy machine washable"]'::jsonb, true)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  original_price = EXCLUDED.original_price,
  image = EXCLUDED.image,
  secondary_image = EXCLUDED.secondary_image,
  description = EXCLUDED.description,
  colors = EXCLUDED.colors,
  sizes = EXCLUDED.sizes,
  features = EXCLUDED.features;

INSERT INTO public.products (id, name, brand, gender, category, sub_category, price, original_price, tag, rating, reviews_count, image, secondary_image, colors, sizes, description, features, in_stock)
VALUES ('leg-jun-12', 'Hero Edition Spider-Man Graphic Heavyweight Long-Sleeve', 'LEGACY JUNIORS', 'juniors', 'tops', 't-shirts', 2690, 3350, 'HERO ARCHIVE', 5, 145, './images/junior_spiderman_graphic_longsleeve.png', './images/junior_spiderman_graphic_longsleeve.png', '[{"name":"Mocha Warm Brown","code":"#5d4e46"}]'::jsonb, '["6-7Y","8-9Y","10-11Y","12-13Y","14-15Y"]'::jsonb, 'Tonal earthy mocha crewneck long-sleeve featuring an iconic comic-art Spider-Man mask graphic print. Heavyweight 240 GSM combed jersey.', '["240 GSM Premium Combed Cotton","High-detail Spider-Man comic artwork","Ribbed cuffs for comfortable fit","Side seam red tab label"]'::jsonb, true)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  original_price = EXCLUDED.original_price,
  image = EXCLUDED.image,
  secondary_image = EXCLUDED.secondary_image,
  description = EXCLUDED.description,
  colors = EXCLUDED.colors,
  sizes = EXCLUDED.sizes,
  features = EXCLUDED.features;

INSERT INTO public.products (id, name, brand, gender, category, sub_category, price, original_price, tag, rating, reviews_count, image, secondary_image, colors, sizes, description, features, in_stock)
VALUES ('leg-jun-13', 'Minimalist Boxy Cut Combed Cotton Tee // DUSTY BLUE', 'LEGACY JUNIORS', 'juniors', 'tops', 't-shirts', 2190, 2750, 'ESSENTIAL ATELIER', 4.9, 110, './images/junior_minimal_steel_blue_tee.png', './images/junior_minimal_steel_blue_tee.png', '[{"name":"Dusty Steel Blue","code":"#4c6e8d"}]'::jsonb, '["6-7Y","8-9Y","10-11Y","12-13Y","14-15Y"]'::jsonb, 'Minimalist drop-shoulder boxy tee in signature dusty steel blue. Pairs seamlessly with wide-leg denim and cargo pants.', '["100% Combed Single-Jersey Cotton","Subtle micro-ribbed crew collar","Relaxed boxy silhouette","Anti-shrink pre-wash"]'::jsonb, true)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  original_price = EXCLUDED.original_price,
  image = EXCLUDED.image,
  secondary_image = EXCLUDED.secondary_image,
  description = EXCLUDED.description,
  colors = EXCLUDED.colors,
  sizes = EXCLUDED.sizes,
  features = EXCLUDED.features;

INSERT INTO public.products (id, name, brand, gender, category, sub_category, price, original_price, tag, rating, reviews_count, image, secondary_image, colors, sizes, description, features, in_stock)
VALUES ('leg-men-01', 'Milano Contrast-Tipped Fine-Gauge Knit Polo', 'LEGACY', 'men', 'knit-polos', 'polos', 2990, 3890, 'OLD MONEY ATELIER', 5, 94, './images/men_white_knit_tipped_polo.png', './images/men_white_knit_tipped_polo.png', '[{"name":"Pure White & Slate","code":"#f5f5f5"},{"name":"Obsidian Black","code":"#111111"}]'::jsonb, '["S","M","L","XL"]'::jsonb, 'Crafted from breathable 100% fine-gauge combed cotton. Features an open ribbed spread collar with architectural contrast tipping, paired with flared pleated dress trousers.', '["100% Combed Fine-Gauge Cotton Knit","Contrast micro-ribbed spread collar","Tailored fit with ribbed cuffs and hem","Anti-pilling luxury yarn"]'::jsonb, true)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  original_price = EXCLUDED.original_price,
  image = EXCLUDED.image,
  secondary_image = EXCLUDED.secondary_image,
  description = EXCLUDED.description,
  colors = EXCLUDED.colors,
  sizes = EXCLUDED.sizes,
  features = EXCLUDED.features;

INSERT INTO public.products (id, name, brand, gender, category, sub_category, price, original_price, tag, rating, reviews_count, image, secondary_image, colors, sizes, description, features, in_stock)
VALUES ('leg-men-02', 'Espresso Quarter-Zip Ribbed Knit Collar Polo', 'LEGACY', 'men', 'knit-polos', 'polos', 3290, 4290, 'LUXURY ATELIER', 5, 112, './images/men_espresso_halfzip_polo.png', './images/men_espresso_halfzip_polo_detail.png', '[{"name":"Rich Espresso Brown","code":"#38261e"},{"name":"Ivory Cream","code":"#f4f1ea"}]'::jsonb, '["S","M","L","XL"]'::jsonb, 'Indulgent micro-ribbed knit spun in deep espresso brown. Designed with a structured mock stand collar and concealed gunmetal quarter-zip that pairs effortlessly with tailored trousers.', '["High-density ribbed knit structure","Gunmetal matte finish half-zip pull","Stand mock collar for modern framing","Ultra-soft thermal breathable drape"]'::jsonb, true)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  original_price = EXCLUDED.original_price,
  image = EXCLUDED.image,
  secondary_image = EXCLUDED.secondary_image,
  description = EXCLUDED.description,
  colors = EXCLUDED.colors,
  sizes = EXCLUDED.sizes,
  features = EXCLUDED.features;

INSERT INTO public.products (id, name, brand, gender, category, sub_category, price, original_price, tag, rating, reviews_count, image, secondary_image, colors, sizes, description, features, in_stock)
VALUES ('leg-men-03', 'Artisanal Hand-Embroidered Daisy Resort Camp Shirt', 'LEGACY', 'men', 'resort-shirts', 'shirts', 2890, 3690, 'RESORT ATELIER', 4.9, 73, './images/men_embroidered_floral_resort.png', './images/men_embroidered_floral_resort.png', '[{"name":"Alabaster Ecru with Blue/Ochre","code":"#f0ede6"},{"name":"Raw Linen","code":"#e6e0d3"}]'::jsonb, '["S","M","L","XL","XXL"]'::jsonb, 'Bespoke textured cotton-linen blend camp-collar shirt. Adorned with tactile chain-stitched floral motifs across the chest panels with a relaxed boxy vacation drape.', '["Tactile Chain-Stitched Floral Artwork","Breathable Linen-Cotton Weave","Relaxed Cuban Camp Collar","Natural Horn Buttons"]'::jsonb, true)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  original_price = EXCLUDED.original_price,
  image = EXCLUDED.image,
  secondary_image = EXCLUDED.secondary_image,
  description = EXCLUDED.description,
  colors = EXCLUDED.colors,
  sizes = EXCLUDED.sizes,
  features = EXCLUDED.features;

INSERT INTO public.products (id, name, brand, gender, category, sub_category, price, original_price, tag, rating, reviews_count, image, secondary_image, colors, sizes, description, features, in_stock)
VALUES ('leg-men-04', 'Heavyweight Relaxed Atelier Tee & Pleated Tobacco Shorts Set', 'LEGACY', 'men', 'shorts', 'shorts', 2690, 3490, 'STREETWEAR CO-ORD', 4.8, 58, './images/men_oversized_tee_pleated_shorts.png', './images/men_oversized_tee_pleated_shorts.png', '[{"name":"Warm Buttercream & Tobacco","code":"#eae5d8"},{"name":"Monochrome Chalk","code":"#ffffff"}]'::jsonb, '["S","M","L","XL"]'::jsonb, 'Premium 280 GSM heavyweight cotton drop-shoulder boxy tee paired with structured double-pleated tobacco cotton twill wide-leg Bermuda shorts.', '["280 GSM Heavyweight Combed Cotton Tee","Forward Pleated Wide-Leg Bermuda Shorts","Seamless Dropped Shoulder Construction","Reinforced Deep Side Pockets"]'::jsonb, true)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  original_price = EXCLUDED.original_price,
  image = EXCLUDED.image,
  secondary_image = EXCLUDED.secondary_image,
  description = EXCLUDED.description,
  colors = EXCLUDED.colors,
  sizes = EXCLUDED.sizes,
  features = EXCLUDED.features;

INSERT INTO public.products (id, name, brand, gender, category, sub_category, price, original_price, tag, rating, reviews_count, image, secondary_image, colors, sizes, description, features, in_stock)
VALUES ('leg-denim-01', 'Relaxed Japanese Selvedge Denim Trousers by LEGACY', 'LEGACY', 'men', 'denim', 'jeans', 3990, 5290, 'LEGACY DENIM', 4.8, 76, './images/legacy_denim_trousers.jpg', './images/legacy_denim_trousers_detail.jpg', '[{"name":"Vintage Indigo","code":"#273a52"},{"name":"Raw Washed Blue","code":"#3a5677"},{"name":"Faded Stonewash","code":"#6c89a7"}]'::jsonb, '["30","32","34","36"]'::jsonb, 'Handcrafted from authentic 14.5oz Japanese selvedge denim. Designed with a generous wide-leg cut, subtle contrast white topstitching, and our debossed leather ''LEGACY'' archive patch.', '["14.5oz Japanese Selvedge Denim","Wide-leg relaxed puddle drape","Custom silver-toned hardware","Reinforced back pockets"]'::jsonb, true)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  original_price = EXCLUDED.original_price,
  image = EXCLUDED.image,
  secondary_image = EXCLUDED.secondary_image,
  description = EXCLUDED.description,
  colors = EXCLUDED.colors,
  sizes = EXCLUDED.sizes,
  features = EXCLUDED.features;

INSERT INTO public.products (id, name, brand, gender, category, sub_category, price, original_price, tag, rating, reviews_count, image, secondary_image, colors, sizes, description, features, in_stock)
VALUES ('leg-polo-01', 'Italian Textured Cable-Knit Open Collar Polo', 'LEGACY', 'men', 'knit-polos', 'polos', 2990, 3890, 'OLD MONEY LUXE', 5, 162, './images/legacy_cableknit_polo.jpg', './images/legacy_cableknit_polo_detail.jpg', '[{"name":"Warm Cashmere Beige","code":"#d8cbb8"},{"name":"Midnight Navy","code":"#1a2536"},{"name":"Raw Ecru","code":"#f4f1ea"}]'::jsonb, '["S","M","L","XL"]'::jsonb, 'The epitome of understated modern luxury. Knitted from ultra-soft fine-gauge cotton-cashmere blend yarn featuring tactile micro-cable braids and an open spread Johnny collar.', '["Ultra-fine Cotton-Cashmere Blend","Architectural micro-cable knit pattern","Relaxed open spread collar without buttons","Ribbed cuffs and hemband"]'::jsonb, true)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  original_price = EXCLUDED.original_price,
  image = EXCLUDED.image,
  secondary_image = EXCLUDED.secondary_image,
  description = EXCLUDED.description,
  colors = EXCLUDED.colors,
  sizes = EXCLUDED.sizes,
  features = EXCLUDED.features;

INSERT INTO public.products (id, name, brand, gender, category, sub_category, price, original_price, tag, rating, reviews_count, image, secondary_image, colors, sizes, description, features, in_stock)
VALUES ('leg-wide-01', 'Minimalist Double-Pleated Trousers // WIDE LEG FIT', 'LEGACY', 'men', 'wideleg-pants', 'trousers', 3490, 4690, 'WIDE LEG ATELIER', 4.9, 110, './images/legacy_pleated_wideleg.png', './images/legacy_pleated_wideleg_detail.jpg', '[{"name":"Chalk Cream","code":"#ece8df"},{"name":"Taupe Sand","code":"#b5a38f"},{"name":"Obsidian Black","code":"#111111"}]'::jsonb, '["30","32","34","36"]'::jsonb, 'The modern architectural wide-leg fit. Tailored with sharp forward double pleats, a clean waistband, and a relaxed fluid drape that pools perfectly over slides or sneakers.', '["Breathable High-Twist Cotton Gabardine","Forward architectural double pleats","Relaxed wide-leg puddle drape","Curved slash front pockets"]'::jsonb, true)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  original_price = EXCLUDED.original_price,
  image = EXCLUDED.image,
  secondary_image = EXCLUDED.secondary_image,
  description = EXCLUDED.description,
  colors = EXCLUDED.colors,
  sizes = EXCLUDED.sizes,
  features = EXCLUDED.features;

INSERT INTO public.products (id, name, brand, gender, category, sub_category, price, original_price, tag, rating, reviews_count, image, secondary_image, colors, sizes, description, features, in_stock)
VALUES ('leg-moto-01', 'LEGACY Motorsport Racing Streetwear Button-Up', 'LEGACY', 'men', 'motorsport', 'shirts', 2890, 3790, 'MOTORSPORT HERO', 5, 148, './images/legacy_motorsport_jersey_front.jpg', './images/legacy_motorsport_jersey_detail.jpg', '[{"name":"Monochrome Racing White/Black","code":"#111111"},{"name":"Stealth Charcoal","code":"#2e2e2e"}]'::jsonb, '["S","M","L","XL","XXL"]'::jsonb, 'Inspired by archival Grand Prix and Japanese drift culture. Breathable structured cotton-poly twill with high-contrast monochrome blocking, notch lapels, and high-density screen-printed ''LEGACY MOTORSPORT'' insignia.', '["Breathable Structured Cotton-Poly Twill","Monochrome High-Contrast Racing Graphics","Relaxed Boxy Camp Collar Fit","Reinforced Placket"]'::jsonb, true)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  original_price = EXCLUDED.original_price,
  image = EXCLUDED.image,
  secondary_image = EXCLUDED.secondary_image,
  description = EXCLUDED.description,
  colors = EXCLUDED.colors,
  sizes = EXCLUDED.sizes,
  features = EXCLUDED.features;

INSERT INTO public.products (id, name, brand, gender, category, sub_category, price, original_price, tag, rating, reviews_count, image, secondary_image, colors, sizes, description, features, in_stock)
VALUES ('leg-fem-01', 'Sheer Tie-Front Shirt & Pleated Wide-Leg Palazzo Set', 'LEGACY', 'women', 'wideleg-pants', 'trousers', 3990, 4990, 'ATELIER CO-ORD', 5, 48, './images/women_sheer_palazzo_set.png', './images/women_sheer_palazzo_set.png', '[{"name":"Pure Chalk White","code":"#fbfbf9"},{"name":"Midnight Noir","code":"#111111"}]'::jsonb, '["XS","S","M","L","XL"]'::jsonb, 'Crafted from airy, breathable semi-sheer cotton-voile. Features a chic tie-front collar with billowing dropped sleeves, paired with architectural double-pleated wide-leg palazzo trousers with fluid movement.', '["Airy semi-sheer premium cotton-voile","Flowing ultra wide-leg palazzo silhouette","Adjustable self-tie frontal closure","Elasticated comfort back waistband"]'::jsonb, true)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  original_price = EXCLUDED.original_price,
  image = EXCLUDED.image,
  secondary_image = EXCLUDED.secondary_image,
  description = EXCLUDED.description,
  colors = EXCLUDED.colors,
  sizes = EXCLUDED.sizes,
  features = EXCLUDED.features;

INSERT INTO public.products (id, name, brand, gender, category, sub_category, price, original_price, tag, rating, reviews_count, image, secondary_image, colors, sizes, description, features, in_stock)
VALUES ('leg-fem-02', 'Minimalist Atelier Sleeveless Column Midi Dress', 'LEGACY', 'women', 'resort-shirts', 'dresses', 3590, 4490, 'OLD MONEY RESORT', 4.9, 63, './images/women_minimal_atelier_dress.png', './images/women_minimal_atelier_dress.png', '[{"name":"Alabaster Ecru","code":"#f5f3ec"},{"name":"Caramel Brown","code":"#8a5738"}]'::jsonb, '["XS","S","M","L","XL"]'::jsonb, 'Sculpted sleeveless column silhouette with a soft gathered waistline and fluid midi-length drape. Tailored from premium dense woven crepe that resists creasing.', '["Crease-resistant luxury crepe fabric","Flattering gathered waist definition","Subtle concealed side zipper","Fluid A-line midi hemline"]'::jsonb, true)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  original_price = EXCLUDED.original_price,
  image = EXCLUDED.image,
  secondary_image = EXCLUDED.secondary_image,
  description = EXCLUDED.description,
  colors = EXCLUDED.colors,
  sizes = EXCLUDED.sizes,
  features = EXCLUDED.features;

INSERT INTO public.products (id, name, brand, gender, category, sub_category, price, original_price, tag, rating, reviews_count, image, secondary_image, colors, sizes, description, features, in_stock)
VALUES ('leg-fem-03', 'Tailored Monochrome Shacket & Double-Pleated Palazzo Trousers', 'LEGACY', 'women', 'wideleg-pants', 'trousers', 4290, 5390, 'CONTEMPORARY SUITING', 5, 82, './images/women_monochrome_trouser_set.png', './images/women_monochrome_trouser_set.png', '[{"name":"Obsidian Noir","code":"#18191a"},{"name":"Ivory White","code":"#f8f7f4"}]'::jsonb, '["XS","S","M","L","XL"]'::jsonb, 'A powerful modern minimalist ensemble featuring an oversized utility button-up shacket layered over tailored high-waisted double-pleated palazzo trousers.', '["High-twist poly-viscose drape suiting","Deep forward double pleats with fluid drop","Concealed horn buttons","Tailored deep side pockets"]'::jsonb, true)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  original_price = EXCLUDED.original_price,
  image = EXCLUDED.image,
  secondary_image = EXCLUDED.secondary_image,
  description = EXCLUDED.description,
  colors = EXCLUDED.colors,
  sizes = EXCLUDED.sizes,
  features = EXCLUDED.features;

INSERT INTO public.products (id, name, brand, gender, category, sub_category, price, original_price, tag, rating, reviews_count, image, secondary_image, colors, sizes, description, features, in_stock)
VALUES ('leg-fem-04', 'Double-Breasted Relaxed Resort Blazer Shirt // BLUSH CORAL', 'LEGACY', 'women', 'shirts', 'shirts', 2990, 3750, 'SUMMER ATELIER', 4.8, 39, './images/women_blush_resort_blazer.png', './images/women_blush_resort_blazer.png', '[{"name":"Blush Coral Rose","code":"#f2bcbb"},{"name":"Cream White","code":"#fbfbf7"}]'::jsonb, '["XS","S","M","L","XL"]'::jsonb, 'Sophisticated camp-collar double-breasted shirt cut in an airy crinkle textured weave. Features rolled cuffed short sleeves and tonal horn buttons.', '["Crinkle textured lightweight weave","Double-breasted lapel styling","Cuffed short sleeves with relaxed drop","Side split hem for easy styling"]'::jsonb, true)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  original_price = EXCLUDED.original_price,
  image = EXCLUDED.image,
  secondary_image = EXCLUDED.secondary_image,
  description = EXCLUDED.description,
  colors = EXCLUDED.colors,
  sizes = EXCLUDED.sizes,
  features = EXCLUDED.features;

INSERT INTO public.products (id, name, brand, gender, category, sub_category, price, original_price, tag, rating, reviews_count, image, secondary_image, colors, sizes, description, features, in_stock)
VALUES ('leg-fem-05', 'Bohemian Ruffled High-Slit Duster Tunic & Fluid Trouser Set', 'LEGACY', 'women', 'wideleg-pants', 'trousers', 3790, 4750, 'RESORT CO-ORD', 4.9, 51, './images/women_ruffled_tunic_palazzo.png', './images/women_ruffled_tunic_palazzo.png', '[{"name":"Cotton White & Olive","code":"#4a4939"},{"name":"All White","code":"#ffffff"}]'::jsonb, '["XS","S","M","L","XL"]'::jsonb, 'An ethereal two-piece silhouette featuring a romantic ruffle-trimmed high-slit tunic overlay paired with pooling olive brown wide-leg palazzo trousers.', '["Delicate micro-ruffle placket detail","Dramatic center-front high slit","Full-length pooling wide-leg pants","Soft breathable natural cotton lawn"]'::jsonb, true)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  original_price = EXCLUDED.original_price,
  image = EXCLUDED.image,
  secondary_image = EXCLUDED.secondary_image,
  description = EXCLUDED.description,
  colors = EXCLUDED.colors,
  sizes = EXCLUDED.sizes,
  features = EXCLUDED.features;

INSERT INTO public.products (id, name, brand, gender, category, sub_category, price, original_price, tag, rating, reviews_count, image, secondary_image, colors, sizes, description, features, in_stock)
VALUES ('leg-gurk-01', 'Double-Buckle Gurkha Trousers // SMART FIT', 'LEGACY', 'men', 'gurkha-pants', 'trousers', 3790, 4990, 'GURKHA SIGNATURE', 5, 167, './images/legacy_gurkha_smartfit.png', './images/legacy_gurkha_smartfit_detail.jpg', '[{"name":"Off-White Sand","code":"#ece7de"},{"name":"Military Olive","code":"#4c553d"},{"name":"Formal Black","code":"#181818"}]'::jsonb, '["30","32","34","36"]'::jsonb, 'The definitive Sartorial icon. Built with an extended wrap waistband, dual side-buckle brass adjusters, and deep forward double pleats. Eliminates the need for a belt while delivering a flattering high-waisted tailored taper.', '["Double-buckle adjustable side tabs (no belt required)","Extended waistband with hook & bar closure","Deep architectural forward double pleats","100% High-Twist Cotton Gabardine"]'::jsonb, true)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  original_price = EXCLUDED.original_price,
  image = EXCLUDED.image,
  secondary_image = EXCLUDED.secondary_image,
  description = EXCLUDED.description,
  colors = EXCLUDED.colors,
  sizes = EXCLUDED.sizes,
  features = EXCLUDED.features;

INSERT INTO public.products (id, name, brand, gender, category, sub_category, price, original_price, tag, rating, reviews_count, image, secondary_image, colors, sizes, description, features, in_stock)
VALUES ('leg-shkt-01', 'FW26 Heavy Plaid Flannel Overshirt (Shacket)', 'LEGACY', 'men', 'shirts', 'shirts', 3490, 4490, 'CAMPAIGN HERO', 4.9, 114, './images/hero_slide_1.jpg', './images/hero_slide_1_detail.jpg', '[{"name":"Cobalt & Cream Plaid","code":"#2e4868"},{"name":"Forest Shadow Plaid","code":"#2b3b2f"}]'::jsonb, '["S","M","L","XL"]'::jsonb, 'Featured in our FW 2026-2027 lookbook. Heavyweight brushed wool-cotton blend crafted for transitional layering with twin flap chest pockets and genuine horn buttons.', '["Brushed heavy wool blend","Dual chest flap pockets","Relaxed layering cut","Satin-lined yoke"]'::jsonb, true)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  original_price = EXCLUDED.original_price,
  image = EXCLUDED.image,
  secondary_image = EXCLUDED.secondary_image,
  description = EXCLUDED.description,
  colors = EXCLUDED.colors,
  sizes = EXCLUDED.sizes,
  features = EXCLUDED.features;

INSERT INTO public.products (id, name, brand, gender, category, sub_category, price, original_price, tag, rating, reviews_count, image, secondary_image, colors, sizes, description, features, in_stock)
VALUES ('leg-moto-editorial', 'LEGACY Grand Prix Racing Studio Editorial Button-Up', 'LEGACY', 'men', 'motorsport', 'shirts', 2890, 3690, 'STUDIO EDITORIAL', 5, 134, './images/legacy_motorsport_jersey.jpg', './images/legacy_motorsport_jersey_detail.jpg', '[{"name":"Monochrome Grand Prix","code":"#111111"},{"name":"Speedway Charcoal","code":"#282828"}]'::jsonb, '["S","M","L","XL","XXL"]'::jsonb, 'Official studio campaign lookbook edition. Technical aero-mesh button-up with bold high-contrast VIKINGS racing crest and drop-shoulder streetwear cut. Photographed in minimalist brutalist studio setting.', '["Aero-mesh breathable construction","High-contrast Grand Prix graphics","Relaxed camp collar silhouette","Studio runway archive piece"]'::jsonb, true)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  original_price = EXCLUDED.original_price,
  image = EXCLUDED.image,
  secondary_image = EXCLUDED.secondary_image,
  description = EXCLUDED.description,
  colors = EXCLUDED.colors,
  sizes = EXCLUDED.sizes,
  features = EXCLUDED.features;

INSERT INTO public.products (id, name, brand, gender, category, sub_category, price, original_price, tag, rating, reviews_count, image, secondary_image, colors, sizes, description, features, in_stock)
VALUES ('leg-air-01', 'Airflex 4-Way Stretch Chino Pants // REGULAR FIT', 'LEGACY', 'men', 'airflex-pants', 'trousers', 3190, 4190, 'PERFORMANCE ESSENTIAL', 4.9, 184, './images/legacy_airflex_pants.png', './images/legacy_airflex_pants_detail.jpg', '[{"name":"Khaki Stone","code":"#c9bda8"},{"name":"Midnight Navy","code":"#1e293b"},{"name":"Asphalt Grey","code":"#3a3d42"}]'::jsonb, '["30","32","34","36","38"]'::jsonb, 'Engineered for total freedom of motion. Proprietary Airflex fabric blends combed long-staple cotton with 4-way technical elastane. Maintains crisp trousers structure from office meetings to evening lounges.', '["Proprietary Airflex 4-Way Stretch recovery","Wrinkle-resistant & breathable technical weave","Hidden zippered security travel pocket","Tailored regular fit through thigh and leg"]'::jsonb, true)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  original_price = EXCLUDED.original_price,
  image = EXCLUDED.image,
  secondary_image = EXCLUDED.secondary_image,
  description = EXCLUDED.description,
  colors = EXCLUDED.colors,
  sizes = EXCLUDED.sizes,
  features = EXCLUDED.features;

INSERT INTO public.products (id, name, brand, gender, category, sub_category, price, original_price, tag, rating, reviews_count, image, secondary_image, colors, sizes, description, features, in_stock)
VALUES ('leg-resort-01', 'Monochrome Botanical Floral Camp-Collar Shirt', 'LEGACY', 'men', 'resort-shirts', 'shirts', 2790, 3590, 'RESORT COLLECTION', 4.9, 132, './images/legacy_floral_resort_shirt.jpg', './images/legacy_floral_resort_shirt_detail.jpg', '[{"name":"Bone White / Ink Floral","code":"#f5f3ef"},{"name":"Shadow Sage","code":"#6c8068"}]'::jsonb, '["S","M","L","XL"]'::jsonb, 'Effortless vacation elegance. Lightweight airy rayon-linen blend featuring painterly monochrome black watercolor florals cascading along the lower hemline with a relaxed Cuban camp collar.', '["Ultra-soft breathable Rayon-Linen Blend","Artisanal monochrome floral placement print","Relaxed Cuban spread collar","Straight-cut hem with side vents"]'::jsonb, true)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  original_price = EXCLUDED.original_price,
  image = EXCLUDED.image,
  secondary_image = EXCLUDED.secondary_image,
  description = EXCLUDED.description,
  colors = EXCLUDED.colors,
  sizes = EXCLUDED.sizes,
  features = EXCLUDED.features;

INSERT INTO public.products (id, name, brand, gender, category, sub_category, price, original_price, tag, rating, reviews_count, image, secondary_image, colors, sizes, description, features, in_stock)
VALUES ('leg-polo-02', 'Minimalist Ribbed Knit Johnny Collar Polo', 'LEGACY', 'men', 'knit-polos', 'polos', 2490, 3190, 'SUMMER ESSENTIAL', 4.8, 98, './images/hero_slide_detail.jpg', './images/legacy_cableknit_polo_detail.jpg', '[{"name":"Espresso Charcoal","code":"#2e2b2a"},{"name":"Oatmeal Melange","code":"#cfc8bc"}]'::jsonb, '["S","M","L","XL"]'::jsonb, 'Knitted from long-staple organic cotton in a tactile vertical rib. Tailored with a modern relaxed Johnny collar and mother-of-pearl buttons.', '["100% Organic Long-Staple Cotton","Vertical micro-rib structure","Open Johnny spread collar","Ribbed cuff and hem"]'::jsonb, true)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  original_price = EXCLUDED.original_price,
  image = EXCLUDED.image,
  secondary_image = EXCLUDED.secondary_image,
  description = EXCLUDED.description,
  colors = EXCLUDED.colors,
  sizes = EXCLUDED.sizes,
  features = EXCLUDED.features;

INSERT INTO public.products (id, name, brand, gender, category, sub_category, price, original_price, tag, rating, reviews_count, image, secondary_image, colors, sizes, description, features, in_stock)
VALUES ('leg-gurk-02', 'Tailored Double-Buckle Gurkha Trousers in Olive', 'LEGACY', 'men', 'gurkha-pants', 'trousers', 3690, 4790, 'MILITARY ATELIER', 4.9, 95, './images/hero_slide_3.jpg', './images/legacy_gurkha_smartfit_detail.jpg', '[{"name":"Olive Drab","code":"#4c553d"},{"name":"Sand Beige","code":"#d9cbba"}]'::jsonb, '["30","32","34","36"]'::jsonb, 'Rich olive drab military gabardine cut with a sharp front crease, double waistband cinch buckles, and reinforced slash pockets.', '["High-rise military waistband","Dual adjustable cinch buckles","Reinforced slant pockets","Clean tailored cuff hem"]'::jsonb, true)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  original_price = EXCLUDED.original_price,
  image = EXCLUDED.image,
  secondary_image = EXCLUDED.secondary_image,
  description = EXCLUDED.description,
  colors = EXCLUDED.colors,
  sizes = EXCLUDED.sizes,
  features = EXCLUDED.features;

INSERT INTO public.products (id, name, brand, gender, category, sub_category, price, original_price, tag, rating, reviews_count, image, secondary_image, colors, sizes, description, features, in_stock)
VALUES ('leg-wide-02', 'Women''s Parachute Bungee Cargo Pants // SAGE GREEN', 'LEGACY', 'women', 'wideleg-pants', 'trousers', 2990, 3890, 'STREETWEAR TREND', 4.9, 154, './images/legacy_women_cargo_pants.jpg', './images/legacy_women_cargo_pants_detail.jpg', '[{"name":"Sage Earth Green","code":"#8fa38d"},{"name":"Gunmetal Slate","code":"#4a4c50"},{"name":"Obsidian Black","code":"#141414"}]'::jsonb, '["XS","S","M","L"]'::jsonb, 'Trending ultra-wide parachute pants with an adjustable toggle bungee cord at the waist and ankles. Converts effortlessly between dramatic balloon flare and tapered cargo jogger.', '["Featherlight crinkle tech ripstop fabric","Adjustable bungee toggle cords at waist and hem","Dual 3D accordion side cargo pockets","Water-repellent finish"]'::jsonb, true)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  original_price = EXCLUDED.original_price,
  image = EXCLUDED.image,
  secondary_image = EXCLUDED.secondary_image,
  description = EXCLUDED.description,
  colors = EXCLUDED.colors,
  sizes = EXCLUDED.sizes,
  features = EXCLUDED.features;

INSERT INTO public.products (id, name, brand, gender, category, sub_category, price, original_price, tag, rating, reviews_count, image, secondary_image, colors, sizes, description, features, in_stock)
VALUES ('leg-denim-02', 'Structured Denim Cropped Shacket & Utility Set', 'LEGACY', 'women', 'denim', 'shirts', 3890, 4990, 'SEASON PREVIEW FW 26-27', 5, 128, './images/hero_slide_2.jpg', './images/hero_slide_2_detail.jpg', '[{"name":"Midnight Indigo","code":"#1d293d"},{"name":"Bleached Ecru","code":"#e7e2d9"}]'::jsonb, '["XS","S","M","L"]'::jsonb, 'The headline piece of the FW26 Season Preview. A sculpted cropped denim jacket with military silver crest buttons, exposed contrast topstitching, and a sharp tailored collar.', '["Rigid 13.5oz Cotton Denim","Cropped silhouette with clean boxy hem","Functional silver-toned crest buttons","Pairable with matching utility cargos"]'::jsonb, true)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  original_price = EXCLUDED.original_price,
  image = EXCLUDED.image,
  secondary_image = EXCLUDED.secondary_image,
  description = EXCLUDED.description,
  colors = EXCLUDED.colors,
  sizes = EXCLUDED.sizes,
  features = EXCLUDED.features;

INSERT INTO public.products (id, name, brand, gender, category, sub_category, price, original_price, tag, rating, reviews_count, image, secondary_image, colors, sizes, description, features, in_stock)
VALUES ('leg-air-02', 'Airflex Dynamic Slim-Taper Performance Chino', 'LEGACY', 'men', 'airflex-pants', 'trousers', 3290, 4290, 'AIRFLEX SERIES', 5, 140, './images/legacy_airflex_pants.png', './images/legacy_airflex_pants_detail.jpg', '[{"name":"Olive Slate","code":"#4c5545"},{"name":"True Black","code":"#111111"}]'::jsonb, '["30","32","34","36"]'::jsonb, 'Water and stain-repellent finish on an ultra-flexible lightweight chino build. Elastic comfort waistband lining.', '["Stain & water repellent coating","4-way hyper-stretch recovery","Tapered ankle cut","Reinforced crotch gusset"]'::jsonb, true)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  original_price = EXCLUDED.original_price,
  image = EXCLUDED.image,
  secondary_image = EXCLUDED.secondary_image,
  description = EXCLUDED.description,
  colors = EXCLUDED.colors,
  sizes = EXCLUDED.sizes,
  features = EXCLUDED.features;

INSERT INTO public.products (id, name, brand, gender, category, sub_category, price, original_price, tag, rating, reviews_count, image, secondary_image, colors, sizes, description, features, in_stock)
VALUES ('leg-resort-03', 'Minimalist Textured Linen-Cotton Resort Shirt', 'LEGACY', 'men', 'resort-shirts', 'shirts', 2690, 3390, 'PURE LINEN', 4.9, 94, './images/legacy_floral_resort_shirt.jpg', './images/legacy_floral_resort_shirt_detail.jpg', '[{"name":"Oatmeal Sand","code":"#d9cbba"},{"name":"Sky Mist","code":"#c4d5e2"}]'::jsonb, '["S","M","L","XL"]'::jsonb, 'Slub textured natural linen blend that keeps you cool in Pakistani summers with an open neckline and fluid drape.', '["55% French Linen, 45% Combed Cotton","Relaxed short sleeves","Clean back pleat","Natural breathable weave"]'::jsonb, true)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  original_price = EXCLUDED.original_price,
  image = EXCLUDED.image,
  secondary_image = EXCLUDED.secondary_image,
  description = EXCLUDED.description,
  colors = EXCLUDED.colors,
  sizes = EXCLUDED.sizes,
  features = EXCLUDED.features;

INSERT INTO public.products (id, name, brand, gender, category, sub_category, price, original_price, tag, rating, reviews_count, image, secondary_image, colors, sizes, description, features, in_stock)
VALUES ('leg-polo-03', 'Open-Knit Pointelle Summer Resort Polo', 'LEGACY', 'men', 'knit-polos', 'polos', 2690, 3490, 'SUMMER KNIT', 4.9, 73, './images/legacy_cableknit_polo.jpg', './images/legacy_cableknit_polo_detail.jpg', '[{"name":"Alabaster Ecru","code":"#f0eee6"},{"name":"Olive Shadow","code":"#4c553d"}]'::jsonb, '["S","M","L","XL"]'::jsonb, 'Breathable open-stitch diamond knit structure that delivers maximum airflow while retaining high-fashion drape.', '["Open diamond knit gauge","Reinforced collar stand","Mother of pearl button closures","Dry-touch cool cotton yarn"]'::jsonb, true)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  original_price = EXCLUDED.original_price,
  image = EXCLUDED.image,
  secondary_image = EXCLUDED.secondary_image,
  description = EXCLUDED.description,
  colors = EXCLUDED.colors,
  sizes = EXCLUDED.sizes,
  features = EXCLUDED.features;

INSERT INTO public.products (id, name, brand, gender, category, sub_category, price, original_price, tag, rating, reviews_count, image, secondary_image, colors, sizes, description, features, in_stock)
VALUES ('leg-gurk-03', 'Women''s High-Waist Double-Buckle Gurkha Trousers', 'LEGACY', 'women', 'gurkha-pants', 'trousers', 3490, 4490, 'WOMEN''S TAILORING', 4.8, 62, './images/legacy_women_cropped_shirt.jpg', './images/legacy_pleated_wideleg_detail.jpg', '[{"name":"Cream Ecru","code":"#ece8df"},{"name":"Espresso Brown","code":"#382d24"}]'::jsonb, '["XS","S","M","L"]'::jsonb, 'Empowering contemporary silhouette with an ultra-flattering corseted double-buckle waistband and flowing pleated wide legs.', '["Waist-sculpting double buckle closure","Deep knife pleats","Italian fluid stretch-gabardine","Side seam pockets"]'::jsonb, true)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  original_price = EXCLUDED.original_price,
  image = EXCLUDED.image,
  secondary_image = EXCLUDED.secondary_image,
  description = EXCLUDED.description,
  colors = EXCLUDED.colors,
  sizes = EXCLUDED.sizes,
  features = EXCLUDED.features;

INSERT INTO public.products (id, name, brand, gender, category, sub_category, price, original_price, tag, rating, reviews_count, image, secondary_image, colors, sizes, description, features, in_stock)
VALUES ('leg-wide-03', 'Women''s High-Waist Tailored Pleated Wide-Leg Trousers', 'LEGACY', 'women', 'wideleg-pants', 'trousers', 3490, 4490, 'ATELIER TAILORING', 4.9, 87, './images/legacy_women_cropped_shirt.jpg', './images/legacy_pleated_wideleg_detail.jpg', '[{"name":"Sand Taupe","code":"#d5c5b2"},{"name":"Pitch Black","code":"#181818"}]'::jsonb, '["XS","S","M","L"]'::jsonb, 'Elegance redefined for women''s contemporary tailoring. High-rise sculpted waistband with sharp front double pleats and a fluid wide-leg puddle hem.', '["High-rise waist sculpting with inner canvas lining","Double front forward pleats","Fluid drape Italian gabardine","Side slant pockets"]'::jsonb, true)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  original_price = EXCLUDED.original_price,
  image = EXCLUDED.image,
  secondary_image = EXCLUDED.secondary_image,
  description = EXCLUDED.description,
  colors = EXCLUDED.colors,
  sizes = EXCLUDED.sizes,
  features = EXCLUDED.features;

INSERT INTO public.products (id, name, brand, gender, category, sub_category, price, original_price, tag, rating, reviews_count, image, secondary_image, colors, sizes, description, features, in_stock)
VALUES ('leg-denim-03', 'Women''s Vintage Wide-Leg Puddle Denim Trousers', 'LEGACY', 'women', 'denim', 'jeans', 3690, 4690, 'LEGACY DENIM', 4.9, 164, './images/hero_slide_2.jpg', './images/legacy_denim_trousers_detail.jpg', '[{"name":"Light Vintage Tint","code":"#8fa9c4"},{"name":"Medium Acid Wash","code":"#5d7897"}]'::jsonb, '["24","26","28","30","32"]'::jsonb, 'The ultimate IT-girl denim. Sits comfortably mid-waist and flows down into a dramatic puddle hem over platform sneakers or boots.', '["100% Non-stretch Sustainable Cotton","Ultra-wide leg puddle length","Distressed hem detail","Signature copper rivets"]'::jsonb, true)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  original_price = EXCLUDED.original_price,
  image = EXCLUDED.image,
  secondary_image = EXCLUDED.secondary_image,
  description = EXCLUDED.description,
  colors = EXCLUDED.colors,
  sizes = EXCLUDED.sizes,
  features = EXCLUDED.features;

INSERT INTO public.products (id, name, brand, gender, category, sub_category, price, original_price, tag, rating, reviews_count, image, secondary_image, colors, sizes, description, features, in_stock)
VALUES ('leg-denim-04', 'Juniors Relaxed Baggy Skate Denim Trousers', 'LEGACY', 'juniors', 'denim', 'jeans', 2490, 3290, 'JUNIORS DENIM', 4.9, 104, './images/juniors_skate_denim.jpg', './images/juniors_skate_denim_detail.jpg', '[{"name":"Vintage Mid Blue","code":"#3a577d"},{"name":"Faded Black","code":"#2e2e2e"}]'::jsonb, '["8-9Y","10-11Y","12-13Y","14-15Y"]'::jsonb, 'Authentic 90s baggy fit for junior streetwear enthusiasts. Adjustable internal waistband elastic ensures the perfect fit as they grow.', '["100% durable cotton denim","Internal adjustable buttonhole elastic","Wide skater leg opening","Bar-tacked stress points"]'::jsonb, true)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  original_price = EXCLUDED.original_price,
  image = EXCLUDED.image,
  secondary_image = EXCLUDED.secondary_image,
  description = EXCLUDED.description,
  colors = EXCLUDED.colors,
  sizes = EXCLUDED.sizes,
  features = EXCLUDED.features;

INSERT INTO public.products (id, name, brand, gender, category, sub_category, price, original_price, tag, rating, reviews_count, image, secondary_image, colors, sizes, description, features, in_stock)
VALUES ('leg-shkt-02', 'Women''s Boxy Cropped Poplin Button-Down Shirt', 'LEGACY', 'women', 'shirts', 'shirts', 2390, 2990, 'MINIMALIST LUXE', 4.9, 119, './images/legacy_women_cropped_shirt.jpg', './images/legacy_women_cropped_shirt_detail.jpg', '[{"name":"Crisp Oxford White","code":"#ffffff"},{"name":"Sky Blue Fine Stripe","code":"#b8d5e8"}]'::jsonb, '["XS","S","M","L"]'::jsonb, 'A tailored menswear staple cropped precisely at the natural waistline. Cut from 100% Egyptian cotton poplin with exaggerated French cuffs and a sharp structured collar.', '["100% Crisp Egyptian Cotton Poplin","Clean architectural cropped boxy hem","Exaggerated French cuffs with double buttons","Seamless front placket"]'::jsonb, true)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  original_price = EXCLUDED.original_price,
  image = EXCLUDED.image,
  secondary_image = EXCLUDED.secondary_image,
  description = EXCLUDED.description,
  colors = EXCLUDED.colors,
  sizes = EXCLUDED.sizes,
  features = EXCLUDED.features;

INSERT INTO public.products (id, name, brand, gender, category, sub_category, price, original_price, tag, rating, reviews_count, image, secondary_image, colors, sizes, description, features, in_stock)
VALUES ('leg-shrt-01', 'Tactical Bungee Nylon Cargo Shorts', 'LEGACY', 'men', 'shorts', 'shorts', 1890, 2490, 'STREETWEAR', 4.8, 89, './images/juniors_cargo_shorts.jpg', './images/juniors_cargo_shorts_detail.jpg', '[{"name":"Pitch Black","code":"#181818"},{"name":"Cement Grey","code":"#8c8e8c"}]'::jsonb, '["S","M","L","XL"]'::jsonb, 'Weather-resistant ripstop nylon utility shorts featuring 3D gusseted cargo pockets with magnetic closures and integrated webbing belt.', '["Water-repellent ripstop nylon","Magnetic pocket flaps","Elastic waistband with quick-release belt","Above-knee boxy fit"]'::jsonb, true)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  original_price = EXCLUDED.original_price,
  image = EXCLUDED.image,
  secondary_image = EXCLUDED.secondary_image,
  description = EXCLUDED.description,
  colors = EXCLUDED.colors,
  sizes = EXCLUDED.sizes,
  features = EXCLUDED.features;

INSERT INTO public.products (id, name, brand, gender, category, sub_category, price, original_price, tag, rating, reviews_count, image, secondary_image, colors, sizes, description, features, in_stock)
VALUES ('leg-shrt-02', 'Women''s Pleated Utility Micro Cargo Skort', 'LEGACY', 'women', 'shorts', 'shorts', 2190, 2890, 'TRENDING', 4.7, 74, './images/legacy_women_cargo_pants.jpg', './images/legacy_women_cargo_pants_detail.jpg', '[{"name":"Combat Khaki","code":"#78765b"},{"name":"Pitch Black","code":"#1c1c1c"}]'::jsonb, '["XS","S","M","L"]'::jsonb, 'Sharp knife pleats merged with tactical side cargo pockets. Features built-in stretch inner shorts for active confidence all day.', '["Integrated modesty inner shorts","Accordion cargo pockets with d-ring","Heavy cotton twill build","Side zip closure"]'::jsonb, true)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  original_price = EXCLUDED.original_price,
  image = EXCLUDED.image,
  secondary_image = EXCLUDED.secondary_image,
  description = EXCLUDED.description,
  colors = EXCLUDED.colors,
  sizes = EXCLUDED.sizes,
  features = EXCLUDED.features;

INSERT INTO public.products (id, name, brand, gender, category, sub_category, price, original_price, tag, rating, reviews_count, image, secondary_image, colors, sizes, description, features, in_stock)
VALUES ('leg-resort-02', 'LEGACY Summer Resort Camp Collar Shirt (Outdoor Edition)', 'LEGACY', 'men', 'resort-shirts', 'shirts', 2490, 3190, 'SUMMER STAPLE', 4.8, 79, './images/legacy_floral_resort_outdoor.jpg', './images/legacy_floral_resort_shirt_detail.jpg', '[{"name":"Crisp Chalk White","code":"#fafafa"},{"name":"Ink Black Floral","code":"#181818"}]'::jsonb, '["S","M","L","XL"]'::jsonb, 'Official outdoor lookbook series. Breathable Italian linen-cotton poplin with hand-painted botanical watercolor florals and relaxed summer sleeves.', '["100% Breathable Poplin Cotton","Camp spread collar","Side seam slits","Mother of pearl finish buttons"]'::jsonb, true)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  original_price = EXCLUDED.original_price,
  image = EXCLUDED.image,
  secondary_image = EXCLUDED.secondary_image,
  description = EXCLUDED.description,
  colors = EXCLUDED.colors,
  sizes = EXCLUDED.sizes,
  features = EXCLUDED.features;

INSERT INTO public.products (id, name, brand, gender, category, sub_category, price, original_price, tag, rating, reviews_count, image, secondary_image, colors, sizes, description, features, in_stock)
VALUES ('leg-moto-02', 'LEGACY Grand Prix Racing Lookbook Shirt (Turf Edition)', 'LEGACY', 'men', 'motorsport', 'shirts', 2690, 3490, 'RACING SERIES', 4.9, 86, './images/legacy_motorsport_turf.jpg', './images/legacy_motorsport_jersey_detail.jpg', '[{"name":"Asphalt Black","code":"#181818"},{"name":"Speedway White","code":"#ffffff"}]'::jsonb, '["S","M","L","XL"]'::jsonb, 'Official lookbook campaign edition. Ventilated technical aero-mesh button-up with bold VIKINGS racing crest and drop-shoulder streetwear cut.', '["Aero-mesh moisture control","Sublimated non-fade racing graphics","Relaxed camp collar silhouette","Pre-shrunk wash"]'::jsonb, true)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  original_price = EXCLUDED.original_price,
  image = EXCLUDED.image,
  secondary_image = EXCLUDED.secondary_image,
  description = EXCLUDED.description,
  colors = EXCLUDED.colors,
  sizes = EXCLUDED.sizes,
  features = EXCLUDED.features;

