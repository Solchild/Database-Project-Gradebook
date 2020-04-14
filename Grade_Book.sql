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
    `POINTS` int(11) DEFAULT 0 NOT NULL,
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
('Computer Science', 350, 'Programming Languages', 'Spring', 2017, 89994),
('English', 109, 'Technical Writing', 'Fall', 2016, 56738),
('Computer Science', 533, 'Senior Project', 'Spring', 2017, 90573);

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
(5, 89994, 'Participation', 40),
(6, 89994, 'HW', 10),
(7, 89994, 'MidTerm', 25),
(8, 89994, 'Final', 25);

INSERT INTO `ASSIGNMENT` 
VALUES
(1, 1, 1, 100),
(2, 1, 2, 100),
(3, 2, 1, 100),
(4, 2, 2, 100),
(5, 3, 1, 100),
(6, 3, 2, 100),
(7, 4, 1, 100),
(8, 4, 2, 100),
(9, 5, 1, 100),
(10, 5, 2, 100),
(11, 6, 1, 100),
(12, 6, 2, 100),
(13, 7, 1, 100),
(14, 7, 2, 100),
(15, 8, 1, 100),
(16, 8, 2, 100),


INSERT INTO `GRADEBOOK` VALUES(1234, 1, 85);
INSERT INTO `GRADEBOOK` VALUES(5678, 1, 80);
INSERT INTO `GRADEBOOK` VALUES(3456, 1, 95);
INSERT INTO `GRADEBOOK` VALUES(4590, 1, 65);
INSERT INTO `GRADEBOOK` VALUES(1234, 2, 81);
INSERT INTO `GRADEBOOK` VALUES(5678, 2, 84);
INSERT INTO `GRADEBOOK` VALUES(3456, 2, 95);
INSERT INTO `GRADEBOOK` VALUES(4590, 2, 62);
INSERT INTO `GRADEBOOK` VALUES(1234, 3, 81);
INSERT INTO `GRADEBOOK` VALUES(5678, 3, 84);
INSERT INTO `GRADEBOOK` VALUES(3456, 3, 95);
INSERT INTO `GRADEBOOK` VALUES(4590, 3, 62);
INSERT INTO `GRADEBOOK` VALUES(1234, 4, 81);
INSERT INTO `GRADEBOOK` VALUES(5678, 4, 84);
INSERT INTO `GRADEBOOK` VALUES(3456, 4, 95);
INSERT INTO `GRADEBOOK` VALUES(4590, 4, 62);
INSERT INTO `GRADEBOOK` VALUES(1234, 5, 81);
INSERT INTO `GRADEBOOK` VALUES(5678, 5, 84);
INSERT INTO `GRADEBOOK` VALUES(3456, 5, 95);
INSERT INTO `GRADEBOOK` VALUES(4590, 5, 62);
INSERT INTO `GRADEBOOK` VALUES(1234, 6, 81);
INSERT INTO `GRADEBOOK` VALUES(5678, 6, 84);
INSERT INTO `GRADEBOOK` VALUES(3456, 6, 95);
INSERT INTO `GRADEBOOK` VALUES(4590, 6, 62);
INSERT INTO `GRADEBOOK` VALUES(1234, 7, 81);
INSERT INTO `GRADEBOOK` VALUES(5678, 7, 84);
INSERT INTO `GRADEBOOK` VALUES(3456, 7, 95);
INSERT INTO `GRADEBOOK` VALUES(4590, 7, 62);
INSERT INTO `GRADEBOOK` VALUES(1234, 8, 81);
INSERT INTO `GRADEBOOK` VALUES(5678, 8, 84);
INSERT INTO `GRADEBOOK` VALUES(3456, 8, 95);
INSERT INTO `GRADEBOOK` VALUES(4590, 8, 62);
INSERT INTO `GRADEBOOK` VALUES(1234, 9, 81);
INSERT INTO `GRADEBOOK` VALUES(5678, 9, 84);
INSERT INTO `GRADEBOOK` VALUES(3456, 9, 95);
INSERT INTO `GRADEBOOK` VALUES(4590, 9, 62);
INSERT INTO `GRADEBOOK` VALUES(1234, 10, 81);
INSERT INTO `GRADEBOOK` VALUES(5678, 10, 84);
INSERT INTO `GRADEBOOK` VALUES(3456, 10, 95);
INSERT INTO `GRADEBOOK` VALUES(4590, 10, 62);
INSERT INTO `GRADEBOOK` VALUES(1234, 12, 87);
INSERT INTO `GRADEBOOK` VALUES(5678, 12, 94);
INSERT INTO `GRADEBOOK` VALUES(3456, 12, 55);
INSERT INTO `GRADEBOOK` VALUES(4590, 12, 72);
INSERT INTO `GRADEBOOK` VALUES(1234, 13, 87);
INSERT INTO `GRADEBOOK` VALUES(5678, 13, 94);
INSERT INTO `GRADEBOOK` VALUES(3456, 13, 55);
INSERT INTO `GRADEBOOK` VALUES(4590, 13, 72);

--Number 3 Show the tables with the contents that you have inserted;
SELECT * FROM STUDENT;
SELECT * FROM ENROLLMENT;
SELECT * FROM COURSES;
SELECT * FROM STUDENTSCORES;
SELECT * FROM ASSIGNMENTS;
SELECT * FROM DISTRIBUTION;

-- Number 4, Compute the average/highest/lowest score of an assignment;
SELECT a.AssignmentID, avg(s.POINTS), max(s.POINTS), min(s.POINTS) 
FROM ASSIGNMENT a, SCORE s WHERE a.AssignmentID=2 AND s.AssignmentID=a.AssignmentID;

-- Number 5, List all students of a given course
SELECT s.FirstName FROM STUDENT s WHERE s.StudentID IN (SELECT e.StudentID FROM ENROLLMENT e WHERE e.CourseID=85675);
SELECT s.StudentID, s.FirstName FROM STUDENT s JOIN ENROLLMENT e WHERE e.CourseID = 85675 AND s.StudentID = e.StudentID;

-- Number 6: List all of the students in a course and all of their scores on every assignment



-- 11
SELECT DISTINCT pt.StudentID, st.FirstName, st.LastName, pt.CourseID,pt.AssignmentID, pt.CategoryName, pt.Points
FROM (
     SELECT STUDENT.StudentID, AssignmentID, FirstName, LastName, CourseID, Points
     FROM STUDENT JOIN ENROLLMENT JOIN SCORE
     WHERE STUDENT.StudentID = ENROLLMENT.StudentID
     AND STUDENT.StudentID = SCORE.StudentID) st
jOIN
 (SELECT StudentID, CourseID, CategoryName, ASSIGNMENT.AssignmentID, Points
     FROM DISTRIBUTION JOIN ASSIGNMENT JOIN SCORE
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
    FROM STUDENT JOIN ENROLLMENT JOIN SCORE
    WHERE STUDENT.StudentID = ENROLLMENT.StudentID
    AND STUDENT.StudentID = SCORE.StudentID) st
JOIN
(SELECT StudentID, CourseID, CategoryName, ASSIGNMENT.AssignmentID, Points, ASSIGNMENT.PointsPossible, DISTRIBUTION.Percentage
    FROM DISTRIBUTION JOIN ASSIGNMENT JOIN SCORE
    WHERE DISTRIBUTION.DistributionID = ASSIGNMENT.DistributionID
    AND ASSIGNMENT.AssignmentID = SCORE.AssignmentID) pt
WHERE st.AssignmentID = pt.AssignmentID
AND st.Points = pt.Points AND st.StudentID=1234;
