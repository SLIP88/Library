
IF EXISTS(SELECT * 
			FROM sys.tables 
			WHERE name = 'Members') 
	DROP TABLE Members
GO

CREATE TABLE Members (
	MemberNumber		int				IDENTITY(10182, 1),
	FirstName				nvarchar(50)	NOT NULL,
	LastName			nvarchar(50)	NOT	NULL,
	AddressOfMember			nvarchar(250)		NULL,
	TelephoneNumber		varchar(20)			NULL,
	DateOfBirth				date			NOT NULL,
	DateOfJoining	date			NOT NULL,
	City nvarchar(50)				NULL,
	State nvarchar(50)				NULL,
	ZipCode nvarchar(50)			NULL,

	CONSTRAINT PK_Members PRIMARY KEY (MemberNumber)
)
GO

IF EXISTS(SELECT * 
			FROM sys.tables 
			WHERE name = 'Books') 
	DROP TABLE Books
GO

CREATE TABLE Books (
	BookId		int				IDENTITY(1, 1),
	Title			nvarchar(250)	NOT NULL, 
	Author			nvarchar(100)	NOT NULL, 
	YearOfPublishing	smallint			NULL,

	CONSTRAINT PK_Books PRIMARY KEY (BookId)

)
GO

IF EXISTS(SELECT * 
			FROM sys.tables 
			WHERE name = 'Borrowings') 
	DROP TABLE Borrowings
GO

CREATE TABLE Borrowings (
	MemberNumber		int		NOT NULL
					FOREIGN KEY REFERENCES Members(MemberNumber),
	BookId		int		NOT NULL
					FOREIGN KEY REFERENCES Books(BookId),
	DateOfBorrowing	date	NOT NULL DEFAULT GETDATE(),
	DateOfReturn	date		NULL,

	CONSTRAINT PK_Borrowings
	PRIMARY KEY (MemberNumber, BookId, DateOfBorrowing)
)