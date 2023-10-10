IF EXISTS(SELECT *
		FROM sys.triggers
		WHERE name = 'ProhibitBorrowingDeletes')
	DROP TRIGGER ProhibitBorrowingDeletes
GO

CREATE TRIGGER ProhibitBorrowingDeletes
ON Borrowings
AFTER DELETE
AS
	PRINT 'Borrowings can not be deleted!'
	ROLLBACK
GO

SELECT *
FROM Borrowings

DELETE 
--SELECT *
FROM Borrowings
WHERE MemberNumber = 10001 AND BookId = 4


IF EXISTS(SELECT *
		FROM sys.triggers
		WHERE name = 'ProhibitBorrowingDeletes')
	DROP TRIGGER ProhibitBorrowingDeletes
GO

CREATE TRIGGER ProhibitBorrowingDeletes
ON Borrowings
AFTER DELETE
AS
	PRINT 'Borrowings can not be deleted!'
	ROLLBACK
GO

SELECT *
FROM Borrowings

DELETE 
--SELECT *
FROM Borrowings
WHERE MemberNumber = 10001 AND BookId = 4


