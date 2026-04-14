USE optical_store;

INSERT INTO client (name, cp, phone, email, date_record, recommended_by) VALUES
('John Gil', 08001, 600111111, 'juan@email.com', NOW(), NULL),
('Mery Dope', 08002, 600222222, 'maria@email.com', NOW(), 1),
('Carl Ross', 08003, 600333333, 'carlos@email.com', NOW(), 1),
('Ana Towers', 08004, 600444444, 'ana@email.com', NOW(), 2);

INSERT INTO supplier (name, adress, phone, fax, nif) VALUES
('Opti Eye', 'Street A 123', 934111111, 934111112, 'A12345678'),
('Vision good', 'Street B 456', 934222222, 934222223, 'B12345678');

INSERT INTO employee (name) VALUES
('Maxwell'),
('Cate');

INSERT INTO lens (brand, lens_graduation, type_frame, color_frame, color_lens, price, suppliers_id) VALUES
('RayBan', '1.5', 'metal', 'black', 'transparent', 120.50, 1),
('D&G', '2.0', 'plastic', 'blue', 'dark', 150.00, 2),
('Hawkers', '1.75', 'rimless', 'silver', 'light', 200.00, 1);

INSERT INTO sale (clients_id, employee_id, lens_id, record_data_sale) VALUES
(1, 1, 1, '2026-03-05 10:15:00'),
(2, 2, 2, '2026-03-18 12:30:00'),
(3, 1, 3, '2026-04-02 16:45:00'),
(4, 2, 1, '2026-04-10 09:00:00');
