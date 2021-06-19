-- Janet Dornan - Jewellery Designer's Store

-- This code was orginally submitted as a Code First Girls solo project
-- on the completion of their 8-week online evening course, Data and SQL.
-- See the file 'Project Requirements.png' for the objectives.
-- The code here has some improvements on the original code.

-- The original idea for this project was inspired by my hobby of jewellery making.

CREATE DATABASE silversmithUK_mods; 		-- with PRIMARY & FOREIGN keys
USE silversmithUK_mods;

-- ------------------------------------
-- 1. Stock Table
-- ------------------------------------

CREATE TABLE stock (
    id INT PRIMARY KEY AUTO_INCREMENT,
    item VARCHAR(50) NOT NULL,
    shop VARCHAR(50) NOT NULL,
    price DECIMAL(6, 2) NOT NULL,
    quantity INT NOT NULL
);

INSERT INTO stock
(item, shop, price, quantity)
VALUES
('Silver Tension Ring', 'website', 135.00, 3),
('Silver Adjustible Ring', 'website', 15.00, 1),
('Silver Collet Set Ring', 'website', 90.00, 1 ),
('Silver Adjustible Bangle', 'website', 30.00, 4),
('Silver Cuff Bangle', 'website', 55.00, 1),
('Neon Yellow Cuff Bangle', 'website', 20.00, 6),
('Silver Pink Splash Pendant', 'gallery', 30.00, 2),
('Pure Silver Abstract Pendant', 'website', 30.00, 3),
('Neon Pink Orange Eve Pendant', 'website', 25.00, 1),
('Copper Domed Pendant', 'website', 15.00, 7),
('Snow Flowers Enamelled Pendant', 'gallery', 56.00, 1),
('Domed Enamelled Red Abstract Brooch', 'gallery', 60.00, 1),
('Handmade Silver Chain', 'gallery', 72.00, 1),
('10ct Gold Casting Grain Studs', 'gallery', 30.00, 1),
('Silver Unisex Circle Studs', 'gallery', 15.00, 3),
('Pink Circle Studs', 'gallery', 20.00, 1),
('Upcycled Brew Dog Blue Earrings', 'Warwick', 12.00, 5),
('Upcycled Brew Dog Purple Earrings', 'Warwick', 12.00, 1),
('Upcycled Brew Dog Green Earrings', 'Warwick', 12.00, 2),
('Black & White Unisex Cube Studs', 'website', 15.00, 2);

SELECT * FROM stock;

-- ------------------------------------
-- 2. Customer Table
-- ------------------------------------

CREATE TABLE customer (
    id INT PRIMARY KEY AUTO_INCREMENT,
    surname VARCHAR(50) NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    title VARCHAR(10) NOT NULL,
    email VARCHAR(50) NOT NULL,
    phone_number VARCHAR(20) NOT NULL,
    building_number VARCHAR(5) NOT NULL,
    city VARCHAR(50),
    postcode VARCHAR(10),
    country VARCHAR(20) NOT NULL,
    area VARCHAR(5) NOT NULL
);

INSERT INTO customer
(surname, first_name, title, 
email, phone_number, 
building_number, city, postcode, country, area)
VALUES
('Red', 'Mike', 'Mr', 'mike.red@gmail.com', '44 7870 133426', '5', 'Bristol', 'BS1 2TD', 'UK', 'GB'),
('Green', 'Andrea', 'Ms', 'agreen@hotmail.com', '44 7442 923458', '448', 'London', 'E17 6XS', 'UK', 'GB'),
('Blue', 'Janet', 'Miss', 'blue-spike@gmail.com', '44 7871 121166','365', 'Dudley', 'DY11 4HK', 'UK', 'GB'),
('Purple', 'Fred', 'Ms', 'PURPLE-SPOT@outlook.com', '44 7438 802322','12', 'London', 'SW2 5GB', 'UK', 'GB'),
('Magenta', 'Sami', 'Ms', 'magentas@yahoo.com', '44 7221 802322','24', 'York', 'YK21 0IE', 'UK', 'GB'),
('Ochre', 'Jake', 'Mr', 'jochre@mail.com', '38 7734 219023','31', 'Koln', '55322', 'Germany', 'EU'),
('Yellow', 'Mariam', 'Dr', 'yellow-mar@aol.com', '44 7557 212596','60', 'Swansea', 'SN21 5CZ', 'UK', 'GB'),
('Blue', 'Helen', 'Mrs', 'helen_blue@hotmail.com', '44 7871 702618','112', 'Ely', 'CB21 8NL', 'UK', 'GB'),
('Orange', 'Becca', 'Miss', 'bex.orange@hello.com', '44 7973 159427', '6b', 'Glasgow', 'G7 2FB', 'UK', 'GB'),
('Orange', 'Steve', 'Mr', 'sorange@take.com', '44 7973 159426', '6b', 'Glasgow', 'G7 2FB', 'UK', 'GB'),
('Pink', 'Val', 'Mrs', 'pinkie@free.com', '354 823 9352', '93', 'Reykjavík', '112', 'Iceland', 'Rest');

