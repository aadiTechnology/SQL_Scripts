DECLARE @SchoolId INT = 172,
        @AcademicYearId INT = 1,
        @InsertedById INT = 1;



BEGIN TRANSACTION;

BEGIN TRY
DECLARE @tempObservationTable TABLE
(
    SubjectName NVARCHAR(200),
    ObservationSkill NVARCHAR(500),
    ObservationParameter NVARCHAR(500),
    SortOrder INT,
	SKillSortOrder Int)

INSERT INTO @tempObservationTable
(
    SubjectName,
    ObservationSkill,
    ObservationParameter,
    SortOrder,
    SkillSortOrder
)
VALUES

(N'Physical Development',
 N'Curriculum Goal 1 - Children develop habits that keep them healthy & safe',
 N'C-1.1: Shows a liking for and understanding of nutritious food and does not waste food',
 1, 1),

(N'Physical Development',
 N'Curriculum Goal 1 - Children develop habits that keep them healthy & safe',
 N'C-1.2: Practices basic self-care and hygiene',
 2, 1),

(N'Physical Development',
 N'Curriculum Goal 1 - Children develop habits that keep them healthy & safe',
 N'C-1.3: Understands unsafe situations and asks for help',
 3, 1),

(N'Physical Development',
 N'Curriculum Goal 2 - Children develop sharpness in sensorial perceptions',
 N'C-2.1: Differentiates between shapes, colours, and their shades',
 1, 2),

(N'Physical Development',
 N'Curriculum Goal 2 - Children develop sharpness in sensorial perceptions',
 N'C-2.2: Differentiates multiple smells and tastes',
 2, 2),

(N'Physical Development',
 N'Curriculum Goal 2 - Children develop sharpness in sensorial perceptions',
 N'C-2.3: Develops discrimination in the sense of touch',
 3, 2),

(N'Physical Development',
 N'Curriculum Goal 3 - Children develop a fit and flexible body',
 N'C-3.1: Shows balance, coordination and flexibility in various physical activities',
 1, 3),

(N'Physical Development',
 N'Curriculum Goal 3 - Children develop a fit and flexible body',
 N'C-3.2: Shows precision and control in working with their hands and fingers',
 2, 3),

(N'Physical Development',
 N'Curriculum Goal 3 - Children develop a fit and flexible body',
 N'C-3.3: Shows strength and endurance in carrying, walking and running',
 3, 3),

(N'Physical Development',
 N'Curriculum Goal 4 - Children develop emotional intelligence',
 N'C-4.1: Starts recognising ''self'' as an individual belonging to a family and community',
 1, 4),

(N'Physical Development',
 N'Curriculum Goal 4 - Children develop emotional intelligence',
 N'C-4.2: Recognises different emotions and makes deliberate effort to regulate them appropriately',
 2, 4),

(N'Physical Development',
 N'Curriculum Goal 4 - Children develop emotional intelligence',
 N'C-4.3: Interacts comfortably with other children and adults',
 3, 4),

(N'Physical Development',
 N'Curriculum Goal 4 - Children develop emotional intelligence',
 N'C-4.4: Shows kindness and helpfulness to others (including animals, plants) when they are in need',
 4, 4);


INSERT INTO @tempObservationTable
(
    SubjectName,
    ObservationSkill,
    ObservationParameter,
    SortOrder,
    SkillSortOrder
)
VALUES

(N'Socio-emotional & Ethical Development',
 N'Curriculum Goal 5 - Children develop a positive attitude towards productive work and service or ''Seva''',
 N'C-5.1: Demonstrates willingness and participation in age-appropriate physical work towards helping',
 1, 1),

(N'Socio-emotional & Ethical Development',
 N'Curriculum Goal 6 - Children develop a positive regard for the natural environment around them',
 N'C-6.1: Shows care for and joy in engaging with all life forms',
 1, 2);


INSERT INTO @tempObservationTable
(
    SubjectName,
    ObservationSkill,
    ObservationParameter,
    SortOrder,
    SkillSortOrder
)
VALUES

