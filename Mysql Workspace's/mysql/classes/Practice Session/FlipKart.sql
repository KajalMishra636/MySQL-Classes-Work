/* ===========================================================
   Flipkart E-Commerce Database (Full Version)
   Purpose: Manage users, products, orders, payments, reviews, and more
   Author: Student
   Date: 2025-10-20
=========================================================== */

/* ============================================
   1. Table: Users
============================================ */
CREATE TABLE Users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    password VARCHAR(100) NOT NULL,
    phone VARCHAR(20),
    address TEXT,
    city VARCHAR(50),
    state VARCHAR(50),
    registration_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insert 10 sample users
INSERT INTO Users (first_name,last_name,email,password,phone,address,city,state,registration_date) VALUES
('Amit','Sharma','amit.sharma@example.com','pass123','9876543210','123 Street, City A','Mumbai','Maharashtra','2025-01-01'),
('Priya','Verma','priya.verma@example.com','pass456','9123456780','456 Street, City B','Delhi','Delhi','2025-02-05'),
('Ravi','Kumar','ravi.kumar@example.com','pass789','9988776655','789 Street, City C','Bangalore','Karnataka','2025-02-15'),
('Sneha','Patel','sneha.patel@example.com','pass321','9112233445','321 Street, City D','Ahmedabad','Gujarat','2025-03-01'),
('Neha','Gupta','neha.gupta@example.com','pass654','9223344556','654 Street, City E','Pune','Maharashtra','2025-03-05'),
('Vikram','Singh','vikram.singh@example.com','pass987','9334455667','987 Street, City F','Hyderabad','Telangana','2025-03-10'),
('Pooja','Iyer','pooja.iyer@example.com','pass147','9445566778','147 Street, City G','Chennai','Tamil Nadu','2025-03-15'),
('Karan','Mehta','karan.mehta@example.com','pass258','9556677889','258 Street, City H','Kolkata','West Bengal','2025-03-20'),
('Rakesh','Reddy','rakesh.reddy@example.com','pass369','9667788990','369 Street, City I','Noida','Uttar Pradesh','2025-03-25'),
('Anjali','Shah','anjali.shah@example.com','pass741','9778899001','741 Street, City J','Gurgaon','Haryana','2025-03-30');

-- 10 Queries for Users
SELECT * FROM Users; -- 1. All users
SELECT first_name,last_name,email FROM Users; -- 2. Specific columns
SELECT * FROM Users WHERE city='Mumbai'; -- 3. Filter
SELECT * FROM Users ORDER BY registration_date DESC; -- 4. Order by
SELECT COUNT(*) FROM Users; -- 5. Count
SELECT city,COUNT(*) FROM Users GROUP BY city; -- 6. Group by
SELECT * FROM Users WHERE email LIKE '%example.com'; -- 7. Pattern search
SELECT * FROM Users LIMIT 5; -- 8. Limit
SELECT first_name || ' ' || last_name AS full_name FROM Users; -- 9. Concatenate columns
SELECT * FROM Users WHERE registration_date BETWEEN '2025-01-01' AND '2025-03-01'; -- 10. Date range filter

/* ============================================
   2. Table: Products
============================================ */
CREATE TABLE Products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(150) NOT NULL,
    category VARCHAR(100),
    brand VARCHAR(100),
    price DECIMAL(10,2),
    stock_quantity INT,
    description TEXT,
    discount DECIMAL(5,2),
    rating DECIMAL(3,2),
    added_date DATE
);

-- Insert 10 products
INSERT INTO Products (name,category,brand,price,stock_quantity,description,discount,rating,added_date) VALUES
('iPhone 14','Mobile','Apple',90000,50,'Latest Apple smartphone',5,4.8,'2025-03-01'),
('Samsung TV 55 inch','Electronics','Samsung',50000,20,'Smart TV Full HD',10,4.5,'2025-03-05'),
('OnePlus 12','Mobile','OnePlus',60000,30,'Latest OnePlus phone',7,4.6,'2025-03-07'),
('Dell Laptop','Computers','Dell',70000,15,'High performance laptop',5,4.7,'2025-03-10'),
('Sony Headphones','Accessories','Sony',5000,100,'Noise cancelling headphones',0,4.4,'2025-03-12'),
('Nike Shoes','Footwear','Nike',8000,200,'Running shoes',15,4.5,'2025-03-15'),
('Adidas T-shirt','Clothing','Adidas',1500,300,'Sports T-shirt',5,4.2,'2025-03-17'),
('Samsung Fridge','Home Appliances','Samsung',35000,10,'Double door fridge',8,4.3,'2025-03-18'),
('HP Printer','Electronics','HP',10000,25,'All-in-one printer',5,4.1,'2025-03-20'),
('Canon Camera','Electronics','Canon',45000,12,'DSLR camera',10,4.6,'2025-03-22');

