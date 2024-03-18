# DataBase

## In this repository you will see:

### Introduction to databases:
#### -Entity_Relationship Model
#### -Normal Forms
#### -Fundamentals and Introduction
#### -Practical + Partial + Final Work:

### Database 1:
#### -Stored Procedures
#### -Triggers
#### -Indices
#### -Mysql Procedures and Functions
#### -cursor
#### -Procedure with output parameters
#### -Industrial Work:

### Database 2:
#### -Introduction to NoSQL databases
#### -MongoDB / Construction work environment
#### -JSON format / Serialization of information
#### -Datawarehousing
#### -Introductory + Partial Work

## --------------------------------------------------

## PRACTICAL WORK (INTRODUCTION)
### It is requested:
#### 1.Generate the SQL script to create the schema solved in Activity 04 (Charter flight company).
#### 2.Generate the SQL script to insert the existing data in the “Activity 10 Data.xlsx” form
#### 3.Generate the SQL script with the necessary queries to respond to the following requirements:
    A. List of company passengers (last name, first name, ID)
    B. List of company passengers (last name, first name, ID, address)
    C. List of company passengers (last name, first name, ID, address) showing only those who participate in the frequent flyer program, ordered by last name and first name.
    D. List of the company's aircraft (make, model, registration, date of entry into service, country of origin).
    E. List of the company's aircraft (make, model, registration, date of entry into service, country of origin) whose country of origin is “Germany”.
    F. List of flights carried out showing code, make, model and registration of the aircraft, IATA Code of the origin Airport, IATA Code of the destination Airport, date time of departure, date time of arrival and pilot CUIL.
    G. List of flights carried out showing code, make, model and registration of the aircraft, IATA Code of the origin Airport, IATA Code of the destination Airport, date time of departure, date time of arrival and CUIL pilot who departed from the “BUE” airport ordered by date departure time.
    H. List of flights carried out showing code, IATA Code of the origin Airport, IATA Code of the destination Airport, departure date and arrival date that departed from the “BUE” airport and arrived at the “MDQ” airport.
    I. List of all flights made and their passengers (code, surname, name, ID)
    J. Number of flights made that departed from “BUE” airport and arrived at “BRC” airport
    K. Number of flights made that departed from “MDQ” airport
    L. Number of flights performed, by airport of origin (IATA Code, quantity)
    M. Number of passengers transported, by passenger location (location, quantity)
    N. Number of passengers transported, per day (date, quantity)
    O. Number of flights per passenger (last name, first name, ID, amount)

## --------------------------------------------------

## PRACTICAL WORK (BD1)
### An automotive terminal company (car factory) hired us to computerize their business. Its operations are developed as follows:
#### The terminal is dedicated to assembling automobiles, that is, it purchases the different auto parts (engine, rims, tires, doors, etc.) from different suppliers and with them it proceeds to paint, assemble and test the vehicle. In an assembly line, only one model of vehicle is manufactured, the factory has as many assembly lines as vehicle models are manufactured; The average productive capacity of each assembly line is also known (in vehicles per month). Each of the assembly lines is made up of several workstations as required by each model. At each station a single specific task is carried out, such as: painting, sheet metal assembly, engine mechanics, running mechanics, electricity and testing, where in these tasks a series of inputs are consumed, which are provided by different companies. It is known how much of these inputs is needed for each vehicle model. (liters of paint, meters of cable, covers, lamps, etc.). A supplier company can manufacture more than one input and for more than one station. Furthermore, the same input can be provided by more than one company. At the time production begins, each car is assigned a chassis number that identifies it. The date and time in which the vehicle enters and leaves each station is recorded, in order to know the time it took to produce a complete vehicle and to be able to keep productivity statistics for each station and each assembly line. The company works in a certain way “Just in time”. This implies that it does not maintain large stocks of the parts necessary to manufacture a vehicle, but rather makes orders to their suppliers on a weekly basis. The terminal has a series of dealership companies, which are those dedicated to selling the manufactured vehicles. These dealerships report sales to the terminal made and the terminal informs them of the expected delivery date. This delivery date will depend on the number of orders that the company has to date and the production capacity of each assembly line plus a week for any unforeseen events. Each production input has a code that identifies it, a description and a price. The price is set by each of the suppliers, so depending on the supplier, the same input may have a different price.
## First stage - Model design
#### 1) Entity Relationship Diagram (ERD) of the data model that formally represents what is stated in the statement.
#### SQL script to create the database in MySQL.
## Second stage - Construction of the important ABMs
#### 2) The construction of the ABMs of the following entities is requested:
    a) Dealers 
    b) Orders (Header + Detail) 
    c) Suppliers 
    d) Inputs
#### Previous Registrations and Modifications are required to report possible anomalies, for example attempts to enter elements with the same primary key, the same in the modification. Deletions are required to inform if an item that does not exist is required to be deleted, or if it cannot be deleted for some business reason.
#### The response format must be the same in all cases:
    a) An integer nResult field, where 0=success, < 0 some problem 
    b) A varchar cMessage field, where it will be empty in case of success and will have the corresponding message in case of any problem
