# Hardware Store DB - SQL

Part1.sql:

Step 1):

Draw an ER diagram that depicts the following situation. You must show all relevant entity sets, relationship sets, attributes, and key constraints/participation.

    1.	A person has a name and a unique personal id. People may live at one or more addresses. Each address may be associated with one or more people.
    2.	An address consists of a street address, a city, and a state. The combination of these attributes is unique for a given address.
    3.	An Employee is a Person; a Customer is a Person.
    4.	Customers may buy Items from the hardware store. Each sale of an item specifies the quantity and price of the item that was bought. Items have a unique id, a name, and a description.
    5.	A Service and Hardware are Items.
    6.	Employees may perform services for Customers. The date and number of hours that an employee spends performing a service are recorded. All services are performed by one or more employees.
    7.	Hardware items may be used when a service is performed.
    8.	Hardware items are bought from a supplier at wholesale prices. The purchase is for a fixed quantity at a given unit price (in dollars).
    9.	A supplier has a unique supplier id and a name. All suppliers are located at one or more Addresses.
    10.	Purchased items may be delivered by an employee to the address specified by the Customer. The delivery date is recorded.

![image](https://github.com/DWright91/HardwareStoreDB-SQL/assets/94549091/20ca2052-07e7-4f58-b284-0f30cf8dbda4)



Step 2):


In this step, you will create the tables in the ER diagram, populate the tables with the given data, and write SQL statements to display data.

1). Create: Convert the ER diagram into a set of schemas. Create the corresponding tables. You should have a table for each entity set or relationship set in the diagram. 

2). Insert: Insert the following information into the appropriate tables. (Data is meant to depict fictitious situations). Note that the data in the following lists may have to be put into more than one table; that is, the lists do not always correspond to a table.

The following are the addresses of people (pid, streetAddress, city, state):

    10234, 342 streetA, Monticello, MN
    11567, 65 streetS, St. Cloud, MN
    3289, 892 streetM, Minneapolis, MN
    17645, 342 streetB, Monticello, MN
    88331, 342 streetC, Monticello, MN
    74591, 999 StreetG, Duluth, MN
    13245, 344 streetA, Monticello, MN

The following are addresses where wholesale suppliers are located (wid, streetAddress, city, state):

    7760, 60 streetG, St. Paul, MN
    7760, 75 streetT, Duluth, MN
    7761, 6 streetA, St. Paul, MN
    98760, 798 StreetE, Duluth, MN

The following is information about people who are employees (pid, name):

    10234, Able
    11567, Baker
    3289, George
    88331, Alice

The following is information about people who are customers (pid, name):

    3289, George
    88331, Alice
    74591, Jane
    10234, Able

The following is information about people who are neither customers nor employees (pid, name):

    17645, Bill

The following is information about Wholesale Suppliers (wid, name):

    7760, ABC-Supply
    7761, MyHWCo
    98760, LightCo

The following are the hardware items (iid, name, description):

    2, cement, 60 lb, bag of cement
    4, paint, gallon of white paint
    10, nail, 2 inch nail
    12, nail, 3 inch nail
    14, nail, 4 inch nail
    16, bolt, 2 inch bolt
    20, light bulb, 40 watt
    22, light bulb, 60 watt
    24, light bulb, 10 watt LED
    26, light bulb, 14 watt LED
    28, glaze, 16 ounces
    29, grill, 40 lb. barbeque
    30, key, key blank – type 1
    32, key, key blank – type 2
    34, grass seed, 1 pound

The following are services (iid, name, description):

    100, duplicate, type 1 key
    101, duplicate, type 2 key
    102, repair, re-glaze window
    103, rent, seed spreader

The following services use hardware that is given to the customer as part of the service (service-iid, hardware-iid):

    100, 30
    101, 32
    102, 28
    103, 34

Customer purchases are as follows (pid, iid, quantity, price):

    3289, 100, 2, 2
    3289, 101, 1, 1
    3289, 29, 1, 300
    88331, 26, 32, 160
    88331, 24, 2, 20
    88331, 20, 5, 25
    88331, 4, 7, 70
    74591, 4, 3, 90
    74591, 28, 1, 5
    74591, 20, 4, 12
    74591, 103, 1, 10
    10234, 2, 25, 125
    10234, 14, 100, 5
    10234, 16, 150, 15
    10234, 100, 1, 1

Deliveries were as follows (customer pid, iid, streetAddress, city, state, date, employee pid):

    3289, 29, 65 streetS, St. Cloud, MN, 8/31/21, 3289
    74591, 4, 344 streetA, Monticello, MN, 9/10/21, 3289

