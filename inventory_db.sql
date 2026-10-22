--Part 2--
--STEP 6------------------------------------
--CREATE TABLE WITH DATA INCLUDING COLUMNS AND 
--SPECIFY DATA TYPES AND CONSTAINTS
CREATE TABLE INVENTORY 
(item_id INT NOT NULL,
item_name VARCHAR(40) NOT NULL,
category VARCHAR(30),
quantity INT,
unit_cost DECIMAL(7,2),
recieved_on DATE,
PRIMARY KEY(item_id));

DESCRIBE INVENTORY;

--STEP 7------------------------------------
--INSERT THREE RECORDS THEN SELECT EVERY ROW 
--AND COLUMN
--INSERT EACH VALUE TO TABLE AND SELECT TO SEE RESULTS
INSERT INTO INVENTORY VALUES (1, 'Laser Mouse', 'Peripherals', 25, 18.50, '2026-02-10');
INSERT INTO INVENTORY VALUES (2, 'Mechanical Keyboard', 'Peripherals', 12, 64.00, '2026-03-05');
INSERT INTO INVENTORY VALUES (3, 'USB Hub', 'Accessories', 40, 22.75, '2026-04-18');

SELECT * FROM INVENTORY;
--STEP 8------------------------------------
--SELECT these attributes from allthree items to see orignal price
SELECT item_id, item_name, unit_cost FROM INVENTORY
--Update row to change price of item 2
UPDATE INVENTORY SET unit_cost = 59.99 WHERE item_id=2;
--RUN SELECT AGAIN TO PROVE NEW UPDATED PRICE
SELECT * FROM INVENTORY 

--STEP 9--------------------------------------
--CREATE VIEW and order by most valuable, work in new column total_cost
CREATE VIEW INVENTORY_VALUE AS
SELECT item_name, quantity, unit_cost, (quantity * unit_cost) AS total_value
FROM INVENTORY
ORDER BY total_value DESC
--SELECT VIEW TO ENSURE RESULTS
SELECT * FROM INVENTORY_VALUE

--STEP 10------------------------------------
--Create copy of table which did not bring primary key with it.
--Not null did copy so we need to put key on.
 CREATE TABLE INVENTORY_COPY1 AS
 SELECT *
 FROM INVENTORY;

 DESCRIBE INVENTORY_COPY1

 --Alter copy to add primary key
 Alter TABLE INVENTORY_COPY1
 ADD PRIMARY KEY (item_id);

 --After running describe statement again key is now added.
--Prove it took by inserting a row already in copy
-- INSERT INTO INVENTORY_COPY1 VALUES (1, 'Laser Mouse', 'Peripherals', 25, 18.50, '2026-02-10');
--Error because it is already in new table so it failed as expected

--STEP 11---------------------------------------

--Create account
--creates a user and account
CREATE USER 'stockclerk'@'localhost' IDENTIFIED BY 'Stock#2026';
--Looks at every account in server
SELECT user, host FROM mysql.user ORDER BY user;

