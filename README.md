# SQL Programming
                                                                                             
## Program 1:

### Aim: Demonstrating creation of tables, applying the view concepts on the tables.

### Program:Consider the following schema for a Library Database:

### BOOK
- Book_id: Unique identifier for each book.
- Title: Title of the book.
- Publisher_Name: Name of the publisher.
- Pub_Year: Year of publication.
### BOOK_AUTHORS
- Book_id: Foreign key referencing BOOK.
- Author_Name: Name of the author.

### PUBLISHER
- Name: Name of the publisher.
- Address: Publisher's address.
- Phone: Publisher's contact phone number.

### BOOK_COPIES
- Book_id: Foreign key referencing BOOK.
- Programme_id: Unique identifier for each library programme.
- No-of_Copies: Number of copies available in the library.

### BOOK_LENDING
- Book_id: Foreign key referencing BOOK.
- Programme_id: Foreign key referencing LIBRARY_PROGRAMME.
- Card_No: Unique identifier for library card.
- Date_Out: Date when the book was checked out.
- Due_Date: Due date for returning the book.
### LIBRARY_PROGRAMME
- Programme_id: Unique identifier for each library programme.
- Programme_Name: Name of the library programme.
- Address: Address of the library programme.

 
 ### Write SQL queries to
 1. Retrieve details of all books in the library – id, title, name of publisher, authors, number of
copies in each Programme, etc.
 2. Get the particulars of borrowers who have borrowed more than 3 books, but
from Jan 2017 to Jun 2017.
 3. Delete a book in BOOK table. Update the contents of other tables to reflect this
data manipulation operation.
 4. Partition the BOOK table based on year of publication. Demonstrate its working
with a simple query.
 5. Create a view of all books and its number of copies that are currently available in
the Library.
### -----------------------------------------------------------------------------------------------------------------------------
## Program 2:

### Aim: Discuss the various concepts on constraints and update operations.

### Program: Consider the following schema for Order Database:

### SALESMAN
- Salesman_id: Unique identifier for each salesman.
- Name: Name of the salesman.
- City: City where the salesman is located.
- Commission: Commission percentage for the salesman.

### CUSTOMER
- Customer_id: Unique identifier for each customer.
- Cust_Name: Name of the customer.
- City: City where the customer is located.
- Grade: Grade assigned to the customer.
- Salesman_id: Foreign key referencing SALESMAN.

### ORDERS
- Ord_No: Unique identifier for each order.
- Purchase_Amt: Purchase amount for the order.
- Ord_Date: Date of the order.
- Customer_id: Foreign key referencing CUSTOMER.
- Salesman_id: Foreign key referencing SALESMAN.


### Write SQL queries to
1. Count the customers with grades above Bangalore’s average.
 2. Find the name and numbers of all salesman who had more than one customer.
 3. List all the salesman and indicate those who have and don’t have customers in their cities
(Use UNION operation.)
 4. Create a view that finds the salesman who has the customer with the highest order of a day.
 5. Demonstrate the DELETE operation by removing salesman with id 1000. All his orders must
also be deleted.
### -----------------------------------------------------------------------------------------------------------------------------
## Program 3:

### Aim: Demonstrate the concepts of JOIN operations.

### Program: Consider the schema for Movie Database:

### ACTOR
- Act_id: Unique identifier for each actor.
- Act_Name: Name of the actor.
- Act_Gender: Gender of the actor.

### DIRECTOR
- Dir_id: Unique identifier for each director.
- Dir_Name: Name of the director.
- Dir_Phone: Phone number of the director.

### MOVIES
- Mov_id: Unique identifier for each movie.
- Mov_Title: Title of the movie.
- Mov_Year: Year of the movie's release.
- Mov_Lang: Language of the movie.
- Dir_id: Foreign key referencing DIRECTOR.

### MOVIE_CAST
- Act_id: Foreign key referencing ACTOR.
- Mov_id: Foreign key referencing MOVIES.
- Role: Role played by the actor in the movie.

### RATING
- Mov_id: Foreign key referencing MOVIES.
- Rev_Stars: Rating in stars given to the movie.

