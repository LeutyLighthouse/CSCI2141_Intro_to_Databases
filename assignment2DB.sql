CREATE TABLE EMPLOYEE (
    fname varchar(25), 
    minit char(1), 
    lname varchar(25),
    ssn int primary key,
    bdate date,
    address varchar(50),
    sex char(1),
    salary int,
    super_ssn int,
    dno int
);

CREATE TABLE DEPARTMENT (
    dname varchar(25),
    dnumber int primary key,
    mgr_ssn int,
    mgr_start_date date
);

CREATE TABLE DEPT_LOCATIONS (
    dnumber int, 
    dlocation varchar(25),
    primary key (dnumber, dlocation),
    FOREIGN KEY (dnumber) REFERENCES department(dnumber)
);

CREATE TABLE PROJECT (
    pname varchar(25), 
    pnumber int primary key,
    plocation varchar(25),
    dnum int,
    FOREIGN KEY (dnum) REFERENCES department(dnumber)
);

CREATE TABLE WORKS_ON (
    essn int, 
    pno int,
    hours double,
    primary key (essn, pno),
    FOREIGN KEY (essn) REFERENCES employee(ssn),
    FOREIGN KEY (pno) REFERENCES project(pnumber)
);

CREATE TABLE DEPENDENT (
    essn int, 
    dependent_name varchar(25),
    sex char,
    bdate date,
    relationship varchar(25),
    primary key (essn, dependent_name),
    FOREIGN KEY (essn) REFERENCES employee(ssn)
);



CREATE TABLE MANAGES (
    managerid INT,
    employeeid INT PRIMARY KEY
);


INSERT INTO DEPARTMENT
(dname, dnumber, mgr_ssn, mgr_start_date)
values
('Research', 5, 333445555, '1988-05-22'),
('Administration', 4, 987654321, '1995-01-01'),
('Headquarters', 1, 888665555, '1981-06-19');


INSERT INTO EMPLOYEE
(fname, minit, lname, ssn, bdate, 
 address, sex, salary, super_ssn, dno)
VALUES
('John', 'B', 'Smith', 123456789, '1965-01-09',
 '731 Fondren, Houston, TX', 'M', 30000, 333445555, 5),
('Franklin', 'T', 'Wong', 333445555, '1955-12-08',
 '638 Voss, Houston, TX', 'M', 40000, 888665555, 5),
('Alicia','J','Zelaya',999887777,'1968-01-19',
 '3321 Castle, Spring, TX','F',25000,987654321,4),
('Jennifer','S','Wallace',987654321,'1941-06-20',
'291 Berry, Bellaire, TX','F',43000,888665555,4),
('Ramesh','K','Narayan',666884444,'1962-09-15',
'975 Fire Oak, Humble, TX','M',38000,333445555,5),
('Joyce','A','English',453453453,'1972-07-31',
'5631 Rice, Houston, TX','F',25000,333445555,5),
('Ahmad','V','Jabbar',987987987,'1969-03-29',
'980 Dallas, Houston, TX','M',25000,987654321,4),
('James','E','Borg',888665555,'1937-11-10',
'450 Stone, Houston, TX','M',55000,NULL,1);

INSERT INTO DEPT_LOCATIONS
(dnumber, dlocation)
VALUES
(4, 'Stafford'),
(5, 'Bellaire'),
(5, 'Sugarland'),
(5, 'Houston');

INSERT INTO PROJECT
(pname, pnumber, plocation, dnum)
VALUES
('ProductX',1,'Bellaire',5),
('ProductY',2,'Sugarland',5),
('ProductZ',3,'Houston',5),
('Computerization',10,'Stafford',4),
('Reorganization',20,'Houston',1),
('Newbenefits',30,'Stafford',4);

INSERT INTO WORKS_ON
(essn, pno, hours)
VALUES
(123456789,1,32.5),
(123456789,2,7.5),
(666884444,3,40.0),
(453453453,1,20.0),
(453453453,2,20.0),
(333445555,2,10.0),
(333445555,3,10.0),
(333445555,10,10.0),
(333445555,20,10.0),
(999887777,30,30.0),
(999887777,10,10.0),
(987987987,10,35.0),
(987987987,30,5.0),
(987654321,30,20.0),
(987654321,20,25.0),
(888665555,20,NULL);

insert into DEPARTMENT
(essn, dependent_name, sex, bdate, relationship)
values
(333445555,'Alice','F','1986-04-05','Daughter'),
(333445555,'Theodore','M','1983-10-25','Son'),
(333445555,'Joy','F','1958-05-03','Spouse'),
(987654321,'Abner','M','1942-02-28','Spouse'),
(123456789,'Michael','M','1988-01-04','Son'),
(123456789,'Alice','F','1988-12-30','Daughter'),
(123456789,'Elizabeth','F','1967-05-05','Spouse');




CREATE VIEW RESEARCHERS_INFO (employee_first_name, employee_last_name, supervisor_first_name, supervisor_last_name, employee_salary)
AS SELECT E.Fname, E.Lname, E2.Fname, E2.Lname, E.Salary
FROM EMPLOYEE AS E, EMPLOYEE AS E2, DEPARTMENT AS D
WHERE E.Super_ssn = E2.Ssn and D.Dname = 'Research' and D.Dnumber = D.Dno;



SELECT * FROM RESEARCHERS_INFO;