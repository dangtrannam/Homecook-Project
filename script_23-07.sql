/****** Object:  Database [homecook]    Script Date: 7/23/2021 4:33:54 PM ******/
CREATE DATABASE [homecook]  (EDITION = 'Basic', SERVICE_OBJECTIVE = 'Basic', MAXSIZE = 2 GB) WITH CATALOG_COLLATION = SQL_Latin1_General_CP1_CI_AS;
GO
ALTER DATABASE [homecook] SET COMPATIBILITY_LEVEL = 150
GO
ALTER DATABASE [homecook] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [homecook] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [homecook] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [homecook] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [homecook] SET ARITHABORT OFF 
GO
ALTER DATABASE [homecook] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [homecook] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [homecook] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [homecook] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [homecook] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [homecook] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [homecook] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [homecook] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [homecook] SET ALLOW_SNAPSHOT_ISOLATION ON 
GO
ALTER DATABASE [homecook] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [homecook] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [homecook] SET  MULTI_USER 
GO
ALTER DATABASE [homecook] SET QUERY_STORE = ON
GO
ALTER DATABASE [homecook] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 7), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 10, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
/*** The scripts of database scoped configurations in Azure should be executed inside the target database connection. ***/
GO
-- ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 8;
GO
/****** Object:  FullTextCatalog [FullTextCatalog]    Script Date: 7/23/2021 4:33:55 PM ******/
CREATE FULLTEXT CATALOG [FullTextCatalog] WITH ACCENT_SENSITIVITY = ON
AS DEFAULT
GO
/****** Object:  UserDefinedFunction [dbo].[fn_diagramobjects]    Script Date: 7/23/2021 4:33:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE FUNCTION [dbo].[fn_diagramobjects]() 
	RETURNS int
	WITH EXECUTE AS N'dbo'
	AS
	BEGIN
		declare @id_upgraddiagrams		int
		declare @id_sysdiagrams			int
		declare @id_helpdiagrams		int
		declare @id_helpdiagramdefinition	int
		declare @id_creatediagram	int
		declare @id_renamediagram	int
		declare @id_alterdiagram 	int 
		declare @id_dropdiagram		int
		declare @InstalledObjects	int

		select @InstalledObjects = 0

		select 	@id_upgraddiagrams = object_id(N'dbo.sp_upgraddiagrams'),
			@id_sysdiagrams = object_id(N'dbo.sysdiagrams'),
			@id_helpdiagrams = object_id(N'dbo.sp_helpdiagrams'),
			@id_helpdiagramdefinition = object_id(N'dbo.sp_helpdiagramdefinition'),
			@id_creatediagram = object_id(N'dbo.sp_creatediagram'),
			@id_renamediagram = object_id(N'dbo.sp_renamediagram'),
			@id_alterdiagram = object_id(N'dbo.sp_alterdiagram'), 
			@id_dropdiagram = object_id(N'dbo.sp_dropdiagram')

		if @id_upgraddiagrams is not null
			select @InstalledObjects = @InstalledObjects + 1
		if @id_sysdiagrams is not null
			select @InstalledObjects = @InstalledObjects + 2
		if @id_helpdiagrams is not null
			select @InstalledObjects = @InstalledObjects + 4
		if @id_helpdiagramdefinition is not null
			select @InstalledObjects = @InstalledObjects + 8
		if @id_creatediagram is not null
			select @InstalledObjects = @InstalledObjects + 16
		if @id_renamediagram is not null
			select @InstalledObjects = @InstalledObjects + 32
		if @id_alterdiagram  is not null
			select @InstalledObjects = @InstalledObjects + 64
		if @id_dropdiagram is not null
			select @InstalledObjects = @InstalledObjects + 128
		
		return @InstalledObjects 
	END
	
GO
/****** Object:  Table [dbo].[Accounts]    Script Date: 7/23/2021 4:33:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accounts](
	[AccountID] [uniqueidentifier] NOT NULL,
	[Username] [varchar](20) NOT NULL,
	[Password] [varchar](100) NOT NULL,
	[RoleID] [int] NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[FullName] [nvarchar](50) NOT NULL,
	[DoB] [date] NOT NULL,
	[Address] [nvarchar](120) NOT NULL,
	[PhoneNumber] [varchar](12) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[SaltKey] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[AccountID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dishes]    Script Date: 7/23/2021 4:33:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dishes](
	[Servings] [varchar](50) NULL,
	[DishID] [uniqueidentifier] NOT NULL,
	[HomeCookID] [uniqueidentifier] NOT NULL,
	[DishName] [varchar](100) NOT NULL,
	[Price] [float] NOT NULL,
	[IsAvailable] [bit] NOT NULL,
	[Description] [varchar](max) NULL,
	[ImageURL] [varchar](500) NULL,
	[Rating] [float] NULL,
 CONSTRAINT [PK_Dishes] PRIMARY KEY CLUSTERED 
(
	[DishID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DishIn]    Script Date: 7/23/2021 4:33:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DishIn](
	[DishID] [uniqueidentifier] NOT NULL,
	[MenuID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_DishIn] PRIMARY KEY CLUSTERED 
(
	[DishID] ASC,
	[MenuID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Menus]    Script Date: 7/23/2021 4:33:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menus](
	[Servings] [varchar](50) NULL,
	[Price] [float] NULL,
	[MenuID] [uniqueidentifier] NOT NULL,
	[HomeCookID] [uniqueidentifier] NOT NULL,
	[MenuName] [varchar](50) NULL,
	[IsServing] [bit] NOT NULL,
	[HomeCookName] [varchar](50) NULL,
	[MenuURL] [varchar](500) NULL,
	[MenuDescription] [varchar](max) NULL,
	[Rating] [float] NULL,
 CONSTRAINT [PK_Menus] PRIMARY KEY CLUSTERED 
(
	[MenuID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderItems]    Script Date: 7/23/2021 4:33:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderItems](
	[ItemID] [uniqueidentifier] NOT NULL,
	[DishID] [uniqueidentifier] NOT NULL,
	[OrderID] [uniqueidentifier] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Note] [varchar](200) NULL,
	[TotalPrice] [float] NOT NULL,
 CONSTRAINT [PK_OrderItems] PRIMARY KEY CLUSTERED 
(
	[ItemID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderMenus]    Script Date: 7/23/2021 4:33:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderMenus](
	[OrderID] [uniqueidentifier] NOT NULL,
	[ItemID] [uniqueidentifier] NOT NULL,
	[MenuID] [uniqueidentifier] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Note] [varchar](max) NULL,
	[TotalPrice] [float] NOT NULL,
 CONSTRAINT [PK_OrderMenus] PRIMARY KEY CLUSTERED 
(
	[ItemID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 7/23/2021 4:33:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[IsMenu] [bit] NULL,
	[OrderID] [uniqueidentifier] NOT NULL,
	[HomeCookID] [uniqueidentifier] NOT NULL,
	[CustomerID] [uniqueidentifier] NOT NULL,
	[OrderDate] [datetime] NOT NULL,
	[TimeStamp] [datetime] NOT NULL,
	[StatusID] [int] NOT NULL,
	[ReceiverName] [varchar](50) NULL,
	[ReceiverPhone] [varchar](12) NOT NULL,
	[ReceiverAddress] [varchar](120) NULL,
	[Total] [float] NOT NULL,
	[Note] [varchar](120) NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 7/23/2021 4:33:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Status]    Script Date: 7/23/2021 4:33:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status](
	[StatusID] [int] IDENTITY(1,1) NOT NULL,
	[Status] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Status] PRIMARY KEY CLUSTERED 
(
	[StatusID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sysdiagrams]    Script Date: 7/23/2021 4:33:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sysdiagrams](
	[name] [sysname] NOT NULL,
	[principal_id] [int] NOT NULL,
	[diagram_id] [int] IDENTITY(1,1) NOT NULL,
	[version] [int] NULL,
	[definition] [varbinary](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[diagram_id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UK_principal_name] UNIQUE NONCLUSTERED 
(
	[principal_id] ASC,
	[name] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Accounts] ADD  CONSTRAINT [DF_Accounts_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Dishes] ADD  CONSTRAINT [DF_Dishes_IsAvailable]  DEFAULT ((1)) FOR [IsAvailable]
GO
ALTER TABLE [dbo].[Menus] ADD  CONSTRAINT [DF_Menus_IsServing]  DEFAULT ((1)) FOR [IsServing]
GO
ALTER TABLE [dbo].[Orders] ADD  CONSTRAINT [DF_Orders_StatusID]  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [dbo].[Accounts]  WITH CHECK ADD  CONSTRAINT [FK_Account_Roles] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Roles] ([RoleID])
GO
ALTER TABLE [dbo].[Accounts] CHECK CONSTRAINT [FK_Account_Roles]
GO
ALTER TABLE [dbo].[Dishes]  WITH CHECK ADD  CONSTRAINT [FK_Dishes_Account] FOREIGN KEY([HomeCookID])
REFERENCES [dbo].[Accounts] ([AccountID])
GO
ALTER TABLE [dbo].[Dishes] CHECK CONSTRAINT [FK_Dishes_Account]
GO
ALTER TABLE [dbo].[DishIn]  WITH CHECK ADD  CONSTRAINT [FK_DishIn_DishIn] FOREIGN KEY([DishID])
REFERENCES [dbo].[Dishes] ([DishID])
GO
ALTER TABLE [dbo].[DishIn] CHECK CONSTRAINT [FK_DishIn_DishIn]
GO
ALTER TABLE [dbo].[DishIn]  WITH CHECK ADD  CONSTRAINT [FK_DishIn_Menus] FOREIGN KEY([MenuID])
REFERENCES [dbo].[Menus] ([MenuID])
GO
ALTER TABLE [dbo].[DishIn] CHECK CONSTRAINT [FK_DishIn_Menus]
GO
ALTER TABLE [dbo].[Menus]  WITH CHECK ADD  CONSTRAINT [FK_Menus_Account] FOREIGN KEY([HomeCookID])
REFERENCES [dbo].[Accounts] ([AccountID])
GO
ALTER TABLE [dbo].[Menus] CHECK CONSTRAINT [FK_Menus_Account]
GO
ALTER TABLE [dbo].[OrderItems]  WITH CHECK ADD  CONSTRAINT [FK_OrderItems_Dishes] FOREIGN KEY([DishID])
REFERENCES [dbo].[Dishes] ([DishID])
GO
ALTER TABLE [dbo].[OrderItems] CHECK CONSTRAINT [FK_OrderItems_Dishes]
GO
ALTER TABLE [dbo].[OrderItems]  WITH CHECK ADD  CONSTRAINT [FK_OrderItems_Orders] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([OrderID])
GO
ALTER TABLE [dbo].[OrderItems] CHECK CONSTRAINT [FK_OrderItems_Orders]
GO
ALTER TABLE [dbo].[OrderMenus]  WITH CHECK ADD  CONSTRAINT [FK_OrderMenus_Menus] FOREIGN KEY([MenuID])
REFERENCES [dbo].[Menus] ([MenuID])
GO
ALTER TABLE [dbo].[OrderMenus] CHECK CONSTRAINT [FK_OrderMenus_Menus]
GO
ALTER TABLE [dbo].[OrderMenus]  WITH CHECK ADD  CONSTRAINT [FK_OrderMenus_Orders] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([OrderID])
GO
ALTER TABLE [dbo].[OrderMenus] CHECK CONSTRAINT [FK_OrderMenus_Orders]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Customer] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Accounts] ([AccountID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Customer]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_HomeCook] FOREIGN KEY([HomeCookID])
REFERENCES [dbo].[Accounts] ([AccountID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_HomeCook]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Status] FOREIGN KEY([StatusID])
REFERENCES [dbo].[Status] ([StatusID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Status]
GO
ALTER TABLE [dbo].[Roles]  WITH CHECK ADD  CONSTRAINT [Constraints_RoleID] CHECK  (([RoleID]>(0)))
GO
ALTER TABLE [dbo].[Roles] CHECK CONSTRAINT [Constraints_RoleID]
GO
/****** Object:  StoredProcedure [dbo].[addDishToMenu]    Script Date: 7/23/2021 4:33:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[addDishToMenu]
(
    -- Add the parameters for the stored procedure here
    @MenuID varchar(50),
	@DishID varchar(50)
)
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON

    -- Insert statements for procedure here
	 INSERT INTO DishIn (MenuID, DishID)
	 VALUES (CAST(@MenuID as uniqueidentifier), CAST(@DishID as uniqueidentifier))   
END
GO
/****** Object:  StoredProcedure [dbo].[changeDishStatus]    Script Date: 7/23/2021 4:33:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[changeDishStatus]
(
    -- Add the parameters for the stored procedure here
	@DishID varchar(50),
	@Status bit
)
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON

    -- Insert statements for procedure here
	 UPDATE Dishes 
	 SET IsAvailable = @Status
	 WHERE DishID = CAST(@DishID as uniqueidentifier)
END
GO
/****** Object:  StoredProcedure [dbo].[changeHomeCookStatus]    Script Date: 7/23/2021 4:33:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      <Author, , Name>
-- Create Date: <Create Date, , >
-- Description: <Description, , >
-- =============================================
CREATE PROCEDURE [dbo].[changeHomeCookStatus]
(
    -- Add the parameters for the stored procedure here
    @IsActive bit,
	@UserID varchar(50)
)
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON

    -- Insert statements for procedure here
	 UPDATE Accounts
	 SET IsActive = @IsActive
	 WHERE AccountID = CAST(@UserID as uniqueidentifier)
END
GO
/****** Object:  StoredProcedure [dbo].[changeMenuName]    Script Date: 7/23/2021 4:33:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[changeMenuName]
(
    -- Add the parameters for the stored procedure here
    @MenuID varchar(50),
	@MenuName varchar(50)
)
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON

    -- Insert statements for procedure here
	 UPDATE Menus 
	 SET MenuName = @MenuName
	 WHERE MenuID = CAST(@MenuID as uniqueidentifier)
END
GO
/****** Object:  StoredProcedure [dbo].[changeMenuStatus]    Script Date: 7/23/2021 4:33:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[changeMenuStatus]
(
    -- Add the parameters for the stored procedure here
    @MenuID varchar(50),
	@IsServing bit
)
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON

    -- Insert statements for procedure here
	 UPDATE Menus 
	 SET IsServing = @IsServing
	 WHERE MenuID = CAST(@MenuID as uniqueidentifier)
END
GO
/****** Object:  StoredProcedure [dbo].[changeOrderStatus]    Script Date: 7/23/2021 4:33:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[changeOrderStatus]
(
	@StatusID int,
	@OrderID varchar(50)
)
AS 
BEGIN
	SET NOCOUNT ON

	UPDATE Orders
	SET StatusID = @StatusID
	WHERE OrderID = CAST(@OrderID as uniqueidentifier)
END 
GO
/****** Object:  StoredProcedure [dbo].[countAllDishes]    Script Date: 7/23/2021 4:33:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[countAllDishes]
AS
select count(*) as totalDishes from Dishes
GO;
GO
/****** Object:  StoredProcedure [dbo].[countAllDishesByStatus]    Script Date: 7/23/2021 4:33:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[countAllDishesByStatus]
(
@searchPhrase varchar(50),
	@Status bit
	)
AS
BEGIN
    SET NOCOUNT ON
select count(*) as totalDishes from Dishes as d
where d.IsAvailable = @Status and d.DishName LIKE '%'+@searchPhrase+'%'
END
GO
/****** Object:  StoredProcedure [dbo].[countAllOrderByStatus]    Script Date: 7/23/2021 4:33:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      <Author, , Name>
-- Create Date: <Create Date, , >
-- Description: <Description, , >
-- =============================================
CREATE PROCEDURE [dbo].[countAllOrderByStatus]
(
    -- Add the parameters for the stored procedure here
    @StatusID int,
	@searchPhrase varchar(50)
)
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON

    -- Insert statements for procedure here
   SELECT count(*) as Total from Orders as o
	where o.StatusID= @StatusID and o.ReceiverPhone LIKE '%'+@searchPhrase+'%'
END
GO
/****** Object:  StoredProcedure [dbo].[countByRole]    Script Date: 7/23/2021 4:33:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      <Author, , Name>
-- Create Date: <Create Date, , >
-- Description: <Description, , >
-- =============================================
CREATE PROCEDURE [dbo].[countByRole]
(
 @RoleID int
)
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON

    -- Insert statements for procedure here
    SELECT COUNT(*) as total
	FROM Accounts a
	where a.RoleID = @RoleID
END
GO
/****** Object:  StoredProcedure [dbo].[countCustomerOrderByIDAndStatus]    Script Date: 7/23/2021 4:33:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      <Author, , Name>
-- Create Date: <Create Date, , >
-- Description: <Description, , >
-- =============================================
CREATE PROCEDURE [dbo].[countCustomerOrderByIDAndStatus]
(
   @CustomerID varchar(50),
   @StatusID int ,
   @searchPhrase varchar(50)
)
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON

    -- Insert statements for procedure here
    
	SELECT count(*) as Total from Orders as o
	where o.CustomerID = @CustomerID and o.StatusID= @StatusID and o.OrderID LIKE '%'+@searchPhrase+'%'
END
GO
/****** Object:  StoredProcedure [dbo].[countHomeCookOrderByIDAndStatus]    Script Date: 7/23/2021 4:33:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      <Author, , Name>
-- Create Date: <Create Date, , >
-- Description: <Description, , >
-- =============================================
CREATE PROCEDURE [dbo].[countHomeCookOrderByIDAndStatus]
(
   @HomeCookID varchar(50),
   @StatusID int,
   @searchPhrase varchar(50)

)
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON

    -- Insert statements for procedure here
    
	SELECT count(*) as Total from Orders as o
	where o.HomeCookID= @HomeCookID and o.StatusID= @StatusID and o.ReceiverPhone LIKE '%'+@searchPhrase+'%'
END
GO
/****** Object:  StoredProcedure [dbo].[countOrderByDateRangeAndStatus]    Script Date: 7/23/2021 4:33:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      <Author, , Name>
-- Create Date: <Create Date, , >
-- Description: <Description, , >
-- =============================================
CREATE PROCEDURE [dbo].[countOrderByDateRangeAndStatus]
(
    -- Add the parameters for the stored procedure here
  @FromDate datetime,
  @ToDate datetime,
  @StatusID int
)
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON

    -- Insert statements for procedure here
   SELECT count(*) as Total from Orders as o
	where o.OrderDate >= @FromDate and o.OrderDate <= @ToDate and o.StatusID= @StatusID
END
GO
/****** Object:  StoredProcedure [dbo].[countOrderItem]    Script Date: 7/23/2021 4:33:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      <Author, , Name>
-- Create Date: <Create Date, , >
-- Description: <Description, , >
-- =============================================
CREATE PROCEDURE [dbo].[countOrderItem]
(
    -- Add the parameters for the stored procedure here
   @OrderID varchar(50)
)
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON

    -- Insert statements for procedure here
    SELECT Count(*) as Total from OrderItems i
	where i.OrderID = @OrderID
END
GO
/****** Object:  StoredProcedure [dbo].[countSearchAccount]    Script Date: 7/23/2021 4:33:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      <Author, , Name>
-- Create Date: <Create Date, , >
-- Description: <Description, , >
-- =============================================
CREATE PROCEDURE [dbo].[countSearchAccount]
(
    -- Add the parameters for the stored procedure here
    @searchPhrase varchar(50),
	@Role int
)
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON

    -- Insert statements for procedure here
    select Count(a.Username) as total
	from Accounts a
	where a.Username LIKE '%'+@searchPhrase+'%' and RoleID = @Role
END
GO
/****** Object:  StoredProcedure [dbo].[countSearchMenu]    Script Date: 7/23/2021 4:33:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      <Author, , Name>
-- Create Date: <Create Date, , >
-- Description: <Description, , >
-- =============================================
CREATE PROCEDURE [dbo].[countSearchMenu]
(
	@searchPhrase varchar(50)
)

AS
BEGIN

    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SELECT COUNT(m.MenuName) as total
	FROM Menus m
	WHERE m.MenuName LIKE '%'+@searchPhrase+'%'
END

GO
/****** Object:  StoredProcedure [dbo].[countSearchOrder]    Script Date: 7/23/2021 4:33:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      <Author, , Name>
-- Create Date: <Create Date, , >
-- Description: <Description, , >
-- =============================================
CREATE PROCEDURE [dbo].[countSearchOrder]
(
    -- Add the parameters for the stored procedure here
   @searchPhrase varchar(50),
   @StatusID int
)
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON

    -- Insert statements for procedure here
    SELECT count(o.OrderID) as total
	from Orders o 
	where o.StatusID= @StatusID and o.OrderID LIKE '%'+@searchPhrase+'%' or o.ReceiverPhone LIKE '%'+@searchPhrase+'%'
END
GO
/****** Object:  StoredProcedure [dbo].[createAccount]    Script Date: 7/23/2021 4:33:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      <Author, , Name>
-- Create Date: <Create Date, , >
-- Description: <Description, , >
-- =============================================
CREATE PROCEDURE [dbo].[createAccount]
(
    -- Add the parameters for the stored procedure here
    @Username varchar(50),
	@Password varchar(100),
	@RoleID int,
	@Email varchar(50),
	@FullName nvarchar(50),
	@Date Date,
	@Address nvarchar(100),
	@PhoneNumber varchar(10),
	@SaltKey varchar(20)
)
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON

    -- Insert statements for procedure here
	 INSERT INTO Accounts (AccountID, Username, Password, FullName, Address, DoB, Email, PhoneNumber, RoleID, SaltKey) 
	 VALUES (NEWID(), @Username, @Password, @FullName, @Address, @Date, @Email, @PhoneNumber, @RoleID, @SaltKey)   
END
GO
/****** Object:  StoredProcedure [dbo].[createDish]    Script Date: 7/23/2021 4:33:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[createDish]
(
    -- Add the parameters for the stored procedure here
    @HomeCookID varchar(50),
	@DishName varchar(50),
	@Price float,
	@IsAvailable bit,
	@Description varchar(300),
	@ImageURL varchar(200),
	@Servings varchar(50)
)
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON

    -- Insert statements for procedure here
	 INSERT INTO Dishes (DishID, Description, DishName, HomeCookID, ImageURL, IsAvailable, Price, Servings, Rating)
	 OUTPUT CAST(INSERTED.DishID AS varchar(50)) as DishID
	 VALUES (NEWID(), @Description, @DishName, CAST(@HomeCookID as uniqueidentifier), @ImageURL, @IsAvailable, @Price, @Servings, 5)

END
GO
/****** Object:  StoredProcedure [dbo].[createMenu]    Script Date: 7/23/2021 4:33:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[createMenu]
(
    -- Add the parameters for the stored procedure here
    @HomeCookID varchar(50),
	@MenuName varchar(50),
	@IsServing bit,
	@HomeCookName varchar(50),
	@Servings varchar(50), 
	@Price float,
	@MenuURL varchar(200),
	@MenuDescription varchar(200)
)
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON

    -- Insert statements for procedure here
	 INSERT INTO Menus (MenuID,HomeCookID, HomeCookName, IsServing, MenuName,MenuURL,MenuDescription, Servings, Price,Rating)
	 OUTPUT CAST(INSERTED.MenuID as varchar(50)) as MenuID
	 VALUES (NEWID(), CAST(@HomeCookID as uniqueidentifier), @HomeCookName, @IsServing, @MenuName,@MenuURL,@MenuDescription, @Servings, @Price,5)   
END
GO
/****** Object:  StoredProcedure [dbo].[createOrder]    Script Date: 7/23/2021 4:33:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[createOrder]
(
    -- Add the parameters for the stored procedure here
    @HomeCookID varchar(50),
	@CustomerID varchar(50),
	@TimeStamp DateTime,
	@OrderDate DateTime,
	@ReceiverPhone varchar(50),
	@ReceiverAddress varchar(100),
	@ReceiverName varchar(50),
	@Total float,
	@Note varchar(300),
	@IsMenu bit
)
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON

    -- Insert statements for procedure here
	 INSERT INTO Orders (OrderID ,CustomerID, HomeCookID, Note, ReceiverAddress, ReceiverName, ReceiverPhone, TimeStamp, OrderDate, Total, IsMenu)
	 OUTPUT INSERTED.OrderID
	 VALUES (NEWID(), CAST(@CustomerID as uniqueidentifier), CAST(@HomeCookID as uniqueidentifier), @Note, @ReceiverAddress, @ReceiverName, @ReceiverPhone, @TimeStamp,@OrderDate ,@Total, @IsMenu)   
END
GO
/****** Object:  StoredProcedure [dbo].[deleteDish]    Script Date: 7/23/2021 4:33:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[deleteDish]
(
    -- Add the parameters for the stored procedure here
	@DishID varchar(50)
)
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON

    -- Insert statements for procedure here
	 DELETE FROM Dishes
	 WHERE DishID = CAST(@DishID as uniqueidentifier)
END
GO
/****** Object:  StoredProcedure [dbo].[deleteDishFromMenu]    Script Date: 7/23/2021 4:33:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[deleteDishFromMenu]
(
    -- Add the parameters for the stored procedure here
    @MenuID varchar(50),
	@DishID varchar(50)
)
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON

    -- Insert statements for procedure here
	 DELETE FROM DishIn
	 WHERE DishID = CAST(@DishID as uniqueidentifier) AND MenuID = CAST(@MenuID as uniqueidentifier)   
END
GO
/****** Object:  StoredProcedure [dbo].[deleteMenu]    Script Date: 7/23/2021 4:33:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[deleteMenu]
(
    -- Add the parameters for the stored procedure here
    @MenuID varchar(50)
)
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON

    -- Insert statements for procedure here
	 DELETE FROM Menus 
	 WHERE MenuID = CAST(@MenuID as uniqueidentifier)
END
GO
/****** Object:  StoredProcedure [dbo].[deleteOrder]    Script Date: 7/23/2021 4:33:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[deleteOrder]
(
    -- Add the parameters for the stored procedure here
    @OrderID varchar(50)
)
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON

    -- Insert statements for procedure here
    DELETE FROM Orders WHERE OrderID = @OrderID
END
GO
/****** Object:  StoredProcedure [dbo].[getAccountByID]    Script Date: 7/23/2021 4:33:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      <Author, , Name>
-- Create Date: <Create Date, , >
-- Description: <Description, , >
-- =============================================
CREATE PROCEDURE [dbo].[getAccountByID]
(
    -- Add the parameters for the stored procedure here
	@UserID varchar(50)
)
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON

    -- Insert statements for procedure here
	 SELECT CAST(a.AccountID as varchar(50)) as AccountID, a.Address, a.DoB, a.Email, a.FullName, a.IsActive, a.Password, a.PhoneNumber, a.RoleID, a.Username, a.SaltKey
	 FROM Accounts a 
	 WHERE a.AccountID = CAST(@UserID as uniqueidentifier)
END
GO
/****** Object:  StoredProcedure [dbo].[getAccountByRoleID]    Script Date: 7/23/2021 4:33:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      <Author, , Name>
-- Create Date: <Create Date, , >
-- Description: <Description, , >
-- =============================================
CREATE PROCEDURE [dbo].[getAccountByRoleID]
(
    -- Add the parameters for the stored procedure here
    @Page int,
    @RoleID int
)
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON

    -- Insert statements for procedure here
    SELECT CAST(a.AccountID as varchar(50)) AS AccountID, a.Username, a.Password, a.RoleID, a.Email, a.FullName, a.DoB, a.Address, a.PhoneNumber, a.IsActive, a.SaltKey
	FROM Accounts a
	WHERE a.RoleID = @RoleID
	ORDER BY a.FullName
	OFFSET (@page-1)*15 ROWS
	FETCH NEXT 15 ROWS ONLY;
END
GO
/****** Object:  StoredProcedure [dbo].[getAccountByUName]    Script Date: 7/23/2021 4:33:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getAccountByUName]
(
	@Username varchar(50)
)
AS 
BEGIN
	SET NOCOUNT ON

	SELECT a.Address, a.DoB, a.Email, a.FullName, a.IsActive, a.Password, a.PhoneNumber, a.RoleID, CAST(a.AccountID as varchar(50)) AS AccountID, a.Username, a.SaltKey
	FROM Accounts a
	WHERE a.Username = @Username
END 
GO
/****** Object:  StoredProcedure [dbo].[getAccountCount]    Script Date: 7/23/2021 4:33:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      <Author, , Name>
-- Create Date: <Create Date, , >
-- Description: <Description, , >
-- =============================================
CREATE PROCEDURE [dbo].[getAccountCount]

AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SELECT COUNT(AccountID) AS Total
	FROM Accounts
END
GO
/****** Object:  StoredProcedure [dbo].[getAccountRoleCount]    Script Date: 7/23/2021 4:33:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      <Author, , Name>
-- Create Date: <Create Date, , >
-- Description: <Description, , >
-- =============================================
CREATE PROCEDURE [dbo].[getAccountRoleCount]

AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SELECT COUNT(AccountID) AS Total, RoleID
	FROM Accounts
	GROUP BY RoleID
END
GO
/****** Object:  StoredProcedure [dbo].[getActiveMenu]    Script Date: 7/23/2021 4:33:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      <Author, , Name>
-- Create Date: <Create Date, , >
-- Description: <Description, , >
-- =============================================
CREATE PROCEDURE [dbo].[getActiveMenu]
(
    -- Add the parameters for the stored procedure here
    @Page int
)
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON

    -- Insert statements for procedure here
   SELECT m.HomeCookName, m.MenuName, CAST(m.MenuID as varchar(50)) AS MenuID,m.HomeCookID,m.MenuURL,m.MenuDescription, m.Rating, m.Price, m.Servings
	 FROM Menus m
	 WHERE m.IsServing = 'True'
	 ORDER BY m.Rating ASC
	 OFFSET (@Page-1)*12 ROWS
	 FETCH NEXT 3 ROWS ONLY
END
GO
/****** Object:  StoredProcedure [dbo].[getAllDishesByHomeCook]    Script Date: 7/23/2021 4:33:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getAllDishesByHomeCook]
(
    -- Add the parameters for the stored procedure here
    @HomeCookID varchar(50),
	@Page int
)
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON

    -- Insert statements for procedure here
	 SELECT CAST(d.DishID AS varchar(50)) AS DishID, d.DishName, CAST(d.HomeCookID as varchar(50)) AS HomeCookID, 
			d.Price, d.ImageURL, d.Description, d.DishID, d.IsAvailable, d.Servings, d.Rating
	 FROM Dishes d
	 WHERE d.HomeCookID = CAST(@HomeCookID as uniqueidentifier)
	 ORDER BY d.DishName
	 OFFSET (@Page-1)*15 ROWS
	 FETCH NEXT 15 ROWS ONLY
END
GO
/****** Object:  StoredProcedure [dbo].[getAllDishesByStatus]    Script Date: 7/23/2021 4:33:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[getAllDishesByStatus]
(
    -- Add the parameters for the stored procedure here
    @Status bit,
	@Page int,
	@searchPhrase varchar(50)
)
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON
	DECLARE @Input varchar(50)
	SET @Input= '%' + @searchPhrase + '%'
    -- Insert statements for procedure here
	 SELECT d.DishName, CAST(d.HomeCookID as varchar(50)) AS HomeCookID, d.Price, d.ImageURL, 
			d.Description, CAST(d.DishID as varchar(50)) AS DishID, d.IsAvailable, d.Servings, d.Rating
	 FROM Dishes d
	 WHERE d.IsAvailable = @Status and d.DishName LIKE @Input
	 ORDER BY d.Rating DESC
	 OFFSET (@Page-1)*6 ROWS
	 FETCH NEXT 6 ROWS ONLY
END
GO
/****** Object:  StoredProcedure [dbo].[getAllDishesInMenu]    Script Date: 7/23/2021 4:33:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getAllDishesInMenu]
(
    -- Add the parameters for the stored procedure here
    @MenuID varchar(50)

)
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON

    -- Insert statements for procedure here
	 SELECT CAST(d.DishID as varchar(50)) AS DishID
	 FROM DishIn d
	 WHERE d.MenuID = CAST(@MenuID as uniqueidentifier)
	 ORDER BY CAST(d.DishID as varchar(50))
	
END
GO
/****** Object:  StoredProcedure [dbo].[getAllOrder]    Script Date: 7/23/2021 4:33:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- GET ALL ORDER --
CREATE PROCEDURE [dbo].[getAllOrder]
(
@searchPhrase varchar(50),
@Page int
)
AS 
BEGIN
	SET NOCOUNT ON
	DECLARE @Input varchar(50)
	SET @Input= '%' + @searchPhrase + '%'
	SELECT CAST(o.CustomerID as varchar(50)) AS CustomerID, CAST(o.HomeCookID as varchar(50)) AS HomeCookID, o.Note, 
			o.ReceiverAddress, CAST(o.OrderID as varchar(50)) AS OrderID, o.ReceiverName, o.ReceiverPhone,
			o.StatusID, o.TimeStamp, o.OrderDate ,o.Total, o.IsMenu
	FROM Orders o 
	where o.ReceiverPhone LIKE @Input or o.OrderID LIKE @Input
	ORDER BY o.OrderDate DESC
	OFFSET (@Page -1)*15 ROWS 
	FETCH NEXT 15 ROWS ONLY
END 
GO
/****** Object:  StoredProcedure [dbo].[getCustomerCount]    Script Date: 7/23/2021 4:33:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      <Author, , Name>
-- Create Date: <Create Date, , >
-- Description: <Description, , >
-- =============================================
CREATE PROCEDURE [dbo].[getCustomerCount]

AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SELECT COUNT(AccountID) AS Total, RoleID
	FROM Accounts
	GROUP BY RoleID
	HAVING RoleID = 1
END
GO
/****** Object:  StoredProcedure [dbo].[getDishByID]    Script Date: 7/23/2021 4:33:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getDishByID]
(
    -- Add the parameters for the stored procedure here
    @DishID varchar(50)
)
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON

    -- Insert statements for procedure here
	 SELECT d.DishName, CAST(d.HomeCookID as varchar(50)) AS HomeCookID, d.Price, d.ImageURL,
			d.Description, CAST(d.DishID as varchar(50)) AS DishID, d.IsAvailable, d.Servings, d.Rating
	 FROM Dishes d
	 WHERE d.DishID = CAST(@DishID as uniqueidentifier)
END
GO
/****** Object:  StoredProcedure [dbo].[getFirstSevenOrder]    Script Date: 7/23/2021 4:33:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      <Author, , Name>
-- Create Date: <Create Date, , >
-- Description: <Description, , >
-- =============================================
CREATE PROCEDURE [dbo].[getFirstSevenOrder]
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON

    -- Insert statements for procedure here
    SELECT TOP 5 
	o.ReceiverAddress, CAST(o.OrderID as varchar(50)) AS OrderID, o.ReceiverName, o.ReceiverPhone,
			o.StatusID, o.Total, o.IsMenu	
	FROM Orders o  ORDER BY o.TimeStamp  
END
GO
/****** Object:  StoredProcedure [dbo].[getHomecookCount]    Script Date: 7/23/2021 4:33:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      <Author, , Name>
-- Create Date: <Create Date, , >
-- Description: <Description, , >
-- =============================================
CREATE PROCEDURE [dbo].[getHomecookCount]

AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SELECT COUNT(AccountID) AS Total, RoleID
	FROM Accounts
	GROUP BY RoleID
	HAVING RoleID = 2
END
GO
/****** Object:  StoredProcedure [dbo].[getListItemByOrderID]    Script Date: 7/23/2021 4:33:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getListItemByOrderID]
(
    -- Add the parameters for the stored procedure here
    @OrderID varchar(50),
	@Page int
)
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON

    -- Insert statements for procedure here
	 SELECT CAST(i.ItemID as varchar(50)) AS ItemID, i.DishID, CAST(i.OrderID as varchar(50)) AS OrderID, i.Quantity, 
			i.TotalPrice, i.Note, d.DishName, CAST(d.HomeCookID as varchar(50)) AS HomeCookID, d.Price, d.ImageURL, d.Rating
	 FROM Dishes d, OrderItems i
	 WHERE i.DishID = d.DishID AND i.OrderID = CAST(@OrderID as uniqueidentifier)
	 ORDER BY d.DishName
	 OFFSET (@Page-1)*15 ROWS
	 FETCH NEXT 15 ROWS ONLY
END
GO
/****** Object:  StoredProcedure [dbo].[getMenuByDishID]    Script Date: 7/23/2021 4:33:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getMenuByDishID]
(
    -- Add the parameters for the stored procedure here
    @DishID varchar(50)
)
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON

    -- Insert statements for procedure here
    SELECT m.MenuID, m.MenuName
	FROM DishIn d, Menus m
	WHERE d.MenuID = m.MenuID AND d.DishID = @DishID AND m.IsServing = 'True'
END
GO
/****** Object:  StoredProcedure [dbo].[getMenuByHomeCookID]    Script Date: 7/23/2021 4:33:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getMenuByHomeCookID]
(
    -- Add the parameters for the stored procedure here
    @HomeCookID varchar(50)
)
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON

    -- Insert statements for procedure here
	 SELECT m.HomeCookName, m.MenuName, m.IsServing, CAST(m.MenuID as varchar(50)) AS MenuID, 
			CAST(m.HomeCookID as varchar(50)) AS HomeCookID,m.Rating,m.MenuURL,m.MenuDescription, 
			m.Servings, m.Price
	 FROM Menus m
	 WHERE m.HomeCookID = CAST(@HomeCookID as uniqueidentifier)
	 ORDER BY m.MenuName
END
GO
/****** Object:  StoredProcedure [dbo].[getMenuByID]    Script Date: 7/23/2021 4:33:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[getMenuByID]
(
    -- Add the parameters for the stored procedure here
    @MenuID varchar(50)
)
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON

    -- Insert statements for procedure here
	 SELECT CAST(m.HomeCookName as varchar(50)) AS HomeCookName, 
			m.Rating, m.MenuName, m.IsServing, CAST(m.HomeCookID as varchar(50)) AS HomeCookID,
			m.MenuURL, m.MenuDescription, m.Servings, m.Price
	 FROM Menus m
	 WHERE m.MenuID = CAST(@MenuID as uniqueidentifier)
END
GO
/****** Object:  StoredProcedure [dbo].[getMenuByStatus]    Script Date: 7/23/2021 4:33:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      <Author, , Name>
-- Create Date: <Create Date, , >
-- Description: <Description, , >
-- =============================================
CREATE PROCEDURE [dbo].[getMenuByStatus]
(
    -- Add the parameters for the stored procedure here
	@IsServing bit,
    @Page int
)
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON

    -- Insert statements for procedure here
	SELECT m.HomeCookName, m.MenuName, CAST(m.MenuID as varchar(50)) AS MenuID, m.IsServing,
		   m.HomeCookID, m.Rating, m.Servings, m.Price
	FROM Menus m
	WHERE m.IsServing = @IsServing
	ORDER BY m.Rating DESC
	OFFSET (@Page-1)*12 ROWS
	FETCH NEXT 12 ROWS ONLY
END
GO
/****** Object:  StoredProcedure [dbo].[getOrderByCustomerID]    Script Date: 7/23/2021 4:33:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getOrderByCustomerID]
(
	@CustomerID varchar(50),
	@Page int
)
AS 
BEGIN
	SET NOCOUNT ON

	SELECT CAST(o.CustomerID as varchar(50)) AS CustomerID, CAST(o.HomeCookID as varchar(50)) AS HomeCookID, o.Note, 
		   o.ReceiverAddress, CAST(o.OrderID as varchar(50)) AS OrderID, 
		   o.ReceiverName, o.ReceiverPhone,
		   o.StatusID, o.TimeStamp, o.OrderDate ,o.Total, o.IsMenu
	FROM Orders o
	WHERE o.CustomerID = CAST(@CustomerID as uniqueidentifier)
	ORDER BY o.TimeStamp DESC
	OFFSET (@Page -1)*15 ROWS 
	FETCH NEXT 15 ROWS ONLY
END 
GO
/****** Object:  StoredProcedure [dbo].[getOrderByCustomerIDAndStatus]    Script Date: 7/23/2021 4:33:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      <Author, , Name>
-- Create Date: <Create Date, , >
-- Description: <Description, , >
-- =============================================
CREATE PROCEDURE [dbo].[getOrderByCustomerIDAndStatus]
(
   @CustomerID varchar(50),
   @StatusID int,
   @Page int,
	@searchPhrase varchar(50)
)
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
   	SET NOCOUNT ON
	DECLARE @Input varchar(50)
	SET @Input= '%' + @searchPhrase + '%'
	SELECT CAST(o.CustomerID as varchar(50)) AS CustomerID, CAST(o.HomeCookID as varchar(50)) AS HomeCookID, o.Note, 
			o.ReceiverAddress, CAST(o.OrderID as varchar(50)) AS OrderID, o.ReceiverName, o.ReceiverPhone,
			o.StatusID, o.TimeStamp, o.OrderDate ,o.Total, o.IsMenu
	FROM Orders o
	WHERE o.CustomerID = CAST(@CustomerID as uniqueidentifier) and o.StatusID= @StatusID and (o.ReceiverPhone LIKE '%'+@searchPhrase+'%')
	ORDER BY o.OrderDate DESC
	OFFSET (@Page -1)*15 ROWS 
	FETCH NEXT 15 ROWS ONLY
END
GO
/****** Object:  StoredProcedure [dbo].[getOrderByHomeCookID]    Script Date: 7/23/2021 4:33:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- GET ORDER BY HOMECOOK ID--
CREATE PROCEDURE [dbo].[getOrderByHomeCookID]
(
	@HomeCookID varchar(50),
	@Page int,
	@searchPhrase varchar(50)
)
AS 
BEGIN
	SET NOCOUNT ON
	DECLARE @Input varchar(50)
	SET @Input= '%' + @searchPhrase + '%'
	SELECT  o.Note, 
			o.ReceiverAddress, CAST(o.OrderID as varchar(50)) AS OrderID, o.ReceiverName, o.ReceiverPhone,
			o.StatusID, o.TimeStamp, o.OrderDate, o.Total, o.IsMenu
	FROM Orders o
	WHERE o.HomeCookID = CAST(@HomeCookID as uniqueidentifier) and o.ReceiverPhone LIKE @Input
	ORDER BY o.TimeStamp DESC
	OFFSET (@Page-1)*15	ROWS
	FETCH NEXT 15 ROWS ONLY
END 
GO
/****** Object:  StoredProcedure [dbo].[getOrderByHomeCookIDAndStatus]    Script Date: 7/23/2021 4:33:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      <Author, , Name>
-- Create Date: <Create Date, , >
-- Description: <Description, , >
-- =============================================
CREATE PROCEDURE [dbo].[getOrderByHomeCookIDAndStatus]
(
    -- Add the parameters for the stored procedure here
    @HomeCookID varchar(50),
	@StatusID int,
	@searchPhrase varchar(50),
	@Page int
)
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON
	DECLARE @Input varchar(50)
	SET @Input= '%' + @searchPhrase + '%'
    -- Insert statements for procedure here
   SELECT CAST(o.OrderID as varchar(50)) AS OrderID, o.TimeStamp, o.OrderDate, o.Note, o.StatusID, 
		  o.Total, o.HomeCookID, o.CustomerID, o.ReceiverAddress, o.ReceiverName, o.ReceiverPhone, o.IsMenu
	FROM Orders o
	WHERE o.HomeCookID = CAST(@HomeCookID as uniqueidentifier) and StatusID= @StatusID and o.ReceiverPhone LIKE '%'+@searchPhrase+'%'
	ORDER BY o.OrderDate DESC
	OFFSET (@Page-1)*6	ROWS
	FETCH NEXT 6 ROWS ONLY
END
GO
/****** Object:  StoredProcedure [dbo].[getOrderByID]    Script Date: 7/23/2021 4:33:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      <Author, , Name>
-- Create Date: <Create Date, , >
-- Description: <Description, , >
-- =============================================
CREATE PROCEDURE [dbo].[getOrderByID]
(
    -- Add the parameters for the stored procedure here
    @OrderID varchar(50)
)
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON

    -- Insert statements for procedure here
    SELECT CAST(o.CustomerID as varchar(50)) AS CustomerID, CAST(o.HomeCookID as varchar(50)) AS HomeCookID, o.Note, 
			o.ReceiverAddress, CAST(o.OrderID as varchar(50)) AS OrderID, o.ReceiverName, o.ReceiverPhone,
	o.StatusID, o.TimeStamp, o.OrderDate ,o.Total, o.IsMenu
	FROM Orders o
	WHERE o.OrderID = CAST(@OrderID as uniqueidentifier)
END
GO
/****** Object:  StoredProcedure [dbo].[getOrderByStatus]    Script Date: 7/23/2021 4:33:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      <Author, , Name>
-- Create Date: <Create Date, , >
-- Description: <Description, , >
-- =============================================
CREATE PROCEDURE [dbo].[getOrderByStatus]
(
    -- Add the parameters for the stored procedure here
	@Status int ,
    @Page int,
	@searchPhrase varchar(50)

)
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON
	DECLARE @Input varchar(50)
	SET @Input= '%' + @searchPhrase + '%'
    -- Insert statements for procedure here -- 
    SELECT o.*
	FROM Orders o
	WHERE o.StatusID = @Status and (o.OrderID LIKE @Input or o.ReceiverPhone LIKE @Input) 
	ORDER BY o.OrderDate DESC
	OFFSET (@Page -1) * 15 ROWS
	FETCH NEXT 15 ROWS ONLY
END
GO
/****** Object:  StoredProcedure [dbo].[getOrderByTimeRange]    Script Date: 7/23/2021 4:33:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getOrderByTimeRange]
(
	@FromDate varchar(50),
	@ToDate varchar(50),
	@Page int
)
AS 
BEGIN
	SET NOCOUNT ON

	SELECT o.*
	FROM Orders o
	WHERE o.OrderDate BETWEEN @FromDate AND @ToDate
	ORDER BY o.OrderDate DESC
	OFFSET (@Page - 1)*15 ROWS
	FETCH NEXT 15 ROWS ONLY
END 
GO
/****** Object:  StoredProcedure [dbo].[getOrderByTimeRangeAndStatus]    Script Date: 7/23/2021 4:33:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      <Author, , Name>
-- Create Date: <Create Date, , >
-- Description: <Description, , >
-- =============================================
CREATE PROCEDURE [dbo].[getOrderByTimeRangeAndStatus]
(
    -- Add the parameters for the stored procedure here
    @FromDate DateTime,
	@ToDate Datetime,
	@StatusID int,
	@Page int
)
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON

    -- Insert statements for procedure here
    SELECT *
	FROM Orders o
	WHERE o.OrderDate >= @FromDate AND o.OrderDate<= @ToDate and o.StatusID= @StatusID
	ORDER BY o.OrderDate DESC
	OFFSET (@Page - 1)*15 ROWS
	FETCH NEXT 15 ROWS ONLY
END
GO
/****** Object:  StoredProcedure [dbo].[getOrderByWeek]    Script Date: 7/23/2021 4:33:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      <Author, , Name>
-- Create Date: <Create Date, , >
-- Description: <Description, , >
-- =============================================
CREATE PROCEDURE [dbo].[getOrderByWeek]
(
    -- Add the parameters for the stored procedure here
    @HomecookID varchar(50)
)
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON

    -- Insert statements for procedure here
    SET DATEFIRST 1 -- Define beginning of week as Monday

	SELECT COUNT(o.orderID)
	FROM Orders o
	WHERE o.HomeCookID = @HomecookID
		AND o.OrderDate >= dateadd(day, 1-datepart(dw, getdate()), CONVERT(date,getdate())) 
		AND o.OrderDate <  dateadd(day, 8-datepart(dw, getdate()), CONVERT(date,getdate()))
	GROUP BY o.HomecookID
END
GO
/****** Object:  StoredProcedure [dbo].[getOrderByWeekAdmin]    Script Date: 7/23/2021 4:33:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      <Author, , Name>
-- Create Date: <Create Date, , >
-- Description: <Description, , >
-- =============================================
CREATE PROCEDURE [dbo].[getOrderByWeekAdmin]
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON

    -- Insert statements for procedure here
    SET DATEFIRST 1 -- Define beginning of week as Monday

	SELECT SUM(t.total)
	FROM	(SELECT COUNT(o.orderID) AS total
			FROM Orders o
			WHERE o.OrderDate >= dateadd(day, 1-datepart(dw, getdate()), CONVERT(date,getdate())) 
				  AND o.OrderDate <  dateadd(day, 8-datepart(dw, getdate()), CONVERT(date,getdate()))) t
END
GO
/****** Object:  StoredProcedure [dbo].[getOrderMenuByOrderID]    Script Date: 7/23/2021 4:33:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      <Author, , Name>
-- Create Date: <Create Date, , >
-- Description: <Description, , >
-- =============================================
CREATE PROCEDURE [dbo].[getOrderMenuByOrderID]

(
    @OrderID varchar(50),
	@Page int
)

AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON

    -- Insert statements for procedure here
    SET NOCOUNT ON

    -- Insert statements for procedure here
	 SELECT CAST(m.ItemID as varchar(50)) AS ItemID, m.MenuID, 
			CAST(m.OrderID as varchar(50)) AS OrderID, m.Quantity, 
			m.TotalPrice, m.Note, d.MenuDescription, d.MenuURL, d.Servings,
			d.Price, CAST(d.HomeCookID as varchar(50)) AS HomeCookID, 
			d.MenuName, d.Rating, d.HomeCookName
	 FROM Menus d, OrderMenus m
	 WHERE m.MenuID = d.MenuID AND m.OrderID = CAST(@OrderID as uniqueidentifier)
	 ORDER BY d.MenuName
	 OFFSET (@Page-1)*15 ROWS
	 FETCH NEXT 15 ROWS ONLY
END
GO
/****** Object:  StoredProcedure [dbo].[getTopMenu]    Script Date: 7/23/2021 4:33:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      <Author, , Name>
-- Create Date: <Create Date, , >
-- Description: <Description, , >
-- =============================================
CREATE PROCEDURE [dbo].[getTopMenu]

AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SELECT m.HomeCookID, m.HomeCookName, m.IsServing, 
		   m.MenuDescription, m.MenuID, m.MenuName, m.MenuURL, m.Rating,
		   m.Servings, m.Price
	FROM Menus m
	WHERE m.IsServing = 'True'
	ORDER BY m.Rating DESC
	OFFSET 0 ROWS
	FETCH NEXT 3 ROWS ONLY
END
GO
/****** Object:  StoredProcedure [dbo].[getTotalCustomerOrder]    Script Date: 7/23/2021 4:33:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      <Author, , Name>
-- Create Date: <Create Date, , >
-- Description: <Description, , >
-- =============================================
CREATE PROCEDURE [dbo].[getTotalCustomerOrder]
(
   @CustomerID varchar(50)
)
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON

    -- Insert statements for procedure here
    SELECT Count(*) as total
	from Orders o where o.CustomerID = @CustomerID
END
GO
/****** Object:  StoredProcedure [dbo].[getTotalHomeCookDish]    Script Date: 7/23/2021 4:33:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      <Author, , Name>
-- Create Date: <Create Date, , >
-- Description: <Description, , >
-- =============================================
CREATE PROCEDURE [dbo].[getTotalHomeCookDish]
(
   @HomeCookID as varchar(50)
)
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
   SET NOCOUNT ON

    SELECT COUNT(*) as total
	FROM Dishes d where d.HomeCookID = @HomeCookID
END
GO
/****** Object:  StoredProcedure [dbo].[getTotalHomeCookMenu]    Script Date: 7/23/2021 4:33:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      <Author, , Name>
-- Create Date: <Create Date, , >
-- Description: <Description, , >
-- =============================================
CREATE PROCEDURE [dbo].[getTotalHomeCookMenu]
(
    -- Add the parameters for the stored procedure here
   @HomeCookID as varchar(50)
)
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
   SET NOCOUNT ON

    SELECT COUNT(*) as total
	FROM Menus m where m.HomeCookID = @HomeCookID
END
GO
/****** Object:  StoredProcedure [dbo].[getTotalHomeCookOrder]    Script Date: 7/23/2021 4:33:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      <Author, , Name>
-- Create Date: <Create Date, , >
-- Description: <Description, , >
-- =============================================
CREATE PROCEDURE [dbo].[getTotalHomeCookOrder]
(
    -- Add the parameters for the stored procedure here
    @HomeCookID as varchar(50)
)
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON

    SELECT COUNT(*) as total
	FROM Orders o where o.HomeCookID = @HomeCookID
END
GO
/****** Object:  StoredProcedure [dbo].[getTotalOfOrder]    Script Date: 7/23/2021 4:33:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      <Author, , Name>
-- Create Date: <Create Date, , >
-- Description: <Description, , >
-- =============================================
CREATE PROCEDURE [dbo].[getTotalOfOrder]
(
@searchPhrase varchar(50)
)
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON

    SELECT CAST(o.OrderID as varchar(50)) AS OrderID
	FROM Orders o
	where o.OrderID LIKE '%'+@searchPhrase+'%' or o.ReceiverPhone LIKE '%'+@searchPhrase+'%'
END
GO
/****** Object:  StoredProcedure [dbo].[insertOrderItems]    Script Date: 7/23/2021 4:33:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[insertOrderItems]
(
    -- Add the parameters for the stored procedure here
    @OrderID varchar(50),
	@DishID varchar(50),
	@Quantity int,
	@Note varchar(300),
	@TotalPrice float
)
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON

    -- Insert statements for procedure here
	 INSERT INTO OrderItems (ItemID, OrderID, DishID, Quantity, Note, TotalPrice)
	 VALUES (NEWID(), @OrderID,@DishID, @Quantity, @Note, @TotalPrice)   
END
GO
/****** Object:  StoredProcedure [dbo].[insertOrderMenu]    Script Date: 7/23/2021 4:33:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      <Author, , Name>
-- Create Date: <Create Date, , >
-- Description: <Description, , >
-- =============================================
CREATE PROCEDURE [dbo].[insertOrderMenu]

(
    @OrderID varchar(50),
	@MenuID varchar(50),
	@Quantity int,
	@Note varchar(500),
	@TotalPrice float
)

AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON

    -- Insert statements for procedure here
    INSERT INTO OrderMenus(ItemID, OrderID, MenuID, Quantity, Note, TotalPrice)
	OUTPUT INSERTED.ItemID
	VALUES (NEWID(), @OrderID, @MenuID, @Quantity, @Note, @TotalPrice)
END
GO
/****** Object:  StoredProcedure [dbo].[removeAllDishesFromMenu]    Script Date: 7/23/2021 4:33:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      <Author, , Name>
-- Create Date: <Create Date, , >
-- Description: <Description, , >
-- =============================================
CREATE PROCEDURE [dbo].[removeAllDishesFromMenu]
(
    -- Add the parameters for the stored procedure here
    @MenuID varchar(50)
)
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON

    -- Insert statements for procedure here
    DELETE FROM DishIn
	WHERE MenuID = CAST(@MenuID as uniqueidentifier)
END
GO
/****** Object:  StoredProcedure [dbo].[retrieveAccountInformation]    Script Date: 7/23/2021 4:33:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      <Parker, , Hong Quan>
-- Create Date: <June, 11th, 2021>
-- Description: <Stored procedures for retrieving data>
-- =============================================
CREATE PROCEDURE [dbo].[retrieveAccountInformation]

(
    -- Add the parameters for the stored procedure here
    @AccountID varchar(50),
    @RoleID int
)
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON

    -- Insert statements for procedure here
    SELECT CAST(a.AccountID as varchar(50)), a.Address, a.DoB, a.FullName, a.IsActive, a.Password, 
			a.PhoneNumber, a.RoleID, a.Username, a.Email
	FROM Accounts a
	WHERE a.AccountID = CAST(@AccountID as uniqueidentifier) AND a.RoleID = @RoleID;
END
GO
/****** Object:  StoredProcedure [dbo].[searchAccount]    Script Date: 7/23/2021 4:33:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      <Author, , Name>
-- Create Date: <Create Date, , >
-- Description: <Description, , >
-- =============================================
CREATE PROCEDURE [dbo].[searchAccount]
(
    -- Add the parameters for the stored procedure here
    @searchPhrase varchar(50),
	@Page int,
	@Role int 
)
AS

    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON
	DECLARE @Input varchar(50)
	SET @Input= '%' + @searchPhrase + '%'
	BEGIN
    -- Insert statements for procedure here
		SELECT a.* 
		FROM Accounts a
		WHERE a.Username LIKE @Input and a.RoleID = @Role
		ORDER BY a.FullName DESC
		OFFSET (@Page - 1)*15 ROWS
		FETCH NEXT 15 ROWS ONLY
	END
GO
/****** Object:  StoredProcedure [dbo].[searchMenu]    Script Date: 7/23/2021 4:33:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      <Author, , Name>
-- Create Date: <Create Date, , >
-- Description: <Description, , >
-- =============================================
CREATE PROCEDURE [dbo].[searchMenu]
(
	@searchPhrase varchar(50),
	@Page int
)

AS
BEGIN

    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SELECT m.HomeCookID, m.HomeCookName, m.IsServing, m.MenuDescription, m.MenuID, m.MenuName, m.MenuURL, m.Rating, m.Price, m.Servings
	FROM Menus m
	WHERE m.MenuName LIKE '%' + @searchPhrase + '%'
	ORDER BY m.Rating DESC
	OFFSET (@Page - 1)*15 ROWS
	FETCH NEXT 15 ROWS ONLY
END
GO
/****** Object:  StoredProcedure [dbo].[sp_alterdiagram]    Script Date: 7/23/2021 4:33:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[sp_alterdiagram]
	(
		@diagramname 	sysname,
		@owner_id	int	= null,
		@version 	int,
		@definition 	varbinary(max)
	)
	WITH EXECUTE AS 'dbo'
	AS
	BEGIN
		set nocount on
	
		declare @theId 			int
		declare @retval 		int
		declare @IsDbo 			int
		
		declare @UIDFound 		int
		declare @DiagId			int
		declare @ShouldChangeUID	int
	
		if(@diagramname is null)
		begin
			RAISERROR ('Invalid ARG', 16, 1)
			return -1
		end
	
		execute as caller;
		select @theId = DATABASE_PRINCIPAL_ID();	 
		select @IsDbo = IS_MEMBER(N'db_owner'); 
		if(@owner_id is null)
			select @owner_id = @theId;
		revert;
	
		select @ShouldChangeUID = 0
		select @DiagId = diagram_id, @UIDFound = principal_id from dbo.sysdiagrams where principal_id = @owner_id and name = @diagramname 
		
		if(@DiagId IS NULL or (@IsDbo = 0 and @theId <> @UIDFound))
		begin
			RAISERROR ('Diagram does not exist or you do not have permission.', 16, 1);
			return -3
		end
	
		if(@IsDbo <> 0)
		begin
			if(@UIDFound is null or USER_NAME(@UIDFound) is null) -- invalid principal_id
			begin
				select @ShouldChangeUID = 1 ;
			end
		end

		-- update dds data			
		update dbo.sysdiagrams set definition = @definition where diagram_id = @DiagId ;

		-- change owner
		if(@ShouldChangeUID = 1)
			update dbo.sysdiagrams set principal_id = @theId where diagram_id = @DiagId ;

		-- update dds version
		if(@version is not null)
			update dbo.sysdiagrams set version = @version where diagram_id = @DiagId ;

		return 0
	END
	
GO
/****** Object:  StoredProcedure [dbo].[sp_creatediagram]    Script Date: 7/23/2021 4:33:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[sp_creatediagram]
	(
		@diagramname 	sysname,
		@owner_id		int	= null, 	
		@version 		int,
		@definition 	varbinary(max)
	)
	WITH EXECUTE AS 'dbo'
	AS
	BEGIN
		set nocount on
	
		declare @theId int
		declare @retval int
		declare @IsDbo	int
		declare @userName sysname
		if(@version is null or @diagramname is null)
		begin
			RAISERROR (N'E_INVALIDARG', 16, 1);
			return -1
		end
	
		execute as caller;
		select @theId = DATABASE_PRINCIPAL_ID(); 
		select @IsDbo = IS_MEMBER(N'db_owner');
		revert; 
		
		if @owner_id is null
		begin
			select @owner_id = @theId;
		end
		else
		begin
			if @theId <> @owner_id
			begin
				if @IsDbo = 0
				begin
					RAISERROR (N'E_INVALIDARG', 16, 1);
					return -1
				end
				select @theId = @owner_id
			end
		end
		-- next 2 line only for test, will be removed after define name unique
		if EXISTS(select diagram_id from dbo.sysdiagrams where principal_id = @theId and name = @diagramname)
		begin
			RAISERROR ('The name is already used.', 16, 1);
			return -2
		end
	
		insert into dbo.sysdiagrams(name, principal_id , version, definition)
				VALUES(@diagramname, @theId, @version, @definition) ;
		
		select @retval = @@IDENTITY 
		return @retval
	END
	
GO
/****** Object:  StoredProcedure [dbo].[sp_dropdiagram]    Script Date: 7/23/2021 4:33:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[sp_dropdiagram]
	(
		@diagramname 	sysname,
		@owner_id	int	= null
	)
	WITH EXECUTE AS 'dbo'
	AS
	BEGIN
		set nocount on
		declare @theId 			int
		declare @IsDbo 			int
		
		declare @UIDFound 		int
		declare @DiagId			int
	
		if(@diagramname is null)
		begin
			RAISERROR ('Invalid value', 16, 1);
			return -1
		end
	
		EXECUTE AS CALLER;
		select @theId = DATABASE_PRINCIPAL_ID();
		select @IsDbo = IS_MEMBER(N'db_owner'); 
		if(@owner_id is null)
			select @owner_id = @theId;
		REVERT; 
		
		select @DiagId = diagram_id, @UIDFound = principal_id from dbo.sysdiagrams where principal_id = @owner_id and name = @diagramname 
		if(@DiagId IS NULL or (@IsDbo = 0 and @UIDFound <> @theId))
		begin
			RAISERROR ('Diagram does not exist or you do not have permission.', 16, 1)
			return -3
		end
	
		delete from dbo.sysdiagrams where diagram_id = @DiagId;
	
		return 0;
	END
	
GO
/****** Object:  StoredProcedure [dbo].[sp_helpdiagramdefinition]    Script Date: 7/23/2021 4:33:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[sp_helpdiagramdefinition]
	(
		@diagramname 	sysname,
		@owner_id	int	= null 		
	)
	WITH EXECUTE AS N'dbo'
	AS
	BEGIN
		set nocount on

		declare @theId 		int
		declare @IsDbo 		int
		declare @DiagId		int
		declare @UIDFound	int
	
		if(@diagramname is null)
		begin
			RAISERROR (N'E_INVALIDARG', 16, 1);
			return -1
		end
	
		execute as caller;
		select @theId = DATABASE_PRINCIPAL_ID();
		select @IsDbo = IS_MEMBER(N'db_owner');
		if(@owner_id is null)
			select @owner_id = @theId;
		revert; 
	
		select @DiagId = diagram_id, @UIDFound = principal_id from dbo.sysdiagrams where principal_id = @owner_id and name = @diagramname;
		if(@DiagId IS NULL or (@IsDbo = 0 and @UIDFound <> @theId ))
		begin
			RAISERROR ('Diagram does not exist or you do not have permission.', 16, 1);
			return -3
		end

		select version, definition FROM dbo.sysdiagrams where diagram_id = @DiagId ; 
		return 0
	END
	
GO
/****** Object:  StoredProcedure [dbo].[sp_helpdiagrams]    Script Date: 7/23/2021 4:33:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[sp_helpdiagrams]
	(
		@diagramname sysname = NULL,
		@owner_id int = NULL
	)
	WITH EXECUTE AS N'dbo'
	AS
	BEGIN
		DECLARE @user sysname
		DECLARE @dboLogin bit
		EXECUTE AS CALLER;
			SET @user = USER_NAME();
			SET @dboLogin = CONVERT(bit,IS_MEMBER('db_owner'));
		REVERT;
		SELECT
			[Database] = DB_NAME(),
			[Name] = name,
			[ID] = diagram_id,
			[Owner] = USER_NAME(principal_id),
			[OwnerID] = principal_id
		FROM
			sysdiagrams
		WHERE
			(@dboLogin = 1 OR USER_NAME(principal_id) = @user) AND
			(@diagramname IS NULL OR name = @diagramname) AND
			(@owner_id IS NULL OR principal_id = @owner_id)
		ORDER BY
			4, 5, 1
	END
	
GO
/****** Object:  StoredProcedure [dbo].[sp_renamediagram]    Script Date: 7/23/2021 4:33:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[sp_renamediagram]
	(
		@diagramname 		sysname,
		@owner_id		int	= null,
		@new_diagramname	sysname
	
	)
	WITH EXECUTE AS 'dbo'
	AS
	BEGIN
		set nocount on
		declare @theId 			int
		declare @IsDbo 			int
		
		declare @UIDFound 		int
		declare @DiagId			int
		declare @DiagIdTarg		int
		declare @u_name			sysname
		if((@diagramname is null) or (@new_diagramname is null))
		begin
			RAISERROR ('Invalid value', 16, 1);
			return -1
		end
	
		EXECUTE AS CALLER;
		select @theId = DATABASE_PRINCIPAL_ID();
		select @IsDbo = IS_MEMBER(N'db_owner'); 
		if(@owner_id is null)
			select @owner_id = @theId;
		REVERT;
	
		select @u_name = USER_NAME(@owner_id)
	
		select @DiagId = diagram_id, @UIDFound = principal_id from dbo.sysdiagrams where principal_id = @owner_id and name = @diagramname 
		if(@DiagId IS NULL or (@IsDbo = 0 and @UIDFound <> @theId))
		begin
			RAISERROR ('Diagram does not exist or you do not have permission.', 16, 1)
			return -3
		end
	
		-- if((@u_name is not null) and (@new_diagramname = @diagramname))	-- nothing will change
		--	return 0;
	
		if(@u_name is null)
			select @DiagIdTarg = diagram_id from dbo.sysdiagrams where principal_id = @theId and name = @new_diagramname
		else
			select @DiagIdTarg = diagram_id from dbo.sysdiagrams where principal_id = @owner_id and name = @new_diagramname
	
		if((@DiagIdTarg is not null) and  @DiagId <> @DiagIdTarg)
		begin
			RAISERROR ('The name is already used.', 16, 1);
			return -2
		end		
	
		if(@u_name is null)
			update dbo.sysdiagrams set [name] = @new_diagramname, principal_id = @theId where diagram_id = @DiagId
		else
			update dbo.sysdiagrams set [name] = @new_diagramname where diagram_id = @DiagId
		return 0
	END
	
GO
/****** Object:  StoredProcedure [dbo].[sp_upgraddiagrams]    Script Date: 7/23/2021 4:33:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[sp_upgraddiagrams]
	AS
	BEGIN
		IF OBJECT_ID(N'dbo.sysdiagrams') IS NOT NULL
			return 0;
	
		CREATE TABLE dbo.sysdiagrams
		(
			name sysname NOT NULL,
			principal_id int NOT NULL,	-- we may change it to varbinary(85)
			diagram_id int PRIMARY KEY IDENTITY,
			version int,
	
			definition varbinary(max)
			CONSTRAINT UK_principal_name UNIQUE
			(
				principal_id,
				name
			)
		);


		/* Add this if we need to have some form of extended properties for diagrams */
		/*
		IF OBJECT_ID(N'dbo.sysdiagram_properties') IS NULL
		BEGIN
			CREATE TABLE dbo.sysdiagram_properties
			(
				diagram_id int,
				name sysname,
				value varbinary(max) NOT NULL
			)
		END
		*/

		IF OBJECT_ID(N'dbo.dtproperties') IS NOT NULL
		begin
			insert into dbo.sysdiagrams
			(
				[name],
				[principal_id],
				[version],
				[definition]
			)
			select	 
				convert(sysname, dgnm.[uvalue]),
				DATABASE_PRINCIPAL_ID(N'dbo'),			-- will change to the sid of sa
				0,							-- zero for old format, dgdef.[version],
				dgdef.[lvalue]
			from dbo.[dtproperties] dgnm
				inner join dbo.[dtproperties] dggd on dggd.[property] = 'DtgSchemaGUID' and dggd.[objectid] = dgnm.[objectid]	
				inner join dbo.[dtproperties] dgdef on dgdef.[property] = 'DtgSchemaDATA' and dgdef.[objectid] = dgnm.[objectid]
				
			where dgnm.[property] = 'DtgSchemaNAME' and dggd.[uvalue] like N'_EA3E6268-D998-11CE-9454-00AA00A3F36E_' 
			return 2;
		end
		return 1;
	END
	
