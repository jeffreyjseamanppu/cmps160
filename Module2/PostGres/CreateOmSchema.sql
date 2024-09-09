-- ********************************************
-- CREATE THE OM DATABASE
-- ********************************************


-- Create tables
CREATE TABLE customers
(
  customer_id           SERIAL          PRIMARY KEY,  -- Using SERIAL for auto-increment and primary key
  customer_first_name   VARCHAR(50),
  customer_last_name    VARCHAR(50)     NOT NULL,
  customer_address      VARCHAR(255)    NOT NULL,
  customer_city         VARCHAR(50)     NOT NULL,
  customer_state        CHAR(2)         NOT NULL,
  customer_zip          VARCHAR(20)     NOT NULL,
  customer_phone        VARCHAR(30)     NOT NULL,
  customer_fax          VARCHAR(30)
);

CREATE TABLE items
(
  item_id       SERIAL          PRIMARY KEY,  -- Using SERIAL for auto-increment and primary key
  title         VARCHAR(50)     NOT NULL,
  artist        VARCHAR(50)     NOT NULL,
  unit_price    DECIMAL(9,2)    NOT NULL,
  CONSTRAINT title_artist_unq
    UNIQUE (title, artist)  -- Composite unique constraint
);

CREATE TABLE orders
(
  order_id          SERIAL          PRIMARY KEY,  -- Using SERIAL for auto-increment and primary key
  customer_id       INT             NOT NULL,
  order_date        DATE            NOT NULL,
  shipped_date      DATE,
  CONSTRAINT orders_fk_customers
    FOREIGN KEY (customer_id) 
    REFERENCES customers (customer_id)  -- Foreign key to customers table
);

CREATE TABLE order_details
(
  order_id      INT           NOT NULL,
  item_id       INT           NOT NULL,
  order_qty     INT           NOT NULL,
  CONSTRAINT order_details_pk 
    PRIMARY KEY (order_id, item_id),  -- Composite primary key
  CONSTRAINT order_details_fk_orders
    FOREIGN KEY (order_id)
    REFERENCES orders (order_id),  -- Foreign key to orders table
  CONSTRAINT order_details_fk_items
    FOREIGN KEY (item_id)
    REFERENCES items (item_id)  -- Foreign key to items table
);
