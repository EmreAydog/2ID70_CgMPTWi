-- ATTENTION: Remove the comments and the example before submitting
-- This file should contain exactly 8 lines, without any comment. Each line will correspond to one of the 8 sub-questions of question 2.
-- Do not break long queries to more than one line, and do not leave empty lines between them. 
-- If you do not know the answer to one of the sub-questions, then write SELECT 0;
SELECT Courses.CourseName, CourseRegistrations.Grade FROM StudentRegistrationsToDegrees, CourseRegistrations, CourseOffers, Courses WHERE StudentRegistrationsToDegrees.StudentId = %1% AND StudentRegistrationsToDegrees.DegreeId = %2% AND CourseRegistrations.StudentRegistrationId = StudentRegistrationsToDegrees.StudentRegistrationId AND CourseRegistrations.CourseOfferId = CourseOffers.CourseOfferId AND CourseOffers.CourseId = Courses.CourseId ORDER BY CourseOffers.Year, CourseOffers.Quartile, CourseOffers.CourseOfferId;
SELECT 0;
WITH ActiveGenderInDegrees AS (SELECT StudentRegistrationsToDegrees.DegreeId, Students.Gender, COUNT(*) AS count FROM StudentRegistrationsToDegrees, Students WHERE StudentRegistrationsToDegrees.StudentId = Students.StudentId AND NOT EXISTS (SELECT * FROM MaterialCompletedDegree WHERE MaterialCompletedDegree.StudentRegistrationId = StudentRegistrationsToDegrees.StudentRegistrationId AND MaterialCompletedDegree.DegreeId = StudentRegistrationsToDegrees.DegreeId) GROUP BY StudentRegistrationsToDegrees.DegreeId, Students.Gender) SELECT Degrees.DegreeId, 100 * FemaleTable.count / (FemaleTable.count + MaleTable.count) as percentage FROM Degrees, ActiveGenderInDegrees as MaleTable, ActiveGenderInDegrees as FemaleTable WHERE Degrees.DegreeId = MaleTable.DegreeId AND Degrees.DegreeId = FemaleTable.DegreeId AND MaleTable.Gender = 'M' AND FemaleTable.Gender = 'F' ORDER BY Degrees.DegreeId;
WITH GenderInDegrees AS (SELECT StudentRegistrationsToDegrees.DegreeId, Students.Gender, COUNT(*) AS count FROM StudentRegistrationsToDegrees, Students WHERE StudentRegistrationsToDegrees.StudentId = Students.StudentId GROUP BY StudentRegistrationsToDegrees.DegreeId, Students.Gender) SELECT 100 * SUM(FemaleTable.count) / SUM(FemaleTable.count + MaleTable.count) as percentage FROM Degrees, GenderInDegrees as MaleTable, GenderInDegrees as FemaleTable WHERE Degrees.DegreeId = MaleTable.DegreeId AND Degrees.DegreeId = FemaleTable.DegreeId AND MaleTable.Gender = 'M' AND FemaleTable.Gender = 'F' AND Degrees.Dept = %1%;
SELECT 0;
SELECT 0;
SELECT 0;
WITH StudentsInOffer AS (SELECT CourseOfferId, count(*) AS numberStudents FROM CourseRegistrations GROUP BY CourseOfferId), AssistantsInOffer AS (SELECT CourseOfferId, count(*) AS numberAssistants FROM StudentAssistants GROUP BY CourseOfferId) SELECT Courses.CourseName, CourseOffers.Year, CourseOffers.Quartile FROM StudentsInOffer, AssistantsInOffer, Courses, CourseOffers WHERE StudentsInOffer.CourseOfferId = AssistantsInOffer.CourseOfferId AND AssistantsInOffer.numberAssistants < StudentsInOffer.numberStudents / 50 AND CourseOffers.CourseId = Courses.CourseId AND StudentsInOffer.CourseOfferId = CourseOffers.CourseOfferId ORDER BY CourseOffers.CourseOfferId;