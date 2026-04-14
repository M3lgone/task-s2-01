USE optical_store;

SELECT 
  c.name,
  COUNT(s.id) AS total_purchases
FROM sale s
JOIN client c ON s.clients_id = c.id
WHERE c.id = 1
GROUP BY c.name;

SELECT 
  e.name AS employee,
  l.brand,
  s.record_data_sale
FROM sale s
JOIN employee e ON s.employee_id = e.id
JOIN lens l ON s.lens_id = l.id
WHERE e.id = 1
AND YEAR(s.record_data_sale) = 2026;

SELECT DISTINCT 
  sup.name AS supplier
FROM sale s
JOIN lens l ON s.lens_id = l.id
JOIN supplier sup ON l.suppliers_id = sup.id;