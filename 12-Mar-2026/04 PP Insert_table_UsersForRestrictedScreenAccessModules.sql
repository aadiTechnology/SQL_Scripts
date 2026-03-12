INSERT INTO UsersForRestrictedScreenAccessModules
(
    UserId,
    SchoolModuleId,
    IsDeleted,
    SchoolId
)
SELECT 
    7346,
    SchoolModulesId,
    0,
    18
FROM SchoolModules
WHERE SchoolModulesName IN
(
'Inventory',
'Payroll',
'Transport',
'Task Management',
'Library',
'Accounts',
'Staff Performance',
'Guest Management'
)
AND NOT EXISTS
(
    SELECT 1
    FROM UsersForRestrictedScreenAccessModules UR
    WHERE UR.UserId = 7346
    AND UR.SchoolModuleId = SchoolModules.SchoolModulesId
    AND UR.IsDeleted = 0
)


INSERT INTO UsersForRestrictedScreenAccessModules
(
    UserId,
    SchoolModuleId,
    IsDeleted,
    SchoolId
)
SELECT 
    754,
    SchoolModulesId,
    0,
    18
FROM SchoolModules
WHERE SchoolModulesName IN
(
'Inventory',
'Payroll',
'Transport',
'Task Management',
'Library',
'Staff Performance',
'Guest Management'
)
AND NOT EXISTS
(
    SELECT 1
    FROM UsersForRestrictedScreenAccessModules UR
    WHERE UR.UserId = 754
    AND UR.SchoolModuleId = SchoolModules.SchoolModulesId
    AND UR.IsDeleted = 0
)


UPDATE UsersForRestrictedScreenAccessModules
SET IsDeleted = 1
WHERE UserId NOT IN (754,7346)
AND IsDeleted = 0

Update SchoolModules
set IsScreenAccessRestricted=1
where SchoolModulesName in('Inventory','Payroll','Transport','Task Management','Library'
                            ,'Accounts','Staff Performance','Guest Management')