(N'Cognitive Development',
 N'Curriculum Goal 7 - Children make sense of world around through observation and logical thinking',
 N'C-7.1: Observes and understands different categories of objects and relationships between them',
 1, 1),

(N'Cognitive Development',
 N'Curriculum Goal 7 - Children make sense of world around through observation and logical thinking',
 N'C-7.2: Observes and understands cause and effect relationships in nature by forming simple hypothesis and uses observations to explain their hypothesis',
 2, 1),

(N'Cognitive Development',
 N'Curriculum Goal 8 - Children develop mathematical understanding and abilities to recognise the world through quantities, shapes, and measures',
 N'C-8.1: Sorts objects into groups and sub-group based on more than one property',
 1, 2),

(N'Cognitive Development',
 N'Curriculum Goal 8 - Children develop mathematical understanding and abilities to recognise the world through quantities, shapes, and measures',
 N'C-8.2: Identifies and extends simple patterns in their surroundings, shapes, and numbers',
 2, 2),

(N'Cognitive Development',
 N'Curriculum Goal 8 - Children develop mathematical understanding and abilities to recognise the world through quantities, shapes, and measures',
 N'C-8.3: Recognises and uses numerals to represent quantities up to 99 with the understanding of decimal place value system',
 3, 2),

(N'Cognitive Development',
 N'Curriculum Goal 8 - Children develop mathematical understanding and abilities to recognise the world through quantities, shapes, and measures',
 N'C-8.4: Recognises, makes, and classifies basic geometric shapes and their observable properties, and understands and explains the relative relation of objects in space',
 4, 2),

(N'Cognitive Development',
 N'Curriculum Goal 8 - Children develop mathematical understanding and abilities to recognise the world through quantities, shapes, and measures',
 N'C-8.5: Formulates and solves simple mathematical problems related to quantities, shapes, space, and measurements',
 5, 2);


INSERT INTO @tempObservationTable
(
    SubjectName,
    ObservationSkill,
    ObservationParameter,
    SortOrder,
    SkillSortOrder
)
VALUES

(N'Language and Literacy Development',
 N'Curriculum Goal 9 - Children develop effective communication skills for day-to-day interactions in two languages',
 N'C-9.1: Listens to and appreciates simple songs, rhymes, and poems',
 1, 1),

(N'Language and Literacy Development',
 N'Curriculum Goal 9 - Children develop effective communication skills for day-to-day interactions in two languages',
 N'C-9.2: Converses fluently and can hold a meaningful conversation',
 2, 1),

(N'Language and Literacy Development',
 N'Curriculum Goal 9 - Children develop effective communication skills for day-to-day interactions in two languages',
 N'C-9.3: Understands oral instructions for a complex task and gives clear oral instructions for the same to others',
 3, 1),

(N'Language and Literacy Development',
 N'Curriculum Goal 9 - Children develop effective communication skills for day-to-day interactions in two languages',
 N'C-9.4: Comprehends narrated/read-out stories and identifies characters, storyline and what the author wants to say',
 4, 1),

(N'Language and Literacy Development',
 N'Curriculum Goal 10 - Children develop fluency in reading and writing in Language 1',
 N'C-10.1: Develops phonological awareness and blends phonemes/syllables into words and segment words into phonemes/syllables in L1',
 1, 2),

(N'Language and Literacy Development',
 N'Curriculum Goal 10 - Children develop fluency in reading and writing in Language 1',
 N'C-10.2: Understands basic structure/format of a book, idea of words in print and direction in which they are printed, and recognises basic punctuation marks',
 2, 2),

(N'Language and Literacy Development',
 N'Curriculum Goal 10 - Children develop fluency in reading and writing in Language 1',
 N'C-10.3: Recognises all the letters of the alphabet (forms of akshara) of the script (L1) and uses this knowledge to read and write words',
 3, 2),

(N'Language and Literacy Development',
 N'Curriculum Goal 10 - Children develop fluency in reading and writing in Language 1',
 N'C-10.4: Reads stories and passages (in L1) with accuracy and fluency with appropriate pauses and voice modulation',
 4, 2),

