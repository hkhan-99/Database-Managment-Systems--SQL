ALTER TABLE employee DROP CONSTRAINT employee_dno_fk;
ALTER TABLE dept_locations DROP CONSTRAINT department_dnumber_fk;
ALTER TABLE project DROP CONSTRAINT project_dnum_fk;
ALTER TABLE works_on DROP CONSTRAINT works_on_essn_fk;
ALTER TABLE works_on DROP CONSTRAINT works_on_pno_fk;
ALTER TABLE dependent DROP CONSTRAINT dependent_essn_fk;

DROP TABLE employee;
DROP TABLE department;
DROP TABLE dept_locations;
DROP TABLE project;
DROP TABLE works_on;
DROP TABLE dependent;

CREATE TABLE employee
(Fname VARCHAR2 (15) CONSTRAINT employee_fname_nn NOT NULL,
Minit CHAR (1),
Lname VARCHAR2 (15) CONSTRAINT employee_lname_nn NOT NULL,
Ssn NUMBER (9),
Bdate DATE,
Address VARCHAR2 (25),
Sex CHAR (1),
Salary NUMBER (7),
Super_ssn NUMBER (9),
Dno NUMBER (3),
CONSTRAINT employee_super_ssn_fk FOREIGN KEY(super_ssn) REFERENCES employee (ssn),
CONSTRAINT employee_ssn_pk PRIMARY KEY(ssn));

CREATE TABLE department
(Dname VARCHAR2 (15) CONSTRAINT department_dname_nn NOT NULL,
Dnumber NUMBER (3),
Mgr_ssn NUMBER (9),
Mgr_start_date DATE,
CONSTRAINT department_dnumber_pk PRIMARY KEY(dnumber));

CREATE TABLE dept_locations
(Dnumber NUMBER (3),
Dlocation VARCHAR2 (25),
CONSTRAINT dept_locations_dlocation_pk PRIMARY KEY(dlocation));

CREATE TABLE project
(Pname VARCHAR2 (15),
Pnumber NUMBER (3),
Plocation VARCHAR2 (15),
Dnum NUMBER (3),
CONSTRAINT project_pnumber_pk PRIMARY KEY(pnumber));

CREATE TABLE works_on
(Essn NUMBER (9) CONSTRAINT works_on_essn_nn NOT NULL,
Pno NUMBER (3) CONSTRAINT works_on_pno_nn NOT NULL,
Hours NUMBER (5));

CREATE TABLE dependent
(Essn NUMBER (9),
Dependent_name VARCHAR2 (15),
Sex CHAR (1),
Bdate DATE,
Relationship VARCHAR2 (15),
CONSTRAINT dependent_dependent_name_pk PRIMARY KEY(dependent_name));

ALTER TABLE employee
ADD CONSTRAINT employee_dno_fk FOREIGN KEY(dno) REFERENCES department (dnumber);

ALTER TABLE dept_locations
ADD CONSTRAINT department_dnumber_fk FOREIGN KEY(dnumber) REFERENCES department (dnumber);

ALTER TABLE project
ADD CONSTRAINT project_dnum_fk FOREIGN KEY(dnum) REFERENCES department (dnumber);

ALTER TABLE works_on
ADD CONSTRAINT works_on_essn_fk FOREIGN KEY (essn) REFERENCES employee (ssn);
ALTER TABLE works_on
ADD CONSTRAINT works_on_pno_fk FOREIGN KEY(pno) REFERENCES project (pnumber);

ALTER TABLE dependent
ADD CONSTRAINT dependent_essn_fk FOREIGN KEY(essn) REFERENCES employee (ssn);