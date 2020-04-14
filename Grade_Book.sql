-- Write the commands for creating tables and inserting values

DROP TABLE IF EXISTS `STUDENT`;
CREATE TABLE `STUDENT` (
    `FirstName` varchar(255) DEFAULT NULL,
    `LastName` varchar(255) DEFAULT NULL,
    `Major` varchar(255) DEFAULT NULL,
    `StudentID` int(11) NOT NULL AUTO_INCREMENT,
    PRIMARY KEY (`StudentID`)
) ENGINE=InnoDB;


DROP TABLE IF EXISTS `GRADEBOOK`;
CREATE TABLE `GRADEBOOK` (
    `StudentID` int(11) NOT NULL,
    `AssignmentID` int(11) NOT NULL,
    `Point` int(11) DEFAULT 0 NOT NULL,
    PRIMARY KEY (`StudentID`, `AssignmentID`)
) ENGINE=InnoDB;


DROP TABLE IF EXISTS `ASSIGNMENT`;
CREATE TABLE `ASSIGNMENT` (
    `AssignmentID` int(11) NOT NULL UNIQUE AUTO_INCREMENT,
    `DistributionID` int(11) NOT NULL,
    `Instance` int(11) NOT NULL,
    `PointsPossible` int(11) DEFAULT 0 NOT NULL,
    PRIMARY KEY (`AssignmentID`)
) ENGINE=InnoDB;


DROP TABLE IF EXISTS `DISTRIBUTION`;
CREATE TABLE `DISTRIBUTION` (
    `DistributionID` int(11) NOT NULL UNIQUE,
    `CourseID` int(11) NOT NULL,
    `CategoryName` varchar(30) NOT NULL,
    `Percentage` int(11) NOT NULL,
    PRIMARY KEY(`DistributionID`)
) ENGINE=InnoDB;


DROP TABLE IF EXISTS `ENROLLMENT`;
CREATE TABLE `ENROLLMENT` (
    `StudentID` int(11) NOT NULL,
    `CourseID` int(11) NOT NULL,
    PRIMARY KEY (`StudentID`, `CourseID`)
) ENGINE=InnoDB;


DROP TABLE IF EXISTS `COURSE`;
CREATE TABLE `COURSE` (
    `Department` varchar(255) NOT NULL,
    `CourseNumber` int(11) NOT NULL,
    `CourseName` varchar(255) NOT NULL,
    `Term` varchar(255) NOT NULL,
    `Year` int(5) NOT NULL,
    `CourseID` int(11) NOT NULL UNIQUE AUTO_INCREMENT,
    PRIMARY KEY(`CourseID`)
) ENGINE=InnoDB;


INSERT INTO `STUDENT` 
VALUES
('Richard', 'Hendricks', 'Computer Science', 1234),
('Jared', 'Dunn', 'Management Science', 5678),
('Erlich', 'Bachman', 'Aviato', 3456),
('Jimmy', 'Quoyang', 'Marine Biology', 4590);

INSERT INTO `COURSE` 
VALUES
('Computer Science', 350, 'Programming Languages', 'Spring', 2020, 89994),
('English', 109, 'Technical Writing', 'Fall', 2020, 56738),
('Computer Science', 533, 'Senior Project', 'Spring', 2020, 90573);

INSERT INTO `ENROLLMENT` 
VALUES
(1234, 56738),
(5678, 56738),
(3456, 56738),
(4590, 56738),
(1234, 89994),
(1234, 90573);

INSERT INTO `DISTRIBUTION` 
VALUES
(5, 89994, 'Participation', 10),
(6, 89994, 'HW', 20),
(7, 89994, 'Projects', 20),
(8, 89994, 'Test', 50);

INSERT INTO `ASSIGNMENT` 
VALUES
(9, 5, 1, 100),
(10, 5, 2, 100),
(11, 6, 1, 100),
(12, 6, 2, 100),
(13, 7, 1, 100),
(14, 7, 2, 100),
(15, 8, 1, 100),
(16, 8, 2, 100),


INSERT INTO `GRADEBOOK` 
VALUES
(1234, 9, 81),
(5678, 9, 84),
(3456, 9, 95),
(4590, 9, 62),
(1234, 10, 81),
(5678, 10, 84),
(3456, 10, 95),
(4590, 10, 62),
(1234, 12, 87),
(5678, 12, 94),
(3456, 12, 55),
(4590, 12, 72),
(1234, 13, 87),
(5678, 13, 94),
(3456, 13, 55),
(4590, 13, 72);

