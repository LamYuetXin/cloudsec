USE BakeryOrderSystem
GO

ALTER TABLE Payments 
DROP COLUMN masked_card_number

ALTER TABLE Payments 
ADD masked_card_number NVARCHAR(20);

ALTER TABLE Payments 
ALTER COLUMN masked_card_number ADD MASKED WITH (FUNCTION = 'partial(0,"XXXX-XXXX-XXXX-", 4)');

-- test masking 
CREATE USER MaskTest WITHOUT LOGIN;
GRANT SELECT ON Payment TO MaskTest;

INSERT INTO Payments (order_id, amount, payment_method, payment_status, masked_card_number) VALUES (1, 32.00, 'Credit Card', 'Completed', '33332664695310');