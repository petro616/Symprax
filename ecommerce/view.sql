CREATE OR REPLACE view items1view as
SELECT items.*  , categories.* , products.* , (items_price - (items_price * items_discount / 100)) AS itemspricediscount  FROM items 
INNER JOIN categories ON categories.categories_id = items.items_catego 
INNER JOIN products ON items.items_id = products.products_itemsId

CREATE OR REPLACE view myfavourite as
SELECT favourite.* , items.* , products.*, (items_price - (items_price * items_discount / 100)) AS itemspricediscount  , users.users_id FROM favourite
INNER join users ON favourite.favourite_usersid = users.users_id
INNER join items ON favourite.favourite_itemsid = items.items_id
INNER JOIN products ON items.items_id = products.products_itemsId

CREATE OR REPLACE view cartview as
SELECT SUM(items.items_price - items.items_price * items.items_discount / 100) as itemsprice , COUNT(cart.cart_itemsid) as countitems , cart.* , items.* FROM cart
INNER join items ON items.items_id = cart.cart_itemsid
WHERE cart_orders = 0
GROUP BY cart.cart_itemsid , cart.cart_usersid , cart.cart_orders

CREATE or REPLACE VIEW ordersview AS
SELECT orders.* , adress.* FROM orders
LEFT JOIN adress ON adress.adress_id = orders.orders_address


CREATE or REPLACE VIEW orderdetailsview AS
SELECT SUM(items.items_price - items.items_price * items.items_discount / 100) as itemsprice , COUNT(cart.cart_itemsid) as countitems , cart.* ,ordersview.* ,  items.* FROM cart
INNER join items ON items.items_id = cart.cart_itemsid
WHERE cart_orders != 0
GROUP BY cart.cart_itemsid , cart.cart_usersid , cart.cart_orders

CREATE OR REPLACE VIEW itemstopselling AS
SELECT COUNT(cart_id) as countitems , (items_price - (items_price * items_discount / 100)) AS itemspricediscount ,  cart.* , items.* , products.* FROM cart
INNER JOIN items ON items.items_id = cart.cart_itemsid
INNER JOIN products ON items.items_id = products.products_itemsId
WHERE cart_orders != 0
GROUP BY cart_itemsid
