CREATE  SCHEMA netology;

CREATE TABLE netology.CUSTOMERS
(
    id           serial      NOT NULL,
    name         VARCHAR(50) NOT NULL,
    surname      VARCHAR(50) NOT NULL,
    age          integer     NOT NULL,
    phone_number VARCHAR(50) NOT NULL,
    PRIMARY KEY (id)
);

INSERT INTO netology.CUSTOMERS (name, surname, age, phone_number)
        VALUES ('neAlexey', 'Pupkin', 20, '+7111111111');
INSERT INTO netology.CUSTOMERS (name, surname, age, phone_number)
        VALUES ('aLeXeY', 'Gupkin', 20, '+7111111112');
INSERT INTO netology.CUSTOMERS (name, surname, age, phone_number)
        VALUES ('Alexey', 'Tuokin', 20, '+7111111113');
INSERT INTO netology.CUSTOMERS (name, surname, age, phone_number)
        VALUES ('alexey', 'Lupkin', 20, '+7111111114');

CREATE TABLE netology.ORDERS
(
    id          serial      NOT NULL,
    date         timestamp   NOT NULL DEFAULT current_timestamp,
    customer_id  integer,
    product_name VARCHAR(50) NOT NULL,
    amount       integer NOT NULL ,
    PRIMARY KEY (id),
    FOREIGN KEY (customer_id) REFERENCES netology.CUSTOMERS (id)
);

INSERT INTO netology.ORDERS (product_name, customer_id, amount)
        VALUES ('prod1', 1, 31);
INSERT INTO netology.ORDERS (product_name, customer_id, amount)
        VALUES ('prod2', 4, 32);
INSERT INTO netology.ORDERS (product_name, customer_id, amount)
        VALUES ('prod3', 2, 33);
INSERT INTO netology.ORDERS (product_name, customer_id, amount)
        VALUES ('prod4', 3, 34);
INSERT INTO netology.ORDERS (product_name, customer_id, amount)
        VALUES ('prod5', 1, 35);
INSERT INTO netology.ORDERS (product_name, customer_id, amount)
        VALUES ('prod6', 4, 36);
INSERT INTO netology.ORDERS (product_name, customer_id, amount)
        VALUES ('prod7', 3, 37);
INSERT INTO netology.ORDERS (product_name, customer_id, amount)
        VALUES ('prod8', 2, 38);