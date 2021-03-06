USE [master]
GO
/****** Object:  Database [YellowMoon]    Script Date: 01/12/2020 10:40:46 SA ******/
CREATE DATABASE [YellowMoon]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'YellowMoon', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\YellowMoon.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'YellowMoon_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\YellowMoon_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [YellowMoon] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [YellowMoon].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [YellowMoon] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [YellowMoon] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [YellowMoon] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [YellowMoon] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [YellowMoon] SET ARITHABORT OFF 
GO
ALTER DATABASE [YellowMoon] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [YellowMoon] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [YellowMoon] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [YellowMoon] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [YellowMoon] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [YellowMoon] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [YellowMoon] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [YellowMoon] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [YellowMoon] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [YellowMoon] SET  DISABLE_BROKER 
GO
ALTER DATABASE [YellowMoon] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [YellowMoon] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [YellowMoon] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [YellowMoon] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [YellowMoon] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [YellowMoon] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [YellowMoon] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [YellowMoon] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [YellowMoon] SET  MULTI_USER 
GO
ALTER DATABASE [YellowMoon] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [YellowMoon] SET DB_CHAINING OFF 
GO
ALTER DATABASE [YellowMoon] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [YellowMoon] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [YellowMoon] SET DELAYED_DURABILITY = DISABLED 
GO
USE [YellowMoon]
GO
/****** Object:  Table [dbo].[tblAccountStatus]    Script Date: 01/12/2020 10:40:46 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblAccountStatus](
	[statusId] [nvarchar](50) NOT NULL,
	[statusName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tblAccountStatus] PRIMARY KEY CLUSTERED 
(
	[statusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblCategory]    Script Date: 01/12/2020 10:40:46 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCategory](
	[categoryId] [nvarchar](50) NOT NULL,
	[categoryName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tblCategory] PRIMARY KEY CLUSTERED 
(
	[categoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblLog]    Script Date: 01/12/2020 10:40:46 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblLog](
	[logId] [nvarchar](50) NOT NULL,
	[userId] [nvarchar](50) NOT NULL,
	[productId] [nvarchar](50) NOT NULL,
	[date] [datetime] NOT NULL,
 CONSTRAINT [PK_tblLog] PRIMARY KEY CLUSTERED 
(
	[logId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblOrder]    Script Date: 01/12/2020 10:40:46 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrder](
	[orderId] [nvarchar](50) NOT NULL,
	[userId] [nvarchar](50) NOT NULL,
	[total] [nvarchar](50) NOT NULL,
	[date] [datetime] NOT NULL,
	[address] [nvarchar](50) NULL,
	[paymentId] [nvarchar](50) NOT NULL,
	[phone] [nvarchar](50) NULL,
	[name] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblOrder] PRIMARY KEY CLUSTERED 
(
	[orderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblOrderDetail]    Script Date: 01/12/2020 10:40:46 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrderDetail](
	[detailId] [nvarchar](50) NOT NULL,
	[orderId] [nvarchar](50) NOT NULL,
	[productId] [nvarchar](50) NOT NULL,
	[quantity] [int] NOT NULL,
	[price] [real] NOT NULL,
 CONSTRAINT [PK_tblOrderDetail] PRIMARY KEY CLUSTERED 
(
	[detailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblPayment]    Script Date: 01/12/2020 10:40:46 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPayment](
	[paymentId] [nvarchar](50) NOT NULL,
	[paymentName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tblPayment] PRIMARY KEY CLUSTERED 
(
	[paymentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblProduct]    Script Date: 01/12/2020 10:40:46 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProduct](
	[productId] [nvarchar](50) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[price] [real] NOT NULL,
	[quantity] [int] NOT NULL,
	[categoryId] [nvarchar](50) NOT NULL,
	[statusId] [nvarchar](50) NOT NULL,
	[image] [nvarchar](100) NULL,
	[createDate] [date] NOT NULL,
	[expiredDate] [date] NOT NULL,
 CONSTRAINT [PK_tblProduct] PRIMARY KEY CLUSTERED 
(
	[productId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblProductStatus]    Script Date: 01/12/2020 10:40:46 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProductStatus](
	[statusId] [nvarchar](50) NOT NULL,
	[statusName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tblProductStatus] PRIMARY KEY CLUSTERED 
(
	[statusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblRole]    Script Date: 01/12/2020 10:40:46 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRole](
	[roleId] [nvarchar](50) NOT NULL,
	[roleName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Table_1] PRIMARY KEY CLUSTERED 
(
	[roleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblUser]    Script Date: 01/12/2020 10:40:46 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUser](
	[userId] [nvarchar](50) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[password] [nvarchar](100) NOT NULL,
	[statusId] [nvarchar](50) NOT NULL,
	[roleId] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tblUser] PRIMARY KEY CLUSTERED 
(
	[userId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[tblAccountStatus] ([statusId], [statusName]) VALUES (N'1', N'Active')
INSERT [dbo].[tblAccountStatus] ([statusId], [statusName]) VALUES (N'2', N'Deactive')
INSERT [dbo].[tblAccountStatus] ([statusId], [statusName]) VALUES (N'3', N'Other')
INSERT [dbo].[tblCategory] ([categoryId], [categoryName]) VALUES (N'S', N'Special   ')
INSERT [dbo].[tblCategory] ([categoryId], [categoryName]) VALUES (N'T', N'Traditional')
INSERT [dbo].[tblLog] ([logId], [userId], [productId], [date]) VALUES (N'1', N'admin', N'T02', CAST(N'2020-10-18 09:53:58.083' AS DateTime))
INSERT [dbo].[tblLog] ([logId], [userId], [productId], [date]) VALUES (N'2', N'admin', N'S05', CAST(N'2020-10-18 10:23:02.957' AS DateTime))
INSERT [dbo].[tblLog] ([logId], [userId], [productId], [date]) VALUES (N'3', N'admin', N'S01', CAST(N'2020-10-18 16:30:32.190' AS DateTime))
INSERT [dbo].[tblLog] ([logId], [userId], [productId], [date]) VALUES (N'4', N'admin', N'S01', CAST(N'2020-10-18 16:30:45.630' AS DateTime))
INSERT [dbo].[tblLog] ([logId], [userId], [productId], [date]) VALUES (N'5', N'admin', N'S01', CAST(N'2020-10-18 16:31:29.617' AS DateTime))
INSERT [dbo].[tblLog] ([logId], [userId], [productId], [date]) VALUES (N'6', N'admin', N'S10', CAST(N'2020-10-22 13:32:18.290' AS DateTime))
INSERT [dbo].[tblOrder] ([orderId], [userId], [total], [date], [address], [paymentId], [phone], [name]) VALUES (N'110F59E4-43FA-4090-86E3-17AC54F476D2', N'volumet', N'30000', CAST(N'2020-10-13 13:39:25.517' AS DateTime), NULL, N'1', NULL, NULL)
INSERT [dbo].[tblOrder] ([orderId], [userId], [total], [date], [address], [paymentId], [phone], [name]) VALUES (N'556263CD-0A84-41A9-BB48-A6E3BB857106', N'guest', N'20000', CAST(N'2020-10-18 09:40:12.283' AS DateTime), N'Tam Hòa', N'1', N'0918795337', N'Châu')
INSERT [dbo].[tblOrder] ([orderId], [userId], [total], [date], [address], [paymentId], [phone], [name]) VALUES (N'6A89381D-C3E6-4830-980C-D41145F228CF', N'guest', N'55000', CAST(N'2020-10-13 00:25:17.870' AS DateTime), N'Bien Hoa', N'1', N'0917477421', N'HeHe')
INSERT [dbo].[tblOrder] ([orderId], [userId], [total], [date], [address], [paymentId], [phone], [name]) VALUES (N'72E73B6A-98AC-489A-B936-D77027AFF834', N'guest', N'20000', CAST(N'2020-10-18 10:15:27.727' AS DateTime), N'migitoga', N'1', N'0917477421', N'ME')
INSERT [dbo].[tblOrder] ([orderId], [userId], [total], [date], [address], [paymentId], [phone], [name]) VALUES (N'8E619BB8-F268-4634-AB70-4EF3E231B25E', N'guest', N'50000', CAST(N'2020-10-13 00:26:22.250' AS DateTime), N'HCMC', N'1', N'0102030405', N'Volumet')
INSERT [dbo].[tblOrder] ([orderId], [userId], [total], [date], [address], [paymentId], [phone], [name]) VALUES (N'A21A90E1-B82D-48C0-96CD-FE2564E71EE1', N'guest', N'55000', CAST(N'2020-10-12 20:25:57.913' AS DateTime), N'Bien Hoa', N'1', N'0917477421', N'Volumet')
INSERT [dbo].[tblOrder] ([orderId], [userId], [total], [date], [address], [paymentId], [phone], [name]) VALUES (N'A405881F-33B2-4B64-9BAC-942319DFCE7D', N'guest', N'25000', CAST(N'2020-10-18 09:47:12.950' AS DateTime), N'aaa', N'1', N'1111111111', N'qq')
INSERT [dbo].[tblOrder] ([orderId], [userId], [total], [date], [address], [paymentId], [phone], [name]) VALUES (N'DA073B18-B22D-4D9E-9957-13ADB2B20FEF', N'guest', N'20000', CAST(N'2020-10-18 09:44:46.753' AS DateTime), N'Tam Hòa', N'1', N'0918795337', N'o')
INSERT [dbo].[tblOrder] ([orderId], [userId], [total], [date], [address], [paymentId], [phone], [name]) VALUES (N'DDCD36FA-7231-4DFA-A3B1-553DFFDEA3CC', N'volumet', N'20000', CAST(N'2020-10-22 13:29:04.687' AS DateTime), NULL, N'1', NULL, NULL)
INSERT [dbo].[tblOrder] ([orderId], [userId], [total], [date], [address], [paymentId], [phone], [name]) VALUES (N'FF8F4E17-0F38-47FD-9B36-F904D0DB0DAC', N'volumet', N'135000', CAST(N'2020-10-16 21:52:17.770' AS DateTime), NULL, N'1', NULL, NULL)
INSERT [dbo].[tblOrderDetail] ([detailId], [orderId], [productId], [quantity], [price]) VALUES (N'0B02FF3C-E422-4995-9987-6DE1227C7332', N'72E73B6A-98AC-489A-B936-D77027AFF834', N'S04', 1, 20000)
INSERT [dbo].[tblOrderDetail] ([detailId], [orderId], [productId], [quantity], [price]) VALUES (N'1C433FCC-2AE8-42B5-A486-02A71A275E15', N'556263CD-0A84-41A9-BB48-A6E3BB857106', N'S04', 1, 20000)
INSERT [dbo].[tblOrderDetail] ([detailId], [orderId], [productId], [quantity], [price]) VALUES (N'2B5802EA-E2CA-4452-A33D-F19F9BA4FC28', N'DA073B18-B22D-4D9E-9957-13ADB2B20FEF', N'S04', 1, 20000)
INSERT [dbo].[tblOrderDetail] ([detailId], [orderId], [productId], [quantity], [price]) VALUES (N'4E3886F4-AE5F-45B7-99A7-7B5CC4157535', N'DDCD36FA-7231-4DFA-A3B1-553DFFDEA3CC', N'S04', 1, 20000)
INSERT [dbo].[tblOrderDetail] ([detailId], [orderId], [productId], [quantity], [price]) VALUES (N'61383352-2D17-46F9-B499-CB2473C814AE', N'6A89381D-C3E6-4830-980C-D41145F228CF', N'S01', 1, 30000)
INSERT [dbo].[tblOrderDetail] ([detailId], [orderId], [productId], [quantity], [price]) VALUES (N'6362651E-94FF-442C-A2A1-28A4BB9D4D99', N'A21A90E1-B82D-48C0-96CD-FE2564E71EE1', N'T01', 1, 25000)
INSERT [dbo].[tblOrderDetail] ([detailId], [orderId], [productId], [quantity], [price]) VALUES (N'66DB02A8-3E1F-4DCB-A137-E94BC7922D66', N'FF8F4E17-0F38-47FD-9B36-F904D0DB0DAC', N'S02', 3, 15000)
INSERT [dbo].[tblOrderDetail] ([detailId], [orderId], [productId], [quantity], [price]) VALUES (N'6EA32869-EDC1-4547-9905-4E41A4F85458', N'110F59E4-43FA-4090-86E3-17AC54F476D2', N'S02', 2, 15000)
INSERT [dbo].[tblOrderDetail] ([detailId], [orderId], [productId], [quantity], [price]) VALUES (N'AA8D5182-96BB-4A16-81C8-4B441E5824E0', N'A405881F-33B2-4B64-9BAC-942319DFCE7D', N'T04', 1, 25000)
INSERT [dbo].[tblOrderDetail] ([detailId], [orderId], [productId], [quantity], [price]) VALUES (N'B352A57F-2CDC-449B-8520-EF118D2A4AFE', N'A21A90E1-B82D-48C0-96CD-FE2564E71EE1', N'S01', 1, 30000)
INSERT [dbo].[tblOrderDetail] ([detailId], [orderId], [productId], [quantity], [price]) VALUES (N'B5D183FB-7499-4DC7-9EA4-4B05D10B075D', N'8E619BB8-F268-4634-AB70-4EF3E231B25E', N'T03', 1, 50000)
INSERT [dbo].[tblOrderDetail] ([detailId], [orderId], [productId], [quantity], [price]) VALUES (N'C51A6B5C-37AB-45C4-ACEF-D7BAE6DF757A', N'FF8F4E17-0F38-47FD-9B36-F904D0DB0DAC', N'S01', 3, 30000)
INSERT [dbo].[tblOrderDetail] ([detailId], [orderId], [productId], [quantity], [price]) VALUES (N'D83F3182-9E82-4697-AD25-514FEA9844E1', N'6A89381D-C3E6-4830-980C-D41145F228CF', N'T01', 1, 25000)
INSERT [dbo].[tblPayment] ([paymentId], [paymentName]) VALUES (N'1', N'COD')
INSERT [dbo].[tblPayment] ([paymentId], [paymentName]) VALUES (N'2', N'Online')
INSERT [dbo].[tblProduct] ([productId], [name], [price], [quantity], [categoryId], [statusId], [image], [createDate], [expiredDate]) VALUES (N'S01', N'two', 30000, 5, N'S', N'1', N'F:\Java\Image Folder\S012020-10-18.png', CAST(N'2020-10-07' AS Date), CAST(N'2020-11-07' AS Date))
INSERT [dbo].[tblProduct] ([productId], [name], [price], [quantity], [categoryId], [statusId], [image], [createDate], [expiredDate]) VALUES (N'S02', N'three', 15000, 5, N'S', N'1', N'F:\Java\Image Folder\S022020-10-10.png', CAST(N'2020-10-17' AS Date), CAST(N'2020-10-20' AS Date))
INSERT [dbo].[tblProduct] ([productId], [name], [price], [quantity], [categoryId], [statusId], [image], [createDate], [expiredDate]) VALUES (N'S03', N'four', 10000, 2, N'S', N'1', N'F:\Java\Image Folder\S032020-10-12.png', CAST(N'2020-10-01' AS Date), CAST(N'2020-10-13' AS Date))
INSERT [dbo].[tblProduct] ([productId], [name], [price], [quantity], [categoryId], [statusId], [image], [createDate], [expiredDate]) VALUES (N'S04', N'Meo Meo', 20000, 5, N'S', N'1', N'F:\Java\Image Folder\S042020-10-17.png', CAST(N'2020-10-09' AS Date), CAST(N'2021-01-17' AS Date))
INSERT [dbo].[tblProduct] ([productId], [name], [price], [quantity], [categoryId], [statusId], [image], [createDate], [expiredDate]) VALUES (N'S05', N'Moon Cake', 25000, 80, N'S', N'1', N'F:\Java\Image Folder\S052020-10-17.png', CAST(N'2020-10-17' AS Date), CAST(N'2021-03-31' AS Date))
INSERT [dbo].[tblProduct] ([productId], [name], [price], [quantity], [categoryId], [statusId], [image], [createDate], [expiredDate]) VALUES (N'S10', N'My Item', 10000, 10, N'S', N'1', N'F:\Java\Image Folder\S102020-10-22.png', CAST(N'2020-10-22' AS Date), CAST(N'2020-10-31' AS Date))
INSERT [dbo].[tblProduct] ([productId], [name], [price], [quantity], [categoryId], [statusId], [image], [createDate], [expiredDate]) VALUES (N'T01', N'one', 25000, 0, N'T', N'1', N'F:\Java\Image Folder\T012020-10-10.png', CAST(N'2020-10-08' AS Date), CAST(N'2020-11-08' AS Date))
INSERT [dbo].[tblProduct] ([productId], [name], [price], [quantity], [categoryId], [statusId], [image], [createDate], [expiredDate]) VALUES (N'T02', N'four', 15000, 20, N'S', N'2', N'F:\Java\Image Folder\T022020-10-10.png', CAST(N'2020-10-05' AS Date), CAST(N'2020-10-12' AS Date))
INSERT [dbo].[tblProduct] ([productId], [name], [price], [quantity], [categoryId], [statusId], [image], [createDate], [expiredDate]) VALUES (N'T03', N'five', 50000, 29, N'S', N'2', N'F:\Java\Image Folder\T032020-10-12.png', CAST(N'2020-10-02' AS Date), CAST(N'2020-10-14' AS Date))
INSERT [dbo].[tblProduct] ([productId], [name], [price], [quantity], [categoryId], [statusId], [image], [createDate], [expiredDate]) VALUES (N'T04', N'Trung Thu', 25000, 15, N'T', N'1', N'F:\Java\Image Folder\T042020-10-17.png', CAST(N'2020-10-16' AS Date), CAST(N'2020-10-31' AS Date))
INSERT [dbo].[tblProductStatus] ([statusId], [statusName]) VALUES (N'1', N'Available')
INSERT [dbo].[tblProductStatus] ([statusId], [statusName]) VALUES (N'2', N'Unavailable')
INSERT [dbo].[tblRole] ([roleId], [roleName]) VALUES (N'1', N'Admin')
INSERT [dbo].[tblRole] ([roleId], [roleName]) VALUES (N'2', N'Member')
INSERT [dbo].[tblUser] ([userId], [name], [password], [statusId], [roleId]) VALUES (N'admin', N'Admin', N'520df9c9edd7d4993bfdaacc44bb9d13ba33827ca8f53348a5a9c32d70bc6919', N'1', N'1')
INSERT [dbo].[tblUser] ([userId], [name], [password], [statusId], [roleId]) VALUES (N'guest', N'guest', N'520df9c9edd7d4993bfdaacc44bb9d13ba33827ca8f53348a5a9c32d70bc6919', N'2', N'2')
INSERT [dbo].[tblUser] ([userId], [name], [password], [statusId], [roleId]) VALUES (N'heroziber@gmail.com', N'Vinh', N'123', N'3', N'2')
INSERT [dbo].[tblUser] ([userId], [name], [password], [statusId], [roleId]) VALUES (N'volumet', N'Vinh', N'520df9c9edd7d4993bfdaacc44bb9d13ba33827ca8f53348a5a9c32d70bc6919', N'1', N'2')
INSERT [dbo].[tblUser] ([userId], [name], [password], [statusId], [roleId]) VALUES (N'volumet2', N'Vinh2', N'520df9c9edd7d4993bfdaacc44bb9d13ba33827ca8f53348a5a9c32d70bc6919', N'1', N'2')
ALTER TABLE [dbo].[tblLog]  WITH CHECK ADD  CONSTRAINT [FK_tblLog_tblProduct] FOREIGN KEY([productId])
REFERENCES [dbo].[tblProduct] ([productId])
GO
ALTER TABLE [dbo].[tblLog] CHECK CONSTRAINT [FK_tblLog_tblProduct]
GO
ALTER TABLE [dbo].[tblLog]  WITH CHECK ADD  CONSTRAINT [FK_tblLog_tblUser] FOREIGN KEY([userId])
REFERENCES [dbo].[tblUser] ([userId])
GO
ALTER TABLE [dbo].[tblLog] CHECK CONSTRAINT [FK_tblLog_tblUser]
GO
ALTER TABLE [dbo].[tblOrder]  WITH CHECK ADD  CONSTRAINT [FK_tblOrder_tblPayment] FOREIGN KEY([paymentId])
REFERENCES [dbo].[tblPayment] ([paymentId])
GO
ALTER TABLE [dbo].[tblOrder] CHECK CONSTRAINT [FK_tblOrder_tblPayment]
GO
ALTER TABLE [dbo].[tblOrder]  WITH CHECK ADD  CONSTRAINT [FK_tblOrder_tblUser] FOREIGN KEY([userId])
REFERENCES [dbo].[tblUser] ([userId])
GO
ALTER TABLE [dbo].[tblOrder] CHECK CONSTRAINT [FK_tblOrder_tblUser]
GO
ALTER TABLE [dbo].[tblOrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_tblOrderDetail_tblOrder] FOREIGN KEY([orderId])
REFERENCES [dbo].[tblOrder] ([orderId])
GO
ALTER TABLE [dbo].[tblOrderDetail] CHECK CONSTRAINT [FK_tblOrderDetail_tblOrder]
GO
ALTER TABLE [dbo].[tblOrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_tblOrderDetail_tblProduct] FOREIGN KEY([productId])
REFERENCES [dbo].[tblProduct] ([productId])
GO
ALTER TABLE [dbo].[tblOrderDetail] CHECK CONSTRAINT [FK_tblOrderDetail_tblProduct]
GO
ALTER TABLE [dbo].[tblProduct]  WITH CHECK ADD  CONSTRAINT [FK_tblProduct_tblCategory] FOREIGN KEY([categoryId])
REFERENCES [dbo].[tblCategory] ([categoryId])
GO
ALTER TABLE [dbo].[tblProduct] CHECK CONSTRAINT [FK_tblProduct_tblCategory]
GO
ALTER TABLE [dbo].[tblProduct]  WITH CHECK ADD  CONSTRAINT [FK_tblProduct_tblProductStatus] FOREIGN KEY([statusId])
REFERENCES [dbo].[tblProductStatus] ([statusId])
GO
ALTER TABLE [dbo].[tblProduct] CHECK CONSTRAINT [FK_tblProduct_tblProductStatus]
GO
ALTER TABLE [dbo].[tblUser]  WITH CHECK ADD  CONSTRAINT [FK_tblUser_tblAccountStatus] FOREIGN KEY([statusId])
REFERENCES [dbo].[tblAccountStatus] ([statusId])
GO
ALTER TABLE [dbo].[tblUser] CHECK CONSTRAINT [FK_tblUser_tblAccountStatus]
GO
ALTER TABLE [dbo].[tblUser]  WITH CHECK ADD  CONSTRAINT [FK_tblUser_tblRole] FOREIGN KEY([roleId])
REFERENCES [dbo].[tblRole] ([roleId])
GO
ALTER TABLE [dbo].[tblUser] CHECK CONSTRAINT [FK_tblUser_tblRole]
GO
USE [master]
GO
ALTER DATABASE [YellowMoon] SET  READ_WRITE 
GO
