--CREATE DATABASE
CREATE DATABASE CL_HDCSE_CMU_134_58;

USE CL_HDCSE_CMU_134_58;	

--CREATING DEPARTMENT TABLE
CREATE TABLE Department (Dep_id VARCHAR(10) PRIMARY KEY,Dep_name VARCHAR(40) NOT NULL);
INSERT INTO Department(Dep_id,Dep_name) Values ('D1','Computer science'),('D2','Business'),('D3','Engineering');
SELECT * FROM Department;

--CREATING COURSE TABLE
CREATE TABLE Course (Course_code VARCHAR(10) PRIMARY KEY,Title VARCHAR(100) NOT NULL,Credit_value INT NOT NULL,
Dep_id VARCHAR(10)FOREIGN KEY (Dep_id) REFERENCES Department(Dep_id));

--INSERT DATA INTO COURSE TABLE
--COMPUTER SCIENCE
INSERT INTO Course (Course_code, Dep_id, Title, Credit_value) VALUES
('CS1', 'D1', 'Introduction to Programming', 3),
('CS2', 'D1', 'Data Structures', 3),
('CS3', 'D1', 'Database Systems', 3),
('CS4', 'D1', 'Operating Systems', 4),
('CS5', 'D1', 'Computer Networks', 3),
('CS6', 'D1', 'Software Engineering', 4);
SELECT * FROM Course; 

--BUSINESS
INSERT INTO Course (Course_code, Dep_id, Title, Credit_value) VALUES
('BS1', 'D2', 'Principles of Management', 3),
('BS2', 'D2', 'Business Accounting', 3),
('BS3', 'D2', 'Marketing Management', 4),
('BS4', 'D2', 'Business Economics', 3),
('BS5', 'D2', 'Human Resource Management', 3),
('BS6', 'D2', 'Business Information Systems', 4);
SELECT * FROM Course;

--ENGINEERING
INSERT INTO Course (Course_code, Dep_id, Title, Credit_value) VALUES
('EN1', 'D3', 'Engineering Mathematics', 3),
('EN2', 'D3', 'Engineering Drawing', 3),
('EN3', 'D3', 'Basic Electrical Engineering', 4),
('EN4', 'D3', 'Mechanics of Materials', 3),
('EN5', 'D3', 'Thermodynamics', 4),
('EN6', 'D3', 'Engineering Materials', 3);
SELECT * FROM COURSE;

ALTER TABLE Course
ADD Status varchar(20);

UPDATE Course
SET Status = 'AVAILABLE'
WHERE Course_code IN ('CS1','CS2','CS3','CS5');

UPDATE Course
SET Status = 'AVAILABLE'
WHERE Course_code = 'CS4';

UPDATE Course
SET Status = 'UNAVAILABLE'
WHERE Course_code = 'CS6';

SELECT * FROM Course WHERE Course_code LIKE 'CS%';

UPDATE Course
SET Status = 'AVAILABLE'
WHERE Course_code IN ('BS1','BS2','BS3','BS4','BS5','BS6');

UPDATE Course
SET Status = 'AVAILABLE'
WHERE Course_code IN ('EN1','EN2','EN4','EN5','EN6');

UPDATE Course
SET Status = 'UNAVAILABLE'
WHERE Course_code = 'EN4';

UPDATE Course
SET Status = 'AVAILABLE'
WHERE Course_code = 'EN3';

SELECT * FROM Course;

--CREATING INSTRUCTOR TABLE
CREATE TABLE Instructor (Ins_id VARCHAR(10) PRIMARY KEY,Ins_name VARCHAR(30) NOT NULL,Qualification VARCHAR(30),
Dep_id VARCHAR(10) FOREIGN KEY  REFERENCES Department(Dep_id));

--INSERTING DATA INTO INSTRUCTOR TABLE
--COMPUTER SCIENCE DEPARTMENT
INSERT INTO Instructor (Ins_id,Ins_name,Qualification,Dep_id) VALUES
('TC1','NIMAL FONSEKA','MSC','D1'),
('TC2','SANDUNI PERERA','MSC','D1'),
('TC3','KAVINDU COORAY','PHD','D1'),
('TC4','MALSHI PERERA','PHD','D1'),
('TC5','NELUM WIJAY','MSC','D1');
SELECT * FROM Instructor;

