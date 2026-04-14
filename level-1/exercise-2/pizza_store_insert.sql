USE pizza_store;

INSERT INTO client (name, surname, adress, cp, city, province, phone) VALUES
('John', 'Doe', 'Street 1', '08001', 'Barcelona', 'Barcelona', '600111111'),
('Anna', 'Smith', 'Street 2', '08002', 'Barcelona', 'Barcelona', '600222222'),
('Mike', 'Brown', 'Street 3', '17001', 'Girona', 'Girona', '600333333');

INSERT INTO store (street, cp, city, province) VALUES
('Main Street 10', 08001, 'Barcelona', 'Barcelona'),
('Central Avenue 5', 17001, 'Girona', 'Girona'),
('Beach Road 3', 08003, 'Barcelona', 'Barcelona');


INSERT INTO employee (name, surname, nif, phone, employee_rol, store_id) VALUES
('Lucas', 'White', 12345678, 600111111, 'chef', 1),
('Emma', 'Green', 87654321, 600222222, 'driver', 1),
('Noah', 'Black', 11223344, 600333333, 'driver', 2);


INSERT INTO category (name) VALUES
('Classic Pizza'),
('Premium Pizza'),
('Drinks');


INSERT INTO product (type_product, name, description, image, price, category_id) VALUES
('pizza', 'Margherita', 'Classic pizza with tomato and cheese', 'img1.jpg', 10.00, 1),
('drink', 'Coca Cola', 'Soft drink', 'img2.jpg', 2.50, 3),
('drink', 'Water', 'Mineral water', 'img3.jpg', 1.50, 3);


INSERT INTO `order` (date_time_order, delivery_place, quantity, price, employee_id, store_id, delivery_order, date_time_delivery, client_id) VALUES
('2026-04-01 12:00:00', 'home', '2', 12.50, 2, 1, 'yes', '2026-04-01 12:30:00', 1),
('2026-04-02 13:00:00', 'store', '1', 10.00, 1, 1, NULL, NULL, 2),
('2026-04-03 14:00:00', 'home', '3', 14.00, 3, 2, 'yes', '2026-04-03 14:40:00', 3);


INSERT INTO product_has_order (product_id, order_id) VALUES
(2, 1),
(3, 1),
(2, 3);
