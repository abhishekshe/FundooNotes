--DataBase Create
Create DataBase FundooNotes
-- Using the Database
use FundooNotes


-- Creating table Users in Fundonotes Database
Create table Users(
UserId int identity(1,1) primary key,
Firstname varchar(50),
Lastname varchar(50),
Email varchar(50) unique,
password varchar(100),
CreatedDate datetime default GetDate(),
modifiedDate datetime default GetDate(),
)
select * from Users



create procedure spGetAllUser
As
Begin try
select * from Users
end try
Begin catch
SELECT 
	ERROR_NUMBER() AS ErrorNumber,
	ERROR_STATE() AS ErrorState,
	ERROR_PROCEDURE() AS ErrorProcedure,
	ERROR_LINE() AS ErrorLine,
	ERROR_MESSAGE() AS ErrorMessage;
END CATCH

exec spGetAllUser
Create procedure spLoginUser(
@Email varchar(50),
@Password varchar(50)
)
As
Begin try
select * from userSignup where Email=@Email and password = @Password
end try
Begin catch
SELECT 
	ERROR_NUMBER() AS ErrorNumber,
	ERROR_STATE() AS ErrorState,
	ERROR_PROCEDURE() AS ErrorProcedure,
	ERROR_LINE() AS ErrorLine,
	ERROR_MESSAGE() AS ErrorMessage;
END CATCH

exec spLoginUser 'ranjeetsingh234@gmail.com' ,'Ranjeet@23'

--select * from userSignup
--truncate table userSignup
select * from Users


--forgot password


Create procedure spForgetPasswordUser(
@Email varchar(50)
)
As
Begin try
select * from Users where Email=@Email 
end try
Begin catch
SELECT 
	ERROR_NUMBER() AS ErrorNumber,
	ERROR_STATE() AS ErrorState,
	ERROR_PROCEDURE() AS ErrorProcedure,
	ERROR_LINE() AS ErrorLine,
	ERROR_MESSAGE() AS ErrorMessage;
END CATCH

exec spForgetPasswordUser 'Abhishek@gmail.com'
select * from Users

Create procedure spResetPassword(
@Email varchar(50),
@Password varchar(50)
)
As
Begin try
select * from Users where Email=@Email 
end try
Begin catch
SELECT 
	ERROR_NUMBER() AS ErrorNumber,
	ERROR_STATE() AS ErrorState,
	ERROR_PROCEDURE() AS ErrorProcedure,
	ERROR_LINE() AS ErrorLine,
	ERROR_MESSAGE() AS ErrorMessage;
END CATCH


select * from Users


sp_helptext spAddNote





exec spAddNote 'aaaa','bbbc','cccc',2;
Alter procedure spAddNote(
@Title varchar(20), 
@Description varchar(max),
@BgColor varchar(50),
@UserId int
)
As
Begin try
insert into Note(Title,Description,Bgcolor,UserId,ModifiedDate) values(@Title,@Description,@BgColor,@UserId,GetDate())
Select * from Note where UserId = @UserId
end try
Begin catch
SELECT 
	ERROR_NUMBER() AS ErrorNumber,
	ERROR_STATE() AS ErrorState,
	ERROR_PROCEDURE() AS ErrorProcedure,
	ERROR_LINE() AS ErrorLine,
	ERROR_MESSAGE() AS ErrorMessage;
END CATCH




create table Note(
NoteId int identity(1,1) primary key,
Title varchar(20) not null,
Description varchar(max) not null,
Bgcolor varchar(50) not null,
IsPin bit,
IsArchive bit,
IsRemainder bit,
IsTrash bit,
UserId int not null foreign key references Users(UserId),
RegisteredDate datetime default GETDATE(),
Remainder datetime,
ModifiedDate datetime null
)
select * from Note

Alter procedure spUpdateNote(
@Title varchar(20), 
@Description varchar(max),
@BgColor varchar(50),
@UserId int,
@NoteId int,
@IsPin bit,
@IsArchive bit,
@IsTrash bit
)
As
Begin try
Update Note set Title=@Title, Description=@Description,BgColor=@BgColor,UserId=@UserId,IsPin=@IsPin,IsArchive=@IsArchive,IsTrash=@IsTrash,ModifiedDate=GetDate() where UserId=@UserId and NoteId=@NoteId
Select * from Note where UserId = @UserId
end try
Begin catch
SELECT 
	ERROR_NUMBER() AS ErrorNumber,
	ERROR_STATE() AS ErrorState,
	ERROR_PROCEDURE() AS ErrorProcedure,
	ERROR_LINE() AS ErrorLine,
	ERROR_MESSAGE() AS ErrorMessage;
END CATCH


Update Note Title=Node2 where  NoteId=1

select * from users
select * from Note




	

