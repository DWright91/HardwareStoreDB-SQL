--
-- Part2 SQL Script
--

-- Drop tables.
drop table person cascade constraints;
drop table customer cascade constraints;
drop table employee cascade constraints;
drop table peopleAddress cascade constraints;
drop table wholesaleSuppliers cascade constraints;
drop table wholesaleSuppliersAddress cascade constraints;
drop table items cascade constraints;
drop table hardwareItems cascade constraints;
drop table services cascade constraints;
drop table servicesUseHardware cascade constraints;
drop table customerPurchases cascade constraints;
drop table deliveries cascade constraints;
drop table hardwarePurchasesFromWholesale cascade constraints;
drop table employeePerformedService cascade constraints;

-- Create tables.
create table person(
  pid char(10) not null,
  fname char(30) not null,
  constraint person_pid primary key (pid)
);

-- Insert data into person table.
insert into person values ('10234', 'Able');
insert into person values ('11567', 'Baker');
insert into person values ('3289', 'George');
insert into person values ('88331', 'Alice');
insert into person values ('74591', 'Jane');
insert into person values ('17645', 'Bill');

create table customer(
  cust_pid char(10) not null,
  fname char(30) not null,
  constraint customer_pidPK primary key (cust_pid),
  constraint customer_pid foreign key (cust_pid) references person(pid)
);

-- Insert data into customer table.
insert into customer values ('3289', 'George');
insert into customer values ('88331', 'Alice');
insert into customer values ('74591', 'Jane');
insert into customer values ('10234', 'Able');

create table employee(
  pid char(10) not null,
  fname char(30) not null,
  constraint employee_pidPK primary key (pid),
  constraint employee_pid foreign key (pid) references person(pid)
);

-- Insert data into employee table.
insert into employee values ('10234', 'Able');
insert into employee values ('11567', 'Baker');
insert into employee values ('3289', 'George');
insert into employee values ('88331', 'Alice');

create table peopleAddress(
  pid char(10) not null,
  streetAddress char(80) not null,
  city char(30) not null,
  state char(2) not null,
  constraint peopleAddress_pidPK primary key (pid),
  constraint peopleAddress_pid foreign key (pid) references person(pid)
);

-- Insert data into peopleAddress table.
insert into peopleAddress values (10234, '342 streetA', 'Monticello', 'MN');
insert into peopleAddress values (11567, '65 streetS', 'St. Cloud', 'MN');
insert into peopleAddress values (3289, '892 streetM', 'Minneapolis','MN');
insert into peopleAddress values (17645, '342 streetB', 'Monticello', 'MN');
insert into peopleAddress values (88331, '342 streetC', 'Monticello', 'MN');
insert into peopleAddress values (74591, '999 StreetG', 'Duluth', 'MN');

create table wholesaleSuppliers(
  wid char(10) not null,
  name char(20),
  constraint wholesaleSuppliers_widPK primary key (wid),
);

-- Insert data into wholesaleSuppliers table.
insert into wholesaleSuppliers (wid, name) values ('7760', 'ABC-Supply');
insert into wholesaleSuppliers values ('7761', 'MyHWCo');
insert into wholesaleSuppliers values ('98760', 'LightCo');

create table wholesaleSuppliersAddress(
  wid char(10) not null,
  streetAddress char(80) not null,
  city char(30) not null,
  state char(2) not null,
  constraint wholesaleSuppliersAddress_wid foreign key (wid) references wholesaleSuppliers(wid)
);

-- Insert data into wholesaleSuppliersAddress table.
insert into wholesaleSuppliersAddress values (7760, '60 streetG', 'St. Paul','MN');
insert into wholesaleSuppliersAddress values (7760, '75 streetT','Duluth','MN');
insert into wholesaleSuppliersAddress values (7761, '6 streetA', 'St. Paul','MN');
insert into wholesaleSuppliersAddress values (98760,' 798 StreetE', 'Duluth','MN');

create table items(
  iid char(10) not null,
  iname char(50),
  descr char(100),
  constraint items_iidPK primary key (iid)
);

