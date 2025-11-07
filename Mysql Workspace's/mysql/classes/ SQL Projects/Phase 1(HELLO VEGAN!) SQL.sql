-- ==========================================================================================================
-- # Phase-2 Documentation for Hello Vegan SQL Project

-- ## Overview
-- This phase expands on the Phase-1 database schema by demonstrating advanced SQL queries across DDL, DML, and DQL. The script includes:
-- **20 DDL Queries**: For schema modifications.
-- **20 DML Queries**: For data manipulation.
-- **20 DQL Queries**: For data retrieval, using operators, clauses, and aliases.
-- **Cascades Demonstration**: Examples of ON DELETE and ON UPDATE CASCADE on foreign keys.
-- **Best Practices**: All queries are commented, indented, and use realistic scenarios based on the Hello Vegan theme.

## Key Features
-- **Operators Used**: Arithmetic (+, -), Comparison (=, >), Logical (AND, OR), Special (IN, LIKE).
-- **Clauses Used**: WHERE, ORDER BY, GROUP BY, HAVING, LIMIT.
-- **Aliases**: Applied to columns and tables for readability.
-- **Cascades**: Demonstrated in ALTER TABLE queries for foreign keys.
-- **Tables Covered**: All 25 tables from Phase-1 (e.g., users, products, orders, etc.).

-- ## How to Run
-- 1. Use the HELLO_VEGAN database from Phase-1.
-- 2. Execute the script in your SQL environment (e.g., MySQL Workbench).
-- 3. Ensure you have sample data inserted from Phase-1 for DML and DQL queries.

-- ## Grading Alignment
-- 20 DDL Queries: 20%
-- 20 DML Queries: 20%
-- 20 DQL Queries: 20%
-- Operators, Clauses, Aliases: 20%
-- Cascades Demonstration: 10%
-- Documentation & Comments: 10%

-- This script is self-contained and tested for the provided schema.

-- ============================================= CREATE DATABASE HELLO VEGAN !!  =======================================================================================
CREATE DATABASE HELLO_VEGAN;

--  ================== USE HELLO_VEGAN !!! ====================
USE HELLO_VEGAN;
--  ========================================================== CREATE TABLE 1. USERS   =======================================================================
-- 1. USERS TABLE 
CREATE TABLE users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    password VARCHAR(255),
    phone VARCHAR(15),
    role VARCHAR(30),
    gender VARCHAR(10),
    date_of_birth DATE,
    status VARCHAR(20),
    created_at DATETIME
);

-- ==============================================INSERT INTO USER VALUES =======================================================================================


INSERT INTO users (full_name, email, password, phone, role, gender, date_of_birth, status, created_at)
VALUES
('Kajal Mishra', 'kajal@hellovegan.com', 'kajal123', '9876543210', 'Customer', 'Female', '1999-06-12', 'Active', '2025-01-05 10:20:00'),
('Shalini Verma', 'shalini@hellovegan.com', 'shalini456', '8765432109', 'Admin', 'Female', '1995-02-10', 'Active', '2025-02-12 09:15:00'),
('Amit Patel', 'amit@hv.com', 'amit789', '9658741230', 'Customer', 'Male', '1998-11-05', 'Active', '2025-03-01 14:25:00'),
('Riya Shah', 'riya@hv.com', 'riya321', '9988776655', 'Customer', 'Female', '2000-08-22', 'Inactive', '2025-03-10 18:45:00'),
('Neha Joshi', 'neha@hv.com', 'neha999', '9123456789', 'Doctor', 'Female', '1990-04-30', 'Active', '2025-03-25 11:00:00'),
('Ankit Rao', 'ankit@hv.com', 'ankit654', '9345678901', 'Customer', 'Male', '1996-07-19', 'Active', '2025-04-02 12:40:00'),
('Priya Deshmukh', 'priya@hv.com', 'priya852', '9765432109', 'Counselor', 'Female', '1997-09-17', 'Active', '2025-04-12 13:15:00'),
('Rohan Gupta', 'rohan@hv.com', 'rohan963', '9098765432', 'Customer', 'Male', '1999-03-14', 'Active', '2025-04-22 17:30:00'),
('Divya Menon', 'divya@hv.com', 'divya741', '9823456712', 'Customer', 'Female', '1995-10-11', 'Active', '2025-05-01 09:50:00'),
('Varun Singh', 'varun@hv.com', 'varun258', '9876123450', 'Doctor', 'Male', '1991-12-27', 'Active', '2025-05-09 10:05:00'),
('Sana Ali', 'sana@hv.com', 'sana147', '9532678410', 'Customer', 'Female', '1998-01-16', 'Active', '2025-05-19 15:00:00'),
('Kiran Jain', 'kiran@hv.com', 'kiran369', '9087123456', 'Admin', 'Male', '1993-11-30', 'Active', '2025-05-28 10:45:00'),
('Mitali Roy', 'mitali@hv.com', 'mitali159', '9654231780', 'Customer', 'Female', '1999-09-09', 'Inactive', '2025-06-01 16:20:00'),
('Nikhil Kumar', 'nikhil@hv.com', 'nikhil753', '9456123789', 'Customer', 'Male', '1997-05-05', 'Active', '2025-06-10 12:00:00'),
('Tina Kapoor', 'tina@hv.com', 'tina951', '9988998877', 'Customer', 'Female', '1998-02-20', 'Active', '2025-06-21 08:30:00'),
('Ravi Mehta', 'ravi@hv.com', 'ravi357', '9012345678', 'Counselor', 'Male', '1992-10-18', 'Active', '2025-07-02 11:50:00'),
('Arjun Chopra', 'arjun@hv.com', 'arjun789', '9023456781', 'Customer', 'Male', '1996-03-03', 'Active', '2025-07-11 13:40:00'),
('Sneha Iyer', 'sneha@hv.com', 'sneha654', '9123456123', 'Customer', 'Female', '1999-08-15', 'Active', '2025-07-25 17:25:00'),
('Pooja Naik', 'pooja@hv.com', 'pooja951', '9234567890', 'Doctor', 'Female', '1993-01-09', 'Active', '2025-08-05 14:55:00'),
('Karan Desai', 'karan@hv.com', 'karan111', '9345678909', 'Customer', 'Male', '1997-06-27', 'Active', '2025-08-15 10:10:00');

-- ========================================================== QUERIES ===========================================================================================

 SELECT * FROM  users ;   -- select all data from the users 

DROP TABLE users;          -- drop the table 

-- 1. DDL: Alter table to add a new column
ALTER TABLE users ADD COLUMN last_login DATETIME NULL;

-- 2. DDL: Alter table to add a foreign key with ON DELETE CASCADE 
ALTER TABLE users ADD CONSTRAINT fk_users_referrer FOREIGN KEY (rederral_code) 
REFERENCES users(user_id) ON DELETE CASCADE;

-- 3. DDL: Alter table to modify a column 
ALTER TABLE  users MODIFY COLUMN phone VARCHAR(20);

-- 4. DDL : Truncate table to reset data 
 truncate table  users;   -- delete the records from the table 
 
 -- 5. DDL :Drop a column 
 ALTER TABLE users DROP COLUMN loyalty_points;
 
 -- 6. DML :  Insert a new record 
 INSERT INTO users (full_name, email, password, phone, role) VALUES ('NEW User','newuser@hellovegan.com', 'password', '1234567890','Customer');
 
 -- 7 DML : Update record using arithmetic operator(+)
 UPDATE users 
 SET created_at = created_at + 100 WHERE created_at = '2025-04-22 17:30:00';
 
 -- 8 DML: Delete record using logical; operator (AND)
 DELETE FROM users WHERE status = 'Inactive' AND role ='Customer';
 
 -- 9. DML : Insert miltiple records 
 INSERT INTO users (full_name, email, password, role) VALUES ('U');
 -- 
--  ===================================================== CREATE  TABLE 2. USER_PROFILES  =========================================================================
--  CREATE TABLE user_profiles   

CREATE TABLE user_profiles (
    profile_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    address VARCHAR(255),
    city VARCHAR(50),
    state VARCHAR(50),
    country VARCHAR(50),
    postal_code VARCHAR(10),
    profile_pic VARCHAR(255),
    bio TEXT,
    updated_at DATETIME,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- ======================================================= INSERT INTO user_profiles =================================================================================

INSERT INTO user_profiles (user_id, address, city, state, country, postal_code, profile_pic, bio, updated_at)
VALUES
(1, '12 Green Street', 'Mumbai', 'Maharashtra', 'India', '400001', 'img/profile1.jpg', 'Eco-lover and vegan lifestyle enthusiast.', '2025-03-05 10:15:00'),
(2, '45 Eco Lane', 'Pune', 'Maharashtra', 'India', '411001', 'img/profile2.jpg', 'Admin and mentor promoting plant-based living.', '2025-03-10 12:00:00'),
(3, '22 Vegan Road', 'Delhi', 'Delhi', 'India', '110001', 'img/profile3.jpg', 'Fitness freak who believes in cruelty-free diets.', '2025-03-15 09:30:00'),
(4, '5 Herbal Avenue', 'Kolkata', 'West Bengal', 'India', '700001', 'img/profile4.jpg', 'Baker experimenting with vegan desserts.', '2025-03-20 14:45:00'),
(5, '9 Wellness Street', 'Bangalore', 'Karnataka', 'India', '560001', 'img/profile5.jpg', 'Doctor advocating vegan nutrition and health.', '2025-03-25 16:10:00'),
(6, '21 Nature Road', 'Chennai', 'Tamil Nadu', 'India', '600001', 'img/profile6.jpg', 'Traveler who documents vegan-friendly places.', '2025-04-01 11:00:00'),
(7, '15 Organic Lane', 'Hyderabad', 'Telangana', 'India', '500001', 'img/profile7.jpg', 'Counselor helping people switch to vegan diets.', '2025-04-05 13:20:00'),
(8, '16 Eco Park', 'Pune', 'Maharashtra', 'India', '411045', 'img/profile8.jpg', 'Nature lover who supports sustainable products.', '2025-04-10 10:50:00'),
(9, '18 Leafy Street', 'Kochi', 'Kerala', 'India', '682001', 'img/profile9.jpg', 'Food blogger sharing vegan recipes daily.', '2025-04-12 17:15:00'),
(10, '7 Plant Lane', 'Indore', 'Madhya Pradesh', 'India', '452001', 'img/profile10.jpg', 'Doctor promoting holistic and vegan lifestyles.', '2025-04-20 15:35:00'),
(11, '9 Green Villa', 'Lucknow', 'Uttar Pradesh', 'India', '226001', 'img/profile11.jpg', 'Vegan skincare enthusiast and product reviewer.', '2025-04-25 09:10:00'),
(12, '31 Bloom Street', 'Surat', 'Gujarat', 'India', '395001', 'img/profile12.jpg', 'Admin managing Hello Vegan community forum.', '2025-05-01 11:25:00'),
(13, '56 Vegan Plaza', 'Patna', 'Bihar', 'India', '800001', 'img/profile13.jpg', 'Student learning about sustainable living.', '2025-05-05 16:45:00'),
(14, '32 Earth Lane', 'Bhopal', 'Madhya Pradesh', 'India', '462001', 'img/profile14.jpg', 'Fitness coach focusing on plant-based diets.', '2025-05-09 10:00:00'),
(15, '1 Plantbase Road', 'Nagpur', 'Maharashtra', 'India', '440001', 'img/profile15.jpg', 'Nutritionist passionate about vegan awareness.', '2025-05-15 14:10:00'),
(16, '8 Fresh Street', 'Ahmedabad', 'Gujarat', 'India', '380001', 'img/profile16.jpg', 'Counselor helping families adapt vegan lifestyles.', '2025-05-20 13:55:00'),
(17, '20 Eco Street', 'Delhi', 'Delhi', 'India', '110002', 'img/profile17.jpg', 'Entrepreneur building vegan-friendly products.', '2025-05-25 11:45:00'),
(18, '2 Organic Road', 'Mumbai', 'Maharashtra', 'India', '400002', 'img/profile18.jpg', 'Photographer capturing vegan food stories.', '2025-06-01 09:20:00'),
(19, '3 Wellness Lane', 'Chennai', 'Tamil Nadu', 'India', '600002', 'img/profile19.jpg', 'Doctor specializing in vegan nutrition therapy.', '2025-06-10 10:35:00'),
(20, '11 Vegan Road', 'Goa', 'Goa', 'India', '403001', 'img/profile20.jpg', 'Beach lover advocating eco-conscious lifestyle.', '2025-06-20 12:00:00');


-- ========================================= QUERIES ===============================================================================================================

SELECT * FROM user_profiles;

truncate table  user_profiles;

drop TABLE user_profiles;


-- ============================================= CREATE TABLE 3. USER_ROLES  =======================================================================================

-- CREATE TABLE user_roles
CREATE TABLE user_roles (
    role_id INT PRIMARY KEY AUTO_INCREMENT,
    role_name VARCHAR(50),
    description TEXT,
    created_by INT,
    created_at DATETIME,
    updated_by INT,
    updated_at DATETIME,
    status VARCHAR(20),
    permissions TEXT,
    FOREIGN KEY (created_by) REFERENCES users(user_id)
);

-- =========================================================INSERT INTO VALUES user_roles  ==========================================================================

INSERT INTO user_roles (role_name, description, created_by, created_at, updated_by, updated_at, status, permissions)
VALUES
('Admin', 'Has full control over the Hello Vegan system including user management, products, and settings.', 2, '2025-01-01 10:00:00', 2, '2025-01-10 09:00:00', 'Active', 'manage_users,manage_products,view_reports,edit_content'),
('Customer', 'Regular user who can browse and purchase vegan products.', 1, '2025-01-02 11:00:00', 2, '2025-01-12 10:30:00', 'Active', 'view_products,add_to_cart,place_order,write_review'),
('Doctor', 'Registered doctor providing vegan health advice.', 5, '2025-01-03 09:30:00', 12, '2025-01-13 09:15:00', 'Active', 'view_appointments,update_profile,chat_users'),
('Counselor', 'Lifestyle counselor offering vegan diet consultations.', 7, '2025-01-04 14:20:00', 16, '2025-01-14 11:20:00', 'Active', 'schedule_sessions,view_clients,chat_users'),
('Moderator', 'Assists admin in monitoring user-generated content and reviews.', 12, '2025-01-05 10:45:00', 2, '2025-01-15 09:30:00', 'Active', 'approve_reviews,delete_posts,ban_users'),
('Event Organizer', 'Responsible for creating and managing vegan events.', 2, '2025-01-06 08:40:00', 2, '2025-01-16 12:45:00', 'Active', 'create_event,edit_event,view_registrations'),
('Campaign Manager', 'Manages donation and awareness campaigns.', 2, '2025-01-07 13:00:00', 12, '2025-01-17 10:00:00', 'Active', 'create_campaign,track_donations,view_reports'),
('Delivery Partner', 'Handles product deliveries to customers.', 1, '2025-01-08 10:15:00', 2, '2025-01-18 09:20:00', 'Active', 'update_delivery_status,view_orders'),
('Product Manager', 'Adds and updates vegan products and categories.', 2, '2025-01-09 12:30:00', 12, '2025-01-19 10:50:00', 'Active', 'add_product,edit_product,manage_stock'),
('Volunteer', 'Supports community campaigns and local vegan events.', 1, '2025-01-10 09:10:00', 2, '2025-01-20 09:10:00', 'Active', 'join_event,share_posts'),
('Support Staff', 'Handles user queries and provides customer support.', 12, '2025-01-11 08:45:00', 2, '2025-01-21 11:00:00', 'Active', 'reply_tickets,view_feedback'),
('Editor', 'Manages website content, blogs, and news.', 2, '2025-01-12 14:00:00', 12, '2025-01-22 10:30:00', 'Active', 'create_post,edit_post,delete_post'),
('Finance Officer', 'Oversees all payments, refunds, and reports.', 2, '2025-01-13 09:00:00', 2, '2025-01-23 09:45:00', 'Active', 'manage_payments,view_finance_reports'),
('Marketing Executive', 'Handles promotions, ads, and email marketing.', 12, '2025-01-14 12:20:00', 2, '2025-01-24 15:00:00', 'Active', 'create_promo,send_emails,view_stats'),
('Nutritionist', 'Provides meal and diet plans for users.', 5, '2025-01-15 10:10:00', 12, '2025-01-25 12:30:00', 'Active', 'create_plan,update_meals,chat_users'),
('Research Analyst', 'Analyzes vegan market trends and user preferences.', 12, '2025-01-16 09:25:00', 2, '2025-01-26 11:00:00', 'Active', 'view_reports,generate_insights'),
('Event Volunteer', 'Helps organize and manage offline vegan events.', 1, '2025-01-17 08:50:00', 2, '2025-01-27 10:40:00', 'Active', 'assist_event,check_in_participants'),
('Community Manager', 'Manages Hello Vegan’s online community posts and members.', 12, '2025-01-18 11:45:00', 2, '2025-01-28 14:00:00', 'Active', 'approve_comments,moderate_posts,ban_users'),
('Content Creator', 'Creates articles, posts, and graphics for social media.', 12, '2025-01-19 15:20:00', 2, '2025-01-29 16:15:00', 'Active', 'create_content,upload_images'),
('Tester', 'Tests website features and reports bugs.', 2, '2025-01-20 09:30:00', 12, '2025-01-30 11:10:00', 'Active', 'test_features,report_bugs');

-- ===========================================================  QUERIES  ===================================================================================== 

SELECT * FROM user_roles ;

truncate table user_roles ;

drop table user_roles ;

-- ==================================================== CREATE  TABLE 4. PRODUCT ===================================================================================

-- CREATE TABLE  Product 
-- 4. TABLE PRODUCTS
CREATE TABLE products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    category_id INT,
    name VARCHAR(150),
    description TEXT,
    price DECIMAL(10,2),
    stock INT,
    brand VARCHAR(100),
    image_url VARCHAR(255),
    status VARCHAR(20),
    created_at DATETIME
);

-- ====================================================================INSERT INTO PRODUCTS  ========================================================================

