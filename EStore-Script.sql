USE [master]
GO
/****** Object:  Database [EShop]    Script Date: 7/17/2024 2:20:23 PM ******/
CREATE DATABASE [EShop]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'EShop', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\EShop.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'EShop_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\EShop_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [EShop] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [EShop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [EShop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [EShop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [EShop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [EShop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [EShop] SET ARITHABORT OFF 
GO
ALTER DATABASE [EShop] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [EShop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [EShop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [EShop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [EShop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [EShop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [EShop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [EShop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [EShop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [EShop] SET  DISABLE_BROKER 
GO
ALTER DATABASE [EShop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [EShop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [EShop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [EShop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [EShop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [EShop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [EShop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [EShop] SET RECOVERY FULL 
GO
ALTER DATABASE [EShop] SET  MULTI_USER 
GO
ALTER DATABASE [EShop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [EShop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [EShop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [EShop] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [EShop] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [EShop] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'EShop', N'ON'
GO
ALTER DATABASE [EShop] SET QUERY_STORE = ON
GO
ALTER DATABASE [EShop] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [EShop]
GO
/****** Object:  Table [dbo].[ActionRoles]    Script Date: 7/17/2024 2:20:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ActionRoles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [nvarchar](50) NOT NULL,
	[WebActionId] [int] NOT NULL,
 CONSTRAINT [PK_Permissions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 7/17/2024 2:20:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NameVN] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 7/17/2024 2:20:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[Id] [nvarchar](20) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Fullname] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Photo] [nvarchar](50) NOT NULL,
	[Activated] [bit] NOT NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MasterRoles]    Script Date: 7/17/2024 2:20:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MasterRoles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MasterId] [nvarchar](50) NOT NULL,
	[RoleId] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_UserInRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Masters]    Script Date: 7/17/2024 2:20:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Masters](
	[Id] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[FullName] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Mobile] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 7/17/2024 2:20:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[UnitPrice] [float] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Discount] [float] NOT NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 7/17/2024 2:20:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [nvarchar](20) NOT NULL,
	[OrderDate] [datetime] NOT NULL,
	[RequireDate] [datetime] NOT NULL,
	[Receiver] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](60) NOT NULL,
	[Description] [nvarchar](1000) NULL,
	[Amount] [float] NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 7/17/2024 2:20:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](40) NOT NULL,
	[UnitBrief] [nvarchar](50) NOT NULL,
	[UnitPrice] [float] NOT NULL,
	[Image] [nvarchar](50) NOT NULL,
	[ProductDate] [datetime] NOT NULL,
	[Available] [bit] NOT NULL,
	[Description] [nvarchar](2000) NULL,
	[CategoryId] [int] NOT NULL,
	[SupplierId] [nvarchar](50) NOT NULL,
	[Quantity] [int] NOT NULL,
	[Discount] [float] NOT NULL,
	[Special] [bit] NOT NULL,
	[Latest] [bit] NOT NULL,
	[Views] [int] NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 7/17/2024 2:20:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[Id] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Suppliers]    Script Date: 7/17/2024 2:20:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Suppliers](
	[Id] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Logo] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Phone] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Suppliers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WebActions]    Script Date: 7/17/2024 2:20:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WebActions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Actions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ActionRoles] ON 

INSERT [dbo].[ActionRoles] ([Id], [RoleId], [WebActionId]) VALUES (1, N'admin', 1)
INSERT [dbo].[ActionRoles] ([Id], [RoleId], [WebActionId]) VALUES (2, N'admin', 2)
INSERT [dbo].[ActionRoles] ([Id], [RoleId], [WebActionId]) VALUES (3, N'admin', 3)
INSERT [dbo].[ActionRoles] ([Id], [RoleId], [WebActionId]) VALUES (4, N'admin', 4)
INSERT [dbo].[ActionRoles] ([Id], [RoleId], [WebActionId]) VALUES (5, N'admin', 5)
INSERT [dbo].[ActionRoles] ([Id], [RoleId], [WebActionId]) VALUES (6, N'admin', 6)
INSERT [dbo].[ActionRoles] ([Id], [RoleId], [WebActionId]) VALUES (7, N'admin', 7)
INSERT [dbo].[ActionRoles] ([Id], [RoleId], [WebActionId]) VALUES (8, N'admin', 8)
INSERT [dbo].[ActionRoles] ([Id], [RoleId], [WebActionId]) VALUES (9, N'admin', 9)
INSERT [dbo].[ActionRoles] ([Id], [RoleId], [WebActionId]) VALUES (10, N'admin', 10)
INSERT [dbo].[ActionRoles] ([Id], [RoleId], [WebActionId]) VALUES (11, N'admin', 11)
INSERT [dbo].[ActionRoles] ([Id], [RoleId], [WebActionId]) VALUES (12, N'admin', 12)
INSERT [dbo].[ActionRoles] ([Id], [RoleId], [WebActionId]) VALUES (13, N'admin', 13)
INSERT [dbo].[ActionRoles] ([Id], [RoleId], [WebActionId]) VALUES (14, N'admin', 14)
INSERT [dbo].[ActionRoles] ([Id], [RoleId], [WebActionId]) VALUES (15, N'admin', 15)
INSERT [dbo].[ActionRoles] ([Id], [RoleId], [WebActionId]) VALUES (16, N'admin', 16)
INSERT [dbo].[ActionRoles] ([Id], [RoleId], [WebActionId]) VALUES (17, N'admin', 17)
INSERT [dbo].[ActionRoles] ([Id], [RoleId], [WebActionId]) VALUES (18, N'admin', 18)
INSERT [dbo].[ActionRoles] ([Id], [RoleId], [WebActionId]) VALUES (19, N'admin', 19)
INSERT [dbo].[ActionRoles] ([Id], [RoleId], [WebActionId]) VALUES (20, N'admin', 20)
INSERT [dbo].[ActionRoles] ([Id], [RoleId], [WebActionId]) VALUES (21, N'admin', 21)
INSERT [dbo].[ActionRoles] ([Id], [RoleId], [WebActionId]) VALUES (22, N'admin', 22)
INSERT [dbo].[ActionRoles] ([Id], [RoleId], [WebActionId]) VALUES (23, N'admin', 23)
INSERT [dbo].[ActionRoles] ([Id], [RoleId], [WebActionId]) VALUES (24, N'admin', 24)
INSERT [dbo].[ActionRoles] ([Id], [RoleId], [WebActionId]) VALUES (25, N'admin', 25)
INSERT [dbo].[ActionRoles] ([Id], [RoleId], [WebActionId]) VALUES (26, N'admin', 26)
INSERT [dbo].[ActionRoles] ([Id], [RoleId], [WebActionId]) VALUES (27, N'admin', 27)
INSERT [dbo].[ActionRoles] ([Id], [RoleId], [WebActionId]) VALUES (28, N'admin', 28)
INSERT [dbo].[ActionRoles] ([Id], [RoleId], [WebActionId]) VALUES (29, N'admin', 29)
INSERT [dbo].[ActionRoles] ([Id], [RoleId], [WebActionId]) VALUES (30, N'admin', 30)
INSERT [dbo].[ActionRoles] ([Id], [RoleId], [WebActionId]) VALUES (31, N'admin', 31)
INSERT [dbo].[ActionRoles] ([Id], [RoleId], [WebActionId]) VALUES (32, N'admin', 32)
INSERT [dbo].[ActionRoles] ([Id], [RoleId], [WebActionId]) VALUES (33, N'admin', 33)
INSERT [dbo].[ActionRoles] ([Id], [RoleId], [WebActionId]) VALUES (34, N'admin', 34)
INSERT [dbo].[ActionRoles] ([Id], [RoleId], [WebActionId]) VALUES (35, N'staff', 16)
INSERT [dbo].[ActionRoles] ([Id], [RoleId], [WebActionId]) VALUES (36, N'staff', 17)
INSERT [dbo].[ActionRoles] ([Id], [RoleId], [WebActionId]) VALUES (37, N'staff', 19)
INSERT [dbo].[ActionRoles] ([Id], [RoleId], [WebActionId]) VALUES (38, N'staff', 21)
INSERT [dbo].[ActionRoles] ([Id], [RoleId], [WebActionId]) VALUES (39, N'staff', 22)
SET IDENTITY_INSERT [dbo].[ActionRoles] OFF
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([Id], [NameVN], [Name]) VALUES (1000, N'Đồng hồ thông minh', N'Smart Watches')
INSERT [dbo].[Categories] ([Id], [NameVN], [Name]) VALUES (1001, N'Máy tính xách tay', N'Laptops')
INSERT [dbo].[Categories] ([Id], [NameVN], [Name]) VALUES (1002, N'Điện thoại', N'Phones')
INSERT [dbo].[Categories] ([Id], [NameVN], [Name]) VALUES (1003, N'Máy tính bảng', N'Tablets')
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
INSERT [dbo].[Customers] ([Id], [Password], [Fullname], [Email], [Photo], [Activated]) VALUES (N'n21dccn066', N'123456', N'LK Ruffa', N'n21dccn066@student.ptithcm.edu.vn', N'user.jpg', 1)
INSERT [dbo].[Customers] ([Id], [Password], [Fullname], [Email], [Photo], [Activated]) VALUES (N'phucnaoto', N'123456', N'Phúc Não To', N'phucnaoto@gmail.com', N'user1.png', 1)
GO
SET IDENTITY_INSERT [dbo].[MasterRoles] ON 

INSERT [dbo].[MasterRoles] ([Id], [MasterId], [RoleId]) VALUES (1, N'nnthienphuc', N'admin')
INSERT [dbo].[MasterRoles] ([Id], [MasterId], [RoleId]) VALUES (2, N'thuyngan', N'staff')
INSERT [dbo].[MasterRoles] ([Id], [MasterId], [RoleId]) VALUES (3, N'songnguyen', N'staff')
SET IDENTITY_INSERT [dbo].[MasterRoles] OFF
GO
INSERT [dbo].[Masters] ([Id], [Password], [FullName], [Email], [Mobile]) VALUES (N'nnthienphuc', N'nnthienphuc', N'Nguyễn Ngọc Thiên Phúc', N'nnthienphuc@gmail.com', N'0397357001')
INSERT [dbo].[Masters] ([Id], [Password], [FullName], [Email], [Mobile]) VALUES (N'songnguyen', N'123456', N'Trần Song Nguyên', N'songnguyen.dev@gmail.com', N'0987654333')
INSERT [dbo].[Masters] ([Id], [Password], [FullName], [Email], [Mobile]) VALUES (N'thuyngan', N'123456', N'Trần Thị Thùy Ngân', N'412ngan@gmail.com', N'0964970914')
GO
SET IDENTITY_INSERT [dbo].[OrderDetails] ON 

INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (4, 2, 33, 890, 1, 0.11)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (5, 2, 34, 930.9, 3, 0.16)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (6, 2, 30, 890.9, 1, 0.16)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (7, 3, 16, 980, 1, 0.3)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (8, 3, 1, 500, 1, 0.3)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (9, 3, 2, 515.6, 1, 0.12)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (10, 3, 18, 657.9, 1, 0.2)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (11, 3, 3, 520, 1, 0.3)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (12, 3, 38, 600.4, 1, 0.2)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (13, 3, 40, 700, 1, 0.3)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (14, 3, 14, 958.3, 1, 0)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (15, 3, 15, 960, 3, 0)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (16, 4, 33, 890, 1, 0.11)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (17, 4, 34, 930.9, 1, 0.16)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (18, 4, 38, 600.4, 1, 0.2)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (19, 4, 39, 620, 1, 0.18)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (20, 4, 40, 700, 1, 0.3)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (21, 4, 30, 890.9, 1, 0.16)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (22, 5, 46, 458.3, 1, 0.3)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (23, 5, 47, 490, 1, 0.3)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (24, 5, 48, 500, 1, 0.32)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (25, 5, 49, 510.4, 1, 0.3)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (26, 5, 19, 333.3, 1, 0.16)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (27, 5, 20, 335.6, 1, 0.17)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (28, 5, 21, 335.9, 1, 0.18)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (29, 5, 22, 340, 1, 0.24)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (30, 5, 23, 250, 1, 0.3)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (31, 5, 24, 290, 1, 0.2)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (32, 5, 25, 320, 1, 0.2)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (33, 5, 26, 350, 1, 0.18)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (34, 5, 27, 400, 1, 0.11)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (35, 5, 28, 500, 1, 0.17)
SET IDENTITY_INSERT [dbo].[OrderDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([Id], [CustomerId], [OrderDate], [RequireDate], [Receiver], [Address], [Description], [Amount]) VALUES (2, N'phucnaoto', CAST(N'2024-07-17T00:00:00.000' AS DateTime), CAST(N'2024-07-22T00:00:00.000' AS DateTime), N'Phúc Não To', N'63C/4 Trần Đình Xu', N'Tặng cho các em nhỏ vùng cao', 3886.3239999999996)
INSERT [dbo].[Orders] ([Id], [CustomerId], [OrderDate], [RequireDate], [Receiver], [Address], [Description], [Amount]) VALUES (3, N'phucnaoto', CAST(N'2024-07-17T00:00:00.000' AS DateTime), CAST(N'2025-07-22T00:00:00.000' AS DateTime), N'Phúc Não To', N'63C/4 Trần Đình Xu', N'Mua về trưng cho đẹp nhà', 7188.6680000000006)
INSERT [dbo].[Orders] ([Id], [CustomerId], [OrderDate], [RequireDate], [Receiver], [Address], [Description], [Amount]) VALUES (4, N'n21dccn066', CAST(N'2024-07-17T00:00:00.000' AS DateTime), CAST(N'2024-07-20T00:00:00.000' AS DateTime), N'LK Ruffa', N'97 Man Thiện', N'LK Ruffa buys for everyone, who is studying at PTIT.', 3801.1320000000005)
INSERT [dbo].[Orders] ([Id], [CustomerId], [OrderDate], [RequireDate], [Receiver], [Address], [Description], [Amount]) VALUES (5, N'n21dccn066', CAST(N'2024-07-17T00:00:00.000' AS DateTime), CAST(N'2024-07-22T00:00:00.000' AS DateTime), N'LK Ruffa', N'97 Man Thiện', N'Buying all Smartwatches.', 4174.448)
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([Id], [Name], [UnitBrief], [UnitPrice], [Image], [ProductDate], [Available], [Description], [CategoryId], [SupplierId], [Quantity], [Discount], [Special], [Latest], [Views]) VALUES (1, N'Tablet SamSung S1', N'256GB', 500, N'001ss.jpg', CAST(N'2023-08-08T00:00:00.000' AS DateTime), 1, N'Tablet SamSung S1', 1003, N'SS', 11, 0.3, 0, 0, 2)
INSERT [dbo].[Products] ([Id], [Name], [UnitBrief], [UnitPrice], [Image], [ProductDate], [Available], [Description], [CategoryId], [SupplierId], [Quantity], [Discount], [Special], [Latest], [Views]) VALUES (2, N'Tablet SamSung S2', N'512GB', 515.6, N'1721156499499xi003.jpg', CAST(N'2023-05-08T00:00:00.000' AS DateTime), 1, N'Tablet SamSung S2<br>', 1003, N'SS', 13, 0.12, 0, 1, 0)
INSERT [dbo].[Products] ([Id], [Name], [UnitBrief], [UnitPrice], [Image], [ProductDate], [Available], [Description], [CategoryId], [SupplierId], [Quantity], [Discount], [Special], [Latest], [Views]) VALUES (3, N'Tablet SamSung S3', N'1TB', 520, N'1721153370557003ss.jpg', CAST(N'2024-05-08T00:00:00.000' AS DateTime), 1, N'Tablet SamSung S3<br>', 1003, N'SS', 15, 0.3, 1, 1, 0)
INSERT [dbo].[Products] ([Id], [Name], [UnitBrief], [UnitPrice], [Image], [ProductDate], [Available], [Description], [CategoryId], [SupplierId], [Quantity], [Discount], [Special], [Latest], [Views]) VALUES (5, N'SamSung Zflip5', N'1TB', 1000, N'17211535478781718095897307nguyengui.jpg', CAST(N'2024-07-16T00:00:00.000' AS DateTime), 1, N'SamSung Galaxy Zflip5&nbsp;1TB<br>', 1002, N'SS', 20, 0.2, 1, 1, 0)
INSERT [dbo].[Products] ([Id], [Name], [UnitBrief], [UnitPrice], [Image], [ProductDate], [Available], [Description], [CategoryId], [SupplierId], [Quantity], [Discount], [Special], [Latest], [Views]) VALUES (6, N'Iphone 11 128GB', N'128GB', 583.3, N'17211536627181718095236192iphone11.jpg', CAST(N'2022-07-16T00:00:00.000' AS DateTime), 1, N'Iphone 11 128GB<br>', 1002, N'AP', 11, 0, 0, 0, 0)
INSERT [dbo].[Products] ([Id], [Name], [UnitBrief], [UnitPrice], [Image], [ProductDate], [Available], [Description], [CategoryId], [SupplierId], [Quantity], [Discount], [Special], [Latest], [Views]) VALUES (8, N'Iphone 11 256GB', N'256GB', 598.7, N'17211538277641718095236192iphone11.jpg', CAST(N'2022-05-08T00:00:00.000' AS DateTime), 1, N'Máy tính bảng SamSung 1TB<br>', 1002, N'AP', 30, 0.2, 0, 0, 0)
INSERT [dbo].[Products] ([Id], [Name], [UnitBrief], [UnitPrice], [Image], [ProductDate], [Available], [Description], [CategoryId], [SupplierId], [Quantity], [Discount], [Special], [Latest], [Views]) VALUES (13, N'Iphone 14 Promax', N'1TB', 1291.7, N'1721154033927ip14pm.jpg', CAST(N'2023-09-13T00:00:00.000' AS DateTime), 1, N'Iphone 14 Promax 1TB<br>', 1002, N'AP', 35, 0.1, 1, 1, 0)
INSERT [dbo].[Products] ([Id], [Name], [UnitBrief], [UnitPrice], [Image], [ProductDate], [Available], [Description], [CategoryId], [SupplierId], [Quantity], [Discount], [Special], [Latest], [Views]) VALUES (14, N'Acer Nitro 5 AN 515', N'1kg', 958.3, N'1721154103927acer001.jpg', CAST(N'2021-08-12T00:00:00.000' AS DateTime), 1, N'Acer Nitro 5 AN 515&nbsp;1kg<br>', 1001, N'AC', 33, 0, 1, 0, 10)
INSERT [dbo].[Products] ([Id], [Name], [UnitBrief], [UnitPrice], [Image], [ProductDate], [Available], [Description], [CategoryId], [SupplierId], [Quantity], [Discount], [Special], [Latest], [Views]) VALUES (15, N'Acer Nitro 6 AN 612', N'1kg', 960, N'1721154134370acer002.jpg', CAST(N'2021-12-12T00:00:00.000' AS DateTime), 0, N'Acer Nitro 6 AN 612&nbsp;1kg<br>', 1001, N'AC', 33, 0, 0, 0, 15)
INSERT [dbo].[Products] ([Id], [Name], [UnitBrief], [UnitPrice], [Image], [ProductDate], [Available], [Description], [CategoryId], [SupplierId], [Quantity], [Discount], [Special], [Latest], [Views]) VALUES (16, N'Acer Gaming 2022', N'1kg', 980, N'1721154182656acer003.jpg', CAST(N'2022-01-12T00:00:00.000' AS DateTime), 1, N'Acer Gaming 2022&nbsp;1kg<br>', 1001, N'AC', 31, 0.3, 1, 0, 15)
INSERT [dbo].[Products] ([Id], [Name], [UnitBrief], [UnitPrice], [Image], [ProductDate], [Available], [Description], [CategoryId], [SupplierId], [Quantity], [Discount], [Special], [Latest], [Views]) VALUES (17, N'Acer Region 2023', N'1kg', 1000, N'1721154223141acer004.jpg', CAST(N'2023-01-12T00:00:00.000' AS DateTime), 1, N'Acer Region 2023&nbsp;1kg<br>', 1001, N'AC', 45, 0.2, 1, 1, 17)
INSERT [dbo].[Products] ([Id], [Name], [UnitBrief], [UnitPrice], [Image], [ProductDate], [Available], [Description], [CategoryId], [SupplierId], [Quantity], [Discount], [Special], [Latest], [Views]) VALUES (18, N'Acer Office 2024', N'1kg', 657.9, N'1721154273834acer-a7.jpg', CAST(N'2024-01-12T00:00:00.000' AS DateTime), 1, N'Acer Office 2024&nbsp;1kg<br>', 1001, N'AC', 100, 0.2, 1, 1, 15)
INSERT [dbo].[Products] ([Id], [Name], [UnitBrief], [UnitPrice], [Image], [ProductDate], [Available], [Description], [CategoryId], [SupplierId], [Quantity], [Discount], [Special], [Latest], [Views]) VALUES (19, N'Amazfit 2016', N'8gb', 333.3, N'1721154360819amazafit002.jpg', CAST(N'2016-08-16T00:00:00.000' AS DateTime), 1, N'Amazfit 2016&nbsp;8gb<br>', 1000, N'AM', 11, 0.16, 0, 0, 4)
INSERT [dbo].[Products] ([Id], [Name], [UnitBrief], [UnitPrice], [Image], [ProductDate], [Available], [Description], [CategoryId], [SupplierId], [Quantity], [Discount], [Special], [Latest], [Views]) VALUES (20, N'Amazfit 2017', N'8gb', 335.6, N'1721154412689amazfit001.jpg', CAST(N'2017-08-16T00:00:00.000' AS DateTime), 1, N'<div style="text-align: center;"><font size="4" face="impact">Amazfit 2017&nbsp;8gb</font></div>', 1000, N'AM', 14, 0.17, 0, 0, 7)
INSERT [dbo].[Products] ([Id], [Name], [UnitBrief], [UnitPrice], [Image], [ProductDate], [Available], [Description], [CategoryId], [SupplierId], [Quantity], [Discount], [Special], [Latest], [Views]) VALUES (21, N'Amazfit 2018', N'8gb', 335.9, N'1721154455116amazfit003jpg.jpg', CAST(N'2018-08-16T00:00:00.000' AS DateTime), 1, N'<h3 style="text-align: center;">Amazfit 2018&nbsp;8gb</h3>', 1000, N'AM', 17, 0.18, 0, 0, 6)
INSERT [dbo].[Products] ([Id], [Name], [UnitBrief], [UnitPrice], [Image], [ProductDate], [Available], [Description], [CategoryId], [SupplierId], [Quantity], [Discount], [Special], [Latest], [Views]) VALUES (22, N'Amazfit 2024', N'8gb', 340, N'1721154493868amazfit-004.jpg', CAST(N'2024-08-01T00:00:00.000' AS DateTime), 1, N'Amazfit 2024&nbsp;8gb<br>', 1000, N'AM', 17, 0.24, 1, 1, 6)
INSERT [dbo].[Products] ([Id], [Name], [UnitBrief], [UnitPrice], [Image], [ProductDate], [Available], [Description], [CategoryId], [SupplierId], [Quantity], [Discount], [Special], [Latest], [Views]) VALUES (23, N'Apple Watch S3', N'8gb', 250, N'1721154551754apple001.jpg', CAST(N'2020-08-01T00:00:00.000' AS DateTime), 1, N'Apple Watch Series 3&nbsp;8gb<br>', 1000, N'AP', 16, 0.3, 0, 0, 14)
INSERT [dbo].[Products] ([Id], [Name], [UnitBrief], [UnitPrice], [Image], [ProductDate], [Available], [Description], [CategoryId], [SupplierId], [Quantity], [Discount], [Special], [Latest], [Views]) VALUES (24, N'Apple Watch S4', N'8gb', 290, N'1721154587427apple002.jpg', CAST(N'2021-08-01T00:00:00.000' AS DateTime), 1, N'Apple Watch Series 4&nbsp;8gb Pink<br>', 1000, N'AP', 16, 0.2, 0, 0, 18)
INSERT [dbo].[Products] ([Id], [Name], [UnitBrief], [UnitPrice], [Image], [ProductDate], [Available], [Description], [CategoryId], [SupplierId], [Quantity], [Discount], [Special], [Latest], [Views]) VALUES (25, N'Apple Watch S5', N'8gb', 320, N'1721154619549apple003.png', CAST(N'2022-08-01T00:00:00.000' AS DateTime), 1, N'Apple Watch Series 5&nbsp;8gb<br>', 1000, N'AP', 43, 0.2, 1, 0, 15)
INSERT [dbo].[Products] ([Id], [Name], [UnitBrief], [UnitPrice], [Image], [ProductDate], [Available], [Description], [CategoryId], [SupplierId], [Quantity], [Discount], [Special], [Latest], [Views]) VALUES (26, N'Apple Watch S6', N'8gb', 350, N'1721154663440apple004.jpg', CAST(N'2023-01-01T00:00:00.000' AS DateTime), 1, N'Apple Watch Series 6&nbsp;8gb<br>', 1000, N'AP', 41, 0.18, 1, 0, 44)
INSERT [dbo].[Products] ([Id], [Name], [UnitBrief], [UnitPrice], [Image], [ProductDate], [Available], [Description], [CategoryId], [SupplierId], [Quantity], [Discount], [Special], [Latest], [Views]) VALUES (27, N'Apple Watch S7', N'8gb', 400, N'1721154701258apple005.jpg', CAST(N'2023-12-12T00:00:00.000' AS DateTime), 0, N'<div style="text-align: center;"><b><font size="4" face="courier new">Apple Watch Series 7&nbsp;8gb</font></b></div>', 1000, N'AP', 43, 0.11, 0, 0, 55)
INSERT [dbo].[Products] ([Id], [Name], [UnitBrief], [UnitPrice], [Image], [ProductDate], [Available], [Description], [CategoryId], [SupplierId], [Quantity], [Discount], [Special], [Latest], [Views]) VALUES (28, N'Apple Watch S9', N'8gb', 500, N'1721154755602apple006.jpg', CAST(N'2024-07-15T00:00:00.000' AS DateTime), 1, N'Apple Watch Series 9&nbsp;8gb <b>new version</b><br>', 1000, N'AP', 40, 0.17, 1, 1, 54)
INSERT [dbo].[Products] ([Id], [Name], [UnitBrief], [UnitPrice], [Image], [ProductDate], [Available], [Description], [CategoryId], [SupplierId], [Quantity], [Discount], [Special], [Latest], [Views]) VALUES (29, N'Iphone 12 1TB', N'1TB', 833.3, N'1721154864441ip12.jpg', CAST(N'2022-08-08T00:00:00.000' AS DateTime), 1, N'Iphone 12 1TB<br>', 1002, N'AP', 100, 0.1, 1, 0, 54)
INSERT [dbo].[Products] ([Id], [Name], [UnitBrief], [UnitPrice], [Image], [ProductDate], [Available], [Description], [CategoryId], [SupplierId], [Quantity], [Discount], [Special], [Latest], [Views]) VALUES (30, N'Iphone 13 1TB', N'1TB', 890.9, N'1721154897412ip13.jpg', CAST(N'2023-08-08T00:00:00.000' AS DateTime), 1, N'Iphone 13 1TB<br>', 1002, N'AP', 101, 0.16, 1, 0, 45)
INSERT [dbo].[Products] ([Id], [Name], [UnitBrief], [UnitPrice], [Image], [ProductDate], [Available], [Description], [CategoryId], [SupplierId], [Quantity], [Discount], [Special], [Latest], [Views]) VALUES (31, N'Iphone 14 2TB', N'1TB', 900, N'1721154950142ip14.jpg', CAST(N'2023-08-08T00:00:00.000' AS DateTime), 1, N'Iphone 14 2TB<br>', 1002, N'AP', 11, 0.2, 1, 0, 45)
INSERT [dbo].[Products] ([Id], [Name], [UnitBrief], [UnitPrice], [Image], [ProductDate], [Available], [Description], [CategoryId], [SupplierId], [Quantity], [Discount], [Special], [Latest], [Views]) VALUES (33, N'Iphone 14 Plus', N'1TB', 890, N'1721155054819ip14plus.jpg', CAST(N'2023-08-08T00:00:00.000' AS DateTime), 1, N'Iphone 14 Plus 1TB<br>', 1002, N'AP', 56, 0.11, 1, 0, 75)
INSERT [dbo].[Products] ([Id], [Name], [UnitBrief], [UnitPrice], [Image], [ProductDate], [Available], [Description], [CategoryId], [SupplierId], [Quantity], [Discount], [Special], [Latest], [Views]) VALUES (34, N'Iphone 15', N'1TB', 930.9, N'1721155121125ip14pm.jpg', CAST(N'2023-12-08T00:00:00.000' AS DateTime), 1, N'Iphone 14 Promax 1TB<br>', 1002, N'AP', 76, 0.16, 1, 0, 54)
INSERT [dbo].[Products] ([Id], [Name], [UnitBrief], [UnitPrice], [Image], [ProductDate], [Available], [Description], [CategoryId], [SupplierId], [Quantity], [Discount], [Special], [Latest], [Views]) VALUES (35, N'Iphone 15 Promax', N'1TB', 1000.9, N'1721155169674ip15pm.jpg', CAST(N'2024-01-01T00:00:00.000' AS DateTime), 1, N'Iphone 15 Promax 1TB<br>', 1002, N'AP', 100, 0.2, 1, 1, 60)
INSERT [dbo].[Products] ([Id], [Name], [UnitBrief], [UnitPrice], [Image], [ProductDate], [Available], [Description], [CategoryId], [SupplierId], [Quantity], [Discount], [Special], [Latest], [Views]) VALUES (36, N'Ipad 01 128GB', N'128GB', 583.3, N'1721155289131ipad001.jpg', CAST(N'2024-01-01T00:00:00.000' AS DateTime), 1, N'Ipad 01 128GB<br>', 1003, N'AP', 65, 0.3, 0, 0, 60)
INSERT [dbo].[Products] ([Id], [Name], [UnitBrief], [UnitPrice], [Image], [ProductDate], [Available], [Description], [CategoryId], [SupplierId], [Quantity], [Discount], [Special], [Latest], [Views]) VALUES (37, N'Ipad 02 128GB', N'128GB', 590, N'1721155317062ipad03.jpg', CAST(N'2024-01-01T00:00:00.000' AS DateTime), 1, N'Ipad 02 128GB<br>', 1003, N'AP', 33, 0.2, 0, 0, 60)
INSERT [dbo].[Products] ([Id], [Name], [UnitBrief], [UnitPrice], [Image], [ProductDate], [Available], [Description], [CategoryId], [SupplierId], [Quantity], [Discount], [Special], [Latest], [Views]) VALUES (38, N'Ipad 04 128GB', N'128GB', 600.4, N'1721155355882ipad004.jpg', CAST(N'2024-01-01T00:00:00.000' AS DateTime), 1, N'Ipad 04 128GB<br>', 1003, N'AP', 33, 0.2, 1, 0, 60)
INSERT [dbo].[Products] ([Id], [Name], [UnitBrief], [UnitPrice], [Image], [ProductDate], [Available], [Description], [CategoryId], [SupplierId], [Quantity], [Discount], [Special], [Latest], [Views]) VALUES (39, N'Ipad 05 512GB', N'512GB', 620, N'1721155392089ipad005.jpg', CAST(N'2024-01-01T00:00:00.000' AS DateTime), 1, N'Ipad 05 512GB<br>', 1003, N'AP', 35, 0.18, 1, 0, 23)
INSERT [dbo].[Products] ([Id], [Name], [UnitBrief], [UnitPrice], [Image], [ProductDate], [Available], [Description], [CategoryId], [SupplierId], [Quantity], [Discount], [Special], [Latest], [Views]) VALUES (40, N'Ipad 06 1TB', N'1TB', 700, N'1721155432679ipad006.jpg', CAST(N'2024-05-01T00:00:00.000' AS DateTime), 1, N'Ipad 06 1TB<br>', 1003, N'AP', 35, 0.3, 1, 1, 23)
INSERT [dbo].[Products] ([Id], [Name], [UnitBrief], [UnitPrice], [Image], [ProductDate], [Available], [Description], [CategoryId], [SupplierId], [Quantity], [Discount], [Special], [Latest], [Views]) VALUES (41, N'Macbook Pro 512GB', N'512GB', 1666.6, N'1721155550954mac001.jpg', CAST(N'2024-05-01T00:00:00.000' AS DateTime), 1, N'Macbook Pro 512GB<br>', 1001, N'AP', 35, 0.3, 1, 0, 23)
INSERT [dbo].[Products] ([Id], [Name], [UnitBrief], [UnitPrice], [Image], [ProductDate], [Available], [Description], [CategoryId], [SupplierId], [Quantity], [Discount], [Special], [Latest], [Views]) VALUES (42, N'Macbook Air 512G', N'512GB', 1300, N'1721155581717mac002.jpg', CAST(N'2024-05-01T00:00:00.000' AS DateTime), 1, N'Macbook Air 512G<br>', 1001, N'AP', 35, 0.3, 1, 0, 23)
INSERT [dbo].[Products] ([Id], [Name], [UnitBrief], [UnitPrice], [Image], [ProductDate], [Available], [Description], [CategoryId], [SupplierId], [Quantity], [Discount], [Special], [Latest], [Views]) VALUES (43, N'Macbook Pro 1TB', N'1TB', 1700.9, N'1721155612342mac003.jpg', CAST(N'2024-05-01T00:00:00.000' AS DateTime), 1, N'Macbook Pro 1TB<br>', 1001, N'AP', 35, 0.3, 1, 1, 23)
INSERT [dbo].[Products] ([Id], [Name], [UnitBrief], [UnitPrice], [Image], [ProductDate], [Available], [Description], [CategoryId], [SupplierId], [Quantity], [Discount], [Special], [Latest], [Views]) VALUES (44, N'Macbook Pro 2TB', N'2TB', 2000, N'1721155663188mac003.jpg', CAST(N'2024-05-05T00:00:00.000' AS DateTime), 1, N'Macbook Pro 2TB<br>', 1001, N'AP', 35, 0.2, 1, 1, 24)
INSERT [dbo].[Products] ([Id], [Name], [UnitBrief], [UnitPrice], [Image], [ProductDate], [Available], [Description], [CategoryId], [SupplierId], [Quantity], [Discount], [Special], [Latest], [Views]) VALUES (45, N'Macbook 2TB', N'2TB', 1890.5, N'1721155716315mac004.jpg', CAST(N'2024-05-01T00:00:00.000' AS DateTime), 1, N'Macbook 2TB<br>', 1001, N'AP', 35, 0.3, 1, 1, 24)
INSERT [dbo].[Products] ([Id], [Name], [UnitBrief], [UnitPrice], [Image], [ProductDate], [Available], [Description], [CategoryId], [SupplierId], [Quantity], [Discount], [Special], [Latest], [Views]) VALUES (46, N'SamSung series 1', N'8GB', 458.3, N'1721155955444ss001.jpg', CAST(N'2021-08-16T00:00:00.000' AS DateTime), 1, N'SamSung series 1<br>', 1000, N'SS', 45, 0.3, 0, 0, 6)
INSERT [dbo].[Products] ([Id], [Name], [UnitBrief], [UnitPrice], [Image], [ProductDate], [Available], [Description], [CategoryId], [SupplierId], [Quantity], [Discount], [Special], [Latest], [Views]) VALUES (47, N'SamSung series 2', N'8GB', 490, N'1721155982570ss002.jpg', CAST(N'2021-08-16T00:00:00.000' AS DateTime), 1, N'SamSung series 2<br>', 1000, N'SS', 54, 0.3, 0, 0, 6)
INSERT [dbo].[Products] ([Id], [Name], [UnitBrief], [UnitPrice], [Image], [ProductDate], [Available], [Description], [CategoryId], [SupplierId], [Quantity], [Discount], [Special], [Latest], [Views]) VALUES (48, N'SamSung series 3', N'8GB', 500, N'1721156011153ss003.jpg', CAST(N'2021-08-16T00:00:00.000' AS DateTime), 1, N'SamSung series 3<br>', 1000, N'SS', 31, 0.32, 0, 0, 6)
INSERT [dbo].[Products] ([Id], [Name], [UnitBrief], [UnitPrice], [Image], [ProductDate], [Available], [Description], [CategoryId], [SupplierId], [Quantity], [Discount], [Special], [Latest], [Views]) VALUES (49, N'SamSung series 4', N'8GB', 510.4, N'1721156034032ss006.jpg', CAST(N'2021-08-16T00:00:00.000' AS DateTime), 1, N'SamSung series 4<br>', 1000, N'SS', 32, 0.3, 1, 1, 6)
INSERT [dbo].[Products] ([Id], [Name], [UnitBrief], [UnitPrice], [Image], [ProductDate], [Available], [Description], [CategoryId], [SupplierId], [Quantity], [Discount], [Special], [Latest], [Views]) VALUES (50, N'SamSung s23 ultra', N'1TB', 1333.3, N'1721156080315s23ultra.jpg', CAST(N'2022-08-16T00:00:00.000' AS DateTime), 1, N'SamSung s23 ultra 1TB<br>', 1002, N'SS', 38, 0.2, 1, 0, 10)
INSERT [dbo].[Products] ([Id], [Name], [UnitBrief], [UnitPrice], [Image], [ProductDate], [Available], [Description], [CategoryId], [SupplierId], [Quantity], [Discount], [Special], [Latest], [Views]) VALUES (51, N'SamSung s24 ultra', N'1TB', 1400, N'1721156777198s24ultra.jpg', CAST(N'2024-08-16T00:00:00.000' AS DateTime), 1, N'SamSung s24 ultra 1TB<br>', 1002, N'SS', 46, 0.2, 1, 1, 46)
INSERT [dbo].[Products] ([Id], [Name], [UnitBrief], [UnitPrice], [Image], [ProductDate], [Available], [Description], [CategoryId], [SupplierId], [Quantity], [Discount], [Special], [Latest], [Views]) VALUES (52, N'SamSung zflip 256GB', N'256GB', 1450.6, N'1721156204917sszf5.jpg', CAST(N'2021-08-16T00:00:00.000' AS DateTime), 1, N'SamSung zflip 256GB<br>', 1002, N'SS', 100, 0.3, 1, 0, 23)
INSERT [dbo].[Products] ([Id], [Name], [UnitBrief], [UnitPrice], [Image], [ProductDate], [Available], [Description], [CategoryId], [SupplierId], [Quantity], [Discount], [Special], [Latest], [Views]) VALUES (53, N'SamSung zflip 512GB', N'512GB', 1460, N'1721156240340sszflip5.jpg', CAST(N'2021-08-16T00:00:00.000' AS DateTime), 1, N'SamSung zflip 512GB<br>', 1002, N'SS', 15, 0.27, 1, 1, 35)
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (N'admin', N'Administrator')
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (N'staff', N'Staff')
GO
INSERT [dbo].[Suppliers] ([Id], [Name], [Logo], [Email], [Phone]) VALUES (N'AC', N'ACER', N'lgacer.jpg', N'acer.contact@gmail.com', N'0987654323')
INSERT [dbo].[Suppliers] ([Id], [Name], [Logo], [Email], [Phone]) VALUES (N'AM', N'AMAZFIT', N'lgamazfit.png', N'amazfit.contact@gmail.com', N'0987654324')
INSERT [dbo].[Suppliers] ([Id], [Name], [Logo], [Email], [Phone]) VALUES (N'AP', N'APPLE', N'lgapple.png', N'apple.contact@gmail.com', N'0987654321')
INSERT [dbo].[Suppliers] ([Id], [Name], [Logo], [Email], [Phone]) VALUES (N'SS', N'SAMSUNG', N'lgsamsung.png', N'samsung.contact@gmail.com', N'0987654322')
GO
SET IDENTITY_INSERT [dbo].[WebActions] ON 

INSERT [dbo].[WebActions] ([Id], [Name], [Description]) VALUES (1, N'product/insert', N'Sản phẩm - Thêm mới')
INSERT [dbo].[WebActions] ([Id], [Name], [Description]) VALUES (2, N'product/update', N'Sản phẩm - Cập nhật')
INSERT [dbo].[WebActions] ([Id], [Name], [Description]) VALUES (3, N'product/delete', N'Sản phẩm - Xóa')
INSERT [dbo].[WebActions] ([Id], [Name], [Description]) VALUES (4, N'product/edit', N'Sản phẩm - Sửa đổi')
INSERT [dbo].[WebActions] ([Id], [Name], [Description]) VALUES (5, N'product/index', N'Sản phẩm - Quản lý')
INSERT [dbo].[WebActions] ([Id], [Name], [Description]) VALUES (6, N'category/insert', N'Loại sản phẩm - Thêm mới')
INSERT [dbo].[WebActions] ([Id], [Name], [Description]) VALUES (7, N'category/update', N'Loại sản phẩm - Cập nhật')
INSERT [dbo].[WebActions] ([Id], [Name], [Description]) VALUES (8, N'category/delete', N'Loại sản phẩm - Xóa')
INSERT [dbo].[WebActions] ([Id], [Name], [Description]) VALUES (9, N'category/edit', N'Loại sản phẩm - Sửa đổi')
INSERT [dbo].[WebActions] ([Id], [Name], [Description]) VALUES (10, N'category/index', N'Loại sản phẩm - Quản lý')
INSERT [dbo].[WebActions] ([Id], [Name], [Description]) VALUES (11, N'supplier/insert', N'Nhà cung cấp - Thêm mới')
INSERT [dbo].[WebActions] ([Id], [Name], [Description]) VALUES (12, N'supplier/update', N'Nhà cung cấp - Cập nhật')
INSERT [dbo].[WebActions] ([Id], [Name], [Description]) VALUES (13, N'supplier/delete', N'Nhà cung cấp - Xóa')
INSERT [dbo].[WebActions] ([Id], [Name], [Description]) VALUES (14, N'supplier/edit', N'Nhà cung cấp - Sửa đổi')
INSERT [dbo].[WebActions] ([Id], [Name], [Description]) VALUES (15, N'supplier/index', N'Nhà cung cấp - Quản lý')
INSERT [dbo].[WebActions] ([Id], [Name], [Description]) VALUES (16, N'customer/insert', N'Khách hàng - Thêm mới')
INSERT [dbo].[WebActions] ([Id], [Name], [Description]) VALUES (17, N'customer/update', N'Khách hàng - Cập nhật')
INSERT [dbo].[WebActions] ([Id], [Name], [Description]) VALUES (18, N'customer/delete', N'Khách hàng - Xóa')
INSERT [dbo].[WebActions] ([Id], [Name], [Description]) VALUES (19, N'customer/edit', N'Khách hàng - Sửa đổi')
INSERT [dbo].[WebActions] ([Id], [Name], [Description]) VALUES (20, N'customer/index', N'Khách hàng - Quản lý')
INSERT [dbo].[WebActions] ([Id], [Name], [Description]) VALUES (21, N'order/insert', N'Đơn hàng - Thêm mới')
INSERT [dbo].[WebActions] ([Id], [Name], [Description]) VALUES (22, N'order/update', N'Đơn hàng - Cập nhật')
INSERT [dbo].[WebActions] ([Id], [Name], [Description]) VALUES (23, N'order/delete', N'Đơn hàng - Xóa')
INSERT [dbo].[WebActions] ([Id], [Name], [Description]) VALUES (24, N'order/edit', N'Đơn hàng - Sửa đổi')
INSERT [dbo].[WebActions] ([Id], [Name], [Description]) VALUES (25, N'order/index', N'Đơn hàng - Quản lý')
INSERT [dbo].[WebActions] ([Id], [Name], [Description]) VALUES (26, N'inventory/bycategory', N'Hàng tồn theo loại')
INSERT [dbo].[WebActions] ([Id], [Name], [Description]) VALUES (27, N'inventory/bysupplier', N'Hàng tồn theo nhà cung cấp')
INSERT [dbo].[WebActions] ([Id], [Name], [Description]) VALUES (28, N'revenue/byproduct', N'Doanh số từng mặt hàng')
INSERT [dbo].[WebActions] ([Id], [Name], [Description]) VALUES (29, N'revenue/bycategory', N'Doanh số từng loại hàng')
INSERT [dbo].[WebActions] ([Id], [Name], [Description]) VALUES (30, N'revenue/bysupplier', N'Doanh số từng nhà cung cấp')
INSERT [dbo].[WebActions] ([Id], [Name], [Description]) VALUES (31, N'revenue/bycustomer', N'Doanh số từng khách hàng')
INSERT [dbo].[WebActions] ([Id], [Name], [Description]) VALUES (32, N'revenue/byyear', N'Doanh số từng năm')
INSERT [dbo].[WebActions] ([Id], [Name], [Description]) VALUES (33, N'revenue/byquarter', N'Doanh số từng quý')
INSERT [dbo].[WebActions] ([Id], [Name], [Description]) VALUES (34, N'revenue/bymonth', N'Doanh số từng tháng')
SET IDENTITY_INSERT [dbo].[WebActions] OFF
GO
ALTER TABLE [dbo].[Customers] ADD  CONSTRAINT [DF_Customers_Photo]  DEFAULT (N'Photo.gif') FOR [Photo]
GO
ALTER TABLE [dbo].[Customers] ADD  CONSTRAINT [DF_Customers_Active]  DEFAULT ((0)) FOR [Activated]
GO
ALTER TABLE [dbo].[Masters] ADD  CONSTRAINT [DF_Masters_FullName]  DEFAULT (N'RUFFA') FOR [FullName]
GO
ALTER TABLE [dbo].[Masters] ADD  CONSTRAINT [DF_Masters_Mobile]  DEFAULT ((913745789)) FOR [Mobile]
GO
ALTER TABLE [dbo].[OrderDetails] ADD  CONSTRAINT [DF_Order_Details_UnitPrice]  DEFAULT ((0)) FOR [UnitPrice]
GO
ALTER TABLE [dbo].[OrderDetails] ADD  CONSTRAINT [DF_Order_Details_Quantity]  DEFAULT ((1)) FOR [Quantity]
GO
ALTER TABLE [dbo].[OrderDetails] ADD  CONSTRAINT [DF_OrderDetails_Discount]  DEFAULT ((0)) FOR [Discount]
GO
ALTER TABLE [dbo].[Orders] ADD  CONSTRAINT [DF_Orders_OrderDate]  DEFAULT (getdate()) FOR [OrderDate]
GO
ALTER TABLE [dbo].[Orders] ADD  CONSTRAINT [DF__Orders__Amount__381A47C8]  DEFAULT ((0)) FOR [Amount]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Products_UnitPrice]  DEFAULT ((0)) FOR [UnitPrice]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Products_Image]  DEFAULT (N'Product.gif') FOR [Image]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Products_ProductDate]  DEFAULT (getdate()) FOR [ProductDate]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Products_Available]  DEFAULT ((1)) FOR [Available]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Products_SupplierId]  DEFAULT (N'RUFFA') FOR [SupplierId]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT ((100)) FOR [Quantity]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Products_Discount]  DEFAULT (rand()) FOR [Discount]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Products_Special]  DEFAULT ((0)) FOR [Special]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Products_New]  DEFAULT ((0)) FOR [Latest]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Products_Views]  DEFAULT ((0)) FOR [Views]
GO
ALTER TABLE [dbo].[Suppliers] ADD  CONSTRAINT [DF_Suppliers_Logo]  DEFAULT (N'Logo.gif') FOR [Logo]
GO
ALTER TABLE [dbo].[ActionRoles]  WITH CHECK ADD  CONSTRAINT [FK_Permissions_Actions] FOREIGN KEY([WebActionId])
REFERENCES [dbo].[WebActions] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ActionRoles] CHECK CONSTRAINT [FK_Permissions_Actions]
GO
ALTER TABLE [dbo].[ActionRoles]  WITH CHECK ADD  CONSTRAINT [FK_Permissions_Roles] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ActionRoles] CHECK CONSTRAINT [FK_Permissions_Roles]
GO
ALTER TABLE [dbo].[MasterRoles]  WITH CHECK ADD  CONSTRAINT [FK_UserInRoles_Roles] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[MasterRoles] CHECK CONSTRAINT [FK_UserInRoles_Roles]
GO
ALTER TABLE [dbo].[MasterRoles]  WITH CHECK ADD  CONSTRAINT [FK_UserInRoles_Users] FOREIGN KEY([MasterId])
REFERENCES [dbo].[Masters] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[MasterRoles] CHECK CONSTRAINT [FK_UserInRoles_Users]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Orders] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Orders]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Products]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Customers] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customers] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Customers]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_HangHoa_Loai1] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_HangHoa_Loai1]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Suppliers] FOREIGN KEY([SupplierId])
REFERENCES [dbo].[Suppliers] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Suppliers]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã loại' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Categories', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tên chủng loại' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Categories', @level2type=N'COLUMN',@level2name=N'NameVN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã khách hàng' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Customers', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mật khẩu đăng nhập' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Customers', @level2type=N'COLUMN',@level2name=N'Password'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Họ và tên' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Customers', @level2type=N'COLUMN',@level2name=N'Fullname'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Email' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Customers', @level2type=N'COLUMN',@level2name=N'Email'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Hình' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Customers', @level2type=N'COLUMN',@level2name=N'Photo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Đã kích hoạt hay chưa' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Customers', @level2type=N'COLUMN',@level2name=N'Activated'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã chi tiết' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OrderDetails', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã hóa đơn' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OrderDetails', @level2type=N'COLUMN',@level2name=N'OrderId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã hàng hóa' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OrderDetails', @level2type=N'COLUMN',@level2name=N'ProductId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Đơn giá bán' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OrderDetails', @level2type=N'COLUMN',@level2name=N'UnitPrice'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Số lượng mua' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OrderDetails', @level2type=N'COLUMN',@level2name=N'Quantity'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã hóa đơn' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Orders', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã khách hàng' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Orders', @level2type=N'COLUMN',@level2name=N'CustomerId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ngày đặt hàng' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Orders', @level2type=N'COLUMN',@level2name=N'OrderDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ngày cần có hàng' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Orders', @level2type=N'COLUMN',@level2name=N'RequireDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tên người nhận' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Orders', @level2type=N'COLUMN',@level2name=N'Receiver'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Địa chỉ nhận' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Orders', @level2type=N'COLUMN',@level2name=N'Address'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ghi chú thêm' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Orders', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã hàng hóa' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Products', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tên hàng hóa' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Products', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mô tả đơn vị tính' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Products', @level2type=N'COLUMN',@level2name=N'UnitBrief'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Đơn giá' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Products', @level2type=N'COLUMN',@level2name=N'UnitPrice'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Hình ảnh' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Products', @level2type=N'COLUMN',@level2name=N'Image'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ngày sản xuất' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Products', @level2type=N'COLUMN',@level2name=N'ProductDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mô tả hàng hóa' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Products', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã loại, FK' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Products', @level2type=N'COLUMN',@level2name=N'CategoryId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã nhà cung cấp' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Products', @level2type=N'COLUMN',@level2name=N'SupplierId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã nhà cung cấp' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Suppliers', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tên công ty' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Suppliers', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Logo nhà cung cấp' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Suppliers', @level2type=N'COLUMN',@level2name=N'Logo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Email' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Suppliers', @level2type=N'COLUMN',@level2name=N'Email'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Số điện thoại liên lạc' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Suppliers', @level2type=N'COLUMN',@level2name=N'Phone'
GO
USE [master]
GO
ALTER DATABASE [EShop] SET  READ_WRITE 
GO
