-- Bakery_customer permissions
GRANT SELECT ON Products TO Bakery_customer;
GRANT SELECT, INSERT ON Orders TO Bakery_customer;
GRANT SELECT, INSERT ON Order_Items TO Bakery_customer;
GRANT SELECT, INSERT ON Payments TO Bakery_customer;
GRANT SELECT, UPDATE ON Customers TO Bakery_customer;
GO

-- Bakery_staff permissions
GRANT SELECT, INSERT, UPDATE ON Orders TO Bakery_staff;
GRANT SELECT, INSERT, UPDATE ON Order_Items TO Bakery_staff;
GRANT SELECT, INSERT, UPDATE ON Payments TO Bakery_staff;
GRANT SELECT ON Products TO Bakery_staff;
GRANT SELECT ON Customers TO Bakery_staff;
GO

-- Bakery_admin permissions
GRANT SELECT, INSERT, UPDATE, DELETE ON Orders TO Bakery_admin;
GRANT SELECT, INSERT, UPDATE, DELETE ON Order_Items TO Bakery_admin;
GRANT SELECT, INSERT, UPDATE, DELETE ON Payments TO Bakery_admin;
GRANT SELECT, INSERT, UPDATE, DELETE ON Products TO Bakery_admin;
GRANT SELECT, INSERT, UPDATE, DELETE ON Customers TO Bakery_admin;
GRANT SELECT, INSERT, UPDATE, DELETE ON Staff TO Bakery_admin;
GO

-- Hr permissions
GRANT SELECT, INSERT, UPDATE, DELETE ON Staff TO Bakery_HR;
GO

-- Guest permissions
GRANT SELECT ON Products TO Bakery_guest;
GO

-- Dbowner and Sysadmin roles will inherit server-level permissions