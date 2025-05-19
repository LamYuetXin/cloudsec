-- Create a trigger to update timestamps
CREATE TRIGGER trg_UpdateTimestamp
ON Customers
AFTER UPDATE
AS
BEGIN
    UPDATE Customers
    SET updated_at = GETDATE()
    FROM Customers c
    INNER JOIN inserted i ON c.customer_id = i.customer_id
END;
GO