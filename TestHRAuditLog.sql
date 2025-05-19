USE BakeryOrderSystem
GO

EXECUTE AS USER = 'bakery_hr_user';
GO

Insert INTO Staff(first_name,last_name,email,phone,role,hire_date,salary) VALUES 
('Jane','Lee','jane@email.com',0123578960,'cashier',GETDATE(),3000.00);
GO

DELETE FROM Staff WHERE first_name ='Jane';
GO

REVERT;
GO

-- Check both the SQL Server audit and your custom audit table
SELECT 
    event_time,
    server_principal_name,
    database_principal_name,
    object_name,
    statement
FROM sys.fn_get_audit_file('C:\SQLAudits\Bakery_DB_Audit_*.sqlaudit', DEFAULT, DEFAULT)
WHERE object_name = 'Staff'
ORDER BY event_time DESC;