The hardware store made the following recent purchases from the indicated wholesale supplier (iid, wid, quantity, unit-cost):

    2, 7760, 50, 3
    16, 7760, 1440, 0.05
    29, 7761, 10, 200
    24, 98760, 100, 5
    26, 98760, 250, 6
    14, 7761, 20000, 0.02
    28, 7760, 288, 2

The following employees have performed the indicated service (employee-pid, customer-pid, iid, date, hours):

    11567, 3289, 100, 09/09/21, 0.1
    11567, 3289, 101, 09/08/21, 0.1
    10234, 10234, 100, 09/12/21, 0.1

------------------------------------------------------------------------------------
Part2.sql

Step 1):

1).	Write a SQL statement to alter the Person table to add a column named lname (last name) to be of type char (30).  Make sure the last name field is next to the first name field. Write insert/update statements to insert the following data in the Person Table:

    Jackson (last name for Able)
    Laker (last name for Baker)
    Bonjour (last name for George)
    Laland (last name for Alice)
    Jones (last name for Jane)
    Smith (last name for Bill)

2).	Write a SQL statement to alter the Person table to add a column named email to be of type char(100). The email field is the last one on the table. Write insert statements to insert the following data in the Person table. 

    able.jackson@partsnservices.com (email for Able)
    baker.laker@partsnservices.com (email for Baker)
    george.bonjour@partsnservices.com (email for George)
    alice.laland@partsnservices.com (email for Alice)
    jane.jones@wholesalenparts.com (email for Jane)
    billRsmith22@gmail.com (email for Bill)

3).	Write a trigger to insert a person in the Person table when a new employee is inserted in the Employee table. Make sure your trigger generates a new email for the employee. The email will have the format of: fname.lname@partsnservices.com Write insert statements to add the following two new employees. 

    32722 Chris Rock
    32700 Will Smith

4).	(Graduate Students Only) Write a trigger to insert a person in the Person table when a new customer is inserted in the Customer table. In your trigger, before inserting the new person, make sure the person does not already exist in the person table. You don't want to insert the same customer twice on the Person table. This is necessary here because an employee can also be a customer. No need to generate a new email for a customer; the email will be part of the insert statement. Write insert statements to add the following two new customers.

    32722 Chris Rock
    32327 Lupita Nyongo lupita.nyongo@oscar.com

5).	Create a procedure to display the name and description of the service and the name and description of the hardware items each service needs. After calling the procedure, the results should show a single line of text for each service as shown in the following example.

    Service: duplicate, type 1 key needs the following hardware: key, key blank - type 1

6).	(Graduate Students Only) Create a procedure to display the details of a purchase made by a given customer. You will pass the pid of the customer to the procedure. The procedure will then display the name, id, address, the name of the items purchased, quantity, and the total amount for the items purchased. 

    George Bonjour (PID 3289), Address: 892 StreetM, Minneapolis, MN, Purchases: <list each item purchased, quantity, and price here>

7).	Write a SQL script to create a view that includes all information in the hardware store purchase table. Include in the view a column showing the total purchase for each item. 

Step 2):

Write and perform the following queries using SQL (Required Queries): 

    1.	List the complete addresses of People who are both Customers and Employees, and include their names in your result. For example, the output would have a single column and several rows similar to the following:
            George lives at 892 streetM Minneapolis, MN
    2.	List the items that were delivered to an address where neither a customer lives nor a wholesale supplier is located at. Show in your result the Item iid and description as well at the complete address.
    3.	How many people have bought one or more hardware items and no services? Include the name of those people and the items they bought in your results.
    4.	List the customers who made the least expensive hardware purchase in a single transaction; consider the price paid, not the per-unit price. Include the customer name, pid, hardware iid, and price.
    5.	List the pids and names of the people who bought a service that they did not perform for themselves.
    6.	For the services that use hardware, list the service iid, name, and description; also list the iid, name, and description of the hardware used.
    7.	For each employee indicate whether they have performed a service or delivered an item. Each row in the resulting table should have four columns: Employee pid, name, service, and delivery. If they have delivered an item, then indicated         "yes" for the delivery attribute; if they have performed a service, then indicate "yes" for the service attribute; otherwise, the attribute value is to be "no". Employees must be listed only once. In addition, each employee is to be         listed even if they performed no service or delivery. The output must be sorted by pid.
    8.     For each hardware item, compute the total quantity that has been sold to customers, and the total quantity that has been bought from Wholesale suppliers. Hardware items must be listed even if they have a zero total quantity for the            number bought or sold. List the hardware item iid and the two total quantity values. Output must be sorted by iid. One single table is to be produced. 

Important Notes:	

    1.	The display of duplicate tuples must be eliminated.
    2.	Your queries must be capable of producing correct results for ANY instance of the tables.
    3.	Include a justification of the results of your queries

