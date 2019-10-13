CREATE TABLE public.user
(
	id SERIAL NOT NULL PRIMARY KEY,
	username VARCHAR(100) NOT NULL UNIQUE,
	password VARCHAR(100) NOT NULL,
    address VARCHAR(100) NOT NULL,
);

CREATE TABLE item
(
    id SERIAL NOT NULL PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    price INT,
    quantity INT,
    color VARCHAR(100),
    size VARCHAR(100),
    design VARCHAR(256)
);

CREATE TABLE cart
(
    id SERIAL NOT NULL PRIMARY KEY,
);

ALTER TABLE public.user
    ADD COLUMN cart_id INT NOT NULL REFERENCES cart(id) AFTER address;
    
ALTER TABLE cart
    ADD COLUMN item_id INT NOT NULL REFERNCES item(id) AFTER id;