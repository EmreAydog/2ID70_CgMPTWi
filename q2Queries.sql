-- ATTENTION: Remove the comments and the example before submitting
-- This file should contain exactly 8 lines, without any comment. Each line will correspond to one of the 8 sub-questions of question 2.
-- Do not break long queries to more than one line, and do not leave empty lines between them. 
-- If you do not know the answer to one of the sub-questions, then write SELECT 0;
SELECT Courses.CourseName, CourseRegistrations.Grade FROM StudentRegistrationsToDegrees, CourseRegistrations, CourseOffers, Courses WHERE StudentRegistrationsToDegrees.StudentId = %1% AND StudentRegistrationsToDegrees.DegreeId = %2% AND CourseRegistrations.StudentRegistrationId = StudentRegistrationsToDegrees.StudentRegistrationId AND CourseRegistrations.CourseOfferId = CourseOffers.CourseOfferId AND CourseOffers.CourseId = Courses.CourseId ORDER BY CourseOffers.Year, CourseOffers.Quartile, CourseOffers.CourseOfferId;
SELECT 0;
SELECT 0; 
SELECT 0;
SELECT 0;
SELECT 0;
SELECT 0;
SELECT 0;