--BUSINESS DEPARTMENT
INSERT INTO Instructor (Ins_id,Ins_name,Qualification,Dep_id) VALUES
('TB1','OSHEN KAVINDU','MSC','D1'),
('TB2','PRABHA JAYAWARDHANA ','MSC','D1'),
('TB3','YASIRI RANASINGHE','PHD','D1'),
('TB4','KAWYA FERNANDO','PHD','D1'),
('TB5','KANNAN MUTHTHUSAMY','MSC','D1');
SELECT * FROM Instructor;

UPDATE Instructor
SET Dep_id = 'D2'
WHERE Ins_id LIKE 'TB%';
SELECT * FROM Instructor WHERE Ins_id LIKE 'TB%';

--ENGINEERING DEPARTMENT
INSERT INTO Instructor (Ins_id,Ins_name,Qualification,Dep_id) VALUES
('TE1','ANUTHTHARA PERERA','MSC','D3'),
('TE2','ENOSH LIYANAGE ','MSC','D3'),
('TE3','HEMAL BANDARA','PHD','D3'),
('TE4','SENURI JAYAKODY','PHD','D3'),
('TE5','MOHOMMAD FAROOK','PHD','D3');
SELECT * FROM Instructor WHERE Dep_id = 'D3';

--CREATING SEMESTER TABLE
CREATE TABLE Semester (Sem_id VARCHAR(10) PRIMARY KEY);
INSERT INTO Semester (Sem_id) VALUES
('SEM1'),('SEM2'),('SEM3'),('SEM4'),('SEM5');
SELECT * FROM Semester;

--CREATING STUDENT TABLE
CREATE TABLE Student (St_id VARCHAR(10) PRIMARY KEY,F_name VARCHAR(30) NOT NULL,L_name VARCHAR(30) NOT NULL,DOB DATE,
NIC VARCHAR(20),Joined_date DATE);
INSERT INTO Student (St_id, F_name, L_name, DOB, NIC, Joined_date) VALUES
('S001', 'Nimal', 'Perera', '2002-03-14', '200212345V', '2022-02-01'),
('S002', 'Kamal', 'Silva', '2001-07-22', '200156789V', '2021-02-01'),
('S003', 'Saman', 'Fernando', '2002-11-05', '200234567V', '2022-02-01'),
('S004', 'Tharindu', 'Jayawardana', '2003-01-18', '200301234V', '2023-02-01'),
('S005', 'Isuru', 'Bandara', '2001-09-09', '200178901V', '2021-02-01'),

('S006', 'Sanduni', 'Kumari', '2002-06-30', '200245678V', '2022-02-01'),
('S007', 'Dilshan', 'Gunasekara', '2003-04-11', '200334567V', '2023-02-01'),
('S008', 'Pasindu', 'Herath', '2002-12-02', '200256789V', '2022-02-01'),
('S009', 'Hiruni', 'Senanayake', '2001-05-27', '200145678V', '2021-02-01'),
('S010', 'Chathura', 'Wijesinghe', '2003-08-19', '200389012V', '2023-02-01'),

('S011', 'Kavindu', 'Rathnayake', '2002-02-10', '200223456V', '2022-02-01'),
('S012', 'Sachini', 'Abeysekara', '2001-10-04', '200167890V', '2021-02-01'),
('S013', 'Nadeesha', 'Madushani', '2002-09-16', '200278901V', '2022-02-01'),
('S014', 'Supun', 'Pathirana', '2003-06-21', '200367890V', '2023-02-01'),
('S015', 'Pavithra', 'Weerasinghe', '2001-01-13', '200112345V', '2021-02-01'),

('S016', 'Shehan', 'Dissanayake', '2002-07-08', '200289012V', '2022-02-01'),
('S017', 'Dinuka', 'Karunaratne', '2003-03-25', '200345678V', '2023-02-01'),
('S018', 'Harsha', 'De Silva', '2001-12-17', '200190123V', '2021-02-01'),
('S019', 'Malith', 'Ekanayake', '2002-04-29', '200234890V', '2022-02-01'),
('S020', 'Yasith', 'Rajapaksha', '2003-11-06', '200389456V', '2023-02-01');