-- 10 Queries for Products
SELECT * FROM Products; -- 1. All products
SELECT name,price,stock_quantity FROM Products; -- 2. Specific columns
SELECT * FROM Products WHERE category='Mobile'; -- 3. Filter category
SELECT * FROM Products ORDER BY price DESC; -- 4. Order by price
SELECT COUNT(*) FROM Products; -- 5. Count products
SELECT category,COUNT(*) FROM Products GROUP BY category; -- 6. Group by category
SELECT * FROM Products WHERE name LIKE '%Samsung%'; -- 7. Pattern search
SELECT * FROM Products LIMIT 5; -- 8. Limit
SELECT name,price*(1-discount/100) AS discounted_price FROM Products; -- 9. Calculate discounted price
SELECT * FROM Products WHERE rating>=4.5; -- 10. Filter by rating

/* ============================================
   3. Table: Orders
============================================ */
CREATE TABLE Orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    order_date DATE,
    total_amount DECIMAL(10,2),
    status VARCHAR(50),
    shipping_address TEXT,
    payment_status VARCHAR(50),
    delivery_date DATE,
    discount DECIMAL(5,2),
    remarks TEXT,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

-- Insert 10 orders
INSERT INTO Orders (user_id,order_date,total_amount,status,shipping_address,payment_status,delivery_date,discount,remarks) VALUES
(1,'2025-04-01',95000,'Processing','123 Street, City A','Paid','2025-04-05',5,'First order'),
(2,'2025-04-02',50000,'Delivered','456 Street, City B','Paid','2025-04-07',0,'Urgent delivery'),
(3,'2025-04-03',60000,'Shipped','789 Street, City C','Paid','2025-04-08',7,'Gift order'),
(4,'2025-04-04',70000,'Processing','321 Street, City D','Pending','2025-04-10',5,'Bulk order'),
(5,'2025-04-05',5000,'Delivered','654 Street, City E','Paid','2025-04-09',0,'Single item'),
(6,'2025-04-06',8000,'Cancelled','987 Street, City F','Refunded','2025-04-11',15,'Customer cancelled'),
(7,'2025-04-07',1500,'Delivered','147 Street, City G','Paid','2025-04-12',5,'Gift for friend'),
(8,'2025-04-08',35000,'Shipped','258 Street, City H','Paid','2025-04-15',8,'Home appliance'),
(9,'2025-04-09',10000,'Processing','369 Street, City I','Pending','2025-04-18',5,'Office equipment'),
(10,'2025-04-10',45000,'Delivered','741 Street, City J','Paid','2025-04-20',10,'Photography equipment');

-- 10 Queries for Orders
SELECT * FROM Orders; -- 1. All orders
SELECT user_id,total_amount,status FROM Orders; -- 2. Specific columns
SELECT * FROM Orders WHERE status='Delivered'; -- 3. Filter delivered
SELECT * FROM Orders ORDER BY total_amount DESC; -- 4. Order by amount
SELECT COUNT(*) FROM Orders; -- 5. Count orders
SELECT status,COUNT(*) FROM Orders GROUP BY status; -- 6. Group by status
SELECT * FROM Orders WHERE shipping_address LIKE '%City A%'; -- 7. Filter by city
SELECT * FROM Orders LIMIT 5; -- 8. Limit
SELECT *,total_amount*(1-discount/100) AS final_amount FROM Orders; -- 9. Final amount
SELECT * FROM Orders WHERE order_date BETWEEN '2025-04-01' AND '2025-04-05'; -- 10. Date range

