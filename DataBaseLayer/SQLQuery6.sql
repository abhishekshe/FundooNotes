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
