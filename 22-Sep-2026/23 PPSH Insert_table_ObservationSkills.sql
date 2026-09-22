DECLARE @SchoolId INT = 11,
        @AcademicYearId INT = 15,
        @InsertedById INT = 1;


  DECLARE @tempObservationTable TABLE
(
    SubjectName NVARCHAR(200),
    ObservationSkill NVARCHAR(500),
    ObservationParameter NVARCHAR(500),
    SortOrder INT,
	SKillSortOrder Int
)

 INSERT INTO @tempObservationTable
(
    SubjectName,
    ObservationSkill,
    ObservationParameter,
    SortOrder,
    SkillSortOrder
)
VALUES

/* CG-1 */
(N'THE WORLD AROUND US',
 N'CG-1 Explores natural & socio-cultural surroundings',
 N'C1.1 Observes natural & social surroundings',
 1, 1),

(N'THE WORLD AROUND US',
 N'CG-1 Explores natural & socio-cultural surroundings',
 N'C1.2 Describes family, community & nature links',
 2, 1),

(N'THE WORLD AROUND US',
 N'CG-1 Explores natural & socio-cultural surroundings',
 N'C1.3 Asks questions and predicts simple patterns',
 3, 1),

(N'THE WORLD AROUND US',
 N'CG-1 Explores natural & socio-cultural surroundings',
 N'C1.4 Explains roles of local institutions',
 4, 1),

(N'THE WORLD AROUND US',
 N'CG-1 Explores natural & socio-cultural surroundings',
 N'C1.5 Uses local materials to make simple objects',
 5, 1),


/* CG-2 */
(N'THE WORLD AROUND US',
 N'CG-2 Understands environmental interdependence',
 N'C2.1 Identifies natural & human-made support systems',
 1, 2),

(N'THE WORLD AROUND US',
 N'CG-2 Understands environmental interdependence',
 N'C2.2 Relates nature with cultural practices',
 2, 2),

(N'THE WORLD AROUND US',
 N'CG-2 Understands environmental interdependence',
 N'C2.3 Connects environmental changes with community life',
 3, 2),


/* CG-3 */
(N'THE WORLD AROUND US',
 N'CG-3 Ensures safety of self and others',
 N'C3.1 Describes basic safety and protection needs',
 1, 3),

(N'THE WORLD AROUND US',
 N'CG-3 Ensures safety of self and others',
 N'C3.2 Discusses emergency preparedness',
 2, 3),

(N'THE WORLD AROUND US',
 N'CG-3 Ensures safety of self and others',
 N'C3.3 Creates safety labels, slogans & role plays',
 3, 3),


/* CG-4 */
(N'THE WORLD AROUND US',
 N'CG-4 Shows care for society & nature',
 N'C4.1 Observes diversity in plants, birds & animals',
 1, 4),

(N'THE WORLD AROUND US',
 N'CG-4 Shows care for society & nature',
 N'C4.2 Observes cultural diversity',
 2, 4),

(N'THE WORLD AROUND US',
 N'CG-4 Shows care for society & nature',
 N'C4.3 Describes use of natural resources',
 3, 4),

(N'THE WORLD AROUND US',
 N'CG-4 Shows care for society & nature',
 N'C4.4 Identifies people''s needs in different situations',
 4, 4),

(N'THE WORLD AROUND US',
 N'CG-4 Shows care for society & nature',
 N'C4.5 Identifies needs of plants & animals',
 5, 4),

(N'THE WORLD AROUND US',
 N'CG-4 Shows care for society & nature',
 N'C4.6 Explains conservation of natural resources',
 6, 4),

(N'THE WORLD AROUND US',
 N'CG-4 Shows care for society & nature',
 N'C4.7 Follows social & environmental values',
 7, 4),


/* CG-5 */
(N'THE WORLD AROUND US',
 N'CG-5 Reads and interprets simple maps',
 N'C5.1 Explains simple line drawings',
 1, 5),

(N'THE WORLD AROUND US',
 N'CG-5 Reads and interprets simple maps',
 N'C5.2 Draws simple sketches with symbols',
 2, 5),

(N'THE WORLD AROUND US',
 N'CG-5 Reads and interprets simple maps',
 N'C5.3 Reads simple maps using symbols & directions',
 3, 5),


/* CG-6 */
(N'THE WORLD AROUND US',
 N'CG-6 Investigates surroundings using data',
 N'C6.1 Performs simple inquiry',
 1, 6),

(N'THE WORLD AROUND US',
 N'CG-6 Investigates surroundings using data',
 N'C6.2 Presents findings creatively',
 2, 6),


/* CG-7 */
(N'THE WORLD AROUND US',
 N'CG-7 Builds basic science understanding',
 N'C7.1 Uses basic scientific methods',
 1, 7),

