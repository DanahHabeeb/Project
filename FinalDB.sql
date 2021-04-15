/******* Dana Almuzael - Areej Ahmed - Lulu Waleed - Jumana Essa *******/
/* Note, all the data on the insert into are just a prototype since most of the information is entered by the GUI in JAVA, most of the inforamtion is entered there and inserted into 
this code. therefore the information is going to be modified by the final submission of the project */

CREATE DATABASE project ;
USE project;

/* This relation was created to provide efficiency in case this beauty center might open new locations */
create table Sunflower_beauty_center_info 
(
S_Location varchar (20),
S_PhoneNumber varchar (10),
branch_number int (3) primary key,
S_Email varchar (100)
);



/* This relation will have all information for employees, program manager and clients which would allow each of these users to access their desired entrance*/
create table User_Account_info 
(
Birth_date date,
Age int (2),
Email varchar (100) primary key,
User_phone varchar (10),
Fname varchar (20),
Mname varchar (20),
Lname varchar (20),
user_address varchar (30),
User_pass varchar (30)
);

/* This relation is specified for the employees and there is a foreign key that refers to the User_Account relation */
create table Employee 
(
emplyee_ssn int (4) primary key, 
Emp_service varchar (30),
Emp_salary float (5.000),
Employee_Email  varchar (100), /* foreign key */ 
Emp_worksOn_branch int (3)    /* foreign key */ 
);

/* Foreign key from User_Account to Employee */
Alter Table Employee add foreign key (Employee_Email) references User_Account_info (Email);

/* Foreign key from Sunflower_beauty_center to Employee */
Alter Table Employee add foreign key (Emp_worksOn_branch) references Sunflower_beauty_center_info (branch_number);


/* This relation is specified for the clients and there is a foreign key that refers to the User_Account relation */
create table Sunflower_Client 
(
Costumer_name varchar (20),
Costumer_phone int (10),
service_price float (5.000),
service_name varchar (10),
service_time datetime primary key, /* YYYY-MM-DD HH:MI:SS */
Total_price float (5.000),
Client_service varchar (30),
Clients_deals_branch int (3) /* foreign key */ 
);

/* Foreign key from User_Account to Sunflower_Client */
## Alter Table Sunflower_Client add foreign key (Sunflower_Email) references User_Account (Email);

/* Foreign key from Sunflower_beauty_center to Sunflower_Client */
Alter Table Sunflower_Client add foreign key (Clients_deals_branch) references Sunflower_beauty_center_info (branch_number);

/* This relation will have all information for employees, program manager and clients which would allow each of these users to access their desired entrance*/
create table Online_Shopping_Info
(
Total_price int (5),
## order_id varchar (10) primary key, we could generate a random number if we could 
phoneNumber varchar (10),
FirstName varchar (20),
middleName varchar (20),
LastName varchar (20),
streetName varchar (20),
DistrictName varchar (30),
Town varchar (30),
shop_branch int (3) /* foreign key */ 
);

/* Foreign key from Sunflower_beauty_center to Online_Shopping */
Alter Table Online_Shopping_Info add foreign key (shop_branch) references Sunflower_beauty_center_info (branch_number);

/* This relation is specified for the program_manager and there is a foreign key that refers to the User_Account relation */
create table Program_manager 
(
manager_ssn int (4) primary key,
Program_Manager_Email varchar (100), /* foreign key */ 
Manager_Manages_branch int (3), /* foreign key */ 
Sunflower_profit float (5.000) 
);

/* Foreign key from User_Account to Program_manager */
Alter Table Program_manager add foreign key (Program_Manager_Email) references User_Account_info (Email);

/* Foreign key from Sunflower_beauty_center to Program_manager */
Alter Table Program_manager add foreign key (Manager_Manages_branch) references Sunflower_beauty_center_info (branch_number);



/* add all branches */
insert into Sunflower_beauty_center_info values ('Dammam' , '0566897439' , 01 , 'Sunflower.Salon@gmail.com' );
insert into Sunflower_beauty_center_info values ('Alkhobar' , '055727289' , 02 , 'Sunflower.Salon1@gmail.com' );


