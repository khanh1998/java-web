USE [master]
GO
/****** Object:  Database [J3.L.P0038]    Script Date: 15/12/2018 2:50:29 CH ******/
CREATE DATABASE [J3.L.P0038]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'J3.L.P0038', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\J3.L.P0038.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'J3.L.P0038_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\J3.L.P0038_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [J3.L.P0038] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [J3.L.P0038].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [J3.L.P0038] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [J3.L.P0038] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [J3.L.P0038] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [J3.L.P0038] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [J3.L.P0038] SET ARITHABORT OFF 
GO
ALTER DATABASE [J3.L.P0038] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [J3.L.P0038] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [J3.L.P0038] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [J3.L.P0038] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [J3.L.P0038] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [J3.L.P0038] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [J3.L.P0038] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [J3.L.P0038] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [J3.L.P0038] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [J3.L.P0038] SET  DISABLE_BROKER 
GO
ALTER DATABASE [J3.L.P0038] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [J3.L.P0038] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [J3.L.P0038] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [J3.L.P0038] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [J3.L.P0038] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [J3.L.P0038] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [J3.L.P0038] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [J3.L.P0038] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [J3.L.P0038] SET  MULTI_USER 
GO
ALTER DATABASE [J3.L.P0038] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [J3.L.P0038] SET DB_CHAINING OFF 
GO
ALTER DATABASE [J3.L.P0038] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [J3.L.P0038] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [J3.L.P0038] SET DELAYED_DURABILITY = DISABLED 
GO
USE [J3.L.P0038]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 15/12/2018 2:50:29 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Account](
	[userId] [varchar](20) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[firstName] [nvarchar](20) NULL,
	[lastName] [nvarchar](20) NULL,
	[password] [varchar](50) NOT NULL,
	[website] [varchar](50) NULL,
	[sendNotification] [bit] NULL,
	[role] [int] NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[userId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Account] ([userId], [email], [firstName], [lastName], [password], [website], [sendNotification], [role]) VALUES (N'u1', N'abc@gmail.com', N'Bui', N'Khanh', N'12345', N'khanh.com.vn', 1, 1)
INSERT [dbo].[Account] ([userId], [email], [firstName], [lastName], [password], [website], [sendNotification], [role]) VALUES (N'u2', N'thanh@yahoo.com', N'thanh', N'bui', N'12345', N'thanh.info', 1, 1)
INSERT [dbo].[Account] ([userId], [email], [firstName], [lastName], [password], [website], [sendNotification], [role]) VALUES (N'u3', N'hoang@gmail.com', N'hoang', N'bui', N'12345', N'hoangbui.com.vn', 1, 0)
INSERT [dbo].[Account] ([userId], [email], [firstName], [lastName], [password], [website], [sendNotification], [role]) VALUES (N'u4', N'khang@hotmail.com', N'khanh', N'bui', N'12345', N'khangbui.info', 1, 0)
INSERT [dbo].[Account] ([userId], [email], [firstName], [lastName], [password], [website], [sendNotification], [role]) VALUES (N'u5', N'khanh@yahoo.co', N'bui', N'ha', N'12345', N'habui.com', 1, 0)
USE [master]
GO
ALTER DATABASE [J3.L.P0038] SET  READ_WRITE 
GO
