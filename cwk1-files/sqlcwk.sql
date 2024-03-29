/*
@Simon Evans

This is an sql file to put your queries for SQL coursework. 
You can write your comment in sqlite with -- or /* * /

To read the sql and execute it in the sqlite, simply
type .read sqlcwk.sql on the terminal after sqlite3 musicstore.db.
*/

/* =====================================================
   WARNNIG: DO NOT REMOVE THE DROP VIEW
   Dropping existing views if exists
   =====================================================
*/
DROP VIEW IF EXISTS vNoCustomerEmployee; 
DROP VIEW IF EXISTS v10MostSoldMusicGenres; 
DROP VIEW IF EXISTS vTopAlbumEachGenre; 
DROP VIEW IF EXISTS v20TopSellingArtists; 
DROP VIEW IF EXISTS vTopCustomerEachGenre; 

/*
============================================================================
Task 1: Complete the query for vNoCustomerEmployee.
DO NOT REMOVE THE STATEMENT "CREATE VIEW vNoCustomerEmployee AS"
============================================================================
*/
CREATE VIEW vNoCustomerEmployee AS 
SELECT EmployeeId, FirstName, LastName, Title
FROM employees
WHERE NOT EXISTS
(SELECT SupportRepId FROM customers WHERE customers.SupportRepId = employees.EmployeeId);

/*
============================================================================
Task 2: Complete the query for v10MostSoldMusicGenres
DO NOT REMOVE THE STATEMENT "CREATE VIEW v10MostSoldMusicGenres AS"
============================================================================
*/
CREATE VIEW v10MostSoldMusicGenres AS
SELECT genres.Name, COUNT(invoice_items.Quantity) AS Sales
FROM genres
INNER JOIN invoice_items ON invoice_items.TrackId = tracks.TrackId
INNER JOIN tracks ON tracks.GenreId = genres.GenreID
GROUP BY genres.Name
ORDER BY Sales DESC
LIMIT 10;

/*
============================================================================
Task 3: Complete the query for vTopAlbumEachGenre
DO NOT REMOVE THE STATEMENT "CREATE VIEW vTopAlbumEachGenre AS"
============================================================================
*/
CREATE VIEW vTopAlbumEachGenre AS
SELECT genres.Name as Genre, 
   albums.Title as Album, 
   artists.Name as Arist,
   SUM(invoice_items.Quantity), 
FROM genres
INNER JOIN tracks ON tracks.GenreId = genres.GenreId
INNER JOIN invoice_items ON invoice_items.TrackId = tracks.TrackId
INNER JOIN artists ON artists.ArtistId = albums.ArtistId;

/*
============================================================================
Task 4: Complete the query for v20TopSellingArtists
DO NOT REMOVE THE STATEMENT "CREATE VIEW v20TopSellingArtists AS"
============================================================================


CREATE VIEW v20TopSellingArtists AS




============================================================================
Task 5: Complete the query for vTopCustomerEachGenre
DO NOT REMOVE THE STATEMENT "CREATE VIEW vTopCustomerEachGenre AS" 
============================================================================

CREATE VIEW vTopCustomerEachGenre AS
*/

