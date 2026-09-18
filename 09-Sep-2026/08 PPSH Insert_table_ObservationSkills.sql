-- =============================================
-- Script: Observations.sql
-- Description: Creates and populates @tempObservationTable with 
--              Subject, Skill, and Parameter details from 
--              HPC Middle Stage (VI-VIII) 2026
--              Then inserts into ObservationSkills and ObservationParameters
-- Target: Microsoft SQL Azure (RTM) - 12.0.2000.8
-- =============================================

DECLARE @SchoolId INT=11,
        @AcademicYearId INT=15

-- TODO: Assign values for @SchoolId and @AcademicYearId
-- SET @SchoolId = <value>
-- SET @AcademicYearId = <value>
BEGIN TRANSACTION
BEGIN TRY

DECLARE @tempObservationTable TABLE
(
    SubjectName NVARCHAR(200),
    ObservationSkill NVARCHAR(500),
    ObservationParameter NVARCHAR(500),
    SortOrder INT,
	SKillSortOrder Int
)

-- =============================================
-- ENGLISH
-- =============================================

INSERT INTO @tempObservationTable (SubjectName, ObservationSkill, ObservationParameter, SortOrder,SKillSortOrder)
VALUES
(N'English', N'Develops effective communication using language skills', N'Summarises main points from listening or reading texts', 1,1),
(N'English', N'Develops effective communication using language skills', N'Plans and conducts different kinds of interviews', 2,1),
(N'English', N'Develops effective communication using language skills', N'Raises probing questions about social experiences', 3,1),
(N'English', N'Develops effective communication using language skills', N'Writes letters, essays and reports appropriately', 4,1),
(N'English', N'Develops effective communication using language skills', N'Creates audio-visual content for different audiences', 5,1),

(N'English', N'Appreciates language, literature and cultural heritage', N'Appreciates different forms and styles of literature', 1,2),
(N'English', N'Appreciates language, literature and cultural heritage', N'Identifies and uses literary devices in writing', 2,2),
(N'English', N'Appreciates language, literature and cultural heritage', N'Expresses ideas and critiques through speech and writing', 3,2),

(N'English', N'Recognises and uses basic linguistic aspects', N'Understands and applies basic grammar rules', 1,3),
(N'English', N'Recognises and uses basic linguistic aspects', N'Writes prose, poetry and drama appropriately', 2,3),

(N'English', N'Writes reviews and uses library references', N'Reads and critically reviews varied books', 1,4),
(N'English', N'Writes reviews and uses library references', N'Uses books and media resources for references', 2,4),

(N'English', N'Appreciates distinctive features of the language', N'Understands the phonetics and script of the language', 1,5),
(N'English', N'Appreciates distinctive features of the language', N'Uses puns, rhymes and wordplay in speech and writing', 2,5),
(N'English', N'Appreciates distinctive features of the language', N'Familiar with major word games in the language', 3,5)

-- =============================================
-- HINDI
-- =============================================

INSERT INTO @tempObservationTable (SubjectName, ObservationSkill, ObservationParameter, SortOrder,SKillSortOrder)
VALUES
(N'Hindi', N'Develops reading & comprehension skills', N'Uses comprehension strategies', 1,1),
(N'Hindi', N'Develops reading & comprehension skills', N'Summarizes text clearly', 2,1),
(N'Hindi', N'Develops reading & comprehension skills', N'Identifies the main idea', 3,1),
(N'Hindi', N'Develops reading & comprehension skills', N'Enjoys reading varied books', 4,1),

(N'Hindi', N'Develops writing skills', N'Structures writing clearly', 1,2),
(N'Hindi', N'Develops writing skills', N'Expresses thoughts and feelings', 2,2),

(N'Hindi', N'Communicates effectively', N'Writes for different purposes', 1,3),

(N'Hindi', N'Appreciates literature', N'Recognizes literary forms', 1,4),
(N'Hindi', N'Appreciates literature', N'Uses literary devices', 2,4),

