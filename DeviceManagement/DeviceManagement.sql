USE [master]
GO
/****** Object:  Database [DeviceManagement]    Script Date: 1/9/2021 11:11:55 AM ******/
CREATE DATABASE [DeviceManagement]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'EquipmentManagement', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\EquipmentManagement.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'EquipmentManagement_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\EquipmentManagement_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [DeviceManagement] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DeviceManagement].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DeviceManagement] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DeviceManagement] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DeviceManagement] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DeviceManagement] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DeviceManagement] SET ARITHABORT OFF 
GO
ALTER DATABASE [DeviceManagement] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DeviceManagement] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DeviceManagement] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DeviceManagement] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DeviceManagement] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DeviceManagement] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DeviceManagement] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DeviceManagement] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DeviceManagement] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DeviceManagement] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DeviceManagement] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DeviceManagement] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DeviceManagement] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DeviceManagement] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DeviceManagement] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DeviceManagement] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DeviceManagement] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DeviceManagement] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DeviceManagement] SET  MULTI_USER 
GO
ALTER DATABASE [DeviceManagement] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DeviceManagement] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DeviceManagement] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DeviceManagement] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [DeviceManagement] SET DELAYED_DURABILITY = DISABLED 
GO
USE [DeviceManagement]
GO
/****** Object:  Table [dbo].[device_histories_room]    Script Date: 1/9/2021 11:11:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[device_histories_room](
	[HistoryID] [int] IDENTITY(1,1) NOT NULL,
	[DeviceID] [int] NOT NULL,
	[CurrentRoomID] [int] NOT NULL,
	[StartTime] [datetime] NOT NULL,
	[EndTime] [datetime] NULL,
	[PastRoomID] [int] NULL,
	[UserMoveID] [int] NULL,
	[MoveReason] [varchar](50) NULL,
	[MoveTime] [datetime] NULL,
 CONSTRAINT [PK_device_histories_room] PRIMARY KEY CLUSTERED 
(
	[HistoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[devices]    Script Date: 1/9/2021 11:11:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[devices](
	[DeviceID] [int] IDENTITY(1,1) NOT NULL,
	[DeviceName] [varchar](50) NOT NULL,
	[DeviceDescription] [varchar](50) NOT NULL,
	[DeviceType] [varchar](50) NOT NULL,
	[DeviceState] [varchar](50) NOT NULL,
	[DeviceImage] [varchar](255) NOT NULL,
	[BuyDate] [date] NOT NULL,
	[GuaranteeDuration] [date] NOT NULL,
 CONSTRAINT [PK_devices] PRIMARY KEY CLUSTERED 
(
	[DeviceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[repairs]    Script Date: 1/9/2021 11:11:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[repairs](
	[RepairID] [int] IDENTITY(1,1) NOT NULL,
	[DeviceID] [int] NOT NULL,
	[UserRequestID] [int] NOT NULL,
	[RequestDescription] [varchar](50) NOT NULL,
	[RequestTime] [datetime] NOT NULL,
	[UserRepairID] [int] NULL,
	[RepairDescription] [varchar](50) NULL,
	[RepairStartTime] [datetime] NULL,
	[RepairEndTime] [datetime] NULL,
	[RepairResult] [varchar](50) NULL,
	[Canceled] [bit] NOT NULL CONSTRAINT [DF_repairs_Canceled]  DEFAULT ((0)),
 CONSTRAINT [PK_repairs] PRIMARY KEY CLUSTERED 
(
	[RepairID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[roles]    Script Date: 1/9/2021 11:11:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[roles](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_roles] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[rooms]    Script Date: 1/9/2021 11:11:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[rooms](
	[RoomID] [int] NOT NULL,
	[RoomName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_rooms] PRIMARY KEY CLUSTERED 
(
	[RoomID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[updates]    Script Date: 1/9/2021 11:11:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[updates](
	[UpdateID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[UpdateTime] [datetime] NOT NULL,
	[UpdateContent] [varchar](50) NOT NULL,
 CONSTRAINT [PK_updates] PRIMARY KEY CLUSTERED 
(
	[UpdateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[users]    Script Date: 1/9/2021 11:11:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](50) NOT NULL,
	[UserFullname] [varchar](50) NOT NULL,
	[UserPassword] [varchar](50) NOT NULL,
	[RoleID] [int] NOT NULL,
	[RoomID] [int] NULL,
 CONSTRAINT [PK_users] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_users] UNIQUE NONCLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_roles]    Script Date: 1/9/2021 11:11:55 AM ******/
