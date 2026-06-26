DECLARE @tblStudData AS TABLE
(
    StudentName NVARCHAR(100),
	RFID NVARCHAR(100)
)

insert into @tblStudData
SELECT 'Master Aarav Saket Gatade','7862950' UNION
SELECT 'Master Abir Sahil Kalgaonkar','7851738' UNION
SELECT 'Master Aditya Rohit Koli','7478961' UNION
SELECT 'Master Ahad Arif Jamadar','7345210' UNION
SELECT 'Miss Ananya Digvijay Nalawade','7570802' UNION
SELECT 'Master Anishk Harshad Kakade','7538914' UNION
SELECT 'Miss Anukrita Avinash Jagtap','7350346' UNION
SELECT 'Miss Anvi Praveen Kamble','7476530' UNION
SELECT 'Miss Araina Rohit Jagmalani','7641570' UNION
SELECT 'Miss Arika Amrish Kulkarni','7343675' UNION
SELECT 'Master Arjun Pravin Chaudhari','7497329' UNION
SELECT 'Master Ashvatya Praveen Kamble','7414685' UNION
SELECT 'Miss Bhairavi Manojkumar Musale','7444571' UNION
SELECT 'Master Dakshish Ketan Oswal','7450277' UNION
SELECT 'Master Dhanraj Kuldeep Jadhav','7339797' UNION
SELECT 'Miss Drishi Chirag Rathod','7535458' UNION
SELECT 'Miss Eva Chandrashekhar Patil','7413269' UNION
SELECT 'Miss Gatha Pratik Kshirsagar','7585602' UNION
SELECT 'Miss Heer Ashish Pahuja','7337101' UNION
SELECT 'Master Mitansh Manoj Sawant','7497838' UNION
SELECT 'Master Mitansh Pramod Chougule','7460358' UNION
SELECT 'Master Muhammadizhaan Mohamadzoheb Bagwan','7603858' UNION
SELECT 'Miss Myra Amit Kashid','7375780' UNION
SELECT 'Miss Pearl Roshan Karda','7631343' UNION
SELECT 'Master Preet Vijay Bote','7473217' UNION
SELECT 'Master Reyansh Yogesh Shetye','7440825' UNION
SELECT 'Master Rrutvik Mahendra Shelake','7440332' UNION
SELECT 'Miss Saanavi Sangram Ghatge','7420807' UNION
SELECT 'Miss Saanvi Rohit Hinduja','7829964' UNION
SELECT 'Miss Sanvi Suyog Lingras','7352569' UNION
SELECT 'Master Shomit Ashish Ubhrani','7512772' UNION
SELECT 'Miss Shreeya Sushilkumar Patil','7560021' UNION
SELECT 'Master Swarnil Swapnil Rajaram','7376910' UNION
SELECT 'Master Swayam Chetan Sarda','7441672' UNION
SELECT 'Master Tanay Sudeep Pujari','7411303' UNION
SELECT 'Miss Vanya Singodia','7410993' UNION
SELECT 'Master Aahil Anupm Pawar','7351207' UNION
SELECT 'Miss Aarusha Arjun Desai','7702234' UNION
SELECT 'Miss Anaya Ravi Ahuja','7343637' UNION
SELECT 'Master Anvit Ajinkya Mali','7498455' UNION
SELECT 'Master Arush Arun Dhongade','7462373' UNION
SELECT 'Master Awez Vahab Loni','' UNION
SELECT 'Master Ayush Krishna Bhunia','7667859' UNION
SELECT 'Master Devesh Prashant Deshpande','7594437' UNION
SELECT 'Miss Drishti Anant Bhosale','7403651' UNION
SELECT 'Miss Durva Anant Bhosale','7599748' UNION
SELECT 'Master Gautam Satish Saluja','7585938' UNION
SELECT 'Master Hridhaan Ketan Bhattad','7341479' UNION
SELECT 'Master Iraj Dinesh Khanolkar','' UNION
SELECT 'Master Ishan Vivek Malave','7415563' UNION
SELECT 'Miss Kanishka Sushrut Yadav','7468483' UNION
SELECT 'Miss Kiyara Prithviraj Khade','' UNION
SELECT 'Miss Manju Pravin Kuchkoravi','7352562' UNION
SELECT 'Master Moksh Chetan Shah','7465178' UNION
SELECT 'Miss Myra Pravin Ghule','7579175' UNION
SELECT 'Miss Ovee Jay Kamat','7480820' UNION
SELECT 'Miss Prisha Sanjay Chougule','7475318' UNION
SELECT 'Miss Reva Amit Kadam','7426188' UNION
SELECT 'Master Ruhan Vishal Pahuja','7430664' UNION
SELECT 'Miss Ruhani Amar Karda','7449776' UNION
SELECT 'Miss Samayra Swapnil Ashtekar','7469107' UNION
SELECT 'Miss Sanvi Sagar Chhabdiya','7381403' UNION
SELECT 'Master Shaunit Amarsinha Jagtap','7428927' UNION
SELECT 'Master Shrish Sharad Baliga','7484839' UNION
SELECT 'Miss Trisha Mangesh Bhosale','' UNION
SELECT 'Master Veeransh Abhishek Bajaj','7570171' UNION
SELECT 'Miss Vibha Vinitkumar Salunkhe','7617754' UNION
SELECT 'Master Vihaan Sangram Patil','7465767' UNION
SELECT 'Master Vihaan Swaroop Amalzare','7388982' UNION
SELECT 'Master Yashodhan Kushal Powar','7499068' UNION
SELECT 'Miss Yashshree Sandeep Patil','7701744' UNION
SELECT 'Miss Aarvi Anil Kamte','7388412' UNION
SELECT 'Miss Adhira Amitkumar Shetake','7341909' UNION
SELECT 'Master Aditya Chetan Nikam','7382833' UNION
SELECT 'Miss Anaira Sahil Notani','7338213' UNION
SELECT 'Master Anuj Amit Patil','7506482' UNION
SELECT 'Miss Anvita Amit Patil','7560601' UNION
SELECT 'Master Aradhy Ashish Powar','7337393' UNION
SELECT 'Master Arjun Milind Patil','7545661' UNION
SELECT 'Master Ayaan Rohan Lakade','7357460' UNION
SELECT 'Miss Charvi Kapil Sonavane','7484303' UNION
SELECT 'Master Evan Gill Singh','7423899' UNION
SELECT 'Miss Iqra Tabrez Maner','7609557' UNION
SELECT 'Miss Jeevika Vijay Kotamire','7408409' UNION
SELECT 'Master Kavish Manish Patel','7531386' UNION
SELECT 'Miss Liana Bipin Wadhwa','7478001' UNION
SELECT 'Miss Miraya Rahul Chhabriya','7381391' UNION
SELECT 'Miss Naira Rameshkumar Keswani','7436162' UNION
SELECT 'Miss Navya Yuvaraj Sawant','7439719' UNION
SELECT 'Master Nirmit Nitin Basantani','7662871' UNION
SELECT 'Master Prithvi Rajesh Oswal','' UNION
SELECT 'Miss Ridhvi Sunny Jain','7442962' UNION
SELECT 'Master Riyansh Raj Patel Vamja','7519671' UNION
SELECT 'Master Ronak Prem Daryani','7460048' UNION
SELECT 'Master Ruturaj Prakash Gumane','7571274' UNION
SELECT 'Master Saaish Swaroop Bhalkar','7416689' UNION
SELECT 'Miss Saarah Mudassar Maner','7448326' UNION
SELECT 'Master Sanjit Pravin Nejdar','7465708' UNION
SELECT 'Miss Sayuri Viraj Mane','7538905' UNION
SELECT 'Miss Sharvi Suraj Dhanawade','7357187' UNION
SELECT 'Master Shivansh Santosh Chunamuri','7463168' UNION
SELECT 'Miss Sudiksha Suraj Chhabada','7480538' UNION
SELECT 'Miss Trisha Sourabh Patil','7544150' UNION
SELECT 'Master Varad Parag Gaikwad','' UNION
SELECT 'Master Vihaan Atul Deshmukh','7572952' UNION
SELECT 'Master Yug Trushant Powar','7497805' UNION
SELECT 'Master Zohaan Sharif Sayyad','7405637' UNION
SELECT 'Master Adhiraj Vaibhav Patil','7375089' UNION
SELECT 'Miss Anvita Sujit Kumbhar','7417706' UNION
SELECT 'Master Daksh Indrajeet Patil','' UNION
SELECT 'Master Devansh Vaibhav Patil','7352615' UNION
SELECT 'Miss Durva Shraddha Bhendigiri','7437307' UNION
SELECT 'Miss Era Deepak Khade','7502783' UNION
SELECT 'Miss Era Sushant Vhatkar','7505647' UNION
SELECT 'Miss Jenisha Pravin Wadhwa','7436810' UNION
SELECT 'Miss Jija Ashish Jadhav','7560305' UNION
SELECT 'Miss Jija Nikhil Savardekar','' UNION
SELECT 'Master Kartikey Madhavrao Gharge','7457223' UNION
SELECT 'Master Krishnaveer Karan Sonavane','7682765' UNION
SELECT 'Miss Lavisha Vijay Jain','7490437' UNION
SELECT 'Miss Mitali Sachin Koli','7469058' UNION
SELECT 'Miss Oja Aniket Patil','7852714' UNION
SELECT 'Master Ojas Pradeep Patil','7448236' UNION
SELECT 'Miss Prashabdi Suyog Ladekar','7583672' UNION
SELECT 'Miss Priyanshi Sanjay Magar','7461636' UNION
SELECT 'Miss Radni Sushant Vhatkar','7848481' UNION
SELECT 'Master Ridaan Rahul Jakhotiya','7631665' UNION
SELECT 'Master Ridham Sanjay Patil','7873559' UNION
SELECT 'Miss Riva Rushikesh Ringane','7638165' UNION
SELECT 'Master Saarang Santoshkumar Desai','7636041' UNION
SELECT 'Master Sairaj Mukund Kumthekar','7687312' UNION
SELECT 'Master Samarjeet Prasad Burud','7590121' UNION
SELECT 'Miss Sara Sameer Patil','' UNION
SELECT 'Miss Sharvi Amit Patil','8317925' UNION
SELECT 'Master Shivansh Anil Powar','' UNION
SELECT 'Master Shivansh Satyajeet Patil','7586601' UNION
SELECT 'Master Shlok Shailesh Shinde','' UNION
SELECT 'Master Shreyansh Sourabh Kadam','' UNION
SELECT 'Miss Siaraa Roshan Chawla','7497361' UNION
SELECT 'Miss Stuti Vijay Kamble','7438446' UNION
SELECT 'Master Viaan Vinay Khobare','' UNION
SELECT 'Master Vidish Hrishikesh Joshi','7379100' 

DELETE FROM @tblStudData
      WHERE RFID IS NULL
         OR RFID  = ''

 Update SAD
       set RFID=TSD.RFID
      from StudentAdditionalDetails SAD
	inner join vw_baseStudentDetails BSD
           on BSD.SchoolWise_Student_Id =SAD.SchoolwiseStudentId
inner Join @tblStudData  TSD
        on BSD.StudentName=TSD.StudentName
inner join YearWise_Student_Details YSD
	    on BSD.SchoolWise_Student_Id=YSD.Student_Id
	 where Academic_Year_ID=13