ALTER TABLE STUDENT 
ADD Dep_id VARCHAR(10) FOREIGN KEY REFERENCES Department(Dep_id);

UPDATE Student
SET Dep_id = 'D1' 
WHERE St_id in ('S001','S002','S003','S004','S005','S006','S007');

UPDATE Student
SET Dep_id = 'D2' 
WHERE St_id in ('S008','S009','S010','S011','S012','S013','S014');

UPDATE Student
SET Dep_id = 'D3' 
WHERE St_id in ('S015','S016','S017','S018','S019','S020');

SELECT * FROM Student;

--CREATING INSTRUCTOR_COURSE TABLE
CREATE TABLE Instructor_Course ( Ins_id VARCHAR(10) FOREIGN KEY REFERENCES Instructor(Ins_id),
Course_code VARCHAR(10) FOREIGN KEY REFERENCES Course(Course_code),PRIMARY KEY (Ins_id, Course_code) );

INSERT INTO Instructor_Course(Ins_id,Course_code) VALUES
('TC1','CS1'),('TC2','CS2'),('TC3','CS3'),('TC4','CS4'),('TC4','CS5'),('TC5','CS6'),
('TB1','BS1'),('TB2','BS2'),('TB3','BS3'),('TB4','BS4'),('TB5','BS5'),('TB5','BS6'),
('TE1','EN1'),('TE2','EN2'),('TE3','EN3'),('TE3','EN4'),('TE4','EN5'),('TE5','EN6');
SELECT * FROM Instructor_Course;

--CREATING STUDENT_COURSE TABLE
CREATE TABLE Student_Course (St_id VARCHAR(10) FOREIGN KEY  REFERENCES Student(St_id),
         Course_code VARCHAR(10) FOREIGN KEY  REFERENCES Course(Course_code),
         PRIMARY KEY (St_id, Course_code));

INSERT INTO Student_Course (St_id,Course_code) VALUES
('S001','CS1'),('S002','CS1'),('S003','CS2'),('S004','CS3'),('S005','CS4'),('S006','CS5'),('S007','CS5'),

('S008','BS1'),('S009','BS2'),('S010','BS3'),('S011','BS4'),('S012','BS5'),('S013','BS6'),('S014','BS6'),

('S015','EN1'),('S016','EN2'),('S017','EN3'),('S018','EN3'),('S019','EN5'),('S020','EN6');

INSERT INTO Student_Course (St_id,Course_code) VALUES
('S001','CS2'),('S001','CS5'),('S002','CS4'),('S003','CS4'),('S005','CS1'),('S006','CS2'),('S007','CS3'),

('S001','CS3'),('S002','CS2'),('S002','CS5'),('S004','CS2'),('S005','CS5'),('S006','CS1'),('S007','CS2'),

('S001','CS4'),('S002','CS3'),('S003','CS3'),('S004','CS1'),('S005','CS2'),('S006','CS3');

INSERT INTO Student_Course (St_id,Course_code) VALUES
('S008','BS2'),('S008','BS5'),('S009','BS1'),('S010','BS1'),('S011','BS2'),('S012','BS4'),('S013','BS4'),

('S008','BS3'),('S008','BS6'),('S009','BS5'),('S010','BS2'),('S011','BS3'),('S012','BS1'),('S013','BS2'),

('S008','BS4'),('S009','BS3'),('S010','BS4'),('S011','BS1'),('S012','BS2'),('S013','BS3');

INSERT INTO Student_Course (St_id,Course_code) VALUES
('S014','BS2'),('S014','BS1'),('S015','EN2'),('S016','EN1'),('S017','EN5'),('S018','EN6'),('S020','EN5'),

('S014','BS3'),('S015','EN6'),('S016','EN5'),('S017','EN2'),('S017','EN6'),('S019','EN1'),('S020','EN2'),

('S014','BS5'),('S015','EN3'),('S016','EN3'),('S017','EN1'),('S018','EN2'),('S019','EN3');


SELECT * FROM Student_Course; 

