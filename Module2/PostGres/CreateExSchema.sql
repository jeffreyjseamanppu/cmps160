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

--Add data to employees
INSERT INTO employees (employee_id, last_name, first_name, department_number, manager_id) VALUES
(1, 'Smith', 'Cindy', 2, NULL),
(2, 'Jones', 'Elmer', 4, 1),
(3, 'Simonian', 'Ralph', 2, 2),
(4, 'Hernandez', 'Olivia', 1, 9),
(5, 'Aaronsen', 'Robert', 2, 4),
(6, 'Watson', 'Denise', 5, 8),
(7, 'Hardy', 'Thomas', 5, 2),
(8, 'O''Leary', 'Rhea', 4, 9),
(9, 'Locario', 'Paulo', 5, 1);