## Third stage - Construction of business procedures
#### 3) It is necessary to create a procedure that, given the information of a particular order, generates cars with the license plate assigned randomly in the corresponding table according to the model. The idea is that the cars must be generated and left in the initial state, that is, with the assigned assembly line, but without entering the first station of said line.
#### 4) It is necessary to create a procedure that, upon receiving the automobile patent as a parameter, begins its assembly, that is, when executing said procedure, the automobile with the indicated patent is “positioned” in the first station of the assembly line that was assigned when creating the vehicle with procedure (8)
## Note: The vehicle cannot be entered into the workstation if there is another car at that location. If it is not possible to insert the vehicle into the first station because it is occupied, a result must be returned informing this situation, in addition to the chassis of the vehicle that is occupying said station.
#### 5) It is necessary to create a procedure that upon receiving the automobile license plate as a parameter, the work of the station in which it is located is completed and it is entered at the next station.
## In the same way as was done in the previous point, it must be analyzed whether it is possible to enter the car at said station. If possible, the situation must be reported.
## IMPORTANT: If the station in which I am finishing the work is the last one on the assembly line, we must mark the car as finished, which implies modifying the end date of the vehicle table record.
#### The response format must be the same in all cases:
    c) An integer nResult field, where 0=success, < 0 some problem 
    d) A varchar cMessage field, where it will be empty in case of success and will have the corresponding message in case of any problem
## Fourth stage - Construction of reporting procedures
#### 6) Given an order number, it is required to list the vehicles indicating the chassis, if it is finished, and if it is not finished, indicate which station it is in.
#### 7) Given an order number, it is required to list the supplies that will need to be requested, indicating the supply code and quantity required for that order.
#### 8) Given an assembly line, indicate the average construction time of the vehicles (take into account only finished vehicles).
## Fifth stage - Report optimization
#### 9) Taking into account the previous queries, build an index that can facilitate the reading of the data.

## --------------------------------------------------

## PRACTICAL WORK (BD2)
### (SURVEY) A pharmacy chain asks us to computerize the operations of its business. As a result of its survey, we obtained the following information:
#### The pharmacy sells medicines and perfumery products. Some clients have social work and others are private. For all clients, last name, first name, ID, address (street, number, town, province), social work if they have one (name of social work and affiliate number) are recorded. For employees, it is required to know the last name, first name, DNI, CUIL, address (street, number, town, province) and social work to which they contribute (name of the social work and member number). For each product, it is required to know whether it is a medicine or perfumery product, a description, the laboratory that produces it, a numerical code and the price. For each sale, the following is recorded: date, ticket number, total of the sale, payment method (cash, card or debit), products sold with their quantities, unit and total price; employee who served the customer and the employee who collected the cash. For each branch, it is known which employees belong to it, the address (street, number, town, province) and which of the employees is in charge of it. The ticket number is issued with a different point of sale for each branch (the point of sale is identified with the first four numbers of the tax ticket, e.g.: 0001-00001234 is point of sale 1)
### (REQUIRED REPORTS) 
##### The client wants the system to provide the following information through queries made to the database MongoDB data:
    1. Detail and sales totals for the entire chain and by branch, between dates.
    2. Detail and sales totals for the entire chain and by branch, by social work or private dates.
    3. Details and collection totals for the entire chain and by branch, by means of payment and between dates.
    4. Details and totals of product sales, total of the chain and by branch, between dates, differentiated between pharmacy and perfumery.
    5. Ranking of product sales, total of the chain and by branch, between dates, by amount.
    6. Ranking of product sales, total of the chain and by branch, between dates, by quantity sold.
    7. Ranking of customers by purchases, total chain and by branch, between dates, by amount.
    8. Ranking of customers by purchases, total chain and by branch, between dates, by quantity sold.
### ANALYSIS OF THE PROBLEM DOMAIN
##### Design of a solution that meets the client's requirements. Implementation of the solution using:
    ● Java programming language
    ● MongoDB database engine
### ANALYSIS OF THE PROBLEM FROM A RELATIONAL APPROACH (ERD)
##### You can build the ERD diagram with the tool you want, even delivery can be through a photograph to a manually printed/written document.
### ASSEMBLY OF JAVA CLASSES THAT GRAPH THE RELATIONSHIPS FOUND (POJOS)
##### It is recommended to follow a top-down development methodology, starting with object-oriented design based on POJOs, going through the construction of the JSON documents that will be entered into the database MongoDB data.
### CONSTRUCTION OF INFORMATION SERIALIZATION MECHANISMS (FOR THE ASSEMBLY OF JSON DOCUMENTS)
##### In the same project as the previous delivery, you must include methods for creating instances of the classes. previously prepared and the serialization of the information using GSON or Jackson.
### STORING JSON DOCUMENTS IN MONGO DB
##### They must “upload” the different documents built in the previous step to the MongoDB base previously installed.
### CONSTRUCTION OF QUERIES TO THE MONGO DB DATABASE.
##### In the project they must build the methods that resolve JSON queries in the MongoDB database. In order to be able to carry out the queries, a data set must be generated containing at least 3 branches, 10 clients, 3 salespeople per branch, one of them with a manager category; 10 products (7 medications and 3 perfumery), and an average of 30 sales per branch. It is desirable that there be variation in sales quantities per branch (+/- 20%). Sales must have a minimum average of 1.5 products.
### DELIVERY 01
##### The delivery of the entity/relationship model (ERD) that arises from the analysis of the statement is required. On list:
    1. Analysis of the problem
    2. Construction of the ERD
### DELIVERY 02
##### The delivery of the POJOs classes in java is required, the project of building the data structure using these classes, the instantiation with the example data and its subsequent serialization into a single JSON document, the latter being delivered in a .json document. On list:
    1. Based on the ERD of the previous delivery, build the necessary POJOs
    2. Instantiate the data structure with the test data
    3. Serialize the complete structure and build the JSON document to be delivered with the class project former.
### DELIVERY 03
##### To approve the work, it is necessary to load the sales into the MongoDB database (sales only) and perform queries 1 and 4 on them from the list presented in the statement. Data loading must be done with a Java process, and that class must be included in the delivered project. However, queries can be delivered in a separate file if they are performed directly in the MongoDB client.