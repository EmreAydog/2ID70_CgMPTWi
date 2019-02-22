-- here you will write the three queries requested in Question 1. Each query should be in a single line, i.e., do not break long queries to more lines.
SELECT CourseOffers.CourseOfferId, CourseOffers.CourseId, CourseOffers.Year, CourseOffers.Quartile, Courses.CourseName, Courses.CourseDescription, Courses.DegreeId, Courses.ECTS, Degrees.Dept, Degrees.DegreeDescription, Degrees.TotalECTS, Teachers.TeacherId, Teachers.TeacherName, Teachers.Address, Teachers.BirthyearTeacher, Teachers.Gender FROM CourseOffers, Courses, Degrees, Teachers, TeacherAssignmentsToCourses WHERE CourseOffers.CourseOfferId = 1 AND CourseOffers.CourseId = Courses.CourseId AND Courses.DegreeId = Degrees.DegreeId AND CourseOffers.CourseOfferId = TeacherAssignmentsToCourses.CourseOfferId AND TeacherAssignmentsToCourses.TeacherId = Teachers.TeacherId;
SELECT StudentAssistants.CourseOfferId, CourseOffers.CourseId, CourseOffers.Year, CourseOffers.Quartile, Students.StudentId, Students.StudentName, Students.Address, Students.BirthyearStudent, Students.Gender, StudentRegistrationsToDegrees.DegreeId, Degrees.Dept, Degrees.DegreeDescription, Degrees.TotalECTS FROM StudentAssistants, CourseOffers, Students, StudentRegistrationsToDegrees, Degrees WHERE Students.StudentId = 140 AND StudentAssistants.CourseOfferId = CourseOffers.CourseOfferId AND StudentAssistants.StudentRegistrationId = StudentRegistrationsToDegrees.StudentRegistrationId AND StudentRegistrationsToDegrees.StudentId = Students.StudentId AND StudentRegistrationsToDegrees.DegreeId = Degrees.DegreeId;
SELECT AVG(Grade) as avgGrade FROM CourseRegistrations WHERE StudentRegistrationId = 140 GROUP BY StudentRegistrationId;