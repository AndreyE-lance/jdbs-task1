CREATE  SCHEMA IF NOT EXISTS netology;

CREATE TABLE IF NOT EXISTS netology.CUSTOMERS
(
    id           serial      NOT NULL,
    name         VARCHAR(50) NOT NULL,
    surname      VARCHAR(50) NOT NULL,
    age          integer     NOT NULL,
    phone_number VARCHAR(50) NOT NULL,
    PRIMARY KEY (id)
);


CREATE TABLE IF NOT EXISTS netology.ORDERS
(
    id          serial      NOT NULL,
    date         timestamp   NOT NULL DEFAULT current_timestamp,
    customer_id  integer,
    product_name VARCHAR(50) NOT NULL,
    amount       integer NOT NULL ,
    PRIMARY KEY (id),
    FOREIGN KEY (customer_id) REFERENCES netology.CUSTOMERS (id)
);

