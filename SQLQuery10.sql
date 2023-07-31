--1. 
SELECT Doctors.Name + ' ' + Doctors.Surname AS FullName, Specializations.Name AS Specialization
FROM Doctors
JOIN DoctorsSpecializations ON Doctors.Id = DoctorsSpecializations.DoctorId
JOIN Specializations ON DoctorsSpecializations.SpecializationId = Specializations.Id;

--2.
SELECT Surname, Salary + Premium as TotalSalary
FROM Doctors
WHERE Id NOT IN (SELECT DoctorId FROM Vacations WHERE EndDate >= GETDATE())

--3. 
SELECT Wards.Name
FROM Wards
JOIN Departments ON Wards.DepartmentId = Departments.Id
WHERE Departments.Name = 'Intensive Treatment';

--4.
SELECT DISTINCT Departments.Name, Doctors.Name + ' ' + Doctors.Surname AS DoctorName
FROM Departments
JOIN Donations ON Departments.Id = Donations.DepartmentId
JOIN Sponsors ON Donations.SponsorId = Sponsors.Id
JOIN Doctors ON Departments.Id = Doctors.Id
WHERE Sponsors.Name = 'Umbrella Corporation';

--5
SELECT Departments.Name AS Department, Sponsors.Name AS Sponsor, Donations.Amount, Donations.Date
FROM Donations
JOIN Departments ON Donations.DepartmentId = Departments.Id
JOIN Sponsors ON Donations.SponsorId = Sponsors.Id
WHERE Donations.Date >= DATEADD(month, -1, GETDATE());

--6.
SELECT Doctors.Surname, Wards.Name AS Ward, Departments.Name AS Department
FROM Doctors
JOIN Departments ON Doctors.Id = Departments.Id
JOIN Wards ON Departments.Id = Wards.DepartmentId
WHERE Doctors.Id IN (
    SELECT DISTINCT Doctors.Id
    FROM Doctors
    JOIN Departments ON Doctors.Id = Departments.Id
    JOIN Wards ON Departments.Id = Wards.DepartmentId
    WHERE Wards.Name IN (
        SELECT DISTINCT Wards.Name
        FROM Wards
        JOIN Departments ON Wards.DepartmentId = Departments.Id
        WHERE Departments.Name = 'Orthopedics'
    )
) AND DATENAME(weekday, GETDATE()) NOT IN ('Saturday', 'Sunday');

--7
SELECT Wards.Name AS Ward, Departments.Name AS Department, Departments.Name
FROM Wards
JOIN Departments ON Wards.DepartmentId = Departments.Id
JOIN Doctors ON Departments.Id = Doctors.Id
WHERE Doctors.Name + ' ' + Doctors.Surname = 'Helen Williams';

--8.
SELECT DISTINCT Departments.Name, Doctors.Surname
FROM Departments
JOIN Doctors ON Departments.Id = Doctors.Id
JOIN Donations ON Departments.Id = Donations.DepartmentId
WHERE Donations.Amount > 10000;

--9. 
SELECT DISTINCT Departments.Name
FROM Departments
JOIN Doctors ON Departments.Id = Doctors.Id
WHERE Doctors.Premium = 0;

--10. 
-- ¬ывести названи€ специализаций, которые используютс€ дл€ лечени€ заболеваний со степенью т€жести выше 3
-- ¬ таблицах нет степени т€жести

--11. 
--¬ывести названи€ отделений и заболеваний, обследовани€по которым они проводили за последние полгода.
--Ќет дат обследовани€

--12.
--¬ывести названи€ отделений и палат, в которых проводились обследовани€ по заразительным заболевани€м.
--Ќет информации по поводу заразительных заболеваний.