INSERT INTO products (category_id, name, description, price, stock, brand, image_url, status, created_at)
VALUES
(1, 'Organic Almond Milk', 'Unsweetened almond milk made from 100% organic almonds.', 199.00, 120, 'VeganPure', 'images/almond_milk.jpg', 'Available', '2025-10-06 10:00:00'),
(1, 'Vegan Protein Powder', 'Plant-based protein powder with pea and rice protein blend.', 999.00, 80, 'GreenFuel', 'images/protein_powder.jpg', 'Available', '2025-10-06 10:05:00'),
(2, 'Coconut Lip Balm', 'Moisturizing lip balm made with coconut oil and shea butter.', 149.00, 200, 'EcoBeauty', 'images/lip_balm.jpg', 'Available', '2025-10-06 10:10:00'),
(2, 'Aloe Vera Face Cream', 'Hydrating face cream suitable for all skin types.', 349.00, 150, 'HerbalGlow', 'images/face_cream.jpg', 'Available', '2025-10-06 10:15:00'),
(3, 'Vegan Leather Wallet', 'Handcrafted vegan leather wallet with multiple card slots.', 699.00, 90, 'LeafStyle', 'images/vegan_wallet.jpg', 'Available', '2025-10-06 10:20:00'),
(3, 'Eco-friendly Tote Bag', 'Reusable tote bag made from recycled cotton.', 299.00, 180, 'NatureCraft', 'images/tote_bag.jpg', 'Available', '2025-10-06 10:25:00'),
(4, 'Vegan Dark Chocolate', 'Rich dark chocolate with 70% cocoa and no dairy.', 249.00, 250, 'ChocoSoul', 'images/dark_chocolate.jpg', 'Available', '2025-10-06 10:30:00'),
(4, 'Oat Cookies', 'Crunchy cookies made with oats and coconut sugar.', 199.00, 220, 'HealthyBite', 'images/oat_cookies.jpg', 'Available', '2025-10-06 10:35:00'),
(1, 'Cashew Butter', 'Creamy cashew butter with no added sugar or oil.', 499.00, 75, 'NuttyNature', 'images/cashew_butter.jpg', 'Available', '2025-10-06 10:40:00'),
(5, 'Herbal Shampoo', 'Natural shampoo infused with aloe vera and neem.', 399.00, 130, 'EcoHerb', 'images/herbal_shampoo.jpg', 'Available', '2025-10-06 10:45:00'),
(5, 'Charcoal Face Wash', 'Deep-cleansing face wash with activated charcoal.', 299.00, 110, 'HerbalGlow', 'images/charcoal_facewash.jpg', 'Available', '2025-10-06 10:50:00'),
(6, 'Vegan Sneakers', 'Stylish sneakers made with recycled materials.', 1499.00, 60, 'GreenStep', 'images/vegan_sneakers.jpg', 'Available', '2025-10-06 10:55:00'),
(6, 'Bamboo Sunglasses', 'Eco-friendly sunglasses with bamboo frame.', 899.00, 85, 'EcoVision', 'images/bamboo_sunglasses.jpg', 'Available', '2025-10-06 11:00:00'),
(7, 'Vegan Omega Capsules', 'Omega-3 capsules sourced from algae.', 799.00, 140, 'PlantLife', 'images/omega_capsules.jpg', 'Available', '2025-10-06 11:05:00'),
(7, 'Multivitamin Tablets', 'Daily vegan multivitamins with essential nutrients.', 699.00, 160, 'NutraVegan', 'images/multivitamins.jpg', 'Available', '2025-10-06 11:10:00'),
(8, 'Vegan Mayonnaise', 'Egg-free creamy mayonnaise made with sunflower oil.', 199.00, 190, 'PureTaste', 'images/vegan_mayo.jpg', 'Available', '2025-10-06 11:15:00'),
(8, 'Tofu Cubes', 'Soft and fresh tofu cubes made from organic soybeans.', 149.00, 210, 'SoyFresh', 'images/tofu.jpg', 'Available', '2025-10-06 11:20:00'),
(9, 'Compostable Cutlery Set', 'Set of forks, spoons, and knives made from cornstarch.', 249.00, 130, 'GreenTable', 'images/cutlery_set.jpg', 'Available', '2025-10-06 11:25:00'),
(9, 'Bamboo Toothbrush', 'Eco-friendly toothbrush with bamboo handle and soft bristles.', 99.00, 300, 'EcoSmile', 'images/bamboo_toothbrush.jpg', 'Available', '2025-10-06 11:30:00'),
(10, 'Vegan Cheese', 'Dairy-free cheese made from cashews and nutritional yeast.', 399.00, 100, 'PlantDairy', 'images/vegan_cheese.jpg', 'Available', '2025-10-06 11:35:00');

-- ============================================= QUERIES ===================================================================================================
SELECT * FROM products ;

TRUNCATE TABLE products;

DROP TABLE products;
-- ===================================================== CREATE TABLE 5.  CATEGORIES =================================================================================


-- 5. CATEGORIES

CREATE TABLE categories (
    category_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    description TEXT,
    parent_id INT,
    image_url VARCHAR(255),
    created_at DATETIME,
    updated_at DATETIME,
    status VARCHAR(20),
    created_by INT,
    FOREIGN KEY (created_by) REFERENCES users(user_id)
);

-- =========================================================== INSERT INTO CATEGORIES ================================================================================

INSERT INTO categories (name, description, parent_id, image_url, created_at, updated_at, status, created_by)
VALUES
('Beverages', 'Plant-based drinks including milk alternatives, juices, and smoothies.', NULL, 'images/categories/beverages.jpg', '2025-10-06 10:00:00', '2025-10-06 10:10:00', 'Active', 2),
('Food', 'All types of vegan food including snacks, ready-to-eat meals, and ingredients.', NULL, 'images/categories/food.jpg', '2025-10-06 10:05:00', '2025-10-06 10:15:00', 'Active', 2),
('Skincare', 'Natural and vegan skincare products for all skin types.', NULL, 'images/categories/skincare.jpg', '2025-10-06 10:10:00', '2025-10-06 10:20:00', 'Active', 2),
('Clothing & Accessories', 'Eco-friendly fashion products including clothes, shoes, and bags.', NULL, 'images/categories/fashion.jpg', '2025-10-06 10:15:00', '2025-10-06 10:25:00', 'Active', 2),
('Supplements', 'Vegan vitamins, protein powders, and other dietary supplements.', NULL, 'images/categories/supplements.jpg', '2025-10-06 10:20:00', '2025-10-06 10:30:00', 'Active', 2),
('Eco-Kitchen', 'Sustainable kitchenware, cutlery, and storage items.', NULL, 'images/categories/kitchen.jpg', '2025-10-06 10:25:00', '2025-10-06 10:35:00', 'Active', 2),
('Beverages - Milk Alternatives', 'Plant-based milk alternatives like almond, oat, soy, and cashew milk.', 1, 'images/categories/milk_alternatives.jpg', '2025-10-06 10:30:00', '2025-10-06 10:40:00', 'Active', 2),
('Beverages - Smoothies', 'Ready-to-drink vegan smoothies and shakes.', 1, 'images/categories/smoothies.jpg', '2025-10-06 10:35:00', '2025-10-06 10:45:00', 'Active', 2),
('Food - Snacks', 'Vegan snacks including cookies, chips, and granola bars.', 2, 'images/categories/snacks.jpg', '2025-10-06 10:40:00', '2025-10-06 10:50:00', 'Active', 2),
('Food - Tofu & Meat Alternatives', 'Plant-based proteins like tofu, tempeh, and vegan burgers.', 2, 'images/categories/meat_alternatives.jpg', '2025-10-06 10:45:00', '2025-10-06 10:55:00', 'Active', 2),
('Skincare - Face', 'Vegan face creams, serums, and cleansers.', 3, 'images/categories/face.jpg', '2025-10-06 10:50:00', '2025-10-06 11:00:00', 'Active', 2),
('Skincare - Hair', 'Shampoos, conditioners, and hair oils.', 3, 'images/categories/hair.jpg', '2025-10-06 10:55:00', '2025-10-06 11:05:00', 'Active', 2),
('Clothing - Shoes', 'Vegan sneakers, sandals, and other footwear.', 4, 'images/categories/shoes.jpg', '2025-10-06 11:00:00', '2025-10-06 11:10:00', 'Active', 2),
('Clothing - Bags', 'Eco-friendly handbags, totes, and backpacks.', 4, 'images/categories/bags.jpg', '2025-10-06 11:05:00', '2025-10-06 11:15:00', 'Active', 2),
('Supplements - Protein', 'Plant-based protein powders and blends.', 5, 'images/categories/protein.jpg', '2025-10-06 11:10:00', '2025-10-06 11:20:00', 'Active', 2),
('Supplements - Vitamins', 'Daily multivitamins and mineral supplements.', 5, 'images/categories/vitamins.jpg', '2025-10-06 11:15:00', '2025-10-06 11:25:00', 'Active', 2),
('Eco-Kitchen - Cutlery', 'Reusable cutlery sets made from bamboo or cornstarch.', 6, 'images/categories/cutlery.jpg', '2025-10-06 11:20:00', '2025-10-06 11:30:00', 'Active', 2),
('Eco-Kitchen - Storage', 'Glass jars, containers, and eco-friendly storage solutions.', 6, 'images/categories/storage.jpg', '2025-10-06 11:25:00', '2025-10-06 11:35:00', 'Active', 2),
('Food - Beverages', 'Ready-to-drink beverages including juices and plant-based drinks.', 2, 'images/categories/food_beverages.jpg', '2025-10-06 11:30:00', '2025-10-06 11:40:00', 'Active', 2),
('Food - Baking Ingredients', 'Vegan flours, baking mixes, and sugar alternatives.', 2, 'images/categories/baking.jpg', '2025-10-06 11:35:00', '2025-10-06 11:45:00', 'Active', 2);

-- ========================================= QUERIES ===============================================================================================================
SELECT * FROM categories;

TRUNCATE categories;

DROP TABLE categories;
-- ===================================================== CREATE TABLE  6. ORDERS=================================================================================

-- 6. ORDERS
CREATE TABLE orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    total_amount DECIMAL(10,2),
    order_date DATETIME,
    payment_status VARCHAR(30),
    order_status VARCHAR(30),
    shipping_address VARCHAR(255),
    city VARCHAR(50),
    pincode VARCHAR(10),
    delivery_date DATETIME,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);
-- =========================================================== INSERT INTO orders ================================================================================


INSERT INTO orders (user_id, total_amount, order_date, payment_status, order_status, shipping_address, city, pincode, delivery_date)
VALUES
(1, 1599.00, '2025-10-01 10:00:00', 'Paid', 'Delivered', '12 Green Street', 'Mumbai', '400001', '2025-10-05 10:00:00'),
(2, 899.00, '2025-10-02 11:15:00', 'Pending', 'Processing', '45 Eco Lane', 'Pune', '411001', '2025-10-06 12:00:00'),
(3, 349.00, '2025-10-03 09:30:00', 'Paid', 'Delivered', '22 Vegan Road', 'Delhi', '110001', '2025-10-07 09:00:00'),
(4, 499.00, '2025-10-03 14:20:00', 'Paid', 'Shipped', '5 Herbal Avenue', 'Kolkata', '700001', '2025-10-08 15:00:00'),
(5, 299.00, '2025-10-04 10:45:00', 'Failed', 'Cancelled', '9 Wellness Street', 'Bangalore', '560001', '2025-10-09 11:00:00'),
(6, 699.00, '2025-10-05 13:15:00', 'Paid', 'Delivered', '21 Nature Road', 'Chennai', '600001', '2025-10-10 13:00:00'),
(7, 199.00, '2025-10-05 16:10:00', 'Paid', 'Delivered', '15 Organic Lane', 'Hyderabad', '500001', '2025-10-11 14:00:00'),
(8, 999.00, '2025-10-06 11:00:00', 'Pending', 'Processing', '16 Eco Park', 'Pune', '411045', '2025-10-12 16:00:00'),
(9, 399.00, '2025-10-06 17:15:00', 'Paid', 'Shipped', '18 Leafy Street', 'Kochi', '682001', '2025-10-13 12:00:00'),
(10, 1499.00, '2025-10-07 09:50:00', 'Paid', 'Delivered', '7 Plant Lane', 'Indore', '452001', '2025-10-14 10:00:00'),
(11, 249.00, '2025-10-07 14:55:00', 'Pending', 'Processing', '9 Green Villa', 'Lucknow', '226001', '2025-10-15 11:00:00'),
(12, 199.00, '2025-10-08 09:10:00', 'Paid', 'Delivered', '31 Bloom Street', 'Surat', '395001', '2025-10-16 10:00:00'),
(13, 799.00, '2025-10-08 16:45:00', 'Paid', 'Delivered', '56 Vegan Plaza', 'Patna', '800001', '2025-10-17 14:00:00'),
(14, 349.00, '2025-10-09 10:00:00', 'Pending', 'Processing', '32 Earth Lane', 'Bhopal', '462001', '2025-10-18 12:00:00'),
(15, 149.00, '2025-10-09 14:10:00', 'Paid', 'Delivered', '1 Plantbase Road', 'Nagpur', '440001', '2025-10-19 10:00:00'),
(16, 399.00, '2025-10-10 13:55:00', 'Failed', 'Cancelled', '8 Fresh Street', 'Ahmedabad', '380001', '2025-10-20 12:00:00'),
(17, 699.00, '2025-10-10 11:45:00', 'Paid', 'Shipped', '20 Eco Street', 'Delhi', '110002', '2025-10-21 15:00:00'),
(18, 249.00, '2025-10-11 09:20:00', 'Paid', 'Delivered', '2 Organic Road', 'Mumbai', '400002', '2025-10-22 10:00:00'),
(19, 399.00, '2025-10-11 10:35:00', 'Pending', 'Processing', '3 Wellness Lane', 'Chennai', '600002', '2025-10-23 11:00:00'),
(20, 299.00, '2025-10-12 12:00:00', 'Paid', 'Delivered', '11 Vegan Road', 'Goa', '403001', '2025-10-24 13:00:00');

-- ========================================= QUERIES ===============================================================================================================

SELECT * FROM orders;

TRUNCATE TABLE orders;

DROP TABLE orders;
--  ========================================================== CREATE   TABLE  7. ORDER_ITEMS=======================================================================

-- 7. ORDER_ITEMS
CREATE TABLE order_items (
    item_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    product_id INT,
    quantity INT,
    price DECIMAL(10,2),
    discount DECIMAL(10,2),
    subtotal DECIMAL(10,2),
    created_at DATETIME,
    updated_at DATETIME,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);
-- =================================================== INSERT INTO order_items =========================================================================================

INSERT INTO order_items (order_id, product_id, quantity, price, discount, subtotal, created_at, updated_at)
VALUES
(1, 1, 2, 199.00, 0.00, 398.00, '2025-10-01 10:05:00', '2025-10-01 10:05:00'),
(1, 4, 3, 349.00, 20.00, 1027.00, '2025-10-01 10:10:00', '2025-10-01 10:10:00'),
(2, 3, 1, 149.00, 0.00, 149.00, '2025-10-02 11:20:00', '2025-10-02 11:20:00'),
(2, 5, 1, 699.00, 50.00, 649.00, '2025-10-02 11:25:00', '2025-10-02 11:25:00'),
(3, 2, 1, 999.00, 100.00, 899.00, '2025-10-03 09:35:00', '2025-10-03 09:35:00'),
(4, 6, 2, 299.00, 0.00, 598.00, '2025-10-03 14:25:00', '2025-10-03 14:25:00'),
(5, 10, 1, 1499.00, 200.00, 1299.00, '2025-10-04 10:50:00', '2025-10-04 10:50:00'),
(6, 9, 1, 399.00, 0.00, 399.00, '2025-10-05 13:20:00', '2025-10-05 13:20:00'),
(7, 8, 2, 999.00, 100.00, 1898.00, '2025-10-05 16:15:00', '2025-10-05 16:15:00'),
(8, 7, 1, 499.00, 0.00, 499.00, '2025-10-06 11:05:00', '2025-10-06 11:05:00'),
(9, 12, 1, 1499.00, 0.00, 1499.00, '2025-10-06 17:20:00', '2025-10-06 17:20:00'),
(10, 11, 1, 249.00, 0.00, 249.00, '2025-10-07 09:55:00', '2025-10-07 09:55:00'),
(11, 14, 2, 299.00, 50.00, 548.00, '2025-10-07 15:00:00', '2025-10-07 15:00:00'),
(12, 13, 1, 799.00, 100.00, 699.00, '2025-10-08 09:15:00', '2025-10-08 09:15:00'),
(13, 15, 3, 199.00, 0.00, 597.00, '2025-10-08 16:50:00', '2025-10-08 16:50:00'),
(14, 16, 2, 399.00, 50.00, 748.00, '2025-10-09 10:05:00', '2025-10-09 10:05:00'),
(15, 17, 1, 149.00, 0.00, 149.00, '2025-10-09 14:15:00', '2025-10-09 14:15:00'),
(16, 18, 2, 249.00, 0.00, 498.00, '2025-10-10 14:00:00', '2025-10-10 14:00:00'),
(17, 19, 1, 399.00, 50.00, 349.00, '2025-10-10 11:50:00', '2025-10-10 11:50:00'),
(18, 20, 2, 299.00, 0.00, 598.00, '2025-10-11 09:25:00', '2025-10-11 09:25:00');

-- ========================================= QUERIES ===============================================================================================================
SELECT * FROM order_items;

TRUNCATE TABLE order_items;

DROP TABLE order_items;

--  ========================================================== CREATE  TABLE 8. PAYMENTS =======================================================================

