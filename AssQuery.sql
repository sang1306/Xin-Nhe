USE [master]
GO
DROP DATABASE IF EXISTS [AssDBTest]
CREATE DATABASE [AssDBTest]
USE [AssDBTest]
GO
CREATE TABLE [Author]
(
	[ID] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[Name] [nvarchar](50) NOT NULL
)
CREATE TABLE [Category]
(
	[ID] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[Name] [nvarchar](50) NOT NULL
)
CREATE TABLE [Publisher]	
(
	[ID] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[Name] [nvarchar](50) NOT NULL
)
CREATE TABLE [Language]
(
	[ID] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[Name] [nvarchar](50) NOT NULL
)
CREATE TABLE [Role]
(
	[ID] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[Name] [nvarchar](50) NOT NULL
)
CREATE TABLE .[User]
(
	[ID] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[RoleID] [int] NOT NULL FOREIGN KEY REFERENCES [Role](ID),
	[Email] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[Fullname] [nvarchar](50) NOT NULL,
	[DOB] [date] NOT NULL,
	[Sex] [bit] NOT NULL,
	[Phone] [varchar](10) NOT NULL,
	[Address] [varchar](100) NOT NULL
)
CREATE TABLE [Book]
(
	[ID] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[CategoryID] [int] NOT NULL FOREIGN KEY REFERENCES [Category](ID),
	[Title] [nvarchar](50) NOT NULL,
	[AuthorID] [int] NOT NULL FOREIGN KEY REFERENCES [Author](ID),
	[PublisherID] [int] NOT NULL FOREIGN KEY REFERENCES [Publisher](ID),
	[Description] [nvarchar](50) NOT NULL,
	[Price] [float] NOT NULL,
	[Discount] [int] NOT NULL,
	[LanguageID] [int] NOT NULL FOREIGN KEY REFERENCES [Language](ID),
	[ReleaseYear] [int] NOT NULL,
	[NumberOfPages] [int] NOT NULL,
	[Image] [varchar](max) NOT NULL,
	[Size] [varchar](50) NOT NULL,
	[Weight] [float] NOT NULL,
	[Format] [varchar](50) NOT NULL,
	[Quality] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Vote] [float] NOT NULL,
	[Status] [bit] NOT NULL
)
CREATE TABLE [Order]
(
	[ID] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[UserID] [int] NOT NULL FOREIGN KEY REFERENCES [User](ID),
	[Voucher] [varchar](10) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[IsPaid] [bit] NOT NULL,
	[Status] [bit] NULL
)
CREATE TABLE [OrderDetail]
(
	[ID] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[OrderID] [int] NOT NULL FOREIGN KEY REFERENCES [Order](ID),
	[BookID] [int] NOT NULL FOREIGN KEY REFERENCES [Book](ID),
	[RealPrice] [float] NOT NULL,
	[Quantity] [int] NOT NULL
)
CREATE TABLE [Feedback](
	[ID] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[UserID] [int] NOT NULL FOREIGN KEY REFERENCES [User](ID),
	[BookID] [int] NOT NULL FOREIGN KEY REFERENCES [Book](ID),
	[Content] [nvarchar](max) NOT NULL,
	[CreatedDate] [datetime] NOT NULL
)
CREATE TABLE [FavoritesList]
(
	[BookID] [int] NOT NULL FOREIGN KEY REFERENCES [Book](ID),
	[UserID] [int] NOT NULL FOREIGN KEY REFERENCES [User](ID),
	Constraint PK_FavoritesList PRIMARY KEY ([BookID], [UserID])
)