(N'Language and Literacy Development',
 N'Curriculum Goal 10 - Children develop fluency in reading and writing in Language 1',
 N'C-10.5: Reads short stories and comprehends its meaning - by identifying characters, storyline and what the author wanted to say- on their own (L1)',
 5, 2);


INSERT INTO @tempObservationTable
(
    SubjectName,
    ObservationSkill,
    ObservationParameter,
    SortOrder,
    SkillSortOrder
)
VALUES

(N'Aesthetic & Cultural Development',
 N'Curriculum Goal 11 - Children develop abilities and sensibilities in visual and performing arts, and express their emotions through art in meaningful and joyful ways',
 N'C-11.1: Explores and plays with a variety of materials and tools to create two-dimensional and three-dimensional artworks in varying sizes',
 1, 1),

(N'Aesthetic & Cultural Development',
 N'Curriculum Goal 11 - Children develop abilities and sensibilities in visual and performing arts, and express their emotions through art in meaningful and joyful ways',
 N'C-11.2: Explores and plays with own voice, body, spaces, and a variety of objects to create music, role-play, dance, and movement',
 2, 1),

(N'Aesthetic & Cultural Development',
 N'Curriculum Goal 11 - Children develop abilities and sensibilities in visual and performing arts, and express their emotions through art in meaningful and joyful ways',
 N'C-11.3: Innovates and works imaginatively to express ideas and emotions through the arts',
 3, 1);


INSERT INTO @tempObservationTable
(
    SubjectName,
    ObservationSkill,
    ObservationParameter,
    SortOrder,
    SkillSortOrder
)
VALUES

(N'Positive Learning Habits',
 N'Curriculum Goal 12 - Children develop habits of learning that allow them to engage actively in formal learning environments like a school classroom',
 N'C-12.1: Attention and intentional action: Acquires skills to plan, focus attention, and direct activities to achieve specific goals',
 1, 1),

(N'Positive Learning Habits',
 N'Curriculum Goal 12 - Children develop habits of learning that allow them to engage actively in formal learning environments like a school classroom',
 N'C-12.2: Observation, wonder, curiosity, and exploration: Observes minute details of objects, wonders and explores using various senses, tinkers with objects, asks questions',
 2, 1),



 (N'Parent Feedback',
 N'Parent Feedback',
 N'My child enjoys participating in...',
 1, 1),

(N'Parent Feedback',
 N'Parent Feedback',
 N'My child can be supported for...',
 2, 1),

 (N'Parent Feedback',
 N'Parent Feedback',
 N'I would also like to share...',
 3, 1),

 (N'Parent Feedback',
 N'Parent Feedback',
 N'Have I completed age appropriate vaccination schedule for my child?',
 4, 1),


 (N'Self Assessment',
 N'Self Assessment',
 N'Activities that i enjoy the most',
 1, 1),

(N'Self Assessment',
 N'Self Assessment',
 N'2. Activities that i find difficult to do',
 2, 1),

 (N'Self Assessment',
 N'Self Assessment',
 N'Activities that i enjoy doing with my friends',
 3, 1),

  (N'Peer Assessment',
 N'Peer Feedback',
 N'Helps in completing task/activity.',
 1, 1),

(N'Peer Assessment',
 N'Peer Feedback',
 N'Likes to play with others',
 2, 1),

 (N'Peer Assessment',
 N'Peer Feedback',
 N'Shares stationery (crayons/ glue/chalk) with classmates',
 3, 1),

  (N'All about me',
 N'All about me',
 N'Things I like',
 1, 1),

(N'All about me',
 N'All about me',
 N'My friends are',
 2, 1),

 (N'All about me',
 N'All about me',
 N'My Favourite colours are
',
3, 1),

 (N'All about me',
 N'All about me',
 N'My Favourite Foods are',
4, 1),

 (N'All about me',
 N'All about me',
 N'My Favourite games are',
5, 1),

 (N'All about me',
 N'All about me',
 N'My Favourite animals are',
6, 1)



  DECLARE @StandardId INT