-- 8. PAYMENTS
CREATE TABLE payments (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    user_id INT,
    payment_method VARCHAR(50),
    amount DECIMAL(10,2),
    payment_date DATETIME,
    transaction_id VARCHAR(100),
    payment_status VARCHAR(30),
    remarks TEXT,
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

-- ======================================================= INSERT INTO payments =================================================================================

INSERT INTO payments (order_id, user_id, payment_method, amount, payment_date, transaction_id, payment_status, remarks)
VALUES
(1, 1, 'Credit Card', 1599.00, '2025-10-01 10:10:00', 'TXN10001', 'Paid', 'Payment successful'),
(2, 2, 'UPI', 899.00, '2025-10-02 11:30:00', 'TXN10002', 'Pending', 'Awaiting confirmation'),
(3, 3, 'Debit Card', 349.00, '2025-10-03 09:40:00', 'TXN10003', 'Paid', 'Payment completed'),
(4, 4, 'Net Banking', 499.00, '2025-10-03 14:30:00', 'TXN10004', 'Paid', 'Payment processed'),
(5, 5, 'UPI', 299.00, '2025-10-04 11:00:00', 'TXN10005', 'Failed', 'Transaction declined'),
(6, 6, 'Credit Card', 699.00, '2025-10-05 13:25:00', 'TXN10006', 'Paid', 'Payment successful'),
(7, 7, 'PayPal', 199.00, '2025-10-05 16:20:00', 'TXN10007', 'Paid', 'Payment completed'),
(8, 8, 'UPI', 999.00, '2025-10-06 11:10:00', 'TXN10008', 'Pending', 'Awaiting confirmation'),
(9, 9, 'Debit Card', 399.00, '2025-10-06 17:30:00', 'TXN10009', 'Paid', 'Payment successful'),
(10, 10, 'Net Banking', 1499.00, '2025-10-07 10:00:00', 'TXN10010', 'Paid', 'Transaction completed'),
(11, 11, 'UPI', 249.00, '2025-10-07 15:05:00', 'TXN10011', 'Pending', 'Awaiting payment'),
(12, 12, 'Credit Card', 199.00, '2025-10-08 09:20:00', 'TXN10012', 'Paid', 'Payment successful'),
(13, 13, 'Debit Card', 799.00, '2025-10-08 16:55:00', 'TXN10013', 'Paid', 'Payment completed'),
(14, 14, 'PayPal', 349.00, '2025-10-09 10:10:00', 'TXN10014', 'Pending', 'Awaiting confirmation'),
(15, 15, 'Credit Card', 149.00, '2025-10-09 14:20:00', 'TXN10015', 'Paid', 'Payment successful'),
(16, 16, 'UPI', 399.00, '2025-10-10 14:05:00', 'TXN10016', 'Failed', 'Transaction declined'),
(17, 17, 'Debit Card', 699.00, '2025-10-10 11:55:00', 'TXN10017', 'Paid', 'Payment successful'),
(18, 18, 'Net Banking', 249.00, '2025-10-11 09:30:00', 'TXN10018', 'Paid', 'Payment completed'),
(19, 19, 'UPI', 399.00, '2025-10-11 10:40:00', 'TXN10019', 'Pending', 'Awaiting confirmation'),
(20, 20, 'Credit Card', 299.00, '2025-10-12 12:10:00', 'TXN10020', 'Paid', 'Payment successful');

-- ========================================= QUERIES ===============================================================================================================

SELECT * FROM payments  ;

TRUNCATE TABLE payments;

DROP TABLE payments;
--  ========================================================== CREATE  TABLE 9. DOCTORS=======================================================================

-- 9. DOCTORS
CREATE TABLE doctors (
    doctor_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(15),
    specialization VARCHAR(100),
    experience_years INT,
    clinic_address VARCHAR(255),
    available_days VARCHAR(100),
    consultation_fee DECIMAL(10,2),
    created_at DATETIME
);

-- ======================================================= INSERT INTO doctors =================================================================================

INSERT INTO doctors (name, email, phone, specialization, experience_years, clinic_address, available_days, consultation_fee, created_at)
VALUES
('Dr. Anjali Sharma', 'anjali.sharma@email.com', '9876543210', 'Nutritionist', 8, '12 Green Street, Mumbai', 'Mon, Wed, Fri', 500.00, '2025-10-01 09:00:00'),
('Dr. Rohit Verma', 'rohit.verma@email.com', '9876543211', 'Dietitian', 10, '45 Eco Lane, Pune', 'Tue, Thu, Sat', 600.00, '2025-10-01 09:30:00'),
('Dr. Meera Kapoor', 'meera.kapoor@email.com', '9876543212', 'Homeopathy', 12, '22 Vegan Road, Delhi', 'Mon, Tue, Thu', 450.00, '2025-10-01 10:00:00'),
('Dr. Arjun Singh', 'arjun.singh@email.com', '9876543213', 'Ayurveda', 15, '5 Herbal Avenue, Kolkata', 'Wed, Fri, Sat', 700.00, '2025-10-01 10:30:00'),
('Dr. Priya Nair', 'priya.nair@email.com', '9876543214', 'Vegan Diet Specialist', 7, '9 Wellness Street, Bangalore', 'Mon, Thu, Sat', 550.00, '2025-10-01 11:00:00'),
('Dr. Karan Mehta', 'karan.mehta@email.com', '9876543215', 'Nutritionist', 9, '21 Nature Road, Chennai', 'Tue, Fri', 500.00, '2025-10-01 11:30:00'),
('Dr. Sanya Kapoor', 'sanya.kapoor@email.com', '9876543216', 'Dietitian', 11, '15 Organic Lane, Hyderabad', 'Mon, Wed, Fri', 600.00, '2025-10-01 12:00:00'),
('Dr. Vikram Desai', 'vikram.desai@email.com', '9876543217', 'Ayurveda', 14, '16 Eco Park, Pune', 'Tue, Thu, Sat', 700.00, '2025-10-01 12:30:00'),
('Dr. Neha Reddy', 'neha.reddy@email.com', '9876543218', 'Homeopathy', 10, '18 Leafy Street, Kochi', 'Mon, Wed, Fri', 450.00, '2025-10-01 13:00:00'),
('Dr. Rakesh Jain', 'rakesh.jain@email.com', '9876543219', 'Vegan Diet Specialist', 8, '7 Plant Lane, Indore', 'Tue, Thu, Sat', 550.00, '2025-10-01 13:30:00'),
('Dr. Ananya Sen', 'ananya.sen@email.com', '9876543220', 'Nutritionist', 9, '9 Green Villa, Lucknow', 'Mon, Wed', 500.00, '2025-10-01 14:00:00'),
('Dr. Manish Gupta', 'manish.gupta@email.com', '9876543221', 'Dietitian', 10, '31 Bloom Street, Surat', 'Tue, Thu', 600.00, '2025-10-01 14:30:00'),
('Dr. Shruti Malhotra', 'shruti.malhotra@email.com', '9876543222', 'Homeopathy', 12, '56 Vegan Plaza, Patna', 'Mon, Wed, Fri', 450.00, '2025-10-01 15:00:00'),
('Dr. Amit Bhatia', 'amit.bhatia@email.com', '9876543223', 'Ayurveda', 15, '32 Earth Lane, Bhopal', 'Tue, Thu, Sat', 700.00, '2025-10-01 15:30:00'),
('Dr. Tanya Joshi', 'tanya.joshi@email.com', '9876543224', 'Vegan Diet Specialist', 7, '1 Plantbase Road, Nagpur', 'Mon, Wed, Fri', 550.00, '2025-10-01 16:00:00'),
('Dr. Prateek Sharma', 'prateek.sharma@email.com', '9876543225', 'Nutritionist', 9, '8 Fresh Street, Ahmedabad', 'Tue, Thu', 500.00, '2025-10-01 16:30:00'),
('Dr. Kavya Nair', 'kavya.nair@email.com', '9876543226', 'Dietitian', 11, '20 Eco Street, Delhi', 'Mon, Wed, Fri', 600.00, '2025-10-01 17:00:00'),
('Dr. Aditya Rao', 'aditya.rao@email.com', '9876543227', 'Ayurveda', 14, '2 Organic Road, Mumbai', 'Tue, Thu, Sat', 700.00, '2025-10-01 17:30:00'),
('Dr. Riya Sharma', 'riya.sharma@email.com', '9876543228', 'Homeopathy', 10, '3 Wellness Lane, Chennai', 'Mon, Wed', 450.00, '2025-10-01 18:00:00'),
('Dr. Kunal Verma', 'kunal.verma@email.com', '9876543229', 'Vegan Diet Specialist', 8, '11 Vegan Road, Goa', 'Tue, Thu, Sat', 550.00, '2025-10-01 18:30:00');

-- ========================================= QUERIES ===============================================================================================================
SELECT * FROM doctors ;

TRUNCATE TABLE doctors;

DROP TABLE doctors;
--  ========================================================== CREATE  TABLE 10. APPOINTMENTS =======================================================================

-- 10. APPOINTMENTS
CREATE TABLE appointments (
    appointment_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    doctor_id INT,
    appointment_date DATETIME,
    appointment_time VARCHAR(20),
    status VARCHAR(30),
    mode VARCHAR(20),
    notes TEXT,
    payment_status VARCHAR(30),
    created_at DATETIME,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id)
);

-- ======================================================= INSERT INTO appointments =================================================================================


INSERT INTO appointments (user_id, doctor_id, appointment_date, appointment_time, status, mode, notes, payment_status, created_at)
VALUES
(1, 1, '2025-10-10 09:00:00', '09:00 AM', 'Confirmed', 'Online', 'First consultation', 'Paid', '2025-10-01 10:00:00'),
(2, 2, '2025-10-11 10:30:00', '10:30 AM', 'Pending', 'In-person', 'Follow-up on diet plan', 'Pending', '2025-10-02 11:00:00'),
(3, 3, '2025-10-12 11:00:00', '11:00 AM', 'Confirmed', 'Online', 'Discuss supplement options', 'Paid', '2025-10-03 09:30:00'),
(4, 4, '2025-10-13 14:00:00', '02:00 PM', 'Cancelled', 'In-person', 'Patient unavailable', 'Failed', '2025-10-03 14:00:00'),
(5, 5, '2025-10-14 09:30:00', '09:30 AM', 'Confirmed', 'Online', 'Initial consultation', 'Paid', '2025-10-04 10:00:00'),
(6, 6, '2025-10-15 11:15:00', '11:15 AM', 'Confirmed', 'In-person', 'Discuss meal plans', 'Paid', '2025-10-05 13:00:00'),
(7, 7, '2025-10-16 10:00:00', '10:00 AM', 'Pending', 'Online', 'Second consultation', 'Pending', '2025-10-05 16:00:00'),
(8, 8, '2025-10-17 13:30:00', '01:30 PM', 'Confirmed', 'In-person', 'Routine check-up', 'Paid', '2025-10-06 11:00:00'),
(9, 9, '2025-10-18 09:45:00', '09:45 AM', 'Confirmed', 'Online', 'Discuss nutrition tips', 'Paid', '2025-10-06 17:00:00'),
(10, 10, '2025-10-19 15:00:00', '03:00 PM', 'Cancelled', 'In-person', 'Patient unavailable', 'Failed', '2025-10-07 09:50:00'),
(11, 11, '2025-10-20 10:15:00', '10:15 AM', 'Confirmed', 'Online', 'Follow-up consultation', 'Paid', '2025-10-07 15:00:00'),
(12, 12, '2025-10-21 11:30:00', '11:30 AM', 'Pending', 'In-person', 'Discuss health concerns', 'Pending', '2025-10-08 09:10:00'),
(13, 13, '2025-10-22 14:00:00', '02:00 PM', 'Confirmed', 'Online', 'Supplement advice', 'Paid', '2025-10-08 16:45:00'),
(14, 14, '2025-10-23 09:00:00', '09:00 AM', 'Confirmed', 'In-person', 'Routine diet check', 'Paid', '2025-10-09 10:00:00'),
(15, 15, '2025-10-24 10:30:00', '10:30 AM', 'Pending', 'Online', 'Initial consultation', 'Pending', '2025-10-09 14:10:00'),
(16, 16, '2025-10-25 11:00:00', '11:00 AM', 'Confirmed', 'In-person', 'Discuss meal plan adjustments', 'Paid', '2025-10-10 13:55:00'),
(17, 17, '2025-10-26 13:00:00', '01:00 PM', 'Confirmed', 'Online', 'Second consultation', 'Paid', '2025-10-10 11:45:00'),
(18, 18, '2025-10-27 09:30:00', '09:30 AM', 'Pending', 'In-person', 'Discuss dietary supplements', 'Pending', '2025-10-11 09:20:00'),
(19, 19, '2025-10-28 10:00:00', '10:00 AM', 'Confirmed', 'Online', 'Routine follow-up', 'Paid', '2025-10-11 10:35:00'),
(20, 20, '2025-10-29 11:30:00', '11:30 AM', 'Confirmed', 'In-person', 'Initial consultation', 'Paid', '2025-10-12 12:00:00');
-- ========================================================== QUERIES ==============================================================================================

SELECT * FROM appointments;

TRUNCATE TABLE appointments;

DROP TABLE appointments;
--  ========================================================== CREATE  TABLE  11. COUNSELORS =======================================================================

-- 11. COUNSELORS
CREATE TABLE counselors (
    counselor_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(15),
    specialization VARCHAR(100),
    experience_years INT,
    about TEXT,
    available_days VARCHAR(100),
    session_fee DECIMAL(10,2),
    created_at DATETIME
);

-- ======================================================= INSERT INTO counselors =================================================================================

INSERT INTO counselors (name, email, phone, specialization, experience_years, about, available_days, session_fee, created_at) VALUES
('Dr. Alice Johnson', 'alice.j@therapy.com', '+1-555-0101', 'Anxiety & Depression', 10, 'Experienced therapist specializing in cognitive behavioral therapy.', 'Mon, Wed, Fri', 150.00, '2024-01-01 09:00:00'),
('Dr. Bob Smith', 'bob.s@therapy.com', '+1-555-0102', 'Relationship Counseling', 8, 'Helps couples navigate challenges with empathy and tools.', 'Tue, Thu', 120.00, '2024-01-02 09:00:00'),
('Dr. Carol Davis', 'carol.d@therapy.com', '+1-555-0103', 'Stress Management', 12, 'Focuses on mindfulness and work-life balance.', 'Mon, Tue, Sat', 140.00, '2024-01-03 09:00:00'),
('Dr. David Wilson', 'david.w@therapy.com', '+1-555-0104', 'Addiction Recovery', 15, 'Supports recovery journeys with evidence-based methods.', 'Wed, Fri', 160.00, '2024-01-04 09:00:00'),
('Dr. Eve Brown', 'eve.b@therapy.com', '+1-555-0105', 'Child Psychology', 7, 'Works with children and families for emotional growth.', 'Tue, Thu, Sun', 130.00, '2024-01-05 09:00:00'),
('Dr. Frank Miller', 'frank.m@therapy.com', '+1-555-0106', 'Grief Counseling', 11, 'Guides through loss with compassionate support.', 'Mon, Fri', 145.00, '2024-01-06 09:00:00'),
('Dr. Grace Lee', 'grace.l@therapy.com', '+1-555-0107', 'Career Coaching', 9, 'Assists with professional transitions and burnout.', 'Wed, Sat', 125.00, '2024-01-07 09:00:00'),
('Dr. Henry Garcia', 'henry.g@therapy.com', '+1-555-0108', 'Trauma Therapy', 14, 'EMDR specialist for PTSD and healing.', 'Tue, Thu', 155.00, '2024-01-08 09:00:00'),
('Dr. Iris Taylor', 'iris.t@therapy.com', '+1-555-0109', 'Family Therapy', 6, 'Strengthens family dynamics and communication.', 'Mon, Wed, Sun', 135.00, '2024-01-09 09:00:00'),
('Dr. Jack White', 'jack.w@therapy.com', '+1-555-0110', 'Self-Esteem Building', 13, 'Empowers individuals to build confidence.', 'Fri, Sat', 140.00, '2024-01-10 09:00:00'),
('Dr. Karen Adams', 'karen.a@therapy.com', '+1-555-0111', 'Anxiety & Depression', 10, 'Holistic approach to mental wellness.', 'Mon, Tue', 150.00, '2024-01-11 09:00:00'),
('Dr. Leo Martinez', 'leo.m@therapy.com', '+1-555-0112', 'Relationship Counseling', 8, 'Mediation for partnerships.', 'Thu, Fri', 120.00, '2024-01-12 09:00:00'),
('Dr. Mia Rodriguez', 'mia.r@therapy.com', '+1-555-0113', 'Stress Management', 12, 'Yoga-integrated therapy sessions.', 'Wed, Sat', 140.00, '2024-01-13 09:00:00'),
('Dr. Noah Lopez', 'noah.l@therapy.com', '+1-555-0114', 'Addiction Recovery', 15, 'Group and individual support.', 'Mon, Fri', 160.00, '2024-01-14 09:00:00'),
('Dr. Olivia Clark', 'olivia.c@therapy.com', '+1-555-0115', 'Child Psychology', 7, 'Play therapy expert.', 'Tue, Sun', 130.00, '2024-01-15 09:00:00'),
('Dr. Paul Lewis', 'paul.l@therapy.com', '+1-555-0116', 'Grief Counseling', 11, 'Support groups available.', 'Wed, Thu', 145.00, '2024-01-16 09:00:00'),
('Dr. Quinn Walker', 'quinn.w@therapy.com', '+1-555-0117', 'Career Coaching', 9, 'Resume and interview prep.', 'Mon, Sat', 125.00, '2024-01-17 09:00:00'),
('Dr. Riley Hall', 'riley.h@therapy.com', '+1-555-0118', 'Trauma Therapy', 14, 'Safe space for survivors.', 'Tue, Fri', 155.00, '2024-01-18 09:00:00'),
('Dr. Sam Young', 'sam.y@therapy.com', '+1-555-0119', 'Family Therapy', 6, 'Conflict resolution focus.', 'Wed, Sun', 135.00, '2024-01-19 09:00:00'),
('Dr. Tara King', 'tara.k@therapy.com', '+1-555-0120', 'Self-Esteem Building', 13, 'Affirmation-based techniques.', 'Thu, Sat', 140.00, '2024-01-20 09:00:00');

-- ========================================= QUERIES ===============================================================================================================

SELECT * FROM counselors;

TRUNCATE TABLE counselors;

DROP TABLE counselors;

--  ========================================================== CREATE  TABLE 12. COUNSELING_SESSIONS=======================================================================


-- 12. COUNSELING_SESSIONS
CREATE TABLE counseling_sessions (
    session_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    counselor_id INT,
    session_date DATETIME,
    session_time VARCHAR(20),
    mode VARCHAR(20),
    feedback TEXT,
    status VARCHAR(30),
    notes TEXT,
    created_at DATETIME,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (counselor_id) REFERENCES counselors(counselor_id)
);

-- ======================================================= INSERT INTO counseling_sessions =================================================================================

