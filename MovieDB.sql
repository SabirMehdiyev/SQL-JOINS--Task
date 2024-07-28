CREATE DATABASE MovieDB

USE MovieDB


CREATE TABLE Genres(
Id int PRIMARY KEY IDENTITY,
Name nvarchar(50) NOT NULL
)

CREATE TABLE Movies(
Id int PRIMARY KEY IDENTITY,
Title nvarchar(70) NOT NULL,
Description nvarchar(500),
Rating decimal (3,1),
GenreId int Foreign key References Genres(Id)
)

CREATE TABLE Tickets(
Id int PRIMARY KEY IDENTITY,
SeatNumber nvarchar(10),
Price decimal (8,2),
CustomerName nvarchar(20),
ShowDateTime datetime,
MovieId int Foreign key References Movies(Id)
)

CREATE TABLE Reviews(
Id int PRIMARY KEY IDENTITY,
ReviewerName nvarchar(20),
Rating decimal (3,1),
Comment nvarchar(200),
MovieId int Foreign key References Movies(Id)
)

CREATE TABLE Actors(
Id int PRIMARY KEY IDENTITY,
Name nvarchar(30),
Surname nvarchar(50),
Role nvarchar(50)
)

CREATE TABLE MovieActors(
MovieId int Foreign key References Movies(Id),
ActorId int Foreign key References Actors(Id)
)


INSERT INTO Genres (Name) VALUES 
('Action'), ('Comedy'), ('Drama'), ('Horror')

INSERT INTO Movies (Title, Description, Rating, GenreId) VALUES 
('Gladiator', 'loremmmmm', 8.8, 4),
('The Bikeriders', 'loremmmmm', 9.3, 3),
('The Dark Knight', 'loremmmmm', 9.0, 1)

INSERT INTO Tickets (SeatNumber, Price, CustomerName, ShowDateTime, MovieId) VALUES 
('A1', 10.50, 'Sabir', '2024-08-01 19:00', 1),
('B3', 10.50, 'Sabir', '2024-08-01 19:00', 1),
('C5', 12.00, 'Sabir', '2024-08-02 20:00', 2)

INSERT INTO Reviews (ReviewerName, Rating, Comment, MovieId) VALUES 
('Savir', 9.0, 'tescommenttttt111', 1),
('Ferid', 8.5, 'testcomment2222', 1),
('Asiman', 9.5, 'testcomment3333', 2)

INSERT INTO Actors (Name, Surname, Role) VALUES 
('Leonardo', 'DiCaprio', 'Lead Actor'),
('Tim', 'Robbins', 'Lead Actor'),	
('Christian', 'Bale', 'Lead Actor')

INSERT INTO MovieActors (MovieId, ActorId) VALUES 
(1, 1), (1, 2), 
(2, 3) 

SELECT m.Title, g.Name AS Genre
FROM Movies m
JOIN Genres g ON m.GenreId = g.Id

SELECT t.SeatNumber, t.Price, t.CustomerName, m.Title AS MovieTitle, t.ShowDateTime
FROM Tickets t
JOIN Movies m ON t.MovieId = m.Id

SELECT m.Title AS MovieTitle, a.Name, a.Surname, a.Role
FROM Movies m
JOIN MovieActors ma ON m.Id = ma.MovieId
JOIN Actors a ON ma.ActorId = a.Id