select * from customer;

-- ------------------------------------
-- 3. Supplier Table
-- ------------------------------------

CREATE TABLE supplier (
    id INT PRIMARY KEY AUTO_INCREMENT,
    company VARCHAR(50),
	country VARCHAR(20),
    material VARCHAR(50)
);

INSERT INTO supplier
(company, country, material)
VALUES
('Cooksongold', 'UK', 'Silver'),
('Cooksongold', 'UK', 'Gold'),
('Cooksongold', 'UK', 'Chain'),
('Kernow Craft', 'UK', 'Gems'),
('Kernow Craft', 'UK', 'Copper'),
('Amazon', 'UK', 'Findings'),
('Amazon', 'UK', 'Acrylic'),
('Warm Glass', 'UK', 'Glass'),
('Warm Glass', 'UK', 'Enamel'),
('Green Cast', 'Italy', 'Perspex'),
('Metal Clay Co', 'UK', 'Silver Clay'),
('Beavertown Brewery', 'UK', 'Aluminium');

SELECT * FROM supplier;

-- ------------------------------------
-- 4. Customer Invoice Table
-- ------------------------------------

CREATE TABLE customer_inv (
    id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT NOT NULL,			-- FK - customer.id
    stock_id INT NOT NULL, 				-- FK - stock.id
	amount DECIMAL(6, 2) NOT NULL,
    accounts_month VARCHAR(3) NOT NULL,
    accounts_year INT NOT NULL,
    transaction_stamp DATETIME,
    paid BOOLEAN NOT NULL,
    refund BOOLEAN NOT NULL,
    CONSTRAINT fk_customer_id
		FOREIGN KEY (customer_id) 
        REFERENCES customer(id),
	CONSTRAINT fk_stock_id
		FOREIGN KEY (stock_id) 
        REFERENCES stock(id)
);

INSERT INTO customer_inv
(customer_id, stock_id, amount, accounts_month, accounts_year, transaction_stamp, paid, refund)
VALUES
(8, 5, 55.00, 'jan', 2020, '2020-01-27 23:11:00', true, false),
(1, 1, 135.00, 'feb', 2020, null, false, false),
(5, 9, 25.00, 'feb', 2020, '2020-02-10 23:11:00', true, false),
(4, 11, 56.00, 'mar', 2020, '2020-03-15 23:11:00', true, false),
(11, 19, 12.00, 'apr', 2020, '2020-04-18 23:11:00', true, false),
(6, 3, 90.00, 'apr', 2020, '2020-04-24 23:11:00', true, false),
(2, 14, 30.00, 'may', 2020, '2020-05-01 23:11:00', true, true),
(1, 13, 72.00, 'may', 2020, '2020-05-31 23:11:00', false, false),
(4, 16, 20.00, 'jun', 2020, '2020-06-13 23:11:00', true, false),
(10, 18, 12.00, 'jun', 2020, '2020-06-24 23:11:00', true, false),
(7, 10, 15.00, 'oct', 2020, '2020-10-31 23:11:00', true, false),
(7, 6, 20.00, 'dec', 2020, '2020-12-03 23:11:00', true, false),
(9, 8, 30.00, 'dec', 2020, '2020-12-24 23:11:00', true, false),
(3, 12, 60.00, 'dec', 2020, '2020-12-25 23:11:00', true, false);

SELECT * FROM customer_inv;

-- ------------------------------------
-- 5. Supplier Invoice Table
-- ------------------------------------

CREATE TABLE supplier_inv (
    id INT PRIMARY KEY AUTO_INCREMENT,
    supplier_id INT NOT NULL,			-- FK - supplier.id
	amount DECIMAL(6, 2) NOT NULL,
    paid BOOLEAN NOT NULL,
    refund BOOLEAN NOT NULL,
    CONSTRAINT fk_supplier_inv
    FOREIGN KEY(supplier_id) 
		REFERENCES supplier(id)
);

