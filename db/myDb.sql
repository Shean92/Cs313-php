CREATE TABLE public.user
(
	userID SERIAL NOT NULL PRIMARY KEY,
	username VARCHAR(100) NOT NULL UNIQUE,
	password VARCHAR(100) NOT NULL,
    address VARCHAR(100) NOT NULL
);

CREATE TABLE item
(
    itemID SERIAL NOT NULL PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    price INT,
    quantity INT,
    color VARCHAR(100),
    size VARCHAR(100),
    design VARCHAR(256)
);

CREATE TABLE cart
(
    cartID SERIAL NOT NULL PRIMARY KEY
);

ALTER TABLE public.user
    ADD FOREIGN KEY (cartID) REFERENCES cart(cartID);
    
ALTER TABLE cart
    ADD FOREIGN KEY (itemID) REFERENCES item(itemID);