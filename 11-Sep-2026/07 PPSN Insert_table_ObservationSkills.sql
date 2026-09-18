DECLARE @SchoolId INT = 71,
        @AcademicYearId INT = 14,
   
        @InsertedById INT = 1;

BEGIN TRANSACTION;

BEGIN TRY
DECLARE @tempObservationTable TABLE
(
    SubjectName NVARCHAR(200),
    ObservationSkill NVARCHAR(500),
    ObservationParameter NVARCHAR(500),
    SortOrder INT,
	SKillSortOrder Int
)

  /*=========================================================
      ENGLISH
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

    (N'English',
     N'CG 1 Develops oral language skills using complex sentence structures to understand and communicate ideas coherently.',
     N'C1.1 Converses fluently and meaningfully indifferent contexts.',
     1, 1),

    (N'English',
     N'CG 1 Develops oral language skills using complex sentence structures to understand and communicate ideas coherently.',
     N'C1.2 Summarises core ideas from material read out in class.',
     2, 1),

    (N'English',
     N'CG 1 Develops oral language skills using complex sentence structures to understand and communicate ideas coherently.',
     N'C1.3 Makes oral presentations (show and tell, short welcome notes, anchoring of small events, short speeches, class debates).',
     3, 1),

    (N'English',
     N'CG 2 Develops the ability to read with comprehension by gaining a basic understanding of different forms of familiar and unfamiliar texts, such as prose and poetry.',
     N'C2.1 Applies varied comprehension strategies (inferring, predicting, visualizing) to understand different texts.',
     1, 2),

    (N'English',
     N'CG 2 Develops the ability to read with comprehension by gaining a basic understanding of different forms of familiar and unfamiliar texts, such as prose and poetry.',
     N'C2.2 Understands main ideas and draws essential conclusions from the material read.',
     2, 2),

    (N'English',
     N'CG 3 Develops the ability to write simple and compound sentence structures to express their understanding and experiences.',
     N'C3.1 Uses writing strategies, such as sequencing, identifying headings/sub-headings, the beginning, and ending, and forming paragraphs.',
     1, 3),

    (N'English',
     N'CG 3 Develops the ability to write simple and compound sentence structures to express their understanding and experiences.',
     N'C3.2 Writes clear and coherent paragraphs that convey their understanding of a given topic/concept or on a reading of a text.',
     2, 3),

    (N'English',
     N'CG 3 Develops the ability to write simple and compound sentence structures to express their understanding and experiences.',
     N'C3.3 Creates posters, invites, simple poems, stories, and dialogues with appropriate information and purpose.',
     3, 3),

    (N'English',
     N'CG 3 Develops the ability to write simple and compound sentence structures to express their understanding and experiences.',
     N'C3.4 Uses appropriate grammar and structure in their writing.',
     4, 3),

    (N'English',
     N'CG 4 Acquires a more comprehensive range of words in various contexts of home and school experience through different sources.',
     N'C4.1 Discusses meanings of words and develops vocabulary by listening to and reading a variety of texts.',
     1, 4),

    (N'English',
     N'CG 4 Acquires a more comprehensive range of words in various contexts of home and school experience through different sources.',
     N'C4.2 Discusses meanings of words and develops vocabulary by listening to and reading a variety of texts or other content areas.',
     2, 4),

    (N'English',
     N'CG 5 Develops interest and preferences in reading.',
     N'C5.1 Borrows books from the library regularly to read at home.',
     1, 5),

    (N'English',
     N'CG 5 Develops interest and preferences in reading.',
     N'C5.2 Demonstrates interest in reading books from the library.',
     2, 5);


    /*=========================================================
      HINDI
    =========================================================*/

    INSERT INTO @tempObservationTable
    VALUES

    (N'Hindi',
     N'CG 1 Sustains effective communication skills for day-to-day interactions, enhancing their oral ability to express ideas.',
     N'C1.1 Listens to poems, stories, and conversations and locates important ideas in them.',
     1, 1),

    (N'Hindi',
     N'CG 1 Sustains effective communication skills for day-to-day interactions, enhancing their oral ability to express ideas.',
     N'C1.2 Comprehends narrated/read out stories and identifies characters, storyline, and key aspects.',
     2, 1),

    (N'Hindi',
     N'CG 1 Sustains effective communication skills for day-to-day interactions, enhancing their oral ability to express ideas.',
     N'C1.3 Converses meaningfully and coherently.',
     3, 1),

    (N'Hindi',
     N'CG 1 Sustains effective communication skills for day-to-day interactions, enhancing their oral ability to express ideas.',
     N'C1.4 Makes oral presentations and participates in group discussions.',
     4, 1),

    (N'Hindi',
     N'CG 2 Develops fluency in reading and the ability to read with comprehension.',
     N'C2.1 Develops phonological awareness further by blending phonemes/ syllables into words and segmenting words into phonemes/ syllables.',
     1, 2),

    (N'Hindi',
     N'CG 2 Develops fluency in reading and the ability to read with comprehension.',
     N'C2.2 Examines the basic structure of the text and recognizes words and sentences in print and basic punctuation marks.',
     2, 2),

    (N'Hindi',
     N'CG 2 Develops fluency in reading and the ability to read with comprehension.',
     N'C2.3 Reads stories and passages fluently and accurately with appropriate pauses.',
     3, 2),

    (N'Hindi',
     N'CG 2 Develops fluency in reading and the ability to read with comprehension.',
     N'C2.4 Comprehends the meaning of stories, poems, and story posters.',
     4, 2),

    (N'Hindi',
     N'CG 2 Develops fluency in reading and the ability to read with comprehension.',
     N'C2.5 Demonstrates interest in picking up and reading a variety of children’s books.',
     5, 2),

    (N'Hindi',
     N'CG 3 Develops the ability to express understanding, experiences, feelings, and ideas in writing.',
     N'C3.1 Writes a paragraph to express understanding and experiences.',
     1, 3),

    (N'Hindi',
     N'CG 3 Develops the ability to express understanding, experiences, feelings, and ideas in writing.',
     N'C3.2 Creates simple posters, invites, and instructions with appropriate information and purpose.',
     2, 3),

    (N'Hindi',
     N'CG 3 Develops the ability to express understanding, experiences, feelings, and ideas in writing.',
     N'C3.3 Writes stories, poems, and conversations based on imagination and experiences.',
     3, 3),

    (N'Hindi',
     N'CG 4 Develops a wide range of vocabulary in various contexts and through different sources.',
     N'C4.1 Discusses meanings of words and develops vocabulary by listening to and reading a variety of texts or other content areas.',
     1, 4);


    /*=========================================================
      MARATHI
    =========================================================*/

    INSERT INTO @tempObservationTable
    VALUES

    (N'Marathi',
     N'CG 1 Sustains effective communication skills for day-to-day interactions, enhancing their oral ability to express ideas.',
     N'C1.1 Listens to poems, stories, and conversations and locates important ideas in them.',
     1, 1),

    (N'Marathi',
     N'CG 1 Sustains effective communication skills for day-to-day interactions, enhancing their oral ability to express ideas.',
     N'C1.2 Comprehends narrated/read out stories and identifies characters, storyline, and key aspects.',
     2, 1),

    (N'Marathi',
     N'CG 1 Sustains effective communication skills for day-to-day interactions, enhancing their oral ability to express ideas.',
     N'C1.3 Converses meaningfully and coherently.',
     3, 1),

    (N'Marathi',
     N'CG 1 Sustains effective communication skills for day-to-day interactions, enhancing their oral ability to express ideas.',
     N'C1.4 Makes oral presentations and participates in group discussions.',
     4, 1),

    (N'Marathi',
     N'CG 2 Develops fluency in reading and the ability to read with comprehension.',
     N'C2.1 Develops phonological awareness further by blending phonemes/ syllables into words and segmenting words into phonemes/ syllables.',
     1, 2),

    (N'Marathi',
     N'CG 2 Develops fluency in reading and the ability to read with comprehension.',
     N'C2.2 Examines the basic structure of the text and recognizes words and sentences in print and basic punctuation marks.',
     2, 2),

    (N'Marathi',
     N'CG 2 Develops fluency in reading and the ability to read with comprehension.',
     N'C2.3 Reads stories and passages fluently and accurately with appropriate pauses.',
     3, 2),

    (N'Marathi',
     N'CG 2 Develops fluency in reading and the ability to read with comprehension.',
     N'C2.4 Comprehends the meaning of stories, poems, and story posters.',
     4, 2),

    (N'Marathi',
     N'CG 2 Develops fluency in reading and the ability to read with comprehension.',
     N'C2.5 Demonstrates interest in picking up and reading a variety of children’s books.',
     5, 2),

    (N'Marathi',
     N'CG 3 Develops the ability to express understanding, experiences, feelings, and ideas in writing.',
     N'C3.1 Writes a paragraph to express understanding and experiences.',
     1, 3),

    (N'Marathi',
     N'CG 3 Develops the ability to express understanding, experiences, feelings, and ideas in writing.',
     N'C3.2 Creates simple posters, invites, and instructions with appropriate information and purpose.',
     2, 3),

    (N'Marathi',
     N'CG 3 Develops the ability to express understanding, experiences, feelings, and ideas in writing.',
     N'C3.3 Writes stories, poems, and conversations based on imagination and experiences.',
     3, 3),

    (N'Marathi',
     N'CG 4 Develops a wide range of vocabulary in various contexts and through different sources.',
     N'C4.1 Discusses meanings of words and develops vocabulary by listening to and reading a variety of texts or other content areas.',
     1, 4);


    /*=========================================================
      Mathematics Education
    =========================================================*/

    INSERT INTO @tempObservationTable
    VALUES

    (N'Mathematics Education',
     N'CG 1 Understands numbers (counting numbers and fractions), represents whole numbers using the Indian place value system, understands and carries out the four basic operations with whole numbers, and discovers and recognizes patterns in number sequences.',
     N'C1.1 Represents numbers using the place value structure of the Indian number system, compares whole numbers, and knows and can read the names of very large numbers.',
     1, 1),

    (N'Mathematics Education',
     N'CG 1 Understands numbers (counting numbers and fractions), represents whole numbers using the Indian place value system, understands and carries out the four basic operations with whole numbers, and discovers and recognizes patterns in number sequences.',
     N'C1.2 Represents and compares commonly used fractions in daily life (such as ½, ¼, etc.) as parts of unit wholes, as locations on number lines, and as divisions of whole numbers.',
     2, 1),

    (N'Mathematics Education',
     N'CG 1 Understands numbers (counting numbers and fractions), represents whole numbers using the Indian place value system, understands and carries out the four basic operations with whole numbers, and discovers and recognizes patterns in number sequences.',
     N'C1.3 Understands and visualizes arithmetic operations and the relationships among them, knows addition and multiplication tables at least up to 10x10 (pahade) and applies the four basic operations on whole numbers to solve daily life problems.',
     3, 1),

    (N'Mathematics Education',
     N'CG 1 Understands numbers (counting numbers and fractions), represents whole numbers using the Indian place value system, understands and carries out the four basic operations with whole numbers, and discovers and recognizes patterns in number sequences.',
     N'C1.4 Recognizes, describes, and extends simple number patterns such as odd numbers, even numbers, square numbers, cubes, powers of 2, powers of 10, and Virahanka–Fibonacci numbers.',
     4, 1),

    (N'Mathematics Education',
     N'CG 2 Analyses the characteristics and properties of two and three-dimensional geometric shapes, specifies locations and describes spatial relationships, and recognizes and creates shapes that have symmetry.',
     N'C2.1 Identifies, compares, and analyses attributes of two- and three-dimensional shapes and develops vocabulary to describe their attributes/properties.',
     1, 2),

    (N'Mathematics Education',
     N'CG 2 Analyses the characteristics and properties of two and three-dimensional geometric shapes, specifies locations and describes spatial relationships, and recognizes and creates shapes that have symmetry.',
     N'C2.2 Describes location and movement using both common language and mathematical vocabulary; understands the notion of map (najri naksha).',
     2, 2),

    (N'Mathematics Education',
     N'CG 2 Analyses the characteristics and properties of two and three-dimensional geometric shapes, specifies locations and describes spatial relationships, and recognizes and creates shapes that have symmetry.',
     N'C2.3 Recognizes and creates symmetry (reflection, rotation) in familiar 2D and 3D shapes.',
     3, 2),

    (N'Mathematics Education',
     N'CG 2 Analyses the characteristics and properties of two and three-dimensional geometric shapes, specifies locations and describes spatial relationships, and recognizes and creates shapes that have symmetry.',
     N'C2.4 Discovers, recognizes, describes, and extends patterns in 2D and 3D shapes.',
     4, 2),

    (N'Mathematics Education',
     N'CG 3 Understands measurable attributes of objects and the units, systems, and processes of such measurement, including those related to distance, length, weight, area, volume, and time using non standard and standard units.',
     N'C3.1 Measures in non-standard and standard units and evaluates the need for standard units.',
     1, 3),

    (N'Mathematics Education',
     N'CG 3 Understands measurable attributes of objects and the units, systems, and processes of such measurement, including those related to distance, length, weight, area, volume, and time using non standard and standard units.',
     N'C3.2 Uses an appropriate unit and tool for the attribute (like length, perimeter, time, weight, volume) being measured.',
     2, 3),

    (N'Mathematics Education',
     N'CG 3 Understands measurable attributes of objects and the units, systems, and processes of such measurement, including those related to distance, length, weight, area, volume, and time using non standard and standard units.',
     N'C3.3 Carries out simple unit conversions, such as from centimeters to meters, within a system of measurement.',
     3, 3),

    (N'Mathematics Education',
     N'CG 3 Understands measurable attributes of objects and the units, systems, and processes of such measurement, including those related to distance, length, weight, area, volume, and time using non standard and standard units.',
     N'C3.4 Understands the definition and formula for the area of a square or rectangle as length times breadth.',
     4, 3),

    (N'Mathematics Education',
     N'CG 3 Understands measurable attributes of objects and the units, systems, and processes of such measurement, including those related to distance, length, weight, area, volume, and time using non standard and standard units.',
     N'C3.5 Devises strategies for estimating the distance, length, time, perimeter (for regular and irregular shapes), area (for regular and irregular shapes), weight and volume and verifies the same using standard units.',
     5, 3),

    (N'Mathematics Education',
     N'CG 3 Understands measurable attributes of objects and the units, systems, and processes of such measurement, including those related to distance, length, weight, area, volume, and time using non standard and standard units.',
     N'C3.6 Deduces that shapes having equal areas can have different perimeters and shapes having equal perimeters can have different areas.',
     6, 3),

    (N'Mathematics Education',
     N'CG 3 Understands measurable attributes of objects and the units, systems, and processes of such measurement, including those related to distance, length, weight, area, volume, and time using non standard and standard units.',
     N'C3.7 Evaluates the conservation of attributes like length and volume and solves daily-life problems related to them.',
     7, 3),

    (N'Mathematics Education',
     N'CG 4 Develops problem-solving skills with procedural fluency to solve mathematical puzzles as well as daily-life problems, and as a step towards developing computational thinking.',
     N'C4.1 Solves puzzles and daily-life problems involving one or more operations on whole numbers (including word puzzles and puzzles from recreational areas, such as the construction of magic squares).',
     1, 4),

    (N'Mathematics Education',
     N'CG 4 Develops problem-solving skills with procedural fluency to solve mathematical puzzles as well as daily-life problems, and as a step towards developing computational thinking.',
     N'C4.2 Learns to systematically count and list all possible permutations or combination given a constraint, in simple situations (e.g., how to make a committee of two people from a group of five people).',
     2, 4),

    (N'Mathematics Education',
     N'CG 4 Develops problem-solving skills with procedural fluency to solve mathematical puzzles as well as daily-life problems, and as a step towards developing computational thinking.',
     N'C4.3 Selects appropriate methods and tools for computing with whole numbers, such as mental computation, estimation, or paper pencil calculation, in accordance with the context.',
     3, 4),

    (N'Mathematics Education',
     N'CG 5 Knows and appreciates the development in India of the decimal place value system that is used around the world today.',
     N'C5.1 Understands the development of zero in India and the Indian place value system for writing numerals, the history of its transmission to the world, and its modern impact on our lives and in all technology.',
     1, 5);


    /*=========================================================
      THE WORLD AROUND US
    =========================================================*/

    INSERT INTO @tempObservationTable
    VALUES

    (N'The World Around Us',
     N'CG 1 Explores and engages with the natural and socio-cultural environment in their surroundings.',
     N'C1.1 Observes and identifies the natural (insects, plants, birds, animals, geographical features, sun and moon, stars, planets, natural resources) and social (houses, relationships) components in their immediate environment.',
     1, 1),

    (N'The World Around Us',
     N'CG 1 Explores and engages with the natural and socio-cultural environment in their surroundings.',
     N'C1.2 Describes relationships (including between humans and animals/ nature) and traditions (art forms, celebrations, festivals) in the family and community.',
     2, 1),

    (N'The World Around Us',
     N'CG 1 Explores and engages with the natural and socio-cultural environment in their surroundings.',
     N'C1.3 Asks questions and makes predictions about simple patterns (season change, food chain, phases of the moon, movement of stars and planets, shapes of trees, plants, leaves, and flowers, rituals, celebrations) observed in the immediate environment.',
     3, 1),

    (N'The World Around Us',
     N'CG 1 Explores and engages with the natural and socio-cultural environment in their surroundings.',
     N'C1.4 Explains the functioning of local institutions (family, school, bank/post office, market, and panchayat) in different forms (story, drawing, tabulating data, reports), and analyses their roles.',
     4, 1),

    (N'The World Around Us',
     N'CG 1 Explores and engages with the natural and socio-cultural environment in their surroundings.',
     N'C1.5 Uses local materials to create simple objects (family tree, envelopes, and origami animals) on their own for display or use in classroom processes.',
     5, 1),

    (N'The World Around Us',
     N'CG 2 Understands the interdependence in their environment through observation and experiences, developing the basis for appreciation of the idea of Vasudhaiva Kutumbakam.',
     N'C2.1 Identifies natural and human made systems that support their lives (water supply, water cycle, river flow systems, seasons, life cycle of plants and animals, food, household items, transport, communication, electricity in the home).',
     1, 2),

    (N'The World Around Us',
     N'CG 2 Understands the interdependence in their environment through observation and experiences, developing the basis for appreciation of the idea of Vasudhaiva Kutumbakam.',
     N'C2.2 Describes the relationship between the natural environment and cultural practices in immediate environment (nature of work, food, festivals, and traditions).',
     2, 2),

    (N'The World Around Us',
     N'CG 2 Understands the interdependence in their environment through observation and experiences, developing the basis for appreciation of the idea of Vasudhaiva Kutumbakam.',
     N'C2.3 Connects changes in the environment and the lives of family and community, as communicated by elders and through local stories (changes in occupation, food habits, resources, celebrations, communication).',
     3, 2),

    (N'The World Around Us',
     N'CG 3 Explains how to ensure the safety of self and others in different (normal as well as emergency) situations.',
     N'C3.1 Describes the basic safety needs and protection (health and hygiene, food, water, shelter, precautions, awareness of emergency situations, abuse, and unsafe situations) of humans, birds, and animals.',
     1, 3),

    (N'The World Around Us',
     N'CG 3 Explains how to ensure the safety of self and others in different (normal as well as emergency) situations.',
     N'C3.2 Discusses how to prepare for emergency situations (smoke, fire, small injuries, burns, electrical safety, unseasonal rains, and fallen trees) based on discussions with family and community, or personal experiences.',
     2, 3),

    (N'The World Around Us',
     N'CG 3 Explains how to ensure the safety of self and others in different (normal as well as emergency) situations.',
     N'C3.3 Develops simple labels and slogans, and participates in role-play on safety and protection in the local environment to be displayed/done in school and locality.',
     3, 3),

    (N'The World Around Us',
     N'CG 4 Develops sensitivity towards social and natural environment.',
     N'C4.1 Observes and describes diversity among plants, birds and animals in immediate environment (shape, sounds, food habits, growth, habitat).',
     1, 4),

    (N'The World Around Us',
     N'CG 4 Develops sensitivity towards social and natural environment.',
     N'C4.2 Observes and describes cultural diversity in their immediate environment (food, clothing, games, different seasons, festivals related to harvest and sowing).',
     2, 4),

    (N'The World Around Us',
     N'CG 4 Develops sensitivity towards social and natural environment.',
     N'C4.3 Describes usage of natural resources in their immediate environment.',
     3, 4),

    (N'The World Around Us',
     N'CG 4 Develops sensitivity towards social and natural environment.',
     N'C4.4 Demonstrates how natural resources can be shared, maintained, and conserved (trees, use of rainwater, benefits of millets).',
     4, 4),

    (N'The World Around Us',
     N'CG 4 Develops sensitivity towards social and natural environment.',
     N'C4.5 Identifies needs of plants, birds, and animals, and how they can be supported (water, soil, food, care).',
     5, 4),

    (N'The World Around Us',
     N'CG 4 Develops sensitivity towards social and natural environment.',
     N'C4.6 Identifies the needs of people in different situations – in terms of access to resources, equal opportunities, work distribution, and shelter.',
     6, 4),

    (N'The World Around Us',
     N'CG 4 Develops sensitivity towards social and natural environment.',
     N'C4.7 Learns about basic social and behavioural norms, values, and dispositions that benefit our social and natural environments and that help our society function smoothly (using dustbins, standing in queues, conserving water, using public transportation, keeping one’s environment clean, always helping others in need regardless of background).',
     7, 4),

    (N'The World Around Us',
     N'CG 5 Develops the ability to read and interpret simple maps.',
     N'C5.1 Explains a line drawing of their school, village, and ward.',
     1, 5),

    (N'The World Around Us',
     N'CG 5 Develops the ability to read and interpret simple maps.',
     N'C5.2 Draws a sketch of their school, village, and ward using symbols and directions.',
     2, 5),

    (N'The World Around Us',
     N'CG 5 Develops the ability to read and interpret simple maps.',
     N'C5.3 Reads simple maps of city, state, and country to identify natural and human made features (well, lake, post office, school, hospital) with reference to symbols and directions.',
     3, 5),

    /*
      NOTE:
      The source document shows CG 6 but starts directly with C6.2.
      C6.1 is not present in the supplied document, so it is NOT invented here.
    */

    (N'The World Around Us',
     N'CG 6 Uses data and information from various sources to investigate questions related to their immediate environment.',
     N'C6.1 Performs simple inquiry related to specific questions independently or in groups.',
     1, 6),

    (N'The World Around Us',
     N'CG 6 Uses data and information from various sources to investigate questions related to their immediate environment.',
     N'C6.2 Presents observations and findings through different creative modes (drawing, diagram, poem, play, skit, oral and written expression).',
     2, 6),

    (N'The World Around Us',
     N'CG 7 Gains foundational familiarity with basic concepts and methods from the natural sciences (life sciences, physical sciences, and earth and space.',
     N'C7.1 Gains familiarity with using the scientific method in investigations, as well as familiarity with other crosscutting concepts such as energy, matter, and systems that apply across the domains of science and engineering.',
     1, 7),

    (N'The World Around Us',
     N'CG 7 Gains foundational familiarity with basic concepts and methods from the natural sciences (life sciences, physical sciences, and earth and space.',
     N'C7.2 Gains familiarity with disciplinary core ideas in the natural sciences, as well as in engineering, technology, and applications of science, which reflect the content that will be learned across subject areas in later Grades.',
     2, 7);


    /*=========================================================
      ART EDUCATION
    =========================================================*/

    INSERT INTO @tempObservationTable
    VALUES

    (N'Art Education',
     N'CG 1 Develops an enjoyment of the Arts and exercises their creativity and imagination in Visual and Performing Arts activities.',
     N'C1.1 Creates and presents a variety of artwork to communicate their ideas and emotions in any of the Visual and Performing Art forms (emphasis on variety in Music, painting, drawing, crafts, Drama, Dance and Movement, and local Art forms).',
     1, 1),

    (N'Art Education',
     N'CG 1 Develops an enjoyment of the Arts and exercises their creativity and imagination in Visual and Performing Arts activities.',
     N'C1.2 Describes the varied materials, tools, and processes used in the Visual and Performing Arts and demonstrates familiarity with some of these in their own artwork [e.g., identifies and names some musical instruments and demonstrates simple beats on a dholak, khanjira, bells, utensils, or one’s own body (clapping, tapping, making different sounds using mouth and voice)].',
     2, 1),

    (N'Art Education',
     N'CG 1 Develops an enjoyment of the Arts and exercises their creativity and imagination in Visual and Performing Arts activities.',
     N'C1.3 Creates artworks collaboratively and shares own thoughts and feelings while responding to arts and culture in their surroundings.',
     3, 1);


    /*=========================================================
      PHYSICAL EDUCATION AND WELL-BEING
    =========================================================*/

    INSERT INTO @tempObservationTable
    VALUES

    (N'Physical Education and Well-being',
     N'CG 1 Demonstrates the use of basic skills (running, jumping, catching, throwing, hitting, and kicking) to participate in different physical activities, games and sports.',
     N'C1.1 Practices a combination of movement, motor skills, and manipulative skills (catching, throwing, kicking, and hitting a ball towards a target while moving, focusing on visual cues to hit the target).',
     1, 1),

    (N'Physical Education and Well-being',
     N'CG 1 Demonstrates the use of basic skills (running, jumping, catching, throwing, hitting, and kicking) to participate in different physical activities, games and sports.',
     N'C1.2 Moves purposefully their body to a beat/rhythm/music.',
     2, 1),

    (N'Physical Education and Well-being',
     N'CG 1 Demonstrates the use of basic skills (running, jumping, catching, throwing, hitting, and kicking) to participate in different physical activities, games and sports.',
     N'C1.3 Demonstrates coordination abilities with a partner and objects (e.g., being able to move in coordination with a partner in three-legged race, hand-eye coordination while bowling, throwing).',
     3, 1),

    (N'Physical Education and Well-being',
     N'CG 1 Demonstrates the use of basic skills (running, jumping, catching, throwing, hitting, and kicking) to participate in different physical activities, games and sports.',
     N'C1.4 Demonstrates basic warm-up exercises and stretching to develop strength and flexibility in the body.',
     4, 1),

    (N'Physical Education and Well-being',
     N'CG 2 Develops an awareness of personal and social behavior towards themselves and others.',
     N'C2.1 Demonstrates the ability to play games and activities which require and emphasize teamwork, cooperation, personal responsibility, and communication of ideas.',
     1, 2),

    (N'Physical Education and Well-being',
     N'CG 2 Develops an awareness of personal and social behavior towards themselves and others.',
     N'C2.2 Creates group norms and rules of the game/activity before playing and reviews these regularly.',
     2, 2),

    (N'Physical Education and Well-being',
     N'CG 2 Develops an awareness of personal and social behavior towards themselves and others.',
     N'C2.3 Exhibits sensitivity to injuries of others and acts empathetically when the other player is physically injured, emotionally stressed, and feeling unwell.',
     3, 2),

    (N'Physical Education and Well-being',
     N'CG 2 Develops an awareness of personal and social behavior towards themselves and others.',
     N'C2.4 Practices care and responsibility towards the physical activity material, playground, and facilities.',
     4, 2),

    (N'Physical Education and Well-being',
     N'CG 2 Develops an awareness of personal and social behavior towards themselves and others.',
     N'C2.5 Identifies characteristics of safe/unsafe touch in the context of physical activity and describes ways of reporting them.',
     5, 2),

    (N'Physical Education and Well-being',
     N'CG 3 Demonstrates mental engagement in physical activity / game situations.',
     N'C3.1 Explains the concept of some games, their rules, playing positions, and basic moves.',
     1, 3),

    (N'Physical Education and Well-being',
     N'CG 3 Demonstrates mental engagement in physical activity / game situations.',
     N'C3.2 Expresses their emotions and thinking process during the game.',
     2, 3),

    (N'Physical Education and Well-being',
     N'CG 4 Develops an understanding of the need to develop themselves and self-assess their progress.',
     N'C4.1 Sets simple personal goals/targets and records progress (e.g., throwing a ball at 25 m, then 30 m, then 40 m; Jumping 1, 2, 3 feet high/long).',
     1, 4);


	 -- =========================================================
