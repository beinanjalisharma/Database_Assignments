/*create table Employee15(Emp int,Ename varchar(30));
alter table Employee15 add email varchar(20);
select * from Employee15;
alter table Employee15 drop column email;
drop table Employee15;*/




create table Employees51(employeeId int primary key, 
emp_name varchar(30),
Email varchar(30),
Department varchar(30),
Salary decimal,
JoiningDate Date);

select * from Employees51;
insert into Employees51(employeeId ,emp_name,Email,Department,Salary ,JoiningDate) values(1,'Anjali','beinganjalisharma@gmail.com','Development',20000000.00,'11-4-25');
insert into Employees51(employeeId ,emp_name,Email,Department,Salary ,JoiningDate) values(2,'Shivani','shivani@gmail.com','Development',2000.0,'2025-7-19');



Create table Orders15(order_id int Primary key,
Customer_name varchar(30),
Product_name varchar (30),
Quantity varchar(30),
Price decimal,
OrderDate date);


insert into Orders15(order_id ,Customer_name,Product_name,Quantity,Price,OrderDate)values(1,'Aditi','cream','2',8000.00,'2025-5-1');
insert into Orders15(order_id ,Customer_name,Product_name,Quantity,Price,OrderDate)values(2,'jhon','cream','2',8000.00,'2025-5-1');
insert into Orders15(order_id ,Customer_name,Product_name,Quantity,Price,OrderDate)values(3,'tom','cream','2',8000.00,'2025-7-1');
insert into Orders15(order_id ,Customer_name,Product_name,Quantity,Price,OrderDate)values(4,'jerry','cream','2',8000.00,'2025-5-1');
insert into Orders15(order_id ,Customer_name,Product_name,Quantity,Price,OrderDate)values(5,'Lavanya','cream','2',8000.00,'2025-5-1');
insert into Orders15(order_id ,Customer_name,Product_name,Quantity,Price,OrderDate)values(6,'Gokul','cream','2',8000.00,'2025-4-1');
insert into Orders15(order_id ,Customer_name,Product_name,Quantity,Price,OrderDate)values(7,'Shivani','cream','2',8000.00,'2025-5-1');
insert into Orders15(order_id ,Customer_name,Product_name,Quantity,Price,OrderDate)values(8,'Raju','cream','2',8000.00,'2025-5-1');
insert into Orders15(order_id ,Customer_name,Product_name,Quantity,Price,OrderDate)values(9,'smriti','cream','2',8000.00,'2025-5-1');
insert into Orders15(order_id ,Customer_name,Product_name,Quantity,Price,OrderDate)values(10,'Aditya','cream','12',80000.00,'2025-5-1');

select * from Orders15; 

Update Orders15 set Quantity = 4 where Customer_name = 'Lavanya';




create table Patients51(patientId int identity(1,1) primary key,
Patient_name varchar(30),
age int,
Disease varchar(30),
DoctorAssigned varchar(30));



INSERT INTO Patients51 values
 ('John Doe', 45, 'Flu', 'Dr. Smith'),
( 'Jane Smith', 30, 'Diabetes', 'Dr. Brown'),
( 'Emily Davis', 25, 'Asthma', 'Dr. Johnson'),
( 'Michael Brown', 50, 'Hypertension', 'Dr. Lee'),
( 'Sarah Wilson', 35, 'Allergy', 'Dr. Taylor'),
( 'David Clark', 40, 'Migraine', 'Dr. White'),
( 'Laura Adams', 28, 'Bronchitis', 'Dr. Green');


select * from Patients51;
select * from Patients51 where DoctorAssigned='Dr. Lee';

select Disease, Count(*) as PatientCount
from Patients
group by Disease;


create table Bookings51(Booking_Id int Primary key,
CustomerName varchar (100),
MovieName varchar (100),
SeatsBooked int,
TotalPrice Decimal(10,2));


insert into  Bookings51(Booking_Id,CustomerName,MovieName, SeatsBooked ,TotalPrice) values(1,'Amit Sharma','Avengers',3,2000.00),
(2,'Sumit Sharma','Inception',5,1000.00),
(3,'Diya Sharma','Titanic',1,500.00),
(4,'Priya Sharma','Intersteller',2,1500.00);
select * from Bookings51;

Begin Transaction ;

Save Transaction BeforeUpdate;

Update Bookings51 SET SeatsBooked = 5 where Booking_Id = 2;


Rollback transaction Bookings51;

commit Transaction;



