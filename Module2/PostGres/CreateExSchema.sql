-- Example tables for Chapter 3
CREATE TABLE null_sample
(
  invoice_id      INT               NOT NULL,
  invoice_total   DECIMAL(9,2),
  CONSTRAINT invoice_id_uq 
    UNIQUE (invoice_id)
);

-- Inserting data into null_sample table
INSERT INTO null_sample (invoice_id, invoice_total) VALUES 
(1, 125),
(2, 0),
(3, NULL),
(4, 2199.99),
(5, 0);

-- Example tables for Chapter 4
CREATE TABLE departments
(
  department_number   INT           NOT NULL,
  department_name     VARCHAR(50)   NOT NULL,
  CONSTRAINT department_number_unq  
    UNIQUE (department_number)
);

-- Inserting data into departments table
INSERT INTO departments (department_number, department_name) VALUES 
(1,'Accounting'),
(2,'Payroll'),
(3,'Operations'),
(4,'Personnel'),
(5,'Maintenance');

CREATE TABLE employees
(
  employee_id         INT               NOT NULL,
  last_name           VARCHAR(35)       NOT NULL,
  first_name          VARCHAR(35)       NOT NULL,
  department_number   INT               NOT NULL,
  manager_id          INT,
  CONSTRAINT fk_department
    FOREIGN KEY (department_number) 
    REFERENCES departments(department_number)
);
