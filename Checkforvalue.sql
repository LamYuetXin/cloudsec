SELECT * FROM Inventory;

SELECT o.order_id, o.order_date, o.total_amount, o.status
FROM Orders o
WHERE o.customer_id = 1;  -- Replace with logged-in user’s ID