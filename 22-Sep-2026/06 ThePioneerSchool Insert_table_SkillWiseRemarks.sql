Declare @SchoolId int
Select @SchoolId=SchoolId from SchoolSettings 

Declare @SkillWiseRemarks XML=
'<Remarks>
  <Remarks>
    <Remarks>Has not understood the concept of tables. Makes mistakes</Remarks>
    <Name>ASPECTS </Name>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>Computers</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Neat and systematic work.</Remarks>
    <Name>ASPECTS </Name>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>Computers</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Takes immense delight in working with mathematical problems mentally.</Remarks>
    <Name>ASPECTS </Name>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>Computers</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Takes keen interest in various activities</Remarks>
    <Name>ASPECTS </Name>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>Computers</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Takes some time to understand new concepts.</Remarks>
    <Name>ASPECTS </Name>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>Computers</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can comprehend oral questions, instructions and stories/poems.</Remarks>
    <Name>LISTENING SKILLS</Name>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Has difficulty in following instruction and stories. Needs simplification or translation most of the time.</Remarks>
    <Name>LISTENING SKILLS</Name>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Has some difficulty in comprehending instructions, stories or poems. Needs guidance quite often.</Remarks>
    <Name>LISTENING SKILLS</Name>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can read and pronounce new words on ones own most of the time.</Remarks>
    <Name>READING SKILLS</Name>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can read and understand a story or sentences and answer most of the questions correctly.</Remarks>
    <Name>READING SKILLS</Name>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can read simple sentences but takes time to read each word. Lacks fluency, speed and expression.</Remarks>
    <Name>READING SKILLS</Name>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can read simple sentences fluently with proper speed, pronunciation and expression.</Remarks>
    <Name>READING SKILLS</Name>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Cannot comprehend passages on ones own. Often needs help.</Remarks>
    <Name>READING SKILLS</Name>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can recite a poem with proper speed and expression but makes occasional mistakes in pronunciation or forgets a word or so.</Remarks>
    <Name>SPEAKING SKILLS</Name>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can recite a poem with proper speed, expression and pronunciation.</Remarks>
    <Name>SPEAKING SKILLS</Name>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can speak simple sentences but takes time to read each word. Lacks fluency, speed and expression.</Remarks>
    <Name>SPEAKING SKILLS</Name>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Carry out a dialogue only at a very basic level.</Remarks>
    <Name>SPEAKING SKILLS</Name>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Is fluent and spontaneous most of the time. Responds to the situation appropriately but fumbles for words occasionally.</Remarks>
    <Name>SPEAKING SKILLS</Name>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can read and pronounce new words on ones own most of the time.</Remarks>
    <Name>WRITING SKILLS</Name>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can read and understand a story or sentences and answer most of the questions correctly.</Remarks>
    <Name>WRITING SKILLS</Name>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can write a few sentences on a given topic but with a lot of prompting and guidance.</Remarks>
    <Name>WRITING SKILLS</Name>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can write sentences accurately and uses simple punctuation marks appropriately.</Remarks>
    <Name>WRITING SKILLS</Name>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can write sentences with a few errors.</Remarks>
    <Name>WRITING SKILLS</Name>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can ask simple questions but with prompting.</Remarks>
    <Name>ASPECTS </Name>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>EVS</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can do cutting, pasting, drawing and collage work and shows creativity and originality at times.</Remarks>
    <Name>ASPECTS </Name>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>EVS</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Is keen, alert and observant, very much aware of the surroundings.</Remarks>
    <Name>ASPECTS </Name>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>EVS</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Needs to be aware of the surroundings.</Remarks>
    <Name>ASPECTS </Name>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>EVS</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Work is always neat and presentable.</Remarks>
    <Name>ASPECTS </Name>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>EVS</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can comprehend oral questions, instructions and stories/poems.</Remarks>
    <Name>LISTENING SKILLS</Name>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Has difficulty in following instruction and stories. Needs simplification or translation most of the time.</Remarks>
    <Name>LISTENING SKILLS</Name>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Has some difficulty in comprehending instructions, stories or poems. Needs guidance quite often.</Remarks>
    <Name>LISTENING SKILLS</Name>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can read and pronounce new words on ones own most of the time.</Remarks>
    <Name>READING SKILLS</Name>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can read and understand a story or sentences and answer most of the questions correctly.</Remarks>
    <Name>READING SKILLS</Name>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can read simple sentences but takes time to read each word. Lacks fluency, speed and expression.</Remarks>
    <Name>READING SKILLS</Name>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can read simple sentences fluently with proper speed, pronunciation and expression.</Remarks>
    <Name>READING SKILLS</Name>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Cannot comprehend passages on ones own. Often needs help.</Remarks>
    <Name>READING SKILLS</Name>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Student does not follow even on guidance.</Remarks>
    <Name>REGULARITY IN ASSIGNMENTS</Name>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Takes immense delight in working with mathematical problems mentally.</Remarks>
    <Name>ASPECTS </Name>
    <Standard_Name>Senior KG</Standard_Name>
    <Subject_Name>Mathematics</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Takes keen interest in various activities</Remarks>
    <Name>ASPECTS </Name>
    <Standard_Name>Senior KG</Standard_Name>
    <Subject_Name>Mathematics</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Takes some time to understand new concepts.</Remarks>
    <Name>ASPECTS </Name>
    <Standard_Name>Senior KG</Standard_Name>
    <Subject_Name>Mathematics</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Student meets few of the expectations on guidance only.</Remarks>
    <Name>REGULARITY IN ASSIGNMENTS</Name>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Student meets most of the expectations independently.</Remarks>
    <Name>REGULARITY IN ASSIGNMENTS</Name>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Student meets most of the expectations on guidance only.</Remarks>
    <Name>REGULARITY IN ASSIGNMENTS</Name>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Student meets some of the expectations occasionally.</Remarks>
    <Name>REGULARITY IN ASSIGNMENTS</Name>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can recite a poem with proper speed and expression but makes occasional mistakes in pronunciation or forgets a word or so.</Remarks>
    <Name>SPEAKING SKILLS</Name>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can recite a poem with proper speed, expression and pronunciation.</Remarks>
    <Name>SPEAKING SKILLS</Name>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can speak simple sentences but takes time to read each word. Lacks fluency, speed and expression.</Remarks>
    <Name>SPEAKING SKILLS</Name>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Carry out a dialogue only at a very basic level.</Remarks>
    <Name>SPEAKING SKILLS</Name>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Is fluent and spontaneous most of the time. Responds to the situation appropriately but fumbles for words occasionally.</Remarks>
    <Name>SPEAKING SKILLS</Name>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can read and pronounce new words on ones own most of the time.</Remarks>
    <Name>WRITING SKILLS</Name>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can read and understand a story or sentences and answer most of the questions correctly.</Remarks>
    <Name>WRITING SKILLS</Name>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can write a few sentences on a given topic but with a lot of prompting and guidance.</Remarks>
    <Name>WRITING SKILLS</Name>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can write sentences accurately and uses simple punctuation marks appropriately.</Remarks>
    <Name>WRITING SKILLS</Name>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can write sentences with a few errors.</Remarks>
    <Name>WRITING SKILLS</Name>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can comprehend oral questions, instructions and stories/poems.</Remarks>
    <Name>LISTENING SKILLS</Name>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>Marathi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Has difficulty in following instruction and stories. Needs simplification or translation most of the time.</Remarks>
    <Name>LISTENING SKILLS</Name>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>Marathi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Has some difficulty in comprehending instructions, stories or poems. Needs guidance quite often.</Remarks>
    <Name>LISTENING SKILLS</Name>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>Marathi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can read and pronounce new words on ones own most of the time.</Remarks>
    <Name>READING SKILLS</Name>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>Marathi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can read and understand a story or sentences and answer most of the questions correctly.</Remarks>
    <Name>READING SKILLS</Name>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>Marathi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can read simple sentences but takes time to read each word. Lacks fluency, speed and expression.</Remarks>
    <Name>READING SKILLS</Name>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>Marathi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can read simple sentences fluently with proper speed, pronunciation and expression.</Remarks>
    <Name>READING SKILLS</Name>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>Marathi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Cannot comprehend passages on ones own. Often needs help.</Remarks>
    <Name>READING SKILLS</Name>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>Marathi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Student does not follow even on guidance.</Remarks>
    <Name>REGULARITY IN ASSIGNMENTS</Name>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>Marathi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Student meets few of the expectations on guidance only.</Remarks>
    <Name>REGULARITY IN ASSIGNMENTS</Name>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>Marathi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Student meets most of the expectations independently.</Remarks>
    <Name>REGULARITY IN ASSIGNMENTS</Name>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>Marathi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Student meets most of the expectations on guidance only.</Remarks>
    <Name>REGULARITY IN ASSIGNMENTS</Name>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>Marathi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Student meets some of the expectations occasionally.</Remarks>
    <Name>REGULARITY IN ASSIGNMENTS</Name>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>Marathi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can recite a poem with proper speed and expression but makes occasional mistakes in pronunciation or forgets a word or so.</Remarks>
    <Name>SPEAKING SKILLS</Name>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>Marathi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can recite a poem with proper speed, expression and pronunciation.</Remarks>
    <Name>SPEAKING SKILLS</Name>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>Marathi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can speak simple sentences but takes time to read each word. Lacks fluency, speed and expression.</Remarks>
    <Name>SPEAKING SKILLS</Name>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>Marathi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Carry out a dialogue only at a very basic level.</Remarks>
    <Name>SPEAKING SKILLS</Name>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>Marathi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Is fluent and spontaneous most of the time. Responds to the situation appropriately but fumbles for words occasionally.</Remarks>
    <Name>SPEAKING SKILLS</Name>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>Marathi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can read and pronounce new words on ones own most of the time.</Remarks>
    <Name>WRITING SKILLS</Name>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>Marathi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can read and understand a story or sentences and answer most of the questions correctly.</Remarks>
    <Name>WRITING SKILLS</Name>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>Marathi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can write a few sentences on a given topic but with a lot of prompting and guidance.</Remarks>
    <Name>WRITING SKILLS</Name>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>Marathi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can write sentences accurately and uses simple punctuation marks appropriately.</Remarks>
    <Name>WRITING SKILLS</Name>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>Marathi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can write sentences with a few errors.</Remarks>
    <Name>WRITING SKILLS</Name>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>Marathi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Has not understood the concept of tables. Makes mistakes</Remarks>
    <Name>ASPECTS </Name>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>Mathematics</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Neat and systematic work.</Remarks>
    <Name>ASPECTS </Name>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>Mathematics</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Takes immense delight in working with mathematical problems mentally.</Remarks>
    <Name>ASPECTS </Name>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>Mathematics</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Takes keen interest in various activities</Remarks>
    <Name>ASPECTS </Name>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>Mathematics</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Takes some time to understand new concepts.</Remarks>
    <Name>ASPECTS </Name>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>Mathematics</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Has not understood the concept of tables. Makes mistakes</Remarks>
    <Name>ASPECTS </Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Computers</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Neat and systematic work.</Remarks>
    <Name>ASPECTS </Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Computers</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Takes immense delight in working with mathematical problems mentally.</Remarks>
    <Name>ASPECTS </Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Computers</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Takes keen interest in various activities</Remarks>
    <Name>ASPECTS </Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Computers</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Takes some time to understand new concepts.</Remarks>
    <Name>ASPECTS </Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Computers</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can comprehend oral questions, instructions and stories/poems.</Remarks>
    <Name>LISTENING SKILLS</Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Has difficulty in following instruction and stories. Needs simplification or translation most of the time.</Remarks>
    <Name>LISTENING SKILLS</Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Has some difficulty in comprehending instructions, stories or poems. Needs guidance quite often.</Remarks>
    <Name>LISTENING SKILLS</Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can read and pronounce new words on ones own most of the time.</Remarks>
    <Name>READING SKILLS</Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can read and understand a story or sentences and answer most of the questions correctly.</Remarks>
    <Name>READING SKILLS</Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can read simple sentences but takes time to read each word. Lacks fluency, speed and expression.</Remarks>
    <Name>READING SKILLS</Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can read simple sentences fluently with proper speed, pronunciation and expression.</Remarks>
    <Name>READING SKILLS</Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Cannot comprehend passages on ones own. Often needs help.</Remarks>
    <Name>READING SKILLS</Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can recite a poem with proper speed and expression but makes occasional mistakes in pronunciation or forgets a word or so.</Remarks>
    <Name>SPEAKING SKILLS</Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can recite a poem with proper speed, expression and pronunciation.</Remarks>
    <Name>SPEAKING SKILLS</Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can speak simple sentences but takes time to read each word. Lacks fluency, speed and expression.</Remarks>
    <Name>SPEAKING SKILLS</Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Carry out a dialogue only at a very basic level.</Remarks>
    <Name>SPEAKING SKILLS</Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Is fluent and spontaneous most of the time. Responds to the situation appropriately but fumbles for words occasionally.</Remarks>
    <Name>SPEAKING SKILLS</Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can read and pronounce new words on ones own most of the time.</Remarks>
    <Name>WRITING SKILLS</Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can read and understand a story or sentences and answer most of the questions correctly.</Remarks>
    <Name>WRITING SKILLS</Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can write a few sentences on a given topic but with a lot of prompting and guidance.</Remarks>
    <Name>WRITING SKILLS</Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can write sentences accurately and uses simple punctuation marks appropriately.</Remarks>
    <Name>WRITING SKILLS</Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can write sentences with a few errors.</Remarks>
    <Name>WRITING SKILLS</Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can ask simple questions but with prompting.</Remarks>
    <Name>ASPECTS </Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>EVS</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can do cutting, pasting, drawing and collage work and shows creativity and originality at times.</Remarks>
    <Name>ASPECTS </Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>EVS</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Is keen, alert and observant, very much aware of the surroundings.</Remarks>
    <Name>ASPECTS </Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>EVS</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Needs to be aware of the surroundings.</Remarks>
    <Name>ASPECTS </Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>EVS</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Work is always neat and presentable.</Remarks>
    <Name>ASPECTS </Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>EVS</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can comprehend oral questions, instructions and stories/poems.</Remarks>
    <Name>LISTENING SKILLS</Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Marathi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can comprehend oral questions, instructions and stories/poems.</Remarks>
    <Name>LISTENING SKILLS</Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Has difficulty in following instruction and stories. Needs simplification or translation most of the time.</Remarks>
    <Name>LISTENING SKILLS</Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Marathi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Has difficulty in following instruction and stories. Needs simplification or translation most of the time.</Remarks>
    <Name>LISTENING SKILLS</Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Has some difficulty in comprehending instructions, stories or poems. Needs guidance quite often.</Remarks>
    <Name>LISTENING SKILLS</Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Marathi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Has some difficulty in comprehending instructions, stories or poems. Needs guidance quite often.</Remarks>
    <Name>LISTENING SKILLS</Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can read and pronounce new words on ones own most of the time.</Remarks>
    <Name>READING SKILLS</Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Marathi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can read and pronounce new words on ones own most of the time.</Remarks>
    <Name>READING SKILLS</Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can read and understand a story or sentences and answer most of the questions correctly.</Remarks>
    <Name>READING SKILLS</Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Marathi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can read and understand a story or sentences and answer most of the questions correctly.</Remarks>
    <Name>READING SKILLS</Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can read simple sentences but takes time to read each word. Lacks fluency, speed and expression.</Remarks>
    <Name>READING SKILLS</Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Marathi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can read simple sentences but takes time to read each word. Lacks fluency, speed and expression.</Remarks>
    <Name>READING SKILLS</Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can read simple sentences fluently with proper speed, pronunciation and expression.</Remarks>
    <Name>READING SKILLS</Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Marathi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can read simple sentences fluently with proper speed, pronunciation and expression.</Remarks>
    <Name>READING SKILLS</Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Cannot comprehend passages on ones own. Often needs help.</Remarks>
    <Name>READING SKILLS</Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Marathi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Cannot comprehend passages on ones own. Often needs help.</Remarks>
    <Name>READING SKILLS</Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Student does not follow even on guidance.</Remarks>
    <Name>REGULARITY IN ASSIGNMENTS</Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Marathi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Student does not follow even on guidance.</Remarks>
    <Name>REGULARITY IN ASSIGNMENTS</Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Student meets few of the expectations on guidance only.</Remarks>
    <Name>REGULARITY IN ASSIGNMENTS</Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Marathi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Student meets few of the expectations on guidance only.</Remarks>
    <Name>REGULARITY IN ASSIGNMENTS</Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Student meets most of the expectations independently.</Remarks>
    <Name>REGULARITY IN ASSIGNMENTS</Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Marathi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Student meets most of the expectations independently.</Remarks>
    <Name>REGULARITY IN ASSIGNMENTS</Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Student meets most of the expectations on guidance only.</Remarks>
    <Name>REGULARITY IN ASSIGNMENTS</Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Marathi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Student meets most of the expectations on guidance only.</Remarks>
    <Name>REGULARITY IN ASSIGNMENTS</Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Student meets some of the expectations occasionally.</Remarks>
    <Name>REGULARITY IN ASSIGNMENTS</Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Marathi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Student meets some of the expectations occasionally.</Remarks>
    <Name>REGULARITY IN ASSIGNMENTS</Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can recite a poem with proper speed and expression but makes occasional mistakes in pronunciation or forgets a word or so.</Remarks>
    <Name>SPEAKING SKILLS</Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Marathi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can recite a poem with proper speed and expression but makes occasional mistakes in pronunciation or forgets a word or so.</Remarks>
    <Name>SPEAKING SKILLS</Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can recite a poem with proper speed, expression and pronunciation.</Remarks>
    <Name>SPEAKING SKILLS</Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Marathi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can recite a poem with proper speed, expression and pronunciation.</Remarks>
    <Name>SPEAKING SKILLS</Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can speak simple sentences but takes time to read each word. Lacks fluency, speed and expression.</Remarks>
    <Name>SPEAKING SKILLS</Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Marathi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can speak simple sentences but takes time to read each word. Lacks fluency, speed and expression.</Remarks>
    <Name>SPEAKING SKILLS</Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Carry out a dialogue only at a very basic level.</Remarks>
    <Name>SPEAKING SKILLS</Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Marathi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Carry out a dialogue only at a very basic level.</Remarks>
    <Name>SPEAKING SKILLS</Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Is fluent and spontaneous most of the time. Responds to the situation appropriately but fumbles for words occasionally.</Remarks>
    <Name>SPEAKING SKILLS</Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Marathi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Is fluent and spontaneous most of the time. Responds to the situation appropriately but fumbles for words occasionally.</Remarks>
    <Name>SPEAKING SKILLS</Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can read and pronounce new words on ones own most of the time.</Remarks>
    <Name>WRITING SKILLS</Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Marathi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can read and pronounce new words on ones own most of the time.</Remarks>
    <Name>WRITING SKILLS</Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can read and understand a story or sentences and answer most of the questions correctly.</Remarks>
    <Name>WRITING SKILLS</Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Marathi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can read and understand a story or sentences and answer most of the questions correctly.</Remarks>
    <Name>WRITING SKILLS</Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can write a few sentences on a given topic but with a lot of prompting and guidance.</Remarks>
    <Name>WRITING SKILLS</Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Marathi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can write a few sentences on a given topic but with a lot of prompting and guidance.</Remarks>
    <Name>WRITING SKILLS</Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can write sentences accurately and uses simple punctuation marks appropriately.</Remarks>
    <Name>WRITING SKILLS</Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Marathi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can write sentences accurately and uses simple punctuation marks appropriately.</Remarks>
    <Name>WRITING SKILLS</Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can write sentences with a few errors.</Remarks>
    <Name>WRITING SKILLS</Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Marathi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can write sentences with a few errors.</Remarks>
    <Name>WRITING SKILLS</Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can comprehend oral questions, instructions and stories/poems.</Remarks>
    <Name>LISTENING SKILLS</Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Marathi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can comprehend oral questions, instructions and stories/poems.</Remarks>
    <Name>LISTENING SKILLS</Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Has difficulty in following instruction and stories. Needs simplification or translation most of the time.</Remarks>
    <Name>LISTENING SKILLS</Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Marathi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Has difficulty in following instruction and stories. Needs simplification or translation most of the time.</Remarks>
    <Name>LISTENING SKILLS</Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Has some difficulty in comprehending instructions, stories or poems. Needs guidance quite often.</Remarks>
    <Name>LISTENING SKILLS</Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Marathi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Has some difficulty in comprehending instructions, stories or poems. Needs guidance quite often.</Remarks>
    <Name>LISTENING SKILLS</Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can read and pronounce new words on ones own most of the time.</Remarks>
    <Name>READING SKILLS</Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Marathi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can read and pronounce new words on ones own most of the time.</Remarks>
    <Name>READING SKILLS</Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can read and understand a story or sentences and answer most of the questions correctly.</Remarks>
    <Name>READING SKILLS</Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Marathi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can read and understand a story or sentences and answer most of the questions correctly.</Remarks>
    <Name>READING SKILLS</Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can read simple sentences but takes time to read each word. Lacks fluency, speed and expression.</Remarks>
    <Name>READING SKILLS</Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Marathi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can read simple sentences but takes time to read each word. Lacks fluency, speed and expression.</Remarks>
    <Name>READING SKILLS</Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can read simple sentences fluently with proper speed, pronunciation and expression.</Remarks>
    <Name>READING SKILLS</Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Marathi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can read simple sentences fluently with proper speed, pronunciation and expression.</Remarks>
    <Name>READING SKILLS</Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Cannot comprehend passages on ones own. Often needs help.</Remarks>
    <Name>READING SKILLS</Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Marathi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Cannot comprehend passages on ones own. Often needs help.</Remarks>
    <Name>READING SKILLS</Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Student does not follow even on guidance.</Remarks>
    <Name>REGULARITY IN ASSIGNMENTS</Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Marathi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Student does not follow even on guidance.</Remarks>
    <Name>REGULARITY IN ASSIGNMENTS</Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Student meets few of the expectations on guidance only.</Remarks>
    <Name>REGULARITY IN ASSIGNMENTS</Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Marathi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Student meets few of the expectations on guidance only.</Remarks>
    <Name>REGULARITY IN ASSIGNMENTS</Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Student meets most of the expectations independently.</Remarks>
    <Name>REGULARITY IN ASSIGNMENTS</Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Marathi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Student meets most of the expectations independently.</Remarks>
    <Name>REGULARITY IN ASSIGNMENTS</Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Student meets most of the expectations on guidance only.</Remarks>
    <Name>REGULARITY IN ASSIGNMENTS</Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Marathi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Student meets most of the expectations on guidance only.</Remarks>
    <Name>REGULARITY IN ASSIGNMENTS</Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Student meets some of the expectations occasionally.</Remarks>
    <Name>REGULARITY IN ASSIGNMENTS</Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Marathi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Student meets some of the expectations occasionally.</Remarks>
    <Name>REGULARITY IN ASSIGNMENTS</Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can recite a poem with proper speed and expression but makes occasional mistakes in pronunciation or forgets a word or so.</Remarks>
    <Name>SPEAKING SKILLS</Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Marathi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can recite a poem with proper speed and expression but makes occasional mistakes in pronunciation or forgets a word or so.</Remarks>
    <Name>SPEAKING SKILLS</Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can recite a poem with proper speed, expression and pronunciation.</Remarks>
    <Name>SPEAKING SKILLS</Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Marathi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can recite a poem with proper speed, expression and pronunciation.</Remarks>
    <Name>SPEAKING SKILLS</Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can speak simple sentences but takes time to read each word. Lacks fluency, speed and expression.</Remarks>
    <Name>SPEAKING SKILLS</Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Marathi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can speak simple sentences but takes time to read each word. Lacks fluency, speed and expression.</Remarks>
    <Name>SPEAKING SKILLS</Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Carry out a dialogue only at a very basic level.</Remarks>
    <Name>SPEAKING SKILLS</Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Marathi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Carry out a dialogue only at a very basic level.</Remarks>
    <Name>SPEAKING SKILLS</Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Is fluent and spontaneous most of the time. Responds to the situation appropriately but fumbles for words occasionally.</Remarks>
    <Name>SPEAKING SKILLS</Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Marathi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Is fluent and spontaneous most of the time. Responds to the situation appropriately but fumbles for words occasionally.</Remarks>
    <Name>SPEAKING SKILLS</Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can read and pronounce new words on ones own most of the time.</Remarks>
    <Name>WRITING SKILLS</Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Marathi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can read and pronounce new words on ones own most of the time.</Remarks>
    <Name>WRITING SKILLS</Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can read and understand a story or sentences and answer most of the questions correctly.</Remarks>
    <Name>WRITING SKILLS</Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Marathi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can read and understand a story or sentences and answer most of the questions correctly.</Remarks>
    <Name>WRITING SKILLS</Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can write a few sentences on a given topic but with a lot of prompting and guidance.</Remarks>
    <Name>WRITING SKILLS</Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Marathi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can write a few sentences on a given topic but with a lot of prompting and guidance.</Remarks>
    <Name>WRITING SKILLS</Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can write sentences accurately and uses simple punctuation marks appropriately.</Remarks>
    <Name>WRITING SKILLS</Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Marathi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can write sentences accurately and uses simple punctuation marks appropriately.</Remarks>
    <Name>WRITING SKILLS</Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can write sentences with a few errors.</Remarks>
    <Name>WRITING SKILLS</Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Marathi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can write sentences with a few errors.</Remarks>
    <Name>WRITING SKILLS</Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Has not understood the concept of tables. Makes mistakes</Remarks>
    <Name>ASPECTS </Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Mathematics</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Neat and systematic work.</Remarks>
    <Name>ASPECTS </Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Mathematics</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Takes immense delight in working with mathematical problems mentally.</Remarks>
    <Name>ASPECTS </Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Mathematics</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Takes keen interest in various activities</Remarks>
    <Name>ASPECTS </Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Mathematics</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Takes some time to understand new concepts.</Remarks>
    <Name>ASPECTS </Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Mathematics</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can comprehend oral questions, instructions and stories/poems.</Remarks>
    <Name>LISTENING SKILLS</Name>
    <Standard_Name>Junior KG</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Has difficulty in following instruction and stories. Needs simplification or translation most of the time.</Remarks>
    <Name>LISTENING SKILLS</Name>
    <Standard_Name>Junior KG</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Has some difficulty in comprehending instructions, stories or poems. Needs guidance quite often.</Remarks>
    <Name>LISTENING SKILLS</Name>
    <Standard_Name>Junior KG</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can read and pronounce new words on ones own most of the time.</Remarks>
    <Name>READING SKILLS</Name>
    <Standard_Name>Junior KG</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can read and understand a story or sentences and answer most of the questions correctly.</Remarks>
    <Name>READING SKILLS</Name>
    <Standard_Name>Junior KG</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can read simple sentences but takes time to read each word. Lacks fluency, speed and expression.</Remarks>
    <Name>READING SKILLS</Name>
    <Standard_Name>Junior KG</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can read simple sentences fluently with proper speed, pronunciation and expression.</Remarks>
    <Name>READING SKILLS</Name>
    <Standard_Name>Junior KG</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Cannot comprehend passages on ones own. Often needs help.</Remarks>
    <Name>READING SKILLS</Name>
    <Standard_Name>Junior KG</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can recite a poem with proper speed and expression but makes occasional mistakes in pronunciation or forgets a word or so.</Remarks>
    <Name>SPEAKING SKILLS</Name>
    <Standard_Name>Junior KG</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can recite a poem with proper speed, expression and pronunciation.</Remarks>
    <Name>SPEAKING SKILLS</Name>
    <Standard_Name>Junior KG</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can speak simple sentences but takes time to read each word. Lacks fluency, speed and expression.</Remarks>
    <Name>SPEAKING SKILLS</Name>
    <Standard_Name>Junior KG</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Carry out a dialogue only at a very basic level.</Remarks>
    <Name>SPEAKING SKILLS</Name>
    <Standard_Name>Junior KG</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Is fluent and spontaneous most of the time. Responds to the situation appropriately but fumbles for words occasionally.</Remarks>
    <Name>SPEAKING SKILLS</Name>
    <Standard_Name>Junior KG</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can read and pronounce new words on ones own most of the time.</Remarks>
    <Name>WRITING SKILLS</Name>
    <Standard_Name>Junior KG</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can read and understand a story or sentences and answer most of the questions correctly.</Remarks>
    <Name>WRITING SKILLS</Name>
    <Standard_Name>Junior KG</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can write a few sentences on a given topic but with a lot of prompting and guidance.</Remarks>
    <Name>WRITING SKILLS</Name>
    <Standard_Name>Junior KG</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can write sentences accurately and uses simple punctuation marks appropriately.</Remarks>
    <Name>WRITING SKILLS</Name>
    <Standard_Name>Junior KG</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can write sentences with a few errors.</Remarks>
    <Name>WRITING SKILLS</Name>
    <Standard_Name>Junior KG</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can ask simple questions but with prompting.</Remarks>
    <Name>ASPECTS </Name>
    <Standard_Name>Junior KG</Standard_Name>
    <Subject_Name>EVS</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can do cutting, pasting, drawing and collage work and shows creativity and originality at times.</Remarks>
    <Name>ASPECTS </Name>
    <Standard_Name>Junior KG</Standard_Name>
    <Subject_Name>EVS</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Is keen, alert and observant, very much aware of the surroundings.</Remarks>
    <Name>ASPECTS </Name>
    <Standard_Name>Junior KG</Standard_Name>
    <Subject_Name>EVS</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Needs to be aware of the surroundings.</Remarks>
    <Name>ASPECTS </Name>
    <Standard_Name>Junior KG</Standard_Name>
    <Subject_Name>EVS</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Work is always neat and presentable.</Remarks>
    <Name>ASPECTS </Name>
    <Standard_Name>Junior KG</Standard_Name>
    <Subject_Name>EVS</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can comprehend oral questions, instructions and stories/poems.</Remarks>
    <Name>LISTENING SKILLS</Name>
    <Standard_Name>Junior KG</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Has difficulty in following instruction and stories. Needs simplification or translation most of the time.</Remarks>
    <Name>LISTENING SKILLS</Name>
    <Standard_Name>Junior KG</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Has some difficulty in comprehending instructions, stories or poems. Needs guidance quite often.</Remarks>
    <Name>LISTENING SKILLS</Name>
    <Standard_Name>Junior KG</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can read and pronounce new words on ones own most of the time.</Remarks>
    <Name>READING SKILLS</Name>
    <Standard_Name>Junior KG</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can read and understand a story or sentences and answer most of the questions correctly.</Remarks>
    <Name>READING SKILLS</Name>
    <Standard_Name>Junior KG</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can read simple sentences but takes time to read each word. Lacks fluency, speed and expression.</Remarks>
    <Name>READING SKILLS</Name>
    <Standard_Name>Junior KG</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can read simple sentences fluently with proper speed, pronunciation and expression.</Remarks>
    <Name>READING SKILLS</Name>
    <Standard_Name>Junior KG</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Cannot comprehend passages on ones own. Often needs help.</Remarks>
    <Name>READING SKILLS</Name>
    <Standard_Name>Junior KG</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Student does not follow even on guidance.</Remarks>
    <Name>REGULARITY IN ASSIGNMENTS</Name>
    <Standard_Name>Junior KG</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Student meets few of the expectations on guidance only.</Remarks>
    <Name>REGULARITY IN ASSIGNMENTS</Name>
    <Standard_Name>Junior KG</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Student meets most of the expectations independently.</Remarks>
    <Name>REGULARITY IN ASSIGNMENTS</Name>
    <Standard_Name>Junior KG</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Student meets most of the expectations on guidance only.</Remarks>
    <Name>REGULARITY IN ASSIGNMENTS</Name>
    <Standard_Name>Junior KG</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Student meets some of the expectations occasionally.</Remarks>
    <Name>REGULARITY IN ASSIGNMENTS</Name>
    <Standard_Name>Junior KG</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can recite a poem with proper speed and expression but makes occasional mistakes in pronunciation or forgets a word or so.</Remarks>
    <Name>SPEAKING SKILLS</Name>
    <Standard_Name>Junior KG</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can recite a poem with proper speed, expression and pronunciation.</Remarks>
    <Name>SPEAKING SKILLS</Name>
    <Standard_Name>Junior KG</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can speak simple sentences but takes time to read each word. Lacks fluency, speed and expression.</Remarks>
    <Name>SPEAKING SKILLS</Name>
    <Standard_Name>Junior KG</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Carry out a dialogue only at a very basic level.</Remarks>
    <Name>SPEAKING SKILLS</Name>
    <Standard_Name>Junior KG</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Is fluent and spontaneous most of the time. Responds to the situation appropriately but fumbles for words occasionally.</Remarks>
    <Name>SPEAKING SKILLS</Name>
    <Standard_Name>Junior KG</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can read and pronounce new words on ones own most of the time.</Remarks>
    <Name>WRITING SKILLS</Name>
    <Standard_Name>Junior KG</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can read and understand a story or sentences and answer most of the questions correctly.</Remarks>
    <Name>WRITING SKILLS</Name>
    <Standard_Name>Junior KG</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can write a few sentences on a given topic but with a lot of prompting and guidance.</Remarks>
    <Name>WRITING SKILLS</Name>
    <Standard_Name>Junior KG</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can write sentences accurately and uses simple punctuation marks appropriately.</Remarks>
    <Name>WRITING SKILLS</Name>
    <Standard_Name>Junior KG</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can write sentences with a few errors.</Remarks>
    <Name>WRITING SKILLS</Name>
    <Standard_Name>Junior KG</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Has not understood the concept of tables. Makes mistakes</Remarks>
    <Name>ASPECTS </Name>
    <Standard_Name>Junior KG</Standard_Name>
    <Subject_Name>Mathematics</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Neat and systematic work.</Remarks>
    <Name>ASPECTS </Name>
    <Standard_Name>Junior KG</Standard_Name>
    <Subject_Name>Mathematics</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Takes immense delight in working with mathematical problems mentally.</Remarks>
    <Name>ASPECTS </Name>
    <Standard_Name>Junior KG</Standard_Name>
    <Subject_Name>Mathematics</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Takes keen interest in various activities</Remarks>
    <Name>ASPECTS </Name>
    <Standard_Name>Junior KG</Standard_Name>
    <Subject_Name>Mathematics</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Takes some time to understand new concepts.</Remarks>
    <Name>ASPECTS </Name>
    <Standard_Name>Junior KG</Standard_Name>
    <Subject_Name>Mathematics</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can comprehend oral questions, instructions and stories/poems.</Remarks>
    <Name>LISTENING SKILLS</Name>
    <Standard_Name>Nursery</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Has difficulty in following instruction and stories. Needs simplification or translation most of the time.</Remarks>
    <Name>LISTENING SKILLS</Name>
    <Standard_Name>Nursery</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Has some difficulty in comprehending instructions, stories or poems. Needs guidance quite often.</Remarks>
    <Name>LISTENING SKILLS</Name>
    <Standard_Name>Nursery</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can read and pronounce new words on ones own most of the time.</Remarks>
    <Name>READING SKILLS</Name>
    <Standard_Name>Nursery</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can read and understand a story or sentences and answer most of the questions correctly.</Remarks>
    <Name>READING SKILLS</Name>
    <Standard_Name>Nursery</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can read simple sentences but takes time to read each word. Lacks fluency, speed and expression.</Remarks>
    <Name>READING SKILLS</Name>
    <Standard_Name>Nursery</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can read simple sentences fluently with proper speed, pronunciation and expression.</Remarks>
    <Name>READING SKILLS</Name>
    <Standard_Name>Nursery</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Cannot comprehend passages on ones own. Often needs help.</Remarks>
    <Name>READING SKILLS</Name>
    <Standard_Name>Nursery</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can recite a poem with proper speed and expression but makes occasional mistakes in pronunciation or forgets a word or so.</Remarks>
    <Name>SPEAKING SKILLS</Name>
    <Standard_Name>Nursery</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can recite a poem with proper speed, expression and pronunciation.</Remarks>
    <Name>SPEAKING SKILLS</Name>
    <Standard_Name>Nursery</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can speak simple sentences but takes time to read each word. Lacks fluency, speed and expression.</Remarks>
    <Name>SPEAKING SKILLS</Name>
    <Standard_Name>Nursery</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Carry out a dialogue only at a very basic level.</Remarks>
    <Name>SPEAKING SKILLS</Name>
    <Standard_Name>Nursery</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Is fluent and spontaneous most of the time. Responds to the situation appropriately but fumbles for words occasionally.</Remarks>
    <Name>SPEAKING SKILLS</Name>
    <Standard_Name>Nursery</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can read and pronounce new words on ones own most of the time.</Remarks>
    <Name>WRITING SKILLS</Name>
    <Standard_Name>Nursery</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can read and understand a story or sentences and answer most of the questions correctly.</Remarks>
    <Name>WRITING SKILLS</Name>
    <Standard_Name>Nursery</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can write a few sentences on a given topic but with a lot of prompting and guidance.</Remarks>
    <Name>WRITING SKILLS</Name>
    <Standard_Name>Nursery</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can write sentences accurately and uses simple punctuation marks appropriately.</Remarks>
    <Name>WRITING SKILLS</Name>
    <Standard_Name>Nursery</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can write sentences with a few errors.</Remarks>
    <Name>WRITING SKILLS</Name>
    <Standard_Name>Nursery</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can ask simple questions but with prompting.</Remarks>
    <Name>ASPECTS </Name>
    <Standard_Name>Nursery</Standard_Name>
    <Subject_Name>EVS</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can do cutting, pasting, drawing and collage work and shows creativity and originality at times.</Remarks>
    <Name>ASPECTS </Name>
    <Standard_Name>Nursery</Standard_Name>
    <Subject_Name>EVS</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Is keen, alert and observant, very much aware of the surroundings.</Remarks>
    <Name>ASPECTS </Name>
    <Standard_Name>Nursery</Standard_Name>
    <Subject_Name>EVS</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Needs to be aware of the surroundings.</Remarks>
    <Name>ASPECTS </Name>
    <Standard_Name>Nursery</Standard_Name>
    <Subject_Name>EVS</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Work is always neat and presentable.</Remarks>
    <Name>ASPECTS </Name>
    <Standard_Name>Nursery</Standard_Name>
    <Subject_Name>EVS</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can comprehend oral questions, instructions and stories/poems.</Remarks>
    <Name>LISTENING SKILLS</Name>
    <Standard_Name>Nursery</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Has difficulty in following instruction and stories. Needs simplification or translation most of the time.</Remarks>
    <Name>LISTENING SKILLS</Name>
    <Standard_Name>Nursery</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Has some difficulty in comprehending instructions, stories or poems. Needs guidance quite often.</Remarks>
    <Name>LISTENING SKILLS</Name>
    <Standard_Name>Nursery</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can read and pronounce new words on ones own most of the time.</Remarks>
    <Name>READING SKILLS</Name>
    <Standard_Name>Nursery</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can read and understand a story or sentences and answer most of the questions correctly.</Remarks>
    <Name>READING SKILLS</Name>
    <Standard_Name>Nursery</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can read simple sentences but takes time to read each word. Lacks fluency, speed and expression.</Remarks>
    <Name>READING SKILLS</Name>
    <Standard_Name>Nursery</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can read simple sentences fluently with proper speed, pronunciation and expression.</Remarks>
    <Name>READING SKILLS</Name>
    <Standard_Name>Nursery</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Cannot comprehend passages on ones own. Often needs help.</Remarks>
    <Name>READING SKILLS</Name>
    <Standard_Name>Nursery</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Student does not follow even on guidance.</Remarks>
    <Name>REGULARITY IN ASSIGNMENTS</Name>
    <Standard_Name>Nursery</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Student meets few of the expectations on guidance only.</Remarks>
    <Name>REGULARITY IN ASSIGNMENTS</Name>
    <Standard_Name>Nursery</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Student meets most of the expectations independently.</Remarks>
    <Name>REGULARITY IN ASSIGNMENTS</Name>
    <Standard_Name>Nursery</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Student meets most of the expectations on guidance only.</Remarks>
    <Name>REGULARITY IN ASSIGNMENTS</Name>
    <Standard_Name>Nursery</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Student meets some of the expectations occasionally.</Remarks>
    <Name>REGULARITY IN ASSIGNMENTS</Name>
    <Standard_Name>Nursery</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can recite a poem with proper speed and expression but makes occasional mistakes in pronunciation or forgets a word or so.</Remarks>
    <Name>SPEAKING SKILLS</Name>
    <Standard_Name>Nursery</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can recite a poem with proper speed, expression and pronunciation.</Remarks>
    <Name>SPEAKING SKILLS</Name>
    <Standard_Name>Nursery</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can speak simple sentences but takes time to read each word. Lacks fluency, speed and expression.</Remarks>
    <Name>SPEAKING SKILLS</Name>
    <Standard_Name>Nursery</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Carry out a dialogue only at a very basic level.</Remarks>
    <Name>SPEAKING SKILLS</Name>
    <Standard_Name>Nursery</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Is fluent and spontaneous most of the time. Responds to the situation appropriately but fumbles for words occasionally.</Remarks>
    <Name>SPEAKING SKILLS</Name>
    <Standard_Name>Nursery</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can read and pronounce new words on ones own most of the time.</Remarks>
    <Name>WRITING SKILLS</Name>
    <Standard_Name>Nursery</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can read and understand a story or sentences and answer most of the questions correctly.</Remarks>
    <Name>WRITING SKILLS</Name>
    <Standard_Name>Nursery</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can write a few sentences on a given topic but with a lot of prompting and guidance.</Remarks>
    <Name>WRITING SKILLS</Name>
    <Standard_Name>Nursery</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can write sentences accurately and uses simple punctuation marks appropriately.</Remarks>
    <Name>WRITING SKILLS</Name>
    <Standard_Name>Nursery</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can write sentences with a few errors.</Remarks>
    <Name>WRITING SKILLS</Name>
    <Standard_Name>Nursery</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Has not understood the concept of tables. Makes mistakes</Remarks>
    <Name>ASPECTS </Name>
    <Standard_Name>Nursery</Standard_Name>
    <Subject_Name>Mathematics</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Neat and systematic work.</Remarks>
    <Name>ASPECTS </Name>
    <Standard_Name>Nursery</Standard_Name>
    <Subject_Name>Mathematics</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Takes immense delight in working with mathematical problems mentally.</Remarks>
    <Name>ASPECTS </Name>
    <Standard_Name>Nursery</Standard_Name>
    <Subject_Name>Mathematics</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Takes keen interest in various activities</Remarks>
    <Name>ASPECTS </Name>
    <Standard_Name>Nursery</Standard_Name>
    <Subject_Name>Mathematics</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Takes some time to understand new concepts.</Remarks>
    <Name>ASPECTS </Name>
    <Standard_Name>Nursery</Standard_Name>
    <Subject_Name>Mathematics</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can comprehend oral questions, instructions and stories/poems.</Remarks>
    <Name>LISTENING SKILLS</Name>
    <Standard_Name>Senior KG</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Has difficulty in following instruction and stories. Needs simplification or translation most of the time.</Remarks>
    <Name>LISTENING SKILLS</Name>
    <Standard_Name>Senior KG</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Has some difficulty in comprehending instructions, stories or poems. Needs guidance quite often.</Remarks>
    <Name>LISTENING SKILLS</Name>
    <Standard_Name>Senior KG</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can read and pronounce new words on ones own most of the time.</Remarks>
    <Name>READING SKILLS</Name>
    <Standard_Name>Senior KG</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can read and understand a story or sentences and answer most of the questions correctly.</Remarks>
    <Name>READING SKILLS</Name>
    <Standard_Name>Senior KG</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can read simple sentences but takes time to read each word. Lacks fluency, speed and expression.</Remarks>
    <Name>READING SKILLS</Name>
    <Standard_Name>Senior KG</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can read simple sentences fluently with proper speed, pronunciation and expression.</Remarks>
    <Name>READING SKILLS</Name>
    <Standard_Name>Senior KG</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Cannot comprehend passages on ones own. Often needs help.</Remarks>
    <Name>READING SKILLS</Name>
    <Standard_Name>Senior KG</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can recite a poem with proper speed and expression but makes occasional mistakes in pronunciation or forgets a word or so.</Remarks>
    <Name>SPEAKING SKILLS</Name>
    <Standard_Name>Senior KG</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can recite a poem with proper speed, expression and pronunciation.</Remarks>
    <Name>SPEAKING SKILLS</Name>
    <Standard_Name>Senior KG</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can speak simple sentences but takes time to read each word. Lacks fluency, speed and expression.</Remarks>
    <Name>SPEAKING SKILLS</Name>
    <Standard_Name>Senior KG</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Carry out a dialogue only at a very basic level.</Remarks>
    <Name>SPEAKING SKILLS</Name>
    <Standard_Name>Senior KG</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Is fluent and spontaneous most of the time. Responds to the situation appropriately but fumbles for words occasionally.</Remarks>
    <Name>SPEAKING SKILLS</Name>
    <Standard_Name>Senior KG</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can read and pronounce new words on ones own most of the time.</Remarks>
    <Name>WRITING SKILLS</Name>
    <Standard_Name>Senior KG</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can read and understand a story or sentences and answer most of the questions correctly.</Remarks>
    <Name>WRITING SKILLS</Name>
    <Standard_Name>Senior KG</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can write a few sentences on a given topic but with a lot of prompting and guidance.</Remarks>
    <Name>WRITING SKILLS</Name>
    <Standard_Name>Senior KG</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can write sentences accurately and uses simple punctuation marks appropriately.</Remarks>
    <Name>WRITING SKILLS</Name>
    <Standard_Name>Senior KG</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can write sentences with a few errors.</Remarks>
    <Name>WRITING SKILLS</Name>
    <Standard_Name>Senior KG</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can ask simple questions but with prompting.</Remarks>
    <Name>ASPECTS </Name>
    <Standard_Name>Senior KG</Standard_Name>
    <Subject_Name>EVS</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can do cutting, pasting, drawing and collage work and shows creativity and originality at times.</Remarks>
    <Name>ASPECTS </Name>
    <Standard_Name>Senior KG</Standard_Name>
    <Subject_Name>EVS</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Is keen, alert and observant, very much aware of the surroundings.</Remarks>
    <Name>ASPECTS </Name>
    <Standard_Name>Senior KG</Standard_Name>
    <Subject_Name>EVS</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Needs to be aware of the surroundings.</Remarks>
    <Name>ASPECTS </Name>
    <Standard_Name>Senior KG</Standard_Name>
    <Subject_Name>EVS</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Work is always neat and presentable.</Remarks>
    <Name>ASPECTS </Name>
    <Standard_Name>Senior KG</Standard_Name>
    <Subject_Name>EVS</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can comprehend oral questions, instructions and stories/poems.</Remarks>
    <Name>LISTENING SKILLS</Name>
    <Standard_Name>Senior KG</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Has difficulty in following instruction and stories. Needs simplification or translation most of the time.</Remarks>
    <Name>LISTENING SKILLS</Name>
    <Standard_Name>Senior KG</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Has some difficulty in comprehending instructions, stories or poems. Needs guidance quite often.</Remarks>
    <Name>LISTENING SKILLS</Name>
    <Standard_Name>Senior KG</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can read and pronounce new words on ones own most of the time.</Remarks>
    <Name>READING SKILLS</Name>
    <Standard_Name>Senior KG</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can read and understand a story or sentences and answer most of the questions correctly.</Remarks>
    <Name>READING SKILLS</Name>
    <Standard_Name>Senior KG</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can read simple sentences but takes time to read each word. Lacks fluency, speed and expression.</Remarks>
    <Name>READING SKILLS</Name>
    <Standard_Name>Senior KG</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can read simple sentences fluently with proper speed, pronunciation and expression.</Remarks>
    <Name>READING SKILLS</Name>
    <Standard_Name>Senior KG</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Cannot comprehend passages on ones own. Often needs help.</Remarks>
    <Name>READING SKILLS</Name>
    <Standard_Name>Senior KG</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Student does not follow even on guidance.</Remarks>
    <Name>REGULARITY IN ASSIGNMENTS</Name>
    <Standard_Name>Senior KG</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Student meets few of the expectations on guidance only.</Remarks>
    <Name>REGULARITY IN ASSIGNMENTS</Name>
    <Standard_Name>Senior KG</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Student meets most of the expectations independently.</Remarks>
    <Name>REGULARITY IN ASSIGNMENTS</Name>
    <Standard_Name>Senior KG</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Student meets most of the expectations on guidance only.</Remarks>
    <Name>REGULARITY IN ASSIGNMENTS</Name>
    <Standard_Name>Senior KG</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Student meets some of the expectations occasionally.</Remarks>
    <Name>REGULARITY IN ASSIGNMENTS</Name>
    <Standard_Name>Senior KG</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can recite a poem with proper speed and expression but makes occasional mistakes in pronunciation or forgets a word or so.</Remarks>
    <Name>SPEAKING SKILLS</Name>
    <Standard_Name>Senior KG</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can recite a poem with proper speed, expression and pronunciation.</Remarks>
    <Name>SPEAKING SKILLS</Name>
    <Standard_Name>Senior KG</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can speak simple sentences but takes time to read each word. Lacks fluency, speed and expression.</Remarks>
    <Name>SPEAKING SKILLS</Name>
    <Standard_Name>Senior KG</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Carry out a dialogue only at a very basic level.</Remarks>
    <Name>SPEAKING SKILLS</Name>
    <Standard_Name>Senior KG</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Is fluent and spontaneous most of the time. Responds to the situation appropriately but fumbles for words occasionally.</Remarks>
    <Name>SPEAKING SKILLS</Name>
    <Standard_Name>Senior KG</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can read and pronounce new words on ones own most of the time.</Remarks>
    <Name>WRITING SKILLS</Name>
    <Standard_Name>Senior KG</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can read and understand a story or sentences and answer most of the questions correctly.</Remarks>
    <Name>WRITING SKILLS</Name>
    <Standard_Name>Senior KG</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can write a few sentences on a given topic but with a lot of prompting and guidance.</Remarks>
    <Name>WRITING SKILLS</Name>
    <Standard_Name>Senior KG</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can write sentences accurately and uses simple punctuation marks appropriately.</Remarks>
    <Name>WRITING SKILLS</Name>
    <Standard_Name>Senior KG</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can write sentences with a few errors.</Remarks>
    <Name>WRITING SKILLS</Name>
    <Standard_Name>Senior KG</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Has not understood the concept of tables. Makes mistakes</Remarks>
    <Name>ASPECTS </Name>
    <Standard_Name>Senior KG</Standard_Name>
    <Subject_Name>Mathematics</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Neat and systematic work.</Remarks>
    <Name>ASPECTS </Name>
    <Standard_Name>Senior KG</Standard_Name>
    <Subject_Name>Mathematics</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Student meets most of the expectations independently.</Remarks>
    <Name>REGULARITY IN ASSIGNMENTS</Name>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Student meets most of the expectations on guidance only.</Remarks>
    <Name>REGULARITY IN ASSIGNMENTS</Name>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Student meets some of the expectations occasionally.</Remarks>
    <Name>REGULARITY IN ASSIGNMENTS</Name>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Student meets most of the expectations independently.</Remarks>
    <Name>REGULARITY IN ASSIGNMENTS</Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Student meets most of the expectations on guidance only.</Remarks>
    <Name>REGULARITY IN ASSIGNMENTS</Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Student meets some of the expectations occasionally.</Remarks>
    <Name>REGULARITY IN ASSIGNMENTS</Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Student meets most of the expectations independently.</Remarks>
    <Name>REGULARITY IN ASSIGNMENTS</Name>
    <Standard_Name>Junior KG</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Student meets most of the expectations on guidance only.</Remarks>
    <Name>REGULARITY IN ASSIGNMENTS</Name>
    <Standard_Name>Junior KG</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Student meets some of the expectations occasionally.</Remarks>
    <Name>REGULARITY IN ASSIGNMENTS</Name>
    <Standard_Name>Junior KG</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Student meets most of the expectations independently.</Remarks>
    <Name>REGULARITY IN ASSIGNMENTS</Name>
    <Standard_Name>Nursery</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Student meets most of the expectations on guidance only.</Remarks>
    <Name>REGULARITY IN ASSIGNMENTS</Name>
    <Standard_Name>Nursery</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Student meets some of the expectations occasionally.</Remarks>
    <Name>REGULARITY IN ASSIGNMENTS</Name>
    <Standard_Name>Nursery</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Student meets most of the expectations independently.</Remarks>
    <Name>REGULARITY IN ASSIGNMENTS</Name>
    <Standard_Name>Senior KG</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Student meets most of the expectations on guidance only.</Remarks>
    <Name>REGULARITY IN ASSIGNMENTS</Name>
    <Standard_Name>Senior KG</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Student meets some of the expectations occasionally.</Remarks>
    <Name>REGULARITY IN ASSIGNMENTS</Name>
    <Standard_Name>Senior KG</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Has not understood the concept of tables. Makes mistakes</Remarks>
    <Name>ASPECTS </Name>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>Computers</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Neat and systematic work.</Remarks>
    <Name>ASPECTS </Name>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>Computers</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Takes immense delight in working with mathematical problems mentally.</Remarks>
    <Name>ASPECTS </Name>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>Computers</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Takes keen interest in various activities</Remarks>
    <Name>ASPECTS </Name>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>Computers</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Takes some time to understand new concepts.</Remarks>
    <Name>ASPECTS </Name>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>Computers</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can comprehend oral questions, instructions and stories/poems.</Remarks>
    <Name>LISTENING SKILLS</Name>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Has difficulty in following instruction and stories. Needs simplification or translation most of the time.</Remarks>
    <Name>LISTENING SKILLS</Name>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Has some difficulty in comprehending instructions, stories or poems. Needs guidance quite often.</Remarks>
    <Name>LISTENING SKILLS</Name>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can read and pronounce new words on ones own most of the time.</Remarks>
    <Name>READING SKILLS</Name>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can read and understand a story or sentences and answer most of the questions correctly.</Remarks>
    <Name>READING SKILLS</Name>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can read simple sentences but takes time to read each word. Lacks fluency, speed and expression.</Remarks>
    <Name>READING SKILLS</Name>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can read simple sentences fluently with proper speed, pronunciation and expression.</Remarks>
    <Name>READING SKILLS</Name>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Cannot comprehend passages on ones own. Often needs help.</Remarks>
    <Name>READING SKILLS</Name>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can recite a poem with proper speed and expression but makes occasional mistakes in pronunciation or forgets a word or so.</Remarks>
    <Name>SPEAKING SKILLS</Name>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can recite a poem with proper speed, expression and pronunciation.</Remarks>
    <Name>SPEAKING SKILLS</Name>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can speak simple sentences but takes time to read each word. Lacks fluency, speed and expression.</Remarks>
    <Name>SPEAKING SKILLS</Name>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Carry out a dialogue only at a very basic level.</Remarks>
    <Name>SPEAKING SKILLS</Name>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Is fluent and spontaneous most of the time. Responds to the situation appropriately but fumbles for words occasionally.</Remarks>
    <Name>SPEAKING SKILLS</Name>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can read and pronounce new words on ones own most of the time.</Remarks>
    <Name>WRITING SKILLS</Name>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can read and understand a story or sentences and answer most of the questions correctly.</Remarks>
    <Name>WRITING SKILLS</Name>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can write a few sentences on a given topic but with a lot of prompting and guidance.</Remarks>
    <Name>WRITING SKILLS</Name>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can write sentences accurately and uses simple punctuation marks appropriately.</Remarks>
    <Name>WRITING SKILLS</Name>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can write sentences with a few errors.</Remarks>
    <Name>WRITING SKILLS</Name>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can ask simple questions but with prompting.</Remarks>
    <Name>ASPECTS </Name>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>EVS</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can do cutting, pasting, drawing and collage work and shows creativity and originality at times.</Remarks>
    <Name>ASPECTS </Name>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>EVS</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Is keen, alert and observant, very much aware of the surroundings.</Remarks>
    <Name>ASPECTS </Name>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>EVS</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Needs to be aware of the surroundings.</Remarks>
    <Name>ASPECTS </Name>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>EVS</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Work is always neat and presentable.</Remarks>
    <Name>ASPECTS </Name>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>EVS</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can comprehend oral questions, instructions and stories/poems.</Remarks>
    <Name>LISTENING SKILLS</Name>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Has difficulty in following instruction and stories. Needs simplification or translation most of the time.</Remarks>
    <Name>LISTENING SKILLS</Name>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Has some difficulty in comprehending instructions, stories or poems. Needs guidance quite often.</Remarks>
    <Name>LISTENING SKILLS</Name>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can read and pronounce new words on ones own most of the time.</Remarks>
    <Name>READING SKILLS</Name>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can read and understand a story or sentences and answer most of the questions correctly.</Remarks>
    <Name>READING SKILLS</Name>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can read simple sentences but takes time to read each word. Lacks fluency, speed and expression.</Remarks>
    <Name>READING SKILLS</Name>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can read simple sentences fluently with proper speed, pronunciation and expression.</Remarks>
    <Name>READING SKILLS</Name>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Cannot comprehend passages on ones own. Often needs help.</Remarks>
    <Name>READING SKILLS</Name>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Student does not follow even on guidance.</Remarks>
    <Name>REGULARITY IN ASSIGNMENTS</Name>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Takes immense delight in working with mathematical problems mentally.</Remarks>
    <Name>ASPECTS </Name>
    <Standard_Name>Senior KG</Standard_Name>
    <Subject_Name>Mathematics</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Takes keen interest in various activities</Remarks>
    <Name>ASPECTS </Name>
    <Standard_Name>Senior KG</Standard_Name>
    <Subject_Name>Mathematics</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Takes some time to understand new concepts.</Remarks>
    <Name>ASPECTS </Name>
    <Standard_Name>Senior KG</Standard_Name>
    <Subject_Name>Mathematics</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Student meets few of the expectations on guidance only.</Remarks>
    <Name>REGULARITY IN ASSIGNMENTS</Name>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Student meets most of the expectations independently.</Remarks>
    <Name>REGULARITY IN ASSIGNMENTS</Name>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Student meets most of the expectations on guidance only.</Remarks>
    <Name>REGULARITY IN ASSIGNMENTS</Name>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Student meets some of the expectations occasionally.</Remarks>
    <Name>REGULARITY IN ASSIGNMENTS</Name>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can recite a poem with proper speed and expression but makes occasional mistakes in pronunciation or forgets a word or so.</Remarks>
    <Name>SPEAKING SKILLS</Name>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can recite a poem with proper speed, expression and pronunciation.</Remarks>
    <Name>SPEAKING SKILLS</Name>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can speak simple sentences but takes time to read each word. Lacks fluency, speed and expression.</Remarks>
    <Name>SPEAKING SKILLS</Name>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Carry out a dialogue only at a very basic level.</Remarks>
    <Name>SPEAKING SKILLS</Name>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Is fluent and spontaneous most of the time. Responds to the situation appropriately but fumbles for words occasionally.</Remarks>
    <Name>SPEAKING SKILLS</Name>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can read and pronounce new words on ones own most of the time.</Remarks>
    <Name>WRITING SKILLS</Name>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can read and understand a story or sentences and answer most of the questions correctly.</Remarks>
    <Name>WRITING SKILLS</Name>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can write a few sentences on a given topic but with a lot of prompting and guidance.</Remarks>
    <Name>WRITING SKILLS</Name>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can write sentences accurately and uses simple punctuation marks appropriately.</Remarks>
    <Name>WRITING SKILLS</Name>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can write sentences with a few errors.</Remarks>
    <Name>WRITING SKILLS</Name>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can comprehend oral questions, instructions and stories/poems.</Remarks>
    <Name>LISTENING SKILLS</Name>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>Marathi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Has difficulty in following instruction and stories. Needs simplification or translation most of the time.</Remarks>
    <Name>LISTENING SKILLS</Name>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>Marathi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Has some difficulty in comprehending instructions, stories or poems. Needs guidance quite often.</Remarks>
    <Name>LISTENING SKILLS</Name>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>Marathi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can read and pronounce new words on ones own most of the time.</Remarks>
    <Name>READING SKILLS</Name>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>Marathi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can read and understand a story or sentences and answer most of the questions correctly.</Remarks>
    <Name>READING SKILLS</Name>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>Marathi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can read simple sentences but takes time to read each word. Lacks fluency, speed and expression.</Remarks>
    <Name>READING SKILLS</Name>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>Marathi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can read simple sentences fluently with proper speed, pronunciation and expression.</Remarks>
    <Name>READING SKILLS</Name>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>Marathi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Cannot comprehend passages on ones own. Often needs help.</Remarks>
    <Name>READING SKILLS</Name>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>Marathi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Student does not follow even on guidance.</Remarks>
    <Name>REGULARITY IN ASSIGNMENTS</Name>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>Marathi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Student meets few of the expectations on guidance only.</Remarks>
    <Name>REGULARITY IN ASSIGNMENTS</Name>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>Marathi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Student meets most of the expectations independently.</Remarks>
    <Name>REGULARITY IN ASSIGNMENTS</Name>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>Marathi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Student meets most of the expectations on guidance only.</Remarks>
    <Name>REGULARITY IN ASSIGNMENTS</Name>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>Marathi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Student meets some of the expectations occasionally.</Remarks>
    <Name>REGULARITY IN ASSIGNMENTS</Name>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>Marathi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can recite a poem with proper speed and expression but makes occasional mistakes in pronunciation or forgets a word or so.</Remarks>
    <Name>SPEAKING SKILLS</Name>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>Marathi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can recite a poem with proper speed, expression and pronunciation.</Remarks>
    <Name>SPEAKING SKILLS</Name>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>Marathi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can speak simple sentences but takes time to read each word. Lacks fluency, speed and expression.</Remarks>
    <Name>SPEAKING SKILLS</Name>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>Marathi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Carry out a dialogue only at a very basic level.</Remarks>
    <Name>SPEAKING SKILLS</Name>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>Marathi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Is fluent and spontaneous most of the time. Responds to the situation appropriately but fumbles for words occasionally.</Remarks>
    <Name>SPEAKING SKILLS</Name>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>Marathi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can read and pronounce new words on ones own most of the time.</Remarks>
    <Name>WRITING SKILLS</Name>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>Marathi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can read and understand a story or sentences and answer most of the questions correctly.</Remarks>
    <Name>WRITING SKILLS</Name>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>Marathi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can write a few sentences on a given topic but with a lot of prompting and guidance.</Remarks>
    <Name>WRITING SKILLS</Name>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>Marathi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can write sentences accurately and uses simple punctuation marks appropriately.</Remarks>
    <Name>WRITING SKILLS</Name>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>Marathi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can write sentences with a few errors.</Remarks>
    <Name>WRITING SKILLS</Name>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>Marathi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Has not understood the concept of tables. Makes mistakes</Remarks>
    <Name>ASPECTS </Name>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>Mathematics</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Neat and systematic work.</Remarks>
    <Name>ASPECTS </Name>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>Mathematics</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Takes immense delight in working with mathematical problems mentally.</Remarks>
    <Name>ASPECTS </Name>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>Mathematics</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Takes keen interest in various activities</Remarks>
    <Name>ASPECTS </Name>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>Mathematics</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Takes some time to understand new concepts.</Remarks>
    <Name>ASPECTS </Name>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>Mathematics</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Has not understood the concept of tables. Makes mistakes</Remarks>
    <Name>ASPECTS </Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Computers</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Neat and systematic work.</Remarks>
    <Name>ASPECTS </Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Computers</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Takes immense delight in working with mathematical problems mentally.</Remarks>
    <Name>ASPECTS </Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Computers</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Takes keen interest in various activities</Remarks>
    <Name>ASPECTS </Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Computers</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Takes some time to understand new concepts.</Remarks>
    <Name>ASPECTS </Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Computers</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can comprehend oral questions, instructions and stories/poems.</Remarks>
    <Name>LISTENING SKILLS</Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Has difficulty in following instruction and stories. Needs simplification or translation most of the time.</Remarks>
    <Name>LISTENING SKILLS</Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Has some difficulty in comprehending instructions, stories or poems. Needs guidance quite often.</Remarks>
    <Name>LISTENING SKILLS</Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can read and pronounce new words on ones own most of the time.</Remarks>
    <Name>READING SKILLS</Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can read and understand a story or sentences and answer most of the questions correctly.</Remarks>
    <Name>READING SKILLS</Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can read simple sentences but takes time to read each word. Lacks fluency, speed and expression.</Remarks>
    <Name>READING SKILLS</Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can read simple sentences fluently with proper speed, pronunciation and expression.</Remarks>
    <Name>READING SKILLS</Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Cannot comprehend passages on ones own. Often needs help.</Remarks>
    <Name>READING SKILLS</Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can recite a poem with proper speed and expression but makes occasional mistakes in pronunciation or forgets a word or so.</Remarks>
    <Name>SPEAKING SKILLS</Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can recite a poem with proper speed, expression and pronunciation.</Remarks>
    <Name>SPEAKING SKILLS</Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can speak simple sentences but takes time to read each word. Lacks fluency, speed and expression.</Remarks>
    <Name>SPEAKING SKILLS</Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Carry out a dialogue only at a very basic level.</Remarks>
    <Name>SPEAKING SKILLS</Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Is fluent and spontaneous most of the time. Responds to the situation appropriately but fumbles for words occasionally.</Remarks>
    <Name>SPEAKING SKILLS</Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can read and pronounce new words on ones own most of the time.</Remarks>
    <Name>WRITING SKILLS</Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can read and understand a story or sentences and answer most of the questions correctly.</Remarks>
    <Name>WRITING SKILLS</Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can write a few sentences on a given topic but with a lot of prompting and guidance.</Remarks>
    <Name>WRITING SKILLS</Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can write sentences accurately and uses simple punctuation marks appropriately.</Remarks>
    <Name>WRITING SKILLS</Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can write sentences with a few errors.</Remarks>
    <Name>WRITING SKILLS</Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can ask simple questions but with prompting.</Remarks>
    <Name>ASPECTS </Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>EVS</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can do cutting, pasting, drawing and collage work and shows creativity and originality at times.</Remarks>
    <Name>ASPECTS </Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>EVS</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Is keen, alert and observant, very much aware of the surroundings.</Remarks>
    <Name>ASPECTS </Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>EVS</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Needs to be aware of the surroundings.</Remarks>
    <Name>ASPECTS </Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>EVS</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Work is always neat and presentable.</Remarks>
    <Name>ASPECTS </Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>EVS</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can comprehend oral questions, instructions and stories/poems.</Remarks>
    <Name>LISTENING SKILLS</Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Has difficulty in following instruction and stories. Needs simplification or translation most of the time.</Remarks>
    <Name>LISTENING SKILLS</Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Has some difficulty in comprehending instructions, stories or poems. Needs guidance quite often.</Remarks>
    <Name>LISTENING SKILLS</Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can read and pronounce new words on ones own most of the time.</Remarks>
    <Name>READING SKILLS</Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can read and understand a story or sentences and answer most of the questions correctly.</Remarks>
    <Name>READING SKILLS</Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can read simple sentences but takes time to read each word. Lacks fluency, speed and expression.</Remarks>
    <Name>READING SKILLS</Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can read simple sentences fluently with proper speed, pronunciation and expression.</Remarks>
    <Name>READING SKILLS</Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Cannot comprehend passages on ones own. Often needs help.</Remarks>
    <Name>READING SKILLS</Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Student does not follow even on guidance.</Remarks>
    <Name>REGULARITY IN ASSIGNMENTS</Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Student meets few of the expectations on guidance only.</Remarks>
    <Name>REGULARITY IN ASSIGNMENTS</Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Student meets most of the expectations independently.</Remarks>
    <Name>REGULARITY IN ASSIGNMENTS</Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Student meets most of the expectations on guidance only.</Remarks>
    <Name>REGULARITY IN ASSIGNMENTS</Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Student meets some of the expectations occasionally.</Remarks>
    <Name>REGULARITY IN ASSIGNMENTS</Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can recite a poem with proper speed and expression but makes occasional mistakes in pronunciation or forgets a word or so.</Remarks>
    <Name>SPEAKING SKILLS</Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can recite a poem with proper speed, expression and pronunciation.</Remarks>
    <Name>SPEAKING SKILLS</Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can speak simple sentences but takes time to read each word. Lacks fluency, speed and expression.</Remarks>
    <Name>SPEAKING SKILLS</Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Carry out a dialogue only at a very basic level.</Remarks>
    <Name>SPEAKING SKILLS</Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Is fluent and spontaneous most of the time. Responds to the situation appropriately but fumbles for words occasionally.</Remarks>
    <Name>SPEAKING SKILLS</Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can read and pronounce new words on ones own most of the time.</Remarks>
    <Name>WRITING SKILLS</Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can read and understand a story or sentences and answer most of the questions correctly.</Remarks>
    <Name>WRITING SKILLS</Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can write a few sentences on a given topic but with a lot of prompting and guidance.</Remarks>
    <Name>WRITING SKILLS</Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can write sentences accurately and uses simple punctuation marks appropriately.</Remarks>
    <Name>WRITING SKILLS</Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can write sentences with a few errors.</Remarks>
    <Name>WRITING SKILLS</Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can comprehend oral questions, instructions and stories/poems.</Remarks>
    <Name>LISTENING SKILLS</Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Marathi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Has difficulty in following instruction and stories. Needs simplification or translation most of the time.</Remarks>
    <Name>LISTENING SKILLS</Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Marathi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Has some difficulty in comprehending instructions, stories or poems. Needs guidance quite often.</Remarks>
    <Name>LISTENING SKILLS</Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Marathi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can read and pronounce new words on ones own most of the time.</Remarks>
    <Name>READING SKILLS</Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Marathi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can read and understand a story or sentences and answer most of the questions correctly.</Remarks>
    <Name>READING SKILLS</Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Marathi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can read simple sentences but takes time to read each word. Lacks fluency, speed and expression.</Remarks>
    <Name>READING SKILLS</Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Marathi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can read simple sentences fluently with proper speed, pronunciation and expression.</Remarks>
    <Name>READING SKILLS</Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Marathi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Cannot comprehend passages on ones own. Often needs help.</Remarks>
    <Name>READING SKILLS</Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Marathi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Student does not follow even on guidance.</Remarks>
    <Name>REGULARITY IN ASSIGNMENTS</Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Marathi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Student meets few of the expectations on guidance only.</Remarks>
    <Name>REGULARITY IN ASSIGNMENTS</Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Marathi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Student meets most of the expectations independently.</Remarks>
    <Name>REGULARITY IN ASSIGNMENTS</Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Marathi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Student meets most of the expectations on guidance only.</Remarks>
    <Name>REGULARITY IN ASSIGNMENTS</Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Marathi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Student meets some of the expectations occasionally.</Remarks>
    <Name>REGULARITY IN ASSIGNMENTS</Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Marathi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can recite a poem with proper speed and expression but makes occasional mistakes in pronunciation or forgets a word or so.</Remarks>
    <Name>SPEAKING SKILLS</Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Marathi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can recite a poem with proper speed, expression and pronunciation.</Remarks>
    <Name>SPEAKING SKILLS</Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Marathi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can speak simple sentences but takes time to read each word. Lacks fluency, speed and expression.</Remarks>
    <Name>SPEAKING SKILLS</Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Marathi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Carry out a dialogue only at a very basic level.</Remarks>
    <Name>SPEAKING SKILLS</Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Marathi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Is fluent and spontaneous most of the time. Responds to the situation appropriately but fumbles for words occasionally.</Remarks>
    <Name>SPEAKING SKILLS</Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Marathi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can read and pronounce new words on ones own most of the time.</Remarks>
    <Name>WRITING SKILLS</Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Marathi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can read and understand a story or sentences and answer most of the questions correctly.</Remarks>
    <Name>WRITING SKILLS</Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Marathi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can write a few sentences on a given topic but with a lot of prompting and guidance.</Remarks>
    <Name>WRITING SKILLS</Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Marathi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can write sentences accurately and uses simple punctuation marks appropriately.</Remarks>
    <Name>WRITING SKILLS</Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Marathi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can write sentences with a few errors.</Remarks>
    <Name>WRITING SKILLS</Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Marathi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Has not understood the concept of tables. Makes mistakes</Remarks>
    <Name>ASPECTS </Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Mathematics</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Neat and systematic work.</Remarks>
    <Name>ASPECTS </Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Mathematics</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Takes immense delight in working with mathematical problems mentally.</Remarks>
    <Name>ASPECTS </Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Mathematics</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Takes keen interest in various activities</Remarks>
    <Name>ASPECTS </Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Mathematics</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Takes some time to understand new concepts.</Remarks>
    <Name>ASPECTS </Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Mathematics</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can comprehend oral questions, instructions and stories/poems.</Remarks>
    <Name>LISTENING SKILLS</Name>
    <Standard_Name>Junior KG</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Has difficulty in following instruction and stories. Needs simplification or translation most of the time.</Remarks>
    <Name>LISTENING SKILLS</Name>
    <Standard_Name>Junior KG</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Has some difficulty in comprehending instructions, stories or poems. Needs guidance quite often.</Remarks>
    <Name>LISTENING SKILLS</Name>
    <Standard_Name>Junior KG</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can read and pronounce new words on ones own most of the time.</Remarks>
    <Name>READING SKILLS</Name>
    <Standard_Name>Junior KG</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can read and understand a story or sentences and answer most of the questions correctly.</Remarks>
    <Name>READING SKILLS</Name>
    <Standard_Name>Junior KG</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can read simple sentences but takes time to read each word. Lacks fluency, speed and expression.</Remarks>
    <Name>READING SKILLS</Name>
    <Standard_Name>Junior KG</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can read simple sentences fluently with proper speed, pronunciation and expression.</Remarks>
    <Name>READING SKILLS</Name>
    <Standard_Name>Junior KG</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Cannot comprehend passages on ones own. Often needs help.</Remarks>
    <Name>READING SKILLS</Name>
    <Standard_Name>Junior KG</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can recite a poem with proper speed and expression but makes occasional mistakes in pronunciation or forgets a word or so.</Remarks>
    <Name>SPEAKING SKILLS</Name>
    <Standard_Name>Junior KG</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can recite a poem with proper speed, expression and pronunciation.</Remarks>
    <Name>SPEAKING SKILLS</Name>
    <Standard_Name>Junior KG</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can speak simple sentences but takes time to read each word. Lacks fluency, speed and expression.</Remarks>
    <Name>SPEAKING SKILLS</Name>
    <Standard_Name>Junior KG</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Carry out a dialogue only at a very basic level.</Remarks>
    <Name>SPEAKING SKILLS</Name>
    <Standard_Name>Junior KG</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Is fluent and spontaneous most of the time. Responds to the situation appropriately but fumbles for words occasionally.</Remarks>
    <Name>SPEAKING SKILLS</Name>
    <Standard_Name>Junior KG</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can read and pronounce new words on ones own most of the time.</Remarks>
    <Name>WRITING SKILLS</Name>
    <Standard_Name>Junior KG</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can read and understand a story or sentences and answer most of the questions correctly.</Remarks>
    <Name>WRITING SKILLS</Name>
    <Standard_Name>Junior KG</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can write a few sentences on a given topic but with a lot of prompting and guidance.</Remarks>
    <Name>WRITING SKILLS</Name>
    <Standard_Name>Junior KG</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can write sentences accurately and uses simple punctuation marks appropriately.</Remarks>
    <Name>WRITING SKILLS</Name>
    <Standard_Name>Junior KG</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can write sentences with a few errors.</Remarks>
    <Name>WRITING SKILLS</Name>
    <Standard_Name>Junior KG</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can ask simple questions but with prompting.</Remarks>
    <Name>ASPECTS </Name>
    <Standard_Name>Junior KG</Standard_Name>
    <Subject_Name>EVS</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can do cutting, pasting, drawing and collage work and shows creativity and originality at times.</Remarks>
    <Name>ASPECTS </Name>
    <Standard_Name>Junior KG</Standard_Name>
    <Subject_Name>EVS</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Is keen, alert and observant, very much aware of the surroundings.</Remarks>
    <Name>ASPECTS </Name>
    <Standard_Name>Junior KG</Standard_Name>
    <Subject_Name>EVS</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Needs to be aware of the surroundings.</Remarks>
    <Name>ASPECTS </Name>
    <Standard_Name>Junior KG</Standard_Name>
    <Subject_Name>EVS</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Work is always neat and presentable.</Remarks>
    <Name>ASPECTS </Name>
    <Standard_Name>Junior KG</Standard_Name>
    <Subject_Name>EVS</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can comprehend oral questions, instructions and stories/poems.</Remarks>
    <Name>LISTENING SKILLS</Name>
    <Standard_Name>Junior KG</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Has difficulty in following instruction and stories. Needs simplification or translation most of the time.</Remarks>
    <Name>LISTENING SKILLS</Name>
    <Standard_Name>Junior KG</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Has some difficulty in comprehending instructions, stories or poems. Needs guidance quite often.</Remarks>
    <Name>LISTENING SKILLS</Name>
    <Standard_Name>Junior KG</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can read and pronounce new words on ones own most of the time.</Remarks>
    <Name>READING SKILLS</Name>
    <Standard_Name>Junior KG</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can read and understand a story or sentences and answer most of the questions correctly.</Remarks>
    <Name>READING SKILLS</Name>
    <Standard_Name>Junior KG</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can read simple sentences but takes time to read each word. Lacks fluency, speed and expression.</Remarks>
    <Name>READING SKILLS</Name>
    <Standard_Name>Junior KG</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can read simple sentences fluently with proper speed, pronunciation and expression.</Remarks>
    <Name>READING SKILLS</Name>
    <Standard_Name>Junior KG</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Cannot comprehend passages on ones own. Often needs help.</Remarks>
    <Name>READING SKILLS</Name>
    <Standard_Name>Junior KG</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Student does not follow even on guidance.</Remarks>
    <Name>REGULARITY IN ASSIGNMENTS</Name>
    <Standard_Name>Junior KG</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Student meets few of the expectations on guidance only.</Remarks>
    <Name>REGULARITY IN ASSIGNMENTS</Name>
    <Standard_Name>Junior KG</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Student meets most of the expectations independently.</Remarks>
    <Name>REGULARITY IN ASSIGNMENTS</Name>
    <Standard_Name>Junior KG</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Student meets most of the expectations on guidance only.</Remarks>
    <Name>REGULARITY IN ASSIGNMENTS</Name>
    <Standard_Name>Junior KG</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Student meets some of the expectations occasionally.</Remarks>
    <Name>REGULARITY IN ASSIGNMENTS</Name>
    <Standard_Name>Junior KG</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can recite a poem with proper speed and expression but makes occasional mistakes in pronunciation or forgets a word or so.</Remarks>
    <Name>SPEAKING SKILLS</Name>
    <Standard_Name>Junior KG</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can recite a poem with proper speed, expression and pronunciation.</Remarks>
    <Name>SPEAKING SKILLS</Name>
    <Standard_Name>Junior KG</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can speak simple sentences but takes time to read each word. Lacks fluency, speed and expression.</Remarks>
    <Name>SPEAKING SKILLS</Name>
    <Standard_Name>Junior KG</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Carry out a dialogue only at a very basic level.</Remarks>
    <Name>SPEAKING SKILLS</Name>
    <Standard_Name>Junior KG</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Is fluent and spontaneous most of the time. Responds to the situation appropriately but fumbles for words occasionally.</Remarks>
    <Name>SPEAKING SKILLS</Name>
    <Standard_Name>Junior KG</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can read and pronounce new words on ones own most of the time.</Remarks>
    <Name>WRITING SKILLS</Name>
    <Standard_Name>Junior KG</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can read and understand a story or sentences and answer most of the questions correctly.</Remarks>
    <Name>WRITING SKILLS</Name>
    <Standard_Name>Junior KG</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can write a few sentences on a given topic but with a lot of prompting and guidance.</Remarks>
    <Name>WRITING SKILLS</Name>
    <Standard_Name>Junior KG</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can write sentences accurately and uses simple punctuation marks appropriately.</Remarks>
    <Name>WRITING SKILLS</Name>
    <Standard_Name>Junior KG</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can write sentences with a few errors.</Remarks>
    <Name>WRITING SKILLS</Name>
    <Standard_Name>Junior KG</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Has not understood the concept of tables. Makes mistakes</Remarks>
    <Name>ASPECTS </Name>
    <Standard_Name>Junior KG</Standard_Name>
    <Subject_Name>Mathematics</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Neat and systematic work.</Remarks>
    <Name>ASPECTS </Name>
    <Standard_Name>Junior KG</Standard_Name>
    <Subject_Name>Mathematics</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Takes immense delight in working with mathematical problems mentally.</Remarks>
    <Name>ASPECTS </Name>
    <Standard_Name>Junior KG</Standard_Name>
    <Subject_Name>Mathematics</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Takes keen interest in various activities</Remarks>
    <Name>ASPECTS </Name>
    <Standard_Name>Junior KG</Standard_Name>
    <Subject_Name>Mathematics</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Takes some time to understand new concepts.</Remarks>
    <Name>ASPECTS </Name>
    <Standard_Name>Junior KG</Standard_Name>
    <Subject_Name>Mathematics</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can comprehend oral questions, instructions and stories/poems.</Remarks>
    <Name>LISTENING SKILLS</Name>
    <Standard_Name>Nursery</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Has difficulty in following instruction and stories. Needs simplification or translation most of the time.</Remarks>
    <Name>LISTENING SKILLS</Name>
    <Standard_Name>Nursery</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Has some difficulty in comprehending instructions, stories or poems. Needs guidance quite often.</Remarks>
    <Name>LISTENING SKILLS</Name>
    <Standard_Name>Nursery</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can read and pronounce new words on ones own most of the time.</Remarks>
    <Name>READING SKILLS</Name>
    <Standard_Name>Nursery</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can read and understand a story or sentences and answer most of the questions correctly.</Remarks>
    <Name>READING SKILLS</Name>
    <Standard_Name>Nursery</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can read simple sentences but takes time to read each word. Lacks fluency, speed and expression.</Remarks>
    <Name>READING SKILLS</Name>
    <Standard_Name>Nursery</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can read simple sentences fluently with proper speed, pronunciation and expression.</Remarks>
    <Name>READING SKILLS</Name>
    <Standard_Name>Nursery</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Cannot comprehend passages on ones own. Often needs help.</Remarks>
    <Name>READING SKILLS</Name>
    <Standard_Name>Nursery</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can recite a poem with proper speed and expression but makes occasional mistakes in pronunciation or forgets a word or so.</Remarks>
    <Name>SPEAKING SKILLS</Name>
    <Standard_Name>Nursery</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can recite a poem with proper speed, expression and pronunciation.</Remarks>
    <Name>SPEAKING SKILLS</Name>
    <Standard_Name>Nursery</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can speak simple sentences but takes time to read each word. Lacks fluency, speed and expression.</Remarks>
    <Name>SPEAKING SKILLS</Name>
    <Standard_Name>Nursery</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Carry out a dialogue only at a very basic level.</Remarks>
    <Name>SPEAKING SKILLS</Name>
    <Standard_Name>Nursery</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Is fluent and spontaneous most of the time. Responds to the situation appropriately but fumbles for words occasionally.</Remarks>
    <Name>SPEAKING SKILLS</Name>
    <Standard_Name>Nursery</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can read and pronounce new words on ones own most of the time.</Remarks>
    <Name>WRITING SKILLS</Name>
    <Standard_Name>Nursery</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can read and understand a story or sentences and answer most of the questions correctly.</Remarks>
    <Name>WRITING SKILLS</Name>
    <Standard_Name>Nursery</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can write a few sentences on a given topic but with a lot of prompting and guidance.</Remarks>
    <Name>WRITING SKILLS</Name>
    <Standard_Name>Nursery</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can write sentences accurately and uses simple punctuation marks appropriately.</Remarks>
    <Name>WRITING SKILLS</Name>
    <Standard_Name>Nursery</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can write sentences with a few errors.</Remarks>
    <Name>WRITING SKILLS</Name>
    <Standard_Name>Nursery</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can ask simple questions but with prompting.</Remarks>
    <Name>ASPECTS </Name>
    <Standard_Name>Nursery</Standard_Name>
    <Subject_Name>EVS</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can do cutting, pasting, drawing and collage work and shows creativity and originality at times.</Remarks>
    <Name>ASPECTS </Name>
    <Standard_Name>Nursery</Standard_Name>
    <Subject_Name>EVS</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Is keen, alert and observant, very much aware of the surroundings.</Remarks>
    <Name>ASPECTS </Name>
    <Standard_Name>Nursery</Standard_Name>
    <Subject_Name>EVS</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Needs to be aware of the surroundings.</Remarks>
    <Name>ASPECTS </Name>
    <Standard_Name>Nursery</Standard_Name>
    <Subject_Name>EVS</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Work is always neat and presentable.</Remarks>
    <Name>ASPECTS </Name>
    <Standard_Name>Nursery</Standard_Name>
    <Subject_Name>EVS</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can comprehend oral questions, instructions and stories/poems.</Remarks>
    <Name>LISTENING SKILLS</Name>
    <Standard_Name>Nursery</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Has difficulty in following instruction and stories. Needs simplification or translation most of the time.</Remarks>
    <Name>LISTENING SKILLS</Name>
    <Standard_Name>Nursery</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Has some difficulty in comprehending instructions, stories or poems. Needs guidance quite often.</Remarks>
    <Name>LISTENING SKILLS</Name>
    <Standard_Name>Nursery</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can read and pronounce new words on ones own most of the time.</Remarks>
    <Name>READING SKILLS</Name>
    <Standard_Name>Nursery</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can read and understand a story or sentences and answer most of the questions correctly.</Remarks>
    <Name>READING SKILLS</Name>
    <Standard_Name>Nursery</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can read simple sentences but takes time to read each word. Lacks fluency, speed and expression.</Remarks>
    <Name>READING SKILLS</Name>
    <Standard_Name>Nursery</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can read simple sentences fluently with proper speed, pronunciation and expression.</Remarks>
    <Name>READING SKILLS</Name>
    <Standard_Name>Nursery</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Cannot comprehend passages on ones own. Often needs help.</Remarks>
    <Name>READING SKILLS</Name>
    <Standard_Name>Nursery</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Student does not follow even on guidance.</Remarks>
    <Name>REGULARITY IN ASSIGNMENTS</Name>
    <Standard_Name>Nursery</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Student meets few of the expectations on guidance only.</Remarks>
    <Name>REGULARITY IN ASSIGNMENTS</Name>
    <Standard_Name>Nursery</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Student meets most of the expectations independently.</Remarks>
    <Name>REGULARITY IN ASSIGNMENTS</Name>
    <Standard_Name>Nursery</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Student meets most of the expectations on guidance only.</Remarks>
    <Name>REGULARITY IN ASSIGNMENTS</Name>
    <Standard_Name>Nursery</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Student meets some of the expectations occasionally.</Remarks>
    <Name>REGULARITY IN ASSIGNMENTS</Name>
    <Standard_Name>Nursery</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can recite a poem with proper speed and expression but makes occasional mistakes in pronunciation or forgets a word or so.</Remarks>
    <Name>SPEAKING SKILLS</Name>
    <Standard_Name>Nursery</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can recite a poem with proper speed, expression and pronunciation.</Remarks>
    <Name>SPEAKING SKILLS</Name>
    <Standard_Name>Nursery</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can speak simple sentences but takes time to read each word. Lacks fluency, speed and expression.</Remarks>
    <Name>SPEAKING SKILLS</Name>
    <Standard_Name>Nursery</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Carry out a dialogue only at a very basic level.</Remarks>
    <Name>SPEAKING SKILLS</Name>
    <Standard_Name>Nursery</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Is fluent and spontaneous most of the time. Responds to the situation appropriately but fumbles for words occasionally.</Remarks>
    <Name>SPEAKING SKILLS</Name>
    <Standard_Name>Nursery</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can read and pronounce new words on ones own most of the time.</Remarks>
    <Name>WRITING SKILLS</Name>
    <Standard_Name>Nursery</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can read and understand a story or sentences and answer most of the questions correctly.</Remarks>
    <Name>WRITING SKILLS</Name>
    <Standard_Name>Nursery</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can write a few sentences on a given topic but with a lot of prompting and guidance.</Remarks>
    <Name>WRITING SKILLS</Name>
    <Standard_Name>Nursery</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can write sentences accurately and uses simple punctuation marks appropriately.</Remarks>
    <Name>WRITING SKILLS</Name>
    <Standard_Name>Nursery</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can write sentences with a few errors.</Remarks>
    <Name>WRITING SKILLS</Name>
    <Standard_Name>Nursery</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Has not understood the concept of tables. Makes mistakes</Remarks>
    <Name>ASPECTS </Name>
    <Standard_Name>Nursery</Standard_Name>
    <Subject_Name>Mathematics</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Neat and systematic work.</Remarks>
    <Name>ASPECTS </Name>
    <Standard_Name>Nursery</Standard_Name>
    <Subject_Name>Mathematics</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Takes immense delight in working with mathematical problems mentally.</Remarks>
    <Name>ASPECTS </Name>
    <Standard_Name>Nursery</Standard_Name>
    <Subject_Name>Mathematics</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Takes keen interest in various activities</Remarks>
    <Name>ASPECTS </Name>
    <Standard_Name>Nursery</Standard_Name>
    <Subject_Name>Mathematics</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Takes some time to understand new concepts.</Remarks>
    <Name>ASPECTS </Name>
    <Standard_Name>Nursery</Standard_Name>
    <Subject_Name>Mathematics</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can comprehend oral questions, instructions and stories/poems.</Remarks>
    <Name>LISTENING SKILLS</Name>
    <Standard_Name>Senior KG</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Has difficulty in following instruction and stories. Needs simplification or translation most of the time.</Remarks>
    <Name>LISTENING SKILLS</Name>
    <Standard_Name>Senior KG</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Has some difficulty in comprehending instructions, stories or poems. Needs guidance quite often.</Remarks>
    <Name>LISTENING SKILLS</Name>
    <Standard_Name>Senior KG</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can read and pronounce new words on ones own most of the time.</Remarks>
    <Name>READING SKILLS</Name>
    <Standard_Name>Senior KG</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can read and understand a story or sentences and answer most of the questions correctly.</Remarks>
    <Name>READING SKILLS</Name>
    <Standard_Name>Senior KG</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can read simple sentences but takes time to read each word. Lacks fluency, speed and expression.</Remarks>
    <Name>READING SKILLS</Name>
    <Standard_Name>Senior KG</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can read simple sentences fluently with proper speed, pronunciation and expression.</Remarks>
    <Name>READING SKILLS</Name>
    <Standard_Name>Senior KG</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Cannot comprehend passages on ones own. Often needs help.</Remarks>
    <Name>READING SKILLS</Name>
    <Standard_Name>Senior KG</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can recite a poem with proper speed and expression but makes occasional mistakes in pronunciation or forgets a word or so.</Remarks>
    <Name>SPEAKING SKILLS</Name>
    <Standard_Name>Senior KG</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can recite a poem with proper speed, expression and pronunciation.</Remarks>
    <Name>SPEAKING SKILLS</Name>
    <Standard_Name>Senior KG</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can speak simple sentences but takes time to read each word. Lacks fluency, speed and expression.</Remarks>
    <Name>SPEAKING SKILLS</Name>
    <Standard_Name>Senior KG</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Carry out a dialogue only at a very basic level.</Remarks>
    <Name>SPEAKING SKILLS</Name>
    <Standard_Name>Senior KG</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Is fluent and spontaneous most of the time. Responds to the situation appropriately but fumbles for words occasionally.</Remarks>
    <Name>SPEAKING SKILLS</Name>
    <Standard_Name>Senior KG</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can read and pronounce new words on ones own most of the time.</Remarks>
    <Name>WRITING SKILLS</Name>
    <Standard_Name>Senior KG</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can read and understand a story or sentences and answer most of the questions correctly.</Remarks>
    <Name>WRITING SKILLS</Name>
    <Standard_Name>Senior KG</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can write a few sentences on a given topic but with a lot of prompting and guidance.</Remarks>
    <Name>WRITING SKILLS</Name>
    <Standard_Name>Senior KG</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can write sentences accurately and uses simple punctuation marks appropriately.</Remarks>
    <Name>WRITING SKILLS</Name>
    <Standard_Name>Senior KG</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can write sentences with a few errors.</Remarks>
    <Name>WRITING SKILLS</Name>
    <Standard_Name>Senior KG</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can ask simple questions but with prompting.</Remarks>
    <Name>ASPECTS </Name>
    <Standard_Name>Senior KG</Standard_Name>
    <Subject_Name>EVS</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can do cutting, pasting, drawing and collage work and shows creativity and originality at times.</Remarks>
    <Name>ASPECTS </Name>
    <Standard_Name>Senior KG</Standard_Name>
    <Subject_Name>EVS</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Is keen, alert and observant, very much aware of the surroundings.</Remarks>
    <Name>ASPECTS </Name>
    <Standard_Name>Senior KG</Standard_Name>
    <Subject_Name>EVS</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Needs to be aware of the surroundings.</Remarks>
    <Name>ASPECTS </Name>
    <Standard_Name>Senior KG</Standard_Name>
    <Subject_Name>EVS</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Work is always neat and presentable.</Remarks>
    <Name>ASPECTS </Name>
    <Standard_Name>Senior KG</Standard_Name>
    <Subject_Name>EVS</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can comprehend oral questions, instructions and stories/poems.</Remarks>
    <Name>LISTENING SKILLS</Name>
    <Standard_Name>Senior KG</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Has difficulty in following instruction and stories. Needs simplification or translation most of the time.</Remarks>
    <Name>LISTENING SKILLS</Name>
    <Standard_Name>Senior KG</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Has some difficulty in comprehending instructions, stories or poems. Needs guidance quite often.</Remarks>
    <Name>LISTENING SKILLS</Name>
    <Standard_Name>Senior KG</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can read and pronounce new words on ones own most of the time.</Remarks>
    <Name>READING SKILLS</Name>
    <Standard_Name>Senior KG</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can read and understand a story or sentences and answer most of the questions correctly.</Remarks>
    <Name>READING SKILLS</Name>
    <Standard_Name>Senior KG</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can read simple sentences but takes time to read each word. Lacks fluency, speed and expression.</Remarks>
    <Name>READING SKILLS</Name>
    <Standard_Name>Senior KG</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can read simple sentences fluently with proper speed, pronunciation and expression.</Remarks>
    <Name>READING SKILLS</Name>
    <Standard_Name>Senior KG</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Cannot comprehend passages on ones own. Often needs help.</Remarks>
    <Name>READING SKILLS</Name>
    <Standard_Name>Senior KG</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Student does not follow even on guidance.</Remarks>
    <Name>REGULARITY IN ASSIGNMENTS</Name>
    <Standard_Name>Senior KG</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Student meets few of the expectations on guidance only.</Remarks>
    <Name>REGULARITY IN ASSIGNMENTS</Name>
    <Standard_Name>Senior KG</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Student meets most of the expectations independently.</Remarks>
    <Name>REGULARITY IN ASSIGNMENTS</Name>
    <Standard_Name>Senior KG</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Student meets most of the expectations on guidance only.</Remarks>
    <Name>REGULARITY IN ASSIGNMENTS</Name>
    <Standard_Name>Senior KG</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Student meets some of the expectations occasionally.</Remarks>
    <Name>REGULARITY IN ASSIGNMENTS</Name>
    <Standard_Name>Senior KG</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can recite a poem with proper speed and expression but makes occasional mistakes in pronunciation or forgets a word or so.</Remarks>
    <Name>SPEAKING SKILLS</Name>
    <Standard_Name>Senior KG</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can recite a poem with proper speed, expression and pronunciation.</Remarks>
    <Name>SPEAKING SKILLS</Name>
    <Standard_Name>Senior KG</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can speak simple sentences but takes time to read each word. Lacks fluency, speed and expression.</Remarks>
    <Name>SPEAKING SKILLS</Name>
    <Standard_Name>Senior KG</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Carry out a dialogue only at a very basic level.</Remarks>
    <Name>SPEAKING SKILLS</Name>
    <Standard_Name>Senior KG</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Is fluent and spontaneous most of the time. Responds to the situation appropriately but fumbles for words occasionally.</Remarks>
    <Name>SPEAKING SKILLS</Name>
    <Standard_Name>Senior KG</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can read and pronounce new words on ones own most of the time.</Remarks>
    <Name>WRITING SKILLS</Name>
    <Standard_Name>Senior KG</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can read and understand a story or sentences and answer most of the questions correctly.</Remarks>
    <Name>WRITING SKILLS</Name>
    <Standard_Name>Senior KG</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can write a few sentences on a given topic but with a lot of prompting and guidance.</Remarks>
    <Name>WRITING SKILLS</Name>
    <Standard_Name>Senior KG</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can write sentences accurately and uses simple punctuation marks appropriately.</Remarks>
    <Name>WRITING SKILLS</Name>
    <Standard_Name>Senior KG</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Can write sentences with a few errors.</Remarks>
    <Name>WRITING SKILLS</Name>
    <Standard_Name>Senior KG</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Has not understood the concept of tables. Makes mistakes</Remarks>
    <Name>ASPECTS </Name>
    <Standard_Name>Senior KG</Standard_Name>
    <Subject_Name>Mathematics</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Neat and systematic work.</Remarks>
    <Name>ASPECTS </Name>
    <Standard_Name>Senior KG</Standard_Name>
    <Subject_Name>Mathematics</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Student meets most of the expectations independently.</Remarks>
    <Name>REGULARITY IN ASSIGNMENTS</Name>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Student meets most of the expectations on guidance only.</Remarks>
    <Name>REGULARITY IN ASSIGNMENTS</Name>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Student meets some of the expectations occasionally.</Remarks>
    <Name>REGULARITY IN ASSIGNMENTS</Name>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Student meets most of the expectations independently.</Remarks>
    <Name>REGULARITY IN ASSIGNMENTS</Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Student meets most of the expectations on guidance only.</Remarks>
    <Name>REGULARITY IN ASSIGNMENTS</Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Student meets some of the expectations occasionally.</Remarks>
    <Name>REGULARITY IN ASSIGNMENTS</Name>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Student meets most of the expectations independently.</Remarks>
    <Name>REGULARITY IN ASSIGNMENTS</Name>
    <Standard_Name>Junior KG</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Student meets most of the expectations on guidance only.</Remarks>
    <Name>REGULARITY IN ASSIGNMENTS</Name>
    <Standard_Name>Junior KG</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Student meets some of the expectations occasionally.</Remarks>
    <Name>REGULARITY IN ASSIGNMENTS</Name>
    <Standard_Name>Junior KG</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Student meets most of the expectations independently.</Remarks>
    <Name>REGULARITY IN ASSIGNMENTS</Name>
    <Standard_Name>Nursery</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Student meets most of the expectations on guidance only.</Remarks>
    <Name>REGULARITY IN ASSIGNMENTS</Name>
    <Standard_Name>Nursery</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Student meets some of the expectations occasionally.</Remarks>
    <Name>REGULARITY IN ASSIGNMENTS</Name>
    <Standard_Name>Nursery</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Student meets most of the expectations independently.</Remarks>
    <Name>REGULARITY IN ASSIGNMENTS</Name>
    <Standard_Name>Senior KG</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Student meets most of the expectations on guidance only.</Remarks>
    <Name>REGULARITY IN ASSIGNMENTS</Name>
    <Standard_Name>Senior KG</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
  <Remarks>
    <Remarks>Student meets some of the expectations occasionally.</Remarks>
    <Name>REGULARITY IN ASSIGNMENTS</Name>
    <Standard_Name>Senior KG</Standard_Name>
    <Subject_Name>English</Subject_Name>
  </Remarks>
