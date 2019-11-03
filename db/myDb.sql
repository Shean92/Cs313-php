CREATE TABLE public.user
(
	userID SERIAL NOT NULL PRIMARY KEY,
	username VARCHAR(100) NOT NULL UNIQUE,
	userPassword VARCHAR(100) NOT NULL,
    address VARCHAR(100)
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

INSERT INTO public.user VALUES (0, 'cs313', 'crowdice');

SELECT * FROM public.user;

ALTER TABLE public.user
    ADD FOREIGN KEY (cartID) REFERENCES cart(cartID);
    
ALTER TABLE cart
    ADD FOREIGN KEY (itemID) REFERENCES item(itemID);
    
ALTER TABLE public.user
    DROP COLUMN password;
    
ALTER TABLE public.user
    ADD COLUMN userPassword VARCHAR(100) NOT NULL;
    
SELECT t1.col, t3.col FROM table1 join table2 ON table1.primarykey = table2.foreignkey
                                  join table3 ON table2.primarykey = table3.foreignkey
                                  
SELECT public.user, item FROM 

heroku pg:psql