-- Insert data into items table.
insert into items values (2, 'cement', '60lb. bag of cement');
insert into items values (4, 'paint', 'gallon of white paint');
insert into items values (10, 'nail', '2 inch nail');
insert into items values (12, 'nail', '3 inch nail');
insert into items values (14, 'nail', '4 inch nail');
insert into items values (16, 'bolt', '2 inch bolt');
insert into items values (20, 'light bulb', '40 watt');
insert into items values (22, 'light bulb', '60 watt');
insert into items values (24, 'light bulb', '10 watt LED');
insert into items values (26, 'light bulb', '14 watt LED');
insert into items values (28, 'glaze', '16 ounces');
insert into items values (29, 'grill', '40lb. barbeque');
insert into items values (30, 'key', 'key blank - type 1');
insert into items values (32, 'key', 'key blaink - type 2');
insert into items values (34, 'grass seed', '1 pound');
insert into items values (100, 'duplicate', 'type 1 key');
insert into items values (101, 'duplicate', 'type 2 key');
insert into items values (102, 'repair', 're-glaze window');
insert into items values (103, 'rent', 'seed spreader');

create table hardwareItems(
  iid char(10) not null,
  name char(20),
  description char(80),
  constraint hardwareItems_iidPK primary key (iid),
  constraint hardwareItems_iid foreign key (iid) references items(iid)
);

-- Insert data into hardwareItems table.
insert into hardwareItems values (2, 'cement', '60lb. bag of cement');
insert into hardwareItems values (4, 'paint', 'gallon of white paint');
insert into hardwareItems values (10, 'nail', '2 inch nail');
insert into hardwareItems values (12, 'nail', '3 inch nail');
insert into hardwareItems values (14, 'nail', '4 inch nail');
insert into hardwareItems values (16, 'bolt', '2 inch bolt');
insert into hardwareItems values (20, 'light bulb', '40 watt');
insert into hardwareItems values (22, 'light bulb', '60 watt');
insert into hardwareItems values (24, 'light bulb', '10 watt LED');
insert into hardwareItems values (26, 'light bulb', '14 watt LED');
insert into hardwareItems values (28, 'glaze', '16 ounces');
insert into hardwareItems values (29, 'grill', '40lb. barbeque');
insert into hardwareItems values (30, 'key', 'key blank - type 1');
insert into hardwareItems values (32, 'key', 'key blaink - type 2');
insert into hardwareItems values (34, 'grass seed', '1 pound');

create table services(
  iid char(10) not null,
  servname char(20),
  descript char(80),
  constraint services_iidPK primary key (iid),
  constraint serv_iid foreign key (iid) references items(iid)
);

-- Insert data into services table.
insert into services values (100, 'duplicate', 'type 1 key');
insert into services values (101, 'duplicate', 'type 2 key');
insert into services values (102, 'repair', 're-glaze window');
insert into services values (103, 'rent', 'seed spreader');

create table servicesUseHardware(
  service_iid char(10) not null,
  hardware_iid char(10) not null,
  constraint sUH_services_iid foreign key (service_iid) references services(iid),
  constraint sUH_hardware_iid foreign key (hardware_iid) references hardwareItems(iid)
);

-- Insert data into servicesUseHardware table.
insert into servicesUseHardware values (100, 30);
insert into servicesUseHardware values (101, 32);
insert into servicesUseHardware values (102, 28);
insert into servicesUseHardware values (103, 34);

create table customerPurchases(
  pid char(10) not null,
  iid char(10) not null,
  quantity char(10),
  price char(10),
  constraint customerPurchases_pid foreign key (pid) references person(pid),
  constraint ccustomerPurchases_iid foreign key (iid) references items(iid)
);

-- Insert data into customerPurchases table.
insert into customerPurchases values (3289, 100, 2, 2);
insert into customerPurchases values (3289, 101, 1, 1);
insert into customerPurchases values (3289, 29, 1, 300);
insert into customerPurchases values (88331, 26, 32, 160);
insert into customerPurchases values (88331, 24, 2, 20);
insert into customerPurchases values (88331, 20, 5, 25);
insert into customerPurchases values (88331, 4, 7, 70);
insert into customerPurchases values (74591, 4, 3, 90);
insert into customerPurchases values (74591, 28, 1, 5);
insert into customerPurchases values (74591, 20, 4, 12);
insert into customerPurchases values (74591, 103, 1, 10);
insert into customerPurchases values (10234, 2, 25, 125);
insert into customerPurchases values (10234, 14, 100, 5);
insert into customerPurchases values (10234, 16, 150, 15);
insert into customerPurchases values (10234, 100, 1, 1);

