USE [master]
GO
/****** Object:  Database [HammerDB]    Script Date: 8/4/2016 12:07:32 PM ******/
CREATE DATABASE [HammerDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'HammerDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\HammerDB.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'HammerDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\HammerDB_log.ldf' , SIZE = 816KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [HammerDB] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HammerDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HammerDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HammerDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HammerDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HammerDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HammerDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [HammerDB] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [HammerDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HammerDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HammerDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HammerDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HammerDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HammerDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HammerDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HammerDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HammerDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [HammerDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HammerDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HammerDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HammerDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HammerDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HammerDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [HammerDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HammerDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [HammerDB] SET  MULTI_USER 
GO
ALTER DATABASE [HammerDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HammerDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HammerDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HammerDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [HammerDB] SET DELAYED_DURABILITY = DISABLED 
GO
USE [HammerDB]
GO
/****** Object:  Table [dbo].[Hammers]    Script Date: 8/4/2016 12:07:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Hammers](
	[HammerId] [int] IDENTITY(1,1) NOT NULL,
	[HammerName] [varchar](500) NOT NULL,
	[HammerDescription] [nvarchar](1000) NULL,
	[IsActive] [bit] NOT NULL,
	[TypeId] [int] NOT NULL,
	[CreatedBy] [varchar](500) NOT NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedBy] [varchar](500) NULL,
	[ModifiedDate] [datetime] NULL,
 CONSTRAINT [PK_Hammers] PRIMARY KEY CLUSTERED 
(
	[HammerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[HammerTypes]    Script Date: 8/4/2016 12:07:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[HammerTypes](
	[TypeId] [int] IDENTITY(1,1) NOT NULL,
	[TypeName] [varchar](500) NOT NULL,
	[TypeDesc] [varchar](1000) NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [varchar](500) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedBy] [varchar](500) NULL,
	[ModifiedDate] [datetime] NULL,
 CONSTRAINT [PK_HammerTypes] PRIMARY KEY CLUSTERED 
(
	[TypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Hammers] ON 

INSERT [dbo].[Hammers] ([HammerId], [HammerName], [HammerDescription], [IsActive], [TypeId], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (2, N'Hammer 1', N'test', 1, 1, N'SYSTEM', CAST(N'2016-08-04 16:27:04.617' AS DateTime), N'SYSTEM', CAST(N'2016-08-04 12:03:29.490' AS DateTime))
INSERT [dbo].[Hammers] ([HammerId], [HammerName], [HammerDescription], [IsActive], [TypeId], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (3, N'Hammer 2', N'test', 1, 4, N'SYSTEM', CAST(N'2016-08-04 17:11:52.420' AS DateTime), NULL, NULL)
INSERT [dbo].[Hammers] ([HammerId], [HammerName], [HammerDescription], [IsActive], [TypeId], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (4, N'Hammer 3', N'test', 1, 5, N'SYSTEM', CAST(N'2016-08-04 12:01:29.557' AS DateTime), N'SYSTEM', CAST(N'2016-08-04 12:03:36.187' AS DateTime))
SET IDENTITY_INSERT [dbo].[Hammers] OFF
SET IDENTITY_INSERT [dbo].[HammerTypes] ON 

INSERT [dbo].[HammerTypes] ([TypeId], [TypeName], [TypeDesc], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (1, N'Type 1', N'test 1', 1, N'SYSTEM', CAST(N'2016-08-04 13:12:18.010' AS DateTime), N'SYSTEM', CAST(N'2016-08-04 17:25:09.533' AS DateTime))
INSERT [dbo].[HammerTypes] ([TypeId], [TypeName], [TypeDesc], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (4, N'Type2', N'test 2', 1, N'SYSTEM', CAST(N'2016-08-04 14:05:04.657' AS DateTime), N'SYSTEM', CAST(N'2016-08-04 17:25:26.283' AS DateTime))
INSERT [dbo].[HammerTypes] ([TypeId], [TypeName], [TypeDesc], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (5, N'Type 3', N'test 3', 1, N'SYSTEM', CAST(N'2016-08-04 17:12:10.707' AS DateTime), N'SYSTEM', CAST(N'2016-08-04 17:25:32.437' AS DateTime))
INSERT [dbo].[HammerTypes] ([TypeId], [TypeName], [TypeDesc], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (6, N'Type 4', N'test 4', 1, N'SYSTEM', CAST(N'2016-08-04 17:12:20.917' AS DateTime), NULL, NULL)
INSERT [dbo].[HammerTypes] ([TypeId], [TypeName], [TypeDesc], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (7, N'Type 5', N'test 5', 1, N'SYSTEM', CAST(N'2016-08-04 17:12:31.173' AS DateTime), NULL, NULL)
INSERT [dbo].[HammerTypes] ([TypeId], [TypeName], [TypeDesc], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (8, N'Type 6', N'test 6', 1, N'SYSTEM', CAST(N'2016-08-04 17:12:41.777' AS DateTime), NULL, NULL)
INSERT [dbo].[HammerTypes] ([TypeId], [TypeName], [TypeDesc], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (9, N'Type 7', N'test 7', 1, N'SYSTEM', CAST(N'2016-08-04 17:12:50.683' AS DateTime), NULL, NULL)
INSERT [dbo].[HammerTypes] ([TypeId], [TypeName], [TypeDesc], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (10, N'Type 8', N'test8', 1, N'SYSTEM', CAST(N'2016-08-04 17:13:01.717' AS DateTime), NULL, NULL)
INSERT [dbo].[HammerTypes] ([TypeId], [TypeName], [TypeDesc], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (11, N'Type 9', N'test 9', 1, N'SYSTEM', CAST(N'2016-08-04 17:13:16.280' AS DateTime), NULL, NULL)
INSERT [dbo].[HammerTypes] ([TypeId], [TypeName], [TypeDesc], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (12, N'Type 10', N'test 10', 1, N'SYSTEM', CAST(N'2016-08-04 17:13:26.450' AS DateTime), NULL, NULL)
INSERT [dbo].[HammerTypes] ([TypeId], [TypeName], [TypeDesc], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (13, N'Type 11', N'test 11', 1, N'SYSTEM', CAST(N'2016-08-04 17:13:36.910' AS DateTime), NULL, NULL)
INSERT [dbo].[HammerTypes] ([TypeId], [TypeName], [TypeDesc], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (14, N'Type 12', N'test 12', 1, N'SYSTEM', CAST(N'2016-08-04 17:13:46.980' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[HammerTypes] OFF
ALTER TABLE [dbo].[Hammers]  WITH CHECK ADD  CONSTRAINT [FK_Hammers_HammerTypes] FOREIGN KEY([TypeId])
REFERENCES [dbo].[HammerTypes] ([TypeId])
GO
ALTER TABLE [dbo].[Hammers] CHECK CONSTRAINT [FK_Hammers_HammerTypes]
GO
/****** Object:  StoredProcedure [dbo].[DeleteHammer]    Script Date: 8/4/2016 12:07:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[DeleteHammer] 
(
	@HammerId INT
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Delete FROM dbo.Hammers where HammerId=@HammerId
END

GO
/****** Object:  StoredProcedure [dbo].[DeleteHammerType]    Script Date: 8/4/2016 12:07:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[DeleteHammerType] 
(
	@TypeId INT
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Delete FROM dbo.HammerTypes where TypeId=@TypeId
END

GO
/****** Object:  StoredProcedure [dbo].[GetHammers]    Script Date: 8/4/2016 12:07:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetHammers] 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SELECT HammerId,HammerName,HammerDescription,HM.TypeId,HT.TypeName 
	FROM dbo.Hammers HM 
	INNER JOIN dbo.HammerTypes HT ON HT.TypeId=HM.TypeId	
END

GO
/****** Object:  StoredProcedure [dbo].[InsertUpdateHammer]    Script Date: 8/4/2016 12:07:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[InsertUpdateHammer] 
(
	@HammerId INT,
	@Name VARCHAR(500),
	@Desc VARCHAR(1000),
	@TypeId INT,
	@CreatedBy VARCHAR(500)
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	IF(@HammerId <> 0)
	BEGIN
		--Update
		IF EXISTS(SELECT * FROM Hammers WHERE HammerName=@Name AND HammerId != @HammerId)
			SELECT 'Duplicate Hammer'
		ELSE
		BEGIN		
			UPDATE Hammers SET HammerName=@Name,HammerDescription=@Desc,TypeId =@TypeId ,ModifiedBy=@CreatedBy,ModifiedDate=GETDATE()
			WHERE HammerId = @HammerId
			
			SELECT 'Success'	
		END
	END
	ELSE
	BEGIN
		--Insert
		IF EXISTS(SELECT * FROM Hammers WHERE HammerName=@Name)
			SELECT 'Duplicate Hammer'
		ELSE
		BEGIN
			INSERT INTO Hammers (HammerName,HammerDescription,IsActive,TypeId,CreatedBy,CreatedDate)
			VALUES(@Name,@Desc,1,@TypeId,@CreatedBy,GETDATE())
			
			SELECT 'Success'	
		END
	END
END

GO
/****** Object:  StoredProcedure [dbo].[InsertUpdateHammerType]    Script Date: 8/4/2016 12:07:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[InsertUpdateHammerType] 
(
	@TypeId INT,
	@TypeName VARCHAR(500),
	@TypeDesc VARCHAR(1000),
	@CreatedBy VARCHAR(500)
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	IF(@TypeId <> 0)
	BEGIN
		--Update
		IF EXISTS(SELECT * FROM HammerTypes WHERE TypeName=@TypeName AND TypeId != @TypeId)
			SELECT 'Duplicate Category'
		ELSE
		BEGIN		
			UPDATE HammerTypes SET TypeName=@TypeName,TypeDesc=@TypeDesc,ModifiedBy=@CreatedBy,ModifiedDate=GETDATE()
			WHERE TypeId = @TypeId
			
			SELECT 'Success'	
		END
	END
	ELSE
	BEGIN
		--Insert
		IF EXISTS(SELECT * FROM HammerTypes WHERE TypeName=@TypeName)
			SELECT 'Duplicate Category'
		ELSE
		BEGIN
			INSERT INTO HammerTypes (TypeName,TypeDesc,IsActive,CreatedBy,CreatedDate)
			VALUES(@TypeName,@TypeDesc,1,@CreatedBy,GETDATE())
			
			SELECT 'Success'	
		END
	END
END

GO
USE [master]
GO
ALTER DATABASE [HammerDB] SET  READ_WRITE 
GO
