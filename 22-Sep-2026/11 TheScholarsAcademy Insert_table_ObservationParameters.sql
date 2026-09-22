Declare @SchoolId int
Select @SchoolId=SchoolId from SchoolSettings 

DECLARE @ObservationParameters XML = '
<Parameter>
  <Parameter>
    <Parameter>Pronunciation</Parameter>
    <Name>READING SKILLS</Name>
    <SortOrder>1</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>Nursery</Standard_Name>
    <Subject_Name>English</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Pronunciation</Parameter>
    <Name>READING SKILLS</Name>
    <SortOrder>1</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>Junior KG</Standard_Name>
    <Subject_Name>English</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Pronunciation</Parameter>
    <Name>READING SKILLS</Name>
    <SortOrder>1</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>English</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Pronunciation</Parameter>
    <Name>READING SKILLS</Name>
    <SortOrder>1</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>English</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Pronunciation</Parameter>
    <Name>READING SKILLS</Name>
    <SortOrder>1</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>Senior KG</Standard_Name>
    <Subject_Name>English</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Fluency</Parameter>
    <Name>READING SKILLS</Name>
    <SortOrder>2</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>Nursery</Standard_Name>
    <Subject_Name>English</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Fluency</Parameter>
    <Name>READING SKILLS</Name>
    <SortOrder>2</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>Junior KG</Standard_Name>
    <Subject_Name>English</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Fluency</Parameter>
    <Name>READING SKILLS</Name>
    <SortOrder>2</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>English</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Fluency</Parameter>
    <Name>READING SKILLS</Name>
    <SortOrder>2</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>English</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Fluency</Parameter>
    <Name>READING SKILLS</Name>
    <SortOrder>2</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>Senior KG</Standard_Name>
    <Subject_Name>English</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Comprehension</Parameter>
    <Name>READING SKILLS</Name>
    <SortOrder>3</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>Nursery</Standard_Name>
    <Subject_Name>English</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Comprehension</Parameter>
    <Name>READING SKILLS</Name>
    <SortOrder>3</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>Junior KG</Standard_Name>
    <Subject_Name>English</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Comprehension</Parameter>
    <Name>READING SKILLS</Name>
    <SortOrder>3</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>English</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Comprehension</Parameter>
    <Name>READING SKILLS</Name>
    <SortOrder>3</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>English</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Comprehension</Parameter>
    <Name>READING SKILLS</Name>
    <SortOrder>3</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>Senior KG</Standard_Name>
    <Subject_Name>English</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Creative Writing</Parameter>
    <Name>WRITING SKILLS</Name>
    <SortOrder>1</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>Nursery</Standard_Name>
    <Subject_Name>English</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Creative Writing</Parameter>
    <Name>WRITING SKILLS</Name>
    <SortOrder>1</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>English</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Creative Writing</Parameter>
    <Name>WRITING SKILLS</Name>
    <SortOrder>1</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>English</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Creative Writing</Parameter>
    <Name>WRITING SKILLS</Name>
    <SortOrder>1</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>Junior KG</Standard_Name>
    <Subject_Name>English</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Creative Writing</Parameter>
    <Name>WRITING SKILLS</Name>
    <SortOrder>1</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>Senior KG</Standard_Name>
    <Subject_Name>English</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Handwriting</Parameter>
    <Name>WRITING SKILLS</Name>
    <SortOrder>2</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>Nursery</Standard_Name>
    <Subject_Name>English</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Handwriting</Parameter>
    <Name>WRITING SKILLS</Name>
    <SortOrder>2</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>English</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Handwriting</Parameter>
    <Name>WRITING SKILLS</Name>
    <SortOrder>2</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>English</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Handwriting</Parameter>
    <Name>WRITING SKILLS</Name>
    <SortOrder>2</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>Junior KG</Standard_Name>
    <Subject_Name>English</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Handwriting</Parameter>
    <Name>WRITING SKILLS</Name>
    <SortOrder>2</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>Senior KG</Standard_Name>
    <Subject_Name>English</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Grammar</Parameter>
    <Name>WRITING SKILLS</Name>
    <SortOrder>3</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>Nursery</Standard_Name>
    <Subject_Name>English</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Grammar</Parameter>
    <Name>WRITING SKILLS</Name>
    <SortOrder>3</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>English</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Grammar</Parameter>
    <Name>WRITING SKILLS</Name>
    <SortOrder>3</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>English</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Grammar</Parameter>
    <Name>WRITING SKILLS</Name>
    <SortOrder>3</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>Junior KG</Standard_Name>
    <Subject_Name>English</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Grammar</Parameter>
    <Name>WRITING SKILLS</Name>
    <SortOrder>3</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>Senior KG</Standard_Name>
    <Subject_Name>English</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Spellings</Parameter>
    <Name>WRITING SKILLS</Name>
    <SortOrder>4</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>Nursery</Standard_Name>
    <Subject_Name>English</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Spellings</Parameter>
    <Name>WRITING SKILLS</Name>
    <SortOrder>4</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>English</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Spellings</Parameter>
    <Name>WRITING SKILLS</Name>
    <SortOrder>4</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>English</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Spellings</Parameter>
    <Name>WRITING SKILLS</Name>
    <SortOrder>4</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>Junior KG</Standard_Name>
    <Subject_Name>English</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Spellings</Parameter>
    <Name>WRITING SKILLS</Name>
    <SortOrder>4</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>Senior KG</Standard_Name>
    <Subject_Name>English</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Vocabulary</Parameter>
    <Name>WRITING SKILLS</Name>
    <SortOrder>5</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>Nursery</Standard_Name>
    <Subject_Name>English</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Vocabulary</Parameter>
    <Name>WRITING SKILLS</Name>
    <SortOrder>5</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>English</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Vocabulary</Parameter>
    <Name>WRITING SKILLS</Name>
    <SortOrder>5</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>English</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Vocabulary</Parameter>
    <Name>WRITING SKILLS</Name>
    <SortOrder>5</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>Junior KG</Standard_Name>
    <Subject_Name>English</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Vocabulary</Parameter>
    <Name>WRITING SKILLS</Name>
    <SortOrder>5</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>Senior KG</Standard_Name>
    <Subject_Name>English</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Story Telling</Parameter>
    <Name>SPEAKING SKILLS</Name>
    <SortOrder>1</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>Nursery</Standard_Name>
    <Subject_Name>English</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Story Telling</Parameter>
    <Name>SPEAKING SKILLS</Name>
    <SortOrder>1</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>English</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Story Telling</Parameter>
    <Name>SPEAKING SKILLS</Name>
    <SortOrder>1</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>Senior KG</Standard_Name>
    <Subject_Name>English</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Story Telling</Parameter>
    <Name>SPEAKING SKILLS</Name>
    <SortOrder>1</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>English</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Story Telling</Parameter>
    <Name>SPEAKING SKILLS</Name>
    <SortOrder>1</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>Junior KG</Standard_Name>
    <Subject_Name>English</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Poem Recitation</Parameter>
    <Name>SPEAKING SKILLS</Name>
    <SortOrder>2</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>Nursery</Standard_Name>
    <Subject_Name>English</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Poem Recitation</Parameter>
    <Name>SPEAKING SKILLS</Name>
    <SortOrder>2</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>English</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Poem Recitation</Parameter>
    <Name>SPEAKING SKILLS</Name>
    <SortOrder>2</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>Senior KG</Standard_Name>
    <Subject_Name>English</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Poem Recitation</Parameter>
    <Name>SPEAKING SKILLS</Name>
    <SortOrder>2</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>English</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Poem Recitation</Parameter>
    <Name>SPEAKING SKILLS</Name>
    <SortOrder>2</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>Junior KG</Standard_Name>
    <Subject_Name>English</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Grammar</Parameter>
    <Name>SPEAKING SKILLS</Name>
    <SortOrder>3</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>Nursery</Standard_Name>
    <Subject_Name>English</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Grammar</Parameter>
    <Name>SPEAKING SKILLS</Name>
    <SortOrder>3</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>English</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Grammar</Parameter>
    <Name>SPEAKING SKILLS</Name>
    <SortOrder>3</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>Senior KG</Standard_Name>
    <Subject_Name>English</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Grammar</Parameter>
    <Name>SPEAKING SKILLS</Name>
    <SortOrder>3</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>English</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Grammar</Parameter>
    <Name>SPEAKING SKILLS</Name>
    <SortOrder>3</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>Junior KG</Standard_Name>
    <Subject_Name>English</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Spellings</Parameter>
    <Name>SPEAKING SKILLS</Name>
    <SortOrder>4</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>Nursery</Standard_Name>
    <Subject_Name>English</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Spellings</Parameter>
    <Name>SPEAKING SKILLS</Name>
    <SortOrder>4</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>English</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Spellings</Parameter>
    <Name>SPEAKING SKILLS</Name>
    <SortOrder>4</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>Senior KG</Standard_Name>
    <Subject_Name>English</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Spellings</Parameter>
    <Name>SPEAKING SKILLS</Name>
    <SortOrder>4</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>English</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Spellings</Parameter>
    <Name>SPEAKING SKILLS</Name>
    <SortOrder>4</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>Junior KG</Standard_Name>
    <Subject_Name>English</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Vocabulary</Parameter>
    <Name>SPEAKING SKILLS</Name>
    <SortOrder>5</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>Nursery</Standard_Name>
    <Subject_Name>English</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Vocabulary</Parameter>
    <Name>SPEAKING SKILLS</Name>
    <SortOrder>5</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>English</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Vocabulary</Parameter>
    <Name>SPEAKING SKILLS</Name>
    <SortOrder>5</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>Senior KG</Standard_Name>
    <Subject_Name>English</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Vocabulary</Parameter>
    <Name>SPEAKING SKILLS</Name>
    <SortOrder>5</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>English</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Vocabulary</Parameter>
    <Name>SPEAKING SKILLS</Name>
    <SortOrder>5</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>Junior KG</Standard_Name>
    <Subject_Name>English</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Comprehension</Parameter>
    <Name>LISTENING SKILLS</Name>
    <SortOrder>1</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>Nursery</Standard_Name>
    <Subject_Name>English</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Comprehension</Parameter>
    <Name>LISTENING SKILLS</Name>
    <SortOrder>1</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>English</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Comprehension</Parameter>
    <Name>LISTENING SKILLS</Name>
    <SortOrder>1</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>English</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Comprehension</Parameter>
    <Name>LISTENING SKILLS</Name>
    <SortOrder>1</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>Senior KG</Standard_Name>
    <Subject_Name>English</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Comprehension</Parameter>
    <Name>LISTENING SKILLS</Name>
    <SortOrder>1</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>Junior KG</Standard_Name>
    <Subject_Name>English</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>CW/HW/Others</Parameter>
    <Name>REGULARITY IN ASSIGNMENTS</Name>
    <SortOrder>1</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>Nursery</Standard_Name>
    <Subject_Name>English</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>CW/HW/Others</Parameter>
    <Name>REGULARITY IN ASSIGNMENTS</Name>
    <SortOrder>1</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>English</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>CW/HW/Others</Parameter>
    <Name>REGULARITY IN ASSIGNMENTS</Name>
    <SortOrder>1</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>English</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>CW/HW/Others</Parameter>
    <Name>REGULARITY IN ASSIGNMENTS</Name>
    <SortOrder>1</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>Senior KG</Standard_Name>
    <Subject_Name>English</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>CW/HW/Others</Parameter>
    <Name>REGULARITY IN ASSIGNMENTS</Name>
    <SortOrder>1</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>Junior KG</Standard_Name>
    <Subject_Name>English</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Worksheet</Parameter>
    <Name>REGULARITY IN ASSIGNMENTS</Name>
    <SortOrder>2</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>1</ControlTypeId>
    <Standard_Name>Nursery</Standard_Name>
    <Subject_Name>English</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Worksheet</Parameter>
    <Name>REGULARITY IN ASSIGNMENTS</Name>
    <SortOrder>2</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>1</ControlTypeId>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>English</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Worksheet</Parameter>
    <Name>REGULARITY IN ASSIGNMENTS</Name>
    <SortOrder>2</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>1</ControlTypeId>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>English</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Worksheet</Parameter>
    <Name>REGULARITY IN ASSIGNMENTS</Name>
    <SortOrder>2</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>1</ControlTypeId>
    <Standard_Name>Senior KG</Standard_Name>
    <Subject_Name>English</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Worksheet</Parameter>
    <Name>REGULARITY IN ASSIGNMENTS</Name>
    <SortOrder>2</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>1</ControlTypeId>
    <Standard_Name>Junior KG</Standard_Name>
    <Subject_Name>English</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Pronunciation</Parameter>
    <Name>READING SKILLS</Name>
    <SortOrder>1</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Marathi</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Pronunciation</Parameter>
    <Name>READING SKILLS</Name>
    <SortOrder>1</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>Nursery</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Pronunciation</Parameter>
    <Name>READING SKILLS</Name>
    <SortOrder>1</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>Junior KG</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Pronunciation</Parameter>
    <Name>READING SKILLS</Name>
    <SortOrder>1</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Pronunciation</Parameter>
    <Name>READING SKILLS</Name>
    <SortOrder>1</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Pronunciation</Parameter>
    <Name>READING SKILLS</Name>
    <SortOrder>1</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>Senior KG</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Fluency</Parameter>
    <Name>READING SKILLS</Name>
    <SortOrder>2</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Marathi</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Fluency</Parameter>
    <Name>READING SKILLS</Name>
    <SortOrder>2</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>Nursery</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Fluency</Parameter>
    <Name>READING SKILLS</Name>
    <SortOrder>2</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>Junior KG</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Fluency</Parameter>
    <Name>READING SKILLS</Name>
    <SortOrder>2</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Fluency</Parameter>
    <Name>READING SKILLS</Name>
    <SortOrder>2</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Fluency</Parameter>
    <Name>READING SKILLS</Name>
    <SortOrder>2</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>Senior KG</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Comprehension</Parameter>
    <Name>READING SKILLS</Name>
    <SortOrder>3</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Marathi</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Comprehension</Parameter>
    <Name>READING SKILLS</Name>
    <SortOrder>3</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>Nursery</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Comprehension</Parameter>
    <Name>READING SKILLS</Name>
    <SortOrder>3</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>Junior KG</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Comprehension</Parameter>
    <Name>READING SKILLS</Name>
    <SortOrder>3</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Comprehension</Parameter>
    <Name>READING SKILLS</Name>
    <SortOrder>3</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Comprehension</Parameter>
    <Name>READING SKILLS</Name>
    <SortOrder>3</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>Senior KG</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Creative Writing</Parameter>
    <Name>WRITING SKILLS</Name>
    <SortOrder>1</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Marathi</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Creative Writing</Parameter>
    <Name>WRITING SKILLS</Name>
    <SortOrder>1</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>Nursery</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Creative Writing</Parameter>
    <Name>WRITING SKILLS</Name>
    <SortOrder>1</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Creative Writing</Parameter>
    <Name>WRITING SKILLS</Name>
    <SortOrder>1</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Creative Writing</Parameter>
    <Name>WRITING SKILLS</Name>
    <SortOrder>1</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>Junior KG</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Creative Writing</Parameter>
    <Name>WRITING SKILLS</Name>
    <SortOrder>1</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>Senior KG</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Handwriting</Parameter>
    <Name>WRITING SKILLS</Name>
    <SortOrder>2</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Marathi</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Handwriting</Parameter>
    <Name>WRITING SKILLS</Name>
    <SortOrder>2</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>Nursery</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Handwriting</Parameter>
    <Name>WRITING SKILLS</Name>
    <SortOrder>2</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Handwriting</Parameter>
    <Name>WRITING SKILLS</Name>
    <SortOrder>2</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Handwriting</Parameter>
    <Name>WRITING SKILLS</Name>
    <SortOrder>2</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>Junior KG</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Handwriting</Parameter>
    <Name>WRITING SKILLS</Name>
    <SortOrder>2</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>Senior KG</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Grammar</Parameter>
    <Name>WRITING SKILLS</Name>
    <SortOrder>3</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Marathi</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Grammar</Parameter>
    <Name>WRITING SKILLS</Name>
    <SortOrder>3</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>Nursery</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Grammar</Parameter>
    <Name>WRITING SKILLS</Name>
    <SortOrder>3</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Grammar</Parameter>
    <Name>WRITING SKILLS</Name>
    <SortOrder>3</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Grammar</Parameter>
    <Name>WRITING SKILLS</Name>
    <SortOrder>3</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>Junior KG</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Grammar</Parameter>
    <Name>WRITING SKILLS</Name>
    <SortOrder>3</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>Senior KG</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Spellings</Parameter>
    <Name>WRITING SKILLS</Name>
    <SortOrder>4</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Marathi</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Spellings</Parameter>
    <Name>WRITING SKILLS</Name>
    <SortOrder>4</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>Nursery</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Spellings</Parameter>
    <Name>WRITING SKILLS</Name>
    <SortOrder>4</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Spellings</Parameter>
    <Name>WRITING SKILLS</Name>
    <SortOrder>4</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Spellings</Parameter>
    <Name>WRITING SKILLS</Name>
    <SortOrder>4</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>Junior KG</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Spellings</Parameter>
    <Name>WRITING SKILLS</Name>
    <SortOrder>4</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>Senior KG</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Vocabulary</Parameter>
    <Name>WRITING SKILLS</Name>
    <SortOrder>5</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Marathi</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Vocabulary</Parameter>
    <Name>WRITING SKILLS</Name>
    <SortOrder>5</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>Nursery</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Vocabulary</Parameter>
    <Name>WRITING SKILLS</Name>
    <SortOrder>5</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Vocabulary</Parameter>
    <Name>WRITING SKILLS</Name>
    <SortOrder>5</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Vocabulary</Parameter>
    <Name>WRITING SKILLS</Name>
    <SortOrder>5</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>Junior KG</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Vocabulary</Parameter>
    <Name>WRITING SKILLS</Name>
    <SortOrder>5</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>Senior KG</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Story Telling</Parameter>
    <Name>SPEAKING SKILLS</Name>
    <SortOrder>1</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Marathi</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Story Telling</Parameter>
    <Name>SPEAKING SKILLS</Name>
    <SortOrder>1</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>Nursery</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Story Telling</Parameter>
    <Name>SPEAKING SKILLS</Name>
    <SortOrder>1</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Story Telling</Parameter>
    <Name>SPEAKING SKILLS</Name>
    <SortOrder>1</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>Senior KG</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Story Telling</Parameter>
    <Name>SPEAKING SKILLS</Name>
    <SortOrder>1</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Story Telling</Parameter>
    <Name>SPEAKING SKILLS</Name>
    <SortOrder>1</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>Junior KG</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Poem Recitation</Parameter>
    <Name>SPEAKING SKILLS</Name>
    <SortOrder>2</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Marathi</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Poem Recitation</Parameter>
    <Name>SPEAKING SKILLS</Name>
    <SortOrder>2</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>Nursery</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Poem Recitation</Parameter>
    <Name>SPEAKING SKILLS</Name>
    <SortOrder>2</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Poem Recitation</Parameter>
    <Name>SPEAKING SKILLS</Name>
    <SortOrder>2</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>Senior KG</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Poem Recitation</Parameter>
    <Name>SPEAKING SKILLS</Name>
    <SortOrder>2</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Poem Recitation</Parameter>
    <Name>SPEAKING SKILLS</Name>
    <SortOrder>2</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>Junior KG</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Grammar</Parameter>
    <Name>SPEAKING SKILLS</Name>
    <SortOrder>3</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Marathi</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Grammar</Parameter>
    <Name>SPEAKING SKILLS</Name>
    <SortOrder>3</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>Nursery</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Grammar</Parameter>
    <Name>SPEAKING SKILLS</Name>
    <SortOrder>3</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Grammar</Parameter>
    <Name>SPEAKING SKILLS</Name>
    <SortOrder>3</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>Senior KG</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Grammar</Parameter>
    <Name>SPEAKING SKILLS</Name>
    <SortOrder>3</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Grammar</Parameter>
    <Name>SPEAKING SKILLS</Name>
    <SortOrder>3</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>Junior KG</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Spellings</Parameter>
    <Name>SPEAKING SKILLS</Name>
    <SortOrder>4</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Marathi</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Spellings</Parameter>
    <Name>SPEAKING SKILLS</Name>
    <SortOrder>4</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>Nursery</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Spellings</Parameter>
    <Name>SPEAKING SKILLS</Name>
    <SortOrder>4</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Spellings</Parameter>
    <Name>SPEAKING SKILLS</Name>
    <SortOrder>4</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>Senior KG</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Spellings</Parameter>
    <Name>SPEAKING SKILLS</Name>
    <SortOrder>4</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Spellings</Parameter>
    <Name>SPEAKING SKILLS</Name>
    <SortOrder>4</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>Junior KG</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Vocabulary</Parameter>
    <Name>SPEAKING SKILLS</Name>
    <SortOrder>5</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Marathi</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Vocabulary</Parameter>
    <Name>SPEAKING SKILLS</Name>
    <SortOrder>5</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>Nursery</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Vocabulary</Parameter>
    <Name>SPEAKING SKILLS</Name>
    <SortOrder>5</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Vocabulary</Parameter>
    <Name>SPEAKING SKILLS</Name>
    <SortOrder>5</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>Senior KG</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Vocabulary</Parameter>
    <Name>SPEAKING SKILLS</Name>
    <SortOrder>5</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Vocabulary</Parameter>
    <Name>SPEAKING SKILLS</Name>
    <SortOrder>5</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>Junior KG</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Comprehension</Parameter>
    <Name>LISTENING SKILLS</Name>
    <SortOrder>1</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Marathi</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Comprehension</Parameter>
    <Name>LISTENING SKILLS</Name>
    <SortOrder>1</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>Nursery</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Comprehension</Parameter>
    <Name>LISTENING SKILLS</Name>
    <SortOrder>1</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Comprehension</Parameter>
    <Name>LISTENING SKILLS</Name>
    <SortOrder>1</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Comprehension</Parameter>
    <Name>LISTENING SKILLS</Name>
    <SortOrder>1</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>Senior KG</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Comprehension</Parameter>
    <Name>LISTENING SKILLS</Name>
    <SortOrder>1</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>Junior KG</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>CW/HW/Others</Parameter>
    <Name>REGULARITY IN ASSIGNMENTS</Name>
    <SortOrder>1</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Marathi</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>CW/HW/Others</Parameter>
    <Name>REGULARITY IN ASSIGNMENTS</Name>
    <SortOrder>1</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>Nursery</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>CW/HW/Others</Parameter>
    <Name>REGULARITY IN ASSIGNMENTS</Name>
    <SortOrder>1</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>CW/HW/Others</Parameter>
    <Name>REGULARITY IN ASSIGNMENTS</Name>
    <SortOrder>1</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>CW/HW/Others</Parameter>
    <Name>REGULARITY IN ASSIGNMENTS</Name>
    <SortOrder>1</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>Senior KG</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>CW/HW/Others</Parameter>
    <Name>REGULARITY IN ASSIGNMENTS</Name>
    <SortOrder>1</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>Junior KG</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Worksheet</Parameter>
    <Name>REGULARITY IN ASSIGNMENTS</Name>
    <SortOrder>2</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>1</ControlTypeId>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Marathi</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Worksheet</Parameter>
    <Name>REGULARITY IN ASSIGNMENTS</Name>
    <SortOrder>2</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>1</ControlTypeId>
    <Standard_Name>Nursery</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Worksheet</Parameter>
    <Name>REGULARITY IN ASSIGNMENTS</Name>
    <SortOrder>2</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>1</ControlTypeId>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Worksheet</Parameter>
    <Name>REGULARITY IN ASSIGNMENTS</Name>
    <SortOrder>2</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>1</ControlTypeId>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Worksheet</Parameter>
    <Name>REGULARITY IN ASSIGNMENTS</Name>
    <SortOrder>2</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>1</ControlTypeId>
    <Standard_Name>Senior KG</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Worksheet</Parameter>
    <Name>REGULARITY IN ASSIGNMENTS</Name>
    <SortOrder>2</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>1</ControlTypeId>
    <Standard_Name>Junior KG</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Concept</Parameter>
    <Name>ASPECTS </Name>
    <SortOrder>1</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>Nursery</Standard_Name>
    <Subject_Name>Mathematics</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Concept</Parameter>
    <Name>ASPECTS </Name>
    <SortOrder>1</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>Junior KG</Standard_Name>
    <Subject_Name>Mathematics</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Concept</Parameter>
    <Name>ASPECTS </Name>
    <SortOrder>1</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>Senior KG</Standard_Name>
    <Subject_Name>Mathematics</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Concept</Parameter>
    <Name>ASPECTS </Name>
    <SortOrder>1</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>Mathematics</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Activity</Parameter>
    <Name>ASPECTS </Name>
    <SortOrder>2</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>Nursery</Standard_Name>
    <Subject_Name>Mathematics</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Activity</Parameter>
    <Name>ASPECTS </Name>
    <SortOrder>2</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>Junior KG</Standard_Name>
    <Subject_Name>Mathematics</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Activity</Parameter>
    <Name>ASPECTS </Name>
    <SortOrder>2</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>Senior KG</Standard_Name>
    <Subject_Name>Mathematics</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Activity</Parameter>
    <Name>ASPECTS </Name>
    <SortOrder>2</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>Mathematics</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Tables</Parameter>
    <Name>ASPECTS </Name>
    <SortOrder>3</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>Nursery</Standard_Name>
    <Subject_Name>Mathematics</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Tables</Parameter>
    <Name>ASPECTS </Name>
    <SortOrder>3</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>Junior KG</Standard_Name>
    <Subject_Name>Mathematics</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Tables</Parameter>
    <Name>ASPECTS </Name>
    <SortOrder>3</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>Senior KG</Standard_Name>
    <Subject_Name>Mathematics</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Tables</Parameter>
    <Name>ASPECTS </Name>
    <SortOrder>3</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>Mathematics</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Mental Ability</Parameter>
    <Name>ASPECTS </Name>
    <SortOrder>4</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>Nursery</Standard_Name>
    <Subject_Name>Mathematics</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Mental Ability</Parameter>
    <Name>ASPECTS </Name>
    <SortOrder>4</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>Junior KG</Standard_Name>
    <Subject_Name>Mathematics</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Mental Ability</Parameter>
    <Name>ASPECTS </Name>
    <SortOrder>4</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>Senior KG</Standard_Name>
    <Subject_Name>Mathematics</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Mental Ability</Parameter>
    <Name>ASPECTS </Name>
    <SortOrder>4</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>Mathematics</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Written Work/CW/HW</Parameter>
    <Name>ASPECTS </Name>
    <SortOrder>5</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>Nursery</Standard_Name>
    <Subject_Name>Mathematics</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Written Work/CW/HW</Parameter>
    <Name>ASPECTS </Name>
    <SortOrder>5</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>Junior KG</Standard_Name>
    <Subject_Name>Mathematics</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Written Work/CW/HW</Parameter>
    <Name>ASPECTS </Name>
    <SortOrder>5</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>Senior KG</Standard_Name>
    <Subject_Name>Mathematics</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Written Work/CW/HW</Parameter>
    <Name>ASPECTS </Name>
    <SortOrder>5</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>Mathematics</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Worksheet</Parameter>
    <Name>ASPECTS </Name>
    <SortOrder>6</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>1</ControlTypeId>
    <Standard_Name>Nursery</Standard_Name>
    <Subject_Name>Mathematics</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Worksheet</Parameter>
    <Name>ASPECTS </Name>
    <SortOrder>6</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>1</ControlTypeId>
    <Standard_Name>Junior KG</Standard_Name>
    <Subject_Name>Mathematics</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Worksheet</Parameter>
    <Name>ASPECTS </Name>
    <SortOrder>6</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>1</ControlTypeId>
    <Standard_Name>Senior KG</Standard_Name>
    <Subject_Name>Mathematics</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Worksheet</Parameter>
    <Name>ASPECTS </Name>
    <SortOrder>6</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>1</ControlTypeId>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>Mathematics</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Environmental Sensitivity</Parameter>
    <Name>ASPECTS </Name>
    <SortOrder>1</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>Nursery</Standard_Name>
    <Subject_Name>EVS</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Environmental Sensitivity</Parameter>
    <Name>ASPECTS </Name>
    <SortOrder>1</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>Junior KG</Standard_Name>
    <Subject_Name>EVS</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Environmental Sensitivity</Parameter>
    <Name>ASPECTS </Name>
    <SortOrder>1</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>Senior KG</Standard_Name>
    <Subject_Name>EVS</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Environmental Sensitivity</Parameter>
    <Name>ASPECTS </Name>
    <SortOrder>1</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>EVS</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Activity /Project</Parameter>
    <Name>ASPECTS </Name>
    <SortOrder>2</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>Nursery</Standard_Name>
    <Subject_Name>EVS</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Activity /Project</Parameter>
    <Name>ASPECTS </Name>
    <SortOrder>2</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>Junior KG</Standard_Name>
    <Subject_Name>EVS</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Activity /Project</Parameter>
    <Name>ASPECTS </Name>
    <SortOrder>2</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>Senior KG</Standard_Name>
    <Subject_Name>EVS</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Activity /Project</Parameter>
    <Name>ASPECTS </Name>
    <SortOrder>2</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>EVS</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Group Discussion</Parameter>
    <Name>ASPECTS </Name>
    <SortOrder>3</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>Nursery</Standard_Name>
    <Subject_Name>EVS</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Group Discussion</Parameter>
    <Name>ASPECTS </Name>
    <SortOrder>3</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>Junior KG</Standard_Name>
    <Subject_Name>EVS</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Group Discussion</Parameter>
    <Name>ASPECTS </Name>
    <SortOrder>3</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>Senior KG</Standard_Name>
    <Subject_Name>EVS</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Group Discussion</Parameter>
    <Name>ASPECTS </Name>
    <SortOrder>3</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>EVS</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Written Work/Regularity in CW,HW</Parameter>
    <Name>ASPECTS </Name>
    <SortOrder>4</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>Nursery</Standard_Name>
    <Subject_Name>EVS</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Written Work/Regularity in CW,HW</Parameter>
    <Name>ASPECTS </Name>
    <SortOrder>4</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>Junior KG</Standard_Name>
    <Subject_Name>EVS</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Written Work/Regularity in CW,HW</Parameter>
    <Name>ASPECTS </Name>
    <SortOrder>4</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>Senior KG</Standard_Name>
    <Subject_Name>EVS</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Written Work/Regularity in CW,HW</Parameter>
    <Name>ASPECTS </Name>
    <SortOrder>4</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>EVS</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Worksheet</Parameter>
    <Name>ASPECTS </Name>
    <SortOrder>5</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>1</ControlTypeId>
    <Standard_Name>Nursery</Standard_Name>
    <Subject_Name>EVS</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Worksheet</Parameter>
    <Name>ASPECTS </Name>
    <SortOrder>5</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>1</ControlTypeId>
    <Standard_Name>Junior KG</Standard_Name>
    <Subject_Name>EVS</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Worksheet</Parameter>
    <Name>ASPECTS </Name>
    <SortOrder>5</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>1</ControlTypeId>
    <Standard_Name>Senior KG</Standard_Name>
    <Subject_Name>EVS</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Worksheet</Parameter>
    <Name>ASPECTS </Name>
    <SortOrder>5</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>1</ControlTypeId>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>EVS</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Pronunciation</Parameter>
    <Name>READING SKILLS</Name>
    <SortOrder>1</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>Marathi</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Fluency</Parameter>
    <Name>READING SKILLS</Name>
    <SortOrder>2</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>Marathi</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Comprehension</Parameter>
    <Name>READING SKILLS</Name>
    <SortOrder>3</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>Marathi</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Creative Writing</Parameter>
    <Name>WRITING SKILLS</Name>
    <SortOrder>1</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>Marathi</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Handwriting</Parameter>
    <Name>WRITING SKILLS</Name>
    <SortOrder>2</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>Marathi</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Grammar</Parameter>
    <Name>WRITING SKILLS</Name>
    <SortOrder>3</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>Marathi</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Spellings</Parameter>
    <Name>WRITING SKILLS</Name>
    <SortOrder>4</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>Marathi</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Vocabulary</Parameter>
    <Name>WRITING SKILLS</Name>
    <SortOrder>5</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>Marathi</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Story Telling</Parameter>
    <Name>SPEAKING SKILLS</Name>
    <SortOrder>1</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>Marathi</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Poem Recitation</Parameter>
    <Name>SPEAKING SKILLS</Name>
    <SortOrder>2</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>Marathi</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Grammar</Parameter>
    <Name>SPEAKING SKILLS</Name>
    <SortOrder>3</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>Marathi</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Spellings</Parameter>
    <Name>SPEAKING SKILLS</Name>
    <SortOrder>4</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>Marathi</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Vocabulary</Parameter>
    <Name>SPEAKING SKILLS</Name>
    <SortOrder>5</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>Marathi</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Comprehension</Parameter>
    <Name>LISTENING SKILLS</Name>
    <SortOrder>1</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>Marathi</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>CW/HW/Others</Parameter>
    <Name>REGULARITY IN ASSIGNMENTS</Name>
    <SortOrder>1</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>Marathi</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Worksheet</Parameter>
    <Name>REGULARITY IN ASSIGNMENTS</Name>
    <SortOrder>2</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>1</ControlTypeId>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>Marathi</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Skills / Aptitude</Parameter>
    <Name>ASPECTS </Name>
    <SortOrder>1</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>Computers</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Worksheet</Parameter>
    <Name>ASPECTS </Name>
    <SortOrder>2</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>1</ControlTypeId>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>Computers</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Concept</Parameter>
    <Name>ASPECTS </Name>
    <SortOrder>1</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Mathematics</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Activity</Parameter>
    <Name>ASPECTS </Name>
    <SortOrder>2</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Mathematics</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Tables</Parameter>
    <Name>ASPECTS </Name>
    <SortOrder>3</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Mathematics</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Mental Ability</Parameter>
    <Name>ASPECTS </Name>
    <SortOrder>4</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Mathematics</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Written Work/CW/HW</Parameter>
    <Name>ASPECTS </Name>
    <SortOrder>5</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Mathematics</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Worksheet</Parameter>
    <Name>ASPECTS </Name>
    <SortOrder>6</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>1</ControlTypeId>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Mathematics</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Environmental Sensitivity</Parameter>
    <Name>ASPECTS </Name>
    <SortOrder>1</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>EVS</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Activity /Project</Parameter>
    <Name>ASPECTS </Name>
    <SortOrder>2</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>EVS</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Group Discussion</Parameter>
    <Name>ASPECTS </Name>
    <SortOrder>3</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>EVS</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Written Work/Regularity in CW,HW</Parameter>
    <Name>ASPECTS </Name>
    <SortOrder>4</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>EVS</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Worksheet</Parameter>
    <Name>ASPECTS </Name>
    <SortOrder>5</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>1</ControlTypeId>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>EVS</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Skills / Aptitude</Parameter>
    <Name>ASPECTS </Name>
    <SortOrder>1</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>3</ControlTypeId>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Computers</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Worksheet</Parameter>
    <Name>ASPECTS </Name>
    <SortOrder>2</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>1</ControlTypeId>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Computers</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>ART / CRAFT(Interest/Creativity/Skills)</Parameter>
    <Name>CO-CURRICULAR ACTIVITIES</Name>
    <SortOrder>1</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>1</ControlTypeId>
    <Standard_Name>Nursery</Standard_Name>
    <Subject_Name>CO-CURRICULAR ACTIVITIES</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>ART / CRAFT(Interest/Creativity/Skills)</Parameter>
    <Name>CO-CURRICULAR ACTIVITIES</Name>
    <SortOrder>1</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>1</ControlTypeId>
    <Standard_Name>Junior KG</Standard_Name>
    <Subject_Name>CO-CURRICULAR ACTIVITIES</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>ART / CRAFT(Interest/Creativity/Skills)</Parameter>
    <Name>CO-CURRICULAR ACTIVITIES</Name>
    <SortOrder>1</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>1</ControlTypeId>
    <Standard_Name>Senior KG</Standard_Name>
    <Subject_Name>CO-CURRICULAR ACTIVITIES</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>ART / CRAFT(Interest/Creativity/Skills)</Parameter>
    <Name>CO-CURRICULAR ACTIVITIES</Name>
    <SortOrder>1</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>1</ControlTypeId>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>CO-CURRICULAR ACTIVITIES</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>DANCE(Interest/Rhythm/Melody)</Parameter>
    <Name>CO-CURRICULAR ACTIVITIES</Name>
    <SortOrder>2</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>1</ControlTypeId>
    <Standard_Name>Nursery</Standard_Name>
    <Subject_Name>CO-CURRICULAR ACTIVITIES</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>DANCE(Interest/Rhythm/Melody)</Parameter>
    <Name>CO-CURRICULAR ACTIVITIES</Name>
    <SortOrder>2</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>1</ControlTypeId>
    <Standard_Name>Junior KG</Standard_Name>
    <Subject_Name>CO-CURRICULAR ACTIVITIES</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>DANCE(Interest/Rhythm/Melody)</Parameter>
    <Name>CO-CURRICULAR ACTIVITIES</Name>
    <SortOrder>2</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>1</ControlTypeId>
    <Standard_Name>Senior KG</Standard_Name>
    <Subject_Name>CO-CURRICULAR ACTIVITIES</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>DANCE(Interest/Rhythm/Melody)</Parameter>
    <Name>CO-CURRICULAR ACTIVITIES</Name>
    <SortOrder>2</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>1</ControlTypeId>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>CO-CURRICULAR ACTIVITIES</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>MUSIC(Interest/Rhythm/Melody)</Parameter>
    <Name>CO-CURRICULAR ACTIVITIES</Name>
    <SortOrder>3</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>1</ControlTypeId>
    <Standard_Name>Nursery</Standard_Name>
    <Subject_Name>CO-CURRICULAR ACTIVITIES</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>MUSIC(Interest/Rhythm/Melody)</Parameter>
    <Name>CO-CURRICULAR ACTIVITIES</Name>
    <SortOrder>3</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>1</ControlTypeId>
    <Standard_Name>Junior KG</Standard_Name>
    <Subject_Name>CO-CURRICULAR ACTIVITIES</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>MUSIC(Interest/Rhythm/Melody)</Parameter>
    <Name>CO-CURRICULAR ACTIVITIES</Name>
    <SortOrder>3</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>1</ControlTypeId>
    <Standard_Name>Senior KG</Standard_Name>
    <Subject_Name>CO-CURRICULAR ACTIVITIES</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>MUSIC(Interest/Rhythm/Melody)</Parameter>
    <Name>CO-CURRICULAR ACTIVITIES</Name>
    <SortOrder>3</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>1</ControlTypeId>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>CO-CURRICULAR ACTIVITIES</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>General Knowledge</Parameter>
    <Name>CO-CURRICULAR ACTIVITIES</Name>
    <SortOrder>4</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>1</ControlTypeId>
    <Standard_Name>Nursery</Standard_Name>
    <Subject_Name>CO-CURRICULAR ACTIVITIES</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>General Knowledge</Parameter>
    <Name>CO-CURRICULAR ACTIVITIES</Name>
    <SortOrder>4</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>1</ControlTypeId>
    <Standard_Name>Junior KG</Standard_Name>
    <Subject_Name>CO-CURRICULAR ACTIVITIES</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>General Knowledge</Parameter>
    <Name>CO-CURRICULAR ACTIVITIES</Name>
    <SortOrder>4</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>1</ControlTypeId>
    <Standard_Name>Senior KG</Standard_Name>
    <Subject_Name>CO-CURRICULAR ACTIVITIES</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>General Knowledge</Parameter>
    <Name>CO-CURRICULAR ACTIVITIES</Name>
    <SortOrder>4</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>1</ControlTypeId>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>CO-CURRICULAR ACTIVITIES</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Work Education</Parameter>
    <Name>CO-CURRICULAR ACTIVITIES</Name>
    <SortOrder>5</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>1</ControlTypeId>
    <Standard_Name>Nursery</Standard_Name>
    <Subject_Name>CO-CURRICULAR ACTIVITIES</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Work Education</Parameter>
    <Name>CO-CURRICULAR ACTIVITIES</Name>
    <SortOrder>5</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>1</ControlTypeId>
    <Standard_Name>Junior KG</Standard_Name>
    <Subject_Name>CO-CURRICULAR ACTIVITIES</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Work Education</Parameter>
    <Name>CO-CURRICULAR ACTIVITIES</Name>
    <SortOrder>5</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>1</ControlTypeId>
    <Standard_Name>Senior KG</Standard_Name>
    <Subject_Name>CO-CURRICULAR ACTIVITIES</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Work Education</Parameter>
    <Name>CO-CURRICULAR ACTIVITIES</Name>
    <SortOrder>5</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>1</ControlTypeId>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>CO-CURRICULAR ACTIVITIES</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Courteous</Parameter>
    <Name>PERSONAL &amp; SOCIAL TRAITS </Name>
    <SortOrder>1</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>1</ControlTypeId>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>Personal &amp; Social Traits</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Confidence</Parameter>
    <Name>PERSONAL &amp; SOCIAL TRAITS </Name>
    <SortOrder>2</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>1</ControlTypeId>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>Personal &amp; Social Traits</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Care of belongings</Parameter>
    <Name>PERSONAL &amp; SOCIAL TRAITS </Name>
    <SortOrder>3</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>1</ControlTypeId>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>Personal &amp; Social Traits</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Neatness &amp; Uniform</Parameter>
    <Name>PERSONAL &amp; SOCIAL TRAITS </Name>
    <SortOrder>4</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>1</ControlTypeId>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>Personal &amp; Social Traits</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Regularity &amp; Punctuality</Parameter>
    <Name>PERSONAL &amp; SOCIAL TRAITS </Name>
    <SortOrder>5</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>1</ControlTypeId>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>Personal &amp; Social Traits</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Initiative</Parameter>
    <Name>PERSONAL &amp; SOCIAL TRAITS </Name>
    <SortOrder>6</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>1</ControlTypeId>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>Personal &amp; Social Traits</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Sharing &amp; Caring</Parameter>
    <Name>PERSONAL &amp; SOCIAL TRAITS </Name>
    <SortOrder>7</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>1</ControlTypeId>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>Personal &amp; Social Traits</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Respect for others/School Property</Parameter>
    <Name>PERSONAL &amp; SOCIAL TRAITS </Name>
    <SortOrder>8</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>1</ControlTypeId>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>Personal &amp; Social Traits</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Self - Control</Parameter>
    <Name>PERSONAL &amp; SOCIAL TRAITS </Name>
    <SortOrder>9</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>1</ControlTypeId>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>Personal &amp; Social Traits</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Enthusiasm</Parameter>
    <Name>SPORTS</Name>
    <SortOrder>1</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>1</ControlTypeId>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>SPORTS</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Discipline</Parameter>
    <Name>SPORTS</Name>
    <SortOrder>2</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>1</ControlTypeId>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>SPORTS</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Team Sprit</Parameter>
    <Name>SPORTS</Name>
    <SortOrder>3</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>1</ControlTypeId>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>SPORTS</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Talent</Parameter>
    <Name>SPORTS</Name>
    <SortOrder>4</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>1</ControlTypeId>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>SPORTS</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>ART / CRAFT(Interest/Creativity/Skills)</Parameter>
    <Name>CO-CURRICULAR ACTIVITIES</Name>
    <SortOrder>1</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>1</ControlTypeId>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>CO-CURRICULAR ACTIVITIES</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>DANCE(Interest/Rhythm/Melody)</Parameter>
    <Name>CO-CURRICULAR ACTIVITIES</Name>
    <SortOrder>2</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>1</ControlTypeId>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>CO-CURRICULAR ACTIVITIES</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>MUSIC(Interest/Rhythm/Melody)</Parameter>
    <Name>CO-CURRICULAR ACTIVITIES</Name>
    <SortOrder>3</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>1</ControlTypeId>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>CO-CURRICULAR ACTIVITIES</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>General Knowledge</Parameter>
    <Name>CO-CURRICULAR ACTIVITIES</Name>
    <SortOrder>4</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>1</ControlTypeId>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>CO-CURRICULAR ACTIVITIES</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Work Education</Parameter>
    <Name>CO-CURRICULAR ACTIVITIES</Name>
    <SortOrder>5</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>1</ControlTypeId>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>CO-CURRICULAR ACTIVITIES</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Courteous</Parameter>
    <Name>PERSONAL &amp; SOCIAL TRAITS </Name>
    <SortOrder>1</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>1</ControlTypeId>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Personal &amp; Social Traits</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Confidence</Parameter>
    <Name>PERSONAL &amp; SOCIAL TRAITS </Name>
    <SortOrder>2</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>1</ControlTypeId>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Personal &amp; Social Traits</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Care of belongings</Parameter>
    <Name>PERSONAL &amp; SOCIAL TRAITS </Name>
    <SortOrder>3</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>1</ControlTypeId>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Personal &amp; Social Traits</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Neatness &amp; Uniform</Parameter>
    <Name>PERSONAL &amp; SOCIAL TRAITS </Name>
    <SortOrder>4</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>1</ControlTypeId>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Personal &amp; Social Traits</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Regularity &amp; Punctuality</Parameter>
    <Name>PERSONAL &amp; SOCIAL TRAITS </Name>
    <SortOrder>5</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>1</ControlTypeId>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Personal &amp; Social Traits</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Initiative</Parameter>
    <Name>PERSONAL &amp; SOCIAL TRAITS </Name>
    <SortOrder>6</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>1</ControlTypeId>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Personal &amp; Social Traits</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Sharing &amp; Caring</Parameter>
    <Name>PERSONAL &amp; SOCIAL TRAITS </Name>
    <SortOrder>7</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>1</ControlTypeId>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Personal &amp; Social Traits</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Respect for others/School Property</Parameter>
    <Name>PERSONAL &amp; SOCIAL TRAITS </Name>
    <SortOrder>8</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>1</ControlTypeId>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Personal &amp; Social Traits</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Self - Control</Parameter>
    <Name>PERSONAL &amp; SOCIAL TRAITS </Name>
    <SortOrder>9</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>1</ControlTypeId>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Personal &amp; Social Traits</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Enthusiasm</Parameter>
    <Name>SPORTS</Name>
    <SortOrder>1</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>1</ControlTypeId>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>SPORTS</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Discipline</Parameter>
    <Name>SPORTS</Name>
    <SortOrder>2</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>1</ControlTypeId>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>SPORTS</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Team Sprit</Parameter>
    <Name>SPORTS</Name>
    <SortOrder>3</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>1</ControlTypeId>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>SPORTS</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Talent</Parameter>
    <Name>SPORTS</Name>
    <SortOrder>4</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>1</ControlTypeId>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>SPORTS</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Courteous</Parameter>
    <Name>PERSONAL &amp; SOCIAL TRAITS</Name>
    <SortOrder>1</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>1</ControlTypeId>
    <Standard_Name>Nursery</Standard_Name>
    <Subject_Name>Personal &amp; Social Traits</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Courteous</Parameter>
    <Name>PERSONAL &amp; SOCIAL TRAITS</Name>
    <SortOrder>1</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>1</ControlTypeId>
    <Standard_Name>Junior KG</Standard_Name>
    <Subject_Name>Personal &amp; Social Traits</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Courteous</Parameter>
    <Name>PERSONAL &amp; SOCIAL TRAITS</Name>
    <SortOrder>1</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>1</ControlTypeId>
    <Standard_Name>Senior KG</Standard_Name>
    <Subject_Name>Personal &amp; Social Traits</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Confidence</Parameter>
    <Name>PERSONAL &amp; SOCIAL TRAITS</Name>
    <SortOrder>2</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>1</ControlTypeId>
    <Standard_Name>Nursery</Standard_Name>
    <Subject_Name>Personal &amp; Social Traits</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Confidence</Parameter>
    <Name>PERSONAL &amp; SOCIAL TRAITS</Name>
    <SortOrder>2</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>1</ControlTypeId>
    <Standard_Name>Junior KG</Standard_Name>
    <Subject_Name>Personal &amp; Social Traits</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Confidence</Parameter>
    <Name>PERSONAL &amp; SOCIAL TRAITS</Name>
    <SortOrder>2</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>1</ControlTypeId>
    <Standard_Name>Senior KG</Standard_Name>
    <Subject_Name>Personal &amp; Social Traits</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Care of belongings</Parameter>
    <Name>PERSONAL &amp; SOCIAL TRAITS</Name>
    <SortOrder>3</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>1</ControlTypeId>
    <Standard_Name>Nursery</Standard_Name>
    <Subject_Name>Personal &amp; Social Traits</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Care of belongings</Parameter>
    <Name>PERSONAL &amp; SOCIAL TRAITS</Name>
    <SortOrder>3</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>1</ControlTypeId>
    <Standard_Name>Junior KG</Standard_Name>
    <Subject_Name>Personal &amp; Social Traits</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Care of belongings</Parameter>
    <Name>PERSONAL &amp; SOCIAL TRAITS</Name>
    <SortOrder>3</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>1</ControlTypeId>
    <Standard_Name>Senior KG</Standard_Name>
    <Subject_Name>Personal &amp; Social Traits</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Neatness &amp; Uniform</Parameter>
    <Name>PERSONAL &amp; SOCIAL TRAITS</Name>
    <SortOrder>4</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>1</ControlTypeId>
    <Standard_Name>Nursery</Standard_Name>
    <Subject_Name>Personal &amp; Social Traits</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Neatness &amp; Uniform</Parameter>
    <Name>PERSONAL &amp; SOCIAL TRAITS</Name>
    <SortOrder>4</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>1</ControlTypeId>
    <Standard_Name>Junior KG</Standard_Name>
    <Subject_Name>Personal &amp; Social Traits</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Neatness &amp; Uniform</Parameter>
    <Name>PERSONAL &amp; SOCIAL TRAITS</Name>
    <SortOrder>4</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>1</ControlTypeId>
    <Standard_Name>Senior KG</Standard_Name>
    <Subject_Name>Personal &amp; Social Traits</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Regularity &amp; Punctuality</Parameter>
    <Name>PERSONAL &amp; SOCIAL TRAITS</Name>
    <SortOrder>5</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>1</ControlTypeId>
    <Standard_Name>Nursery</Standard_Name>
    <Subject_Name>Personal &amp; Social Traits</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Regularity &amp; Punctuality</Parameter>
    <Name>PERSONAL &amp; SOCIAL TRAITS</Name>
    <SortOrder>5</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>1</ControlTypeId>
    <Standard_Name>Junior KG</Standard_Name>
    <Subject_Name>Personal &amp; Social Traits</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Regularity &amp; Punctuality</Parameter>
    <Name>PERSONAL &amp; SOCIAL TRAITS</Name>
    <SortOrder>5</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>1</ControlTypeId>
    <Standard_Name>Senior KG</Standard_Name>
    <Subject_Name>Personal &amp; Social Traits</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Initiative</Parameter>
    <Name>PERSONAL &amp; SOCIAL TRAITS</Name>
    <SortOrder>6</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>1</ControlTypeId>
    <Standard_Name>Nursery</Standard_Name>
    <Subject_Name>Personal &amp; Social Traits</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Initiative</Parameter>
    <Name>PERSONAL &amp; SOCIAL TRAITS</Name>
    <SortOrder>6</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>1</ControlTypeId>
    <Standard_Name>Junior KG</Standard_Name>
    <Subject_Name>Personal &amp; Social Traits</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Initiative</Parameter>
    <Name>PERSONAL &amp; SOCIAL TRAITS</Name>
    <SortOrder>6</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>1</ControlTypeId>
    <Standard_Name>Senior KG</Standard_Name>
    <Subject_Name>Personal &amp; Social Traits</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Sharing &amp; Caring</Parameter>
    <Name>PERSONAL &amp; SOCIAL TRAITS</Name>
    <SortOrder>7</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>1</ControlTypeId>
    <Standard_Name>Nursery</Standard_Name>
    <Subject_Name>Personal &amp; Social Traits</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Sharing &amp; Caring</Parameter>
    <Name>PERSONAL &amp; SOCIAL TRAITS</Name>
    <SortOrder>7</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>1</ControlTypeId>
    <Standard_Name>Junior KG</Standard_Name>
    <Subject_Name>Personal &amp; Social Traits</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Sharing &amp; Caring</Parameter>
    <Name>PERSONAL &amp; SOCIAL TRAITS</Name>
    <SortOrder>7</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>1</ControlTypeId>
    <Standard_Name>Senior KG</Standard_Name>
    <Subject_Name>Personal &amp; Social Traits</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Respect for others/School Property</Parameter>
    <Name>PERSONAL &amp; SOCIAL TRAITS</Name>
    <SortOrder>8</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>1</ControlTypeId>
    <Standard_Name>Nursery</Standard_Name>
    <Subject_Name>Personal &amp; Social Traits</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Respect for others/School Property</Parameter>
    <Name>PERSONAL &amp; SOCIAL TRAITS</Name>
    <SortOrder>8</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>1</ControlTypeId>
    <Standard_Name>Junior KG</Standard_Name>
    <Subject_Name>Personal &amp; Social Traits</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Respect for others/School Property</Parameter>
    <Name>PERSONAL &amp; SOCIAL TRAITS</Name>
    <SortOrder>8</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>1</ControlTypeId>
    <Standard_Name>Senior KG</Standard_Name>
    <Subject_Name>Personal &amp; Social Traits</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Self - Control</Parameter>
    <Name>PERSONAL &amp; SOCIAL TRAITS</Name>
    <SortOrder>9</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>1</ControlTypeId>
    <Standard_Name>Nursery</Standard_Name>
    <Subject_Name>Personal &amp; Social Traits</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Self - Control</Parameter>
    <Name>PERSONAL &amp; SOCIAL TRAITS</Name>
    <SortOrder>9</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>1</ControlTypeId>
    <Standard_Name>Junior KG</Standard_Name>
    <Subject_Name>Personal &amp; Social Traits</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Self - Control</Parameter>
    <Name>PERSONAL &amp; SOCIAL TRAITS</Name>
    <SortOrder>9</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>1</ControlTypeId>
    <Standard_Name>Senior KG</Standard_Name>
    <Subject_Name>Personal &amp; Social Traits</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Enthusiasm</Parameter>
    <Name>SPORTS</Name>
    <SortOrder>1</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>1</ControlTypeId>
    <Standard_Name>Nursery</Standard_Name>
    <Subject_Name>SPORTS</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Enthusiasm</Parameter>
    <Name>SPORTS</Name>
    <SortOrder>1</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>1</ControlTypeId>
    <Standard_Name>Junior KG</Standard_Name>
    <Subject_Name>SPORTS</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Enthusiasm</Parameter>
    <Name>SPORTS</Name>
    <SortOrder>1</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>1</ControlTypeId>
    <Standard_Name>Senior KG</Standard_Name>
    <Subject_Name>SPORTS</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Discipline</Parameter>
    <Name>SPORTS</Name>
    <SortOrder>2</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>1</ControlTypeId>
    <Standard_Name>Nursery</Standard_Name>
    <Subject_Name>SPORTS</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Discipline</Parameter>
    <Name>SPORTS</Name>
    <SortOrder>2</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>1</ControlTypeId>
    <Standard_Name>Junior KG</Standard_Name>
    <Subject_Name>SPORTS</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Discipline</Parameter>
    <Name>SPORTS</Name>
    <SortOrder>2</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>1</ControlTypeId>
    <Standard_Name>Senior KG</Standard_Name>
    <Subject_Name>SPORTS</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Team Sprit</Parameter>
    <Name>SPORTS</Name>
    <SortOrder>3</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>1</ControlTypeId>
    <Standard_Name>Nursery</Standard_Name>
    <Subject_Name>SPORTS</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Team Sprit</Parameter>
    <Name>SPORTS</Name>
    <SortOrder>3</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>1</ControlTypeId>
    <Standard_Name>Junior KG</Standard_Name>
    <Subject_Name>SPORTS</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Team Sprit</Parameter>
    <Name>SPORTS</Name>
    <SortOrder>3</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>1</ControlTypeId>
    <Standard_Name>Senior KG</Standard_Name>
    <Subject_Name>SPORTS</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Talent</Parameter>
    <Name>SPORTS</Name>
    <SortOrder>4</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>1</ControlTypeId>
    <Standard_Name>Nursery</Standard_Name>
    <Subject_Name>SPORTS</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Talent</Parameter>
    <Name>SPORTS</Name>
    <SortOrder>4</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>1</ControlTypeId>
    <Standard_Name>Junior KG</Standard_Name>
    <Subject_Name>SPORTS</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
  <Parameter>
    <Parameter>Talent</Parameter>
    <Name>SPORTS</Name>
    <SortOrder>4</SortOrder>
    <IsSubmitted>1</IsSubmitted>
    <ControlTypeId>1</ControlTypeId>
    <Standard_Name>Senior KG</Standard_Name>
    <Subject_Name>SPORTS</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Parameter>