### Write SQL queries to
1. List the titles of all movies directed by ‘Hitchcock’.
2. Find the movie names where one or more actors acted in two or more movies.
3. List all actors who acted in a movie before 2000 and also in a movie after 2015(use JOIN
operation).
4. Find the title of movies and number of stars for each movie that has at least one rating and find
the highest number of stars that movie received. Sort the result by
movie title.
5. Update rating of all movies directed by ‘Steven Spielberg’ to 5.
### -----------------------------------------------------------------------------------------------------------------------------
## Program 4:

### Aim: Introduce concepts of PLSQL and usage on the table.

### Program: Consider the schema for College Database:

### STUDENT
- USN: Unique identifier for each student.
- SName: Name of the student.
- Address: Address of the student.
- Phone: Phone number of the student.
- Gender: Gender of the student.

### SEMSEC
- SSID: Unique identifier for each semester-section combination.
- Sem: Semester number.
- Sec: Section identifier.

### CLASS
- USN: Foreign key referencing STUDENT.
- SSID: Foreign key referencing SEMSEC.

### COURSE
- Subcode: Unique identifier for each course.
- Title: Title of the course.
- Sem: Semester in which the course is offered.
- Credits: Credits associated with the course.

### IAMARKS
- USN: Foreign key referencing STUDENT.
- Subcode: Foreign key referencing COURSE.
- SSID: Foreign key referencing SEMSEC.
- Test1: Marks obtained in Test 1.
- Test2: Marks obtained in Test 2.
- Test3: Marks obtained in Test 3.
- FinalIA: Final internal assessment marks.


### Write SQL queries to
 1. List all the student details studying in fourth semester ‘C’ section.
 2. Compute the total number of male and female students in each semester and in each
section.
 3. Create a view of Test1 marks of student USN ‘1BI15CS101’ in all Courses.
 4. Calculate the FinalIA (average of best two test marks) and update the corresponding table
for all students.
 5. Categorize students based on the following criterion:
 If FinalIA = 17 to 20 then CAT = ‘Outstanding’
 If FinalIA = 12 to 16 then CAT = ‘Average’
 If FinalIA< 12 then CAT = ‘Weak’
Give these details only for 8th semester A, B, and C section students.
### -----------------------------------------------------------------------------------------------------------------------------
## Program 5:

### Aim: Demonstrate the core concepts on table like nested and correlated nesting queries and also EXISTS and NOT EXISTS keywords.

### Program: Consider the schema for Company Database:

### EMPLOYEE
- SSN: Social Security Number, unique identifier for each employee.
- Name: Name of the employee.
- Address: Address of the employee.
- Sex: Gender of the employee.
- Salary: Salary of the employee.
- SuperSSN: Supervisor's Social Security Number.
- DNo: Department Number to which the employee belongs.

### DEPARTMENT
- DNo: Unique identifier for each department.
- DName: Name of the department.
- MgrSSN: Social Security Number of the department manager.
- MgrStartDate: Date when the manager started in the department.

### DLOCATION
- DNo: Foreign key referencing DEPARTMENT.
- DLoc: Location of the department.

### PROJECT
- PNo: Unique identifier for each project.
- PName: Name of the project.
- PLocation: Location of the project.
- DNo: Foreign key referencing DEPARTMENT.

### WORKS_ON
- SSN: Foreign key referencing EMPLOYEE.
- PNo: Foreign key referencing PROJECT.
- Hours: Number of hours the employee works on the project.

### Write SQL queries to
1. Make a list of all project numbers for projects that involve an employee whose last name is ‘Scott’,
either as a worker or as a manager of the department that controls the project.
2. Show the resulting salaries if every employee working on the ‘IoT’ project is given a 10 percent
raise.
3. Find the sum of the salaries of all employees of the ‘Accounts’ department, as well as the maximum
salary, the minimum salary, and the average salary in this department
4. Retrieve the name of each employee who works on all the projects controlled by department
number 5 (use NOT EXISTS operator).
5. For each department that has more than five employees, retrieve the department number and the
number of its employees who are making more than Rs.6,00,000.
### -----------------------------------------------------------------------------------------------------------------------------

## Contributor
- [Victor Ikechukwu Agughasi](https://github.com/Victor-Ikechukwu)
- [Sujal N Murthy](https://github.com/SujalNMurthy)