(N'Hindi', N'Uses correct grammar', N'Applies grammar correctly', 1,5),
(N'Hindi', N'Uses correct grammar', N'Regularly borrows and reads books from the library', 2,5),

(N'Hindi', N'Appreciates language features', N'Understands script & phonetics', 1,6),
(N'Hindi', N'Appreciates language features', N'Uses rhymes & wordplay', 2,6),
(N'Hindi', N'Appreciates language features', N'Recognizes language games', 3,6)

-- =============================================
-- MARATHI
-- =============================================

INSERT INTO @tempObservationTable (SubjectName, ObservationSkill, ObservationParameter, SortOrder,SKillSortOrder)
VALUES
(N'Marathi', N'Builds effective daily communication and oral expression skills', N'Makes context-appropriate conversations', 1,1),
(N'Marathi', N'Builds effective daily communication and oral expression skills', N'Listens to texts and summarizes key ideas', 2,1),
(N'Marathi', N'Builds effective daily communication and oral expression skills', N'Gives short oral presentations confidently', 3,1),

(N'Marathi', N'Reads fluently with understanding', N'Reads accurately with fluency and expression', 1,2),
(N'Marathi', N'Reads fluently with understanding', N'Understands main ideas from different texts', 2,2),

(N'Marathi', N'Expresses ideas and feelings in writing', N'Writes short paragraphs to express ideas and experiences', 1,3)

-- =============================================
-- MATHEMATICS
-- =============================================

INSERT INTO @tempObservationTable (SubjectName, ObservationSkill, ObservationParameter, SortOrder,SKillSortOrder)
VALUES
(N'Mathematics', N'Understands numbers and number systems; recognizes patterns and relationships between numbers', N'Reads, writes, compares, and manipulates large whole numbers (up to 20 digits); expresses them using exponents/scientific notation', 1,1),
(N'Mathematics', N'Understands numbers and number systems; recognizes patterns and relationships between numbers', N'Identifies and explains numerical patterns (multiples, powers, prime numbers)', 2,1),
(N'Mathematics', N'Understands numbers and number systems; recognizes patterns and relationships between numbers', N'Understands zero and negative numbers, and operations on them (Brahmagupta''s contribution)', 3,1),
(N'Mathematics', N'Understands numbers and number systems; recognizes patterns and relationships between numbers', N'Understands whole numbers, fractions, integers, rational and real numbers, and their properties; represents them on a number line', 4,1),
(N'Mathematics', N'Understands numbers and number systems; recognizes patterns and relationships between numbers', N'Understands and applies percentages to solve problems', 5,1),
(N'Mathematics', N'Understands numbers and number systems; recognizes patterns and relationships between numbers', N'Applies fractions (as ratios and decimals) in daily-life situations', 6,1),

(N'Mathematics', N'Understands variables, expressions, and equations; solves problems with procedural fluency', N'Checks and verifies equality of numerical expressions/equations', 1,2),
(N'Mathematics', N'Understands variables, expressions, and equations; solves problems with procedural fluency', N'Represents numbers using variables and algebraic expressions', 2,2),
(N'Mathematics', N'Understands variables, expressions, and equations; solves problems with procedural fluency', N'Forms and manipulates algebraic expressions using variables, coefficients, and constants', 3,2),
(N'Mathematics', N'Understands variables, expressions, and equations; solves problems with procedural fluency', N'Solves linear equations, puzzles, and word problems', 4,2),
(N'Mathematics', N'Understands variables, expressions, and equations; solves problems with procedural fluency', N'Develops own strategies for algebraic problem-solving', 5,2),

