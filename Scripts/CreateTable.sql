
DROP TABLE IF EXISTS MovieTags;
DROP TABLE IF EXISTS MovieDirectors;
DROP TABLE IF EXISTS MovieWriters;
DROP TABLE IF EXISTS MovieLanguages;
DROP TABLE IF EXISTS MovieProducers;
DROP TABLE IF EXISTS MovieGenres;
DROP TABLE IF EXISTS MovieActors;

DROP TABLE IF EXISTS Directors;
DROP TABLE IF EXISTS Tags;
DROP TABLE IF EXISTS Writers;
DROP TABLE IF EXISTS Languages;
DROP TABLE IF EXISTS Actors;
DROP TABLE IF EXISTS Producers;
DROP TABLE IF EXISTS MovieTags;
DROP TABLE IF EXISTS Genres;

DROP TABLE IF EXISTS Recommendations;
DROP TABLE IF EXISTS MovieLists;
DROP TABLE IF EXISTS MovieListStatus;

DROP TABLE IF EXISTS FilterSetFilters;
DROP TABLE IF EXISTS FilterSets;
DROP TABLE IF EXISTS Filters;

DROP TABLE IF EXISTS EventUsers;
DROP TABLE IF EXISTS EventUserStatus;
DROP TABLE IF EXISTS EventMovies;
DROP TABLE IF EXISTS Events;

DROP TABLE IF EXISTS Friendship;
DROP TABLE IF EXISTS FriendshipStatus;
DROP TABLE IF EXISTS Users;
DROP TABLE IF EXISTS UserStatus;
DROP TABLE IF EXISTS Movies;


CREATE TABLE UserStatus 
(
UserStatusId INT PRIMARY KEY NOT NULL auto_increment,
Name NVARCHAR(100) NOT NULL,
IsActive BIT NOT NULL DEFAULT 1,
CreatedOn datetime default now(),
CreatedBy NVARCHAR(20) NOT NULL,
ModifiedOn datetime default now(),
ModifiedBy NVARCHAR(20) NOT NULL
);

CREATE TABLE Users 
(
UserId INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
UserName NVARCHAR(20) NOT NULL,
Password NVARCHAR(20) NOT NULL,
FirstName NVARCHAR(100) NULL,
LastName NVARCHAR(100) NULL,
Email NVARCHAR(100) NULL,
UserStatusId INT NOT NULL,
LastLoginDate DATETIME NULL,
IsActive BIT NOT NULL DEFAULT 1,
CreatedOn datetime default now(),
CreatedBy NVARCHAR(20) NOT NULL,
ModifiedOn datetime default now(),
ModifiedBy NVARCHAR(20) NOT NULL,
CONSTRAINT fk_Users_UserStatus_UserStatusId FOREIGN KEY (UserStatusId) REFERENCES UserStatus (UserStatusId)
);

CREATE TABLE FriendshipStatus
(
FriendshipStatusId INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
Name NVARCHAR(100) NOT NULL,
IsActive BIT NOT NULL DEFAULT 1,
CreatedOn datetime default now(),
CreatedBy NVARCHAR(20) NOT NULL,
ModifiedOn datetime default now(),
ModifiedBy NVARCHAR(20) NOT NULL
);

CREATE TABLE Friendship 
(
FriendshipId INT PRIMARY KEY NOT NULL auto_increment,
UserId INT NOT NULL,
FriendId INT NOT NULL,
FriendshipStatusId INT NOT NULL,
LastActionUserId INT NOT NULL,
IsActive BIT NOT NULL DEFAULT 1,
CreatedOn datetime default now(),
CreatedBy NVARCHAR(20) NOT NULL,
ModifiedOn datetime default now(),
ModifiedBy NVARCHAR(20) NOT NULL,
CONSTRAINT fk_Friendship_Users_UserId FOREIGN KEY (UserId) REFERENCES Users (UserId),
CONSTRAINT fk_Friendship_Users_FriendId FOREIGN KEY (FriendId) REFERENCES Users (UserId),
CONSTRAINT fk_Friendship_Users_LastActionUserId FOREIGN KEY (LastActionUserId) REFERENCES Users (UserId)
);

CREATE TABLE Movies
(
MovieId INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
Title NVARCHAR(100) NOT NULL,
ReleaseYear INT NULL,
Rating NVARCHAR(100) NULL,
IMDBLink NVARCHAR(100) NOT NULL,
IsActive BIT NOT NULL DEFAULT 1,
CreatedOn datetime default now(),
CreatedBy NVARCHAR(20) NOT NULL,
ModifiedOn datetime default now(),
ModifiedBy NVARCHAR(20) NOT NULL
);