SELECT @StandardId = Standard_Id 
FROM Standard_Master 
WHERE Standard_Name = N'Nursery' 
  AND School_Id = @SchoolId 
  AND academic_Year_Id = @AcademicYearId 
  AND Is_Deleted = 'N'


  
    SELECT 
        t.SubjectName,
        t.ObservationSkill,
        SkillSortOrder
    FROM @tempObservationTable t
    GROUP BY t.SubjectName, t.ObservationSkill,SkillSortOrder

-- =============================================
-- Step 1: Insert Skills into ObservationSkills (skip duplicates)
-- =============================================

;WITH DistinctSkills AS
(
    SELECT 
        t.SubjectName,
        t.ObservationSkill,
        SkillSortOrder
    FROM @tempObservationTable t
    GROUP BY t.SubjectName, t.ObservationSkill,SkillSortOrder
)
INSERT INTO ObservationSkills 
(
    [Name], 
    [OriginalSkillId], 
    [DisplayOnReport], 
    [SortOrder], 
    [StandardId], 
    [SubjectId], 
    [SchoolId], 
    [AcademicYearId], 
    [IsDeleted], 
    [InsertedById], 
    [InsertDate], 
    [UpdatedById], 
    [UpdateDate]
)
SELECT 
    ds.ObservationSkill,
    NULL,
    1,
    ds.SkillSortOrder,
    @StandardId,
    sm.Subject_Id,
    @SchoolId,
    @AcademicYearId,
    0,
    1,
    dbo.getlocaldate(default),
    NULL,
    NULL
FROM DistinctSkills ds
INNER JOIN Subject_Master sm 
    ON sm.Subject_Name = ds.SubjectName 
    AND sm.School_Id = @SchoolId 
    AND sm.academic_Year_Id = @AcademicYearId 
    AND sm.Is_Deleted = 'N'
WHERE NOT EXISTS 
(
    SELECT 1 
    FROM ObservationSkills os 
    WHERE os.[Name] = ds.ObservationSkill 
      AND os.StandardId = @StandardId 
      AND os.SubjectId = sm.Subject_Id 
      AND os.SchoolId = @SchoolId 
      AND os.AcademicYearId = @AcademicYearId 
      AND os.IsDeleted = 0
)

-- =============================================
-- Step 2: Insert Parameters into ObservationParameters (skip duplicates)
-- =============================================

INSERT INTO ObservationParameters 
(
    [Parameter], 
    [SkillId], 
    [SortOrder], 
    [IsSubmitted], 
    [ControlTypeId], 
    [SchoolId], 
    [AcademicYearId], 
    [IsDeleted], 
    [InsertedById], 
    [InsertDate], 
    [UpdatedById], 
    [UpdateDate]
)
SELECT 
    t.ObservationParameter,
    os.Id,
    t.SortOrder,
    1,
    1,
    @SchoolId,
    @AcademicYearId,
    0,
    1,
    dbo.getlocaldate(default),
    NULL,
    NULL
FROM @tempObservationTable t
INNER JOIN Subject_Master sm 
    ON sm.Subject_Name = t.SubjectName 
    AND sm.School_Id = @SchoolId 
    AND sm.academic_Year_Id = @AcademicYearId 
    AND sm.Is_Deleted = 'N'
INNER JOIN ObservationSkills os 
    ON os.[Name] = t.ObservationSkill 
    AND os.StandardId = @StandardId 
    AND os.SubjectId = sm.Subject_Id 
    AND os.SchoolId = @SchoolId 
    AND os.AcademicYearId = @AcademicYearId 
    AND os.IsDeleted = 0
WHERE NOT EXISTS 
(
    SELECT 1 
    FROM ObservationParameters op 
    WHERE op.[Parameter] = t.ObservationParameter 
      AND op.SkillId = os.Id 
      AND op.SchoolId = @SchoolId 
      AND op.AcademicYearId = @AcademicYearId 
      AND op.IsDeleted = 0
)



  COMMIT TRANSACTION
  END TRY
  BEGIN CATCH
	PRINT ERROR_MESSAGE()
	ROLLBACK TRANSACTION
  END CATCH