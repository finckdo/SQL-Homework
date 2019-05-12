-- DDL script to generate tables for SQL Homework
-- Doug Finck

CREATE TABLE "department" (
    "departmentno" varchar(20) NOT NULL,
    "departmentname" varchar(30) NOT NULL,
    CONSTRAINT "pk_department" PRIMARY KEY (
        "departmentno"
     )
);

CREATE TABLE "employee" (
    "employeeno" varchar(10) NOT NULL,
    "birthdate" date   NOT NULL,
    "firstname" varchar(30) NOT NULL,
    "lastname" varchar(30) NOT NULL,
    "gender" varchar(5) NOT NULL,
    "hiredate" date NOT NULL,
    CONSTRAINT "pk_employee" PRIMARY KEY (
        "employeeno"
     )
);



CREATE TABLE "department_employee" (
	"departmentemployeeid" serial NOT NULL,
    "employeeno" varchar(10) NOT NULL,
    "departmentno" varchar(20) NOT NULL,
    "fromdate" date NOT NULL,
    "todate" date NOT NULL,
    CONSTRAINT "pk_department_employee" PRIMARY KEY (
        "departmentemployeeid"
     )
);


CREATE TABLE "department_manager" (
	"departmentmanagerid" serial,
    "departmentno" varchar(20) NOT NULL,
    "employeeno" varchar(10) NOT NULL,
    "fromdate" date NOT NULL,
    "todate" date NOT NULL,
    CONSTRAINT "pk_department_manager" PRIMARY KEY (
        ""departmentmanagerid""
     )
);

CREATE TABLE "salaries" (
	"salaryid" serial,
    "employeeno" varchar(10) NOT NULL,
    "salary" decimal NOT NULL,
    "fromdate" date NOT NULL,
    "todate" date NOT NULL,
    CONSTRAINT "pk_salaries" PRIMARY KEY (
        "salaryid"
     )
);

CREATE TABLE "titles" (
	"titleid" serial,
    "employeeno" varchar(10) NOT NULL,
    "title" varchar(30) NOT NULL,
    "fromdate" date NOT NULL,
    "todate" date NOT NULL,
    CONSTRAINT "pk_titles" PRIMARY KEY (
        "titleid"
     )
);

ALTER TABLE "department_employee" ADD CONSTRAINT "fk_department_employee_employeeNo" FOREIGN KEY("employeeno")
REFERENCES "employee" ("employeeno");

ALTER TABLE "department_employee" ADD CONSTRAINT "fk_department_employee_eepartmentno" FOREIGN KEY("departmentno")
REFERENCES "department" ("departmentno");

ALTER TABLE "department_manager" ADD CONSTRAINT "fk_department_manager_departmentno" FOREIGN KEY("departmentno")
REFERENCES "department" ("departmentno");

ALTER TABLE "department_manager" ADD CONSTRAINT "fk_department_manager_employeeno" FOREIGN KEY("employeeno")
REFERENCES "employee" ("employeeno");

ALTER TABLE "salaries" ADD CONSTRAINT "fk_salaries_employeeNo" FOREIGN KEY("employeeno")
REFERENCES "employee" ("employeeno");

ALTER TABLE "titles" ADD CONSTRAINT "fk_titles_employeeNo" FOREIGN KEY("employeeno")
REFERENCES "employee" ("employeeno");





