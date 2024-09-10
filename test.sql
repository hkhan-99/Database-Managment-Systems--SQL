DROP TABLE Employee CASCADE CONSTRAINTS;
DROP TABLE Department CASCADE CONSTRAINTS;

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

ALTER TABLE Employee
ADD CONSTRAINT employee_dno_fk FOREIGN KEY(Dno)
REFERENCES Department(Dnumber);

ALTER TABLE Department
ADD CONSTRAINT department_Mgr_fk FOREIGN KEY(Mgr_ssn)
REFERENCES Employee(SSN);