CREATE NONCLUSTERED INDEX [IX_roles] ON [dbo].[roles]
(
	[RoleName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[device_histories_room]  WITH CHECK ADD  CONSTRAINT [FK_device_histories_room_devices] FOREIGN KEY([CurrentRoomID])
REFERENCES [dbo].[rooms] ([RoomID])
GO
ALTER TABLE [dbo].[device_histories_room] CHECK CONSTRAINT [FK_device_histories_room_devices]
GO
ALTER TABLE [dbo].[device_histories_room]  WITH CHECK ADD  CONSTRAINT [FK_device_histories_room_devices1] FOREIGN KEY([DeviceID])
REFERENCES [dbo].[devices] ([DeviceID])
GO
ALTER TABLE [dbo].[device_histories_room] CHECK CONSTRAINT [FK_device_histories_room_devices1]
GO
ALTER TABLE [dbo].[device_histories_room]  WITH CHECK ADD  CONSTRAINT [FK_device_histories_room_users] FOREIGN KEY([UserMoveID])
REFERENCES [dbo].[users] ([UserID])
GO
ALTER TABLE [dbo].[device_histories_room] CHECK CONSTRAINT [FK_device_histories_room_users]
GO
ALTER TABLE [dbo].[repairs]  WITH CHECK ADD  CONSTRAINT [FK_repairs_devices] FOREIGN KEY([DeviceID])
REFERENCES [dbo].[devices] ([DeviceID])
GO
ALTER TABLE [dbo].[repairs] CHECK CONSTRAINT [FK_repairs_devices]
GO
ALTER TABLE [dbo].[repairs]  WITH CHECK ADD  CONSTRAINT [FK_repairs_users] FOREIGN KEY([UserRepairID])
REFERENCES [dbo].[users] ([UserID])
GO
ALTER TABLE [dbo].[repairs] CHECK CONSTRAINT [FK_repairs_users]
GO
ALTER TABLE [dbo].[repairs]  WITH CHECK ADD  CONSTRAINT [FK_repairs_users1] FOREIGN KEY([UserRequestID])
REFERENCES [dbo].[users] ([UserID])
GO
ALTER TABLE [dbo].[repairs] CHECK CONSTRAINT [FK_repairs_users1]
GO
ALTER TABLE [dbo].[updates]  WITH CHECK ADD  CONSTRAINT [FK_updates_users] FOREIGN KEY([UserID])
REFERENCES [dbo].[users] ([UserID])
GO
ALTER TABLE [dbo].[updates] CHECK CONSTRAINT [FK_updates_users]
GO
ALTER TABLE [dbo].[users]  WITH CHECK ADD  CONSTRAINT [FK_users_roles] FOREIGN KEY([RoleID])
REFERENCES [dbo].[roles] ([RoleID])
GO
ALTER TABLE [dbo].[users] CHECK CONSTRAINT [FK_users_roles]
GO
ALTER TABLE [dbo].[users]  WITH CHECK ADD  CONSTRAINT [FK_users_rooms] FOREIGN KEY([RoomID])
REFERENCES [dbo].[rooms] ([RoomID])
GO
ALTER TABLE [dbo].[users] CHECK CONSTRAINT [FK_users_rooms]
GO
USE [master]
GO
ALTER DATABASE [DeviceManagement] SET  READ_WRITE 
GO