-- POSITIVE LEARNING HABITS
-- =========================================================

INSERT INTO @tempObservationTable
(
    SubjectName,
    ObservationSkill,
    ObservationParameter,
    SortOrder,
    SkillSortOrder
)
VALUES

-- SOCIO-EMOTIONAL, ETHICAL LEARNING & POSITIVE LEARNING HABITS

(N'Positive Learning Habits',
 N'SOCIO-EMOTIONAL, ETHICAL LEARNING & POSITIVE LEARNING HABITS',
 N'Has emotional regulation and responds appropriately to various situations.', 1, 1),

(N'Positive Learning Habits',
 N'SOCIO-EMOTIONAL, ETHICAL LEARNING & POSITIVE LEARNING HABITS',
 N'Displays empathy for living beings and the environment.', 2, 1),

(N'Positive Learning Habits',
 N'SOCIO-EMOTIONAL, ETHICAL LEARNING & POSITIVE LEARNING HABITS',
 N'Asks interesting and relevant questions.', 3, 1),

(N'Positive Learning Habits',
 N'SOCIO-EMOTIONAL, ETHICAL LEARNING & POSITIVE LEARNING HABITS',
 N'Has resilience and displays grit.', 4, 1),

(N'Positive Learning Habits',
 N'SOCIO-EMOTIONAL, ETHICAL LEARNING & POSITIVE LEARNING HABITS',
 N'Has a growth mindset and seeks help actively.', 5, 1),