/* ============================================
   4. Table: Order_Items
============================================ */
CREATE TABLE Order_Items (
    order_item_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    product_id INT,
    quantity INT,
    price DECIMAL(10,2),
    discount DECIMAL(5,2),
    total_price DECIMAL(10,2),
    remarks TEXT,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

-- Insert 10 records
INSERT INTO Order_Items (order_id,product_id,quantity,price,discount,total_price,remarks) VALUES
(1,1,1,90000,5,85500,'Delivered on time'),
(2,2,1,50000,0,50000,'Gift wrapped'),
(3,3,1,60000,7,55800,'Shipped via courier'),
(4,4,1,70000,5,66500,'Urgent delivery'),
(5,5,1,5000,0,5000,'Delivered safely'),
(6,6,1,8000,15,6800,'Cancelled by customer'),
(7,7,1,1500,5,1425,'Gift item'),
(8,8,1,35000,8,32200,'Home delivery'),
(9,9,1,10000,5,9500,'Office delivery'),
(10,10,1,45000,10,40500,'Photography equipment');

-- 10 Queries for Order_Items
SELECT * FROM Order_Items; -- 1. All order items
SELECT order_id,product_id,quantity,total_price FROM Order_Items; -- 2. Specific columns
SELECT * FROM Order_Items WHERE quantity>1; -- 3. Filter by quantity
SELECT * FROM Order_Items ORDER BY total_price DESC; -- 4. Order by total
SELECT COUNT(*) FROM Order_Items; -- 5. Count items
SELECT order_id,SUM(total_price) FROM Order_Items GROUP BY order_id; -- 6. Total per order
SELECT * FROM Order_Items WHERE remarks LIKE '%Delivered%'; -- 7. Filter remarks
SELECT * FROM Order_Items LIMIT 5; -- 8. Limit
SELECT product_id,price*(1-discount/100) AS discounted_price FROM Order_Items; -- 9. Calculate discounted price
SELECT * FROM Order_Items WHERE total_price>20000; -- 10. Filter by total price


/* ============================================
   5. Table: Payments
   Purpose: Store payment details for orders
============================================ */
CREATE TABLE Payments (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    payment_date DATE,
    amount DECIMAL(10,2),
    payment_mode VARCHAR(50),
    status VARCHAR(50),
    transaction_id VARCHAR(100),
    bank_name VARCHAR(100),
    remarks TEXT,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);

-- Insert 10 records
INSERT INTO Payments (order_id,payment_date,amount,payment_mode,status,transaction_id,bank_name,remarks) VALUES
(1,'2025-04-01',95000,'Credit Card','Paid','TXN1001','HDFC','Payment successful'),
(2,'2025-04-02',50000,'UPI','Paid','TXN1002','ICICI','Payment received'),
(3,'2025-04-03',55800,'Debit Card','Paid','TXN1003','SBI','Paid via debit card'),
(4,'2025-04-04',66500,'Net Banking','Pending','TXN1004','Axis','Awaiting confirmation'),
(5,'2025-04-05',5000,'Wallet','Paid','TXN1005','Paytm','Paid via wallet'),
(6,'2025-04-06',6800,'Credit Card','Refunded','TXN1006','HDFC','Customer refunded'),
(7,'2025-04-07',1425,'UPI','Paid','TXN1007','ICICI','Payment done'),
(8,'2025-04-08',32200,'Debit Card','Paid','TXN1008','SBI','Delivered and paid'),
(9,'2025-04-09',9500,'Net Banking','Pending','TXN1009','Axis','Awaiting bank clearance'),
(10,'2025-04-10',40500,'Credit Card','Paid','TXN1010','HDFC','Paid successfully');

-- 10 Queries for Payments
SELECT * FROM Payments;
SELECT order_id,amount,payment_mode,status FROM Payments;
SELECT * FROM Payments WHERE status='Paid';
SELECT * FROM Payments ORDER BY amount DESC;
SELECT COUNT(*) FROM Payments;
SELECT payment_mode,COUNT(*) FROM Payments GROUP BY payment_mode;
SELECT * FROM Payments WHERE bank_name='HDFC';
SELECT * FROM Payments LIMIT 5;
SELECT amount,amount*1.18 AS amount_with_gst FROM Payments; -- example with GST
SELECT * FROM Payments WHERE payment_date BETWEEN '2025-04-01' AND '2025-04-05';

/* ============================================
   6. Table: Categories
   Purpose: Store product categories
============================================ */
CREATE TABLE Categories (
    category_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    description TEXT,
    parent_category_id INT,
    created_date DATE,
    updated_date DATE,
    status VARCHAR(50),
    icon VARCHAR(100),
    display_order INT,
    remarks TEXT
);

-- Insert 10 categories
INSERT INTO Categories (name,description,parent_category_id,created_date,updated_date,status,icon,display_order,remarks) VALUES
('Mobiles','Smartphones and mobile devices',NULL,'2025-01-01','2025-01-01','Active','mobile.png',1,'Main mobile category'),
('Electronics','Electronic items',NULL,'2025-01-02','2025-01-02','Active','electronics.png',2,'Main electronics'),
('Computers','Laptops and desktops',2,'2025-01-03','2025-01-03','Active','computers.png',3,'Subcategory of electronics'),
('Accessories','Phone and computer accessories',2,'2025-01-04','2025-01-04','Active','accessories.png',4,'Accessories for electronics'),
('Footwear','Shoes and sandals',NULL,'2025-01-05','2025-01-05','Active','footwear.png',5,'Main footwear category'),
('Clothing','Apparel for men and women',NULL,'2025-01-06','2025-01-06','Active','clothing.png',6,'Main clothing category'),
('Home Appliances','Appliances for home',NULL,'2025-01-07','2025-01-07','Active','appliances.png',7,'Home appliances'),
('Cameras','DSLR and digital cameras',2,'2025-01-08','2025-01-08','Active','camera.png',8,'Camera category'),
('Gaming','Gaming consoles and accessories',2,'2025-01-09','2025-01-09','Active','gaming.png',9,'Gaming items'),
('Books','Books and e-books',NULL,'2025-01-10','2025-01-10','Active','books.png',10,'Books category');

-- 10 Queries for Categories
SELECT * FROM Categories;
SELECT name,description,status FROM Categories;
SELECT * FROM Categories WHERE parent_category_id IS NULL;
SELECT * FROM Categories ORDER BY display_order;
SELECT COUNT(*) FROM Categories;
SELECT status,COUNT(*) FROM Categories GROUP BY status;
SELECT * FROM Categories WHERE name LIKE '%Electronics%';
SELECT * FROM Categories LIMIT 5;
SELECT name,created_date FROM Categories WHERE created_date>'2025-01-05';
SELECT * FROM Categories WHERE parent_category_id=2;

/* ============================================
   7. Table: Reviews
   Purpose: Store product reviews by users
============================================ */
CREATE TABLE Reviews (
    review_id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT,
    user_id INT,
    rating DECIMAL(3,2),
    review_text TEXT,
    review_date DATE,
    status VARCHAR(50),
    helpful_count INT,
    remarks TEXT,
    FOREIGN KEY (product_id) REFERENCES Products(product_id),
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

-- Insert 10 reviews
INSERT INTO Reviews (product_id,user_id,rating,review_text,review_date,status,helpful_count,remarks) VALUES
(1,1,4.8,'Excellent phone','2025-04-05','Approved',100,'Good battery life'),
(2,2,4.5,'Great TV','2025-04-06','Approved',50,'HD Display'),
(3,3,4.6,'Good phone','2025-04-07','Approved',70,'Fast performance'),
(4,4,4.7,'Excellent laptop','2025-04-08','Approved',60,'High performance'),
(5,5,4.4,'Nice headphones','2025-04-09','Approved',30,'Clear sound'),
(6,6,4.5,'Comfortable shoes','2025-04-10','Approved',40,'Good for running'),
(7,7,4.2,'Nice T-shirt','2025-04-11','Approved',20,'Good quality'),
(8,8,4.3,'Refrigerator works well','2025-04-12','Approved',25,'Energy efficient'),
(9,9,4.1,'Printer works fine','2025-04-13','Approved',15,'Easy setup'),
(10,10,4.6,'Camera takes good photos','2025-04-14','Approved',35,'High resolution');

-- 10 Queries for Reviews
SELECT * FROM Reviews;
SELECT product_id,user_id,rating FROM Reviews;
SELECT * FROM Reviews WHERE rating>=4.5;
SELECT * FROM Reviews ORDER BY helpful_count DESC;
SELECT COUNT(*) FROM Reviews;
SELECT product_id,AVG(rating) FROM Reviews GROUP BY product_id;
SELECT * FROM Reviews WHERE review_text LIKE '%Excellent%';
SELECT * FROM Reviews LIMIT 5;
SELECT * FROM Reviews WHERE review_date BETWEEN '2025-04-05' AND '2025-04-10';
SELECT * FROM Reviews WHERE status='Approved';

/* ============================================
   8. Table: Sellers
   Purpose: Store seller information
============================================ */
CREATE TABLE Sellers (
    seller_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(150),
    email VARCHAR(150),
    phone VARCHAR(20),
    address TEXT,
    city VARCHAR(50),
    state VARCHAR(50),
    join_date DATE,
    rating DECIMAL(3,2),
    remarks TEXT
);

-- Insert 10 sellers
INSERT INTO Sellers (name,email,phone,address,city,state,join_date,rating,remarks) VALUES
('Flipkart Electronics','electronics@flipkart.com','9876543210','123 Market St','Mumbai','Maharashtra','2025-01-01',4.8,'Top seller'),
('Tech World','techworld@example.com','9123456780','456 Tech Park','Delhi','Delhi','2025-01-02',4.5,'Trusted seller'),
('Gadget Hub','gadgethub@example.com','9988776655','789 Gadget Rd','Bangalore','Karnataka','2025-01-03',4.6,'Popular seller'),
('Fashion Store','fashionstore@example.com','9112233445','321 Fashion Ave','Ahmedabad','Gujarat','2025-01-04',4.4,'Top clothing seller'),
('Home Appliances Co','homeappliances@example.com','9223344556','654 Appliance St','Pune','Maharashtra','2025-01-05',4.3,'Appliances seller'),
('Camera World','cameraworld@example.com','9334455667','987 Camera Lane','Hyderabad','Telangana','2025-01-06',4.7,'DSLR specialist'),
('Shoe Hub','shoehub@example.com','9445566778','147 Shoe Street','Chennai','Tamil Nadu','2025-01-07',4.2,'Footwear seller'),
('Book Store','bookstore@example.com','9556677889','258 Book Rd','Kolkata','West Bengal','2025-01-08',4.5,'Books seller'),
('Gaming Hub','gaminghub@example.com','9667788990','369 Gaming St','Noida','Uttar Pradesh','2025-01-09',4.6,'Gaming accessories'),
('IT Supplies','itsupplies@example.com','9778899001','741 IT Avenue','Gurgaon','Haryana','2025-01-10',4.8,'IT hardware seller');

-- 10 Queries for Sellers
SELECT * FROM Sellers;
SELECT name,email,city,state FROM Sellers;
SELECT * FROM Sellers WHERE rating>=4.5;
SELECT * FROM Sellers ORDER BY join_date;
SELECT COUNT(*) FROM Sellers;
SELECT city,COUNT(*) FROM Sellers GROUP BY city;
SELECT * FROM Sellers WHERE name LIKE '%Hub%';
SELECT * FROM Sellers LIMIT 5;
SELECT name,rating FROM Sellers WHERE city='Mumbai';
SELECT * FROM Sellers WHERE join_date BETWEEN '2025-01-01' AND '2025-01-05';

/* ============================================
   9. Table: Cart
   Purpose: Store items added to user's cart
============================================ */
CREATE TABLE Cart (
    cart_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    product_id INT,
    quantity INT,
    added_date DATE,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

-- Insert 10 cart records
INSERT INTO Cart (user_id,product_id,quantity,added_date) VALUES
(1,2,1,'2025-04-01'),
(2,1,2,'2025-04-02'),
(3,3,1,'2025-04-03'),
(4,4,1,'2025-04-04'),
(5,5,3,'2025-04-05'),
(6,6,1,'2025-04-06'),
(7,7,2,'2025-04-07'),
(8,8,1,'2025-04-08'),
(9,9,1,'2025-04-09'),
(10,10,1,'2025-04-10');

-- 10 Queries for Cart
SELECT * FROM Cart;
SELECT user_id,product_id,quantity FROM Cart;
SELECT * FROM Cart WHERE quantity>1;
SELECT * FROM Cart ORDER BY added_date DESC;
SELECT COUNT(*) FROM Cart;
SELECT user_id,COUNT(*) FROM Cart GROUP BY user_id;
SELECT * FROM Cart WHERE added_date BETWEEN '2025-04-01' AND '2025-04-05';
SELECT * FROM Cart LIMIT 5;
SELECT * FROM Cart WHERE product_id=1;
SELECT user_id,SUM(quantity) FROM Cart GROUP BY user_id;

/* ============================================
   10. Table: Wishlist
   Purpose: Store items added to user's wishlist
============================================ */
CREATE TABLE Wishlist (
    wishlist_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    product_id INT,
    added_date DATE,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

-- Insert 10 wishlist records
INSERT INTO Wishlist (user_id,product_id,added_date) VALUES
(1,3,'2025-04-01'),
(2,4,'2025-04-02'),
(3,5,'2025-04-03'),
(4,6,'2025-04-04'),
(5,7,'2025-04-05'),
(6,8,'2025-04-06'),
(7,9,'2025-04-07'),
(8,10,'2025-04-08'),
(9,1,'2025-04-09'),
(10,2,'2025-04-10');

-- 10 Queries for Wishlist
SELECT * FROM Wishlist;
SELECT user_id,product_id FROM Wishlist;
SELECT * FROM Wishlist WHERE added_date>'2025-04-05';
SELECT * FROM Wishlist ORDER BY added_date DESC;
SELECT COUNT(*) FROM Wishlist;
SELECT user_id,COUNT(*) FROM Wishlist GROUP BY user_id;
SELECT * FROM Wishlist LIMIT 5;
SELECT * FROM Wishlist WHERE product_id=1;
SELECT user_id,product_id FROM Wishlist WHERE user_id=1;
SELECT * FROM Wishlist WHERE product_id IN (1,2,3);
