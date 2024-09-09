#question 1
SELECT name 
FROM country 
WHERE continent = 'South America';

#question 2
SELECT population 
FROM country 
WHERE name = 'Germany';

#question 3
SELECT name 
FROM city 
WHERE countrycode = (SELECT code FROM country WHERE name = 'Japan');

#question 4
SELECT name, population 
FROM country 
WHERE region = 'Africa' 
ORDER BY population DESC 
LIMIT 3;

#question 5
SELECT name, lifeexpectancy 
FROM country 
WHERE population BETWEEN 1000000 AND 5000000;

#question 6
SELECT country.name 
FROM country 
JOIN countrylanguage ON country.code = countrylanguage.countrycode 
WHERE countrylanguage.language = 'French' AND countrylanguage.isofficial = 'T';

#question 7
SELECT Album.Title
FROM Album
JOIN Artist ON Album.ArtistId = Artist.ArtistId
WHERE Artist.Name = 'AC/DC';

#question 8
SELECT firstname, lastname, email 
FROM Customer 
WHERE Country = 'Brazil';

#question 9
SELECT Name 
FROM Playlist;

#question 10
SELECT COUNT(*) 
FROM Track 
JOIN Genre ON Track.genreid = Genre.genreid 
WHERE Genre.name = 'Rock';

#question 11
SELECT Firstname, Lastname 
FROM Employee 
WHERE Reportsto = (SELECT employeeid FROM Employee WHERE Firstname = 'Nancy' AND Lastname = 'Edwards');

#question 12
SELECT Customerid, SUM(total) AS total_sales 
FROM Invoice 
GROUP BY Customerid;

#question 13
#gym database w/ members, subscription, n attendance
#memberstable
CREATE TABLE Members (
    MemberID INT PRIMARY KEY,
    FirstName VARCHAR(100),
    LastName VARCHAR(100),
    Phone VARCHAR(15),
    Email VARCHAR(100)
);

#subscriptionstable
CREATE TABLE Subscriptions (
    SubscriptionID INT PRIMARY KEY,
    SubscriptionType VARCHAR(50),
    Price DECIMAL(6, 2),
    DurationMonths INT
);

#attendancetable
CREATE TABLE Attendance (
    AttendanceID INT PRIMARY KEY,
    MemberID INT,
    CheckInDate DATE,
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID)
);

#question 14

INSERT INTO Members (MemberID, FirstName, LastName, Phone, Email)
VALUES 
(1, 'John', 'Doe', '123-456-7890', 'john@example.com'),
(2, 'Jane', 'Smith', '555-123-4567', 'jane@example.com'),
(3, 'Mike', 'Johnson', '444-555-6666', 'mike@example.com'),
(4, 'Emily', 'Davis', '987-654-3210', 'emily@example.com'),
(5, 'Chris', 'Brown', '222-333-4444', 'chris@example.com');

INSERT INTO Subscriptions (SubscriptionID, SubscriptionType, Price, DurationMonths)
VALUES 
(1, 'Monthly', 50.00, 1),
(2, 'Quarterly', 135.00, 3),
(3, 'Yearly', 480.00, 12);

INSERT INTO Attendance (AttendanceID, MemberID, CheckInDate)
VALUES 
(1, 1, '2024-09-01'),
(2, 2, '2024-09-02'),
(3, 3, '2024-09-03'),
(4, 1, '2024-09-04'),
(5, 4, '2024-09-05');

#find members who have checkedin on specific date
SELECT Members.FirstName, Members.LastName, Attendance.CheckInDate
FROM Members
JOIN Attendance ON Members.MemberID = Attendance.MemberID
WHERE Attendance.CheckInDate = '2024-09-01';

#total number of checkins per member
SELECT Members.FirstName, Members.LastName, COUNT(Attendance.AttendanceID) AS TotalCheckIns
FROM Members
JOIN Attendance ON Members.MemberID = Attendance.MemberID
GROUP BY Members.MemberID;

#list subscription plans and prices
SELECT SubscriptionType, Price
FROM Subscriptions;