CREATE TABLE Recommendations 
(
RecommendationId INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
FromUserId INT NOT NULL,
ToUserId INT NOT NULL,
MovieId INT NOT NULL,
RecommendationDate DATETIME NOT NULL,
Comment NVARCHAR(1000) NULL,
HasSeen BIT NOT NULL DEFAULT 0,
IsActive BIT NOT NULL DEFAULT 1,
CreatedOn datetime default now(),
CreatedBy NVARCHAR(20) NOT NULL,
ModifiedOn datetime default now(),
ModifiedBy NVARCHAR(20) NOT NULL,
CONSTRAINT Recommendations_Users_FromUserId FOREIGN KEY (FromUserId) REFERENCES Users (UserId),
CONSTRAINT Recommendations_Users_ToUserId FOREIGN KEY (ToUserId) REFERENCES Users (UserId),
CONSTRAINT Recommendations_Users_MovieId FOREIGN KEY (MovieId) REFERENCES Movies (MovieId)
);

CREATE TABLE MovieListStatus 
(
MovieListStatusId INT PRIMARY KEY NOT NULL auto_increment,
Name nvarchar(50) NOT NULL,
IsActive BIT NOT NULL DEFAULT 1,
CreatedOn datetime default now(),
CreatedBy NVARCHAR(20) NOT NULL,
ModifiedOn datetime default now(),
ModifiedBy NVARCHAR(20) NOT NULL
);

Create TABLE MovieLists 
(
MovieListId INT PRIMARY KEY NOT NULL auto_increment,
UserId INT NOT NULL,
MovieId INT NOT NULL,
Rank INT NULL,
MovieListStatusId INT NOT NULL,
IsActive BIT NOT NULL DEFAULT 1,
CreatedOn datetime default now(),
CreatedBy NVARCHAR(20) NOT NULL,
ModifiedOn datetime default now(),
ModifiedBy NVARCHAR(20) NOT NULL,
CONSTRAINT MovieLists_Users_UserId FOREIGN KEY (UserId) REFERENCES Users (UserId),
CONSTRAINT MovieLists_Movies_MovieId FOREIGN KEY (MovieId) REFERENCES Movies (MovieId),
CONSTRAINT MovieLists_MovieListStatus_MovieListStatusId FOREIGN KEY (MovieListStatusId) REFERENCES MovieListStatus(MovieListStatusId)
);

CREATE TABLE FilterSets
(
FilterSetId INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
Name NVARCHAR(100) NOT NULL,
UserId INT NULL,
IsActive BIT NOT NULL DEFAULT 1,
CreatedOn datetime default now(),
CreatedBy NVARCHAR(20) NOT NULL,
ModifiedOn datetime default now(),
ModifiedBy NVARCHAR(20) NOT NULL,
CONSTRAINT FilterSets_Users_UserId FOREIGN KEY (UserId) REFERENCES Users (UserId)
);

CREATE TABLE Events
(
EventId INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
EventLeaderUserId INT NOT NULL,
EventDate date NOT NULL,
EventTime time null,
Title NVARCHAR(100) NOT NULL,
Description NVARCHAR(1000) NULL,
FilterSetId INT NULL,
IsActive BIT NOT NULL DEFAULT 1,
CreatedOn datetime default now(),
CreatedBy NVARCHAR(20) NOT NULL,
ModifiedOn datetime default now(),
ModifiedBy NVARCHAR(20) NOT NULL,
CONSTRAINT Events_FilterSets_FilterSetId FOREIGN KEY (FilterSetId) REFERENCES FilterSets (FilterSetId)
);

CREATE TABLE EventUserStatus
(
EventUserStatusId INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
Name NVARCHAR(100) NOT NULL,
IsActive BIT NOT NULL DEFAULT 1,
CreatedOn datetime default now(),
CreatedBy NVARCHAR(20) NOT NULL,
ModifiedOn datetime default now(),
ModifiedBy NVARCHAR(20) NOT NULL
);

CREATE TABLE EventUsers
(
EventUserId INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
EventId INT NOT NULL,
UserId INT NOT NULL,
EventUserStatusId INT NOT NULL,
LastActionOn DATETIME NOT NULL,
IsActive BIT NOT NULL DEFAULT 1,
CreatedOn datetime default now(),
CreatedBy NVARCHAR(20) NOT NULL,
ModifiedOn datetime default now(),
ModifiedBy NVARCHAR(20) NOT NULL,
CONSTRAINT EventUsers_Events_EventId FOREIGN KEY (EventId) REFERENCES Events (EventId),
CONSTRAINT EventUsers_Users_UserId FOREIGN KEY (UserId) REFERENCES Users (UserId),
CONSTRAINT EventUsers_EventUserStatus_EventUserStatusId FOREIGN KEY (EventUserStatusId) REFERENCES EventUserStatus (EventUserStatusId)
);