/* add all users */
insert into User_Account_info values ('2000-03-29', 20, 'Mona.Salem.Alsalem@gmail.com', 987987987, 'Muna', 'Salem' , 'Alsalem' , 'Dammam AlAdamah 32242' , 'Salem54455443' );
insert into User_Account_info values ('2002-03-29', 18, 'NadaMohaammedAlqahtani1@gmail.com', 987547387, 'Nada', 'Mohaammed' , 'Alqahtani' , 'Alkhobar Alaqrabiyah 32542' , 'noody32211' );
insert into User_Account_info values ('2000-03-24', 21, 'Dana.Habeb.Almuzael.com', 987767387, 'Dana', 'Habeb' , 'Almuzael' , 'alnoor sihat 325442' , 'Dandon7687' );
insert into User_Account_info values ('2000-06-23', 20, 'Areej.Ahmed.Alrashidi@gmail.com', 98458387, 'Areej', 'Ahmed' , 'Alrashidi' , 'Alkhobar Alaqrabiyah 38542' , 'AreejYay555' );


/* add all Employees */ 
insert into Employee values ( 1,' Hairdresser', 1500 , 'Mona.Salem.Alsalem@gmail.com', 01);
insert into Employee values ( 2,' Makeup Artist', 1500 , 'NadaMohaammedAlqahtani1@gmail.com', 02);
 

/* add all Sunflower_Client/s  */ 
/* These informaation are going to be entered in JAVA by the user and calculated there */

create table Online_Shopping_Info
(
Total_price int (5),
## order_id varchar (10) primary key, we could generate a random number if we could 
phoneNumber varchar (10),
FirstName varchar (20),
middleName varchar (20),
LastName varchar (20),
streetName varchar (20),
DistrictName varchar (30),
Town varchar (30),
shop_branch int (3) /* foreign key */ 
);
/* add all Online_Shopping information */ 
insert into Online_Shopping_Info values ( null, 9873245634 , 'Bushra' , 'Salman' , 'Alghamadi' , 'King Salman' , 'Tabab' , 'Abha' ,01);
insert into Online_Shopping_Info values (  null, 9873245634 , 'Remma' , 'Khaled' , 'Alahmedi' , 'Hada' , 'Alhada' , 'taif' ,02);



/* add all Program_manager/s */
insert into Program_manager values (1234,  'Dana.Habeb.Almuzael.com',01, null);
insert into Program_manager values (4321, 'Areej.Ahmed.Alrashidi@gmail.com',02, null);

## Select1
select * from Program_manager;

## Select2
select S_Email from Sunflower_beauty_center_info 
where S_Location='Dammam';

## check constraint **

alter table Sunflower_beauty_center_info
add constraint branch_number check(branch_number(01, 02));

## Delete
DELETE FROM Sunflower_beauty_center_info WHERE S_Location='Sihat';

## Update 
UPDATE Online_Shopping_Info
SET Fname = Waleed
WHERE Email='Lulu123@gmail.com';

## Create view
create view view1
as select *
from Program_manager where manager_ssn=2 ; 
select * from view1;

## Drop
alter table User_Account_info
drop column Age;

## Adding a column  
alter table User_Account_info 
add column gender char (1);

## Default value 
alter table User_Account_info
modify type char (1) default 'F' ;


## Nested query
Select S_Location,S_Email  
from Sunflower_beauty_center_info 
where S_Email < (select S_Email from Sunflower_beauty_center_info where branch_number =01);


## Join
SELECT User_Account_info.user_address, Program_manager.manager_ssn
FROM User_Account_info ## AND Program_manager
INNER JOIN Customers ON User_Account_info.Email=Program_manager.Program_Manager_Email;

## Natural join (left - right)
select * from Employee natural join Sunflower_Client;


## Drop
alter table User_Account_info
drop column Age;

## Procedure
DELIMITER $$
CREATE procedure procedure1 (In Program_Manager_Email varchar(100) ) 
BEGIN 
SELECT Manager_Manages_branch from Program_manager where Program_Manager_Email='Areej.Ahmed.Alrashidi@gmail.com' ;
END;$$
DELIMITER ;

## Index
CREATE INDEX index_Employee
ON Employee (emplyee_ssn);