(N'Mathematics', N'Understands and applies properties /theorems of 2D and 3D geometric shapes', N'Classifies 2D/3D shapes by their defining properties', 1,3),
(N'Mathematics', N'Understands and applies properties /theorems of 2D and 3D geometric shapes', N'Applies properties of lines, angles, triangles, quadrilaterals, and polygons to solve problems', 2,3),
(N'Mathematics', N'Understands and applies properties /theorems of 2D and 3D geometric shapes', N'Identifies 3D shapes (cubes, cylinders, cones, etc); builds and visualizes 2D-3D representations', 3,3),
(N'Mathematics', N'Understands and applies properties /theorems of 2D and 3D geometric shapes', N'Constructs geometric figures (lines, angles, triangles) using compass and straightedge', 4,3),
(N'Mathematics', N'Understands and applies properties /theorems of 2D and 3D geometric shapes', N'Understands congruence and similarity; identifies congruent/similar triangles', 5,3),

(N'Mathematics', N'Understands perimeter and area of 2D shapes; solves day-to-day problems', N'Applies formulae for area of square, triangle, parallelogram, trapezium, and composite shapes', 1,4),
(N'Mathematics', N'Understands perimeter and area of 2D shapes; solves day-to-day problems', N'Learns the Baudhayana-Pythagoras theorem with its geometric proof (Sulba-Sutras)', 2,4),
(N'Mathematics', N'Understands perimeter and area of 2D shapes; solves day-to-day problems', N'Creates tiling designs using 2D shapes; appreciates their use in art', 3,4),
(N'Mathematics', N'Understands perimeter and area of 2D shapes; solves day-to-day problems', N'Understands fractals; appreciates their occurrence in nature and art', 4,4),

(N'Mathematics', N'Collects, organizes, represents, and interprets data', N'Analyses data using mean, mode, and median', 1,5),
(N'Mathematics', N'Collects, organizes, represents, and interprets data', N'Creates and interprets graphs (pictographs, bar graphs, histograms, line graphs, pie charts)', 2,5),

(N'Mathematics', N'Develops mathematical thinking and communicates ideas logically and precisely', N'Uses inductive/deductive logic to form and prove conjectures/theorems in algebra, number theory, and geometry', 1,6),

(N'Mathematics', N'Engages with puzzles; develops creative problem-solving methods', N'Creates own solutions to puzzles; appreciates others'' approaches', 1,7),
(N'Mathematics', N'Engages with puzzles; develops creative problem-solving methods', N'Appreciates the artistry and aesthetics of puzzle-making and puzzle-solving', 2,7),

(N'Mathematics', N'Develops computational thinking skills', N'Uses iteration, symbolic representation, and logical steps to solve problems (algorithmic thinking)', 1,8),
(N'Mathematics', N'Develops computational thinking skills', N'Learns systematic counting, reasoning, and data representation; devises and evaluates algorithms', 2,8),

(N'Mathematics', N'Appreciates the historical development of mathematics and mathematicians'' contributions', N'Traces the evolution of mathematical concepts across civilizations', 1,9),
(N'Mathematics', N'Appreciates the historical development of mathematics and mathematicians'' contributions', N'Recognizes contributions of Indian mathematicians (Baudhayana, Pingala, Aryabhata, Brahmagupta, Virahanka, Bhaskara, Ramanujan)', 2,9),

(N'Mathematics', N'Appreciates Mathematics'' connections with other subjects', N'Recognizes links between Mathematics and Science, Social Science, Visual Arts, Music, Vocational Education, and Sports', 1,10)

-- =============================================
-- SCIENCE
-- =============================================

INSERT INTO @tempObservationTable (SubjectName, ObservationSkill, ObservationParameter, SortOrder,SKillSortOrder)
VALUES
(N'Science', N'Explores the world of matter and its constituents, properties, and behaviour', N'Classifies matter by its physical (observable) and chemical properties', 1,1),
(N'Science', N'Explores the world of matter and its constituents, properties, and behaviour', N'Describes physical and chemical changes in matter using the particulate nature of matter', 2,1),
(N'Science', N'Explores the world of matter and its constituents, properties, and behaviour', N'Measures physical properties of matter (eg volume, weight, temperature etc)', 3,1),
(N'Science', N'Explores the world of matter and its constituents, properties, and behaviour', N'Observe and explains everyday phenomena using pressure, temperature, and density', 4,1),