CREATE TABLE Filters
(
FilterId INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
Name NVARCHAR(100) NOT NULL,
IsActive BIT NOT NULL DEFAULT 1,
CreatedOn datetime default now(),
CreatedBy NVARCHAR(20) NOT NULL,
ModifiedOn datetime default now(),
ModifiedBy NVARCHAR(20) NOT NULL
);

CREATE TABLE FilterSetFilters
(
FilterSetFilterId INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
FilterSetId INT NOT NULL,
FilterId INT NOT NULL,
IsActive BIT NOT NULL DEFAULT 1,
CreatedOn datetime default now(),
CreatedBy NVARCHAR(20) NOT NULL,
ModifiedOn datetime default now(),
ModifiedBy NVARCHAR(20) NOT NULL,
CONSTRAINT FilterSetFilters_FilterSets_FilterSetId FOREIGN KEY (FilterSetId) REFERENCES FilterSets(FilterSetId),
CONSTRAINT FilterSetFilters_Filters_FilterId FOREIGN KEY (FilterId) REFERENCES Filters (FilterId)
);

CREATE TABLE EventMovies
(
EventMovieId INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
EventId INT NOT NULL,
MovieId INT NOT NULL,
WasWatched BIT NULL,
IsActive BIT NOT NULL DEFAULT 1,
CreatedOn datetime default now(),
CreatedBy NVARCHAR(20) NOT NULL,
ModifiedOn datetime default now(),
ModifiedBy NVARCHAR(20) NOT NULL,
CONSTRAINT EventMovies_Events_EventId FOREIGN KEY (EventId) REFERENCES Events (EventId),
CONSTRAINT EventMoveis_Movies_MovieId FOREIGN KEY (MovieId) REFERENCES Movies (MovieId)

);

CREATE TABLE Directors
(
DirectorId INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
Name NVARCHAR(100) NOT NULL,
IsActive BIT NOT NULL DEFAULT 1,
CreatedOn datetime default now(),
CreatedBy NVARCHAR(20) NOT NULL,
ModifiedOn datetime default now(),
ModifiedBy NVARCHAR(20) NOT NULL
);

CREATE TABLE Writers
(
WriterId INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
Name NVARCHAR(100) NOT NULL,
IsActive BIT NOT NULL DEFAULT 1,
CreatedOn datetime default now(),
CreatedBy NVARCHAR(20) NOT NULL,
ModifiedOn datetime default now(),
ModifiedBy NVARCHAR(20) NOT NULL
);

CREATE TABLE Tags
(
TagId INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
Name NVARCHAR(100) NOT NULL,
IsActive BIT NOT NULL DEFAULT 1,
CreatedOn datetime default now(),
CreatedBy NVARCHAR(20) NOT NULL,
ModifiedOn datetime default now(),
ModifiedBy NVARCHAR(20) NOT NULL
);

CREATE TABLE Genres
(
GenreId INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
Name NVARCHAR(100) NOT NULL,
IsActive BIT NOT NULL DEFAULT 1,
CreatedOn datetime default now(),
CreatedBy NVARCHAR(20) NOT NULL,
ModifiedOn datetime default now(),
ModifiedBy NVARCHAR(20) NOT NULL
);

CREATE TABLE Languages
(
LanguageId INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
Name NVARCHAR(100) NOT NULL,
IsActive BIT NOT NULL DEFAULT 1,
CreatedOn datetime default now(),
CreatedBy NVARCHAR(20) NOT NULL,
ModifiedOn datetime default now(),
ModifiedBy NVARCHAR(20) NOT NULL
);

CREATE TABLE Actors
(
ActorId INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
Name NVARCHAR(100) NOT NULL,
IsActive BIT NOT NULL DEFAULT 1,
CreatedOn datetime default now(),
CreatedBy NVARCHAR(20) NOT NULL,
ModifiedOn datetime default now(),
ModifiedBy NVARCHAR(20) NOT NULL
);

CREATE TABLE Producers
(
ProducerId INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
Name NVARCHAR(100) NOT NULL,
IsActive BIT NOT NULL DEFAULT 1,
CreatedOn datetime default now(),
CreatedBy NVARCHAR(20) NOT NULL,
ModifiedOn datetime default now(),
ModifiedBy NVARCHAR(20) NOT NULL
);

