--Movies
--ALTER TABLE staging.Movies
--ALTER COLUMN Movie NVARCHAR(500) NOT NULL

--CREATE NONCLUSTERED INDEX [IX_Staging_Movies_Movie] on staging.Movies (Movie)

--Genres
--ALTER TABLE staging.Genres
--ALTER COLUMN Movie NVARCHAR(500) NOT NULL

--CREATE NONCLUSTERED INDEX [IX_Staging_Genres_Movie] on staging.Genres (Movie)

--Directors
--ALTER TABLE staging.Directors
--ALTER COLUMN Movie NVARCHAR(500) NOT NULL

--CREATE NONCLUSTERED INDEX [IX_Staging_Directors_Movie] on staging.Directors (Movie)

----Actors
--ALTER TABLE staging.Actors
--ALTER COLUMN Movie NVARCHAR(500) NOT NULL

--ALTER TABLE staging.Actors
--ALTER COLUMN Name NVARCHAR(500) NOT NULL

--CREATE NONCLUSTERED INDEX [IX_Staging_Actors_Movie] on staging.Actors (Movie)

--Actresses
--ALTER TABLE staging.Actresses
--ALTER COLUMN Movie NVARCHAR(500) NOT NULL

--ALTER TABLE staging.Actresses
--ALTER COLUMN Actress NVARCHAR(500) NOT NULL

--ALTER TABLE staging.IMDBActresses
--ADD Movie NVARCHAR(500) NOT NULL
--ALTER TABLE staging.IMDBActresses
--ADD Actress NVARCHAR(500) NOT NULL

--CREATE NONCLUSTERED INDEX [IX_Staging_Actresses_Movie] on staging.Actresses (Movie)

--Producers
--ALTER TABLE staging.IMDBProducers
--ADD Movie NVARCHAR(500) NOT NULL
--ALTER TABLE staging.IMDBProducers
--ADD Producer NVARCHAR(500) NOT NULL
--CREATE NONCLUSTERED INDEX [IX_Staging_Producers_Movie] on staging.Producers (Movie)
----Keywords
--ALTER TABLE staging.IMDBKeywords
--ADD Movie NVARCHAR(500) NOT NULL
--ALTER TABLE staging.IMDBKeywords
--ADD Keyword NVARCHAR(500) NOT NULL
--CREATE NONCLUSTERED INDEX [IX_Staging_Keywords_Movie] on staging.Keywords (Movie)
--Languages
--ALTER TABLE staging.IMDBLanguages
--ADD Movie NVARCHAR(500) NOT NULL
--ALTER TABLE staging.IMDBLanguages
--ADD Language NVARCHAR(500) NOT NULL
--CREATE NONCLUSTERED INDEX [IX_Staging_Languages_Movie] on staging.Languages (Movie)
----Ratings
--ALTER TABLE staging.IMDBRatings
--ADD Movie NVARCHAR(500) NOT NULL
--ALTER TABLE staging.IMDBRatings
--ADD Rating NVARCHAR(500) NOT NULL
--CREATE NONCLUSTERED INDEX [IX_Staging_Ratings_Movie] on staging.Ratings (Movie)
--Writers
--ALTER TABLE staging.IMDBWriters
--ADD Movie NVARCHAR(500) NOT NULL
--ALTER TABLE staging.IMDBWriters
--ADD Writer NVARCHAR(500) NOT NULL
--CREATE NONCLUSTERED INDEX [IX_Staging_Writers_Movie] on staging.Writers (Movie)

----Movies
--DROP INDEX [Movies_Unique] ON [dbo].[Movies]
--CREATE UNIQUE NONCLUSTERED INDEX [IX_Movies_Unique] ON Movies (Title, ReleaseYear, ReleaseNumber, IsTV)
--CREATE NONCLUSTERED INDEX [IX_Movies_Title] ON Movies (Title)

--CREATE NONCLUSTERED INDEX [IX_Actors_Name] ON Actors (Name)
--CREATE NONCLUSTERED INDEX [IX_Directors_Name] ON Directors (Name)
--CREATE NONCLUSTERED INDEX [IX_Genres_Name] ON Genres (Name)
--CREATE NONCLUSTERED INDEX [IX_Languages_Name] ON Languages (Name)
--CREATE NONCLUSTERED INDEX [IX_Producers_Name] ON Producers (Name)
--CREATE NONCLUSTERED INDEX [IX_Tags_Name] ON Tags (Name)
--CREATE NONCLUSTERED INDEX [IX_Writers_Name] ON Writers (Name)





--Create FK Indexes
--CREATE NONCLUSTERED INDEX [IX_MovieGenres_MovieId_GenreId] ON MovieGenres (MovieId, GenreId)

--CREATE NONCLUSTERED INDEX [IX_EventMovies_EventId_MovieId] ON EventMovies (EventId, MovieId)

--CREATE NONCLUSTERED INDEX [IX_EventUsers_EventId_UserId] ON EventUsers (EventId, UserId)

--CREATE NONCLUSTERED INDEX [IX_FilterSetFilters_FilterSetId_FilterId] ON FilterSetFilters (FilterSetId, FilterId)

--CREATE NONCLUSTERED INDEX [IX_FilterSets_UserId] ON FilterSets (UserId)

--CREATE NONCLUSTERED INDEX [IX_Friendship_UserId_FriendId] ON Friendship (UserId, FriendId)

--CREATE NONCLUSTERED INDEX [IX_MovieActors_MovieId_ActorId] ON MovieActors (MovieId, ActorId)

--CREATE NONCLUSTERED INDEX [IX_MovieDirectors_MovieId_DirectorId] ON MovieDirectors (MovieId, DirectorId)

--CREATE NONCLUSTERED INDEX [IX_MovieLanguages_MovieId_LanguageId] ON MovieLanguages (MovieId, LanguageId)

--CREATE NONCLUSTERED INDEX [IX_MovieLists_MovieId_UserId] ON MovieLists (MovieId, UserId)

--CREATE NONCLUSTERED INDEX [IX_MovieProducers_MovieId_ProducerId] ON MovieProducers (MovieId, ProducerId)

--CREATE NONCLUSTERED INDEX [IX_MovieTags_MovieId_TagId] ON MovieTags (MovieId, TagId)

--CREATE NONCLUSTERED INDEX [IX_MovieWrtiers_MovieId_WriterId] ON MovieWriters (MovieId, WriterId)



