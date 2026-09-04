create database RaceDay
USE RaceDay

create table Organiser(
 OrganiserID int,
 OrganiserName VARCHAR(100) NOT NULL,
 Email VARCHAR(100) NOT NULL UNIQUE,
 Password VARCHAR (255) NOT NULL,
 Primary Key (OrganiserID)
 );


 create table Participant (
 ParticipantID int,
 ParticipantName VArchar(100) NOT NULL,
 Email VARCHAR(100) NOT NULL UNIQUE,
 Password VARCHAR(255) NOT NULL,
 Primary Key (ParticipantID)
 );

 create table Event (
 EventID int primary key IDENTITY(1,1),
 EventName VARCHAR(100) NOT NULL,
 EventDate DATE NOT NULL,
 Location VARCHAR(150) NOT NULL, 
 Weather VARCHAR(255),
 Routes VARCHAR(400),
 OrganiserID int NOT NULL,
 Foreign Key (OrganiserID) REFERENCES Organiser(OrganiserID)
 );

 create table Category( 
 CategoryID int,
 CategoryName VARCHAR(100) NOT NULL
 Primary Key (CategoryID)
 );

 create table EventCategory(
 EventID int,
 CategoryID int,
 Foreign Key (EventID) REFERENCES Event(EventID),
 Foreign Key (CategoryID) REFERENCES Category(CategoryID)
 );

 create table Enrolment(
 EnrolID int,
 EnrolName VARCHAR(100) NOT NULL,
 ParticipantID int,
 EventID int,
 Primary Key (EnrolID),
 Foreign Key (ParticipantID) REFERENCES Participant(ParticipantID),
 Foreign Key (EventID) REFERENCES Event(EventID)
 );

 create table Result(
 ResultID int,
 EnrolID int NOT NULL,
 Position int, 
 FinishTime TIME,
 Primary Key (ResultID),
 Foreign Key (EnrolID) REFERENCES Enrolment(EnrolID)
 );

 select * from Organiser
 select * from Participant
 select * from Event
 select * from Category
 select * from EventCategory
 select * from Enrolment
 select * from Result

 INSERT INTO Organiser(OrganiserID, OrganiserName, Email, Password)
 VALUES
 (1, 'Masedi', 'Masedi23@gmail.com', 'hagT!1'),
 (2, 'Khanyile', 'Khanya45@gmail.com', 'Khnyl#0'),
 (4, 'Nyasha', 'Kurewa987@gmail.com', 'NyaKU^67'),
 (3, 'Fapano', 'Fafa66@gmail.com', '$Fa23PA');

 INSERT INTO Participant(ParticipantID, ParticipantName, Email, Password)
 VALUES
 (1, 'Letho', 'myLee65@gmail.com', '23648MLE'),
 (2, 'Kubo', 'Uzumk77@gmail.com', '77*uZu'),
 (3, 'Momo', 'ModiMo567@gmail.com', '264$MOO'),
 (4, 'Ave', 'ItsAV27@gmail.com', 'AVe&27&AV');

 INSERT INTO Event(EventID, EventName, EventDate, Location, Weather, Routes, OrganiserID)
 VALUES
 (1, 'Comrades Marathon', '2026-06-14', 'Pietermaritzburg to Durban', 'Sunny, 18C', 'Up run - 87km', 1),
 (2, 'Cape Town Cycle Tour', '2026-03-08', 'Cape Town', 'Windy,20C', 'Peninsula loop - 109km', 2),
 (4, 'Johannesburg Cycle', '2026-05-01', 'Johannesburg', 'Cloudy, 22C', 'A cycling route through Johannesberg - 50km', 4),
 (3, 'Soweto Marathon', '2026-11-01', 'Soweto', 'Clear, 15C', 'Township route - 42km', 3);

 INSERT INTO Category(CategoryID, CategoryName)
 VALUES
 (2, 'Running'),
 (1, 'Walking'),
 (3, 'Cycling');


 INSERT INTO EventCategory(EventID, CategoryID)
 VALUES
 (1, 2),
 (2, 3),
 (4, 1),
 (3, 3);

 INSERT INTO Enrolment(EnrolID, EnrolName, ParticipantID, EventID)
 VALUES
 (1, 'Comrades Marathon Entry', 1, 1),
 (2, 'Cape Town Cycle Tour Entry', 4, 3),
 (3, 'Soweto Marathon Entry', 2, 2);

 INSERT INTO Result(ResultID, EnrolID, Position, FinishTime)
 VALUES
 (1, 1, 2,'00:45:30'),
 (2, 3, 1, '02:15:20'),
 (3, 2, 3, '01:25:30');


 

