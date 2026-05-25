USE pizza_store;

SELECT
    c.city,
    SUM(pho.quantity) AS total_drinks_sold
FROM product_has_order pho
JOIN product p 
    ON pho.product_id = p.id
JOIN `order` o 
    ON pho.order_id = o.id
JOIN client c 
    ON o.client_id = c.id
WHERE p.type_product = 'drink'
AND c.city = 'Barcelona'
GROUP BY c.city;

SELECT
    e.name,
    e.surname,
    COUNT(o.id) AS total_orders
FROM `order` o
JOIN employee e 
    ON o.employee_id = e.id
WHERE e.id = 2
GROUP BY e.id, e.name, e.surname;
