USE BakeryOrderSystem;
GO
-- Create a view that only shows staff needed for authentication
CREATE VIEW vw_StaffAuth AS
SELECT staff_id, first_name, email, is_active
FROM Staff;
GO

-- Grant SELECT permission on this view to staff login
GRANT SELECT ON vw_StaffAuth TO bakery_staff_user;
GO

SELECT staff_id, first_name FROM vw_StaffAuth WHERE first_name = 'Jason' AND email = 'jason@email.com' AND is_active = 1