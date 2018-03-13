INSERT INTO MovieListStatus (Name, IsActive, CreatedBy, ModifiedBy)
VALUES ('Seen - Liked',1,'cdudziak','cdudziak'),
       ('Seen - Didn''t Like',1,'cdudziak','cdudziak'),
       ('Ranked',1,'cdudziak','cdudziak')

INSERT INTO FriendshipStatus (Name,IsActive,CreatedBy,ModifiedBy)
VALUES ('Requested',1,'cdudziak','cdudziak'),
	   ('Accepted',1,'cdudziak','cdudziak'),
	   ('Declined',1,'cdudziak','cdudziak')

INSERT INTO EventUserStatus (Name, IsActive, CreatedBy, ModifiedBy)
VALUES ('Invited',1,'cdudziak','cdudziak'),
	   ('Accepted',1,'cdudziak','cdudziak'),
	   ('Declined',1,'cdudziak','cdudziak')

INSERT INTO UserStatus (Name, IsActive, CreatedBy, ModifiedBy)
VALUES ('Active',1,'cdudziak','cdudziak'),
	   ('Disabled', 1, 'cdudziak','cdudziak')

INSERT INTO Users (UserName, Password, FirstName, LastName, LastLoginDate, Email, UserStatusId, IsActive, CreatedBy, ModifiedBy)
SELECT 'ooblies','gotenks','Chris','Dudziak',GETDATE(),'chris.dudziak@gmail.com',1,1,'cdudziak','cdudziak' 

SELECT * FROM Users
