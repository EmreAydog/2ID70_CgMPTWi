-- this file should contain the code required to create the auxiliary structures, for query 2
-- this file will be given 10 minutes to run. Then it will be killed
-- The file will be invoked with timeout 10m psql -d uni -f q2Create.sql
-- Remember that the database (including the auxiliary structures) needs to be less than 11 GB.
-- This file will be executed with postgres -d uni -f q2Create.sql 
-- Example:
ALTER TABLE Degrees add primary key (DegreeId);
ALTER TABLE Students add primary key (StudentId);
ALTER TABLE Teachers add primary key (TeacherId);
ALTER TABLE Courses add primary key (CourseId);
ALTER TABLE CourseOffers add primary key (CourseOfferId);
ALTER TABLE CourseRegistrations add PRIMARY KEY (StudentRegistrationId, CourseOfferId);
CREATE INDEX StudentRegistrationsToDegrees_StudentIdDegreeId ON StudentRegistrationsToDegrees(StudentId, DegreeId);