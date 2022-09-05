create database fisdb1
use fisdb1

create table Clients
(
Client_id numeric(4) primary key,
Cname varchar(40) not null,
Address varchar(30),
Email varchar(30) unique,
Phone numeric(10),
Business varchar(20) Not null
)


Create table Departments
(
Deptno numeric(2) primary key,
Dname varchar(15) NOT NULL,
Loc varchar(20)
)


Create table Employees
(
Empno numeric(4) primary key,
Ename varchar(20) not null,
job varchar(15),
Salary numeric(7) constraint positive check(Salary>0),
Deptno numeric(2) references Departments(Deptno)
)

Create table Projects
(
Project_ID numeric(3) primary key,
Descr varchar(30) NOT NULL,
Start_Date DATE,
Planned_End_Date DATE,
Actual_End_Date DATE,
Budget Numeric(10) Constraint positivebug check(Budget>0),
Client_ID numeric(4) references Clients(Client_ID)
)

alter table Projects
add constraint dateChk check(Actual_End_Date > Planned_End_Date)

ALTER tABLE Projects
Drop Constraint dateChk

create table EmpProjectTasks
(
Project_ID numeric(3) primary key foreign key references Projects(Project_ID),
Empno numeric(4) foreign key references Employees(Empno),
Start_Date Date,
End_Date Date,
Task varchar(25) not null,
Status Varchar(15) not null
)

insert into Clients values(1001,'ACME Utilities','Noida','contact@acmeutil.com',956788032,'Manufacturing')
insert into Clients values(1002,'Trackon Consultants','Mumbai','consultt@trackon.com',8734210090,'Consultant')
insert into Clients values(1003,'MoneySaver Distributors','Kolkata','SAVE@moneysaver.com',7799886655,'Reseller')
insert into Clients values(1004,'Lawful Corp','Chennai','justice@lawful.com',9210342219,'Professional')

Select * from Clients

insert into Departments values(10,'Design','Pune')
insert into Departments values(20,'Development','Pune')
insert into Departments values(30,'Testing','Mumbai')
insert into Departments values(40,'Document','Mumbai')

Select * from Departments

insert into Employees values(7001,'Sandeep','Analyst',25000,10)
insert into Employees values(7002,'Rajesh','Designer',30000,10)
insert into Employees values(7003,'Madhav','Developer',40000,20)
insert into Employees values(7004,'Manoj','Developer',40000,20)
insert into Employees values(7005,'Abhay','Designer',35000,10)
insert into Employees values(7006,'Uma','Tester',30000,30)
insert into Employees values(7007,'Gita','Tech. Writer',30000,40)
insert into Employees values(7008,'Priya','Tester',35000,30)
insert into Employees values(7009,'Nutan','Developer',45000,20)
insert into Employees values(7010,'Smita','Analyst',20000,10)
insert into Employees values(7011,'Anand','Project Mgr',65000,10)

Select * from Employees

Insert into Projects values(401,'Inventory','01-Apr-11','01-Oct-11','31-Oct-11',150000,1001)
Insert into Projects values(402,'Accounting','01-Aug-11','01-Jan-12',NULL,500000,1002)
Insert into Projects values(403,'Payroll','01-Oct-11','31-Dec-11',NULL,750000,1003)
Insert into Projects values(404,'Contact Mgmt','01-Nov-11','31-Dec-11',null,50000,1004)
Select * from Projects

Insert into EmpProjectTasks VALUES(401,7001,'01-Apr-11','20-Apr-11','System Analysis','Completed')
Select * from EmpProjectTasks
