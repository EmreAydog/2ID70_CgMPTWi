-- this file should contain the code required to create the auxiliary structures, for query 2
-- this file will be given 10 minutes to run. Then it will be killed
-- The file will be invoked with timeout 10m psql -d uni -f q2Create.sql
-- Remember that the database (including the auxiliary structures) needs to be less than 11 GB.
-- This file will be executed with postgres -d uni -f q2Create.sql 
--
-- Create indices
CREATE INDEX StudentRegistrationsToDegrees_StudentIdDegreeId ON StudentRegistrationsToDegrees(StudentId, DegreeId);
-- Materialized view for degree completion
CREATE VIEW ECTSInDegree AS
SELECT StudentRegistrationsToDegrees.StudentRegistrationId, StudentRegistrationsToDegrees.DegreeId, SUM(Courses.ECTS) as CurrentECTS
FROM StudentRegistrationsToDegrees, CourseRegistrations, CourseOffers, Courses
WHERE CourseRegistrations.StudentRegistrationId = StudentRegistrationsToDegrees.StudentRegistrationId
AND CourseRegistrations.Grade >= 5
AND CourseRegistrations.CourseOfferId = CourseOffers.CourseOfferId
AND Courses.CourseId = CourseOffers.CourseId
--AND Courses.DegreeId = StudentRegistrationsToDegrees.DegreeId
GROUP BY StudentRegistrationsToDegrees.StudentRegistrationId, StudentRegistrationsToDegrees.DegreeId;
CREATE MATERIALIZED VIEW MaterialCompletedDegree AS
SELECT ECTSInDegree.StudentRegistrationId, ECTSInDegree.DegreeId
FROM ECTSInDegree, Degrees
WHERE ECTSInDegree.DegreeId = Degrees.DegreeId
AND ECTSInDegree.CurrentECTS >= Degrees.TotalECTS;
-- Materialized view for GPA
CREATE MATERIALIZED VIEW MaterialGPA AS
SELECT StudentRegistrationsToDegrees.StudentId, CAST(SUM(CourseRegistrations.Grade * Courses.ECTS) AS FLOAT) / CAST(SUM(Courses.ECTS) AS FLOAT) as GPA
FROM StudentRegistrationsToDegrees, CourseRegistrations, CourseOffers, Courses
WHERE StudentRegistrationsToDegrees.StudentRegistrationId = CourseRegistrations.StudentRegistrationId
AND CourseRegistrations.CourseOfferId = CourseOffers.CourseOfferId
AND CourseOffers.CourseId = Courses.CourseId
AND CourseRegistrations.Grade >= 5
GROUP BY StudentRegistrationsToDegrees.StudentId;
-- Analyze
ANALYZE VERBOSE;