</Parameter>';

DECLARE @tempObservationParameters TABLE
(
    Parameter       NVARCHAR(500),
    SkillName       NVARCHAR(300),
    SortOrder       INT,
    IsSubmitted     BIT,
    ControlTypeId   INT,
    StandardName    NVARCHAR(100),
    SubjectName     NVARCHAR(200)
	
);

INSERT INTO @tempObservationParameters
(
    Parameter,
	SkillName,
	SortOrder,
    IsSubmitted,
    ControlTypeId,
    StandardName,
    SubjectName

)
SELECT
    T.c.value('(Parameter)[1]', 'NVARCHAR(500)'),
    T.c.value('(Name)[1]', 'NVARCHAR(300)'),
    T.c.value('(SortOrder)[1]', 'INT'),
    T.c.value('(IsSubmitted)[1]', 'BIT'),
    T.c.value('(ControlTypeId)[1]', 'INT'),
   T.c.value('(Standard_Name)[1]', 'NVARCHAR(100)'),
    T.c.value('(Subject_Name)[1]', 'NVARCHAR(200)')
FROM @ObservationParameters.nodes('/Parameter/Parameter') T(c);

INSERT INTO ObservationParameters
(
    Parameter,  SkillId, SortOrder, IsSubmitted, ControlTypeId, SchoolId, AcademicYearId,  IsDeleted,
    InsertedById,InsertDate, UpdatedById,UpdateDate)
SELECT

    T.Parameter, OS.Id AS SkillId, T.SortOrder, T.IsSubmitted,
    T.ControlTypeId, @SchoolId , 1,0,  1, dbo.GetLocalDate(DEFAULT),  1,  dbo.GetLocalDate(DEFAULT)
FROM @tempObservationParameters T
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
   AND OS.IsDeleted = 0;

 