(N'Science', N'Explores the physical world in scientific and mathematical terms', N'Describes one-dimensional motion using measurements and representations', 1,2),
(N'Science', N'Explores the physical world in scientific and mathematical terms', N'Describes simple electric circuits and their effects', 2,2),
(N'Science', N'Explores the physical world in scientific and mathematical terms', N'Describes magnets and Earth''s magnetism', 3,2),
(N'Science', N'Explores the physical world in scientific and mathematical terms', N'Demonstrates rectilinear propagation and reflection of light', 4,2),
(N'Science', N'Explores the physical world in scientific and mathematical terms', N'Identifies celestial objects and their significance', 5,2),

(N'Science', N'Explores the living world in scientific terms', N'Describes the diversity of living organisms', 1,3),
(N'Science', N'Explores the living world in scientific terms', N'Distinguishes living and non-living things', 2,3),
(N'Science', N'Explores the living world in scientific terms', N'Analyses relationships between organisms and their environment', 3,3),
(N'Science', N'Explores the living world in scientific terms', N'Explains conditions necessary for life', 4,3),

(N'Science', N'Understands the components of health, hygiene, and well-being', N'Explains nutrition and its impact on health', 1,4),
(N'Science', N'Understands the components of health, hygiene, and well-being', N'Examines food diversity and nutrition', 2,4),
(N'Science', N'Understands the components of health, hygiene, and well-being', N'Explains biological changes during adolescence', 3,4),
(N'Science', N'Understands the components of health, hygiene, and well-being', N'Recognizes substance abuse and safe support', 4,4),

(N'Science', N'Understands the interface of science, technology, and society', N'Explains the impact of science and technology on society', 1,5),
(N'Science', N'Understands the interface of science, technology, and society', N'Analyses science-technology-society interactions', 2,5),

(N'Science', N'Explores the nature and process of science through engaging with the evolution of scientific knowledge and conducting scientific inquiry', N'Explains the evolution of scientific knowledge and values', 1,6),
(N'Science', N'Explores the nature and process of science through engaging with the evolution of scientific knowledge and conducting scientific inquiry', N'Formulates scientific questions and collects evidence', 2,6),

(N'Science', N'Communicates, questions, observations, and conclusions related to science', N'Uses scientific vocabulary to communicate effectively', 1,7),
(N'Science', N'Communicates, questions, observations, and conclusions related to science', N'Designs and builds simple models to demonstrate scientific concepts', 2,7),
(N'Science', N'Communicates, questions, observations, and conclusions related to science', N'Represents real-world events using diagrams and models', 3,7),

(N'Science', N'Understands and appreciates the contribution of India through history and the present times to the overall field of science, including the discipline that constitute it', N'Explains India''s contributions to science', 1,8),

(N'Science', N'Develops awareness of the most current discoveries, ideas and frontiers in all areas of scientific knowledge in order to appreciate that science is ever evolving and that there are still many unanswered questions', N'Demonstrates conceptual understanding of scientific concepts', 1,9),
(N'Science', N'Develops awareness of the most current discoveries, ideas and frontiers in all areas of scientific knowledge in order to appreciate that science is ever evolving and that there are still many unanswered questions', N'Poses questions on unexplained scientific concepts', 2,9)

-- =============================================
-- SOCIAL SCIENCE
-- =============================================

INSERT INTO @tempObservationTable (SubjectName, ObservationSkill, ObservationParameter, SortOrder,SKillSortOrder)
VALUES
(N'Social Science', N'Interprets sources on different aspects of human life meaningfully', N'Collects and interprets primary and secondary sources to understand history, culture, geography, and society', 1,1),
(N'Social Science', N'Interprets sources on different aspects of human life meaningfully', N'Represents and analyses human-life data using text, tables, charts, diagrams, and maps', 2,1),

