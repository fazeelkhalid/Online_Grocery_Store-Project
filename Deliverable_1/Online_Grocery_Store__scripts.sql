USE [master]
GO
/****** Object:  Database [Online_Grocery_Store]    Script Date: 15/04/2021 11:22:56 pm ******/
CREATE DATABASE [Online_Grocery_Store]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Online_Grocery_Store', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Online_Grocery_Store.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Online_Grocery_Store_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Online_Grocery_Store_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Online_Grocery_Store] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Online_Grocery_Store].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Online_Grocery_Store] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Online_Grocery_Store] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Online_Grocery_Store] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Online_Grocery_Store] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Online_Grocery_Store] SET ARITHABORT OFF 
GO
ALTER DATABASE [Online_Grocery_Store] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Online_Grocery_Store] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Online_Grocery_Store] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Online_Grocery_Store] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Online_Grocery_Store] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Online_Grocery_Store] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Online_Grocery_Store] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Online_Grocery_Store] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Online_Grocery_Store] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Online_Grocery_Store] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Online_Grocery_Store] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Online_Grocery_Store] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Online_Grocery_Store] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Online_Grocery_Store] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Online_Grocery_Store] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Online_Grocery_Store] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Online_Grocery_Store] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Online_Grocery_Store] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Online_Grocery_Store] SET  MULTI_USER 
GO
ALTER DATABASE [Online_Grocery_Store] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Online_Grocery_Store] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Online_Grocery_Store] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Online_Grocery_Store] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Online_Grocery_Store] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Online_Grocery_Store] SET QUERY_STORE = OFF
GO
USE [Online_Grocery_Store]
GO
/****** Object:  Table [dbo].[Coupon_table]    Script Date: 15/04/2021 11:22:56 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Coupon_table](
	[Coupon_id] [int] NOT NULL,
	[Customer_id] [int] NOT NULL,
	[Discount_type] [varchar](50) NOT NULL,
	[Amount] [float] NOT NULL,
	[Starting_date] [date] NOT NULL,
	[ending_date] [date] NOT NULL,
	[Status] [tinyint] NOT NULL,
 CONSTRAINT [PK_Coupon_table] PRIMARY KEY CLUSTERED 
(
	[Coupon_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer_table]    Script Date: 15/04/2021 11:22:56 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer_table](
	[Customer_id] [int] NOT NULL,
	[Customer_name] [varchar](50) NULL,
	[Customer_email] [varchar](50) NOT NULL,
	[Contact#] [varchar](11) NULL,
	[Password] [varchar](50) NOT NULL,
	[Total_purchase] [float] NOT NULL,
 CONSTRAINT [PK_Customer_table] PRIMARY KEY CLUSTERED 
(
	[Customer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order_table]    Script Date: 15/04/2021 11:22:56 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order_table](
	[Order_id] [int] NOT NULL,
	[Product_id] [int] NOT NULL,
	[Customer_id] [int] NOT NULL,
	[Coupon_id] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Order_date] [date] NOT NULL,
	[Order_time] [time](7) NOT NULL,
	[isDeliver] [tinyint] NOT NULL,
	[Address] [varchar](50) NOT NULL,
	[rating] [int] NULL,
 CONSTRAINT [PK_Order_id] PRIMARY KEY CLUSTERED 
(
	[Order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product_table]    Script Date: 15/04/2021 11:22:56 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_table](
	[Product_id] [int] NOT NULL,
	[Supplier_id] [int] NOT NULL,
	[Product_name] [varchar](50) NOT NULL,
	[Price] [float] NOT NULL,
	[Description] [varchar](50) NULL,
	[Category_name] [varchar](50) NOT NULL,
	[Total_stock] [int] NOT NULL,
	[Remaining_stock] [int] NOT NULL,
	[Rating] [float] NOT NULL,
	[Total_reviews] [int] NOT NULL,
 CONSTRAINT [PK_Product_table] PRIMARY KEY CLUSTERED 
(
	[Product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Supplier_table]    Script Date: 15/04/2021 11:22:56 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supplier_table](
	[Supplier_id] [int] NOT NULL,
	[Supplier_name] [varchar](50) NOT NULL,
	[Supplier_company] [varchar](50) NOT NULL,
	[Supplier_email] [varchar](50) NULL,
	[contact#] [varchar](11) NULL,
	[CNIC] [varchar](13) NOT NULL,
	[Company_address] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Supplier_table] PRIMARY KEY CLUSTERED 
(
	[Supplier_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Product_table] ADD  CONSTRAINT [DF_Product_table_Raitting]  DEFAULT ((0)) FOR [Rating]
GO
ALTER TABLE [dbo].[Product_table] ADD  CONSTRAINT [DF_Product_table_Total_reviews]  DEFAULT ((0)) FOR [Total_reviews]
GO
ALTER TABLE [dbo].[Coupon_table]  WITH CHECK ADD  CONSTRAINT [FK_Coupon_table_Customer_table] FOREIGN KEY([Customer_id])
REFERENCES [dbo].[Customer_table] ([Customer_id])
GO
ALTER TABLE [dbo].[Coupon_table] CHECK CONSTRAINT [FK_Coupon_table_Customer_table]
GO
ALTER TABLE [dbo].[Order_table]  WITH CHECK ADD  CONSTRAINT [FK_Order_table_Coupon_table] FOREIGN KEY([Coupon_id])
REFERENCES [dbo].[Coupon_table] ([Coupon_id])
GO
ALTER TABLE [dbo].[Order_table] CHECK CONSTRAINT [FK_Order_table_Coupon_table]
GO
ALTER TABLE [dbo].[Order_table]  WITH CHECK ADD  CONSTRAINT [FK_Order_table_Customer_table] FOREIGN KEY([Customer_id])
REFERENCES [dbo].[Customer_table] ([Customer_id])
GO
ALTER TABLE [dbo].[Order_table] CHECK CONSTRAINT [FK_Order_table_Customer_table]
GO
ALTER TABLE [dbo].[Order_table]  WITH CHECK ADD  CONSTRAINT [FK_Order_table_Product_table] FOREIGN KEY([Product_id])
REFERENCES [dbo].[Product_table] ([Product_id])
GO
ALTER TABLE [dbo].[Order_table] CHECK CONSTRAINT [FK_Order_table_Product_table]
GO
ALTER TABLE [dbo].[Product_table]  WITH CHECK ADD  CONSTRAINT [FK_Product_table_Supplier_table] FOREIGN KEY([Supplier_id])
REFERENCES [dbo].[Supplier_table] ([Supplier_id])
GO
ALTER TABLE [dbo].[Product_table] CHECK CONSTRAINT [FK_Product_table_Supplier_table]
GO
USE [master]
GO
ALTER DATABASE [Online_Grocery_Store] SET  READ_WRITE 
GO
