----Message center
insert into UserScreenPermissions
select 75, 8642, 'N', 0, 1, dbo.GetLocalDate(default), 1, dbo.GetLocalDate(default)

----Photo/Video Gallery
insert into UserScreenPermissions
select 54, 8642, 'N', 0, 1, dbo.GetLocalDate(default), 1, dbo.GetLocalDate(default)