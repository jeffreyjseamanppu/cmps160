**CMPS160 - Database** is an API that will communicate with the backend database. This will allow the wineapp main application to be able retrieve data, save and modify existing data within the application

## Current Version
1.1.2

## Modules

#### [Libraries]()
```
Module 2
```

## Create Initial Environment 

#### [Create Environment]()
```
Download PostGres
Download PGAdmin
```

## Database Environment

#### [Create Initial Environment]()
```
Install PGAdmin Desktop App: [https://www.pgadmin.org/](https://www.pgadmin.org/)
Install PostGres Local: [https://www.postgresql.org/download/](https://www.postgresql.org/download/)
```
#### [Schema Creation in PostGres]()

## Create AP Schema
```
- Drill down into Module 2
- Open CreateAPSchema.sql in PostGres
  - Create a Database in PostGres (Right Click on Server and Create Database and name is "AP")
  - Execute the code
- Repeat the same for CreateExSchema.sql & CreateOmSchema.sql
- Open up AddDataToAPSchema.sql (Add data to the schema) and execute
- Open up AddDataToOMSchema.sql (Add data to the schema) and execute
```
## Test AP Schema
```
- Right click on AP Schema and choose Query Tool
- Copy and paste and run each line by line and identify if the value is > 0
    select count(*) from general_ledger_accounts
    select count(*) from invoice_archive
    select count(*) from invoice_line_items
    select count(*) from invoices
    select count(*) from terms
    select count(*) from vendor_contacts
    select count(*) from vendor
```
## Test EX Schema
```
- Right click on EX Schema and choose Query Tool
- Copy and paste and run each line by line and identify if the value is > 0
    select count(*) from departments
    select count(*) from employees
```
## Test OM Schema
```
- Right click on EX Schema and choose Query Tool
- Copy and paste and run each line by line and identify if the value is > 0
    select count(*) from customers
    select count(*) from items
    select count(*) from order_details
    select count(*) from orders

```