(N'Social Science', N'Explores continuity and change in human civilisations through contextual and historical examples', N'Explains major historical changes and their impact on society', 1,2),
(N'Social Science', N'Explores continuity and change in human civilisations through contextual and historical examples', N'Identifies continuity in beliefs, practices, relationships, and traditions', 2,2),

(N'Social Science', N'Connects causes and effects of social and historical events and their impact on human life', N'Analyses changes from nomadic life to settled civilisation (agriculture, technology, family, work, beliefs, wars)', 1,3),
(N'Social Science', N'Connects causes and effects of social and historical events and their impact on human life', N'Identifies reasons for harmony or conflict among social groups', 2,3),

(N'Social Science', N'Understands social, cultural, and political institutions, their impact, and people''s role in shaping them', N'Collects and interprets information on social, cultural, economic, and political institutions in their vicinity', 1,4),
(N'Social Science', N'Understands social, cultural, and political institutions, their impact, and people''s role in shaping them', N'Assesses how institutions influence individuals, groups, or society', 2,4),

(N'Social Science', N'Understands inequality, prejudice, and efforts to promote equality and justice', N'Identifies and questions inequality, prejudice, and discrimination at family to national/global levels', 1,5),
(N'Social Science', N'Understands inequality, prejudice, and efforts to promote equality and justice', N'Identifies and appreciates efforts to ensure equity, inclusion, and justice', 2,5),

(N'Social Science', N'Understands distribution of resources, human-environment interdependence, and sustainability', N'Explains natural phenomena like climate, weather, ocean cycles, and river flow', 1,6),
(N'Social Science', N'Understands distribution of resources, human-environment interdependence, and sustainability', N'Identifies distribution of resources such as water, agriculture, and raw materials', 2,6),
(N'Social Science', N'Understands distribution of resources, human-environment interdependence, and sustainability', N'Analyses India''s efforts on conservation, sustainability and climate change', 3,6),
(N'Social Science', N'Understands distribution of resources, human-environment interdependence, and sustainability', N'Links livelihood patterns to landforms, resources, and climate', 4,6),

(N'Social Science', N'Appreciates India''s heritage, diversity, and contributions', N'Explains India''s cultural unity through language, art, values, and traditions', 1,7),
(N'Social Science', N'Appreciates India''s heritage, diversity, and contributions', N'Discovers India''s topographical diversity and biodiversity', 2,7),
(N'Social Science', N'Appreciates India''s heritage, diversity, and contributions', N'Appreciates India''s tradition of inclusion and its global cultural influence', 3,7),

(N'Social Science', N'Understands development of the Indian Constitution and its democratic values', N'Understands why a constitution is needed, especially India''s objectives', 1,8),
(N'Social Science', N'Understands development of the Indian Constitution and its democratic values', N'Explains the making of the Indian Constitution', 2,8),
(N'Social Science', N'Understands development of the Indian Constitution and its democratic values', N'Explains the three tiers of local self-government and their role in democracy', 3,8),

(N'Social Science', N'Understands production, consumption, trade, and commerce', N'Explains trade and commerce and their impact on individuals and society', 1,9),

(N'Social Science', N'Appreciates India''s historical and present contributions to Social Science', N'Explains India''s significant contributions to concepts and methods studied, understands the strength of India''s democratic traditions through history', 1,10)

-- =============================================
-- COMPUTATIONAL THINKING AND ARTIFICIAL INTELLIGENCE
-- =============================================

