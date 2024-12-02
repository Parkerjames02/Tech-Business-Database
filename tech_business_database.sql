-- This is used to create the database schema called tech_business_database
Create Schema tech_business_database;

-- This is used to set the selected schema to tech_business_database
Use tech_business_database;

-- This is used to create a table called Store
Create Table Store (
store_id int not null,
location varchar(250),
owner_name varchar(250),
-- This is used to set store_id as the primary key of the table
Primary Key (store_id)
);

-- This is used to create a table called Employee
Create Table Employee (
employee_id int not null,
store_id int not null,
employee_name varchar(250),
position varchar(250),
join_date date,
-- This is used to set employee_id as the primary key of the table
Primary Key (employee_id),
-- This is used to set store_id as a foreign key that references the primary key in the Store table
Foreign Key (store_id) References Store(store_id)
);

-- This is used to create a table called Customer
Create Table Customer (
customer_id int not null,
customer_name varchar(250),
last_purchase_date date,
is_store_member bool,
membership_join_date date,
-- This is used to set customer_id as the primary key of the table
Primary Key (customer_id)
);

-- This is used to create a table called PurchaseInformation
Create Table PurchaseInformation (
purchase_id int not null,
store_id int not null,
customer_id int not null,
employee_id int not null,
products_purchased varchar(250),
total_cost dec(10,2),
purchase_date date,
-- This is used to set purchase_id as the primary key of the table
Primary Key (purchase_id),
-- This is used to set store_id as a foreign key that references the primary key in the Store table
Foreign Key (store_id) References Store(store_id),
-- This is used to set customer_id as a foreign key that references the primary key in the Customer table
Foreign Key (customer_id) References Customer(customer_id),
-- This is used to set employee_id as a foreign key that references the primary key in the Employee table
Foreign Key (employee_id) References Employee(employee_id)
);

-- This is used to insert values for the store_id, location, and owner_name columns in the Store table
-- Five rows of data are inserted into the table to store data for five different stores
Insert Into Store (store_id, location, owner_name)
Values
(1, 'Folsom, CA', 'Ronald Berry'),
(2, 'Carmichael, CA', 'Rochelle Blair'),
(3, 'Rancho Cordova, CA', 'Joyce Pearce'),
(4, 'Citrus Heights, CA', 'Vicki Solis'),
(5, 'Elk Grove, CA', 'Kelly Bell');

-- This is used to insert values for the employee_id, store_id, employee_name, position, and join_date in the Employee table
-- Twenty rows of data are inserted into the table to store data for twenty different employees
Insert Into Employee (employee_id, store_id, employee_name, position, join_date)
Values
(1, 5, 'Keith Gray', 'Inventory Manager', ('2019-1-31')),
(2, 2, 'Jarred Cruz', 'Store Manager', ('2022-4-6')),
(3, 1, 'Leah Daniel', 'Inventory Manager', ('2024-6-1')),
(4, 3, 'Billie Burgess', 'Store Associate', ('2023-4-20')),
(5, 4, 'Bart Hester', 'Store Manager', ('2021-9-23')),
(6, 4, 'Minerva Guzman', 'Inventory Manager', ('2020-10-15')),
(7, 2, 'Ulysses Clements', 'Inventory Manager', ('2022-2-26')),
(8, 1, 'Alma Ware', 'Receptionist', ('2022-9-19')),
(9, 3, 'Seymour Jenson', 'Store Manager', ('2021-7-18')),
(10, 5, 'Pearl Duncan', 'Receptionist', ('2021-9-6')),
(11, 5, 'Mac Delacruz', 'Store Associate', ('2022-3-16')),
(12, 3, 'Antonio Miller', 'Receptionist', ('2019-11-22')),
(13, 2, 'Richie Buchanan', 'Receptionist', ('2024-4-15')),
(14, 1, 'Wilton Avila', 'Store Associate', ('2022-3-2')),
(15, 4, 'Elliot Case', 'Receptionist', ('2021-11-8')),
(16, 5, 'Rod Vaughan', 'Store Manager', ('2023-6-20')),
(17, 3, 'Leroy Shaffer', 'Inventory Manager', ('2019-9-1')),
(18, 2, 'Gale Collins', 'Store Associate', ('2022-2-1')),
(19, 1, 'Walker Dillon', 'Store Manager', ('2021-3-3')),
(20, 4, 'Claud Sharp', 'Store Associate', ('2022-11-15'));

