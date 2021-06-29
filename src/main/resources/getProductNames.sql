SELECT netology.ORDERS.product_name FROM netology.ORDERS
JOIN netology.CUSTOMERS ON netology.ORDERS.customer_id = netology.CUSTOMERS.id
WHERE name = ?