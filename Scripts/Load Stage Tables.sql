SET SQL_SAFE_UPDATES = 0;


#Movies
DELETE FROM staging_Movies;

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
DELETE FROM staging_Genres;

INSERT INTO staging_Genres (Movie, Genre)
SELECT SUBSTRING(Data, 1, POSITION(CHAR(9) IN Data) - 1), 
	   SUBSTRING_INDEX(Data,Char(9), -1)
FROM staging_imdbGenres


  


