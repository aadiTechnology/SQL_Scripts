insert into UserScreenPermissions   --To give full access to principal of Assign Homework screen
select 201, 3, 'Y', 0, 1, dbo.GetLocalDate(default), 1, dbo.GetLocalDate(default)