create table deliveries(
  customerPid char(10) not null,
  iid char(10) not null,
  streetAddress char(80),
  city char(30),
  state char(2),
  dates date,
  employeePid char(10) not null,
  constraint deliveries_CustomerPid foreign key (customerPid) references customer(cust_pid),
  constraint deliveries_iid foreign key (iid) references items(iid),
  constraint deliveries_employeePid foreign key (employeePid) references employee(pid)
);

-- Insert data into deliveries table.
insert into deliveries values (3289, 29, '65 streetS', 'St. Cloud', 'MN', to_date('08-31-2021', 'MM-DD-YYYY'), 3289);
insert into deliveries values (74591, 4, '344 streetA', 'Monticello', 'MN', to_date('09-10-2021', 'MM-DD-YYYY'), 3289);

create table hardwarePurchasesFromWholesale(
  iid char(10) not null,
  wid char(10) not null,
  quantity char(10),
  unitCost number(10,2),
  constraint hPFWholesale_iid foreign key (iid) references hardwareItems(iid),
  constraint hPFWholesale_wid foreign key (wid) references wholesaleSuppliers(wid)
);

-- Insert data into hardwarePurchasesFromWholesale table.
insert into hardwarePurchasesFromWholesale values (2, 7760, 50, 3);
insert into hardwarePurchasesFromWholesale values (16, 7760, 1440, 0.05);
insert into hardwarePurchasesFromWholesale values (29, 7761, 10, 200);
insert into hardwarePurchasesFromWholesale values (24, 98760, 100, 5);
insert into hardwarePurchasesFromWholesale values (26, 98760, 250, 6);
insert into hardwarePurchasesFromWholesale values (14, 7761, 20000, 0.02);
insert into hardwarePurchasesFromWholesale values (28, 7760, 288, 2);

create table employeePerformedService(
  employeePid char(10) not null,
  customerPid char(10) not null,
  iid char(10) not null,
  dates date,
  hours_ number(10,1),
  constraint ePS_employeePid foreign key (employeePid) references employee(pid),
  constraint ePS_customerPid foreign key (customerPid) references customer(cust_pid),
  constraint ePS_iid foreign key (iid) references services(iid)
);

-- Insert data into employeePerformedService table.
insert into employeePerformedService values (11567, 3289, 100, to_date('09-09-2021', 'MM-DD-YYYY'), 0.1);
insert into employeePerformedService values (11567, 3289, 101, to_date('09-08-2021', 'MM-DD-YYYY'), 0.1);
insert into employeePerformedService values (10234, 10234, 100, to_date('09-12-2021', 'MM-DD-YYYY'), 0.1);

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- STEP 1).
-- 1). Write a SQL statement to alter person table, add column lname,
-- to be of type char(30), make sure lname is next to fname,
-- write insert statements for lnames.
alter table person
add lname char(30);

UPDATE person
SET lname = 'Jackson'
WHERE pid = 10234;

UPDATE person
SET lname = 'Laker'
WHERE pid = 11567;

UPDATE person
SET lname = 'Bonjour'
WHERE pid = 3289;

UPDATE person
SET lname = 'laland'
WHERE pid = 88331;

UPDATE person
SET lname = 'Jones'
WHERE pid = 74591;

UPDATE person
SET lname = 'Smith'
WHERE pid = 17645;

-- 2). Write a SQL statement to alter person table, add a column named
-- email to be of type char(100), write insert statements for emails.
alter table person
add email char(100);

UPDATE person
SET email = 'able.jackson@partsnservices.com'
WHERE pid = 10234;

UPDATE person
SET email = 'baker.laker@partsnservices.com'
WHERE pid = 11567;

UPDATE person
SET email = 'george.bonjour@partsnservices.com'
WHERE pid = 3289;