--CREATING SEMESTER_COURSE TABLE
CREATE TABLE Semester_Course (Sem_id VARCHAR(10) FOREIGN KEY  REFERENCES Semester(Sem_id),
Course_code VARCHAR(10)  FOREIGN KEY  REFERENCES Course(Course_code),
PRIMARY KEY (Sem_id, Course_code));

INSERT INTO Semester_Course (Sem_id,Course_code) VALUES
('SEM1','CS1'),('SEM2','CS2'),('SEM3','CS3'),('SEM4','CS4'),('SEM5','CS5'),

('SEM1','BS1'),('SEM2','BS2'),('SEM3','BS3'),('SEM4','BS5'),('SEM5','BS6'),

('SEM1','EN1'),('SEM2','EN2'),('SEM3','EN4'),('SEM4','EN5'),('SEM5','EN6');

SELECT * FROM Semester_Course;

--CREATING STUDENT_CONTACT_NUMBER TABLE
CREATE TABLE Student_ConNumber (St_id VARCHAR(10) FOREIGN KEY REFERENCES Student(St_id),Con_Number varchar(15),
PRIMARY KEY (St_id,Con_Number));

INSERT INTO Student_ConNumber (St_id, Con_Number) VALUES
('S001', '0771234567'),
('S002', '0782345678'),
('S003', '0753456789'),
('S004', '0764567890'),
('S005', '0775678901'),
('S006', '0726789012'),
('S007', '0717890123'),
('S008', '0788901234'),
('S009', '0759012345'),
('S010', '0760123456'),
('S011', '0779876543'),
('S012', '0788765432'),
('S013', '0757654321'),
('S014', '0766543210'),
('S015', '0775432109'),
('S016', '0724321098'),
('S017', '0713210987'),
('S018', '0782109876'),
('S019', '0751098765'),
('S020', '0760987654');
SELECT * FROM Student_ConNumber;

USE  CL_HDCSE_CMU_134_58;










-------------------------------------------------------------ASSIGNMENT Q(5)
--------------ANSWERS
--(I)LIST OF AVAILBALE COURSES

SELECT  
   c.Course_code,
   c.Title AS Course_Title,
   c.Status 
FROM Course c
WHERE Status = 'AVAILABLE';



--(II)STUDENTS ENROLLED IN THE COMPUTER SCIENCE DEPARTMENT

--ANSWER 1
SELECT DISTINCT
    s.St_id,
    s.F_name,
    s.L_name
FROM Student s
JOIN Student_Course sc ON s.St_id = sc.St_id
JOIN Course c ON sc.Course_code = c.Course_code
JOIN Department d ON c.Dep_id = d.Dep_id
WHERE d.Dep_name = 'Computer Science';

--ANSWER 2
SELECT 
  s.St_id,
  s.F_name,
  s.L_name
FROM Student s
WHERE s.Dep_id = 'D1';

--(III)COURSES WITH THEIR ASSSIGNED INSTRUCTORS

SELECT 
  c.Course_code,
  c.Title AS Course_title,
  i.Ins_name AS Instructor_name
FROM Course c
JOIN Instructor_course ic ON ic.Course_code = c.Course_code
JOIN  Instructor i ON i.Ins_id = ic.Ins_id
ORDER BY c.Course_code;

--(IV)COUNT OF HOW MANY STUDENTS FOR EACH COURSE

SELECT 
  c.Course_code,
  c.Title ,
  COUNT(sc.St_id) AS Student_count
FROM Course c
LEFT JOIN Student_Course sc 
        ON c.Course_code = sc.Course_code
GROUP BY c.Course_code,c.Title;  

--(V)students who have registered for all courses offered by the IT department


SELECT s.St_id, s.F_name, s.L_name
FROM Student s
JOIN Student_Course sc ON s.St_id = sc.St_id
JOIN Course c ON sc.Course_code = c.Course_code
WHERE c.Dep_id = 'D1'
AND c.Status = 'AVAILABLE'
GROUP BY s.St_id, s.F_name, s.L_name
HAVING COUNT(DISTINCT c.Course_code) = (
    SELECT COUNT(*)
    FROM Course
    WHERE Dep_id = 'D1'
    AND Status = 'AVAILABLE'
);




































































