--
-- Part1 SQL Script
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