(N'Positive Learning Habits',
 N'SOCIO-EMOTIONAL, ETHICAL LEARNING & POSITIVE LEARNING HABITS',
 N'Reflects on work done and takes suitable action.', 6, 1),

(N'Positive Learning Habits',
 N'SOCIO-EMOTIONAL, ETHICAL LEARNING & POSITIVE LEARNING HABITS',
 N'Follows classroom norms.', 7, 1),

(N'Positive Learning Habits',
 N'SOCIO-EMOTIONAL, ETHICAL LEARNING & POSITIVE LEARNING HABITS',
 N'Has self-control that enables learning in structured settings.', 8, 1)

-- =========================================================
-- FEEDBACK
-- =========================================================

-- Self Assessment

INSERT INTO @tempObservationTable
(
    SubjectName,
    ObservationSkill,
    ObservationParameter,
    SortOrder,
    SkillSortOrder
)
VALUES


(N'Self Assessment',
 N'Self Assessment',
 N'I can talk about how I feel (happy, confident, upset or angry).', 1, 1),

(N'Self Assessment',
 N'Self Assessment',
 N'In a difficult situation, I am able to stay calm.', 2, 1),

(N'Self Assessment',
 N'Self Assessment',
 N'I understand how my friends feel.', 3, 1),

(N'Self Assessment',
 N'Self Assessment',
 N'I respect other people''s views / ideas.', 4, 1),