INSERT INTO @tempObservationTable (SubjectName, ObservationSkill, ObservationParameter, SortOrder,SKillSortOrder)
VALUES
(N'Computational Thinking and Artificial Intelligence', N'Develops skills and capacities of computational thinking, namely, decomposition, pattern recognition, data representation, generalization, abstraction, and algorithms to solve problems where such techniques of computational thinking are effective', N'Uses programmatic thinking techniques such as iteration, symbolic representation and logical steps to solve problems', 1,1),
(N'Computational Thinking and Artificial Intelligence', N'Develops skills and capacities of computational thinking, namely, decomposition, pattern recognition, data representation, generalization, abstraction, and algorithms to solve problems where such techniques of computational thinking are effective', N'Applies arithmetic reasoning, iterative patterns and data representations, and algorithms with focus on correctness and efficiency', 2,1),

(N'Computational Thinking and Artificial Intelligence', N'Develops spatial and visual reasoning', N'Learns to visualize, manipulate, represent, and understand spatial relationships between objects', 1,2),

(N'Computational Thinking and Artificial Intelligence', N'Gain foundational knowledge of AI, its types, and domains', N'Applies abstraction and generalization to identify core structures and patterns enabling reusable procedures', 1,3),

(N'Computational Thinking and Artificial Intelligence', N'Demonstrates proficiency to use Computer & other devices, computer applications for learning and practical purposes such as data analysis, preparation of visual representations and communication of ideas', N'Use digital tools to create visuals, organize ideas, research online and design simple info-graphics', 1,4)

-- =============================================
-- COMPUTER
-- =============================================

INSERT INTO @tempObservationTable (SubjectName, ObservationSkill, ObservationParameter, SortOrder,SKillSortOrder)
VALUES
(N'Computers', N'Build foundations in data organisation, representation, and analysis using real-world contexts', N'Organizes, represents, and analyses data from everyday contexts; interprets summaries and draws conclusions', 1,1),

(N'Computers', N'Gain awareness of Artificial Intelligence concepts, applications, and ethics, and engage with interdisciplinary projects', N'Describes foundational AI ideas (data-driven decisions, simple classification/prediction examples) and recognises AI''s applications and limitations', 1,2),
(N'Computer', N'Gain awareness of Artificial Intelligence concepts, applications, and ethics, and engage with interdisciplinary projects', N'Engages in discussions of fairness, bias, privacy, transparency, and responsible AI use; articulates ethical reasoning in simple dilemmas', 2,2),

(N'Computers', N'Apply programmatic thinking and introductory coding to real-life problems, reinforcing algorithmic reasoning and systematic problem-solving', N'Applies basic programming constructs (sequence, selection, iteration) in age-appropriate environments (eg, introductory text-based) to implement algorithms and test/debug solutions', 1,3),

(N'Computers', N'Practice safe, responsible, and ethical use of technology, with exposure to internet safety and digital citizenship', N'Demonstrates safe internet practices and basic digital citizenship appropriate to middle school', 1,4)

-- =============================================
-- ART EDUCATION
-- =============================================

INSERT INTO @tempObservationTable (SubjectName, ObservationSkill, ObservationParameter, SortOrder,SKillSortOrder)
VALUES
(N'Art Education', N'Develop knowledge of regional/state art forms and build basic artistic processes and skills', N'Demonstrate basic skills in regional arts (eg, traditional folk art like Kolam/Mandana, puppetry, folk songs, or dances) and create unique variations', 1,1),
(N'Art Education', N'Develop knowledge of regional/state art forms and build basic artistic processes and skills', N'Describe and carefully use local art tools and materials (eg, experimenting with natural dyes and colors sourced from plants, charcoal, or soil)', 2,1),
(N'Art Education', N'Develop knowledge of regional/state art forms and build basic artistic processes and skills', N'Observe local cultural performances or arts, recognize different viewpoints, and express personal thoughts, feelings, and interpretations', 3,1)

-- =============================================
-- PHYSICAL EDUCATION
-- =============================================

