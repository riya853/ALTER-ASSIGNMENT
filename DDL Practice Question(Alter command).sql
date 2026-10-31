drop database if exists company_training;
Create Database company_training;
use company_training;
Create Table departments(
        department_id Int Not Null,
        dept_name Varchar(80) Not Null,
        city Varchar(60)
        );

INSERT INTO departments(department_id, dept_name, city)
VALUES
(1, "IT", "DELHI"),
(2, "MBA", "Lucknow"),
(3, "BTECH", "Kanpur");
Create Table employees(
        employee_id Int NOT NULL,
		employee_name Varchar(100) Not Null,
        email Varchar(120),
        department_id Int Not Null,
        salary Decimal(10,2),
        status Varchar(20)
        );
INSERT INTO employees(employee_id, employee_name, email, department_id, salary, status)
VALUES
(1001, 'Riya Mishra', 'riya@gmail.com', 1, 45000.00, 'Active'),
(1002, 'Priya Singh', 'priya@gmail.com', 2, 52000.00, 'Active'),
(1003, 'Preeti Sharma', 'preeti@gmail.com', 3, 48000.00, 'Inactive');

SELECT * from departments;
describe departments;
SELECT * from employees;
describe employees;
        
ALTER Table departments Add Primary Key (department_id);
ALTER Table employees ADD Primary Key (employee_id);
ALTER TABLE departments ADD Column location Varchar(100);
ALTER TABLE departments CHANGE dept_name department_name Varchar(80) Not Null;
ALTER TABLE employees MODIFY salary Decimal(12,2) Not Null;
ALTER TABLE employees MODIFY status Varchar(20) DEFAULT 'Active';
ALTER TABLE employees ADD CONSTRAINT uq_employee_email UNIQUE (email);
RENAME TABLE employees TO staff;
ALTER TABLE staff ADD Constraint fk_id Foreign Key (department_id) References departments(department_id);
ALTER TABLE staff DROP INDEX uq_employee_email;
ALTER TABLE staff drop foreign key fk_id;
ALTER TABLE staff DROP primary key;
ALTER TABLE staff ADD primary key (employee_id);
ALTER TABLE departments drop Column location;
drop database if exists company_training_management;
create database company_management;
RENAME TABLE company_training.departments TO company_management.departments;
RENAME TABLE company_training.staff TO company_management.staff;
drop database company_training;






        