(N'Self Assessment',
 N'Self Assessment',
 N'When someone is sad, I can make them feel better.', 5, 1),

(N'Self Assessment',
 N'Self Assessment',
 N'I feel curious, happy, safe, confident and/or excited at school.', 6, 1),

(N'Self Assessment',
 N'Self Assessment',
 N'I follow my teacher''s directions.', 7, 1),

(N'Self Assessment',
 N'Self Assessment',
 N'I ask for help if I do not understand.', 8, 1)


-- Peer Feedback
INSERT INTO @tempObservationTable
(
    SubjectName,
    ObservationSkill,
    ObservationParameter,
    SortOrder,
    SkillSortOrder
)
VALUES

(N'Peer Assessment',
 N'Peer Feedback',
 N'My friend can talk about how he/she feels.', 1,	1),

(N'Peer Assessment',
 N'Peer Feedback',
 N'My friend can calm himself/herself during difficult situations.', 2, 1),

(N'Peer Assessment',
 N'Peer Feedback',
 N'My friend can understand how his/her friends feel.', 3, 1),

(N'Peer Assessment',
 N'Peer Feedback',
 N'My friend respects other people''s views / ideas.', 4, 1),

(N'Peer Assessment',
 N'Peer Feedback',
 N'My friend can help others make up after a fight.', 5, 1),

