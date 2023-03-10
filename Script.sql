USE [SLMSystem]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 19-Feb-23 4:46:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Courses]    Script Date: 19-Feb-23 4:46:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Courses](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Duration] [nvarchar](max) NOT NULL,
	[Teacher] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[CreatedOn] [datetime2](7) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[UpdatedOn] [datetime2](7) NOT NULL,
	[isActive] [bit] NOT NULL,
	[UserId] [int] NULL,
	[Location] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Courses] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Leacture]    Script Date: 19-Feb-23 4:46:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Leacture](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[LectureName] [nvarchar](max) NOT NULL,
	[LectureDescription] [nvarchar](max) NOT NULL,
	[LectureURL] [nvarchar](max) NOT NULL,
	[CourseId] [int] NOT NULL,
	[CreatedOn] [datetime2](7) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[UpdatedOn] [datetime2](7) NOT NULL,
	[isActive] [bit] NOT NULL,
 CONSTRAINT [PK_Leacture] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 19-Feb-23 4:46:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Email] [nvarchar](max) NOT NULL,
	[Password] [nvarchar](100) NOT NULL,
	[DOB] [nvarchar](max) NOT NULL,
	[Gender] [nvarchar](max) NOT NULL,
	[Designation] [nvarchar](max) NOT NULL,
	[Course] [nvarchar](max) NOT NULL,
	[Address] [nvarchar](max) NOT NULL,
	[Contact] [nvarchar](max) NOT NULL,
	[RememberMe] [bit] NOT NULL,
	[CreatedOn] [datetime2](7) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[UpdatedOn] [datetime2](7) NOT NULL,
	[isActive] [bit] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Courses] ADD  DEFAULT ('0001-01-01T00:00:00.0000000') FOR [CreatedOn]
GO
ALTER TABLE [dbo].[Courses] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Courses] ADD  DEFAULT ('0001-01-01T00:00:00.0000000') FOR [UpdatedOn]
GO
ALTER TABLE [dbo].[Courses] ADD  DEFAULT (CONVERT([bit],(0))) FOR [isActive]
GO
ALTER TABLE [dbo].[Courses] ADD  DEFAULT (N'') FOR [Location]
GO
ALTER TABLE [dbo].[Leacture] ADD  DEFAULT ('0001-01-01T00:00:00.0000000') FOR [CreatedOn]
GO
ALTER TABLE [dbo].[Leacture] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Leacture] ADD  DEFAULT ('0001-01-01T00:00:00.0000000') FOR [UpdatedOn]
GO
ALTER TABLE [dbo].[Leacture] ADD  DEFAULT (CONVERT([bit],(0))) FOR [isActive]
GO
ALTER TABLE [dbo].[User] ADD  DEFAULT ('0001-01-01T00:00:00.0000000') FOR [CreatedOn]
GO
ALTER TABLE [dbo].[User] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[User] ADD  DEFAULT ('0001-01-01T00:00:00.0000000') FOR [UpdatedOn]
GO
ALTER TABLE [dbo].[User] ADD  DEFAULT (CONVERT([bit],(0))) FOR [isActive]
GO
ALTER TABLE [dbo].[Courses]  WITH CHECK ADD  CONSTRAINT [FK_Courses_User_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Courses] CHECK CONSTRAINT [FK_Courses_User_UserId]
GO
ALTER TABLE [dbo].[Leacture]  WITH CHECK ADD  CONSTRAINT [FK_Leacture_Courses_CourseId] FOREIGN KEY([CourseId])
REFERENCES [dbo].[Courses] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Leacture] CHECK CONSTRAINT [FK_Leacture_Courses_CourseId]
GO
