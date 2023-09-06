create database ecom;

use ecom;

-- Table: supplier
CREATE TABLE supplier (
  SUPP_ID INT PRIMARY KEY,
  SUPP_NAME VARCHAR(50) NOT NULL,
  SUPP_CITY VARCHAR(50) NOT NULL,
  SUPP_PHONE VARCHAR(50) NOT NULL
);

-- Table: customer
CREATE TABLE customer (
  CUS_ID INT PRIMARY KEY,
  CUS_NAME VARCHAR(20) NOT NULL,
  CUS_PHONE VARCHAR(10) NOT NULL,
  CUS_CITY VARCHAR(30) NOT NULL,
  CUS_GENDER CHAR
);

-- Table: category
CREATE TABLE category (
  CAT_ID INT PRIMARY KEY,
  CAT_NAME VARCHAR(20) NOT NULL
);

-- Table: product
CREATE TABLE product (
  PRO_ID INT PRIMARY KEY,
  PRO_NAME VARCHAR(20) NOT NULL DEFAULT 'Dummy',
  PRO_DESC VARCHAR(60),
  CAT_ID INT,
  FOREIGN KEY (CAT_ID) REFERENCES category(CAT_ID)
);

-- Table: supplier_pricing
CREATE TABLE supplier_pricing (
  PRICING_ID INT PRIMARY KEY,
  PRO_ID INT,
  SUPP_ID INT,
  SUPP_PRICE INT DEFAULT 0,
  FOREIGN KEY (PRO_ID) REFERENCES product(PRO_ID),
  FOREIGN KEY (SUPP_ID) REFERENCES supplier(SUPP_ID)
);

-- Table: order
CREATE TABLE order_table (
  ORD_ID INT PRIMARY KEY,
  ORD_AMOUNT INT NOT NULL,
  ORD_DATE DATE NOT NULL,
  CUS_ID INT,
  PRICING_ID INT,
  FOREIGN KEY (CUS_ID) REFERENCES customer(CUS_ID)
 -- FOREIGN KEY (PRICING_ID) REFERENCES supplier_pricing(PRICING_ID)
);

-- Table: rating
CREATE TABLE rating (
  RAT_ID INT PRIMARY KEY,
  ORD_ID INT,
  RAT_RATSTARS INT NOT NULL,
  FOREIGN KEY (ORD_ID) REFERENCES order_table(ORD_ID)
);

-- Inserting data into supplier table
INSERT INTO supplier (SUPP_ID, SUPP_NAME, SUPP_CITY, SUPP_PHONE)
VALUES
  (1, 'Rajesh Retails', 'Delhi', '1234567890'),
  (2, 'Appario Ltd.', 'Mumbai', '2589631470'),
  (3, 'Knome products', 'Banglore', '9785462315'),
  (4, 'Bansal Retails', 'Kochi', '8975463285'),
  (5, 'Mittal Ltd.', 'Lucknow', '7898456532');

SELECT * FROM supplier;

-- Inserting data into customer table
INSERT INTO customer (CUS_ID, CUS_NAME, CUS_PHONE, CUS_CITY, CUS_GENDER)
VALUES
  (1, 'AAKASH', '9999999999', 'DELHI', 'M'),
  (2, 'AMAN', '9785463215', 'NOIDA', 'M'),
  (3, 'NEHA', '9999999999', 'MUMBAI', 'F'),
  (4, 'MEGHA', '9994562399', 'KOLKATA', 'F'),
  (5, 'PULKIT', '7895999999', 'LUCKNOW', 'M');

SELECT * FROM customer;

-- Inserting data into category table
INSERT INTO category (CAT_ID, CAT_NAME)
VALUES
  (1, 'BOOKS'),
  (2, 'GAMES'),
  (3, 'GROCERIES'),
  (4, 'ELECTRONICS'),
  (5, 'CLOTHES');

SELECT * FROM category;

-- Inserting data into product table
INSERT INTO product (PRO_ID, PRO_NAME, PRO_DESC, CAT_ID)
VALUES
  (1, 'GTA V', 'Windows 7 and above with i5 processor and 8GB RAM', 2),
  (2, 'TSHIRT', 'SIZE-L with Black, Blue and White variations', 5),
  (3, 'ROG LAPTOP', 'Windows 10 with 15-inch screen, i7 processor, 1TB SSD', 4),
  (4, 'OATS', 'Highly Nutritious from Nestle', 3),
  (5, 'HARRY POTTER', 'Best Collection of all time by J.K Rowling', 1),
  (6, 'MILK', '1L Toned Milk', 3),
  (7, 'Boat Earphones', '1.5 Meter long Dolby Atmos', 4),
  (8, 'Jeans', 'Stretchable Denim Jeans with various sizes and colors', 5),
  (9, 'Project IGI', 'compatible with Windows 7 and above', 2),
  (10, 'Hoodie', 'Black GUCCI for 13 yrs and above', 5),
  (11, 'Rich Dad Poor Dad', 'Written by Robert Kiyosaki', 1),
  (12, 'Train Your Brain', 'By Shireen Stephen', 1);

 SELECT * FROM product;

