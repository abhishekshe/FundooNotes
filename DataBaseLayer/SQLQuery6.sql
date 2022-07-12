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



create procedure spLoginUser(
@Email varchar(50),
@Password varchar(50)
)


