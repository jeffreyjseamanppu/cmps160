-- Create the tables
CREATE TABLE general_ledger_accounts
(
  account_number        INT            PRIMARY KEY,
  account_description   VARCHAR(50)    UNIQUE
);

CREATE TABLE terms
(
  terms_id              SERIAL         PRIMARY KEY,
  terms_description     VARCHAR(50)    NOT NULL,
  terms_due_days        INT            NOT NULL
);

CREATE TABLE vendors
(
  vendor_id                     SERIAL         PRIMARY KEY,
  vendor_name                   VARCHAR(50)    NOT NULL      UNIQUE,
  vendor_address1               VARCHAR(50),
  vendor_address2               VARCHAR(50),
  vendor_city                   VARCHAR(50)    NOT NULL,
  vendor_state                  CHAR(2)        NOT NULL,
  vendor_zip_code               VARCHAR(20)    NOT NULL,
  vendor_phone                  VARCHAR(50),
  vendor_contact_last_name      VARCHAR(50),
  vendor_contact_first_name     VARCHAR(50),
  default_terms_id              INT            NOT NULL,
  default_account_number        INT            NOT NULL,
  CONSTRAINT vendors_fk_terms
    FOREIGN KEY (default_terms_id)
    REFERENCES terms (terms_id),
  CONSTRAINT vendors_fk_accounts
    FOREIGN KEY (default_account_number)
    REFERENCES general_ledger_accounts (account_number)
);

CREATE TABLE invoices
(
  invoice_id            SERIAL         PRIMARY KEY,
  vendor_id             INT            NOT NULL,
  invoice_number        VARCHAR(50)    NOT NULL,
  invoice_date          DATE           NOT NULL,
  invoice_total         NUMERIC(9,2)   NOT NULL,
  payment_total         NUMERIC(9,2)   NOT NULL      DEFAULT 0,
  credit_total          NUMERIC(9,2)   NOT NULL      DEFAULT 0,
  terms_id              INT            NOT NULL,
  invoice_due_date      DATE           NOT NULL,
  payment_date          DATE,
  CONSTRAINT invoices_fk_vendors
    FOREIGN KEY (vendor_id)
    REFERENCES vendors (vendor_id),
  CONSTRAINT invoices_fk_terms
    FOREIGN KEY (terms_id)
    REFERENCES terms (terms_id)
);

CREATE TABLE invoice_line_items
(
  invoice_id              INT            NOT NULL,
  invoice_sequence        INT            NOT NULL,
  account_number          INT            NOT NULL,
  line_item_amount        NUMERIC(9,2)   NOT NULL,
  line_item_description   VARCHAR(100)   NOT NULL,
  CONSTRAINT line_items_pk
    PRIMARY KEY (invoice_id, invoice_sequence),
  CONSTRAINT line_items_fk_invoices
    FOREIGN KEY (invoice_id)
    REFERENCES invoices (invoice_id),
  CONSTRAINT line_items_fk_accounts
    FOREIGN KEY (account_number)
    REFERENCES general_ledger_accounts (account_number)
);

-- Create the indexes
CREATE INDEX invoices_invoice_date_ix
  ON invoices (invoice_date DESC);

-- Create some test tables that aren't explicitly
-- related to the previous five tables
CREATE TABLE vendor_contacts
(
  vendor_id       INT          PRIMARY KEY,
  last_name       VARCHAR(50)  NOT NULL,
  first_name      VARCHAR(50)  NOT NULL
);

CREATE TABLE invoice_archive
(
  invoice_id          INT          NOT NULL,
  vendor_id           INT          NOT NULL,
  invoice_number      VARCHAR(50)  NOT NULL,
  invoice_date        DATE         NOT NULL,
  invoice_total       NUMERIC(9,2) NOT NULL,
  payment_total       NUMERIC(9,2) NOT NULL,
  credit_total        NUMERIC(9,2) NOT NULL,
  terms_id            INT          NOT NULL,
  invoice_due_date    DATE         NOT NULL,
  payment_date        DATE
);