-- Inserting data into supplier_pricing table
INSERT INTO supplier_pricing (PRICING_ID, PRO_ID, SUPP_ID, SUPP_PRICE)
VALUES
  (1, 1, 2, 1500),
  (2, 3, 5, 30000),
  (3, 5, 1, 3000),
  (4, 2, 3, 2500),
  (5, 4, 1, 1000);

SELECT * FROM supplier_pricing;

-- Inserting data into order_table
INSERT INTO order_table (ORD_ID, ORD_AMOUNT, ORD_DATE, CUS_ID, PRICING_ID)
VALUES (101, 1500, '2021-10-06', 2, 1);
INSERT INTO order_table (ORD_ID, ORD_AMOUNT, ORD_DATE, CUS_ID, PRICING_ID)
VALUES (102, 1000, '2021-10-12', 3, 5);
INSERT INTO order_table (ORD_ID, ORD_AMOUNT, ORD_DATE, CUS_ID, PRICING_ID)
VALUES (103, 30000, '2021-09-16', 5, 2);
INSERT INTO order_table (ORD_ID, ORD_AMOUNT, ORD_DATE, CUS_ID, PRICING_ID)
VALUES (104, 1500, '2021-10-05', 1, 1);
INSERT INTO order_table (ORD_ID, ORD_AMOUNT, ORD_DATE, CUS_ID, PRICING_ID)
VALUES (105, 3000, '2021-08-16', 4, 3);
INSERT INTO order_table (ORD_ID, ORD_AMOUNT, ORD_DATE, CUS_ID, PRICING_ID)
VALUES (106, 1450, '2021-08-18', 1, 9);
INSERT INTO order_table (ORD_ID, ORD_AMOUNT, ORD_DATE, CUS_ID, PRICING_ID)
VALUES (107, 789, '2021-09-01', 3, 7);
INSERT INTO order_table (ORD_ID, ORD_AMOUNT, ORD_DATE, CUS_ID, PRICING_ID)
VALUES (108, 780, '2021-09-07', 5, 6);
INSERT INTO order_table (ORD_ID, ORD_AMOUNT, ORD_DATE, CUS_ID, PRICING_ID)
VALUES (109, 3000, '2021-09-10', 5, 3);
INSERT INTO order_table (ORD_ID, ORD_AMOUNT, ORD_DATE, CUS_ID, PRICING_ID)
VALUES (110, 2500, '2021-09-10', 2, 4);
INSERT INTO order_table (ORD_ID, ORD_AMOUNT, ORD_DATE, CUS_ID, PRICING_ID)
VALUES (111, 1000, '2021-09-15', 4, 5);
INSERT INTO order_table (ORD_ID, ORD_AMOUNT, ORD_DATE, CUS_ID, PRICING_ID)
VALUES (112, 789, '2021-09-16', 4, 7);
INSERT INTO order_table (ORD_ID, ORD_AMOUNT, ORD_DATE, CUS_ID, PRICING_ID)
VALUES (113, 31000, '2021-09-16', 1, 8);
INSERT INTO order_table (ORD_ID, ORD_AMOUNT, ORD_DATE, CUS_ID, PRICING_ID)
VALUES (114, 1000, '2021-09-16', 3, 5);
INSERT INTO order_table (ORD_ID, ORD_AMOUNT, ORD_DATE, CUS_ID, PRICING_ID)
VALUES (115, 3000, '2021-09-16', 5, 3);
INSERT INTO order_table (ORD_ID, ORD_AMOUNT, ORD_DATE, CUS_ID, PRICING_ID)
VALUES (116, 99, '2021-09-17', 2, 14);

SELECT * from order_table;