UPDATE person
SET email = 'alice.laland@partsnservices.com'
WHERE pid = 88331;

UPDATE person
SET email = 'jane.jones@wholesalenparts.com'
WHERE pid = 74591;

UPDATE person
SET email = 'billRsmith22@gmail.com'
WHERE pid = 17645;

-- 3). Wrtie a trigger to insert a person in the Person table when
--     a new employee is inserted in the Employee table.
--     make sure your trigger generates a new email for the employee.
--     The email will have the format of: fname.lname@partsnservices.com,
--     write insert statements to add the following two new employees.
alter table employee
add lname char(30);

CREATE OR REPLACE TRIGGER employee_to_person
    AFTER INSERT ON employee
    FOR EACH ROW
BEGIN
    INSERT INTO person (pid, fname, lname)
    VALUES (:NEW.pid, :NEW.fname, :NEW.lname);
    UPDATE person
        SET email = :NEW.fname || '.' || :NEW.lname  || '@partsnservices.com'
        WHERE pid = :NEW.pid;
END;

insert into employee values (32722, 'Chris', 'Rock');
insert into employee values (32700, 'Will', 'Smith');

-- 5). Create a procedure to display the name and description of the service
--     and the name and description of the hardware items each service needs.
--     after calling the procedure, the results should show a single line of
--     text for each service.
--     i.e. Service: duplicate, type 1 key needs the following hardware: key, key blank - type 1
CREATE OR REPLACE PROCEDURE DisplayServ_Hard
  (
    Service_id IN INTEGER,
    temp OUT VARCHAR2,
    temp2 OUT VARCHAR2
  )
AS
BEGIN
    SELECT DESCRIPT INTO temp
    FROM SERVICES
    WHERE IID = Service_id;

    SELECT HARDWARE_IID INTO temp2
    FROM SERVICESUSEHARDWARE
    WHERE SERVICE_IID = Service_id;

    DBMS_OUTPUT.PUT_LINE(temp || 'needs the following hardware: ' || temp2);
END;
-- Called within SQL Developer Procedures File.
-- Call the procedure i.e.
DECLARE @Service_id NUMBER, @tempOut VARCHAR2, @temp2Out VARCHAR2;
EXEC DisplayServ_Hard @Service_id = 102,
                      @temp = tempOut OUTPUT,
                      @temp2 =  temp2Out OUTPUT;
EXEC DisplayServ_Hard 102, @tempOut OUTPUT, @temp2Out OUTPUT;

-- 7). Write a SQL script to create a view that includes all information in the
--     hardware store purchase table. Include in the view a column showing the
--     total purchase for each item.
alter table HardwareStorePurchases
add total number(10, 2);

UPDATE hardwarePurchasesFromWholesale
SET total = quantity * unitCost;

CREATE VIEW HardwareStorePurchases AS
SELECT *
FROM hardwarePurchasesFromWholesale;

-- STEP 2).
-- QUERIES:---------------------------------------------------------------------
-- 1). List the complete addresses of People who are both Customers and
--     Employees, and include their names in your result. For example, the
--     output would have a single column and several rows similar to the
--     following: George lives at 892 streetM Minneapolis, MN
SELECT pid, streetAddress, city, state
FROM peopleAddress
WHERE pid IN (SELECT pid FROM employee)
AND pid IN (SELECT pid FROM customer);

--OR 
SELECT
CONCAT(CONCAT(pid, ' LIVES AT: '),
CONCAT(CONCAT(streetAddress, ' '),
CONCAT(CONCAT(city, ' '), state))) "LOCATED"
FROM peopleAddress
WHERE pid IN (SELECT pid FROM employee)
AND pid IN (SELECT pid FROM customer);

-- 2). List the items that were delivered to an address where neither a customer
--     lives nor a wholesale supplier is located at. Show in your result the
--     item iid and description as well as the complete address.
SELECT items.iid,
       items.descr,
       deliveries.streetAddress,
       deliveries.city,
       deliveries.state
FROM items, deliveries, wholesaleSuppliers, customer
WHERE deliveries.customerPid
NOT IN (SELECT wid FROM wholesaleSuppliers)
AND deliveries.customerPid
NOT IN (SELECT cust_pid FROM customer);