INSERT INTO supplier_inv
(supplier_id, amount, paid, refund)
VALUES
(8, 155.00, true, false),
(1, 1135.00, false, false),
(5, 125.00, true, false),
(4, 157.00, true, false),
(11, 112.00, true, false),
(6, 190.00, true, false),
(2, 130.00, true, true),
(1, 172.00, false, false),
(4, 120.00, true, false),
(10, 112.00, true, false),
(7, 115.00, true, false),
(7, 121.00, true, false),
(9, 256.00, true, false),
(3, 160.00, true, false);

SELECT * FROM supplier_inv;

-- ------------------------------------
-- 6. Design Table
-- ------------------------------------

CREATE TABLE design (
	id INT PRIMARY KEY AUTO_INCREMENT,
    stock_id INT,					-- FK - stock.id
    category VARCHAR(50) NOT NULL,
    material VARCHAR(20) NOT NULL,
    purity INT,
    finish VARCHAR(20),
    gems VARCHAR(20),
    recycled BOOLEAN NOT NULL,
    CONSTRAINT fk_design
    FOREIGN KEY(stock_id) 
		REFERENCES stock(id)
);

INSERT INTO design
(stock_id, category, material, purity, finish, gems, recycled)
VALUES
(16, 'Earrings', 'Silver', 925, 'Acrylic', null, true),
(20, 'Earrings', 'Silver', 925, 'Acrylic', null, true),
(17, 'Earrings', 'Aluminium', 0, 'Original', null, true),
(6, 'Bangle', 'Perspex', 0, 'Texture', null, true),
(12, 'Brooch', 'Copper', 0, 'Enamel', null, false),
(4, 'Bangle', 'Silver', 925, 'Texture', 'Glass', true),
(13, 'Necklace', 'Silver', 925, 'Brush', null, true),
(18, 'Earrings', 'Aluminium', 0, 'Original', null, true),
(19, 'Earrings', 'Aluminium', 0, 'Original', null, true),
(15, 'Earrings', 'Silver', 925, 'Brush', null, true),
(14, 'Earrings', 'Gold', 10, 'Brush', 'Gold', true),
(5, 'Bangle', 'Silver', 925, 'Texture', null, true),
(7, 'Pendant', 'Silver', 925, 'Acrylic', null, false),
(11, 'Pendant', 'Copper', 0, 'Enamel', null, false),
(10, 'Pendant', 'Copper', 0, 'Texture', null, false),
(1, 'Ring', 'Silver', 925, 'Mirror', 'Blue Topaz', false),
(3, 'Ring', 'Silver', 925, 'Brush', 'Orange CZ', false),
(8, 'Pendant', 'Silver Clay', 999, 'Texture', null, true),
(9, 'Pendant', 'Perspex', 0, 'Mirror', null, false),
(2, 'Ring', 'Silver', 925, 'Texture', null, true);

SELECT * FROM design;

-- -------------------------------------------------------------------
-- Janet Dornan - Jewellery Designer Store - CORE REQUIREMENTS
-- -------------------------------------------------------------------
-- Joins 
-- -------------------------------------------------------------------
-- Inner join used to see the customer 'paid' status & what they purchased.
-- *** RUN ***
SELECT 
	cinv.amount AS 'Price £', cinv.paid AS 'Paid',	-- from customer_inv table
    st.item AS 'Description',						-- from stock table
    d.category AS 'Category',						-- from design table
    c.surname AS 'Customer Surname', c.email AS 'Customer Email',	-- from customer table
    -- Displaying below; the stock id, customer id & invoice id columns, 
    -- as a quick check, to see if the information is correct.
    -- Normally these columns would not be shown
    cinv.stock_id AS 'cinv.stock_id', st.id AS 'st.id', d.stock_id AS 'd.stock_id',
    cinv.customer_id AS 'cinv.customer_id', c.id AS 'c.id'
FROM customer_inv cinv			-- to customer_inv join stock, design & customer tables 
	INNER JOIN stock st			-- join stock table using stock.id
		ON cinv.stock_id = st.id
	INNER JOIN design d			-- join design table using design.stock_id
		ON cinv.stock_id = d.stock_id
	INNER JOIN customer c		-- join customer table using customer.id
		ON cinv.customer_id = c.id;