-- This is used to insert values for the customer_id, customer_name, last_purchase_date, is_store_member, and membership_join_date in the Customer table
-- Twenty rows of data are inserted into the table to store data for twenty different customers
Insert Into Customer (customer_id, customer_name, last_purchase_date, is_store_member, membership_join_date)
Values
(1, 'Enoch Pruitt', ('2023-6-11'), false, NULL),
(2, 'Tom Hamilton', ('2022-1-16'), false, NULL),
(3, 'Lyle Friedman', ('2023-9-4'), true, ('2022-6-21')),
(4, 'Aurelia Silva', ('2023-3-29'), false, NULL),
(5, 'Pete Knox', ('2023-12-23'), false, NULL),
(6, 'Hazel Sullivan', ('2024-2-10'), false, ('2023-4-12')),
(7, 'Gino Blake', ('2022-4-4'), false, NULL),
(8, 'Trisha Massey', ('2023-1-18'), true, ('2021-3-18')),
(9, 'Colette Tapia', ('2022-5-3'), false, NULL),
(10, 'Densie Huff', ('2022-9-25'), false, NULL),
(11, 'Randy Carpenter', ('2023-2-16'), true, ('2022-1-23')),
(12, 'Ezra Joyce', ('2023-12-14'), false, NULL),
(13, 'Alyce Ortiz', ('2024-8-29'), false, NULL),
(14, 'Wilburn Cardenas', ('2024-3-20'), true, ('2022-9-2')),
(15, 'Jon Thornton', ('2023-4-30'), false, NULL),
(16, 'Mallory Paul', ('2024-2-17'), true, ('2022-7-6')),
(17, 'Candy Conrad', ('2024-8-9'), false, NULL),
(18, 'Geraldine Booth', ('2024-5-19'), false, NULL),
(19, 'Bobbi Carr', ('2022-6-4'), false, NULL),
(20, 'Andy Bolton', ('2023-8-10'), true, ('2022-11-30'));

-- This is used to insert values for the purchase_id, store_id, customer_id, employee_id, products_purchased, total_cost, and purchase_date in the PurchaseInformation table
-- Twenty rows of data are inserted into the table to store data for twenty different purchases
Insert Into PurchaseInformation (purchase_id, store_id, customer_id, employee_id, products_purchased, total_cost, purchase_date)
Values
(1, 2, 11, 10, '1x Samsung 12.4 in. Galaxy Tablet', 543.00, ('2023-2-16')),
(2, 5, 3, 12, '2x CRUA 30" Curved Gaming Monitor', 287.98, ('2023-9-4')),
(3, 3, 15, 10, '1x ASUS VivoWatch SP(HC-A05)', 180.00, ('2023-4-30')),
(4, 1, 8, 12, '1x Sony ZV-E10 Mirrorless Camera', 694.95, ('2023-1-18')),
(5, 4, 2, 15, '3x Bose SoundLink Micro Bluetooth Speaker', 357.00, ('2022-1-16')),
(6, 4, 12, 10, '2x Beyerdynamic DT 990 PRO Studio Headphones', 359.98, ('2023-12-14')),
(7, 1, 5, 10, '1x Samsung Galaxy A55', 344.99, ('2023-12-23')),
(8, 3, 18, 13, '1x Google Pixel 7a', 384.99, ('2024-5-19')),
(9, 5, 6, 12, '1x Meta Oculus Quest 2', 479.99, ('2024-2-10')),
(10, 2, 2, 15, '2x ASUS ROG Gladius III Wired Gaming Mouse', 89.98, ('2022-1-16')),
(11, 2, 1, 12, '1x MOUNTAIN Everest Max Mechanical Gaming Keyboard', 149.99, ('2023-6-11')),
(12, 4, 4, 10, '1x NETGEAR High-Speed Cable Modem', 119.99, ('2023-3-29')),
(13, 1, 17, 13, '3x TP-Link USB Bluetooth Adapter', 44.97, ('2024-8-9')),
(14, 3, 13, 13, '1x Microsoft Xbox Series S', 299.00, ('2024-8-29')),
(15, 1, 19, 15, '2x Xbox Wireless Controller', 49.99, ('2022-6-4')),
(16, 4, 16, 12, '2x Tripp Lite Power Extension Cord', 59.95, ('2024-2-17')),
(17, 5, 14, 10, '1x MSI Cyborg Gaming Laptop', 799.99, ('2024-3-20')),
(18, 5, 10, 8, '3x Belkin Thunderbolt 3 Dock Core', 107.97, ('2022-9-25')),
(19, 1, 9, 15, '3x ORICO Aluminum M.2 NVMe SSD', 37.77, ('2022-5-3')),
(20, 3, 7, 15, '1x AuuSda Windows 11 Pro Home Laptop', 199.98, ('2022-4-4'));

