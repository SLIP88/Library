IF EXISTS(SELECT * 
			FROM sys.views 
			WHERE name = 'AvailableBooks') 
	DROP VIEW AvailableBooks
GO

CREATE VIEW AvailableBooks
AS
SELECT	DISTINCT k.*
FROM	Books		AS k
LEFT OUTER JOIN Borrowings	AS p ON k.BookId = p.BookId
WHERE	p.BookId IS NULL
	OR	k.BookId NOT IN (SELECT BookId
							FROM	Borrowings
							WHERE	DateOfReturn IS NULL)
GO


--SELECT *
--FROM AvailableBooks

--UPDATE Borrowings
--SET	DateOfReturn = GETDATE()
---- SELECT * FROM Borrowings
--WHERE	MemberNumber = 10002 AND BookId = 2