</Remarks>'


DECLARE @tempSkillWiseRemarks TABLE
(
    Remarks         NVARCHAR(1000),
    SkillName       NVARCHAR(300),
    StandardName    NVARCHAR(100),
    SubjectName     NVARCHAR(200)
);

INSERT INTO @tempSkillWiseRemarks
(
    Remarks,
    SkillName,
    StandardName,
    SubjectName
)
SELECT
    T.c.value('(Remarks)[1]', 'NVARCHAR(1000)'),
    T.c.value('(Name)[1]', 'NVARCHAR(300)'),
    T.c.value('(Standard_Name)[1]', 'NVARCHAR(100)'),
    T.c.value('(Subject_Name)[1]', 'NVARCHAR(200)')
FROM @SkillWiseRemarks.nodes('/Remarks/Remarks') T(c);


INSERT INTO SkillWiseRemarks
(
    SkillId,
    Remarks,
    IsDeleted,
    ParameterId,
    GradeId
)
SELECT
    OS.Id AS SkillId,
    T.Remarks,
    0 AS IsDeleted,
    Null,
    NUll
FROM @tempSkillWiseRemarks T

INNER JOIN Standard_Master SM
    ON SM.Standard_Name = T.StandardName
   AND SM.Academic_Year_Id = 1
   AND SM.School_Id = @SchoolId
   AND SM.Is_Deleted = 'N'
INNER JOIN Subject_Master SUB
    ON SUB.Subject_Name = T.SubjectName
   AND SUB.Is_Deleted = 'N'
INNER JOIN ObservationSkills OS
    ON OS.Name = T.SkillName
   AND OS.StandardId = SM.Standard_Id
   AND OS.SubjectId = SUB.Subject_Id
   AND OS.SchoolId = @SchoolId
   AND OS.AcademicYearId = 1
   AND OS.IsDeleted = 0