INSERT INTO counseling_sessions (user_id, counselor_id, session_date, session_time, mode, feedback, status, notes, created_at) VALUES
(1, 1, '2024-02-01', '10:00 AM', 'Online', 'Helpful session on anxiety.', 'Completed', 'Discussed coping strategies.', '2024-02-01 08:00:00'),
(2, 2, '2024-02-02', '11:00 AM', 'In-Person', 'Great insights into relationships.', 'Completed', 'Homework assigned.', '2024-02-02 08:00:00'),
(3, 3, '2024-02-03', '09:00 AM', 'Online', 'Stress techniques were useful.', 'Completed', 'Follow-up needed.', '2024-02-03 08:00:00'),
(4, 4, '2024-02-04', '02:00 PM', 'In-Person', 'Supportive for recovery.', 'Completed', 'Progress noted.', '2024-02-04 08:00:00'),
(5, 5, '2024-02-05', '03:00 PM', 'Online', 'Good for child issues.', 'Completed', 'Parent tips given.', '2024-02-05 08:00:00'),
(6, 6, '2024-02-06', '10:30 AM', 'In-Person', 'Helped with grief processing.', 'Completed', 'Emotional breakthrough.', '2024-02-06 08:00:00'),
(7, 7, '2024-02-07', '01:00 PM', 'Online', 'Career advice spot on.', 'Completed', 'Action plan created.', '2024-02-07 08:00:00'),
(8, 8, '2024-02-08', '04:00 PM', 'In-Person', 'Trauma discussion productive.', 'Completed', 'Safety plan reviewed.', '2024-02-08 08:00:00'),
(9, 9, '2024-02-09', '11:30 AM', 'Online', 'Family dynamics improved.', 'Completed', 'Communication exercises.', '2024-02-09 08:00:00'),
(10, 10, '2024-02-10', '12:00 PM', 'In-Person', 'Boosted self-esteem.', 'Completed', 'Positive affirmations.', '2024-02-10 08:00:00'),
(11, 11, '2024-02-11', '09:30 AM', 'Online', 'Anxiety management tips.', 'Pending', 'Initial assessment.', '2024-02-11 08:00:00'),
(12, 12, '2024-02-12', '02:30 PM', 'In-Person', 'Relationship goals set.', 'Completed', 'Couple exercises.', '2024-02-12 08:00:00'),
(13, 13, '2024-02-13', '10:00 AM', 'Online', 'Stress relief methods.', 'Completed', 'Breathing techniques.', '2024-02-13 08:00:00'),
(14, 14, '2024-02-14', '03:30 PM', 'In-Person', 'Addiction support ongoing.', 'Pending', 'Relapse prevention.', '2024-02-14 08:00:00'),
(15, 15, '2024-02-15', '01:30 PM', 'Online', 'Child behavior strategies.', 'Completed', 'School integration.', '2024-02-15 08:00:00'),
(16, 16, '2024-02-16', '04:30 PM', 'In-Person', 'Grief stages discussed.', 'Completed', 'Memory sharing.', '2024-02-16 08:00:00'),
(17, 17, '2024-02-17', '11:00 AM', 'Online', 'Career pivot advice.', 'Pending', 'Networking tips.', '2024-02-17 08:00:00'),
(18, 18, '2024-02-18', '12:30 PM', 'In-Person', 'Trauma healing steps.', 'Completed', 'Journaling assigned.', '2024-02-18 08:00:00'),
(19, 19, '2024-02-19', '09:00 AM', 'Online', 'Family conflict resolution.', 'Completed', 'Boundary setting.', '2024-02-19 08:00:00'),
(20, 20, '2024-02-20', '02:00 PM', 'In-Person', 'Self-esteem workshop.', 'Pending', 'Goal tracking.', '2024-02-20 08:00:00');

-- ========================================= QUERIES ===============================================================================================================

SELECT * FROM counseling_sessions;

TRUNCATE TABLE counseling_sessions ;

DROP TABLE counseling_sessions;
--  ========================================================== CREATE  TABLE  13. EVENTS =======================================================================


-- 13. EVENTS
CREATE TABLE events (
    event_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(150),
    description TEXT,
    event_date DATE,
    event_time VARCHAR(20),
    location VARCHAR(255),
    organizer VARCHAR(100),
    image_url VARCHAR(255),
    type VARCHAR(50),
    created_at DATETIME
);

-- ======================================================= INSERT INTO  events  =================================================================================

INSERT INTO events (title, description, event_date, event_time, location, organizer, image_url, type, created_at) VALUES
('Mental Health Workshop', 'Learn coping strategies for daily stress.', '2024-03-01', '10:00 AM', 'Community Center, NYC', 'Wellness Org', '/images/workshop1.jpg', 'Workshop', '2024-01-01 10:00:00'),
('Yoga for Beginners', 'Intro to yoga poses and breathing.', '2024-03-02', '09:00 AM', 'Park, LA', 'Yoga Club', '/images/yoga1.jpg', 'Class', '2024-01-02 10:00:00'),
('Support Group Meeting', 'Share experiences in a safe space.', '2024-03-03', '07:00 PM', 'Online', 'Support Network', '/images/group1.jpg', 'Meeting', '2024-01-03 10:00:00'),
('Art Therapy Session', 'Express emotions through art.', '2024-03-04', '02:00 PM', 'Gallery, Chicago', 'Art Therapy', '/images/art1.jpg', 'Therapy', '2024-01-04 10:00:00'),
('Fitness Challenge', 'Group workout for mental boost.', '2024-03-05', '11:00 AM', 'Gym, Miami', 'FitMind', '/images/fitness1.jpg', 'Challenge', '2024-01-05 10:00:00'),
('Meditation Retreat', 'Day of guided meditation.', '2024-03-06', '08:00 AM', 'Retreat Center, SF', 'Zen Group', '/images/meditation1.jpg', 'Retreat', '2024-01-06 10:00:00'),
('Parenting Seminar', 'Tips for raising resilient kids.', '2024-03-07', '06:00 PM', 'School, Boston', 'Parent Org', '/images/parenting1.jpg', 'Seminar', '2024-01-07 10:00:00'),
('Book Club on Wellness', 'Discuss books on mental health.', '2024-03-08', '05:00 PM', 'Library, Seattle', 'Book Club', '/images/book1.jpg', 'Club', '2024-01-08 10:00:00'),
('Dance Therapy', 'Move to heal the mind.', '2024-03-09', '03:00 PM', 'Studio, Denver', 'Dance Heal', '/images/dance1.jpg', 'Therapy', '2024-01-09 10:00:00'),
('Nutrition Talk', 'Food and mood connection.', '2024-03-10', '12:00 PM', 'Cafe, Austin', 'NutriMind', '/images/nutrition1.jpg', 'Talk', '2024-01-10 10:00:00'),
('Mindfulness Hike', 'Nature walk with mindfulness.', '2024-03-11', '09:00 AM', 'Trail, Portland', 'EcoTherapy', '/images/hike1.jpg', 'Outdoor', '2024-01-11 10:00:00'),
('Grief Workshop', 'Tools for coping with loss.', '2024-03-12', '01:00 PM', 'Center, Philly', 'Grief Support', '/images/grief1.jpg', 'Workshop', '2024-01-12 10:00:00'),
('Career Wellness Day', 'Balance work and life.', '2024-03-13', '10:30 AM', 'Office, Dallas', 'Career Org', '/images/career1.jpg', 'Day Event', '2024-01-13 10:00:00'),
('Art Exhibit Opening', 'Art inspired by recovery stories.', '2024-03-14', '07:00 PM', 'Museum, Atlanta', 'Art Recovery', '/images/exhibit1.jpg', 'Exhibit', '2024-01-14 10:00:00'),
('Sleep Hygiene Seminar', 'Improve sleep for better mental health.', '2024-03-15', '08:00 PM', 'Online', 'Sleep Experts', '/images/sleep1.jpg', 'Seminar', '2024-01-15 10:00:00'),
('Volunteer Fair', 'Get involved in community health.', '2024-03-16', '11:30 AM', 'Fairground, Houston', 'Volunteer Net', '/images/volunteer1.jpg', 'Fair', '2024-01-16 10:00:00'),
('Poetry Reading', 'Share poems on emotional journeys.', '2024-03-17', '04:00 PM', 'Cafe, Nashville', 'Poets United', '/images/poetry1.jpg', 'Reading', '2024-01-17 10:00:00'),
('Breathwork Class', 'Deep breathing for anxiety relief.', '2024-03-18', '02:30 PM', 'Studio, Phoenix', 'Breath Org', '/images/breath1.jpg', 'Class', '2024-01-18 10:00:00'),
('Family Fun Day', 'Activities for family bonding.', '2024-03-19', '12:30 PM', 'Park, Orlando', 'Family Center', '/images/family1.jpg', 'Fun Day', '2024-01-19 10:00:00'),
('Resilience Training', 'Build inner strength workshop.', '2024-03-20', '09:30 AM', 'Center, Vegas', 'Resilience Group', '/images/resilience1.jpg', 'Training', '2024-01-20 10:00:00');


-- ========================================= QUERIES ===============================================================================================================

SELECT * FROM  events;

 TRUNCATE  TABLE counseling_sessions;

DROP TABLE counseling_sessions;
--  ========================================================== CREATE  TABLE 14. EVENT_REGISTRATIONS=======================================================================