-- -------------------------------------------------------------------
-- Stored Function 
-- -------------------------------------------------------------------
-- Find out postage charges depending on customer location
SELECT * FROM customer;

DELIMITER //
-- identify postage costs
CREATE FUNCTION post(      -- function name
	area VARCHAR(5)
)
RETURNS VARCHAR(5)
DETERMINISTIC
BEGIN
	DECLARE post_costs DECIMAL(6, 2); 
    IF area = 'GB' THEN
		SET post_costs = 1.55;
	ELSEIF area = 'EU' THEN
		SET post_costs = 2.95;
	ELSE SET post_costs = 5.95;  -- catch-all REST OF WORLD condition
	END IF;
    RETURN (post_costs);    -- return outcome
END//area
DELIMITER ;

-- *** RUN ***
SELECT
	title, first_name, surname, city, country,
    post(area) AS 'postage' -- name of the new temporary column
FROM customer;

DROP FUNCTION post;
-- SHOW FUNCTION STATUS;

-- -------------------------------------------------------------------
--  Query & Sub-query
-- -------------------------------------------------------------------
-- 1. Using query and sub-query, find customer(s) & their phone number, due a refund
-- *** RUN ***
SELECT title, first_name, surname, phone_number
FROM customer
WHERE id IN (
	SELECT customer_id
	FROM customer_inv
	WHERE refund = True
	) 
;

-- 2. Using query and sub-query, find the customer orders where the raw material has not yet been paid for;
-- i.e. find the orders for which the jeweller needs to buy materials
-- *** RUN ***
-- EXPLAIN 
SELECT customer_id, amount AS 'customer_bill', stock_id AS 'stock_not_purchased'
FROM customer_inv cinv		
WHERE stock_id IN (				-- customer_inv.stock_id
	SELECT stock_id					-- design.stock_id
    FROM design d
    WHERE material IN (				-- design.material
		SELECT material				-- supplier.material
        FROM supplier su
        WHERE id IN (					-- supplier.id
			SELECT supplier_id			-- supplier_inv.supplier_id
            FROM supplier_inv sinv
            WHERE paid = False		-- Cooksongold silver not yet paid for
            )
		)
	)
ORDER by customer_id			-- customer_inv.customer_id
;

-- 3. Using query and sub-query, find which customers (& their cities), have bought recycled jewellery?
-- *** RUN ***
SELECT first_name, surname, city
FROM customer
WHERE id IN (
	SELECT customer_id
    FROM customer_inv
    WHERE stock_id IN (
		SELECT stock_id
        FROM design
        WHERE recycled = TRUE
        )
	)
;

-- -------------------------------------------------------------------
-- Database Diagram - see the EER file
-- -------------------------------------------------------------------

-- -------------------------------------------------------------------
-- Janet Dornan - Jewellery Designer Store - ADVANCED OPTIONS
-- -------------------------------------------------------------------
-- Stored Procedure
-- -------------------------------------------------------------------
-- set delimiter to '//'
DELIMITER //
-- Procedure to easily add new materials and their suppliers
CREATE PROCEDURE new_Supplier(   -- declare procedure called 'new_Supplier'
	IN num INT,
    IN firm VARCHAR(50),
    IN location VARCHAR(20),
    IN new_material VARCHAR(50)
)
BEGIN     -- begin the procedure
	INSERT INTO supplier(id, company, country, material)
    VALUES (num, firm, location, new_material);
END//  -- end of procedure

-- set delimiter back to  ';'
DELIMITER ;

-- *** RUN ***
SELECT * FROM supplier;  -- see table before procedure

CALL new_Supplier (NULL, 'MetalClays4You', 'UK', 'Titanium'); 
-- NULL at beginning allows the auto increment sequence to continue

SELECT * FROM supplier;	-- see table after procedure

-- DELETE FROM supplier WHERE supplier.material='Titanium';  -- to restore to original table
-- DROP PROCEDURE new_Supplier;
SHOW PROCEDURE STATUS;

-- ----------------------------------------------------------
-- Trigger
-- ----------------------------------------------------------

-- keeping a log of updates to address details in the 'customer' table

