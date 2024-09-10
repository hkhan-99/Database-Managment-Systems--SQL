DROP TABLE Employee CASCADE CONSTRAINTS;
DROP TABLE Department CASCADE CONSTRAINTS;
DROP TABLE Dept_Locations CASCADE CONSTRAINTS;
DROP TABLE Project CASCADE CONSTRAINTS;
DROP TABLE Works_on CASCADE CONSTRAINTS;
DROP TABLE Dependent CASCADE CONSTRAINTS;


CREATE TABLE Employee(
Fname       VARCHAR2(20),
Minit       CHAR(1),
Lname       VARCHAR2(20),
SSN         NUMBER(9) CONSTRAINT Employee_SSN_PK PRIMARY KEY,
Bdate       DATE,
Address     VARCHAR2(50),
Sex         CHAR(1),
Salary      NUMBER(7),
Super_ssn   NUMBER(9),
Dno         NUMBER(1));

CREATE TABLE Department(
Dname       VARCHAR2(50),
Dnumber     NUMBER(1) CONSTRAINT Department_Dnumber_PK PRIMARY KEY,
Mgr_ssn     NUMBER(9),
Mgr_start_date  DATE);

CREATE TABLE Dept_Locations(
Dnumber     NUMBER(1),
Dlocation   VARCHAR(20),
CONSTRAINT Locations_Dnumber_Dlocation_PK PRIMARY KEY(Dnumber, Dlocation));

CREATE TABLE Project(
Pname       VARCHAR2(40),
Pnumber     NUMBER(4) CONSTRAINT Project_Pnumber_PK PRIMARY KEY,
Plocation   VARCHAR(20),
Dnum        NUMBER(1));

CREATE TABLE Works_on(
Essn        NUMBER(9),
Pno         NUMBER(4),
Hours       NUMBER(3,1),
CONSTRAINT Works_on_essn_pno_pk PRIMARY KEY(Essn, Pno));

CREATE TABLE Dependent(
Essn        NUMBER(9),
Dependent_name  VARCHAR2(30),
Sex         CHAR(1),
Bdate       DATE,
Relationship    VARCHAR(20),
CONSTRAINT dependent_pk PRIMARY KEY(Essn, Dependent_name));


INSERT INTO Employee
VALUES ('John', 'B', 'Smith', 123456789, '09-Jan-1965', '731 Fondren, Houston, TX', 'M', 30000, 333445555, 5);

INSERT INTO Employee
VALUES ('Franklin', 'T', 'Wong', 333445555, '08-Dec-1955', '638 Voss, Houston, TX', 'M', 40000, 888665555, 5);

INSERT INTO Employee
VALUES ('Alicia', 'J', 'Zeyla', 999887777, '19-Jan-1968', '3321 Castle, Spring, TX', 'F', 25000, 987654321, 4);

INSERT INTO Employee
VALUES ('Jennifer', 'S', 'Wallace', 987654321, '20-Jun-1941', '291 Berry, Bellaire, TX', 'F', 43000, 888665555, 4);

INSERT INTO Employee
VALUES ('Ramesh', 'K', 'Narayan', 666884444, '15-Sep-1962', '975 Fire Oak, Humble, TX', 'M', 38000, 333445555, 5);

INSERT INTO Employee
VALUES ('Joyce', 'A', 'Enlgish', 453453453, '31-Jul-1972', '5631 Rice, Houston, TX', 'F', 25000, 333445555, 5);

INSERT INTO Employee
VALUES ('Ahmad', 'V', 'Jabbar', 987987987, '29-May-1969', '980 Dallas, Houston, TX', 'M', 25000, 987654321, 4);

INSERT INTO Employee (Fname, minit, lname, ssn, bdate, address, sex, salary, dno)
VALUES ('James', 'E', 'Borg', 888665555, '10-NOV-1937', '450 Stone, Houston, TX', 'M', 55000, 1);

INSERT INTO Department
VALUES ('Research', 5, 333445555, '22-May-1988');

INSERT INTO Department
VALUES ('Administration', 4, 987654321, '01-Jan-1995');

INSERT INTO Department
VALUES ('Headquarters', 1, 888665555, '19-Jun-1981');

INSERT INTO Dept_Locations
VALUES (1, 'Houston');

