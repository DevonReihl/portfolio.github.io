CREATE DATABASE db_library_system
GO

USE db_library_system
GO

CREATE TABLE Library_Branch(
	BranchID INT PRIMARY KEY NOT NULL IDENTITY(1,1),
	BranchName VARCHAR (50) NOT NULL,
	Address VARCHAR(50) NOT NULL
);

CREATE TABLE Publisher(
	PublisherID INT PRIMARY KEY NOT NULL IDENTITY(500,1),
	PublisherName VARCHAR(50) NOT NULL,
	Address VARCHAR(50) NOT NULL,
	Phone VARCHAR(50) NOT NULL
);

CREATE TABLE Books(
	BookID INT PRIMARY KEY NOT NULL IDENTITY(100,1),
	Title VARCHAR(50) NOT NULL,
	PublisherName INT NOT NULL CONSTRAINT fk_Publisher FOREIGN KEY REFERENCES Publisher(PublisherID) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE Book_Author(
	BookID INT NOT NULL CONSTRAINT fk_Books FOREIGN KEY REFERENCES Books(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
	AuthorName VARCHAR(50) NOT NULL
);

CREATE TABLE Book_Copies(
	BookID INT NOT NULL CONSTRAINT fk_Books2 FOREIGN KEY REFERENCES Books(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
	BranchID INT NOT NULL CONSTRAINT fk_BranchID FOREIGN KEY REFERENCES Library_branch(BranchID) ON UPDATE CASCADE ON DELETE CASCADE,
	Number_Of_Copies INT NOT NULL
);

CREATE TABLE Borrower(
	CardNo INT PRIMARY KEY NOT NULL IDENTITY(1000,1),
	Name VARCHAR(50) NOT NULL,
	Address VARCHAR(50) NOT NULL,
	Phone VARCHAR(50) NOT NULL
);
DROP TABLE Book_Loans;
CREATE TABLE Book_Loans(
	BookID INT NOT NULL CONSTRAINT fk_Books3 FOREIGN KEY REFERENCES Books(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
	BranchID INT NOT NULL CONSTRAINT fk_BranchID2 FOREIGN KEY REFERENCES Library_branch(BranchID) ON UPDATE CASCADE ON DELETE CASCADE,
	CardNo INT NOT NULL CONSTRAINT fk_CardNo FOREIGN KEY REFERENCES Borrower(CardNo) ON UPDATE CASCADE ON DELETE CASCADE,
	DateOut DATE NOT NULL,
	DateDue DATE NOT NULL
);

INSERT INTO Library_Branch
		(BranchName, Address)
		VALUES 
		('Sharptown', '2001 NW Stevenson St Portland, OR'),
		('Central', '35054 SE Lombard St Portland, OR'),
		('WestSide', '6689 SW 109th PL Portland, OR'),
		('North Cove', '2992 N Apple Ave Portland, OR'),
		('King City', '9999 NE Jame Dr Portland, OR')
	;

SELECT * FROM Library_Branch;

INSERT INTO Publisher
		(PublisherName, Address, Phone)
		VALUES 
		('Scolastic', '557 Broadway, New York City, New York, U.S. 10012', '1-800-724-6527'),
		('Puffin Books', 'London United Kingdom', 'N/A'),
		('The Workman Publishing', 'New York City, New York, US', '1-800-722-7202'),
		('HarperCollins Publishing', '195 Broadway New York, NY 10007', '1-800-242-7737'),
		('Random House Inc', '1745 Broadway New York, NY 10019', '1-212-782-9000'),
		('Penguin Group', '375 Hudson Street New York, NY 10014', '1-212-366-2000'),
		('Bentley Miscellany', 'London United Kingdom', 'N/A'),
		('Harper and Row Publishing', '331 Pearl Street Manhattan, NY 10038', '518-352-7311')
	;

SELECT * FROM Publisher;

INSERT INTO Books
		(Title, PublisherName)
		VALUES 
		('Harry Potter and the Sorcerers Stone', 500),
		('Harry Potter and Chamber of Secrets', 500),
		('Harry Potter and the Prisoner of Azkaban', 500),
		('Charlie and the Chocolate Factory', 501),
		('B.F.G.', 501),
		('Belly Button Book', 502),
		('Philadelphia Chicken', 502),
		('Warriors: Into the Wild', 503),
		('Warriors: Fire and Ice', 503),
		('Seekers: The Quest Begins', 503),
		('Green Egg and Ham', 504),
		('Cat and the Hat', 504),
		('Lost Tribe', 505),
		('Insomnia', 505),
		('Green Mile', 505),
		('A Christmas Carol', 506),
		('Oliver Twist', 506),
		('Where the Sidewalk Ends', 507),
		('The Giving Tree', 507),
		('Sense and Sensibility', 506)
	;

SELECT * FROM Books;

INSERT INTO Book_Author
		(BookID, AuthorName)
		VALUES 
		(100, 'J.K. Rowling'),
		(101, 'J.K. Rowling'),
		(102, 'J.K. Rowling'),
		(103, 'Roald Dahl'),
		(104, 'Roald Dahl'),
		(105, 'Sandra Boynton'),
		(106, 'Sandra Boynton'),
		(107, 'Erin Hunter'),
		(108, 'Erin Hunter'),
		(109, 'Erin Hunter'),
		(110, 'Dr. Seuss'),
		(111, 'Dr. Seuss'),
		(112, 'Mark Lee'),
		(113, 'Steven King'),
		(114, 'Steven King'),
		(115, 'Charlie Dickens'),
		(116, 'Charlie Dickens'),
		(117, 'Shel Silverstein'),
		(118, 'Shel Silverstein'),
		(119, 'Jane Austen');

SELECT * FROM Book_Author;

INSERT INTO Book_Copies
		(BookID, BranchID, Number_Of_Copies)
		VALUES 
		(100, 1, 4),	
		(100, 2, 6),
		(100, 5, 6),	
		(101, 2, 4),	
		(101, 5, 2),	
		(102, 5, 5),	
		(102, 2, 5),	
		(103, 1, 2),	
		(103, 4, 4),	
		(103, 5, 3),	
		(104, 2, 4),	
		(104, 4, 2),	
		(104, 5, 6),	
		(105, 1, 3),	
		(105, 4, 4),	
		(105, 5, 2), 
		(106, 4, 5),	
		(106, 5, 3),	
		(107, 1, 3),	
		(107, 3, 8),	
		(107, 5, 4),	
		(108, 3, 5),
		(108, 5, 2),	
		(109, 3, 2),	
		(109, 5, 3),	
		(110, 1, 5),	
		(110, 4, 2),	
		(110, 5, 6),	
		(111, 3, 3),	
		(111, 5, 6),	
		(111, 4, 3),	
		(112, 1, 4), 	
		(112, 3, 5),	
		(112, 5, 2),	
		(113, 2, 4),	
		(113, 5, 4),
		(114, 2, 3),	
		(114, 3, 2),	
		(114, 5, 3),	
		(115, 1, 5),	
		(115, 2, 4),	
		(115, 3, 8),	
		(115, 4, 3),	
		(115, 5, 3),	
		(116, 1, 6),	
		(116, 2, 4),	
		(116, 3, 5),	
		(116, 4, 7),	
		(116, 5, 2),	
		(117, 1, 4),	
		(117, 4, 4),	
		(117, 5, 5),	
		(118, 4, 2),	
		(118, 5, 3),	
		(119, 1, 4),	
		(119, 2, 2),	
		(119, 3, 4),	
		(119, 5, 3)
	;

SELECT * FROM Book_Copies;

INSERT INTO Borrower
		(Name, Address, Phone)
		VALUES 
		('Jason Joseph', '2402 NW Schmidt Way Apt196 Portland, OR', '605-927-9952'),
		('Helen Maryweather', '18551 NW Re Wind Way Portland, OR', '222-798-6500'),
		('August Smith', '10030 SW Hillsdale Dr Portland, OR', '961-741-6195'),
		('Mary Gild', '10781 NE Bluebird Dr Portland, OR', '998-612-0033'),
		('Leonard Frisch', '2429 SE Brooklyn St Apt204 Portland, OR', '926-205-7082'),
		('Ricardo Delmonte', '17185 NE Elk Run Dr Portland, OR', '782-783-0485'),
		('Nicolas Powell', '19650 SW Blaine Ct Portland, OR', '699-345-1791'),
		('Olivia Stone', '3141 SE Greenbriar Terr Portland, OR', '704-465-6555')
	;

INSERT INTO Borrower
		(Name, Address, Phone)
		VALUES
		('Janis Hondra', '3045 NW Lake View Pl Portland, OR', '971-220-9899')
	;

SELECT * FROM Borrower;

INSERT INTO Book_Loans
	(BookID, BranchID, CardNo, DateOut, DateDue)
	VALUES
		(105, 4, 1007, '2019-05-15', '2019-06-01'),
		(106, 4, 1007, '2019-05-15', '2019-06-01'),
		(103, 4, 1007, '2019-05-15', '2019-06-01'),
		(104, 4, 1007, '2019-05-15', '2019-06-01'),
		(110, 4, 1007, '2019-05-15', '2019-06-01'),
		(118, 4, 1007, '2019-05-15', '2019-06-01'),
		(117, 4, 1007, '2019-05-15', '2019-06-01'),
		(100, 2, 1007, '2019-05-05', '2019-05-31'),
		(101, 2, 1007, '2019-05-05', '2019-05-31'),
		(102, 2, 1007, '2019-05-05', '2019-05-31'),
		(112, 3, 1002, '2019-04-30', '2019-05-04'),
		(114, 3, 1002, '2019-04-30', '2019-05-04'),
		(111, 3, 1002, '2019-04-30', '2019-05-04'),
		(108, 3, 1002, '2019-04-30', '2019-05-04'),
		(100, 1, 1001, '2019-05-17', '2019-06-03'),
		(107, 1, 1001, '2019-05-17', '2019-06-03'),
		(103, 1, 1001, '2019-05-17', '2019-06-03'),
		(116, 1, 1001, '2019-05-17', '2019-06-03'),
		(112, 1, 1001, '2019-05-17', '2019-06-03'),
		(117, 4, 1001, '2019-05-17', '2019-06-03'),
		(118, 4, 1001, '2019-05-17', '2019-06-03'),
		(107, 3, 1002, '2019-05-04', '2019-05-30'),
		(108, 3, 1002, '2019-05-04', '2019-05-30'),
		(109, 3, 1002, '2019-05-04', '2019-05-30'),
		(113, 3, 1002, '2019-05-04', '2019-05-30'),
		(114, 3, 1002, '2019-05-04', '2019-05-30'),
		(100, 5, 1003, '2019-04-28', '2019-05-15'),
		(101, 5, 1003, '2019-04-28', '2019-05-15'),
		(102, 5, 1003, '2019-04-28', '2019-05-15'),
		(103, 5, 1003, '2019-04-28', '2019-05-15'),
		(104, 5, 1003, '2019-04-28', '2019-05-15'),
		(105, 5, 1003, '2019-05-15', '2019-06-01'),
		(107, 5, 1003, '2019-05-15', '2019-06-01'),
		(110, 5, 1003, '2019-05-15', '2019-06-01'),
		(111, 5, 1003, '2019-05-15', '2019-06-01'),
		(100, 5, 1005, '2019-05-02', '2019-05-28'),
		(101, 5, 1005, '2019-05-02', '2019-05-28'),
		(102, 5, 1005, '2019-05-02', '2019-05-28'),
		(110, 1, 1006, '2019-05-20', '2019-06-10'),
		(105, 1, 1006, '2019-05-20', '2019-06-10'),
		(117, 1, 1006, '2019-05-20', '2019-06-10'),
		(118, 5, 1006, '2019-05-20', '2019-06-10'),
		(115, 3, 1006, '2019-05-20', '2019-06-10'),
		(116, 3, 1006, '2019-05-20', '2019-06-10'),
		(119, 3, 1006, '2019-05-20', '2019-06-10'),
		(111, 3, 1006, '2019-05-20', '2019-06-10'),
		(114, 2, 1006, '2019-05-20', '2019-06-10'),
		(114, 2, 1004, '2019-05-02', '2019-05-28'),
		(115, 2, 1004, '2019-05-02', '2019-05-28'),
		(116, 2 ,1004, '2019-05-02', '2019-05-28'),
		(109, 2, 1004, '2019-05-02', '2019-05-28')
;
INSERT INTO Book_Loans
	(BookID, BranchID, CardNo, DateOut, DateDue)
	VALUES
	(109, 1, 1008, '2019-05-02', '2019-05-27')
;

SELECT * FROM Book_Loans;




/* Procedure 1*/
CREATE PROCEDURE Copies1Branch
AS
BEGIN
	SELECT  Title, Number_Of_Copies, BranchName
	FROM Book_Copies
	INNER JOIN Books ON Books.BookID = Book_Copies.BookID
	INNER JOIN Library_Branch ON Library_Branch.BranchID = Book_Copies.BranchID
	WHERE Title = 'Lost Tribe'
	AND BranchName = 'Sharptown';
END
GO

/* Procedure 2*/
CREATE PROCEDURE CopiesAllBranches
AS
BEGIN
	SELECT  Title, Number_Of_Copies, BranchName
	FROM Book_Copies
	INNER JOIN Books ON Books.BookID = Book_Copies.BookID
	INNER JOIN Library_Branch ON Library_Branch.BranchID = Book_Copies.BranchID
	WHERE Title = 'Lost Tribe';
END
GO

/* Procedure 3*/
CREATE PROCEDURE NoLoans
AS
BEGIN
	SELECT Borrower.Name,  Book_Loans.CardNo
	FROM Book_Loans
	RIGHT JOIN Borrower ON Book_Loans.CardNo = Borrower.CardNo
	WHERE Book_loans.CardNo is NUll;
END
GO

/* Procedure 4*/
CREATE PROCEDURE DueToday
AS
BEGIN		
	SELECT Title, Borrower.Name, Borrower.Address, Library_Branch.BranchName, Book_Loans.DateDue
	FROM Book_Loans
	INNER JOIN Books ON Books.BookID = Book_Loans.BookID
	INNER JOIN Library_Branch ON Library_Branch.BranchID = Book_Loans.BranchID
	INNER JOIN Borrower ON Borrower.CardNo = Book_Loans.CardNo
	WHERE BranchName = 'Sharptown'
	AND Book_Loans.DateDue = '2019-05-28';
END
GO

/* Procedure 5*/
CREATE PROCEDURE Total_Books_Out
AS
BEGIN	
	SELECT Library_Branch.BranchName, COUNT(*) AS Total_Loans
	FROM Library_Branch
	INNER JOIN Book_Loans ON Book_Loans.BranchID = Library_Branch.BranchID
	GROUP BY Library_Branch.BranchName
	;
END
GO
/* Procedure 6*/
CREATE PROCEDURE More_Than_5_Loans
AS
BEGIN	
	SELECT Borrower.Name, Borrower.Address
	FROM Borrower
	INNER JOIN Book_Loans ON Book_Loans.CardNo = Borrower.CardNo
	GROUP BY Borrower.Name, Borrower.Address
	HAVING COUNT(*) > 5
;
END
GO

/* Procedure 7*/
CREATE PROCEDURE
AS
BEGIN
	SELECT BranchName, Title, Number_Of_Copies
	FROM Book_Copies
	INNER JOIN Books ON Books.BookID = Book_Copies.BookID
	INNER JOIN Library_Branch ON Library_Branch.BranchID = Book_Copies.BranchID
	INNER JOIN Book_Author ON Book_Author.BookID = Book_Copies.BookID
	WHERE AuthorName = 'Steven King'
	AND BranchName = 'Central'