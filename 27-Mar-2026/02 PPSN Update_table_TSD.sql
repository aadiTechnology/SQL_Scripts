BEGIN TRANSACTION
BEGIN TRY

DECLARE @tblStudentDetails AS TABLE
(
	Id INT IDENTITY(1,1),
	ClassName NVARCHAR(100),
	StudentName NVARCHAR(200),
	CancFormNo NVARCHAR(100),
	ScStudentId INT
)

INSERT INTO @tblStudentDetails(ClassName,StudentName,CancFormNo)
SELECT '10-A','Miss Aarvi Sachin Deshmukh','CF2674' UNION
SELECT '10-A','Miss Anaya Amol Gaikwad','CF2675' UNION
SELECT '10-A','Miss Apurva Ashok Ranshur','CF2676' UNION
SELECT '10-A','Miss Bhavya Sabre','CF2677' UNION
SELECT '10-A','Miss Isha Vijay Vahadne','CF2678' UNION
SELECT '10-A','Miss Isheeta Ranjeet Rajput','CF2679' UNION
SELECT '10-A','Miss Kavya Amit Lalwani','CF2680' UNION
SELECT '10-A','Miss Kavya Nilesh Pawar','CF2681' UNION
SELECT '10-A','Miss Kimaya Kaustubh Gitapathi','CF2682' UNION
SELECT '10-A','Miss Parul Prashant Zalke','CF2683' UNION
SELECT '10-A','Miss Pranjal Umeshchandra Ozha','CF2684' UNION
SELECT '10-A','Miss Prisha Sampat Malu','CF2685' UNION
SELECT '10-A','Miss Radhika Prashant Chaudhari','CF2686' UNION
SELECT '10-A','Miss Sharvi Shyam Rakhonde','CF2687' UNION
SELECT '10-A','Miss Swamini Sumant Jadhav','CF2688' UNION
SELECT '10-A','Miss Vedantika Sudhir Deshmukh','CF2689' UNION
SELECT '10-A','Miss Vidhi Ramchandra Vasekar','CF2690' UNION
SELECT '10-A','Master Aditya Nimish Petkar','CF2691' UNION
SELECT '10-A','Master Amogh Kamlesh Pradhan','CF2692' UNION
SELECT '10-A','Master Anay Amit Bedarkar','CF2693' UNION
SELECT '10-A','Master Ashmey Amit Satpute','CF2694' UNION
SELECT '10-A','Master Charul Narendra Patil','CF2695' UNION
SELECT '10-A','Master Diptanshu Jana','CF2696' UNION
SELECT '10-A','Master Ishan Dhiraj Prakash Gupta','CF2697' UNION
SELECT '10-A','Master Ishan Dilip Jagtap','CF2698' UNION
SELECT '10-A','Master Mandar Mahesh Mulik','CF2699' UNION
SELECT '10-A','Master Nilay Prithu Mahajan','CF2700' UNION
SELECT '10-A','Master Radhey Sanjay Pol','CF2701' UNION
SELECT '10-A','Master Ranveer Rajendra Nirmale','CF2702' UNION
SELECT '10-A','Master Sarthak Abhijit Vasmatkar','CF2703' UNION
SELECT '10-A','Master Shaurya Sachin Gidde','CF2704' UNION
SELECT '10-A','Master Shrijesh Uttam Patil','CF2705' UNION
SELECT '10-A','Master Viraj Vikram Khatpe','CF2706' UNION
SELECT '10-A','Master Yogin Rajeev Shukla','CF2707' UNION
SELECT '10-A','Master Yug Mehulgiri Gauswami','CF2708' UNION
SELECT '10-B','Miss Aadya Santosh Keseri','CF2709' UNION
SELECT '10-B','Miss Aarya Vikas Daware','CF2710' UNION
SELECT '10-B','Miss Anvee Sumit Butiyani','CF2711' UNION
SELECT '10-B','Miss Arohi Abhijit Bedre','CF2712' UNION
SELECT '10-B','Miss Arushi Ashutosh Chougule','CF2713' UNION
SELECT '10-B','Miss Avani Srinivas Challa','CF2714' UNION
SELECT '10-B','Miss Ekta Prasad Raut','CF2715' UNION
SELECT '10-B','Miss Gauri Sachin Wadkar','CF2716' UNION
SELECT '10-B','Miss Gayatri Sachin Wadkar','CF2717' UNION
SELECT '10-B','Miss Kshiti Viriyala','CF2718' UNION
SELECT '10-B','Miss Navya Sinha','CF2719' UNION
SELECT '10-B','Miss Pihu Saxena','CF2720' UNION
SELECT '10-B','Miss Pratiksha Ajinkya Dalvi','CF2721' UNION
SELECT '10-B','Miss Saee Deepak Pokale','CF2722' UNION
SELECT '10-B','Miss Saee Rajendra Shinde','CF2723' UNION
SELECT '10-B','Miss Sanskriti Gangadhar Redkar','CF2724' UNION
SELECT '10-B','Miss Shalvi Sachin Malke','CF2725' UNION
SELECT '10-B','Miss Shatakshi Mohan Giri','CF2726' UNION
SELECT '10-B','Miss Tanishka Bhalchandra Shete','CF2727' UNION
SELECT '10-B','Miss Tanishka Sachinkumar Shete','CF2728' UNION
SELECT '10-B','Miss Vedanshi Kishor Sonawale','CF2729' UNION
SELECT '10-B','Master Akshath Vivek Chitodkar','CF2730' UNION
SELECT '10-B','Master Anay Bhushan Waikar','CF2731' UNION
SELECT '10-B','Master Arnav Kiran Mehta','CF2732' UNION
SELECT '10-B','Master Aryan Dinesh Bhagwat','CF2733' UNION
SELECT '10-B','Master Atharva Ajay Ravetkar','CF2734' UNION
SELECT '10-B','Master Ayush Atul Daptardar','CF2735' UNION
SELECT '10-B','Master Devansh Sachin Pawar','CF2736' UNION
SELECT '10-B','Master Ojas Suyog Kulkarni','CF2737' UNION
SELECT '10-B','Master Rajendra Pravin Katkar','CF2738' UNION
SELECT '10-B','Master Saarthak Pramod Yadav','CF2739' UNION
SELECT '10-B','Master Sanskar Sandeep Paygude','CF2740' UNION
SELECT '10-B','Master Sarthak Vishal Kodulkar','CF2741' UNION
SELECT '10-B','Master Shashwat Mahesh Sirmewar','CF2742' UNION
SELECT '10-B','Master Shlok Suresh Paigude','CF2600' UNION
SELECT '10-B','Master Shreyas Ratnakar Birajdar','CF2743' UNION
SELECT '10-B','Master Vedant Sachin Gomsale','CF2744' UNION
SELECT '10-B','Master Vihaan Nitin Soni','CF2745' UNION
SELECT '10-B','Master Vihan Amol Kenjale','CF2746' UNION
SELECT '10-C','Miss Aditi Umeshchandra Karvekar','CF2747' UNION
SELECT '10-C','Miss Anushka Umesh Pardeshi','CF2748' UNION
SELECT '10-C','Miss Anushree Santosh Shelar','CF2749' UNION
SELECT '10-C','Miss Bilva Ganesh Marne','CF2750' UNION
SELECT '10-C','Miss Dhruvi Prasad Marne','CF2751' UNION
SELECT '10-C','Miss Hrucha Sandip Nanekar','CF2752' UNION
SELECT '10-C','Miss Kanak Minesh Zawar','CF2753' UNION
SELECT '10-C','Miss Mrunmayee Saimanohar Prabhu','CF2754' UNION
SELECT '10-C','Miss Navya Neeraj Shukla','CF2755' UNION
SELECT '10-C','Miss Palak Nitin Bharadiya','CF2756' UNION
SELECT '10-C','Miss Reva Rupesh Subhedar','CF2757' UNION
SELECT '10-C','Miss Saee Somnath Deshmukh','CF2758' UNION
SELECT '10-C','Miss Sanvi Ravindra Sonna','CF2759' UNION
SELECT '10-C','Miss Sarangi Rohan Patil','CF2760' UNION
SELECT '10-C','Miss Shriya Prashant Khandgave','CF2761' UNION
SELECT '10-C','Miss Swara Nilesh Suryawanshi','CF2762' UNION
SELECT '10-C','Miss Swarangi Ajit Katkar','CF2763' UNION
SELECT '10-C','Miss Tanaya Dattatray Powar','CF2764' UNION
SELECT '10-C','Miss Tanishka Prataprao More','CF2765' UNION
SELECT '10-C','Master Aarush Ganesh Pardeshi','CF2791' UNION
SELECT '10-C','Master Aayush Rhudaynath Diwate','CF2796' UNION
SELECT '10-C','Master Adit Avadhoot Bhandare','CF2798' UNION
SELECT '10-C','Master Anshul Santosh Pawar','CF2802' UNION
SELECT '10-C','Master Arnav Somnath Maindargikar','CF2805' UNION
SELECT '10-C','Master Avadhoot Ajay Bhosale','CF2809' UNION
SELECT '10-C','Master Harsh Mukund Khopkar','CF2811' UNION
SELECT '10-C','Master Indraneel Kaustubh Joshi','CF2812' UNION
SELECT '10-C','Master Ishan Chetan Brahmankar','CF2813' UNION
SELECT '10-C','Master Krish Rajesh Shetty','CF2814' UNION
SELECT '10-C','Master Ojas Hemant Moharir','CF2815' UNION
SELECT '10-C','Master Pritesh Kiran Mhetre','CF2816' UNION
SELECT '10-C','Master Sharvil Ajit Katkar','CF2817' UNION
SELECT '10-C','Master Swareet Rohan Patil','CF2818' UNION
SELECT '10-C','Master Varun Ranjit Patil','CF2819' UNION
SELECT '10-C','Master Vedang Dinesh Kulkarni','CF2820' UNION
SELECT '10-C','Master Vedant Nagesh Dhawade','CF2821' UNION
SELECT '10-C','Master Viraj Anand Paltewar','CF2822' UNION
SELECT '10-C','Master Yash Bhutada','CF2823' UNION
SELECT '10-D','Miss Aadya Sachin Nikam','CF2837' UNION
SELECT '10-D','Miss Aakanksha Indrajeet Desai','CF2838' UNION
SELECT '10-D','Miss Aarya Ganesh Ingale','CF2840' UNION
SELECT '10-D','Miss Aditi Pravinkumar Patil','CF2844' UNION
SELECT '10-D','Miss Anaya Arun Godase','CF2846' UNION
SELECT '10-D','Miss Anshika Samir Tathe','CF2849' UNION
SELECT '10-D','Miss Asmi Anand Manurkar','CF2852' UNION
SELECT '10-D','Miss Durva Dhananjay Jadhav','CF2854' UNION
SELECT '10-D','Miss Kasturi Vikramsingh Khanade','CF2856' UNION
SELECT '10-D','Miss Komal Nitin Matale','CF2859' UNION
SELECT '10-D','Miss Prachi Sunil Alimkar','CF2862' UNION
SELECT '10-D','Miss Riedhee Amol Khade','CF2864' UNION
SELECT '10-D','Miss Ruja Jagdeesh Kamble','CF2867' UNION
SELECT '10-D','Miss Saanvi Manish Warade','CF2869' UNION
SELECT '10-D','Miss Sanskruti Vaijanath Darade','CF2870' UNION
SELECT '10-D','Miss Shravani Rahul Durge','CF2872' UNION
SELECT '10-D','Miss Shravani Sidheswar Kumbhar','CF2874' UNION
SELECT '10-D','Miss Soumya Chetan Suryawanshi','CF2900' UNION
SELECT '10-D','Miss Surbhie Kishor Shendge','CF2881' UNION
SELECT '10-D','Miss Tanvi Tanuj Dashottar','CF2882' UNION
SELECT '10-D','Miss Tejaswini Rahul Suryavanshi','CF2883' UNION
SELECT '10-D','Master Aarya Vivek Kuber','CF2884' UNION
SELECT '10-D','Master Abhimanyu Avinash Utekar','CF2885' UNION
SELECT '10-D','Master Akarsh Omprakash Singh','CF2886' UNION
SELECT '10-D','Master Atharva Satish Deshmukh','CF2887' UNION
SELECT '10-D','Master Atharva Shashikant Nanaware','CF2888' UNION
SELECT '10-D','Master Atharva Suhas Patil','CF2889' UNION
SELECT '10-D','Master Ayush Avinash Chavan','CF2890' UNION
SELECT '10-D','Master Devansh Rajendra Badhe','CF2891' UNION
SELECT '10-D','Master Farhan Anjum Naikwadi','CF2892' UNION
SELECT '10-D','Master Hridhish Mahesh Jadhav','CF2893' UNION
SELECT '10-D','Master Ishan Shreyash Nikam','CF2894' UNION
SELECT '10-D','Master Manas Prashant Neve','CF2895' UNION
SELECT '10-D','Master Mihir Rahul Dhope','CF2896' UNION
SELECT '10-D','Master Rahul Shivananjappa','CF2897' UNION
SELECT '10-D','Master Shubham Vikas Kshirsagar','CF2898' UNION
SELECT '10-D','Master Swarup Rahul Walhekar','CF2899' UNION
SELECT '10-E','Miss Aastha Sandip Hagawane','CF2901' UNION
SELECT '10-E','Miss Ananya Nitin Ghadage','CF2902' UNION
SELECT '10-E','Miss Ananya Vivek Pathak','CF2903' UNION
SELECT '10-E','Miss Avikareddy Ganpalreddy Yellalwad','CF2904' UNION
SELECT '10-E','Miss Drishti Harish Popali','CF2905' UNION
SELECT '10-E','Miss Ilesha Prashant Sonawane','CF2906' UNION
SELECT '10-E','Miss Isha Amol Pawar','CF2907' UNION
SELECT '10-E','Miss Janhavi Mangesh Thakar','CF2908' UNION
SELECT '10-E','Miss Rhea Chandrarao More','CF2909' UNION
SELECT '10-E','Miss Rijul Vinit Doshi','CF2910' UNION
SELECT '10-E','Miss Saanvi Prakash Chavan','CF2911' UNION
SELECT '10-E','Miss Saisha Vinay Kulkarni','CF2912' UNION
SELECT '10-E','Miss Saloni Kamal Das','CF2913' UNION
SELECT '10-E','Miss Sawari Vinay Mate','CF2914' UNION
SELECT '10-E','Miss Shambhavi Shrikant Tilwankar','CF2915' UNION
SELECT '10-E','Miss Shravani Onkar Kulkarni','CF2916' UNION
SELECT '10-E','Miss Siddhi Nikesh Nankar','CF2917' UNION
SELECT '10-E','Miss Swara Shantisagar Patil','CF2918' UNION
SELECT '10-E','Miss Swara Vishwas More','CF2919' UNION
SELECT '10-E','Miss Swarali Somnath Ingawale','CF2920' UNION
SELECT '10-E','Miss Tanishka Mahesh Bhamare','CF2921' UNION
SELECT '10-E','Master Adi Prashant Ambavkar','CF2922' UNION
SELECT '10-E','Master Amey Mahesh Ghongade','CF2923' UNION
SELECT '10-E','Master Anantraj Abhijeet Durugkar','CF2924' UNION
SELECT '10-E','Master Ansh Chaurasia','CF2925' UNION
SELECT '10-E','Master Anvay Ashok Poojary','CF2926' UNION
SELECT '10-E','Master Arnav Kailas Karajkhede','CF2927' UNION
SELECT '10-E','Master Arnav Pankaj Padole','CF2928' UNION
SELECT '10-E','Master Avadhoot Dharmraj More','CF2929' UNION
SELECT '10-E','Master Avadhoot Nilesh Patil','CF2930' UNION
SELECT '10-E','Master Ayush Dhananjay Pawar','CF2931' UNION
SELECT '10-E','Master Ganesh Vitthal Wanjale','CF2932' UNION
SELECT '10-E','Master Om Ajay Mate','CF2933' UNION
SELECT '10-E','Master Parth Ravindra Pawar','CF2934' UNION
SELECT '10-E','Master Prathamesh Nilesh Choube','CF2935' UNION
SELECT '10-E','Master Pruthviraj Atulkumar Patil','CF2936' UNION
SELECT '10-E','Master Raj Sandip Hagawane','CF2937' UNION
SELECT '10-E','Master Sarvesh Vijay Patil','CF2938' UNION
SELECT '10-E','Master Vedant Dhananjay Pandhare','CF2939' UNION
SELECT '10-E','Master Viraj Vikas Davare','CF2940' UNION
SELECT '10-F','Miss Arnavi Rajesh Ghuge','CF2832' UNION
SELECT '10-F','Miss Asmita Rupesh Ovhal','CF2833' UNION
SELECT '10-F','Miss Avani Sameer Vasudev','CF2834' UNION
SELECT '10-F','Miss Bhoomi Ravindra Sonawane','CF2836' UNION
SELECT '10-F','Miss Durwa Mahadev Kalshetti','CF2839' UNION
SELECT '10-F','Miss Manasi Amar Kumbhar','CF2843' UNION
SELECT '10-F','Miss Mihika Gokhale','CF2845' UNION
SELECT '10-F','Miss Nakshatra Ashish Reddy','CF2847' UNION
SELECT '10-F','Miss Namita Navnath Vidhate','CF2848' UNION
SELECT '10-F','Miss Nandini Shrikant Shinde','CF2850' UNION
SELECT '10-F','Miss Nihira Nilesh Badve','CF2851' UNION
SELECT '10-F','Miss Rujuta Dattatray Fere','CF2861' UNION
SELECT '10-F','Miss Samiksha Jaynath Mate','CF2865' UNION
SELECT '10-F','Miss Sanvi Kedar Dolas','CF2866' UNION
SELECT '10-F','Miss Shaurya Dilip Vasudeo','CF2871' UNION
SELECT '10-F','Miss Shreya Vishal Joshi','CF2875' UNION
SELECT '10-F','Miss Tripura Rakesh Gogawale','CF2877' UNION
SELECT '10-F','Miss Vedika Tushar Landge','CF2878' UNION
SELECT '10-F','Miss Yashi Singh','CF2880' UNION
SELECT '10-F','Master Aashay Amit Tungare','CF2824' UNION
SELECT '10-F','Master Aayush Sunil Katkar','CF2825' UNION
SELECT '10-F','Master Aditya Amol Vyawahare','CF2826' UNION
SELECT '10-F','Master Aditya Surendra Dangat','CF2827' UNION
SELECT '10-F','Master Advait Amit Vartak','CF2828' UNION
SELECT '10-F','Master Anay Abhinandan Mutha','CF2829' UNION
SELECT '10-F','Master Arjun Shrikant Nigade','CF2830' UNION
SELECT '10-F','Master Arnav Sachin Kharade','CF2831' UNION
SELECT '10-F','Master Ayush Anand Toshniwal','CF2835' UNION
SELECT '10-F','Master Ishan Sachin Surve','CF2841' UNION
SELECT '10-F','Master Malhar Vikas Garad','CF2842' UNION
SELECT '10-F','Master Pruthviraj Suresh Narsale','CF2853' UNION
SELECT '10-F','Master Rajdeep Vinod More','CF2855' UNION
SELECT '10-F','Master Rajveer Yuvraj Chavan','CF2857' UNION
SELECT '10-F','Master Rudra Abhishek Deshpande','CF2858' UNION
SELECT '10-F','Master Rudra Nareshkumar Gawai','CF2860' UNION
SELECT '10-F','Master Sameer Dattatray Marne','CF2863' UNION
SELECT '10-F','Master Sarthak Ramdas Sawant','CF2868' UNION
SELECT '10-F','Master Shlok Mahesh Dedge','CF2873' UNION
SELECT '10-F','Master Swaraj Abhijeet Medhekar','CF2876' UNION
SELECT '10-F','Master Vittesh Laxmikant Shinde','CF2879' UNION
SELECT '10-G','Miss Aditi Avinash Kowale','CF2769' UNION
SELECT '10-G','Miss Arnavi Prashant Khake','CF2771' UNION
SELECT '10-G','Miss Arshi Anand Deshmukh','CF2772' UNION
SELECT '10-G','Miss Arya Sushil Chavan','CF2773' UNION
SELECT '10-G','Miss Avani Mandar Dumale','CF2776' UNION
SELECT '10-G','Miss Bhairavee Shripad Date','CF2777' UNION
SELECT '10-G','Miss Gargi Nilesh Gaikwad','CF2778' UNION
SELECT '10-G','Miss Ishita Chaitanya Tilwankar','CF2779' UNION
SELECT '10-G','Miss Purva Prashant Kanade','CF2782' UNION
SELECT '10-G','Miss Rashi Pramod Gavali','CF2783' UNION
SELECT '10-G','Miss Saanvi Shrinivas Dombe','CF2786' UNION
SELECT '10-G','Miss Samiksha Rahul Saraf','CF2788' UNION
SELECT '10-G','Miss Sanskruti Yuvaraj Phalke','CF2789' UNION
SELECT '10-G','Miss Sarika Sanjay Gaikwad','CF2790' UNION
SELECT '10-G','Miss Saumya Sunil Revandikar','CF2793' UNION
SELECT '10-G','Miss Shreya Ankesh Joshi','CF2797' UNION
SELECT '10-G','Miss Shruti Vishal Benkar','CF2799' UNION
SELECT '10-G','Miss Soumya Sachin Waingade','CF2801' UNION
SELECT '10-G','Miss Tanishka Ranjeet Patil','CF2803' UNION
SELECT '10-G','Miss Tanishkka Pratap Gawande','CF2804' UNION
SELECT '10-G','Miss Vedika Dattatraya Gosavi','CF2807' UNION
SELECT '10-G','Master Aadim Vikram Boralkar','CF2766' UNION
SELECT '10-G','Master Aadit Siddheshwar Hawanale','CF2767' UNION
SELECT '10-G','Master Aayush Bhupendra More','CF2768' UNION
SELECT '10-G','Master Amogh Ajay Naiknaware','CF2770' UNION
SELECT '10-G','Master Aryan Narendra Rothe','CF2774' UNION
SELECT '10-G','Master Aryan Sandeep Thorbole','CF2775' UNION
SELECT '10-G','Master Jashn Vipul Jodhani','CF2780' UNION
SELECT '10-G','Master Kundan Karan Koditkar','CF2781' UNION
SELECT '10-G','Master Rugved Amit Thokal','CF2784' UNION
SELECT '10-G','Master Rugved Santosh Pachpute','CF2785' UNION
SELECT '10-G','Master Sahil Sargam Somani','CF2787' UNION
SELECT '10-G','Master Sarvesh Santosh Gaikwad','CF2792' UNION
SELECT '10-G','Master Shalabh Santosh Walke','CF2794' UNION
SELECT '10-G','Master Shantanu Santosh Walke','CF2795' UNION
SELECT '10-G','Master Soham Somnath Yelvantge','CF2800' UNION
SELECT '10-G','Master Vedant Madhav Sagare','CF2806' UNION
SELECT '10-G','Master Viraj Ramesh Ingawale','CF2808' UNION
SELECT '10-G','Master Zeeshan Latif Pansare','CF2810'

	update @tblStudentDetails
	set CancFormNo = replace(CancFormNo,'CF','')

	UPDATE TSD
	SET ScStudentId = BSD.SchoolWise_Student_Id
	FROM @tblStudentDetails TSD
	INNER JOIN vw_BaseStudentDetails BSD
	ON TSD.StudentName = BSD.StudentName
	INNER JOIN YearWise_Student_Details YSD
	ON BSD.SchoolWise_Student_Id = YSD.Student_Id
	INNER JOIN vw_standard_division VSD
	ON YSD.Standard_Id = VSD.Standard_Id
	AND YSD.Division_id = VSD.Division_Id
	AND TSD.ClassName = VSD.className
	WHERE YSD.Academic_Year_ID = 13
	AND YSD.School_Id = 71

	DECLARE @Id INT,	
		@CancFormNo NVARCHAR(100),
		@ScStudentId INT

	WHILE EXISTS
	(
		SELECT TOP 1 1
		FROM @tblStudentDetails
	)
	BEGIN

		SELECT TOP 1 @Id = Id, @ScStudentId = ScStudentId, @CancFormNo = CancFormNo
		FROM @tblStudentDetails
		
		EXEC usp_DeleteStudent @SchoolId  = 71,
			@AcademicYearId  = 13,
			@SchoolWise_Student_ID  = @ScStudentId,
			@Left_Date  = '2026-03-09',
			@Permanent_Delete = N'N',
			@IsForm  = 1,
			@CancellationFormNo  = @CancFormNo,
			@UpdatedById  = 2100,
			@IsIncludeinBlackList =0,
			@Comment  = ''

		delete from @tblStudentDetails
		where Id = @Id
	END

	print 'success!'
COMMIT TRANSACTION
END TRY
BEGIN CATCH
	PRINT ERROR_MESSAGE()
	ROLLBACK TRANSACTION
END CATCH