INSERT INTO @tempObservationTable (SubjectName, ObservationSkill, ObservationParameter, SortOrder,SKillSortOrder)
VALUES
(N'Physical Education', N'Demonstrates intermediate body movements and motor skills', N'Develops speed, strength, balance, flexibility and basic game skills', 1,1),
(N'Physical Education', N'Demonstrates intermediate body movements and motor skills', N'Performs rhythmic movements with balance and control', 2,1),
(N'Physical Education', N'Demonstrates intermediate body movements and motor skills', N'Uses two skills together during games', 3,1),
(N'Physical Education', N'Demonstrates intermediate body movements and motor skills', N'Uses space and equipment correctly', 4,1),
(N'Physical Education', N'Demonstrates intermediate body movements and motor skills', N'Follows warm-up and cool-down exercises', 5,1),
(N'Physical Education', N'Demonstrates intermediate body movements and motor skills', N'Improves strength, endurance, flexibility and agility', 6,1),

(N'Physical Education', N'Exhibits sensitivity in personal and social behavior', N'Respects others and reflects on own behavior', 1,2),
(N'Physical Education', N'Exhibits sensitivity in personal and social behavior', N'Helps others during injury or difficult situations', 2,2),
(N'Physical Education', N'Exhibits sensitivity in personal and social behavior', N'Knows and explains game rules', 3,2),
(N'Physical Education', N'Exhibits sensitivity in personal and social behavior', N'Follows safety rules during activities', 4,2),
(N'Physical Education', N'Exhibits sensitivity in personal and social behavior', N'Works as a team and accepts responsibility', 5,2),
(N'Physical Education', N'Exhibits sensitivity in personal and social behavior', N'Identifies bullying and knows whom to report', 6,2),

(N'Physical Education', N'Demonstrates physical, social and mental engagement', N'Plans simple game strategies', 1,3),
(N'Physical Education', N'Demonstrates physical, social and mental engagement', N'Shows courage and stays calm in difficult situations', 2,3),

(N'Physical Education', N'Plans and achieves personal fitness goals', N'Sets and works towards personal fitness goals', 1,4),

(N'Physical Education', N'Learns connection between activity and health', N'Enjoys activities that improve health', 1,5),
(N'Physical Education', N'Learns connection between activity and health', N'Respects different cultures through games and dance', 2,5),
(N'Physical Education', N'Learns connection between activity and health', N'Understands the beauty of rhythmic movement', 3,5)

-- =============================================
-- KAUSHAL BODH & STEM EDUCATION
-- =============================================

INSERT INTO @tempObservationTable (SubjectName, ObservationSkill, ObservationParameter, SortOrder,SKillSortOrder)
VALUES
(N'Kaushal Bodh & STEM Education', N'Develops basic work skills and knowledge of tools, materials, and procedures', N'Identifies and uses tools correctly', 1,1),
(N'Kaushal Bodh & STEM Education', N'Develops basic work skills and knowledge of tools, materials, and procedures', N'Plans and completes tasks systematically', 2,1),
(N'Kaushal Bodh & STEM Education', N'Develops basic work skills and knowledge of tools, materials, and procedures', N'Uses and maintains materials and equipment properly', 3,1),

(N'Kaushal Bodh & STEM Education', N'Understands the value of vocational skills in work', N'Explains the importance of vocations', 1,2),
(N'Kaushal Bodh & STEM Education', N'Understands the value of vocational skills in work', N'Applies learned vocational skills', 2,2),
(N'Kaushal Bodh & STEM Education', N'Understands the value of vocational skills in work', N'Evaluates products and materials', 3,2),

(N'Kaushal Bodh & STEM Education', N'Develops positive work values and attitudes', N'Demonstrates attention to detail, persistence, creativity, empathy, teamwork, and willingness to work', 1,3),

(N'Kaushal Bodh & STEM Education', N'Applies vocational skills in daily life and home', N'Uses vocational skills effectively at home', 1,4)

-- =============================================
-- SOCIO-EMOTIONAL & ETHICAL LEARNING
-- =============================================

