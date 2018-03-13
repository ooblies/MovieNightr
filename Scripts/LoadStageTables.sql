SET SQL_SAFE_UPDATES = 0;

#Movies
DELETE FROM staging_Movies;
ALTER TABLE staging_Movies AUTO_INCREMENT = 1;
INSERT INTO staging_Movies (Title, ReleaseYear, IsTV,ReleaseNumber,Movie)

select TRIM(REPLACE(TRIM(REPLACE(TRIM(CHAR(9) FROM SUBSTRING(Data, 1, CHAR_LENGTH(Data) - 4)), '(TV)', '')), SUBSTRING_INDEX(TRIM(REPLACE(TRIM(CHAR(9) FROM SUBSTRING(Data, 1, CHAR_LENGTH(Data) - 4)), '(TV)', '')), ' ', -1), '')) AS Title, 
	   RIGHT(Data,4) AS Year,
       CASE WHEN Data LIKE '%(TV)%' THEN 1 ELSE 0 END AS IsTV,
       
       CASE WHEN RIGHT(TRIM(REPLACE(TRIM(CHAR(9) FROM SUBSTRING(Data, 1, CHAR_LENGTH(Data) - 4)), '(TV)', '')), 6) <> CONCAT('(',RIGHT(Data,4),')')
       THEN REPLACE(SUBSTRING_INDEX(SUBSTRING_INDEX(TRIM(REPLACE(TRIM(CHAR(9) FROM SUBSTRING(Data, 1, CHAR_LENGTH(Data) - 4)), '(TV)', '')), ' ', -1), '/', -1), ')','')
       ELSE null END AS ReleaseNumber,
       
       SUBSTRING(Data, 1, POSITION(CHAR(9) IN Data) - 1)
FROM staging_imdbMovies
WHERE RIGHT(Data,4) > 0
  AND TRIM(CHAR(9) FROM SUBSTRING(Data, 1, CHAR_LENGTH(Data) - 4)) NOT LIKE '%(V)'
  AND TRIM(CHAR(9) FROM SUBSTRING(Data, 1, CHAR_LENGTH(Data) - 4)) NOT LIKE '%(VG)'
  AND TRIM(CHAR(9) FROM SUBSTRING(Data, 1, CHAR_LENGTH(Data) - 4)) NOT LIKE '%{{SUSPENDED}}'  
  AND SUBSTRING_INDEX(TRIM(REPLACE(TRIM(CHAR(9) FROM SUBSTRING(Data, 1, CHAR_LENGTH(Data) - 4)), '(TV)', '')), ' ', -1) NOT LIKE '%????%';
  

#MovieGenres
DELETE FROM staging_UniqueGenres;
ALTER TABLE staging_UniqueGenres AUTO_INCREMENT = 1;
INSERT INTO staging_UniqueGenres (Name)
SELECT DISTINCT SUBSTRING_INDEX(Data,Char(9), -1)
FROM staging_imdbGenres;

DELETE FROM staging_Genres;
INSERT INTO staging_Genres (Movie, Genre, GenreId)
SELECT SUBSTRING(Data, 1, POSITION(CHAR(9) IN Data) - 1), 
	   SUBSTRING_INDEX(Data,Char(9), -1),
       GenreId
FROM staging_imdbGenres AS ig
INNER JOIN staging_UniqueGenres AS ug
ON ug.Name = SUBSTRING_INDEX(Data,Char(9), -1);

UPDATE staging_Genres g
INNER JOIN staging_Movies m
ON g.Movie = m.Movie
SET g.MovieId = m.MovieId
WHERE g.MovieId = 0;

select * from staging_Genres
where MovieId > 0
  

#Directors

#Actors

#Actresses

#Keywords

#Languages

#Producers

#Ratings

#Writers


  


