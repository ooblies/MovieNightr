
	SET SQL_BIG_SELECTS = 1;
    SET SQL_SAFE_UPDATES = 0;
    
	DELETE FROM MovieNightr.Movies;
	INSERT INTO MovieNightr.Movies (MovieId, Title, ReleaseYear, ReleaseNumber, IsTV, CreatedBy, ModifiedBy) 

	SELECT MovieId, Title, ReleaseYear, ReleaseNumber, IsTV, 'LoadTables','LoadTables'
	FROM staging_MovieNightr.staging_Movies;

	#Genres
	DELETE FROM MovieNightr.Genres;
	INSERT INTO MovieNightr.Genres (Name, CreatedBy, ModifiedBy)
	SELECT DISTINCT Genre, 'LoadTables', 'LoadTables'
	FROM staging_MovieNightr.staging_Genres
	ORDER BY Genre;

	DELETE FROM MovieNightr.MovieGenres;
    ALTER TABLE MovieNightr.MovieGenres AUTO_INCREMENT = 1;
	INSERT INTO MovieNightr.MovieGenres (MovieId, GenreId, CreatedBy, ModifiedBy)
	SELECT sg.MovieId, 
		   sg.GenreId,
		   'LoadTables',
		   'LoadTables'
	FROM staging_MovieNightr.staging_Genres sg
	