INSERT INTO @tempObservationTable (SubjectName, ObservationSkill, ObservationParameter, SortOrder,SKillSortOrder)
VALUES
(N'Socio-Emotional & Ethical Learning', N'Developing emotional and social understanding', N'Demonstrates empathy towards peers, elders, animals and the environment', 1,1),
(N'Socio-Emotional & Ethical Learning', N'Developing emotional and social understanding', N'Builds positive relationships and collaborates effectively with peers and adults', 2,1),
(N'Socio-Emotional & Ethical Learning', N'Developing emotional and social understanding', N'Shows self-control by recognizing one''s feeling and choosing ways to deal with them', 3,1),
(N'Socio-Emotional & Ethical Learning', N'Developing emotional and social understanding', N'Demonstrate determination by working hard, even when faces challenges or difficulties', 4,1),
(N'Socio-Emotional & Ethical Learning', N'Developing emotional and social understanding', N'Respects people from all cultural, social, religious and ethnic backgrounds demonstrating kindness and inclusion', 5,1),
(N'Socio-Emotional & Ethical Learning', N'Developing emotional and social understanding', N'Makes thoughtful choices by understanding right from wrong in different situations', 6,1),
(N'Socio-Emotional & Ethical Learning', N'Developing emotional and social understanding', N'Shows respect from nation by valuing freedom, justice and fairness in daily actions', 7,1),
(N'Socio-Emotional & Ethical Learning', N'Developing emotional and social understanding', N'Treats everyone with respect and kindness, values differences and speaks/acts in ways that uphold dignity for all', 8,1)

-- =============================================
-- POSITIVE LEARNING HABITS
-- =============================================

INSERT INTO @tempObservationTable (SubjectName, ObservationSkill, ObservationParameter, SortOrder,SKillSortOrder)
VALUES
(N'Positive Learning Habits', N'Builds good learning habits', N'Demonstrate the ability to stay focused and shift attention thoughtfully based on the classroom need', 1,1),
(N'Positive Learning Habits', N'Builds good learning habits', N'Asks questions to explore ideas, deepens understanding and connect learning to real world context', 2,1),
(N'Positive Learning Habits', N'Builds good learning habits', N'Expresses opinions and ideas in a clear, structured and respectful manner', 3,1),
(N'Positive Learning Habits', N'Builds good learning habits', N'Takes feedback constructively, persists through difficulties and learns form mistakes', 4,1),
(N'Positive Learning Habits', N'Builds good learning habits', N'Engages in self-reflection to evaluate one''s work and makes constructive changes to improve outcomes', 5,1),
(N'Positive Learning Habits', N'Builds good learning habits', N'Contributes meaningfully in group work, listens actively and negotiates roles', 6,1),
(N'Positive Learning Habits', N'Builds good learning habits', N'Demonstrate self-discipline by staying focused, following school rules/routines and managing distraction to support learning', 7,1),
(N'Positive Learning Habits', N'Builds good learning habits', N'Applies critical thinking skills to analyze information, evaluate perspective and make thoughtful, evidence-based decision', 8,1)


-- =============================================
-- INSERT INTO ObservationSkills AND ObservationParameters
-- Maps data from @tempObservationTable to permanent tables
-- Rules:
--   1) Standard filter: Standard_Name = '8'
--   2) Maintain Subject -> Standard -> Skill -> Parameter relationship
--   3) Do not modify or delete existing records
--   4) Do not insert duplicate Skill and Parameter records
-- =============================================

-- Get StandardId for Standard 8
DECLARE @StandardId INT

SELECT @StandardId = Standard_Id 
FROM Standard_Master 
WHERE Standard_Name = N'8' 
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



  COMMIT TRANSACTION
  END TRY
  BEGIN CATCH
	PRINT ERROR_MESSAGE()
	ROLLBACK TRANSACTION
  END CATCH