CREATE TABLE customer_audit (
    id INT AUTO_INCREMENT PRIMARY KEY,
    building_old VARCHAR(5) NOT NULL,
    city_old VARCHAR(50),
    postcode_old VARCHAR(10),
    building_new VARCHAR(5) NOT NULL,
    city_new VARCHAR(50),
    postcode_new VARCHAR(10),
    changedat DATETIME DEFAULT NULL,
    action VARCHAR(50) DEFAULT NULL
);

CREATE TRIGGER before_customer_update 
    BEFORE UPDATE ON customer
    FOR EACH ROW 
 INSERT INTO customer_audit
 SET action = 'update',
     building_old = OLD.building_number,
     city_old = OLD.city,
     postcode_old = OLD.postcode,
	 building_new = NEW.building_number,
     city_new = NEW.city,
     postcode_new = NEW.postcode,
     changedat = NOW();
     
SHOW TRIGGERS;
-- DROP TRIGGER before_customer_update;

SELECT * FROM customer;		-- see table before

UPDATE customer 
SET 
    building_number = '155',
    city = 'Dundee',
    postcode = 'DD15 5DB'
WHERE
    id = 9;
 
-- change the entry back
UPDATE customer 
SET 
    building_number = '6b',
    city = 'Glasgow',
    postcode = 'G7 2FB'
WHERE
    id = 9;
    
SELECT * FROM customer_audit;    -- see the changes
SELECT * FROM customer;

-- ----------------------------------------------------------
-- Event
-- ----------------------------------------------------------
SHOW PROCESSLIST;    -- view the status of the event scheduler thread
-- if not enabled, set the event_scheduler system variable to enable and start it
SET GLOBAL event_scheduler = ON;
SHOW PROCESSLIST;    -- check it's running

-- SET GLOBAL event_scheduler = OFF;  -- to disable

-- create table to store the customers yet to pay
CREATE TABLE nonPayment_mod (
	count INT AUTO_INCREMENT PRIMARY KEY, 
    surname VARCHAR(50) NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    title VARCHAR(10) NOT NULL,
    email VARCHAR(50) NOT NULL,
    phone_number VARCHAR(20) NOT NULL,
    date_stamp DATE DEFAULT NULL
);

CREATE EVENT event_NonPayment_mod
	ON SCHEDULE EVERY 1 DAY
	DO INSERT INTO nonPayment_mod (surname, first_name, title, email, phone_number, date_stamp)
    -- Automatically runs a daily query, to find out which customers have not paid their bill
	SELECT surname, first_name, title, email, phone_number, CURRENT_DATE()
    FROM customer
    WHERE id IN (
		SELECT customer_id
        FROM customer_inv
        WHERE paid = False
        )
;

-- *** RUN ***
SELECT * FROM nonPayment_mod;

SHOW EVENTS;
-- DROP EVENT event_NonPayment_mod;
-- SET GLOBAL event_scheduler = OFF;  -- to disable

-- ----------------------------------------------------------
-- View
-- ----------------------------------------------------------
-- Jeweller would like to quickly check sales data for recycled items sold:
-- 			- outlet purchased from, customer location & month.
-- Joined stock, design & customer tables to customer_inv.

CREATE OR REPLACE VIEW vw_stock_design AS 
	SELECT st.id AS stock_id, st.shop, d.category, c.city, cinv.accounts_month
    FROM customer_inv AS cinv 
		INNER JOIN customer AS c 
			ON cinv.customer_id = c.id
		INNER JOIN stock AS st
			ON cinv.stock_id = st.id
		INNER JOIN design AS d
			ON cinv.stock_id = d.stock_id
	WHERE recycled = True
    ORDER BY cinv.transaction_stamp
;

-- *** RUN ***
SELECT * FROM vw_stock_design;

-- SHOW FULL TABLES IN silversmithUK WHERE TABLE_TYPE LIKE 'VIEW';

-- ----------------------------------------------------------
-- Group By
-- ----------------------------------------------------------
-- Monthly sales (group by month) where total is greater than £30
-- *** RUN ***
SELECT
	accounts_month AS 'Month',
    SUM(amount) AS 'Amount £/mth'
    FROM customer_inv
    GROUP BY accounts_month
    HAVING SUM(amount) > 30
    ORDER BY accounts_month;

-- ----------------------------------------------------------
-- See TABLEAU folder for visual analysis!!!
-- ----------------------------------------------------------
-- THE END -- 
-- Thank you Code First Girls Instructors: Charlotte, Mabel & Sahba 
-- for all your help and inspiration!!!
-- ----------------------------------------------------------