INSERT INTO Dept_Locations
VALUES (4, 'Stafford');

INSERT INTO Dept_Locations
VALUES (5, 'Bellaire');

INSERT INTO Dept_Locations
VALUES (5, 'Sugarland');

INSERT INTO Dept_Locations
VALUES (5, 'Houston');

INSERT INTO Project
VALUES ('ProductX', 1, 'Bellaire', 5);

INSERT INTO Project
VALUES ('ProductY', 2, 'Sugarland', 5);

INSERT INTO Project
VALUES ('ProductZ', 3, 'Houston', 5);

INSERT INTO Project
VALUES ('Computerization', 10, 'Stafford', 4);

INSERT INTO Project
VALUES ('Reorganization', 20, 'Houston', 1);

INSERT INTO Project
VALUES ('Newbenefits', 30, 'Stafford', 4);

INSERT INTO Works_on
VALUES(123456789, 1, 32.5);

INSERT INTO Works_on
VALUES(123456789, 2, 7.5);

INSERT INTO Works_on
VALUES(666884444, 3, 40.0);

INSERT INTO Works_on
VALUES(453453453, 1, 20.0);

INSERT INTO Works_on
VALUES(453453453, 2, 20.0);

INSERT INTO Works_on
VALUES(333445555, 2, 10.0);

INSERT INTO Works_on
VALUES(333445555, 3, 10.0);

INSERT INTO Works_on
VALUES(333445555, 10, 10.0);

INSERT INTO Works_on
VALUES(333445555, 20, 10.0);

INSERT INTO Works_on
VALUES(999887777, 30, 30.0);

INSERT INTO Works_on
VALUES(999887777, 10, 10.0);

INSERT INTO Works_on
VALUES(987987987, 10, 35.0);

INSERT INTO Works_on
VALUES(987987987, 30,  5.0);

INSERT INTO Works_on
VALUES(987654321, 30, 20.0);

INSERT INTO Works_on
VALUES(987654321, 20, 15.0);

INSERT INTO Works_on
VALUES(888665555, 20, NULL);

INSERT INTO Dependent
VALUES(333445555, 'Alice', 'F', '05-May-1986', 'Daughter');

INSERT INTO Dependent
VALUES(333445555, 'Theordore', 'M', '25-Oct-1983', 'Son');

INSERT INTO Dependent
VALUES(333445555, 'Joy', 'F', '03-May-1958', 'Spouse');

INSERT INTO Dependent
VALUES(987654321, 'Abner', 'M', '28-Feb-1942', 'Spouse');

INSERT INTO Dependent
VALUES(123456789, 'Michael', 'M', '04-Jan-1988', 'Son');

INSERT INTO Dependent
VALUES(123456789, 'Alice', 'F', '30-Dec-1988', 'Daughter');

INSERT INTO Dependent
VALUES(123456789, 'Elizabeth', 'F', '05-May-1967', 'Spouse');



ALTER TABLE Employee
ADD CONSTRAINT employee_dno_fk FOREIGN KEY(Dno)
REFERENCES Department(Dnumber);

ALTER TABLE Department
ADD CONSTRAINT department_Mgr_fk FOREIGN KEY(Mgr_ssn)
REFERENCES Employee(SSN);

ALTER TABLE Dept_Locations
ADD CONSTRAINT dept_locations_dnumber_fk FOREIGN KEY(Dnumber)
REFERENCES Department(Dnumber);

ALTER TABLE Project
ADD CONSTRAINT project_dnum_fk FOREIGN KEY(Dnum)
REFERENCES Department(Dnumber);

ALTER TABLE Works_on
ADD CONSTRAINT project_essn_fk FOREIGN KEY(Essn)
REFERENCES Employee(ssn);

ALTER TABLE Works_on
ADD CONSTRAINT project_pno_fk FOREIGN KEY(pno)
REFERENCES Project(Pnumber);

ALTER TABLE Employee
ADD CONSTRAINT employee_super_ssn_fk FOREIGN KEY(Super_ssn)
REFERENCES Employee(ssn);

ALTER TABLE Dependent
ADD CONSTRAINT Dependent_essn_fk FOREIGN KEY(essn)
REFERENCES Employee(ssn);