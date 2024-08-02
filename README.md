			---Private School Billing System---

--Description--
This project is a billing system for private schools, Designed so that both 
administrators and students of a private school can manage and edit information 
related to payments and personal data of enrolled and aspiring students.
The system is developed using Java.

--Features--
+CRUD Students
+Payments registration and queries
+Check and modify payment details
+Check and modify information about enrolled students

--Project Structure--
The system is structured by three packages, each one including its respective functions, 
classes and methods:

+Interface: Due to the lack of visual interfaces, this package it's just to call the neccesary 
method to inicializate the program.
	
	>App: Main class that starts the application

+Logic:This package is used to store the classes in charge of managing the information, 
variables and mostly all the methods that will be used when executing the system.

	>Student: This class has the variables and methods related to each student's 
	information (enrollment, name, age, date of birth, tutor, tutor's name, 
	address, phone number and their category in the system).

	>Event: This class has the variables and methods related to event information 
	(code, name and date).

	>Login:This class contains the function that allows access to the system by displaying a simple login menu. 
	In order to be executed, it uses variables and methods from other classes.

	>Menu: This class contains the methods that allow you to navigate through the system 
	menus. To run it, it uses variables and methods from other classes.

	>Payment: This class has the variables and methods related to payment information 
	(reference, date, educational level, period, student and amount).

	>Valid: This class contains the methods that work with menu validations.

+Persistence:This package has the function of storing the classes that allow the code to connect to the database
and do multiple task and editing information in the database.

	>StudentDAO:This class is responsible for storing the methods in charge of 
	managing and editing student information in the database.

	>DatabaseConnection:This class is responsible for storing 
	the connection to the database.

	>EventDAO:This class is responsible for storing the methods in charge of 
	managing and editing the event information in the database.

	>PayDAO:This class is responsible for storing the methods in charge of managing and 
	editing payment information in the database.

--Usage--
+Logging in: Once the program has been executed, it will display a welcome screen where users can access the program as 
students or as administrators using either their enrolled assigned by the institution or their administrator code respectively;
if a type of data or a code unknown to the system is entered, the following message will be displayed: "Invalid registration. 
Please try again." and it will allow the user to return to the home screen to retry accessing the system.

+System Menus

	>Student Menu
	The student menu allows students to manage their personal information and perform actions related to their payments. 
	The following are the available options:

	->View Personal Information: Allows the student to view their personal information recorded in the system.
	->Make a Payment: Allows the student to make pending payments.
	->View Payment History: Allows the student to review the history of all payments they have made.
	->Log Out: Closes the student's current session.
	->Close Program: Ends the program execution.
	
	>Administrator Menu
	The administrator menu provides options to manage students, payments, and payment concepts. 
	The available options are:

	->Manage Students:
		Enroll a new student.
		Deregister an existing student.
		View student information.
		Modify a student's information.
	->Manage Payments:
		Manually insert a payment.
		Delete an existing payment.
		View payment information.
		Modify payment information.
	->Logout: Closes the current administrator session.
	->Close program: Ends the execution of the program.