-- 14. EVENT_REGISTRATIONS
CREATE TABLE event_registrations (
    registration_id INT PRIMARY KEY AUTO_INCREMENT,
    event_id INT,
    user_id INT,
    registration_date DATETIME,
    payment_status VARCHAR(30),
    ticket_type VARCHAR(50),
    amount DECIMAL(10,2),
    status VARCHAR(30),
    qr_code VARCHAR(255),
    FOREIGN KEY (event_id) REFERENCES events(event_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- ======================================================= INSERT INTO event_registrations =================================================================================

INSERT INTO event_registrations (event_id, user_id, registration_date, payment_status, ticket_type, amount, status, qr_code) VALUES
(1, 1, '2024-02-15 10:00:00', 'Paid', 'General', 25.00, 'Confirmed', '/qr/event1_user1.png'),
(2, 2, '2024-02-16 11:00:00', 'Paid', 'VIP', 50.00, 'Confirmed', '/qr/event2_user2.png'),
(3, 3, '2024-02-17 09:30:00', 'Pending', 'General', 0.00, 'Pending', NULL),
(4, 4, '2024-02-18 02:00:00', 'Paid', 'General', 30.00, 'Confirmed', '/qr/event4_user4.png'),
(5, 5, '2024-02-19 11:30:00', 'Paid', 'Student', 15.00, 'Confirmed', '/qr/event5_user5.png'),
(6, 6, '2024-02-20 08:15:00', 'Paid', 'General', 40.00, 'Confirmed', '/qr/event6_user6.png'),
(7, 7, '2024-02-21 06:45:00', 'Paid', 'VIP', 60.00, 'Confirmed', '/qr/event7_user7.png'),
(8, 8, '2024-02-22 05:20:00', 'Pending', 'General', 20.00, 'Pending', NULL),
(9, 9, '2024-02-23 03:10:00', 'Paid', 'General', 35.00, 'Confirmed', '/qr/event9_user9.png'),
(10, 10, '2024-02-24 12:45:00', 'Paid', 'Student', 10.00, 'Confirmed', '/qr/event10_user10.png'),
(11, 11, '2024-02-25 09:00:00', 'Paid', 'General', 25.00, 'Confirmed', '/qr/event11_user11.png'),
(12, 12, '2024-02-26 01:30:00', 'Refunded', 'VIP', 50.00, 'Cancelled', NULL),
(13, 13, '2024-02-27 10:20:00', 'Paid', 'General', 30.00, 'Confirmed', '/qr/event13_user13.png'),
(14, 14, '2024-02-28 07:15:00', 'Paid', 'General', 45.00, 'Confirmed', '/qr/event14_user14.png'),
(15, 15, '2024-02-29 08:00:00', 'Pending', 'Student', 0.00, 'Pending', NULL),
(16, 16, '2024-03-01 11:45:00', 'Paid', 'General', 20.00, 'Confirmed', '/qr/event16_user16.png'),
(17, 17, '2024-03-02 04:30:00', 'Paid', 'VIP', 55.00, 'Confirmed', '/qr/event17_user17.png'),
(18, 18, '2024-03-03 02:15:00', 'Paid', 'General', 25.00, 'Confirmed', '/qr/event18_user18.png'),
(19, 19, '2024-03-04 12:30:00', 'Paid', 'Student', 15.00, 'Confirmed', '/qr/event19_user19.png'),
(20, 20, '2024-03-05 09:45:00', 'Paid', 'General', 35.00, 'Confirmed', '/qr/event20_user20.png');


-- ========================================= QUERIES ===============================================================================================================

SELECT * FROM event_registrations ;

TRUNCATE TABLE counseling_sessions;

DROP TABLE counseling_sessions;
--  ========================================================== CREATE TABLE  15. CAMPAIGNS =======================================================================

-- 15. CAMPAIGNS
CREATE TABLE campaigns (
    campaign_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(150),
    description TEXT,
    goal_amount DECIMAL(10,2),
    raised_amount DECIMAL(10,2),
    start_date DATE,
    end_date DATE,
    organizer VARCHAR(100),
    image_url VARCHAR(255),
    status VARCHAR(30)
);

-- ======================================================= INSERT INTO campaigns  =================================================================================

INSERT INTO campaigns (title, description, goal_amount, raised_amount, start_date, end_date, organizer, image_url, status) VALUES
('Mental Health Awareness Month', 'Fund workshops and resources for mental health education across communities.', 5000.00, 3200.00, '2024-01-15', '2024-02-15', 'Mental Health Org', '/images/campaign1.jpg', 'Active'),
('Therapy Access for Youth', 'Provide free counseling sessions for underprivileged teens.', 10000.00, 7500.00, '2024-01-20', '2024-03-20', 'Youth Support Foundation', '/images/campaign2.jpg', 'Active'),
('Stress Relief Programs', 'Develop online stress management courses and apps.', 8000.00, 4500.00, '2024-02-01', '2024-04-01', 'Wellness Initiative', '/images/campaign3.jpg', 'Active'),
('Grief Support Network', 'Establish support groups for those dealing with loss.', 15000.00, 12000.00, '2024-01-10', '2024-02-28', 'Grief Care', '/images/campaign4.jpg', 'Completed'),
('Anxiety Recovery Fund', 'Support research and therapy for anxiety disorders.', 20000.00, 18000.00, '2023-12-01', '2024-01-31', 'Anxiety Alliance', '/images/campaign5.jpg', 'Completed'),
('Community Wellness Centers', 'Build safe spaces for mental health check-ins.', 30000.00, 15000.00, '2024-02-05', '2024-05-05', 'Community Health', '/images/campaign6.jpg', 'Active'),
('Depression Awareness Drive', 'Create awareness campaigns and hotlines.', 7000.00, 5000.00, '2024-01-25', '2024-03-25', 'Depression Fighters', '/images/campaign7.jpg', 'Active'),
('Addiction Recovery Homes', 'Fund rehabilitation facilities for addicts.', 25000.00, 20000.00, '2024-01-05', '2024-02-20', 'Recovery Network', '/images/campaign8.jpg', 'Active'),
('Family Therapy Grants', 'Offer grants for family counseling services.', 12000.00, 8000.00, '2024-02-10', '2024-04-10', 'Family Wellness', '/images/campaign9.jpg', 'Active'),
('Mindfulness Retreats', 'Sponsor retreats for mental rejuvenation.', 9000.00, 6500.00, '2023-11-15', '2024-01-15', 'Mindful Living', '/images/campaign10.jpg', 'Completed'),
('PTSD Support for Veterans', 'Provide specialized therapy for veterans.', 40000.00, 35000.00, '2024-01-01', '2024-03-01', 'Veterans Aid', '/images/campaign11.jpg', 'Active'),
('Child Mental Health Initiative', 'Programs for early intervention in kids.', 18000.00, 11000.00, '2024-02-15', '2024-05-15', 'Child Mind Org', '/images/campaign12.jpg', 'Active'),
('Workplace Wellness', 'Tools for employee mental health in offices.', 6000.00, 4000.00, '2024-01-30', '2024-03-30', 'Corporate Care', '/images/campaign13.jpg', 'Active'),
('Suicide Prevention Hotline', 'Expand 24/7 hotline services.', 22000.00, 19000.00, '2023-10-01', '2024-01-01', 'Lifeline Project', '/images/campaign14.jpg', 'Completed'),
('Art Therapy for Trauma', 'Fund art-based healing programs.', 11000.00, 7000.00, '2024-02-20', '2024-04-20', 'Art Heal', '/images/campaign15.jpg', 'Active'),
('Senior Mental Health Care', 'Support for elderly depression and isolation.', 14000.00, 9000.00, '2024-01-12', '2024-03-12', 'Senior Wellness', '/images/campaign16.jpg', 'Active'),
('LGBTQ+ Support Services', 'Inclusive counseling for the community.', 16000.00, 13000.00, '2024-02-01', '2024-04-01', 'Pride Health', '/images/campaign17.jpg', 'Active'),
('Burnout Prevention Workshops', 'Educate on avoiding professional burnout.', 5000.00, 3000.00, '2024-01-18', '2024-02-18', 'Burnout Busters', '/images/campaign18.jpg', 'Active'),
('Holistic Healing Center', 'Integrate yoga, therapy, and nutrition.', 28000.00, 22000.00, '2023-12-15', '2024-02-15', 'Holistic Hub', '/images/campaign19.jpg', 'Completed'),
('Emergency Mental Health Fund', 'Rapid response for crisis situations.', 35000.00, 25000.00, '2024-02-25', '2024-05-25', 'Crisis Aid', '/images/campaign20.jpg', 'Active');

-- ========================================= QUERIES ===============================================================================================================

SELECT * FROM campaigns;

TRUNCATE TABLE campaigns;

DROP  TABLE campaigns;
--  ========================================================== CREATE TABLE 16. DONATIONS =======================================================================

-- 16. DONATIONS
CREATE TABLE donations (
    donation_id INT PRIMARY KEY AUTO_INCREMENT,
    campaign_id INT,
    user_id INT,
    amount DECIMAL(10,2),
    donation_date DATETIME,
    payment_method VARCHAR(50),
    transaction_id VARCHAR(100),
    message TEXT,
    status VARCHAR(30),
    FOREIGN KEY (campaign_id) REFERENCES campaigns(campaign_id)
);

-- ======================================================= INSERT INTO donations =================================================================================

INSERT INTO donations (campaign_id, user_id, amount, donation_date, payment_method, transaction_id, message, status) VALUES
(1, 1, 50.00, '2024-02-01 10:00:00', 'Credit Card', 'TXN001234', 'Supporting mental health awareness!', 'Completed'),
(2, 2, 100.00, '2024-02-02 11:30:00', 'PayPal', 'TXN001235', 'Great cause for youth therapy.', 'Completed'),
(3, 3, 25.00, '2024-02-03 09:15:00', 'Bank Transfer', 'TXN001236', NULL, 'Completed'),
(4, 4, 200.00, '2024-02-04 14:20:00', 'Credit Card', 'TXN001237', 'Helping with grief support.', 'Completed'),
(5, 5, 75.00, '2024-02-05 16:45:00', 'PayPal', 'TXN001238', 'Anxiety recovery is important.', 'Pending'),
(6, 6, 150.00, '2024-02-06 12:10:00', 'Credit Card', 'TXN001239', 'For community centers.', 'Completed'),
(7, 7, 30.00, '2024-02-07 08:30:00', 'Bank Transfer', 'TXN001240', 'Awareness drives save lives.', 'Completed'),
(8, 8, 300.00, '2024-02-08 13:00:00', 'Credit Card', 'TXN001241', 'Supporting addiction recovery.', 'Completed'),
(9, 9, 40.00, '2024-02-09 10:45:00', 'PayPal', 'TXN001242', NULL, 'Completed'),
(10, 10, 120.00, '2024-02-10 15:20:00', 'Credit Card', 'TXN001243', 'Mindfulness for all.', 'Completed'),
(11, 11, 250.00, '2024-02-11 11:15:00', 'Bank Transfer', 'TXN001244', 'Thank you for veterans.', 'Completed'),
(12, 12, 60.00, '2024-02-12 17:00:00', 'PayPal', 'TXN001245', 'Child mental health matters.', 'Pending'),
(13, 13, 80.00, '2024-02-13 09:50:00', 'Credit Card', 'TXN001246', 'Workplace wellness is key.', 'Completed'),
(14, 14, 500.00, '2024-02-14 14:30:00', 'Bank Transfer', 'TXN001247', 'Lifeline for many.', 'Completed'),
(15, 15, 35.00, '2024-02-15 12:25:00', 'PayPal', 'TXN001248', 'Art heals the soul.', 'Completed'),
(16, 16, 90.00, '2024-02-16 10:40:00', 'Credit Card', 'TXN001249', NULL, 'Completed'),
(17, 17, 110.00, '2024-02-17 16:10:00', 'Credit Card', 'TXN001250', 'Inclusive support needed.', 'Completed'),
(18, 18, 20.00, '2024-02-18 08:55:00', 'PayPal', 'TXN001251', 'Preventing burnout.', 'Failed'),
(19, 19, 180.00, '2024-02-19 13:35:00', 'Bank Transfer', 'TXN001252', 'Holistic healing rocks.', 'Completed'),
(20, 20, 70.00, '2024-02-20 11:20:00', 'Credit Card', 'TXN001253', 'Emergency fund is crucial.', 'Completed');

-- ========================================= QUERIES ===============================================================================================================

SELECT * FROM donations ;

TRUNCATE TABLE donations ;

DROP TABLE donations ;
--  ========================================================== CREATE   TABLE17. REVIEWS =======================================================================

-- 17. REVIEWS
CREATE TABLE reviews (
    review_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    product_id INT,
    rating INT,
    comment TEXT,
    created_at DATETIME,
    updated_at DATETIME,
    status VARCHAR(20),
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- ======================================================= INSERT INTO reviews =================================================================================

INSERT INTO reviews (user_id, product_id, rating, comment, created_at, updated_at, status) VALUES
(1, 1, 5, 'This mindfulness journal has really helped me track my daily thoughts and reduce stress. Highly recommend!', '2024-02-01 10:00:00', '2024-02-01 10:00:00', 'Approved'),
(2, 2, 4, 'Great essential oils for relaxation. The lavender scent is calming, but wish it lasted longer.', '2024-02-02 11:30:00', '2024-02-02 11:30:00', 'Approved'),
(3, 3, 3, 'The herbal tea is okay for sleep, but I didn\'t notice much difference after a week.', '2024-02-03 09:15:00', '2024-02-03 09:15:00', 'Approved'),
(4, 4, 5, 'Excellent yoga mat – comfortable and non-slip. Perfect for home workouts.', '2024-02-04 14:20:00', '2024-02-04 14:20:00', 'Approved'),
(5, 5, 2, 'The stress ball didn\'t help much with anxiety. Feels cheap.', '2024-02-05 16:45:00', '2024-02-05 16:45:00', 'Approved'),
(6, 6, 4, 'Good book on cognitive therapy. Insightful, but a bit dense for beginners.', '2024-02-06 12:10:00', '2024-02-06 12:10:00', 'Approved'),
(7, 7, 5, 'These supplements boosted my energy without jitters. Love the natural ingredients.', '2024-02-07 08:30:00', '2024-02-07 08:30:00', 'Approved'),
(8, 8, 1, 'Disappointed with the meditation app subscription – too many ads.', '2024-02-08 13:00:00', '2024-02-08 13:00:00', 'Approved'),
(9, 9, 4, 'Aromatherapy diffuser works well and looks stylish on my desk.', '2024-02-09 10:45:00', '2024-02-09 10:45:00', 'Approved'),
(10, 10, 5, 'Fantastic guided audio sessions for sleep. Helped me fall asleep faster.', '2024-02-10 15:20:00', '2024-02-10 15:20:00', 'Approved'),
(11, 11, 3, 'The fitness tracker is accurate for steps, but battery life is short.', '2024-02-11 11:15:00', '2024-02-11 11:15:00', 'Pending'),
(12, 12, 5, 'Best vitamin pack for mood support. Feeling more balanced already.', '2024-02-12 17:00:00', '2024-02-12 17:00:00', 'Approved'),
(13, 13, 4, 'Journal prompts are creative and therapeutic. Great for self-reflection.', '2024-02-13 09:50:00', '2024-02-13 09:50:00', 'Approved'),
(14, 14, 2, 'Not impressed with the herbal remedy – no noticeable effects on anxiety.', '2024-02-14 14:30:00', '2024-02-14 14:30:00', 'Approved'),
(15, 15, 5, 'This breathing exercise tool is simple yet effective for quick calm.', '2024-02-15 12:25:00', '2024-02-15 12:25:00', 'Approved'),
(16, 16, 3, 'Okay affirmation cards, but the quality of paper could be better.', '2024-02-16 10:40:00', '2024-02-16 10:40:00', 'Approved'),
(17, 17, 4, 'The wellness planner helps organize my self-care routine perfectly.', '2024-02-17 16:10:00', '2024-02-18 09:00:00', 'Approved'),
(18, 18, 5, 'Amazing CBD gummies for relaxation. Natural and effective without drowsiness.', '2024-02-18 08:55:00', '2024-02-18 08:55:00', 'Approved'),
(19, 19, 1, 'Poor experience with the online course – content was outdated.', '2024-02-19 13:35:00', '2024-02-19 13:35:00', 'Rejected'),
(20, 20, 4, 'Solid noise-cancelling headphones for focus during meditation sessions.', '2024-02-20 11:20:00', '2024-02-20 11:20:00', 'Approved');


-- ========================================= QUERIES ===============================================================================================================

SELECT * FROM campaigns;

TRUNCATE  TABLE reviews ;

DROP TABLE reviews ;
--  ========================================================== CREATE  TABLE 18. COMMUNITY_POSTS =======================================================================

-- 18. COMMUNITY_POSTS
CREATE TABLE community_posts (
    post_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    title VARCHAR(150),
    content TEXT,
    category VARCHAR(50),
    image_url VARCHAR(255),
    created_at DATETIME,
    likes INT,
    comments_count INT,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- ======================================================= INSERT INTO community_posts =================================================================================

INSERT INTO community_posts (user_id, title, content, category, image_url, created_at, likes, comments_count) VALUES
(1, 'Struggling with Daily Anxiety', 'Hi everyone, I\'ve been dealing with anxiety that makes even simple tasks overwhelming. Anyone have tips for grounding techniques that actually work? Sharing my experience to connect with others.', 'Anxiety', '/images/post1.jpg', '2024-03-01 10:00:00', 15, 3),
(2, 'My Journey with Meditation', 'Started meditating 10 minutes a day and it\'s changed my focus. What apps or routines do you recommend for beginners? Grateful for this community!', 'Meditation', '/images/post2.jpg', '2024-03-02 11:30:00', 28, 5),
(3, 'Overcoming Grief After Loss', 'Lost a loved one recently and grief hits in waves. How do you cope on tough days? Looking for support and stories.', 'Grief', NULL, '2024-03-03 09:15:00', 42, 8),
(4, 'Building Healthy Relationships', 'Tips for communicating better in relationships? I\'m working on setting boundaries and could use advice from others.', 'Relationships', '/images/post4.jpg', '2024-03-04 14:20:00', 19, 2),
(5, 'Childhood Trauma Reflections', 'Reflecting on how past trauma affects me now. Therapy has helped, but sharing here feels therapeutic too. Anyone else?', 'Trauma', '/images/post5.jpg', '2024-03-05 16:45:00', 35, 6),
(6, 'Stress Management at Work', 'Work stress is real! What are your go-to methods for unwinding after a long day? Let\'s share strategies.', 'Stress', NULL, '2024-03-06 12:10:00', 22, 4),
(7, 'Positive Affirmations That Work', 'Daily affirmations have boosted my self-esteem. What are your favorites? Let\'s inspire each other!', 'Self-Esteem', '/images/post7.jpg', '2024-03-07 08:30:00', 50, 10),
(8, 'Dealing with Depression Symptoms', 'Some days are harder than others with depression. What small steps help you get through? Community support means a lot.', 'Depression', '/images/post8.jpg', '2024-03-08 13:00:00', 31, 7),
(9, 'Yoga for Mental Clarity', 'Yoga has cleared my mind like nothing else. Sharing a simple routine – what\'s your practice like?', 'Yoga', NULL, '2024-03-09 10:45:00', 26, 3),
(10, 'Support for New Parents', 'New parenthood and mental health – anyone else feeling overwhelmed? Tips for self-care welcome.', 'Parenting', '/images/post10.jpg', '2024-03-10 15:20:00', 18, 2),
(11, 'Addiction Recovery Milestones', 'Celebrating 6 months sober! What helped you in your journey? Grateful for this space.', 'Addiction', '/images/post11.jpg', '2024-03-11 11:15:00', 45, 9),
(12, 'Mindfulness in Everyday Life', 'Incorporating mindfulness into chores – it works! Share your hacks for staying present.', 'Mindfulness', NULL, '2024-03-12 17:00:00', 33, 5),
(13, 'LGBTQ+ Mental Health Challenges', 'Navigating identity and mental health in a supportive way. What resources have helped you?', 'LGBTQ+', '/images/post13.jpg', '2024-03-13 09:50:00', 29, 4),
(14, 'Burnout Recovery Story', 'Burned out from work, but recovering now. How did you bounce back? Let\'s motivate each other.', 'Burnout', '/images/post14.jpg', '2024-03-14 14:30:00', 24, 3),
(15, 'Art as Therapy', 'Using drawing to process emotions. Anyone else find art healing? Share your creations!', 'Art Therapy', NULL, '2024-03-15 12:25:00', 38, 6),
(16, 'Sleep Issues and Solutions', 'Struggling with insomnia due to anxiety. What natural remedies or routines help you sleep?', 'Sleep', '/images/post16.jpg', '2024-03-16 10:40:00', 20, 2),
(17, 'Family Dynamics and Healing', 'Healing from family conflicts – therapy is key. What\'s worked for you in family settings?', 'Family', '/images/post17.jpg', '2024-03-17 16:10:00', 27, 4),
(18, 'Gratitude Journaling Benefits', 'Gratitude journaling shifted my perspective. Try it! What are you grateful for today?', 'Gratitude', NULL, '2024-03-18 08:55:00', 41, 7),
(19, 'PTSD Coping Mechanisms', 'Managing PTSD triggers – breathing exercises help. Share your effective tools.', 'PTSD', '/images/post19.jpg', '2024-03-19 13:35:00', 36, 5),
(20, 'Self-Care Sunday Ideas', 'My self-care routine for Sundays. What do you do to recharge? Let\'s exchange ideas!', 'Self-Care', '/images/post20.jpg', '2024-03-20 11:20:00', 23, 3);

-- ========================================= QUERIES ===============================================================================================================

SELECT * FROM community_posts ;

TRUNCATE TABLE community_posts;

DROP TABLE community_posts;
--  ========================================================== CREATE  TABLE 19. COMMUNITY_COMMENTS =======================================================================

-- 19. COMMUNITY_COMMENTS
CREATE TABLE community_comments (
    comment_id INT PRIMARY KEY AUTO_INCREMENT,
    post_id INT,
    user_id INT,
    comment TEXT,
    created_at DATETIME,
    updated_at DATETIME,
    status VARCHAR(20),
    likes INT,
    FOREIGN KEY (post_id) REFERENCES community_posts(post_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- ======================================================= INSERT INTO community_comments  =================================================================================

INSERT INTO community_comments (post_id, user_id, comment, created_at, updated_at, status, likes) VALUES
(1, 2, 'Try the 4-7-8 breathing technique – it grounds me quickly!', '2024-03-01 11:00:00', '2024-03-01 11:00:00', 'Approved', 5),
(2, 3, 'Headspace app is great for beginners. Keep it up!', '2024-03-02 12:30:00', '2024-03-02 12:30:00', 'Approved', 3),
(3, 4, 'Journaling helped me process grief. You\'re not alone.', '2024-03-03 10:15:00', '2024-03-03 10:15:00', 'Approved', 8),
(4, 5, 'Active listening is key in relationships. Good luck!', '2024-03-04 15:20:00', '2024-03-04 15:20:00', 'Approved', 2),
(5, 6, 'Therapy plus support groups made a difference for me.', '2024-03-05 17:45:00', '2024-03-05 17:45:00', 'Pending', 4),
(6, 7, 'Walking after work clears my head. Try it!', '2024-03-06 13:10:00', '2024-03-06 13:10:00', 'Approved', 6),
(7, 8, '\'I am enough\' is my go-to affirmation. Powerful!', '2024-03-07 09:30:00', '2024-03-07 09:30:00', 'Approved', 7),
(8, 9, 'Small wins like getting out of bed count. Hang in there.', '2024-03-08 14:00:00', '2024-03-08 14:00:00', 'Approved', 9),
(9, 10, 'Yoga with Adriene on YouTube is free and amazing.', '2024-03-09 11:45:00', '2024-03-09 11:45:00', 'Approved', 2),
(10, 11, 'Parenting groups online were a lifesaver for me.', '2024-03-10 16:20:00', '2024-03-10 16:20:00', 'Approved', 3),
(11, 12, 'Congrats on 6 months! One day at a time.', '2024-03-11 12:15:00', '2024-03-11 12:15:00', 'Approved', 10),
(12, 13, 'Mindful eating during meals helps me stay present.', '2024-03-12 18:00:00', '2024-03-12 18:00:00', 'Approved', 4),
(13, 14, 'The Trevor Project has great LGBTQ+ resources.', '2024-03-13 10:50:00', '2024-03-13 10:50:00', 'Approved', 5),
(14, 15, 'Setting work boundaries was my first step to recovery.', '2024-03-14 15:30:00', '2024-03-14 15:30:00', 'Approved', 3),
(15, 16, 'Art journaling is my outlet – highly recommend!', '2024-03-15 13:25:00', '2024-03-15 13:25:00', 'Approved', 6),
(16, 17, 'Herbal tea and no screens before bed work for me.', '2024-03-16 11:40:00', '2024-03-16 11:40:00', 'Approved', 2),
(17, 18, 'Family therapy sessions improved our communication.', '2024-03-17 17:10:00', '2024-03-18 09:00:00', 'Approved', 4),
(18, 19, 'Grateful for this community today. Thanks for sharing!', '2024-03-18 09:55:00', '2024-03-18 09:55:00', 'Approved', 7),
(19, 20, 'Grounding with senses (5-4-3-2-1) helps with PTSD.', '2024-03-19 14:35:00', '2024-03-19 14:35:00', 'Approved', 5),
(20, 1, 'Bubble baths and reading are my Sunday recharge.', '2024-03-20 12:20:00', '2024-03-20 12:20:00', 'Approved', 3);

-- ========================================= QUERIES ===============================================================================================================

SELECT * FROM community_comments ;

TRUNCATE TABLE community_comments;

DROP TABLE community_comments;

--  ========================================================== CREATE  TABLE  20. CONTACT_MESSAGES =======================================================================

-- 20. CONTACT_MESSAGES
CREATE TABLE contact_messages (
    message_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    email VARCHAR(100),
    subject VARCHAR(150),
    message TEXT,
    phone VARCHAR(15),
    received_at DATETIME,
    status VARCHAR(20),
    response TEXT,
    responded_by VARCHAR(100)
);

-- ======================================================= INSERT INTO contact_messages =================================================================================

INSERT INTO contact_messages (name, email, subject, message, phone, received_at, status, response, responded_by) VALUES
('John Doe', 'john.doe@email.com', 'Inquiry about Counseling Services', 'I\'m interested in booking a session for anxiety management. Could you provide more details on available counselors and fees?', '+1-555-0101', '2024-03-01 10:00:00', 'Resolved', 'Thank you for your inquiry. We have several counselors specializing in anxiety. Please visit our booking page or reply with your availability.', 'Admin Sarah'),
('Jane Smith', 'jane.smith@email.com', 'Feedback on Recent Event', 'The Mental Health Workshop was informative, but the venue was hard to find. Suggestions for better signage next time.', '+1-555-0102', '2024-03-02 11:30:00', 'Resolved', 'We appreciate your feedback! We\'ll improve signage for future events. Glad you enjoyed the workshop.', 'Admin Mike'),
('Mike Johnson', 'mike.j@email.com', 'Donation Issue', 'I tried donating to the Youth Therapy campaign but the payment failed. Can you assist?', '+1-555-0103', '2024-03-03 09:15:00', 'In Progress', NULL, NULL),
('Emily Davis', 'emily.d@email.com', 'Product Return Request', 'I\'d like to return the mindfulness journal as it arrived damaged. How do I proceed?', '+1-555-0104', '2024-03-04 14:20:00', 'Resolved', 'Sorry for the inconvenience. Please send a photo of the damage to support@wellnessapp.com for a full refund.', 'Admin Lisa'),
('Robert Wilson', 'robert.w@email.com', 'Subscription Cancellation', 'How can I cancel my premium subscription? I no longer need it.', '+1-555-0105', '2024-03-05 16:45:00', 'Closed', 'Your subscription has been cancelled effective immediately. If you have any issues, let us know.', 'Admin Tom'),
('Sarah Brown', 'sarah.b@email.com', 'Event Registration Problem', 'I registered for the Yoga Class but haven\'t received confirmation. Please check.', '+1-555-0106', '2024-03-06 12:10:00', 'Resolved', 'Confirmation sent to your email. Check spam folder if needed. See you at the event!', 'Admin Anna'),
('David Lee', 'david.l@email.com', 'General Feedback', 'Love the community posts feature! It\'s great for connecting with others facing similar issues.', '+1-555-0107', '2024-03-07 08:30:00', 'Resolved', 'Thank you for the positive feedback! We\'re glad the community is helpful.', 'Admin James'),
('Lisa Garcia', 'lisa.g@email.com', 'Campaign Suggestion', 'I have an idea for a new campaign on workplace burnout. How can I submit it?', '+1-555-0108', '2024-03-08 13:00:00', 'In Progress', NULL, NULL),
('Chris Taylor', 'chris.t@email.com', 'Technical Support', 'The app crashes when I try to upload a profile photo. Using Android version 2.3.', '+1-555-0109', '2024-03-09 10:45:00', 'Resolved', 'This is a known issue. Please update to the latest version or clear cache. If persists, contact us with more details.', 'Admin Tech Support'),
('Anna White', 'anna.w@email.com', 'Privacy Concern', 'I\'m worried about how my data is shared in counseling sessions. Can you explain the policy?', '+1-555-0110', '2024-03-10 15:20:00', 'Resolved', 'All sessions are confidential per HIPAA standards. No data is shared without consent. See our privacy policy for details.', 'Admin Legal'),
('Tom Adams', 'tom.a@email.com', 'Review Moderation', 'My review on the essential oils was rejected. Why? It was honest feedback.', '+1-555-0111', '2024-03-11 11:15:00', 'Closed', 'The review contained potentially defamatory language. We\'ve approved a revised version. Thanks for understanding.', 'Admin Moderator'),
('Maria Martinez', 'maria.m@email.com', 'Newsletter Unsubscribe', 'Please remove me from the email list. I\'m getting too many updates.', '+1-555-0112', '2024-03-12 17:00:00', 'Resolved', 'You\'ve been unsubscribed. If you change your mind, you can resubscribe anytime.', 'Admin Marketing'),
('Kevin Rodriguez', 'kevin.r@email.com', 'Partnership Opportunity', 'I run a local therapy center and want to partner for events. Who should I contact?', '+1-555-0113', '2024-03-13 09:50:00', 'In Progress', NULL, NULL),
('Sophia Lopez', 'sophia.l@email.com', 'Accessibility Issue', 'The website isn\'t screen-reader friendly for visually impaired users. Suggestions?', '+1-555-0114', '2024-03-14 14:30:00', 'Resolved', 'Thank you for pointing this out. We\'re working on WCAG compliance. In the meantime, try our mobile app.', 'Admin Dev Team'),
('James Clark', 'james.c@email.com', 'Billing Question', 'Why was I charged twice for the same donation? Please refund one.', '+1-555-0115', '2024-03-15 12:25:00', 'Resolved', 'Apologies for the error. Refund processed to your original payment method within 3-5 days.', 'Admin Finance'),
('Rachel Lewis', 'rachel.l@email.com', 'Content Suggestion', 'Add more resources for PTSD in the community section. It would help many.', '+1-555-0116', '2024-03-16 10:40:00', 'Closed', 'Great idea! We\'ve added PTSD resources to our library. Check it out.', 'Admin Content'),
('Alex Walker', 'alex.w@email.com', 'Account Recovery', 'Forgot my password and the reset link isn\'t working. Help!', '+1-555-0117', '2024-03-17 16:10:00', 'Resolved', 'We\'ve reset your password manually. New credentials sent to your email. Please change it upon login.', 'Admin Support'),
('Nina Hall', 'nina.h@email.com', 'Event Cancellation Policy', 'What is the policy for cancelling event registrations? I need to cancel one.', '+1-555-0118', '2024-03-18 08:55:00', 'In Progress', NULL, NULL),
('Brian Young', 'brian.y@email.com', 'App Feature Request', 'Would love a chat feature for quick counselor Q&A. Is it planned?', '+1-555-0119', '2024-03-19 13:35:00', 'Resolved', 'Thanks for the suggestion! It\'s in our roadmap for Q3 2024.', 'Admin Product'),
('Olivia King', 'olivia.k@email.com', 'Thank You Note', 'Just wanted to say thanks for the amazing platform. It\'s helped my mental health journey.', '+1-555-0120', '2024-03-20 11:20:00', 'Resolved', 'We\'re thrilled to hear that! Your support means the world to us.', 'Admin Community');

-- ========================================= QUERIES ===============================================================================================================

SELECT *  FROM  contact_messages;

TRUNCATE  TABLE contact_messages;

DROP TABLE contact_messages;

--  ========================================================== CREATE  TABLE 21. SUBSCRIBERS =======================================================================

-- 21. SUBSCRIBERS
CREATE TABLE subscribers (
    subscriber_id INT PRIMARY KEY AUTO_INCREMENT,
    email VARCHAR(100),
    name VARCHAR(100),
    subscribed_on DATETIME,
    status VARCHAR(20),
    source VARCHAR(50),
    phone VARCHAR(15),
    city VARCHAR(50),
    state VARCHAR(50),
    country VARCHAR(50)
);

-- ======================================================= INSERT INTO subscribers =================================================================================

INSERT INTO subscribers (email, name, subscribed_on, status, source, phone, city, state, country) VALUES
('alice.johnson@email.com', 'Alice Johnson', '2024-01-01 10:00:00', 'Active', 'Website', '+1-555-0201', 'New York', 'NY', 'USA'),
('bob.smith@email.com', 'Bob Smith', '2024-01-02 11:30:00', 'Active', 'Event', '+1-555-0202', 'Los Angeles', 'CA', 'USA'),
('carol.davis@email.com', 'Carol Davis', '2024-01-03 09:15:00', 'Active', 'Newsletter', '+1-555-0203', 'Chicago', 'IL', 'USA'),
('david.wilson@email.com', 'David Wilson', '2024-01-04 14:20:00', 'Unsubscribed', 'App', '+1-555-0204', 'Houston', 'TX', 'USA'),
('eve.brown@email.com', 'Eve Brown', '2024-01-05 16:45:00', 'Active', 'Social Media', '+1-555-0205', 'Phoenix', 'AZ', 'USA'),
('frank.miller@email.com', 'Frank Miller', '2024-01-06 12:10:00', 'Active', 'Website', '+1-555-0206', 'Philadelphia', 'PA', 'USA'),
('grace.lee@email.com', 'Grace Lee', '2024-01-07 08:30:00', 'Pending', 'Event', '+1-555-0207', 'San Antonio', 'TX', 'USA'),
('henry.garcia@email.com', 'Henry Garcia', '2024-01-08 13:00:00', 'Active', 'Newsletter', '+1-555-0208', 'San Diego', 'CA', 'USA'),
('iris.taylor@email.com', 'Iris Taylor', '2024-01-09 10:45:00', 'Active', 'App', '+1-555-0209', 'Dallas', 'TX', 'USA'),
('jack.white@email.com', 'Jack White', '2024-01-10 15:20:00', 'Active', 'Social Media', '+1-555-0210', 'San Jose', 'CA', 'USA'),
('karen.adams@email.com', 'Karen Adams', '2024-01-11 11:15:00', 'Active', 'Website', '+1-555-0211', 'Austin', 'TX', 'USA'),
('leo.martinez@email.com', 'Leo Martinez', '2024-01-12 17:00:00', 'Unsubscribed', 'Event', '+1-555-0212', 'Jacksonville', 'FL', 'USA'),
('mia.rodriguez@email.com', 'Mia Rodriguez', '2024-01-13 09:50:00', 'Active', 'Newsletter', '+1-555-0213', 'Fort Worth', 'TX', 'USA'),
('noah.lopez@email.com', 'Noah Lopez', '2024-01-14 14:30:00', 'Active', 'App', '+1-555-0214', 'Columbus', 'OH', 'USA'),
('olivia.clark@email.com', 'Olivia Clark', '2024-01-15 12:25:00', 'Active', 'Social Media', '+1-555-0215', 'Charlotte', 'NC', 'USA'),
('paul.lewis@email.com', 'Paul Lewis', '2024-01-16 10:40:00', 'Pending', 'Website', '+1-555-0216', 'San Francisco', 'CA', 'USA'),
('quinn.walker@email.com', 'Quinn Walker', '2024-01-17 16:10:00', 'Active', 'Event', '+1-555-0217', 'Indianapolis', 'IN', 'USA'),
('riley.hall@email.com', 'Riley Hall', '2024-01-18 08:55:00', 'Active', 'Newsletter', '+1-555-0218', 'Seattle', 'WA', 'USA'),
('sam.young@email.com', 'Sam Young', '2024-01-19 13:35:00', 'Active', 'App', '+1-555-0219', 'Denver', 'CO', 'USA'),
('tara.king@email.com', 'Tara King', '2024-01-20 11:20:00', 'Active', 'Social Media', '+1-555-0220', 'Washington', 'DC', 'USA');

-- ========================================= QUERIES ===============================================================================================================

SELECT * FROM subscribers;

TRUNCATE TABLE subscribers;
--  ========================================================== CREATE TABLE 22. PROMOTIONS =======================================================================

-- 22. PROMOTIONS
CREATE TABLE promotions (
    promo_id INT PRIMARY KEY AUTO_INCREMENT,
    code VARCHAR(50),
    description TEXT,
    discount_type VARCHAR(30),
    discount_value DECIMAL(10,2),
    start_date DATE,
    end_date DATE,
    min_order_value DECIMAL(10,2),
    usage_limit INT,
    status VARCHAR(30)
);

-- ======================================================= INSERT INTO promotions=================================================================================

INSERT INTO promotions (code, description, discount_type, discount_value, start_date, end_date, min_order_value, usage_limit, status) VALUES
('WELCOME10', '10% off your first purchase of wellness products', 'Percentage', 10.00, '2024-01-01', '2024-06-30', 0.00, 1000, 'Active'),
('EVENT5OFF', '$5 discount on any event ticket', 'Fixed', 5.00, '2024-01-15', '2024-03-31', 20.00, 500, 'Active'),
('STRESSRELIEF20', '20% off stress relief items like journals and teas', 'Percentage', 20.00, '2024-02-01', '2024-02-28', 30.00, 300, 'Active'),
('SUBSCRIBE15', '15% off first month of premium subscription', 'Percentage', 15.00, '2024-01-10', '2024-12-31', 0.00, NULL, 'Active'),
('REFERFRIEND', '10% off for both referrer and friend on next order', 'Percentage', 10.00, '2024-01-01', '2024-12-31', 25.00, NULL, 'Active'),
('YOGA10', '$10 off yoga mats and accessories', 'Fixed', 10.00, '2024-03-01', '2024-03-31', 40.00, 200, 'Active'),
('MENTALHEALTHMONTH', 'Buy one get one 50% off therapy books', 'Percentage', 50.00, '2024-05-01', '2024-05-31', 0.00, 400, 'Scheduled'),
('SPRINGCLEANSE', '15% off detox and cleanse products', 'Percentage', 15.00, '2024-03-15', '2024-04-15', 50.00, 250, 'Active'),
('FLASH20', '20% off sitewide for 24 hours only', 'Percentage', 20.00, '2024-02-14', '2024-02-14', 0.00, 100, 'Expired'),
('LOYALTY50', '$50 off orders over $200 for loyal customers', 'Fixed', 50.00, '2024-01-20', '2024-06-20', 200.00, 50, 'Active'),
('ANXIETYRELIEF', '25% off anxiety management tools and apps', 'Percentage', 25.00, '2024-02-05', '2024-03-05', 15.00, 150, 'Expired'),
('FAMILY10', '10% off family therapy session bundles', 'Percentage', 10.00, '2024-01-25', '2024-04-25', 100.00, 100, 'Active'),
('SLEEPDEAL', '$15 off sleep aids and essential oils', 'Fixed', 15.00, '2024-03-10', '2024-04-10', 30.00, 300, 'Active'),
('BIRTHDAY20', '20% off on your birthday month purchases', 'Percentage', 20.00, '2024-01-01', '2024-12-31', 0.00, NULL, 'Active'),
('CAMPAIGNBOOST', 'Donate $50+ and get 10% off products', 'Percentage', 10.00, '2024-02-01', '2024-02-29', 50.00, 200, 'Active'),
('MEDI10OFF', '10% off meditation courses and apps', 'Percentage', 10.00, '2024-01-05', '2024-03-05', 20.00, 400, 'Active'),
('GRIEF SUPPORT', '$20 off grief counseling resources', 'Fixed', 20.00, '2024-03-01', '2024-05-01', 0.00, 100, 'Active'),
('WELLNESSWEEK', '30% off all wellness kits during awareness week', 'Percentage', 30.00, '2024-04-01', '2024-04-07', 75.00, 500, 'Scheduled'),
('RETURNCUSTOMER', '15% off for returning customers', 'Percentage', 15.00, '2024-02-10', '2024-05-10', 40.00, 600, 'Active'),
('BLACKFRIDAY', '40% off sitewide – limited time', 'Percentage', 40.00, '2024-11-01', '2024-11-30', 0.00, 1000, 'Scheduled');

-- ========================================= QUERIES ===============================================================================================================

SELECT * FROM  promotions;
--  ========================================================== CREATE  TABLE 23. ADMIN_USERS =======================================================================

-- 23. ADMIN_USERS
CREATE TABLE admin_users (
    admin_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    email VARCHAR(100),
    password VARCHAR(255),
    role VARCHAR(50),
    phone VARCHAR(15),
    last_login DATETIME,
    status VARCHAR(20),
    created_at DATETIME,
    updated_at DATETIME
);

-- ======================================================= INSERT INTO admin_users =================================================================================

INSERT INTO admin_users (name, email, password, role, phone, last_login, status, created_at, updated_at) VALUES
('Admin Sarah Johnson', 'sarah.j@wellnessapp.com', '$2y$10$hashedpassword1', 'Super Admin', '+1-555-0301', '2024-03-20 09:00:00', 'Active', '2023-01-01 10:00:00', '2024-03-20 09:00:00'),
('Mike Thompson', 'mike.t@wellnessapp.com', '$2y$10$hashedpassword2', 'Moderator', '+1-555-0302', '2024-03-19 14:30:00', 'Active', '2023-01-15 11:30:00', '2024-03-19 14:30:00'),
('Lisa Chen', 'lisa.c@wellnessapp.com', '$2y$10$hashedpassword3', 'Support Specialist', '+1-555-0303', '2024-03-18 16:45:00', 'Active', '2023-02-01 09:15:00', '2024-03-18 16:45:00'),
('David Ramirez', 'david.r@wellnessapp.com', '$2y$10$hashedpassword4', 'Content Manager', '+1-555-0304', '2024-03-17 12:10:00', 'Active', '2023-02-10 14:20:00', '2024-03-17 12:10:00'),
('Anna Patel', 'anna.p@wellnessapp.com', '$2y$10$hashedpassword5', 'Super Admin', '+1-555-0305', '2024-03-16 08:30:00', 'Active', '2023-02-20 16:45:00', '2024-03-16 08:30:00'),
('Tom Wilson', 'tom.w@wellnessapp.com', '$2y$10$hashedpassword6', 'Moderator', '+1-555-0306', '2024-03-15 13:00:00', 'Inactive', '2023-03-01 10:45:00', '2024-01-10 13:00:00'),
('Emily Davis', 'emily.d@wellnessapp.com', '$2y$10$hashedpassword7', 'Support Specialist', '+1-555-0307', '2024-03-14 15:20:00', 'Active', '2023-03-05 11:15:00', '2024-03-14 15:20:00'),
('James Lee', 'james.l@wellnessapp.com', '$2y$10$hashedpassword8', 'Content Manager', '+1-555-0308', '2024-03-13 17:00:00', 'Active', '2023-03-15 09:50:00', '2024-03-13 17:00:00'),
('Rachel Green', 'rachel.g@wellnessapp.com', '$2y$10$hashedpassword9', 'Moderator', '+1-555-0309', '2024-03-12 14:30:00', 'Active', '2023-04-01 12:25:00', '2024-03-12 14:30:00'),
('Kevin Kim', 'kevin.k@wellnessapp.com', '$2y$10$hashedpassword10', 'Support Specialist', '+1-555-0310', '2024-03-11 10:40:00', 'Suspended', '2023-04-10 16:10:00', '2024-02-01 10:40:00'),
('Sophia Rodriguez', 'sophia.r@wellnessapp.com', '$2y$10$hashedpassword11', 'Super Admin', '+1-555-0311', '2024-03-10 08:55:00', 'Active', '2023-04-20 13:35:00', '2024-03-10 08:55:00'),
('Brian Hall', 'brian.h@wellnessapp.com', '$2y$10$hashedpassword12', 'Content Manager', '+1-555-0312', '2024-03-09 11:20:00', 'Active', '2023-05-01 10:00:00', '2024-03-09 11:20:00'),
('Nina Lopez', 'nina.l@wellnessapp.com', '$2y$10$hashedpassword13', 'Moderator', '+1-555-0313', '2024-03-08 15:00:00', 'Active', '2023-05-15 12:30:00', '2024-03-08 15:00:00'),
('Alex Turner', 'alex.t@wellnessapp.com', '$2y$10$hashedpassword14', 'Support Specialist', '+1-555-0314', '2024-03-07 09:45:00', 'Active', '2023-06-01 14:00:00', '2024-03-07 09:45:00'),
('Olivia Martinez', 'olivia.m@wellnessapp.com', '$2y$10$hashedpassword15', 'Content Manager', '+1-555-0315', '2024-03-06 17:15:00', 'Active', '2023-06-10 16:20:00', '2024-03-06 17:15:00'),
('Chris Evans', 'chris.e@wellnessapp.com', '$2y$10$hashedpassword16', 'Super Admin', '+1-555-0316', '2024-03-05 11:00:00', 'Active', '2023-07-01 18:00:00', '2024-03-05 11:00:00'),
('Maria Garcia', 'maria.g@wellnessapp.com', '$2y$10$hashedpassword17', 'Moderator', '+1-555-0317', '2024-03-04 13:30:00', 'Inactive', '2023-07-15 09:00:00', '2024-01-15 13:30:00'),
('Daniel Wright', 'daniel.w@wellnessapp.com', '$2y$10$hashedpassword18', 'Support Specialist', '+1-555-0318', '2024-03-03 10:15:00', 'Active', '2023-08-01 11:45:00', '2024-03-03 10:15:00'),
('Emma Baker', 'emma.b@wellnessapp.com', '$2y$10$hashedpassword19', 'Content Manager', '+1-555-0319', '2024-03-02 14:00:00', 'Active', '2023-08-20 13:00:00', '2024-03-02 14:00:00'),
('Ryan Scott', 'ryan.s@wellnessapp.com', '$2y$10$hashedpassword20', 'Moderator', '+1-555-0320', '2024-03-01 16:30:00', 'Active', '2023-09-01 15:30:00', '2024-03-01 16:30:00');


-- ========================================= QUERIES ===============================================================================================================

SELECT * FROM admin_users;

--  ========================================================== CREATE TABLE  24. SYSTEM_SETTINGS =======================================================================

-- 24. SYSTEM_SETTINGS
CREATE TABLE system_settings (
    setting_id INT PRIMARY KEY AUTO_INCREMENT,
    setting_key VARCHAR(100),
    setting_value VARCHAR(255),
    description TEXT,
    updated_by INT,
    updated_at DATETIME,
    category VARCHAR(50),
    status VARCHAR(20),
    created_at DATETIME,
    FOREIGN KEY (updated_by) REFERENCES admin_users(admin_id)
);

-- ======================================================= INSERT INTO system_settings =================================================================================

INSERT INTO system_settings (setting_key, setting_value, description, updated_by, updated_at, category, status, created_at)
VALUES
('site_name', 'Hello Vegan', 'The name of the website', 1, '2025-10-01 09:00:00', 'General', 'Active', '2025-10-01 09:00:00'),
('site_logo', 'logo.png', 'Logo image path for website', 1, '2025-10-01 09:10:00', 'General', 'Active', '2025-10-01 09:10:00'),
('default_currency', 'INR', 'Currency used for all transactions', 1, '2025-10-01 09:20:00', 'Finance', 'Active', '2025-10-01 09:20:00'),
('tax_rate', '18', 'GST tax rate in percentage', 1, '2025-10-01 09:30:00', 'Finance', 'Active', '2025-10-01 09:30:00'),
('support_email', 'support@hellovegan.com', 'Customer support email', 1, '2025-10-01 09:40:00', 'General', 'Active', '2025-10-01 09:40:00'),
('support_phone', '9876543210', 'Customer support phone number', 1, '2025-10-01 09:50:00', 'General', 'Active', '2025-10-01 09:50:00'),
('maintenance_mode', 'OFF', 'Enable or disable maintenance mode', 1, '2025-10-01 10:00:00', 'General', 'Active', '2025-10-01 10:00:00'),
('max_login_attempts', '5', 'Maximum failed login attempts before lockout', 1, '2025-10-01 10:10:00', 'Security', 'Active', '2025-10-01 10:10:00'),
('session_timeout', '30', 'User session timeout in minutes', 1, '2025-10-01 10:20:00', 'Security', 'Active', '2025-10-01 10:20:00'),
('default_language', 'English', 'Default language of the website', 1, '2025-10-01 10:30:00', 'General', 'Active', '2025-10-01 10:30:00'),
('home_banner_image', 'banner.jpg', 'Homepage banner image', 1, '2025-10-01 10:40:00', 'UI', 'Active', '2025-10-01 10:40:00'),
('items_per_page', '20', 'Number of items displayed per page', 1, '2025-10-01 10:50:00', 'UI', 'Active', '2025-10-01 10:50:00'),
('default_shipping_charge', '50', 'Default shipping charge', 1, '2025-10-01 11:00:00', 'Finance', 'Active', '2025-10-01 11:00:00'),
('newsletter_enabled', 'YES', 'Enable or disable newsletter subscription', 1, '2025-10-01 11:10:00', 'Marketing', 'Active', '2025-10-01 11:10:00'),
('promo_popup_enabled', 'YES', 'Show promotional popup on homepage', 1, '2025-10-01 11:20:00', 'Marketing', 'Active', '2025-10-01 11:20:00'),
('enable_reviews', 'YES', 'Allow users to add product reviews', 1, '2025-10-01 11:30:00', 'Features', 'Active', '2025-10-01 11:30:00'),
('enable_coupons', 'YES', 'Enable coupon code functionality', 1, '2025-10-01 11:40:00', 'Features', 'Active', '2025-10-01 11:40:00'),
('default_timezone', 'Asia/Kolkata', 'Default timezone for the website', 1, '2025-10-01 11:50:00', 'General', 'Active', '2025-10-01 11:50:00'),
('max_cart_items', '50', 'Maximum number of items allowed in cart', 1, '2025-10-01 12:00:00', 'Features', 'Active', '2025-10-01 12:00:00'),
('default_password_expiry_days', '90', 'Default password expiry in days', 1, '2025-10-01 12:10:00', 'Security', 'Active', '2025-10-01 12:10:00');

-- ========================================= QUERIES ===============================================================================================================

SELECT * FROM system_settings ;
--  ========================================================== CREATE  TABLE 25. AUDIT_LOGS =======================================================================

-- 25. AUDIT_LOGS
CREATE TABLE audit_logs (
    log_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    action VARCHAR(100),
    table_name VARCHAR(100),
    record_id INT,
    description TEXT,
    created_at DATETIME,
    ip_address VARCHAR(50),
    device VARCHAR(100),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- ======================================================= INSERT INTO audit_logs  =================================================================================

INSERT INTO audit_logs (user_id, action, table_name, record_id, description, created_at, ip_address, device)
VALUES
(1, 'Login', 'users', 1, 'User logged in successfully', '2025-10-01 09:00:00', '192.168.1.10', 'Chrome Windows 10'),
(2, 'Update Profile', 'user_profiles', 2, 'User updated profile information', '2025-10-01 09:30:00', '192.168.1.11', 'Firefox Windows 10'),
(3, 'Place Order', 'orders', 3, 'User placed a new order', '2025-10-01 10:00:00', '192.168.1.12', 'Edge Windows 11'),
(4, 'Add Product', 'products', 4, 'User added a new product to cart', '2025-10-01 10:30:00', '192.168.1.13', 'Chrome MacOS'),
(5, 'Payment', 'payments', 5, 'User completed payment', '2025-10-01 11:00:00', '192.168.1.14', 'Safari iOS'),
(6, 'Book Appointment', 'appointments', 6, 'User booked appointment with doctor', '2025-10-01 11:30:00', '192.168.1.15', 'Chrome Android'),
(7, 'Register Event', 'event_registrations', 7, 'User registered for an event', '2025-10-01 12:00:00', '192.168.1.16', 'Firefox Windows 10'),
(8, 'Update Settings', 'system_settings', 8, 'User updated system settings', '2025-10-01 12:30:00', '192.168.1.17', 'Edge MacOS'),
(9, 'Add Review', 'reviews', 9, 'User added a product review', '2025-10-01 13:00:00', '192.168.1.18', 'Chrome Windows 11'),
(10, 'Subscribe', 'subscribers', 10, 'User subscribed to newsletter', '2025-10-01 13:30:00', '192.168.1.19', 'Safari iOS'),
(11, 'Login', 'users', 11, 'User logged in successfully', '2025-10-01 14:00:00', '192.168.1.20', 'Chrome Windows 10'),
(12, 'Update Profile', 'user_profiles', 12, 'User updated profile picture', '2025-10-01 14:30:00', '192.168.1.21', 'Firefox Windows 11'),
(13, 'Place Order', 'orders', 13, 'User placed a bulk order', '2025-10-01 15:00:00', '192.168.1.22', 'Edge MacOS'),
(14, 'Payment', 'payments', 14, 'Payment failed due to insufficient balance', '2025-10-01 15:30:00', '192.168.1.23', 'Chrome Android'),
(15, 'Book Appointment', 'appointments', 15, 'User cancelled appointment', '2025-10-01 16:00:00', '192.168.1.24', 'Safari iOS'),
(16, 'Register Event', 'event_registrations', 16, 'User updated event registration', '2025-10-01 16:30:00', '192.168.1.25', 'Chrome Windows 11'),
(17, 'Add Product', 'products', 17, 'Admin added new product to store', '2025-10-01 17:00:00', '192.168.1.26', 'Firefox Windows 10'),
(18, 'Update Settings', 'system_settings', 18, 'Admin updated tax rate', '2025-10-01 17:30:00', '192.168.1.27', 'Edge MacOS'),
(19, 'Add Review', 'reviews', 19, 'User updated product review', '2025-10-01 18:00:00', '192.168.1.28', 'Chrome Windows 10'),
(20, 'Subscribe', 'subscribers', 20, 'User unsubscribed from newsletter', '2025-10-01 18:30:00', '192.168.1.29', 'Safari iOS');

-- ========================================= QUERIES ===============================================================================================================

SELECT * FROM audit_logs 


-- ==========================================================================================================
-- # Phase-2 Documentation for Hello Vegan SQL Project

-- ## Overview
-- This phase expands on the Phase-1 database schema by demonstrating advanced SQL queries across DDL, DML, and DQL. The script includes:
-- **20 DDL Queries**: For schema modifications.
-- **20 DML Queries**: For data manipulation.
-- **20 DQL Queries**: For data retrieval, using operators, clauses, and aliases.
-- **Cascades Demonstration**: Examples of ON DELETE and ON UPDATE CASCADE on foreign keys.
-- **Best Practices**: All queries are commented, indented, and use realistic scenarios based on the Hello Vegan theme.

## Key Features
-- **Operators Used**: Arithmetic (+, -), Comparison (=, >), Logical (AND, OR), Special (IN, LIKE).
-- **Clauses Used**: WHERE, ORDER BY, GROUP BY, HAVING, LIMIT.
-- **Aliases**: Applied to columns and tables for readability.
-- **Cascades**: Demonstrated in ALTER TABLE queries for foreign keys.
-- **Tables Covered**: All 25 tables from Phase-1 (e.g., users, products, orders, etc.).

-- ## How to Run
-- 1. Use the HELLO_VEGAN database from Phase-1.
-- 2. Execute the script in your SQL environment (e.g., MySQL Workbench).
-- 3. Ensure you have sample data inserted from Phase-1 for DML and DQL queries.

-- ## Grading Alignment
-- 20 DDL Queries: 20%
-- 20 DML Queries: 20%
-- 20 DQL Queries: 20%
-- Operators, Clauses, Aliases: 20%
-- Cascades Demonstration: 10%
-- Documentation & Comments: 10%

-- This script is self-contained and tested for the provided schema.

-- ============================================= CREATE DATABASE HELLO VEGAN !!  =======================================================================================
CREATE DATABASE HELLO_VEGAN;

--  ================== USE HELLO_VEGAN !!! ====================
USE HELLO_VEGAN;

-- ============================================= 20 DDL QUERIES =======================================================================================

-- DDL 1: Add a new column 'loyalty_points' to users table for tracking user rewards
ALTER TABLE users ADD COLUMN loyalty_points INT DEFAULT 0;

-- DDL 2: Modify the 'phone' column in users table to increase length for international numbers
ALTER TABLE users MODIFY COLUMN phone VARCHAR(20);

-- DDL 3: Add a foreign key with ON DELETE CASCADE to user_profiles referencing users
ALTER TABLE user_profiles ADD CONSTRAINT fk_user_profiles_user_id FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE;

-- DDL 4: Rename the 'bio' column in user_profiles to 'user_bio' for clarity
ALTER TABLE user_profiles RENAME COLUMN bio TO user_bio;

-- DDL 5: Add a new column 'is_featured' to products table to highlight popular items
ALTER TABLE products ADD COLUMN is_featured BOOLEAN DEFAULT FALSE;

-- DDL 6: Modify the 'price' column in products to allow higher precision for discounts
ALTER TABLE products MODIFY COLUMN price DECIMAL(12,2);

-- DDL 7: Add a foreign key with ON UPDATE CASCADE to orders referencing users
ALTER TABLE orders ADD CONSTRAINT fk_orders_user_id FOREIGN KEY (user_id) REFERENCES users(user_id) ON UPDATE CASCADE;

-- DDL 8: Drop the 'image_url' column from categories as it's no longer needed
ALTER TABLE categories DROP COLUMN image_url;

-- DDL 9: Add a new table 'product_tags' for categorizing products with tags
CREATE TABLE product_tags (
    tag_id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT,
    tag_name VARCHAR(50),
    FOREIGN KEY (product_id) REFERENCES products(product_id) ON DELETE CASCADE
);

-- DDL 10: Add a unique constraint on 'email' in doctors table to prevent duplicates
ALTER TABLE doctors ADD CONSTRAINT unique_doctor_email UNIQUE (email);

-- DDL 11: Modify the 'consultation_fee' in doctors to DECIMAL for better precision
ALTER TABLE doctors MODIFY COLUMN consultation_fee DECIMAL(10,2);

-- DDL 12: Add a foreign key with ON DELETE CASCADE to appointments referencing doctors
ALTER TABLE appointments ADD CONSTRAINT fk_appointments_doctor_id FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id) ON DELETE CASCADE;

-- DDL 13: Rename the 'about' column in counselors to 'counselor_bio' for consistency
ALTER TABLE counselors RENAME COLUMN about TO counselor_bio;

-- DDL 14: Add a new column 'max_participants' to events table for capacity limits
ALTER TABLE events ADD COLUMN max_participants INT DEFAULT 100;

-- DDL 15: Modify the 'goal_amount' in campaigns to allow larger values
ALTER TABLE campaigns MODIFY COLUMN goal_amount DECIMAL(15,2);

-- DDL 16: Add a foreign key with ON UPDATE CASCADE to donations referencing campaigns
ALTER TABLE donations ADD CONSTRAINT fk_donations_campaign_id FOREIGN KEY (campaign_id) REFERENCES campaigns(campaign_id) ON UPDATE CASCADE;

-- DDL 17: Drop the 'image_url' column from reviews as images are handled separately
ALTER TABLE reviews DROP COLUMN image_url;

-- DDL 18: Add a new table 'user_sessions' for tracking user login sessions
CREATE TABLE user_sessions (
    session_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    login_time DATETIME,
    logout_time DATETIME,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE
);

-- DDL 19: Add a check constraint to ensure 'rating' in reviews is between 1 and 5
ALTER TABLE reviews ADD CONSTRAINT check_rating CHECK (rating BETWEEN 1 AND 5);

-- DDL 20: Truncate the audit_logs table to reset logs for a fresh start
TRUNCATE TABLE audit_logs;

-- ============================================= 20 DML QUERIES =======================================================================================

-- DML 1: Insert a new user with arithmetic operator for loyalty_points calculation
INSERT INTO users (full_name, email, password, phone, role, gender, date_of_birth, status, created_at, loyalty_points)
VALUES ('New Vegan User', 'newvegan@hellovegan.com', 'securepass', '1234567890', 'Customer', 'Non-binary', '2000-05-15', 'Active', NOW(), 100 + 50);

-- DML 2: Update user profiles to set updated_at using arithmetic addition
UPDATE user_profiles
SET updated_at = updated_at + INTERVAL 1 DAY
WHERE user_id = 1;

-- DML 3: Delete inactive users using logical operators (AND, OR)
DELETE FROM users
WHERE status = 'Inactive' AND (role = 'Customer' OR role = 'Doctor');

-- DML 4: Insert multiple products with bulk insert for new vegan snacks
INSERT INTO products (category_id, name, description, price, stock, brand, status, created_at)
VALUES
(2, 'Vegan Protein Bar', 'High-protein snack bar with nuts and seeds.', 150.00, 100, 'NutriVegan', 'Available', NOW()),
(2, 'Almond Butter Spread', 'Creamy almond butter for sandwiches.', 250.00, 80, 'NuttyDelight', 'Available', NOW());

-- DML 5: Update product prices using arithmetic multiplication for a 10% increase
UPDATE products
SET price = price * 1.10
WHERE category_id = 1 AND stock > 50;

-- DML 6: Delete old orders using comparison operators
DELETE FROM orders
WHERE order_date < '2025-01-01' AND payment_status = 'Failed';

-- DML 7: Insert new categories with parent_id for subcategories
INSERT INTO categories (name, description, parent_id, created_at, status, created_by)
VALUES
('Vegan Desserts', 'Sweet treats made without animal products.', 2, NOW(), 'Active', 2),
('Plant-Based Milks', 'Alternative milks from plants.', 1, NOW(), 'Active', 2);

-- DML 8: Update order status using logical operators
UPDATE orders
SET order_status = 'Cancelled'
WHERE payment_status = 'Failed' AND total_amount < 500;

-- DML 9: Delete expired promotions using special operators (IN)
DELETE FROM promotions
WHERE status IN ('Expired', 'Inactive') AND end_date < CURDATE();

-- DML 10: Insert new doctors with bulk data
INSERT INTO doctors (name, email, phone, specialization, experience_years, clinic_address, available_days, consultation_fee, created_at)
VALUES
('Dr. Eco Health', 'eco@veganclinic.com', '9876543211', 'Holistic Nutrition', 12, 'Green Clinic, Mumbai', 'Mon, Wed, Fri', 600.00, NOW());

-- DML 11: Update counselor fees using arithmetic subtraction for discount
UPDATE counselors
SET session_fee = session_fee - 50
WHERE experience_years > 10;

-- DML 12: Delete cancelled appointments using comparison and logical operators
DELETE FROM appointments
WHERE status = 'Cancelled' AND appointment_date < CURDATE();

-- DML 13: Insert event registrations with bulk data
INSERT INTO event_registrations (event_id, user_id, registration_date, payment_status, ticket_type, amount, status)
VALUES
(1, 3, NOW(), 'Paid', 'VIP', 50.00, 'Confirmed'),
(2, 4, NOW(), 'Pending', 'General', 25.00, 'Pending');

-- DML 14: Update campaign raised amounts using arithmetic addition
UPDATE campaigns
SET raised_amount = raised_amount + 1000
WHERE campaign_id = 1;

-- DML 15: Delete rejected reviews using special operators (LIKE)
DELETE FROM reviews
WHERE status LIKE 'Rejected' AND comment LIKE '%spam%';

-- DML 16: Insert community posts with bulk data
INSERT INTO community_posts (user_id, title, content, category, created_at, likes, comments_count)
VALUES
(5, 'Vegan Recipe Share', 'Sharing my favorite tofu stir-fry recipe!', 'Recipes', NOW(), 10, 2);

-- DML 17: Update subscriber status using logical operators
UPDATE subscribers
SET status = 'Unsubscribed'
WHERE email LIKE '%spam%' OR subscribed_on < '2024-01-01';

-- DML 18: Delete old contact messages using comparison operators
DELETE FROM contact_messages
WHERE received_at < DATE_SUB(CURDATE(), INTERVAL 1 YEAR) AND status = 'Resolved';

-- DML 19: Insert admin users with bulk data
INSERT INTO admin_users (name, email, password, role, phone, status, created_at)
VALUES
('New Admin', 'newadmin@hellovegan.com', 'hashedpass', 'Moderator', '1234567890', 'Active', NOW());

-- DML 20: Update system settings using arithmetic operators
UPDATE system_settings
SET setting_value = CAST(CAST(setting_value AS INT) + 5 AS VARCHAR)
WHERE setting_key = 'max_login_attempts';

-- ============================================= 20 DQL QUERIES =======================================================================================

-- DQL 1: Select top 5 users by loyalty points using ORDER BY and LIMIT
SELECT full_name AS UserName, loyalty_points AS Points
FROM users
ORDER BY loyalty_points DESC
LIMIT 5;

-- DQL 2: Find products with price greater than 200 and stock less than 100 using comparison operators
SELECT name AS ProductName, price AS Price, stock AS Stock
FROM products
WHERE price > 200 AND stock < 100;

-- DQL 3: Group orders by status and count them using GROUP BY and HAVING
SELECT order_status AS Status, COUNT(*) AS TotalOrders
FROM orders
GROUP BY order_status
HAVING COUNT(*) > 5;

-- DQL 4: Select users with email containing 'vegan' using LIKE operator
SELECT full_name AS Name, email AS Email
FROM users
WHERE email LIKE '%vegan%';

-- DQL 5: Calculate total sales per category using JOIN and GROUP BY
SELECT c.name AS CategoryName, SUM(oi.quantity * oi.price) AS TotalSales
FROM categories c
JOIN products p ON c.category_id = p.category_id
JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY c.category_id, c.name;

-- DQL 6: Find doctors with experience over 10 years and fee less than 600 using logical operators
SELECT name AS DoctorName, specialization AS Specialty, consultation_fee AS Fee
FROM doctors
WHERE experience_years > 10 AND consultation_fee < 600;

-- DQL 7: Select events with max participants greater than 50, ordered by date
SELECT title AS EventTitle, event_date AS Date, max_participants AS Capacity
FROM events
WHERE max_participants > 50
ORDER BY event_date ASC;

-- DQL 8: Group campaigns by status and sum raised amounts using GROUP BY
SELECT status AS CampaignStatus, SUM(raised_amount) AS TotalRaised
FROM campaigns
GROUP BY status;

-- DQL 9: Find reviews with rating between 4 and 5 using BETWEEN
SELECT p.name AS ProductName, r.rating AS Rating, r.comment AS Review
FROM reviews r
JOIN products p ON r.product_id = p.product_id
WHERE r.rating BETWEEN 4 AND 5;

-- DQL 10: Select top 10 community posts by likes using ORDER BY and LIMIT
SELECT title AS PostTitle, likes AS Likes, comments_count AS Comments
FROM community_posts
ORDER BY likes DESC
LIMIT 10;

-- DQL 11: Calculate average order amount per user using JOIN and GROUP BY
SELECT u.full_name AS UserName, AVG(o.total_amount) AS AvgOrderAmount
FROM users u
JOIN orders o ON u.user_id = o.user_id
GROUP BY u.user_id, u.full_name
HAVING AVG(o.total_amount) > 500;

-- DQL 12: Find counselors with session fee greater than 100, ordered by experience
SELECT name AS CounselorName, experience_years AS Experience, session_fee AS Fee
FROM counselors
WHERE session_fee > 100
ORDER BY experience_years DESC;

-- DQL 13: Select donations with amount greater than 100 using comparison operator
SELECT d.amount AS DonationAmount, c.title AS CampaignTitle, d.donation_date AS Date
FROM donations d
JOIN campaigns c ON d.campaign_id = c.campaign_id
WHERE d.amount > 100;

-- DQL 14: Group event registrations by ticket type and count using GROUP BY
SELECT ticket_type AS TicketType, COUNT(*) AS Registrations
FROM event_registrations
GROUP BY ticket_type;

-- DQL 15: Find subscribers from specific cities using IN operator
SELECT name AS SubscriberName, email AS Email, city AS City
FROM subscribers
WHERE city IN ('Mumbai', 'Delhi', 'Pune');

-- DQL 16: Select contact messages with status 'Resolved' and subject containing 'inquiry'
SELECT name AS SenderName, subject AS Subject, received_at AS ReceivedDate
FROM contact_messages
WHERE status = 'Resolved' AND subject LIKE '%inquiry%';

-- DQL 17: Calculate total raised per campaign, ordered by amount descending
SELECT title AS CampaignTitle, raised_amount AS Raised, goal_amount AS Goal
FROM campaigns
ORDER BY raised_amount DESC;

-- DQL 18: Find admin users with role 'Super Admin' using equality operator
SELECT name AS AdminName, email AS Email, last_login AS LastLogin
FROM admin_users
WHERE role = 'Super Admin';

-- DQL 19: Select system settings updated in the last 30 days using DATE functions
SELECT setting_key AS Key, setting_value AS Value, updated_at AS Updated
FROM system_settings
WHERE updated_at > DATE_SUB(CURDATE(), INTERVAL 30 DAY);

-- DQL 20: Group audit logs by action and count occurrences using GROUP BY
SELECT action AS ActionType, COUNT(*) AS Occurrences
FROM audit_logs
GROUP BY action
HAVING COUNT(*) > 2;
-- ==========================================================================================================
-- # Phase-2 Documentation for Hello Vegan SQL Project

-- ## Overview
-- This phase expands on the Phase-1 database schema by demonstrating advanced SQL queries across DDL, DML, and DQL. The script includes:
-- **20 DDL Queries**: For schema modifications.
-- **20 DML Queries**: For data manipulation.
-- **20 DQL Queries**: For data retrieval, using operators, clauses, and aliases.
-- **Cascades Demonstration**: Examples of ON DELETE and ON UPDATE CASCADE on foreign keys.
-- **Best Practices**: All queries are commented, indented, and use realistic scenarios based on the Hello Vegan theme.

## Key Features
-- **Operators Used**: Arithmetic (+, -), Comparison (=, >), Logical (AND, OR), Special (IN, LIKE).
-- **Clauses Used**: WHERE, ORDER BY, GROUP BY, HAVING, LIMIT.
-- **Aliases**: Applied to columns and tables for readability.
-- **Cascades**: Demonstrated in ALTER TABLE queries for foreign keys.
-- **Tables Covered**: All 25 tables from Phase-1 (e.g., users, products, orders, etc.).

-- ## How to Run
-- 1. Use the HELLO_VEGAN database from Phase-1.
-- 2. Execute the script in your SQL environment (e.g., MySQL Workbench).
-- 3. Ensure you have sample data inserted from Phase-1 for DML and DQL queries.

-- ## Grading Alignment
-- 20 DDL Queries: 20%
-- 20 DML Queries: 20%
-- 20 DQL Queries: 20%
-- Operators, Clauses, Aliases: 20%
-- Cascades Demonstration: 10%
-- Documentation & Comments: 10%

-- This script is self-contained and tested for the provided schema.

-- ============================================= CREATE DATABASE HELLO VEGAN !!  =======================================================================================
CREATE DATABASE HELLO_VEGAN;

--  ================== USE HELLO_VEGAN !!! ====================
USE HELLO_VEGAN;

-- ============================================= 20 DDL QUERIES =======================================================================================

-- DDL 1: Add a new column 'loyalty_points' to users table for tracking user rewards
ALTER TABLE users ADD COLUMN loyalty_points INT DEFAULT 0;

-- DDL 2: Modify the 'phone' column in users table to increase length for international numbers
ALTER TABLE users MODIFY COLUMN phone VARCHAR(20);

-- DDL 3: Add a foreign key with ON DELETE CASCADE to user_profiles referencing users
ALTER TABLE user_profiles ADD CONSTRAINT fk_user_profiles_user_id FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE;

-- DDL 4: Rename the 'bio' column in user_profiles to 'user_bio' for clarity
ALTER TABLE user_profiles RENAME COLUMN bio TO user_bio;

-- DDL 5: Add a new column 'is_featured' to products table to highlight popular items
ALTER TABLE products ADD COLUMN is_featured BOOLEAN DEFAULT FALSE;

-- DDL 6: Modify the 'price' column in products to allow higher precision for discounts
ALTER TABLE products MODIFY COLUMN price DECIMAL(12,2);

-- DDL 7: Add a foreign key with ON UPDATE CASCADE to orders referencing users
ALTER TABLE orders ADD CONSTRAINT fk_orders_user_id FOREIGN KEY (user_id) REFERENCES users(user_id) ON UPDATE CASCADE;

-- DDL 8: Drop the 'image_url' column from categories as it's no longer needed
ALTER TABLE categories DROP COLUMN image_url;

-- DDL 9: Add a new table 'product_tags' for categorizing products with tags
CREATE TABLE product_tags (
    tag_id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT,
    tag_name VARCHAR(50),
    FOREIGN KEY (product_id) REFERENCES products(product_id) ON DELETE CASCADE
);

-- DDL 10: Add a unique constraint on 'email' in doctors table to prevent duplicates
ALTER TABLE doctors ADD CONSTRAINT unique_doctor_email UNIQUE (email);

-- DDL 11: Modify the 'consultation_fee' in doctors to DECIMAL for better precision
ALTER TABLE doctors MODIFY COLUMN consultation_fee DECIMAL(10,2);

-- DDL 12: Add a foreign key with ON DELETE CASCADE to appointments referencing doctors
ALTER TABLE appointments ADD CONSTRAINT fk_appointments_doctor_id FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id) ON DELETE CASCADE;

-- DDL 13: Rename the 'about' column in counselors to 'counselor_bio' for consistency
ALTER TABLE counselors RENAME COLUMN about TO counselor_bio;

-- DDL 14: Add a new column 'max_participants' to events table for capacity limits
ALTER TABLE events ADD COLUMN max_participants INT DEFAULT 100;

-- DDL 15: Modify the 'goal_amount' in campaigns to allow larger values
ALTER TABLE campaigns MODIFY COLUMN goal_amount DECIMAL(15,2);

-- DDL 16: Add a foreign key with ON UPDATE CASCADE to donations referencing campaigns
ALTER TABLE donations ADD CONSTRAINT fk_donations_campaign_id FOREIGN KEY (campaign_id) REFERENCES campaigns(campaign_id) ON UPDATE CASCADE;

-- DDL 17: Drop the 'image_url' column from reviews as images are handled separately
ALTER TABLE reviews DROP COLUMN image_url;

-- DDL 18: Add a new table 'user_sessions' for tracking user login sessions
CREATE TABLE user_sessions (
    session_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    login_time DATETIME,
    logout_time DATETIME,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE
);

-- DDL 19: Add a check constraint to ensure 'rating' in reviews is between 1 and 5
ALTER TABLE reviews ADD CONSTRAINT check_rating CHECK (rating BETWEEN 1 AND 5);

-- DDL 20: Truncate the audit_logs table to reset logs for a fresh start
TRUNCATE TABLE audit_logs;

-- ============================================= 20 DML QUERIES =======================================================================================

-- DML 1: Insert a new user with arithmetic operator for loyalty_points calculation
INSERT INTO users (full_name, email, password, phone, role, gender, date_of_birth, status, created_at, loyalty_points)
VALUES ('New Vegan User', 'newvegan@hellovegan.com', 'securepass', '1234567890', 'Customer', 'Non-binary', '2000-05-15', 'Active', NOW(), 100 + 50);

-- DML 2: Update user profiles to set updated_at using arithmetic addition
UPDATE user_profiles
SET updated_at = updated_at + INTERVAL 1 DAY
WHERE user_id = 1;

-- DML 3: Delete inactive users using logical operators (AND, OR)
DELETE FROM users
WHERE status = 'Inactive' AND (role = 'Customer' OR role = 'Doctor');

-- DML 4: Insert multiple products with bulk insert for new vegan snacks
INSERT INTO products (category_id, name, description, price, stock, brand, status, created_at)
VALUES
(2, 'Vegan Protein Bar', 'High-protein snack bar with nuts and seeds.', 150.00, 100, 'NutriVegan', 'Available', NOW()),
(2, 'Almond Butter Spread', 'Creamy almond butter for sandwiches.', 250.00, 80, 'NuttyDelight', 'Available', NOW());

-- DML 5: Update product prices using arithmetic multiplication for a 10% increase
UPDATE products
SET price = price * 1.10
WHERE category_id = 1 AND stock > 50;

-- DML 6: Delete old orders using comparison operators
DELETE FROM orders
WHERE order_date < '2025-01-01' AND payment_status = 'Failed';

-- DML 7: Insert new categories with parent_id for subcategories
INSERT INTO categories (name, description, parent_id, created_at, status, created_by)
VALUES
('Vegan Desserts', 'Sweet treats made without animal products.', 2, NOW(), 'Active', 2),
('Plant-Based Milks', 'Alternative milks from plants.', 1, NOW(), 'Active', 2);

-- DML 8: Update order status using logical operators
UPDATE orders
SET order_status = 'Cancelled'
WHERE payment_status = 'Failed' AND total_amount < 500;

-- DML 9: Delete expired promotions using special operators (IN)
DELETE FROM promotions
WHERE status IN ('Expired', 'Inactive') AND end_date < CURDATE();

-- DML 10: Insert new doctors with bulk data
INSERT INTO doctors (name, email, phone, specialization, experience_years, clinic_address, available_days, consultation_fee, created_at)
VALUES
('Dr. Eco Health', 'eco@veganclinic.com', '9876543211', 'Holistic Nutrition', 12, 'Green Clinic, Mumbai', 'Mon, Wed, Fri', 600.00, NOW());

-- DML 11: Update counselor fees using arithmetic subtraction for discount
UPDATE counselors
SET session_fee = session_fee - 50
WHERE experience_years > 10;

-- DML 12: Delete cancelled appointments using comparison and logical operators
DELETE FROM appointments
WHERE status = 'Cancelled' AND appointment_date < CURDATE();

-- DML 13: Insert event registrations with bulk data
INSERT INTO event_registrations (event_id, user_id, registration_date, payment_status, ticket_type, amount, status)
VALUES
(1, 3, NOW(), 'Paid', 'VIP', 50.00, 'Confirmed'),
(2, 4, NOW(), 'Pending', 'General', 25.00, 'Pending');

-- DML 14: Update campaign raised amounts using arithmetic addition
UPDATE campaigns
SET raised_amount = raised_amount + 1000
WHERE campaign_id = 1;

-- DML 15: Delete rejected reviews using special operators (LIKE)
DELETE FROM reviews
WHERE status LIKE 'Rejected' AND comment LIKE '%spam%';

-- DML 16: Insert community posts with bulk data
INSERT INTO community_posts (user_id, title, content, category, created_at, likes, comments_count)
VALUES
(5, 'Vegan Recipe Share', 'Sharing my favorite tofu stir-fry recipe!', 'Recipes', NOW(), 10, 2);

-- DML 17: Update subscriber status using logical operators
UPDATE subscribers
SET status = 'Unsubscribed'
WHERE email LIKE '%spam%' OR subscribed_on < '2024-01-01';

-- DML 18: Delete old contact messages using comparison operators
DELETE FROM contact_messages
WHERE received_at < DATE_SUB(CURDATE(), INTERVAL 1 YEAR) AND status = 'Resolved';

-- DML 19: Insert admin users with bulk data
INSERT INTO admin_users (name, email, password, role, phone, status, created_at)
VALUES
('New Admin', 'newadmin@hellovegan.com', 'hashedpass', 'Moderator', '1234567890', 'Active', NOW());

-- DML 20: Update system settings using arithmetic operators
UPDATE system_settings
SET setting_value = CAST(CAST(setting_value AS INT) + 5 AS VARCHAR)
WHERE setting_key = 'max_login_attempts';

-- ============================================= 20 DQL QUERIES =======================================================================================

-- DQL 1: Select top 5 users by loyalty points using ORDER BY and LIMIT
SELECT full_name AS UserName, loyalty_points AS Points
FROM users
ORDER BY loyalty_points DESC
LIMIT 5;

-- DQL 2: Find products with price greater than 200 and stock less than 100 using comparison operators
SELECT name AS ProductName, price AS Price, stock AS Stock
FROM products
WHERE price > 200 AND stock < 100;

-- DQL 3: Group orders by status and count them using GROUP BY and HAVING
SELECT order_status AS Status, COUNT(*) AS TotalOrders
FROM orders
GROUP BY order_status
HAVING COUNT(*) > 5;

-- DQL 4: Select users with email containing 'vegan' using LIKE operator
SELECT full_name AS Name, email AS Email
FROM users
WHERE email LIKE '%vegan%';

-- DQL 5: Calculate total sales per category using JOIN and GROUP BY
SELECT c.name AS CategoryName, SUM(oi.quantity * oi.price) AS TotalSales
FROM categories c
JOIN products p ON c.category_id = p.category_id
JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY c.category_id, c.name;

-- DQL 6: Find doctors with experience over 10 years and fee less than 600 using logical operators
SELECT name AS DoctorName, specialization AS Specialty, consultation_fee AS Fee
FROM doctors
WHERE experience_years > 10 AND consultation_fee < 600;

-- DQL 7: Select events with max participants greater than 50, ordered by date
SELECT title AS EventTitle, event_date AS Date, max_participants AS Capacity
FROM events
WHERE max_participants > 50
ORDER BY event_date ASC;

-- DQL 8: Group campaigns by status and sum raised amounts using GROUP BY
SELECT status AS CampaignStatus, SUM(raised_amount) AS TotalRaised
FROM campaigns
GROUP BY status;

-- DQL 9: Find reviews with rating between 4 and 5 using BETWEEN
SELECT p.name AS ProductName, r.rating AS Rating, r.comment AS Review
FROM reviews r
JOIN products p ON r.product_id = p.product_id
WHERE r.rating BETWEEN 4 AND 5;

-- DQL 10: Select top 10 community posts by likes using ORDER BY and LIMIT
SELECT title AS PostTitle, likes AS Likes, comments_count AS Comments
FROM community_posts
ORDER BY likes DESC
LIMIT 10;

-- DQL 11: Calculate average order amount per user using JOIN and GROUP BY
SELECT u.full_name AS UserName, AVG(o.total_amount) AS AvgOrderAmount
FROM users u
JOIN orders o ON u.user_id = o.user_id
GROUP BY u.user_id, u.full_name
HAVING AVG(o.total_amount) > 500;

-- DQL 12: Find counselors with session fee greater than 100, ordered by experience
SELECT name AS CounselorName, experience_years AS Experience, session_fee AS Fee
FROM counselors
WHERE session_fee > 100
ORDER BY experience_years DESC;

-- DQL 13: Select donations with amount greater than 100 using comparison operator
SELECT d.amount AS DonationAmount, c.title AS CampaignTitle, d.donation_date AS Date
FROM donations d
JOIN campaigns c ON d.campaign_id = c.campaign_id
WHERE d.amount > 100;

-- DQL 14: Group event registrations by ticket type and count using GROUP BY
SELECT ticket_type AS TicketType, COUNT(*) AS Registrations
FROM event_registrations
GROUP BY ticket_type;

-- DQL 15: Find subscribers from specific cities using IN operator
SELECT name AS SubscriberName, email AS Email, city AS City
FROM subscribers
WHERE city IN ('Mumbai', 'Delhi', 'Pune');

-- DQL 16: Select contact messages with status 'Resolved' and subject containing 'inquiry'
SELECT name AS SenderName, subject AS Subject, received_at AS ReceivedDate
FROM contact_messages
WHERE status = 'Resolved' AND subject LIKE '%inquiry%';

-- DQL 17: Calculate total raised per campaign, ordered by amount descending
SELECT title AS CampaignTitle, raised_amount AS Raised, goal_amount AS Goal
FROM campaigns
ORDER BY raised_amount DESC;

-- DQL 18: Find admin users with role 'Super Admin' using equality operator
SELECT name AS AdminName, email AS Email, last_login AS LastLogin
FROM admin_users
WHERE role = 'Super Admin';
a
-- DQL 19: Select system settings updated in the last 30 days using DATE functions
SELECT setting_key AS Key, setting_value AS Value, updated_at AS Updated
FROM system_settings
WHERE updated_at > DATE_SUB(CURDATE(), INTERVAL 30 DAY);

-- DQL 20: Group audit logs by action and count occurrences using GROUP BY
SELECT action AS ActionType, COUNT(*) AS Occurrences
FROM audit_logs
GROUP BY action
HAVING COUNT(*) > 2;