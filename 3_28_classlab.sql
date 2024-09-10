CREATE TABLE employee
( Fname       VARCHAR2(15) CONSTRAINT employee_firstname NOT NULL,
  Minit       CHAR(1),
  Lname       VARCHAR2(15) CONSTRAINT employee_lastname NOT NULL,
  Ssn         NUMBER(9) CONSTRAINT employee_ssn_pk PRIMARY KEY,
  Bdate       DATE,
  Address     VARCHAR2(25),
  Sex         CHAR(1),
  Salary      NUMBER(7),
  Super_ssn   NUMBER(9),
  Dno         NUMBER(3));

CREATE TABLE department
( Dname      VARCHAR2(15) CONSTRAINT dept_no NOT NULL,
  Dnumber    NUMBER(3) CONSTRAINT deptno_pk PRIMARY KEY,
  Mgr_ssn    NUMBER(9),
  Mgr_start_date    DATE);

CREATE TABLE dept_locations
( Dnumber    NUMBER(3),
  Dlocation  VARCHAR2(25),
  PRIMARY KEY (Dnumber, Dlocation));

CREATE TABLE project
(Pname    VARCHAR2(15),
 Pnumber  NUMBER(3) CONSTRAINT proj_no_pk PRIMARY KEY,
 Plocation   VARCHAR2(25),
 Dnum     NUMBER(3));

CREATE TABLE works_on
(Essn     NUMBER(9) CONSTRAINT employee_ssn NOT NULL,
 Pno      NUMBER(3) CONSTRAINT proj_no NOT NULL,
 Hours    NUMBER(5),
 PRIMARY KEY (Essn, Pno));

CREATE TABLE dependent
(Essn     NUMBER(9),
 Dependant_name   VARCHAR2(25),
 Sex      CHAR(1),
 Bdate    DATE,
 Relationship   VARCHAR2(15),
 PRIMARY KEY (Essn, Dependant_name));

ALTER TABLE employee
ADD CONSTRAINT employee_deptno_fk FOREIGN KEY (Dno) REFERENCES department (Dnumber);

ALTER TABLE department
ADD CONSTRAINT mgr_ssn_fk FOREIGN KEY (Mgr_ssn) REFERENCES employee (Ssn);

ALTER TABLE dept_locations
ADD CONSTRAINT dept_no_fk FOREIGN KEY (Dnumber) REFERENCES department (Dnumber);

ALTER TABLE project
ADD CONSTRAINT proj_deptno_fk FOREIGN KEY (Dnum) REFERENCES department (Dnumber);

ALTER TABLE works_on
ADD CONSTRAINT workson_essn_fk FOREIGN KEY (Essn) REFERENCES employee (Ssn);
ALTER TABLE works_on
ADD CONSTRAINT workson_proj_no_fk FOREIGN KEY (Pno) REFERENCES project (Pnumber);

ALTER TABLE dependent
ADD CONSTRAINT dependent_essn_fk FOREIGN KEY (Essn) REFERENCES employee (Ssn);
 
 


   
  