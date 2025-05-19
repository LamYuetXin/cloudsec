USE BakeryOrderSystem;
GO

DELETE FROM Order_Items;
DELETE FROM Payments;
DELETE FROM Orders;
DELETE FROM Products;
DELETE FROM Customers;
DELETE FROM Staff;

INSERT INTO Products (name, description, price, image_url) VALUES
('Moist Chocolate Cake', 'Rich chocolate flavor with buttercream frosting', 15.00, 'img\choccake.jpg'),
('Strawberry Short Cake', 'Sponge cake with strawberry filling and fresh strawberry', 26.00, 'img\berrycake.jpg'),
('Sourdough Bread', 'Classic sourdough with crispy crust', 6.50, 'img\sourdough.jpg'),
('Cheese Bagel', 'Soft and chewy bagel with melted cheese filling', 10.00, 'img\bagel.jpg'),
('Salted Egg Croissant', 'Buttery and flaky French croissant with salted egg', 15.00, 'img\pastry.jpg'),
('Tira Miss U', 'Biscuit with mascarpone cheese cream', 20.00, 'img\tiramisu.jpg'),
('Cheesecake', 'Creamy New York-style cheesecake', 15.00, 'img\ciscake.jpg'),
('Red Velvet Cake', 'Classic red velvet cake with cream cheese frosting', 15.00, 'img\red.jpg'),
('Peach Strudle', 'Flaky pastry filled with sweet peaches and cinnamon', 15.00, 'img\crois.jpg'),
('Chicken Curry Puff', 'Crispy pastry filled with spicy chicken curry', 10.00, 'img\puff.jpg'),
('Cherry Pie', 'Sweet and tangy cherry filling in a buttery crust', 10.00, 'img\pie.jpg'),
('Pasta Pesto', 'Pasta in fresh basil pesto sauce', 25.00, 'img\pasta.jpg'),
('Mac N Cheese', 'Creamy macaroni with a blend of melted cheeses', 25.00, 'img\mac.jpg'),
('Lasagna', 'Layers of pasta, meat sauce, and melted cheese baked to perfection', 30.00, 'img\lasagna.jpg'),
('Paddle Pop', 'Refreshing ice cream', 5.00, 'img\ice.jpg'),
('Matcha Latte', 'Smooth green tea latte with steamed milk', 9.00, 'img\matcha.jpg'),
('Iced Chocolate', 'Rich chocolate drink served chilled with whipped cream', 9.00, 'img\choc.jpg'),
('Hot Coffee', 'Freshly brewed aromatic coffee', 9.00, 'img\coffee.jpg');


INSERT INTO Customers (first_name, last_name, email, phone, password_hash) VALUES
('Pete', 'Doe', 'pete.doe@example.com', '+1234567890', '1234');

--Place order
-- Step 1: Create an order
INSERT INTO Orders (customer_id, total_amount, status) VALUES
(1, 33.48, 'Pending');

-- Step 2: Add items to the order
INSERT INTO Order_Items (order_id, product_id, quantity, unit_price) VALUES
(1, 1, 1, 25.00),  -- Chocolate Cake
(1, 3, 2, 3.50);   -- 2 Croissants

--INSERT INTO Payments (order_id, amount, payment_method, payment_status) VALUES
--(1, 32.00, 'Credit Card', 'Completed');