--Number 3 Show the tables with the contents that you have inserted;
SELECT * FROM STUDENT;
SELECT * FROM ENROLLMENT;
SELECT * FROM COURSES;
SELECT * FROM STUDENTSCORES;
SELECT * FROM ASSIGNMENTS;
SELECT * FROM DISTRIBUTION;

-- Number 4, Compute the average/highest/lowest score of an assignment;
SELECT a.AssignmentID, avg(s.POINTS), max(s.POINTS), min(s.POINTS) 
FROM ASSIGNMENT a, GRADEBOOK s WHERE a.AssignmentID=2 AND s.AssignmentID=a.AssignmentID;

-- Number 5, List all students of a given course
SELECT s.FirstName FROM STUDENT s WHERE s.StudentID IN (SELECT e.StudentID FROM ENROLLMENT e WHERE e.CourseID=85675);
SELECT s.StudentID, s.FirstName FROM STUDENT s JOIN ENROLLMENT e WHERE e.CourseID = 85675 AND s.StudentID = e.StudentID;

-- Number 6: List all of the students in a course and all of their scores on every assignment
SELECT s.StudentID, s.FirstName, s.LastName, e.CourseID, g.AssignmentID, g.Points
FROM STUDENT s, ENROLLMENT e, GRADEBOOK g
WHERE s.StudentID = g.StudentId AND g.StudentID = e.StudentID AND e.CourseID = 5;

-- Number 7: Add an assignment to a course
INSERT INTO ASSIGNMENT
VALUES
(9, 5, 2, 80);

-- Number 8: Change the percentages of the categories for a course;
UPDATE DISTRIBUTION SET Percent = 45 WHERE CATEGORY = 'TEST';

-- Number 9: Add 2 points to the score of each student on an assignment;
UPDATE GRADEBOOK SET Point = Point + 2 WHERE AssignmentID = 9; 

-- Number 10: Add 2 points just to those students whose last name contains a ‘Q’.
UPDATE GRADEBOOK
SET Point = Point + 2
WHERE GRADEBOOK.StudentID = (SELECT StudentID FROM STUDENT WHERE GRADEBOOK.StudentID = 
                             STUDENT.StudentID AND STUDENT.LastName LIKE '%Q%');

-- 11
SELECT DISTINCT pt.StudentID, st.FirstName, st.LastName, pt.CourseID,pt.AssignmentID, pt.CategoryName, pt.Points
FROM (
     SELECT STUDENT.StudentID, AssignmentID, FirstName, LastName, CourseID, Points
     FROM STUDENT JOIN ENROLLMENT JOIN GRADEBOOK
     WHERE STUDENT.StudentID = ENROLLMENT.StudentID
     AND STUDENT.StudentID = SCORE.StudentID) st
jOIN
 (SELECT StudentID, CourseID, CategoryName, ASSIGNMENT.AssignmentID, Points
     FROM DISTRIBUTION JOIN ASSIGNMENT JOIN GRADEBOOK
     WHERE DISTRIBUTION.DistributionID = ASSIGNMENT.DistributionID
     AND ASSIGNMENT.AssignmentID = SCORE.AssignmentID) pt
WHERE st.AssignmentID = pt.AssignmentID
AND st.Points = pt.Points AND st.StudentID=1234;
 
 
-- -- exp
-- 
-- 

SELECT DISTINCT pt.StudentID, st.FirstName, st.LastName, pt.CourseID,pt.AssignmentID, pt.CategoryName, pt.Points, pt.PointsPossible, pt.Percentage
FROM (
    SELECT STUDENT.StudentID, AssignmentID, FirstName, LastName, CourseID, Points
    FROM STUDENT JOIN ENROLLMENT JOIN GRADEBOOK
    WHERE STUDENT.StudentID = ENROLLMENT.StudentID
    AND STUDENT.StudentID = GRADEBOOK.StudentID) st
JOIN
(SELECT StudentID, CourseID, CategoryName, ASSIGNMENT.AssignmentID, Points, ASSIGNMENT.PointsPossible, DISTRIBUTION.Percentage
    FROM DISTRIBUTION JOIN ASSIGNMENT JOIN GRADEBOOK
    WHERE DISTRIBUTION.DistributionID = ASSIGNMENT.DistributionID
    AND ASSIGNMENT.AssignmentID = SCORE.AssignmentID) pt
WHERE st.AssignmentID = pt.AssignmentID
AND st.Points = pt.Points AND st.StudentID=1234;
