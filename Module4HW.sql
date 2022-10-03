
select * from ap.terms;
#1
USE ap;
INSERT INTO terms
(terms_id,terms_description,terms_due_days)
VALUES(6,'Net due 120 days',120);

#2
UPDATE ap.terms
set terms_description = 'Net due 125 days',terms_due_days = 125
where terms_id = 6;

#3
DELETE FROM
ap.terms
where terms_id = 6;

#4 Exactly like #1 INSERT STATEMENT for Invoices
INSERT INTO invoices
(vendor_id,invoice_number,invoice_date,invoice_total,credit_total,terms_id,
invoice_due_date,payment_date)
VALUES();

#5 Exactly like #4 BUT you have multiple Values
## Write Two insert statements (Long way)Not best practice
## Write One Insert statement, multiple values
## Values('pointpark'),
## Values('pitt');
INSERT INTO invoices
(vendor_id,invoice_number,invoice_date,invoice_total,credit_total,terms_id,
invoice_due_date,payment_date)
VALUES();


##6 Update statement modifies the invoice you added in exercise
UPDATE invoices
set credit_total = 'something',payment_total='something';

##7 
update vendors
set default_account_number = 403
where vendor_id = 44;

#8 
update invoices a
JOIN vendors b
  on a.vendor_id = b.vendor_id
SET terms_id = 2
WHERE b.default_terms_id = 2;

#9
select * from invoices where terms_id = 2;
##step 1
delete from invoice_line_items where terms_id = 2;

##step 2
delete from invoices where terms_id = 2;