-- These are all select statements that show all of the data contained within each table
Select * From Store;
Select * From Employee;
Select * From Customer;
Select * From PurchaseInformation;

-- This select statement is used to view information about the customer and their purchase
Select purchase_id, customer_name, products_purchased, total_cost, purchase_date
From PurchaseInformation
-- This inner join allows us to retrieve data from the Customer table and include it in the select statement
Inner Join Customer
On Customer.customer_id = PurchaseInformation.customer_id;

-- This select statment is used to see information for purchases that exceeded $300
Select purchase_id, customer_name, products_purchased, total_cost, purchase_date
From PurchaseInformation
-- This inner join allows us to retrieve data from the Customer table and include it in the select statement
Inner Join Customer
On Customer.customer_id = PurchaseInformation.customer_id
-- This is where the selection is limited to purchases that exceeded $300
Where total_cost >= 300;

-- This select statement pulls up information about the purchase, where the purchase took place, and the receptionist that assisted in the purchase
-- This select statement could be used for customers that file complaints for getting improperly charged
Select purchase_id,  customer_name, location, employee_name, total_cost, purchase_date
From PurchaseInformation
-- This inner join allows us to retrieve data from the Customer table and include it in the select statement
Inner Join Customer
On Customer.customer_id = PurchaseInformation.customer_id
-- This inner join allows us to retrieve data from the Store table and include it in the select statement
Inner Join Store
On Store.store_id = PurchaseInformation.store_id
-- This inner join allows us to retrieve data from the Employee table and include it in the select statement
Inner Join Employee
On Employee.employee_id = PurchaseInformation.employee_id
Order By purchase_id;

-- This select statement pulls up information about the customers but only if they are a store member
Select customer_id, customer_name, is_store_member, membership_join_date
From Customer
-- This is where the selection is limited to customers that are store members
Where is_store_member = true;

-- This select statement pulls up information about the employees but only if they are a store manager
Select employee_id, employee_name, position, join_date
From Employee
-- This is where the selection is limited to employees that are store managers
Where position = 'Store Manager';

-- This select statement pulls up information about the different stores, the owner of the stores, and the employees that work there
Select n.store_id, s.location, s.owner_name, n.employee_name
From Employee n
-- This inner join allows us to retrieve data from the Store table and include it in the select statement
Inner Join Store s
On s.store_id = n.store_id;

Select * from Customer;

-- This update statement allows the date of the last purchase to be changed for any specific customer
-- I used this update statement to change Enoch Pruitt's last purchase date to today (2024-10-12)
Update Customer
Set last_purchase_date = ('2024-10-12')
-- This is where I am able to select Enoch's row of data
Where customer_id = 1;

-- This update statement changes a customers membership status to true and inputs a membership join date
-- I used this update statement to change Enoch Pruitt's membership status and join date
Update Customer
Set is_store_member = true, membership_join_date = ('2024-10-12')
-- This is where I am able to select Enoch's row of data
Where customer_id = 1;

-- This update statement changes the date of the last purchase for Enoch Pruitt to the initial date (2023-6-11)
Update Customer
Set last_purchase_date = ('2023-6-11')
-- This is where I am able to select Enoch's row of data
Where customer_id = 1;

-- This update statement changes the membership status back to false and the membership join date back to null
Update Customer
Set is_store_member = false, membership_join_date = NULL
-- This is where I am able to select Enoch's row of data
Where customer_id = 1;

Select * From Store;

-- This update statement changes the owner of the store to Erwin Woods
Update Store
Set owner_name = 'Erwin Woods'
-- This is where I am able to select the first stores row of data
Where store_id = 1;

-- This update statement changes the owner back to Ronald Berry
Update Store
Set owner_name = 'Ronald Berry'
-- This is where I am able to select the first stores row of data
Where store_id = 1;

Select * From Employee;

-- This update statement changes the position of Keith Gray to Store Manager
Update Employee
Set position = 'Store Manager'
-- This is where I am able to select Keith Grays row of data
Where employee_id = 1;

-- This update statement changes the position of Jarred Cruz to Inventory Manager
Update Employee
Set position = 'Inventory Manager'
-- This is where I am able to select Jarred Cruz row of data
Where employee_id = 2;

-- This update statement changes the position of Keith Gray back to Inventory Manager
Update Employee
Set position = 'Inventory Manger'
-- This is where I am able to select Keith Grays row of data
Where employee_id = 1;

-- This update statement changes the position of Jarred Cruz back to Store Manager
Update Employee
Set position = 'Store Manager'
-- This is where I am able to select Jarred Cruz row of data
Where employee_id = 2;