-- Inserting data into rating table
INSERT INTO rating (RAT_ID, ORD_ID, RAT_RATSTARS)
VALUES (1, 101, 4);
INSERT INTO rating (RAT_ID, ORD_ID, RAT_RATSTARS)
VALUES (2, 102, 3);
INSERT INTO rating (RAT_ID, ORD_ID, RAT_RATSTARS)
VALUES (3, 103, 1);
INSERT INTO rating (RAT_ID, ORD_ID, RAT_RATSTARS)
VALUES (4, 104, 2);
INSERT INTO rating (RAT_ID, ORD_ID, RAT_RATSTARS)
VALUES (5, 105, 4);
INSERT INTO rating (RAT_ID, ORD_ID, RAT_RATSTARS)
VALUES (6, 106, 3);
INSERT INTO rating (RAT_ID, ORD_ID, RAT_RATSTARS)
VALUES (7, 107, 4);
INSERT INTO rating (RAT_ID, ORD_ID, RAT_RATSTARS)
VALUES (8, 108, 4);
INSERT INTO rating (RAT_ID, ORD_ID, RAT_RATSTARS)
VALUES (9, 109, 3);
INSERT INTO rating (RAT_ID, ORD_ID, RAT_RATSTARS)
VALUES (10, 110, 5);
INSERT INTO rating (RAT_ID, ORD_ID, RAT_RATSTARS)
VALUES (11, 111, 3);
INSERT INTO rating (RAT_ID, ORD_ID, RAT_RATSTARS)
VALUES (12, 112, 4);
INSERT INTO rating (RAT_ID, ORD_ID, RAT_RATSTARS)
VALUES (13, 113, 2);
INSERT INTO rating (RAT_ID, ORD_ID, RAT_RATSTARS)
VALUES (14, 114, 1);
INSERT INTO rating (RAT_ID, ORD_ID, RAT_RATSTARS)
VALUES (15, 115, 1);
INSERT INTO rating (RAT_ID, ORD_ID, RAT_RATSTARS)
VALUES (16, 116, 0);

select*from rating;

--	Display the total number of customers based on gender who have placed orders of worth at least Rs.3000.

SELECT c.CUS_GENDER, COUNT(DISTINCT c.CUS_ID) AS Total_Customers
FROM customer c
INNER JOIN order_table o ON c.CUS_ID = o.CUS_ID
WHERE o.ORD_AMOUNT >= 3000
GROUP BY c.CUS_GENDER;

--	Display all the orders along with product name ordered by a customer having Customer_Id=2


SELECT o.ORD_ID, p.PRO_NAME
FROM order_table o
JOIN supplier_pricing sp ON o.PRICING_ID = sp.PRICING_ID
JOIN product p ON sp.PRO_ID = p.PRO_ID
WHERE o.CUS_ID = 2;

--	Display the Supplier details who can supply more than one product.


SELECT s.SUPP_ID, s.SUPP_NAME, s.SUPP_CITY, s.SUPP_PHONE
FROM supplier s
INNER JOIN supplier_pricing sp ON s.SUPP_ID = sp.SUPP_ID
GROUP BY s.SUPP_ID, s.SUPP_NAME, s.SUPP_CITY, s.SUPP_PHONE
HAVING COUNT(DISTINCT sp.PRO_ID) > 1;


--	Find the least expensive product from each category and print the table with category id, name, product name and price of the product

SELECT c.CAT_ID, c.CAT_NAME, p.PRO_NAME, sp.SUPP_PRICE
FROM category c
INNER JOIN product p ON c.CAT_ID = p.CAT_ID
INNER JOIN supplier_pricing sp ON p.PRO_ID = sp.PRO_ID
INNER JOIN (
    SELECT p.CAT_ID, MIN(sp.SUPP_PRICE) AS MinPrice
    FROM product p
    INNER JOIN supplier_pricing sp ON p.PRO_ID = sp.PRO_ID
    GROUP BY p.CAT_ID
) AS subquery ON c.CAT_ID = subquery.CAT_ID AND sp.SUPP_PRICE = subquery.MinPrice;


--	Display the Id and Name of the Product ordered after “2021-10-05”.

SELECT p.PRO_ID, p.PRO_NAME
FROM order_table o
JOIN supplier_pricing sp ON o.PRICING_ID = sp.PRICING_ID
JOIN product p ON sp.PRO_ID = p.PRO_ID
WHERE o.ORD_DATE > '2021-10-05';


--	Display customer name and gender whose names start or end with character 'A'.

SELECT CUS_NAME, CUS_GENDER
FROM customer
WHERE CUS_NAME LIKE 'A%' OR CUS_NAME LIKE '%A';


-- 	Create a stored procedure to display supplier id, name, rating and Type_of_Service. For Type_of_Service, If rating =5, print “Excellent Service”,If rating >4 print “Good Service”, If rating >2 print “Average Service” else print “Poor Service”.

DELIMITER //

CREATE PROCEDURE GetSupplierService()
BEGIN
    SELECT
        supplier.SUPP_ID,
        supplier.SUPP_NAME,
        rating.RAT_RATSTARS AS Rating,
        CASE
            WHEN rating.RAT_RATSTARS = 5 THEN 'Excellent Service'
            WHEN rating.RAT_RATSTARS > 4 THEN 'Good Service'
            WHEN rating.RAT_RATSTARS > 2 THEN 'Average Service'
            ELSE 'Poor Service'
        END AS Type_of_Service
    FROM
        supplier
    JOIN
        rating ON supplier.SUPP_ID = rating.ORD_ID;
END //

DELIMITER ;

CALL GetSupplierService();