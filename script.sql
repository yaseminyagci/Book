USE [master]
GO
/****** Object:  Database [Book]    Script Date: 29.09.2020 13:51:08 ******/
CREATE DATABASE [Book]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Book', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Book.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Book_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Book_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Book] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Book].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Book] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Book] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Book] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Book] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Book] SET ARITHABORT OFF 
GO
ALTER DATABASE [Book] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Book] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Book] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Book] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Book] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Book] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Book] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Book] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Book] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Book] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Book] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Book] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Book] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Book] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Book] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Book] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [Book] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Book] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Book] SET  MULTI_USER 
GO
ALTER DATABASE [Book] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Book] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Book] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Book] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Book] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Book] SET QUERY_STORE = OFF
GO
USE [Book]
GO
/****** Object:  Schema [idt]    Script Date: 29.09.2020 13:51:08 ******/
CREATE SCHEMA [idt]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 29.09.2020 13:51:08 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Books]    Script Date: 29.09.2020 13:51:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Books](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DateCreated] [datetime2](7) NOT NULL,
	[DateModified] [datetime2](7) NULL,
	[DateDeleted] [datetime2](7) NULL,
	[Status] [tinyint] NOT NULL,
	[Title] [nvarchar](128) NOT NULL,
	[Content] [nvarchar](max) NOT NULL,
	[Image] [nvarchar](512) NULL,
	[UserId] [nvarchar](128) NULL,
	[Author] [nvarchar](128) NOT NULL,
	[Language] [nvarchar](128) NOT NULL,
	[Publish] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_Books] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comments]    Script Date: 29.09.2020 13:51:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comments](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DateCreated] [datetime2](7) NOT NULL,
	[DateModified] [datetime2](7) NULL,
	[DateDeleted] [datetime2](7) NULL,
	[Status] [tinyint] NOT NULL,
	[Content] [nvarchar](1024) NOT NULL,
	[UserId] [nvarchar](128) NULL,
	[BookId] [int] NOT NULL,
 CONSTRAINT [PK_Comments] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Likes]    Script Date: 29.09.2020 13:51:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Likes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DateCreated] [datetime2](7) NOT NULL,
	[DateModified] [datetime2](7) NULL,
	[DateDeleted] [datetime2](7) NULL,
	[Status] [tinyint] NOT NULL,
	[Liked] [bit] NOT NULL,
	[UserId] [nvarchar](128) NULL,
	[BookId] [int] NOT NULL,
 CONSTRAINT [PK_Likes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TagBooks]    Script Date: 29.09.2020 13:51:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TagBooks](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DateCreated] [datetime2](7) NOT NULL,
	[DateModified] [datetime2](7) NULL,
	[DateDeleted] [datetime2](7) NULL,
	[Status] [tinyint] NOT NULL,
	[TagId] [int] NOT NULL,
	[BookId] [int] NOT NULL,
	[Selected] [tinyint] NOT NULL,
 CONSTRAINT [PK_TagBooks] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tags]    Script Date: 29.09.2020 13:51:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tags](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DateCreated] [datetime2](7) NOT NULL,
	[DateModified] [datetime2](7) NULL,
	[DateDeleted] [datetime2](7) NULL,
	[Status] [tinyint] NOT NULL,
	[TagName] [nvarchar](512) NOT NULL,
 CONSTRAINT [PK_Tags] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserDetail]    Script Date: 29.09.2020 13:51:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserDetail](
	[UserId] [nvarchar](128) NOT NULL,
	[DateCreated] [datetime2](7) NOT NULL,
	[DateModified] [datetime2](7) NULL,
	[DateDeleted] [datetime2](7) NULL,
	[Status] [tinyint] NOT NULL,
	[UserTypeId] [int] NOT NULL,
	[FullName] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_UserDetail] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserTypes]    Script Date: 29.09.2020 13:51:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DateCreated] [datetime2](7) NOT NULL,
	[DateModified] [datetime2](7) NULL,
	[DateDeleted] [datetime2](7) NULL,
	[Status] [tinyint] NOT NULL,
	[Type] [nvarchar](512) NOT NULL,
 CONSTRAINT [PK_UserTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [idt].[PermissionCategories]    Script Date: 29.09.2020 13:51:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [idt].[PermissionCategories](
	[Label] [varchar](256) NOT NULL,
	[DateCreated] [datetime2](7) NOT NULL,
	[DateModified] [datetime2](7) NULL,
	[DateDeleted] [datetime2](7) NULL,
	[Status] [tinyint] NOT NULL,
	[VisibleLabel] [varchar](256) NULL,
	[Description] [varchar](512) NULL,
 CONSTRAINT [PK_PermissionCategories] PRIMARY KEY CLUSTERED 
(
	[Label] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [idt].[PermissionCategoryPermissions]    Script Date: 29.09.2020 13:51:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [idt].[PermissionCategoryPermissions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DateCreated] [datetime2](7) NOT NULL,
	[DateModified] [datetime2](7) NULL,
	[DateDeleted] [datetime2](7) NULL,
	[Status] [tinyint] NOT NULL,
	[CategoryId] [varchar](256) NULL,
	[PermissionId] [varchar](256) NULL,
	[Description] [nvarchar](512) NULL,
 CONSTRAINT [PK_PermissionCategoryPermissions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [idt].[Permissions]    Script Date: 29.09.2020 13:51:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [idt].[Permissions](
	[Label] [varchar](256) NOT NULL,
	[DateCreated] [datetime2](7) NOT NULL,
	[DateModified] [datetime2](7) NULL,
	[DateDeleted] [datetime2](7) NULL,
	[Status] [tinyint] NOT NULL,
	[VisibleLabel] [varchar](256) NULL,
	[Description] [varchar](512) NULL,
 CONSTRAINT [PK_Permissions] PRIMARY KEY CLUSTERED 
(
	[Label] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [idt].[RoleClaims]    Script Date: 29.09.2020 13:51:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [idt].[RoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_RoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [idt].[RolePermissionCategories]    Script Date: 29.09.2020 13:51:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [idt].[RolePermissionCategories](
	[PermissionCategoryPermissionId] [int] NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
	[DateCreated] [datetime2](7) NOT NULL,
	[DateModified] [datetime2](7) NULL,
	[DateDeleted] [datetime2](7) NULL,
	[Status] [tinyint] NOT NULL,
 CONSTRAINT [PK_RolePermissionCategories] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC,
	[PermissionCategoryPermissionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [idt].[Roles]    Script Date: 29.09.2020 13:51:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [idt].[Roles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[Description] [nvarchar](1024) NULL,
	[IsEditable] [bit] NOT NULL,
	[DateCreated] [datetime2](7) NOT NULL,
	[DateModified] [datetime2](7) NULL,
	[DateDeleted] [datetime2](7) NULL,
	[Status] [tinyint] NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [idt].[UserClaims]    Script Date: 29.09.2020 13:51:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [idt].[UserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_UserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [idt].[UserLogins]    Script Date: 29.09.2020 13:51:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [idt].[UserLogins](
	[LoginProvider] [nvarchar](450) NOT NULL,
	[ProviderKey] [nvarchar](450) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_UserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [idt].[UserPermissions]    Script Date: 29.09.2020 13:51:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [idt].[UserPermissions](
	[UserId] [nvarchar](128) NOT NULL,
	[PermissionId] [varchar](256) NOT NULL,
	[DateCreated] [datetime2](7) NOT NULL,
	[DateModified] [datetime2](7) NULL,
	[DateDeleted] [datetime2](7) NULL,
	[Status] [tinyint] NOT NULL,
 CONSTRAINT [PK_UserPermissions] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[PermissionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [idt].[UserRoles]    Script Date: 29.09.2020 13:51:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [idt].[UserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
	[DateCreated] [datetime2](7) NOT NULL,
	[DateModified] [datetime2](7) NULL,
	[DateDeleted] [datetime2](7) NULL,
	[Status] [tinyint] NOT NULL,
 CONSTRAINT [PK_UserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [idt].[Users]    Script Date: 29.09.2020 13:51:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [idt].[Users](
	[Id] [nvarchar](128) NOT NULL,
	[UserName] [nvarchar](30) NOT NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[IsEditable] [bit] NOT NULL,
	[DateCreated] [datetime2](7) NOT NULL,
	[DateModified] [datetime2](7) NULL,
	[DateDeleted] [datetime2](7) NULL,
	[Status] [tinyint] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [idt].[UserTokens]    Script Date: 29.09.2020 13:51:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [idt].[UserTokens](
	[UserId] [nvarchar](128) NOT NULL,
	[LoginProvider] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_UserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200810123258_migf', N'3.1.4')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200811124936_miggy', N'3.1.4')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200812145109_meggy', N'3.1.4')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200817141450_migg', N'3.1.4')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200817141736_miggc', N'3.1.4')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200817142311_miggcds', N'3.1.4')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200928131553_initial', N'3.1.4')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200928132321_initial', N'3.1.4')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200928132636_miggy', N'3.1.4')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200928140131_migg', N'3.1.4')
SET IDENTITY_INSERT [dbo].[Books] ON 

INSERT [dbo].[Books] ([Id], [DateCreated], [DateModified], [DateDeleted], [Status], [Title], [Content], [Image], [UserId], [Author], [Language], [Publish]) VALUES (1, CAST(N'2020-09-29T08:53:49.6267315' AS DateTime2), NULL, NULL, 1, N'secret garden', N'<p>yeni yine yeniden</p>', NULL, N'18960fce-3045-4266-a811-c5e27a4f00c0', N'emma phillips', N'english', N'london publish home')
INSERT [dbo].[Books] ([Id], [DateCreated], [DateModified], [DateDeleted], [Status], [Title], [Content], [Image], [UserId], [Author], [Language], [Publish]) VALUES (2, CAST(N'2020-09-29T09:04:35.9388116' AS DateTime2), CAST(N'2020-09-29T09:11:33.1044668' AS DateTime2), NULL, 1, N'life is goodfff', N'<p>denmefffff</p>', NULL, NULL, N'henry tomffffff', N'englisfffffff', N'london publish homeffffff')
INSERT [dbo].[Books] ([Id], [DateCreated], [DateModified], [DateDeleted], [Status], [Title], [Content], [Image], [UserId], [Author], [Language], [Publish]) VALUES (3, CAST(N'2020-09-29T12:17:08.2672096' AS DateTime2), NULL, NULL, 1, N'deneme', N'<p><img src="data:image/gif;base64,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" data-filename="giphy.gif" style="width: 375px;"><br></p>', NULL, N'18960fce-3045-4266-a811-c5e27a4f00c0', N'den', N'eng', N'fvsd')
SET IDENTITY_INSERT [dbo].[Books] OFF
SET IDENTITY_INSERT [dbo].[Comments] ON 

INSERT [dbo].[Comments] ([Id], [DateCreated], [DateModified], [DateDeleted], [Status], [Content], [UserId], [BookId]) VALUES (1, CAST(N'2020-09-29T09:38:54.0877246' AS DateTime2), CAST(N'2020-09-29T11:04:15.2487722' AS DateTime2), NULL, 3, N'harika bir yazı', N'b444ec00-20a1-433a-addf-5d7c9725cbea', 1)
INSERT [dbo].[Comments] ([Id], [DateCreated], [DateModified], [DateDeleted], [Status], [Content], [UserId], [BookId]) VALUES (2, CAST(N'2020-09-29T11:04:34.0158702' AS DateTime2), NULL, NULL, 1, N'harika bir yazııııı', N'18960fce-3045-4266-a811-c5e27a4f00c0', 1)
INSERT [dbo].[Comments] ([Id], [DateCreated], [DateModified], [DateDeleted], [Status], [Content], [UserId], [BookId]) VALUES (3, CAST(N'2020-09-29T11:08:59.3985571' AS DateTime2), NULL, NULL, 1, N'harrika', N'18960fce-3045-4266-a811-c5e27a4f00c0', 1)
SET IDENTITY_INSERT [dbo].[Comments] OFF
SET IDENTITY_INSERT [dbo].[Likes] ON 

INSERT [dbo].[Likes] ([Id], [DateCreated], [DateModified], [DateDeleted], [Status], [Liked], [UserId], [BookId]) VALUES (1, CAST(N'2020-09-29T09:39:04.2607451' AS DateTime2), CAST(N'2020-09-29T09:39:13.1323265' AS DateTime2), NULL, 1, 1, N'b444ec00-20a1-433a-addf-5d7c9725cbea', 1)
INSERT [dbo].[Likes] ([Id], [DateCreated], [DateModified], [DateDeleted], [Status], [Liked], [UserId], [BookId]) VALUES (2, CAST(N'2020-09-29T10:56:40.8153023' AS DateTime2), NULL, NULL, 1, 1, N'b444ec00-20a1-433a-addf-5d7c9725cbea', 2)
SET IDENTITY_INSERT [dbo].[Likes] OFF
SET IDENTITY_INSERT [dbo].[TagBooks] ON 

INSERT [dbo].[TagBooks] ([Id], [DateCreated], [DateModified], [DateDeleted], [Status], [TagId], [BookId], [Selected]) VALUES (5, CAST(N'2020-09-29T09:11:33.1044230' AS DateTime2), NULL, NULL, 1, 1, 2, 0)
INSERT [dbo].[TagBooks] ([Id], [DateCreated], [DateModified], [DateDeleted], [Status], [TagId], [BookId], [Selected]) VALUES (6, CAST(N'2020-09-29T09:11:33.1044635' AS DateTime2), NULL, NULL, 1, 2, 2, 0)
INSERT [dbo].[TagBooks] ([Id], [DateCreated], [DateModified], [DateDeleted], [Status], [TagId], [BookId], [Selected]) VALUES (7, CAST(N'2020-09-29T12:17:08.4318999' AS DateTime2), NULL, NULL, 1, 1, 3, 0)
INSERT [dbo].[TagBooks] ([Id], [DateCreated], [DateModified], [DateDeleted], [Status], [TagId], [BookId], [Selected]) VALUES (8, CAST(N'2020-09-29T12:17:08.4322409' AS DateTime2), NULL, NULL, 1, 2, 3, 0)
SET IDENTITY_INSERT [dbo].[TagBooks] OFF
SET IDENTITY_INSERT [dbo].[Tags] ON 

INSERT [dbo].[Tags] ([Id], [DateCreated], [DateModified], [DateDeleted], [Status], [TagName]) VALUES (1, CAST(N'2020-09-29T08:50:13.4726292' AS DateTime2), CAST(N'2020-09-29T08:50:41.5175911' AS DateTime2), NULL, 1, N'Romance')
INSERT [dbo].[Tags] ([Id], [DateCreated], [DateModified], [DateDeleted], [Status], [TagName]) VALUES (2, CAST(N'2020-09-29T08:50:22.6039910' AS DateTime2), NULL, NULL, 1, N'Comedy')
INSERT [dbo].[Tags] ([Id], [DateCreated], [DateModified], [DateDeleted], [Status], [TagName]) VALUES (3, CAST(N'2020-09-29T08:50:33.1469259' AS DateTime2), NULL, NULL, 1, N'Fiction')
SET IDENTITY_INSERT [dbo].[Tags] OFF
INSERT [dbo].[UserDetail] ([UserId], [DateCreated], [DateModified], [DateDeleted], [Status], [UserTypeId], [FullName]) VALUES (N'18960fce-3045-4266-a811-c5e27a4f00c0', CAST(N'2020-09-28T17:47:09.6168948' AS DateTime2), NULL, NULL, 1, 5, N'admin admin')
INSERT [dbo].[UserDetail] ([UserId], [DateCreated], [DateModified], [DateDeleted], [Status], [UserTypeId], [FullName]) VALUES (N'6707d496-8a03-4de7-8641-86679bcb46bc', CAST(N'2020-09-28T17:57:25.6942032' AS DateTime2), CAST(N'2020-09-28T18:20:28.5236999' AS DateTime2), NULL, 1, 7, N'usernamesample ddd')
INSERT [dbo].[UserDetail] ([UserId], [DateCreated], [DateModified], [DateDeleted], [Status], [UserTypeId], [FullName]) VALUES (N'b444ec00-20a1-433a-addf-5d7c9725cbea', CAST(N'2020-09-29T09:35:35.9907268' AS DateTime2), NULL, NULL, 1, 6, N'guest guest')
SET IDENTITY_INSERT [dbo].[UserTypes] ON 

INSERT [dbo].[UserTypes] ([Id], [DateCreated], [DateModified], [DateDeleted], [Status], [Type]) VALUES (5, CAST(N'2020-08-12T00:00:00.0000000' AS DateTime2), NULL, NULL, 1, N'Admin')
INSERT [dbo].[UserTypes] ([Id], [DateCreated], [DateModified], [DateDeleted], [Status], [Type]) VALUES (6, CAST(N'2020-08-12T00:00:00.0000000' AS DateTime2), NULL, NULL, 1, N'Guest')
INSERT [dbo].[UserTypes] ([Id], [DateCreated], [DateModified], [DateDeleted], [Status], [Type]) VALUES (7, CAST(N'2020-08-12T00:00:00.0000000' AS DateTime2), NULL, NULL, 1, N'User')
SET IDENTITY_INSERT [dbo].[UserTypes] OFF
INSERT [idt].[Users] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [IsEditable], [DateCreated], [DateModified], [DateDeleted], [Status]) VALUES (N'18960fce-3045-4266-a811-c5e27a4f00c0', N'admin123', N'ADMIN123', N'admin@gmail.com', N'ADMIN@GMAIL.COM', 1, N'AQAAAAEAACcQAAAAEM92p1/gP+eDYcrux28G96O3RkVrHov7dYXQwnd1tgCf6R2+Wf61Q5+NbGVoazwvnQ==', N'WZCWU224VTRKS3RMLC3C5OSNEH2RIC2W', N'c5186902-033a-49ed-a1e1-fcb486cff234', NULL, 0, 0, NULL, 1, 0, 1, CAST(N'2020-09-28T17:47:09.6146200' AS DateTime2), NULL, NULL, 0)
INSERT [idt].[Users] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [IsEditable], [DateCreated], [DateModified], [DateDeleted], [Status]) VALUES (N'6707d496-8a03-4de7-8641-86679bcb46bc', N'usersample', N'USERSAMPLE', N'user@gmail.com', N'USER@GMAIL.COM', 1, N'AQAAAAEAACcQAAAAELIynoDWHqBnL1eaamK7EMhytiwFnMSoHNqRMRB4xRt4RwT+knsqwm49H3NhYRj4YA==', N'B2E3YSRHDIAQYH4C5XBPPFVVIEXKUVLO', N'0f8befb6-9da0-48eb-9021-afe8e0254027', NULL, 0, 0, NULL, 1, 0, 1, CAST(N'2020-09-28T17:57:25.6922168' AS DateTime2), CAST(N'2020-09-28T18:20:28.5219408' AS DateTime2), NULL, 0)
INSERT [idt].[Users] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [IsEditable], [DateCreated], [DateModified], [DateDeleted], [Status]) VALUES (N'b444ec00-20a1-433a-addf-5d7c9725cbea', N'guestguest', N'GUESTGUEST', N'guest@gmail.com', N'GUEST@GMAIL.COM', 1, N'AQAAAAEAACcQAAAAEMOjjXHRrO1kgLjsJ0OQD3C603IxpZHFvMV4JREPoIH0LPhau6Jdes1b9jg9sIzFlQ==', N'65C7LWNBQ6RPCAXZD2ZI4SQXWBE5NKQP', N'7b840317-1f38-4748-9ddd-e5a1c8e9d1bb', NULL, 0, 0, NULL, 1, 0, 1, CAST(N'2020-09-29T09:35:35.9906735' AS DateTime2), NULL, NULL, 0)
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Books_UserId]    Script Date: 29.09.2020 13:51:08 ******/
CREATE NONCLUSTERED INDEX [IX_Books_UserId] ON [dbo].[Books]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Comments_BookId]    Script Date: 29.09.2020 13:51:08 ******/
CREATE NONCLUSTERED INDEX [IX_Comments_BookId] ON [dbo].[Comments]
(
	[BookId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Comments_UserId]    Script Date: 29.09.2020 13:51:08 ******/
CREATE NONCLUSTERED INDEX [IX_Comments_UserId] ON [dbo].[Comments]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Likes_BookId]    Script Date: 29.09.2020 13:51:08 ******/
CREATE NONCLUSTERED INDEX [IX_Likes_BookId] ON [dbo].[Likes]
(
	[BookId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Likes_UserId]    Script Date: 29.09.2020 13:51:08 ******/
CREATE NONCLUSTERED INDEX [IX_Likes_UserId] ON [dbo].[Likes]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_TagBooks_BookId]    Script Date: 29.09.2020 13:51:08 ******/
CREATE NONCLUSTERED INDEX [IX_TagBooks_BookId] ON [dbo].[TagBooks]
(
	[BookId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_TagBooks_TagId]    Script Date: 29.09.2020 13:51:08 ******/
CREATE NONCLUSTERED INDEX [IX_TagBooks_TagId] ON [dbo].[TagBooks]
(
	[TagId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserDetail_UserTypeId]    Script Date: 29.09.2020 13:51:08 ******/
CREATE NONCLUSTERED INDEX [IX_UserDetail_UserTypeId] ON [dbo].[UserDetail]
(
	[UserTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_PermissionCategoryPermissions_CategoryId]    Script Date: 29.09.2020 13:51:08 ******/
CREATE NONCLUSTERED INDEX [IX_PermissionCategoryPermissions_CategoryId] ON [idt].[PermissionCategoryPermissions]
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_PermissionCategoryPermissions_PermissionId]    Script Date: 29.09.2020 13:51:08 ******/
CREATE NONCLUSTERED INDEX [IX_PermissionCategoryPermissions_PermissionId] ON [idt].[PermissionCategoryPermissions]
(
	[PermissionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_RoleClaims_RoleId]    Script Date: 29.09.2020 13:51:08 ******/
CREATE NONCLUSTERED INDEX [IX_RoleClaims_RoleId] ON [idt].[RoleClaims]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RolePermissionCategories_PermissionCategoryPermissionId]    Script Date: 29.09.2020 13:51:08 ******/
CREATE NONCLUSTERED INDEX [IX_RolePermissionCategories_PermissionCategoryPermissionId] ON [idt].[RolePermissionCategories]
(
	[PermissionCategoryPermissionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 29.09.2020 13:51:08 ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [idt].[Roles]
(
	[NormalizedName] ASC
)
WHERE ([NormalizedName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserClaims_UserId]    Script Date: 29.09.2020 13:51:08 ******/
CREATE NONCLUSTERED INDEX [IX_UserClaims_UserId] ON [idt].[UserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserLogins_UserId]    Script Date: 29.09.2020 13:51:08 ******/
CREATE NONCLUSTERED INDEX [IX_UserLogins_UserId] ON [idt].[UserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserPermissions_PermissionId]    Script Date: 29.09.2020 13:51:08 ******/
CREATE NONCLUSTERED INDEX [IX_UserPermissions_PermissionId] ON [idt].[UserPermissions]
(
	[PermissionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserRoles_RoleId]    Script Date: 29.09.2020 13:51:08 ******/
CREATE NONCLUSTERED INDEX [IX_UserRoles_RoleId] ON [idt].[UserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [EmailIndex]    Script Date: 29.09.2020 13:51:08 ******/
CREATE NONCLUSTERED INDEX [EmailIndex] ON [idt].[Users]
(
	[NormalizedEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 29.09.2020 13:51:08 ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [idt].[Users]
(
	[NormalizedUserName] ASC
)
WHERE ([NormalizedUserName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Books] ADD  DEFAULT (N'') FOR [Author]
GO
ALTER TABLE [dbo].[Books] ADD  DEFAULT (N'') FOR [Language]
GO
ALTER TABLE [dbo].[Books] ADD  DEFAULT (N'') FOR [Publish]
GO
ALTER TABLE [dbo].[Comments] ADD  DEFAULT ((0)) FOR [BookId]
GO
ALTER TABLE [dbo].[Likes] ADD  DEFAULT ((0)) FOR [BookId]
GO
ALTER TABLE [dbo].[Books]  WITH CHECK ADD  CONSTRAINT [FK_Books_UserDetail_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[UserDetail] ([UserId])
GO
ALTER TABLE [dbo].[Books] CHECK CONSTRAINT [FK_Books_UserDetail_UserId]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_Books_BookId] FOREIGN KEY([BookId])
REFERENCES [dbo].[Books] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_Books_BookId]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_UserDetail_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[UserDetail] ([UserId])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_UserDetail_UserId]
GO
ALTER TABLE [dbo].[Likes]  WITH CHECK ADD  CONSTRAINT [FK_Likes_Books_BookId] FOREIGN KEY([BookId])
REFERENCES [dbo].[Books] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Likes] CHECK CONSTRAINT [FK_Likes_Books_BookId]
GO
ALTER TABLE [dbo].[Likes]  WITH CHECK ADD  CONSTRAINT [FK_Likes_UserDetail_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[UserDetail] ([UserId])
GO
ALTER TABLE [dbo].[Likes] CHECK CONSTRAINT [FK_Likes_UserDetail_UserId]
GO
ALTER TABLE [dbo].[TagBooks]  WITH CHECK ADD  CONSTRAINT [FK_TagBooks_Books_BookId] FOREIGN KEY([BookId])
REFERENCES [dbo].[Books] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TagBooks] CHECK CONSTRAINT [FK_TagBooks_Books_BookId]
GO
ALTER TABLE [dbo].[TagBooks]  WITH CHECK ADD  CONSTRAINT [FK_TagBooks_Tags_TagId] FOREIGN KEY([TagId])
REFERENCES [dbo].[Tags] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TagBooks] CHECK CONSTRAINT [FK_TagBooks_Tags_TagId]
GO
ALTER TABLE [dbo].[UserDetail]  WITH CHECK ADD  CONSTRAINT [FK_UserDetail_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [idt].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserDetail] CHECK CONSTRAINT [FK_UserDetail_Users_UserId]
GO
ALTER TABLE [dbo].[UserDetail]  WITH CHECK ADD  CONSTRAINT [FK_UserDetail_UserTypes_UserTypeId] FOREIGN KEY([UserTypeId])
REFERENCES [dbo].[UserTypes] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserDetail] CHECK CONSTRAINT [FK_UserDetail_UserTypes_UserTypeId]
GO
ALTER TABLE [idt].[PermissionCategoryPermissions]  WITH CHECK ADD  CONSTRAINT [FK_PermissionCategoryPermissions_PermissionCategories_CategoryId] FOREIGN KEY([CategoryId])
REFERENCES [idt].[PermissionCategories] ([Label])
GO
ALTER TABLE [idt].[PermissionCategoryPermissions] CHECK CONSTRAINT [FK_PermissionCategoryPermissions_PermissionCategories_CategoryId]
GO
ALTER TABLE [idt].[PermissionCategoryPermissions]  WITH CHECK ADD  CONSTRAINT [FK_PermissionCategoryPermissions_Permissions_PermissionId] FOREIGN KEY([PermissionId])
REFERENCES [idt].[Permissions] ([Label])
GO
ALTER TABLE [idt].[PermissionCategoryPermissions] CHECK CONSTRAINT [FK_PermissionCategoryPermissions_Permissions_PermissionId]
GO
ALTER TABLE [idt].[RoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_RoleClaims_Roles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [idt].[Roles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [idt].[RoleClaims] CHECK CONSTRAINT [FK_RoleClaims_Roles_RoleId]
GO
ALTER TABLE [idt].[RolePermissionCategories]  WITH CHECK ADD  CONSTRAINT [FK_RolePermissionCategories_PermissionCategoryPermissions_PermissionCategoryPermissionId] FOREIGN KEY([PermissionCategoryPermissionId])
REFERENCES [idt].[PermissionCategoryPermissions] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [idt].[RolePermissionCategories] CHECK CONSTRAINT [FK_RolePermissionCategories_PermissionCategoryPermissions_PermissionCategoryPermissionId]
GO
ALTER TABLE [idt].[RolePermissionCategories]  WITH CHECK ADD  CONSTRAINT [FK_RolePermissionCategories_Roles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [idt].[Roles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [idt].[RolePermissionCategories] CHECK CONSTRAINT [FK_RolePermissionCategories_Roles_RoleId]
GO
ALTER TABLE [idt].[UserClaims]  WITH CHECK ADD  CONSTRAINT [FK_UserClaims_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [idt].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [idt].[UserClaims] CHECK CONSTRAINT [FK_UserClaims_Users_UserId]
GO
ALTER TABLE [idt].[UserLogins]  WITH CHECK ADD  CONSTRAINT [FK_UserLogins_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [idt].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [idt].[UserLogins] CHECK CONSTRAINT [FK_UserLogins_Users_UserId]
GO
ALTER TABLE [idt].[UserPermissions]  WITH CHECK ADD  CONSTRAINT [FK_UserPermissions_Permissions_PermissionId] FOREIGN KEY([PermissionId])
REFERENCES [idt].[Permissions] ([Label])
ON DELETE CASCADE
GO
ALTER TABLE [idt].[UserPermissions] CHECK CONSTRAINT [FK_UserPermissions_Permissions_PermissionId]
GO
ALTER TABLE [idt].[UserPermissions]  WITH CHECK ADD  CONSTRAINT [FK_UserPermissions_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [idt].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [idt].[UserPermissions] CHECK CONSTRAINT [FK_UserPermissions_Users_UserId]
GO
ALTER TABLE [idt].[UserRoles]  WITH CHECK ADD  CONSTRAINT [FK_UserRoles_Roles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [idt].[Roles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [idt].[UserRoles] CHECK CONSTRAINT [FK_UserRoles_Roles_RoleId]
GO
ALTER TABLE [idt].[UserRoles]  WITH CHECK ADD  CONSTRAINT [FK_UserRoles_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [idt].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [idt].[UserRoles] CHECK CONSTRAINT [FK_UserRoles_Users_UserId]
GO
ALTER TABLE [idt].[UserTokens]  WITH CHECK ADD  CONSTRAINT [FK_UserTokens_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [idt].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [idt].[UserTokens] CHECK CONSTRAINT [FK_UserTokens_Users_UserId]
GO
USE [master]
GO
ALTER DATABASE [Book] SET  READ_WRITE 
GO
