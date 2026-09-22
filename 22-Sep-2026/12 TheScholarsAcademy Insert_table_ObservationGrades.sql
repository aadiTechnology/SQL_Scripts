Declare @SchoolId int
Select @SchoolId=SchoolId from SchoolSettings 
INSERT INTO ObservationGrades 
(Name, ShortName, Description, OriginalGradeId, SortOrder, SchoolId, AcademicYearId, IsDeleted, InsertedById, InsertDate, UpdatedById, UpdateDate) 
VALUES
 ('Outstanding','A+','Student meets most of the expectations independently.',1,1,@SchoolId,1,0,1,dbo.GetLocalDate(DEFAULT),1,dbo.GetLocalDate(DEFAULT)),
('Excellent','A','Student meets some of the expectations occasionally.',2,2,@SchoolId,1,0,1,dbo.GetLocalDate(DEFAULT),1,dbo.GetLocalDate(DEFAULT)),
('Very Good','B','Student meets most of the expectations on guidance only.',3,3,@SchoolId,1,0,1,dbo.GetLocalDate(DEFAULT),1,dbo.GetLocalDate(DEFAULT)),
('Good','C','Student meets few of the expectations on guidance only.',4,4,@SchoolId,1,0,1,dbo.GetLocalDate(DEFAULT),1,dbo.GetLocalDate(DEFAULT)),
('Needs Improvement','D','Student does not follow even on guidance.',5,5,@SchoolId,1,0,1,dbo.GetLocalDate(DEFAULT),1,dbo.GetLocalDate(DEFAULT));