-- 3). How many people have bought one or more hardware items and no services?
--     include the name of those people and the items they bought in your results.
SELECT COUNT(DISTINCT pid)
FROM customerPurchases
WHERE iid IN (SELECT iid FROM hardwareItems);

--OR with names.
DECLARE
total int;
BEGIN
SELECT COUNT(DISTINCT pid) INTO total
FROM customerPurchases
WHERE iid IN (SELECT iid FROM hardwareItems);
DBMS_OUTPUT.PUT_LINE('NUM = ' || total);
FOR MY_CURSOR IN (
                    SELECT fname FROM person
                    WHERE pid IN
                    (SELECT DISTINCT pid
                    FROM customerPurchases
                    WHERE iid IN (SELECT iid FROM hardwareItems))
                  )
  LOOP
    DBMS_OUTPUT.PUT_LINE(MY_CURSOR.fname);
  END LOOP;
END;

-- 4). List the customers who made the least expensive hardware purchase
--     in a single transaction; consider the price paid, not the per-unit price.
--     Include the customer name, pid, hardware iid, and price.
SELECT customer.fname,
       customer.cust_pid,
       customerPurchases.iid,
       customerPurchases.price
FROM customer
JOIN customerPurchases
ON customer.cust_pid = customerPurchases.pid
WHERE customerPurchases.iid IN (SELECT iid FROM hardwareItems)
AND customerPurchases.price = (SELECT MIN(price) FROM customerPurchases);

-- 5). List the pids and names of the people who bought a service that they
--     did not perform for themselves.
SELECT DISTINCT pid
FROM (SELECT pid FROM customerPurchases
  WHERE iid IN (Select service_iid FROM servicesUseHardware)) hs
  JOIN customer ct ON ct.cust_pid = hs.pid
  WHERE ct.cust_pid NOT IN (SELECT customerPid FROM employeePerformedService);

-- 6). For the services that use hardware, list the service iid, name, and
--     description; also list the iid, name, and description of the
--     hardware used.
SELECT services.iid, services.servname, services.descript,
       hardwareItems.iid, hardwareItems.name, hardwareItems.description
FROM servicesUseHardware
JOIN services
ON servicesUseHardware.service_iid = services.iid
JOIN hardwareItems
ON servicesUseHardware.hardware_iid = hardwareItems.iid;

-- 7). For each employee indicate whether they have performed a service or
--     delivered an item. Each row in the resulting table should have four
--     columns: Employee pid, name, service, and delivery.
--     If they have delivered an item, then indicated "yes" for the delivery
--     attribute; if they have performed a service, then indicate "yes" for
--     the service attribute; otherwise, the attribute value is to be "no".
--     Employees must be listed only once. In addition, each employee is to be
--     listed even if they performed no service or delivery.
--     The output must be sorted by pid.
SELECT a.pid, a.fname,
CASE
    WHEN COUNT(b.iid) > 0
      THEN 'YES'
      ELSE 'NO'
    END
    AS has_performed,
CASE
    WHEN COUNT(c.iid) > 0
      THEN 'YES'
      ELSE 'NO'
    END
    AS has_delivered
FROM employee a
LEFT JOIN employeePerformedService b ON a.pid = b.employeePid
LEFT JOIN deliveries c ON a.pid = c.employeePid
GROUP BY a.pid, a.fname;

-- 8). For each hardware item, compute the total quantity that has been sold to
--     customers, and the total quantity that has been bought from wholesale
--     suppliers. Hardware items must be listed even if they have a zero total
--     quantity for the number bought or sold. List the hardware item iid and
--     the two total quantity values. Output must be sorted by iid.
--     One single table is to be produced.
SELECT h.iid, sum(c.quantity), sum(p.quantity)
FROM hardwareItems h,customerPurchases c, hardwarePurchasesFromWholesale p
GROUP BY h.iid
ORDER BY h.iid;

-- Extra Credit (two additional queries):
SELECT * FROM person
WHERE fname LIKE 'J%';

SELECT * FROM person
WHERE email NOT LIKE '%@partsnservices.com%';
