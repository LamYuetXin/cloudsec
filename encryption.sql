USE BakeryOrderSystem
GO

-- add new column
ALTER TABLE Payments
ADD Cardholder_Name NVARCHAR(50);



-- try new data
INSERT INTO Payments (order_id, amount, payment_method, payment_status, masked_card_number, Cardholder_Name) VALUES
(2, 100.00, 'Debit Card', 'Completed', '111452764695415','Nur Dania');



-- Create a database master key if it doesn't exist
IF NOT EXISTS (SELECT * FROM sys.symmetric_keys WHERE name = '##DatabaseMasterKey##')
BEGIN
    CREATE MASTER KEY ENCRYPTION BY PASSWORD = 'StrongPassword123!';
END






-- Create a certificate protected by the master key
IF NOT EXISTS (SELECT * FROM sys.certificates WHERE name = 'CardholderNameEncryptCert')
BEGIN
    CREATE CERTIFICATE CardholderNameEncryptCert
    WITH SUBJECT = 'Certificate for encrypting cardholder names';
END





-- Create a symmetric key for actual encryption/decryption
IF NOT EXISTS (SELECT * FROM sys.symmetric_keys WHERE name = 'CardholderNameKey')
BEGIN
    CREATE SYMMETRIC KEY CardholderNameKey
    WITH ALGORITHM = AES_256
    ENCRYPTION BY CERTIFICATE CardholderNameEncryptCert;
END




-- Add a new column to store encrypted data
IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID('Payments') AND name = 'encrypted_cardholder_name')
BEGIN
    ALTER TABLE Payments
    ADD encrypted_cardholder_name VARBINARY(256);
END





-- Open the symmetric key
OPEN SYMMETRIC KEY CardholderNameKey
DECRYPTION BY CERTIFICATE CardholderNameEncryptCert;

-- Copy existing data to encrypted column
UPDATE Payments
SET encrypted_cardholder_name = EncryptByKey(Key_GUID('CardholderNameKey'), Cardholder_Name);

-- Close the symmetric key
CLOSE SYMMETRIC KEY CardholderNameKey;




-- Test that encryption worked properly
OPEN SYMMETRIC KEY CardholderNameKey
DECRYPTION BY CERTIFICATE CardholderNameEncryptCert;

-- Compare original and encrypted/decrypted values
SELECT TOP 10
    payment_id,
    Cardholder_Name AS Original_Name,
    CONVERT(NVARCHAR(100), DecryptByKey(encrypted_cardholder_name)) AS Decrypted_Name
FROM 
    Payments;

CLOSE SYMMETRIC KEY CardholderNameKey;







--DECRYPTION TO CHECK
-- Open the symmetric key
OPEN SYMMETRIC KEY CardholderNameKey
DECRYPTION BY CERTIFICATE CardholderNameEncryptCert;

-- Select and decrypt the data
SELECT 
    payment_id,
    Cardholder_Name AS Original_Name,
    CONVERT(NVARCHAR(100), DecryptByKey(encrypted_cardholder_name)) AS Decrypted_Name
FROM 
    Payments;

-- Close the symmetric key
CLOSE SYMMETRIC KEY CardholderNameKey;
