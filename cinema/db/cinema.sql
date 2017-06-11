 DROP TABLE IF EXISTS tickets CASCADE;
DROP TABLE IF EXISTS customers CASCADE;
DROP TABLE IF EXISTS films CASCADE;


CREATE TABLE films (
  id SERIAL4 PRIMARY KEY,
  title VARCHAR(255),
  price INT4
);

CREATE TABLE customers (
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255),
  funds INT4
);

CREATE TABLE tickets (
  id SERIAL4 PRIMARY KEY,
  ticket_number INT4,
  customer_id INT4 REFERENCES customers(id),
  film_id INT4 REFERENCES films(id)
);
