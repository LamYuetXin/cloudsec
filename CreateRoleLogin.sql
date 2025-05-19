USE master;
Go
-- sysasdmin
-- dbcreator
CREATE LOGIN bakery_hr_login WITH PASSWORD = 'HRPass123!';
CREATE LOGIN sysadmin_John WITH PASSWORD = 'John123!';
CREATE LOGIN dbowner_Pete WITH PASSWORD = 'Pete123!';
ALTER SERVER ROLE sysadmin ADD MEMBER sysadmin_John;

USE BakeryOrderSystem;
GO

CREATE ROLE Bakery_customer;
CREATE ROLE Bakery_staff;
CREATE ROLE Bakery_admin;
CREATE ROLE Bakery_HR;
CREATE ROLE Bakery_guest;

ALTER ROLE db_owner ADD MEMBER dbowner_Pete;

CREATE LOGIN bakery_staff_login WITH PASSWORD = 'StaffPass123!';
CREATE USER bakery_staff_user FOR LOGIN bakery_staff_login;
EXEC sp_addrolemember 'Bakery_staff', 'bakery_staff_user';

CREATE LOGIN bakery_customer_login WITH PASSWORD = 'CusPass123!';
CREATE USER bakery_customer_user FOR LOGIN bakery_customer_login;
EXEC sp_addrolemember 'Bakery_customer','bakery_customer_user';

CREATE LOGIN bakery_admin_login WITH PASSWORD = 'AdminPass123!';
CREATE USER bakery_admin_user FOR LOGIN bakery_admin_login;
ALTER ROLE Bakery_admin ADD MEMBER bakery_admin_user;

CREATE USER bakery_hr_user FOR LOGIN bakery_hr_login;
ALTER ROLE Bakery_hr ADD MEMBER bakery_hr_user;