GO
/****** Object:  StoredProcedure [dbo].[systemChangeOrderStatus]    Script Date: 7/23/2021 4:33:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      <Author, , Name>
-- Create Date: <Create Date, , >
-- Description: <Description, , >
-- =============================================
CREATE PROCEDURE [dbo].[systemChangeOrderStatus]
(
	@StartTime DateTime,
	@EndTime DateTime
)
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON

    -- Insert statements for procedure here
    UPDATE Orders 
	SET StatusID = 5
	WHERE OrderID IN (SELECT o.OrderID
						FROM Orders o
						WHERE o.TimeStamp BETWEEN @StartTime AND @EndTime)
END
GO
/****** Object:  StoredProcedure [dbo].[updateAccountInfo]    Script Date: 7/23/2021 4:33:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[updateAccountInfo]
(
    -- Add the parameters for the stored procedure here
    @Username varchar(50),
	@Password varchar(100),
	@Email varchar(50),
	@FullName nvarchar(50),
	@Date Date,
	@Address nvarchar(100),
	@PhoneNumber varchar(10),
	@UserID varchar(50)
)
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON

    -- Insert statements for procedure here
	 UPDATE Accounts
	 SET Username = @Username, Password = @Password,
	 FullName = @FullName, Address = @Address,
	 DoB = @Date, Email = @Email, PhoneNumber = @PhoneNumber 
	 WHERE AccountID = CAST(@UserID as uniqueidentifier)
	 PRINT @FullName
END
GO
/****** Object:  StoredProcedure [dbo].[updateDish]    Script Date: 7/23/2021 4:33:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[updateDish]
(
    -- Add the parameters for the stored procedure here
	@DishName varchar(50),
	@Price float,
	@IsAvailable bit,
	@Description varchar(300),
	@ImageURL varchar(200),
	@DishID varchar(50), 
	@Servings varchar(50)
)
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON

    -- Insert statements for procedure here
	 UPDATE Dishes SET Description = @Description, DishName = @DishName, Price = @Price,
			ImageURL = @ImageURL, IsAvailable = @IsAvailable, Servings = @Servings
	 WHERE DishID = CAST(@DishID as uniqueidentifier)
END
GO
/****** Object:  StoredProcedure [dbo].[updateMenu]    Script Date: 7/23/2021 4:33:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      <Author, , Name>
-- Create Date: <Create Date, , >
-- Description: <Description, , >
-- =============================================
CREATE PROCEDURE [dbo].[updateMenu]
(
    -- Add the parameters for the stored procedure here
				@MenuID varchar(50),
                @MenuName varchar(50),
                @IsServing bit,
                @MenuURL varchar(500),
                @MenuDescription varchar(500),
				@Servings varchar(50),
				@Price float
)
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON

    -- Insert statements for procedure here
    UPDATE  Menus SET MenuName = @MenuName, IsServing = @IsServing, MenuURL = @MenuURL,
			MenuDescription = @MenuDescription, Servings = @Servings, Price = @Price
	 WHERE MenuID = CAST(@MenuID as uniqueidentifier)
END
GO
EXEC sys.sp_addextendedproperty @name=N'microsoft_database_tools_support', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sysdiagrams'
GO
ALTER DATABASE [homecook] SET  READ_WRITE 
GO
