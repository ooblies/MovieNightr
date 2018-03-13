CREATE TABLE staging.Genres (
  Movie nvarchar(1000) NULL,
  Genre nvarchar(100) NOT NULL,
  CreatedOn datetime NOT NULL DEFAULT GETDATE()
) 

CREATE TABLE staging.imdbActors (
  Data nvarchar(2000)  NULL,
  CreatedOn datetime NOT NULL DEFAULT GETDATE()
) 
CREATE TABLE staging.imdbActresses (
  Data nvarchar(2000)  NULL,
  CreatedOn datetime NOT NULL DEFAULT GETDATE()
) 
CREATE TABLE staging.imdbDirectors (
  Data nvarchar(2000)  NULL,
  CreatedOn datetime NOT NULL DEFAULT GETDATE()
) 
CREATE TABLE staging.imdbGenres (
  Data nvarchar(2000)  NULL,
  CreatedOn datetime NOT NULL DEFAULT GETDATE()
) 
CREATE TABLE staging.imdbKeywords (
  Data nvarchar(2000)  NULL,
  CreatedOn datetime NOT NULL DEFAULT GETDATE()
) 
CREATE TABLE staging.imdbLanguages (
  Data nvarchar(2000)  NULL,
  CreatedOn datetime NOT NULL DEFAULT GETDATE()
) 
CREATE TABLE staging.imdbMovies (
  Data nvarchar(2000)  NULL,
  CreatedOn datetime NOT NULL DEFAULT GETDATE()
) 
CREATE TABLE staging.imdbProducers (
  Data nvarchar(2000)  NULL,
  CreatedOn datetime NOT NULL DEFAULT GETDATE()
) 
CREATE TABLE staging.imdbRatings (
  Data nvarchar(2000)  NULL,
  CreatedOn datetime NOT NULL DEFAULT GETDATE()
) 
CREATE TABLE staging.imdbWriters (
  Data nvarchar(2000)  NULL,
  CreatedOn datetime NOT NULL DEFAULT GETDATE()
) 
CREATE TABLE staging.Movies (
  Movie nvarchar(1000) DEFAULT NULL,
  Title nvarchar(1000)  NULL,
  ReleaseYear nvarchar(10)  NULL,
  IsTV bit  NULL,
  ReleaseNumber nvarchar(10)  NULL,
  CreatedOn datetime NOT NULL DEFAULT GETDATE()
) 