CREATE TABLE MovieDirectors
(
MovieDirectorId INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
MovieId INT NOT NULL,
DirectorId INT NOT NULL,
IsActive BIT NOT NULL DEFAULT 1,
CreatedOn datetime default now(),
CreatedBy NVARCHAR(20) NOT NULL,
ModifiedOn datetime default now(),
ModifiedBy NVARCHAR(20) NOT NULL,
CONSTRAINT MovieDirectors_Movies_MovieId FOREIGN KEY (MovieId) REFERENCES Movies (MovieId),
CONSTRAINT MovieDirectors_Directors_DirectorId FOREIGN KEY (DirectorId) REFERENCES Directors (DirectorId)
);

CREATE TABLE MovieWriters
(
MovieWriterId INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
MovieId INT NOT NULL,
WriterId INT NOT NULL,
IsActive BIT NOT NULL DEFAULT 1,
CreatedOn datetime default now(),
CreatedBy NVARCHAR(20) NOT NULL,
ModifiedOn datetime default now(),
ModifiedBy NVARCHAR(20) NOT NULL,
CONSTRAINT MovieWriters_Movies_MovieId FOREIGN KEY (MovieId) REFERENCES Movies (MovieId),
CONSTRAINT MovieWriters_Writers_WriterId FOREIGN KEY (WriterId) REFERENCES Writers (WriterId)
);

CREATE TABLE MovieTags
(
MovieTagId INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
MovieId INT NOT NULL,
TagId INT NOT NULL,
IsActive BIT NOT NULL DEFAULT 1,
CreatedOn datetime default now(),
CreatedBy NVARCHAR(20) NOT NULL,
ModifiedOn datetime default now(),
ModifiedBy NVARCHAR(20) NOT NULL,
CONSTRAINT MovieTags_Movies_MovieId FOREIGN KEY (MovieId) REFERENCES Movies (MovieId),
CONSTRAINT MovieTags_Tags_TagId FOREIGN KEY (TagId) REFERENCES Tags (TagId)
);

CREATE TABLE MovieGenres
(
MovieGenreId INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
MovieId INT NOT NULL,
GenreId INT NOT NULL,
IsActive BIT NOT NULL DEFAULT 1,
CreatedOn datetime default now(),
CreatedBy NVARCHAR(20) NOT NULL,
ModifiedOn datetime default now(),
ModifiedBy NVARCHAR(20) NOT NULL,
CONSTRAINT MovieGenres_Movies_MovieId FOREIGN KEY (MovieId) REFERENCES Movies (MovieId),
CONSTRAINT MovieGenres_Genres_GenreId FOREIGN KEY (GenreId) REFERENCES Genres (GenreId)
);

CREATE TABLE MovieLanguages
(
MovieLanguageId INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
MovieId INT NOT NULL,
LanguageId INT NOT NULL,
IsActive BIT NOT NULL DEFAULT 1,
CreatedOn datetime default now(),
CreatedBy NVARCHAR(20) NOT NULL,
ModifiedOn datetime default now(),
ModifiedBy NVARCHAR(20) NOT NULL,
CONSTRAINT MovieLanguages_Movies_MovieId FOREIGN KEY (MovieId) REFERENCES Movies (MovieId),
CONSTRAINT MovieLanguages_Languages_LanguageId FOREIGN KEY (LanguageId) REFERENCES Languages (LanguageId)
);

CREATE TABLE MovieActors
(
MovieActorId INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
MovieId INT NOT NULL,
ActorId INT NOT NULL,
IsActive BIT NOT NULL DEFAULT 1,
CreatedOn datetime default now(),
CreatedBy NVARCHAR(20) NOT NULL,
ModifiedOn datetime default now(),
ModifiedBy NVARCHAR(20) NOT NULL,
CONSTRAINT MovieActors_Movies_MovieId FOREIGN KEY (MovieId) REFERENCES Movies (MovieId),
CONSTRAINT MovieActors_Actors_ActorId FOREIGN KEY (ActorId) REFERENCES Actors (ActorId)
);

CREATE TABLE MovieProducers
(
MovieProducerId INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
MovieId INT NOT NULL,
ProducerId INT NOT NULL,
IsActive BIT NOT NULL DEFAULT 1,
CreatedOn datetime default now(),
CreatedBy NVARCHAR(20) NOT NULL,
ModifiedOn datetime default now(),
ModifiedBy NVARCHAR(20) NOT NULL,
CONSTRAINT MovieProducers_Movies_MovieId FOREIGN KEY (MovieId) REFERENCES Movies (MovieId),
CONSTRAINT MovieProducers_Producers_ProducerId FOREIGN KEY (ProducerId) REFERENCES Producers (ProducerId)
);