(N'THE WORLD AROUND US',
 N'CG-7 Builds basic science understanding',
 N'C7.2 Recognises key science & engineering ideas',
 2, 7);

  /*=========================================================
      COMPUTATIONAL THINKING & ARTIFICIAL INTELLIGENCE
    =========================================================*/

    INSERT INTO @tempObservationTable
    (
        SubjectName,
        ObservationSkill,
        ObservationParameter,
        SortOrder,
        SkillSortOrder
    )
    VALUES
    (N'COMPUTATIONAL THINKING & ARTIFICIAL INTELLIGENCE',
     N'Developing Problem-Solving Skills through Computational Thinking',
     N'Solves puzzles and daily-life problems using logical reasoning and step-by-step thinking.',
     1, 1),

    (N'COMPUTATIONAL THINKING & ARTIFICIAL INTELLIGENCE',
     N'Developing Problem-Solving Skills through Computational Thinking',
     N'Identifies patterns, sequences, and relationships in numbers, shapes, symbols, and everyday situations.',
     2, 1),

	(N'COMPUTATIONAL THINKING & ARTIFICIAL INTELLIGENCE',
     N'Developing Problem-Solving Skills through Computational Thinking',
     N'Uses simple algorithms to solve everyday tasks and mathematical problems.',
     3, 1),

   (N'COMPUTATIONAL THINKING & ARTIFICIAL INTELLIGENCE',
     N'Developing Logical and Analytical Thinking',
     N'Recognizes and extends patterns using logical reasoning.',
     1, 2),

    (N'COMPUTATIONAL THINKING & ARTIFICIAL INTELLIGENCE',
     N'Developing Logical and Analytical Thinking',
     N'Selects appropriate strategies such as estimation, trial-and-error, and systematic thinking.',
     2, 2),

	(N'COMPUTATIONAL THINKING & ARTIFICIAL INTELLIGENCE',
     N'Developing Logical and Analytical Thinking',
     N'Makes connections among concepts while solving problems.',
     3, 2),


	

   (N'COMPUTATIONAL THINKING & ARTIFICIAL INTELLIGENCE',
     N'Understanding Digital Literacy and Computer Concepts',
     N'Identifies basic parts of a computer and their functions.',
     1, 3),

    (N'COMPUTATIONAL THINKING & ARTIFICIAL INTELLIGENCE',
     N'Understanding Digital Literacy and Computer Concepts',
     N'Demonstrates safe and responsible use of digital devices and the internet.',
     2, 3),

	(N'COMPUTATIONAL THINKING & ARTIFICIAL INTELLIGENCE',
     N'Understanding Digital Literacy and Computer Concepts',
     N'Uses educational software and manages simple files.',
     3, 3),


	  (N'COMPUTATIONAL THINKING & ARTIFICIAL INTELLIGENCE',
     N'Introduction to Coding and AI',
     N'Creates simple programs using block-based coding.',
     1, 4),

	(N'COMPUTATIONAL THINKING & ARTIFICIAL INTELLIGENCE',
     N'Introduction to Coding and AI',
     N'Recognizes examples of Artificial Intelligence in daily life.',
     2, 4)


	 
    INSERT INTO @tempObservationTable
    (
        SubjectName,
        ObservationSkill,
        ObservationParameter,
        SortOrder,
        SkillSortOrder
    )
    VALUES

	
  (N'STEM EDUCATION',
 N'CG-1: Develops basic work skills and knowledge of tools, materials, and procedures',
 N'C1.1 Identifies and uses tools correctly.',
 1, 1),

(N'STEM EDUCATION',
 N'CG-1: Develops basic work skills and knowledge of tools, materials, and procedures',
 N'C1.2 Plans and completes tasks systematically..',
 2, 1),

(N'STEM EDUCATION',
 N'CG-1: Develops basic work skills and knowledge of tools, materials, and procedures',
 N'C1.3 Uses and maintains materials and equipment properly',
 3, 1),

     (N'STEM EDUCATION',
     N'CG-2: Understands the value of vocational skills in work',
     N'C2.1 Explains the importance of vocations.',
     1, 2),

    (N'STEM EDUCATION',
     N'CG-2: Understands the value of vocational skills in work',
     N'C2.2 Applies learned vocational skills.',
     2, 2),

	(N'STEM EDUCATION',
     N'CG-2: Understands the value of vocational skills in work',
     N'C2.3 Evaluates products and materials',
     3, 2),

	    (N'STEM EDUCATION',
     N'CG-3: Develops positive work values and attitudes.',
     N'C3.1 Demonstrates attention to detail, persistence, creativity, empathy, teamwork, and willingness to work.',
     1, 3),

	(N'STEM EDUCATION',
     N'CG-4: Applies vocational skills in daily life and home',
     N'C4.1 Uses vocational skills effectively at home.',
     1, 4)


	


	  DECLARE @StandardId INT

SELECT @StandardId = Standard_Id 
FROM Standard_Master 
WHERE Standard_Name = N'4' 
  AND School_Id = @SchoolId 
  AND academic_Year_Id = @AcademicYearId 
  AND Is_Deleted = 'N'

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