(N'Peer Assessment',
 N'Peer Feedback',
 N'When someone is sad, my friend can make him/her feel better.', 6, 1),

(N'Peer Assessment',
 N'Peer Feedback',
 N'My friend works cooperatively with others.', 7, 1),

(N'Peer Assessment',
 N'Peer Feedback',
 N'My friend participates positively in classroom activities.', 8, 1)


-- PARENTS' FEEDBACK

INSERT INTO @tempObservationTable
(
    SubjectName,
    ObservationSkill,
    ObservationParameter,
    SortOrder,
    SkillSortOrder
)
VALUES


(N'Parent Feedback',
 N'Parent Feedback',
 N'My child participates in academic and other school activities.', 1, 1),

(N'Parent Feedback',
 N'Parent Feedback',
 N'My child is making good progress as per the grade.', 2, 1),

(N'Parent Feedback',
 N'Parent Feedback',
 N'My child can talk about how he/she feels.', 3, 1),

(N'Parent Feedback',
 N'Parent Feedback',
 N'My child can calm himself/herself during difficult situations.', 4, 1),

(N'Parent Feedback',
 N'Parent Feedback',
 N'My child can understand how his/her friends feel.', 5, 1),

(N'Parent Feedback',
 N'Parent Feedback',
 N'My child respects other people''s views / ideas.', 6, 1),

(N'Parent Feedback',
 N'Parent Feedback',
 N'My child can help friends make up after a fight.', 7, 1),

(N'Parent Feedback',
 N'Parent Feedback',
 N'When someone is sad, my child can make him/her feel better.', 8, 1)

 INSERT INTO @tempObservationTable
(
    SubjectName,
    ObservationSkill,
    ObservationParameter,
    SortOrder,
    SkillSortOrder
)
VALUES


 (N'All About Me', N'All About Me', N'I love to eat.', 1, 1),
(N'All About Me', N'All About Me', N'My favourite colour is.', 2, 1),
(N'All About Me', N'All About Me', N'My favourite sport/game is.', 3, 1),
(N'All About Me', N'All About Me', N'My favourite subject is.', 4, 1)



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


 COMMIT TRANSACTION
  END TRY
  BEGIN CATCH
	PRINT ERROR_MESSAGE()
	ROLLBACK TRANSACTION
  END CATCH