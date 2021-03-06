/*    ==Scripting Parameters==

    Source Server Version : SQL Server 2016 (13.0.5026)
    Source Database Engine Edition : Microsoft SQL Server Express Edition
    Source Database Engine Type : Standalone SQL Server

    Target Server Version : SQL Server 2017
    Target Database Engine Edition : Microsoft SQL Server Standard Edition
    Target Database Engine Type : Standalone SQL Server
*/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Students]') AND type in (N'U'))
ALTER TABLE [dbo].[Students] DROP CONSTRAINT IF EXISTS [FK_Students_StudentStatuses]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ScheduledClasses]') AND type in (N'U'))
ALTER TABLE [dbo].[ScheduledClasses] DROP CONSTRAINT IF EXISTS [FK_ScheduledClasses_ScheduledClassStatuses]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ScheduledClasses]') AND type in (N'U'))
ALTER TABLE [dbo].[ScheduledClasses] DROP CONSTRAINT IF EXISTS [FK_ScheduledClasses_Courses]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Enrollments]') AND type in (N'U'))
ALTER TABLE [dbo].[Enrollments] DROP CONSTRAINT IF EXISTS [FK_Enrollments_Students1]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Enrollments]') AND type in (N'U'))
ALTER TABLE [dbo].[Enrollments] DROP CONSTRAINT IF EXISTS [FK_Enrollments_ScheduledClasses1]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]') AND type in (N'U'))
ALTER TABLE [dbo].[AspNetUserRoles] DROP CONSTRAINT IF EXISTS [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]') AND type in (N'U'))
ALTER TABLE [dbo].[AspNetUserRoles] DROP CONSTRAINT IF EXISTS [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]') AND type in (N'U'))
ALTER TABLE [dbo].[AspNetUserLogins] DROP CONSTRAINT IF EXISTS [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]') AND type in (N'U'))
ALTER TABLE [dbo].[AspNetUserClaims] DROP CONSTRAINT IF EXISTS [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
/****** Object:  Table [dbo].[StudentStatuses]    Script Date: 10/15/2021 2:50:42 PM ******/
DROP TABLE IF EXISTS [dbo].[StudentStatuses]
GO
/****** Object:  Table [dbo].[Students]    Script Date: 10/15/2021 2:50:42 PM ******/
DROP TABLE IF EXISTS [dbo].[Students]
GO
/****** Object:  Table [dbo].[ScheduledClassStatuses]    Script Date: 10/15/2021 2:50:42 PM ******/
DROP TABLE IF EXISTS [dbo].[ScheduledClassStatuses]
GO
/****** Object:  Table [dbo].[ScheduledClasses]    Script Date: 10/15/2021 2:50:42 PM ******/
DROP TABLE IF EXISTS [dbo].[ScheduledClasses]
GO
/****** Object:  Table [dbo].[Enrollments]    Script Date: 10/15/2021 2:50:42 PM ******/
DROP TABLE IF EXISTS [dbo].[Enrollments]
GO
/****** Object:  Table [dbo].[Courses]    Script Date: 10/15/2021 2:50:42 PM ******/
DROP TABLE IF EXISTS [dbo].[Courses]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 10/15/2021 2:50:42 PM ******/
DROP TABLE IF EXISTS [dbo].[AspNetUsers]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 10/15/2021 2:50:42 PM ******/
DROP TABLE IF EXISTS [dbo].[AspNetUserRoles]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 10/15/2021 2:50:42 PM ******/
DROP TABLE IF EXISTS [dbo].[AspNetUserLogins]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 10/15/2021 2:50:42 PM ******/
DROP TABLE IF EXISTS [dbo].[AspNetUserClaims]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 10/15/2021 2:50:42 PM ******/
DROP TABLE IF EXISTS [dbo].[AspNetRoles]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 10/15/2021 2:50:42 PM ******/
DROP TABLE IF EXISTS [dbo].[__MigrationHistory]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 10/15/2021 2:50:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[__MigrationHistory]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 10/15/2021 2:50:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetRoles]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 10/15/2021 2:50:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 10/15/2021 2:50:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 10/15/2021 2:50:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 10/15/2021 2:50:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUsers]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Courses]    Script Date: 10/15/2021 2:50:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Courses]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Courses](
	[CourseId] [int] IDENTITY(1,1) NOT NULL,
	[CourseName] [nvarchar](50) NOT NULL,
	[CourseDescription] [nvarchar](max) NOT NULL,
	[CreditHours] [tinyint] NOT NULL,
	[Curriculum] [nvarchar](250) NULL,
	[Notes] [nvarchar](500) NULL,
	[IsActive] [bit] NULL,
	[CoursePhoto] [nvarchar](100) NULL,
 CONSTRAINT [PK_Courses] PRIMARY KEY CLUSTERED 
(
	[CourseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Enrollments]    Script Date: 10/15/2021 2:50:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Enrollments]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Enrollments](
	[EnrollmentId] [int] IDENTITY(1,1) NOT NULL,
	[StudentId] [int] NOT NULL,
	[ScheduledClassId] [int] NOT NULL,
	[EnrollmentDate] [date] NOT NULL,
 CONSTRAINT [PK_Enrollments] PRIMARY KEY CLUSTERED 
(
	[EnrollmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[ScheduledClasses]    Script Date: 10/15/2021 2:50:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ScheduledClasses]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ScheduledClasses](
	[ScheduledClassId] [int] IDENTITY(1,1) NOT NULL,
	[CourseId] [int] NOT NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NOT NULL,
	[InstructorName] [nvarchar](40) NOT NULL,
	[Location] [nvarchar](20) NOT NULL,
	[SCSID] [int] NULL,
 CONSTRAINT [PK_ScheduledClasses] PRIMARY KEY CLUSTERED 
(
	[ScheduledClassId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[ScheduledClassStatuses]    Script Date: 10/15/2021 2:50:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ScheduledClassStatuses]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ScheduledClassStatuses](
	[SCSID] [int] IDENTITY(1,1) NOT NULL,
	[SCSName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_ScheduledClassStatuses] PRIMARY KEY CLUSTERED 
(
	[SCSID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Students]    Script Date: 10/15/2021 2:50:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Students]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Students](
	[StudentId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](20) NOT NULL,
	[LastName] [nvarchar](20) NOT NULL,
	[Major] [nvarchar](15) NULL,
	[Address] [nvarchar](50) NULL,
	[City] [nvarchar](25) NULL,
	[State] [char](2) NULL,
	[ZipCode] [nvarchar](10) NULL,
	[Phone] [nvarchar](13) NULL,
	[Email] [nvarchar](60) NOT NULL,
	[PhotoUrl] [nvarchar](100) NULL,
	[SSID] [int] NOT NULL,
 CONSTRAINT [PK_Students] PRIMARY KEY CLUSTERED 
(
	[StudentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[StudentStatuses]    Script Date: 10/15/2021 2:50:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[StudentStatuses]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[StudentStatuses](
	[SSID] [int] NOT NULL,
	[SSName] [nvarchar](30) NOT NULL,
	[SSDescription] [nvarchar](250) NULL,
 CONSTRAINT [PK_StudentStatuses] PRIMARY KEY CLUSTERED 
(
	[SSID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'202110131927093_InitialCreate', N'SAT.UI.MVC.Models.ApplicationDbContext', 0x1F8B0800000000000400DD5CDB6EE336107D2FD07F10F4D416592B97EE621BD82D52276983E68675B2E8DB82966847588952252A9BA0E897F5A19FD45FE850A26EBCE8622BB6532CB088C8E199E170480E8743FFFBF73FE39F9E7CCF78C451EC0664621E8CF64D03133B705CB29C98095DBC796FFEF4E3D75F8DCF1CFFC9F898D31D313A6849E289F94069786C59B1FD807D148F7CD78E823858D0911DF8167202EB707FFF07EBE0C0C200610296618C3F2484BA3E4E3FE0731A101B873441DE55E0602FE6E550334B518D6BE4E33844369E98B393BBD1FDC5E8EAE37494119BC689E722106486BD85692042028A2888797C1FE3198D02B29C855080BCBBE71003DD027931E6E21F97E45D7BB27FC87A62950D73283B8969E0F7043C38E2AAB1C4E62B29D82C5407CA3B0325D367D6EB548113F3C2C169D187C00305880C8FA75EC48827E655C1E2240EAF311DE50D4719E47904705F82E8F3A88AB867746EB75798D2E1689FFDDB33A6894793084F084E6884BC3DE336997BAEFD1B7EBE0B3E6332393A982F8EDEBF7D879CA377DFE3A3B7D59E425F81AE560045B75110E20864C38BA2FFA661D5DB5962C3A259A54DA615B0259815A671859E2E3159D207982F87EF4DE3DC7DC24E5EC28DEB9EB83089A0118D12F8BC4E3C0FCD3D5CD45B8D3CD9FF0D5C0FDFBE1B84EB357A7497E9D00BFC61E24430AF3E602FAD8D1FDC309B5EB5F1FEC4C9CEA3C067DF75FBCA6A3FCD8224B25967022DC91D8A9698D6A51B5BA5F17632690635BC59E7A8BB6FDA4C52D9BC95A4AC43ABCC849CC5A667432EEFCBF2ED6C7127610883979A16D34893C1497BD54868BC679424A5E11C74351C021DFA3FAF83673E72BD0116C20E5CC00559B8918F8B5EFE1C80D921D25BE65B14C7B00E38BFA2F8A14174F87300D167D84E2230CF19457EF8E2DC6E1F0282AF137FCEAC7E73BC061B9ABB2FC139B269109D11D66A6DBCCBC0FE1C24F48C38A788E27B6AE780ECF3CEF5BB030C22CE896DE3383E0763C6CE34000F3B07BC20F4E8B0371C5B9FB6ED884C3DE4FA6A4F4458493FE5A4A537A2A6903C120D99CA2B6912F53258BAA49BA839A95ED48CA255544ED6575406D64D524EA9173425689533A31ACCCF4B476878472F85DD7D4F6FBDCD5BB71654D438831512FF82098E6019736E11A53822E508745937B6E12CA4C3C798BEF8DE9472FA88BC6468562BCD867411187E36A4B0BB3F1B5231A1F8D1759857D2E1F89313037C277AF5C9AA7DCE09926D7A3AD4BAB969E69B590374D3E5248E03DB4D678122F0C5C31675F9C18733DA6318596FC43808740C0CDD655B1E9440DF4CD1A86EC829F630C5C6899D0506A728B69123AB113AE4F4102CDF51158295F190BA70DF493CC1D271C41A2176088A61A6BA84CAD3C225B61B22AF554B42CB8E5B18EB7BC143AC39C521268C61AB26BA3057873F9800051F6150DA3434B62A16D76C881AAF5537E66D2E6C39EE5254622336D9E23B6BEC92FB6F2F6298CD1ADB807136ABA48B00DA50DE360C949F55BA1A807870D93503154E4C1A03E52ED5460CB4AEB12D18685D25AFCE40B3236AD7F117CEABBB669EF583F2E6B7F546756DC1366BFAD831D3CC7C4F6843A1058E64F33C9DB34AFC4415873390939FCF62EEEA8A26C2C06798D64336A5BFABF443AD6610D1889A004B436B01E59780129034A17A0897C7F21AA5E35E440FD83CEED608CBD77E01B662033276F532B442A8BF32158DB3D3E9A3E859610D9291773A2C54701406212E5EF58E77508A2E2E2B2BA68B2FDCC71BAE748C0F4683825A3C578D92F2CE0CAEA5DC34DBB5A472C8FAB8646B6949709F345ACA3B33B896B88DB62B49E114F4700BD652517D0B1F68B2E5918E62B729EAC6569622C50BC69626976A7C85C2D025CB4A6E152F31665962D5F4CDAC7FCA919F615876ACC83C2AA42D38D120424B2CD4026B90F4DC8D627A8A289A2316E7993ABE44A6DC5B35CB7FCEB2BA7DCA8398EF033935FB9BDFAC4A57F7B5AD56F64538C43974D0670E4D1A45570CBFBAB9C152DD90872245E07E1A78894FF4FE95BE75767D576D9F95C808634B905FF29F2465495E6E5DF39DC6459E13C38C51E1BDAC3E4E7A089DB673DFB3AA6F9D3FAA47C9C35355145DC86A6BE3A67363FA8C95E820F61FAA56849799553C2BA50AC08B7A6254121B24B04A5D77D47AEE4915B35ED31D514830A9420A553DA4ACA691D484AC56AC84A7D1A89AA23B073971A48A2ED7764756A49054A115D52B602B6416EBBAA32AB24CAAC08AEAEED865CA89B886EEF0BEA53DB6ACBA716507DBF5762E0DC6CB2C88C36C7C95FBFB2A50A5B82716BFA197C078F94E1A93F674B7AA3165E18CF58C4983A15F776A17DFF565A7F1B65E8F59BBCDAE2DED4DB7F97ABC7E26FBA286219DED4492827B71C613CE72637EAE6A7F3C231DB43212D3C8D508E6F41C53EC8F18C168F68737F55CCC16F19CE00A117781639A65709887FB0787C2039CDD790C63C5B1E329CEA5BA1731F531DB403216794491FD80223935628D072325A81475BE200E7E9A987FA6AD8ED30006FB2B2DDE332EE27BE2FE9140C55D9460E32F39D5739804FAE613D68E3E77E8AED58BDF3F654DF78C9B0866CCB1B12FE8729511AE3F82E8254DD6740D69567E1AF17A2754EDE58112559810AB3F3498BB74904706B994DFF8E8E9DBBEA2291F12AC85A8782C3014DE202AD43D0658054BFB10C0814F9A3E04E8D759F5C3805544D33E0A70497F30F14940F765286FB9C5AD467124DAC49294EAB935A57AADFCCA6DEF4D52E6F55A135DCEAEEE01B74606F50A96F1CA928F07DB1D15B9C583616FD3B45F3CA178577288CBEC8EEDA60E6F325BB8E14EE87F9524BC03696D8A349DEDA7026FDAD67461DC1DCFA7EC97F0BB63C6C693B7B69FD6BB6963D3857977DCD87A25EFEE98AD6D6BFFDCB2A575DE42B79E8A2B671569AE6354B1E0B654DB2C700E27FC790046907994D90B49756E57535E6A0BC39244CF549F54263296268EC457A26866DBAFAF7CC36FEC2CA76966AB49C56CE2CDD7FF46DE9CA699B726C1711B49C2CA144355E276CB3AD69401F59A92826B3D69C9416FF3591BEFD65F530EF0204AA9CD1ECD1DF1EB49F91D4425434E9D1E29BEF2752FEC9D955F5484FD3B76972504FB7D4582EDDAAE59D05C9045906FDE8244398910A1B9C21439B0A59E44D45D209B42358B31A74FBCD3B81DBBE99863E782DC24344C287419FB73AF16F0624E4013FF348FB92EF3F8264C7FAD64882E80982E8BCDDF909F13D7730AB9CF1531210D04F32E7844978D256591DDE57381741D908E405C7D85537487FDD003B0F886CCD0235E453630BF4BBC44F6731901D481B40F445DEDE353172D23E4C71CA36C0F9F60C38EFFF4E37F7867FF3A58540000, N'6.1.0-30225')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'bec4c608-7d10-4aa4-b8b8-bbfe7dfc0d02', N'Admin')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'6e8b0497-046c-490a-9458-9141a09532a6', N'Scheduling')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'21821505-837b-459b-8360-0aa9b62b5258', N'6e8b0497-046c-490a-9458-9141a09532a6')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'552954d8-7606-4cb3-854c-74a0198ee8e9', N'bec4c608-7d10-4aa4-b8b8-bbfe7dfc0d02')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'b7c00a3d-0b2c-4add-8604-2cadfc3e8c46', N'bec4c608-7d10-4aa4-b8b8-bbfe7dfc0d02')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'21821505-837b-459b-8360-0aa9b62b5258', N'scheduling@sat.com', 0, N'AIqkE/CkkiRQGAq1669km4r6uJcFrg//xAhd0ZS6/Gzyd6OLa23wQNEMt/QqSsqEcQ==', N'882afa14-7b5d-428a-a4d2-4f5872be717a', NULL, 0, 0, NULL, 1, 0, N'scheduling@sat.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'552954d8-7606-4cb3-854c-74a0198ee8e9', N'mikeamanda@example.com', 0, N'ANvYhDazibzRYX5fUCa2gLQuYQtjtkVHIGYF6QMlvXrmkFog6v7FN76b7BEr2LMNHw==', N'9d1cc0fa-e9af-4637-8af2-2fa02350359b', NULL, 0, 0, NULL, 1, 0, N'mikeamanda@example.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'932dcbbd-a465-47ea-8143-01b5c1855c07', N'scheduling@example.com', 0, N'AKnCoqmYE0qu0cVOoFdiEEZxsiQwHhkSEiTeTZMPBrXjLM5vy/uJSGdjW+KykZw/lg==', N'ec679a62-fd15-4ab3-bff6-925b9e827580', NULL, 0, 0, NULL, 1, 0, N'scheduling@example.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'b7c00a3d-0b2c-4add-8604-2cadfc3e8c46', N'admin@example.com', 0, N'AAlvR5cghiP8tR/dO8g3QXzbAPsDMCAja3t8SAkc1gVOZ8lwjfMXljHqNrk57QpVng==', N'c9b2f19e-a8ca-4ec2-9f6a-35e2df391dac', NULL, 0, 0, NULL, 0, 0, N'admin@example.com')
SET IDENTITY_INSERT [dbo].[Courses] ON 

INSERT [dbo].[Courses] ([CourseId], [CourseName], [CourseDescription], [CreditHours], [Curriculum], [Notes], [IsActive], [CoursePhoto]) VALUES (1, N'PDM', N'Reduced needs-based superstructure', 1, N'Trisomy and partial trisomy of autosomes, unspecified', N'Trisomy and partial trisomy of autosomes, unspecified', 1, NULL)
INSERT [dbo].[Courses] ([CourseId], [CourseName], [CourseDescription], [CreditHours], [Curriculum], [Notes], [IsActive], [CoursePhoto]) VALUES (2, N'Wellness', N'Vision-oriented hybrid open architecture', 1, N'Benign neoplasm of short bones of lower limb', N'Benign neoplasm of short bones of lower limb', 0, NULL)
INSERT [dbo].[Courses] ([CourseId], [CourseName], [CourseDescription], [CreditHours], [Curriculum], [Notes], [IsActive], [CoursePhoto]) VALUES (3, N'Basel III', N'User-friendly tangible instruction set', 3, N'Laceration w foreign body of unsp cheek and TMJ area, init', N'Laceration with foreign body of unspecified cheek and temporomandibular area, initial encounter', 0, NULL)
INSERT [dbo].[Courses] ([CourseId], [CourseName], [CourseDescription], [CreditHours], [Curriculum], [Notes], [IsActive], [CoursePhoto]) VALUES (4, N'Aircraft Systems', N'Persevering bi-directional flexibility', 1, N'Disp fx of posterior column of left acetabulum, init', N'Displaced fracture of posterior column [ilioischial] of left acetabulum, initial encounter for closed fracture', 0, NULL)
INSERT [dbo].[Courses] ([CourseId], [CourseName], [CourseDescription], [CreditHours], [Curriculum], [Notes], [IsActive], [CoursePhoto]) VALUES (5, N'Rhino', N'Intuitive eco-centric architecture', 2, N'Legal intervention involving baton', N'Legal intervention involving baton', 0, NULL)
INSERT [dbo].[Courses] ([CourseId], [CourseName], [CourseDescription], [CreditHours], [Curriculum], [Notes], [IsActive], [CoursePhoto]) VALUES (6, N'Network Architecture', N'Compatible bottom-line moderator', 3, N'Superficial foreign body of left thumb, initial encounter', N'Superficial foreign body of left thumb, initial encounter', 1, NULL)
INSERT [dbo].[Courses] ([CourseId], [CourseName], [CourseDescription], [CreditHours], [Curriculum], [Notes], [IsActive], [CoursePhoto]) VALUES (7, N'Ufile', N'User-friendly optimal database', 2, N'Constant exophthalmos, unspecified eye', N'Constant exophthalmos, unspecified eye', 0, NULL)
INSERT [dbo].[Courses] ([CourseId], [CourseName], [CourseDescription], [CreditHours], [Curriculum], [Notes], [IsActive], [CoursePhoto]) VALUES (8, N'MPI', N'Multi-tiered systemic moratorium', 1, N'Caisson disease [decompression sickness], initial encounter', N'Caisson disease [decompression sickness], initial encounter', 0, NULL)
INSERT [dbo].[Courses] ([CourseId], [CourseName], [CourseDescription], [CreditHours], [Curriculum], [Notes], [IsActive], [CoursePhoto]) VALUES (9, N'Software Development', N'Up-sized human-resource ability', 2, N'Flexion deformity, left knee', N'Flexion deformity, left knee', 0, NULL)
INSERT [dbo].[Courses] ([CourseId], [CourseName], [CourseDescription], [CreditHours], [Curriculum], [Notes], [IsActive], [CoursePhoto]) VALUES (10, N'Norton Utilities', N'Implemented multimedia middleware', 2, N'Malnutrition in pregnancy, second trimester', N'Malnutrition in pregnancy, second trimester', 0, NULL)
INSERT [dbo].[Courses] ([CourseId], [CourseName], [CourseDescription], [CreditHours], [Curriculum], [Notes], [IsActive], [CoursePhoto]) VALUES (11, N'Japanese Business Culture', N'Front-line stable flexibility', 2, N'Nondisp pilon fx unsp tibia, 7thJ', N'Nondisplaced pilon fracture of unspecified tibia, subsequent encounter for open fracture type IIIA, IIIB, or IIIC with delayed healing', 0, NULL)
INSERT [dbo].[Courses] ([CourseId], [CourseName], [CourseDescription], [CreditHours], [Curriculum], [Notes], [IsActive], [CoursePhoto]) VALUES (12, N'CA Unicenter NSM', N'Diverse clear-thinking application', 3, N'Unsp fracture of unsp toe(s), subs for fx w delay heal', N'Unspecified fracture of unspecified toe(s), subsequent encounter for fracture with delayed healing', 0, NULL)
INSERT [dbo].[Courses] ([CourseId], [CourseName], [CourseDescription], [CreditHours], [Curriculum], [Notes], [IsActive], [CoursePhoto]) VALUES (13, N'SSL Duality', N'Intuitive even-keeled standardization', 2, N'Burn of unspecified degree of left thumb (nail)', N'Burn of unspecified degree of left thumb (nail)', 1, NULL)
INSERT [dbo].[Courses] ([CourseId], [CourseName], [CourseDescription], [CreditHours], [Curriculum], [Notes], [IsActive], [CoursePhoto]) VALUES (14, N'Electronic Payments', N'Balanced 6th generation project', 1, N'Erosion of graft of urinary organ, subsequent encounter', N'Erosion of graft of urinary organ, subsequent encounter', 1, NULL)
INSERT [dbo].[Courses] ([CourseId], [CourseName], [CourseDescription], [CreditHours], [Curriculum], [Notes], [IsActive], [CoursePhoto]) VALUES (15, N'Unreal Editor', N'Ergonomic static project', 3, N'Age-rel osteopor w crnt path fx, verteb, 7thK', N'Age-related osteoporosis with current pathological fracture, vertebra(e), subsequent encounter for fracture with nonunion', 1, NULL)
INSERT [dbo].[Courses] ([CourseId], [CourseName], [CourseDescription], [CreditHours], [Curriculum], [Notes], [IsActive], [CoursePhoto]) VALUES (16, N'MBOX', N'Cross-group high-level functionalities', 3, N'Sltr-haris Type I physl fx low end ulna, r arm, 7thD', N'Salter-Harris Type I physeal fracture of lower end of ulna, right arm, subsequent encounter for fracture with routine healing', 0, NULL)
INSERT [dbo].[Courses] ([CourseId], [CourseName], [CourseDescription], [CreditHours], [Curriculum], [Notes], [IsActive], [CoursePhoto]) VALUES (17, N'SharePoint', N'Horizontal impactful monitoring', 3, N'Oth osteoporosis with current pathological fracture, humerus', N'Other osteoporosis with current pathological fracture, humerus', 0, NULL)
INSERT [dbo].[Courses] ([CourseId], [CourseName], [CourseDescription], [CreditHours], [Curriculum], [Notes], [IsActive], [CoursePhoto]) VALUES (18, N'LDOM', N'Automated value-added structure', 1, N'Nondisp fx of lateral epicondyle of r humerus, init', N'Nondisplaced fracture (avulsion) of lateral epicondyle of right humerus, initial encounter for closed fracture', 0, NULL)
INSERT [dbo].[Courses] ([CourseId], [CourseName], [CourseDescription], [CreditHours], [Curriculum], [Notes], [IsActive], [CoursePhoto]) VALUES (19, N'Kronos WFC', N'Managed full-range website', 3, N'Laceration w/o foreign body of finger with damage to nail', N'Laceration without foreign body of finger with damage to nail', 1, NULL)
INSERT [dbo].[Courses] ([CourseId], [CourseName], [CourseDescription], [CreditHours], [Curriculum], [Notes], [IsActive], [CoursePhoto]) VALUES (20, N'IP VPN', N'User-centric holistic matrix', 1, N'Other constipation', N'Other constipation', 1, NULL)
INSERT [dbo].[Courses] ([CourseId], [CourseName], [CourseDescription], [CreditHours], [Curriculum], [Notes], [IsActive], [CoursePhoto]) VALUES (21, N'PDM', N'Reduced needs-based superstructure', 1, N'Trisomy and partial trisomy of autosomes, unspecified', N'Trisomy and partial trisomy of autosomes, unspecified', 1, N'e08d0c87-6183-4616-92ff-3c3f6a020a66.png')
SET IDENTITY_INSERT [dbo].[Courses] OFF
SET IDENTITY_INSERT [dbo].[Enrollments] ON 

INSERT [dbo].[Enrollments] ([EnrollmentId], [StudentId], [ScheduledClassId], [EnrollmentDate]) VALUES (20, 26, 2, CAST(N'2010-10-05' AS Date))
INSERT [dbo].[Enrollments] ([EnrollmentId], [StudentId], [ScheduledClassId], [EnrollmentDate]) VALUES (25, 30, 4, CAST(N'2010-10-12' AS Date))
INSERT [dbo].[Enrollments] ([EnrollmentId], [StudentId], [ScheduledClassId], [EnrollmentDate]) VALUES (27, 32, 6, CAST(N'2010-10-15' AS Date))
INSERT [dbo].[Enrollments] ([EnrollmentId], [StudentId], [ScheduledClassId], [EnrollmentDate]) VALUES (31, 38, 2, CAST(N'2010-10-18' AS Date))
INSERT [dbo].[Enrollments] ([EnrollmentId], [StudentId], [ScheduledClassId], [EnrollmentDate]) VALUES (32, 38, 6, CAST(N'2010-10-18' AS Date))
INSERT [dbo].[Enrollments] ([EnrollmentId], [StudentId], [ScheduledClassId], [EnrollmentDate]) VALUES (33, 45, 2, CAST(N'2010-10-05' AS Date))
INSERT [dbo].[Enrollments] ([EnrollmentId], [StudentId], [ScheduledClassId], [EnrollmentDate]) VALUES (34, 48, 6, CAST(N'2010-10-08' AS Date))
SET IDENTITY_INSERT [dbo].[Enrollments] OFF
SET IDENTITY_INSERT [dbo].[ScheduledClasses] ON 

INSERT [dbo].[ScheduledClasses] ([ScheduledClassId], [CourseId], [StartDate], [EndDate], [InstructorName], [Location], [SCSID]) VALUES (2, 1, CAST(N'2021-10-22' AS Date), CAST(N'2021-02-22' AS Date), N'Rusty Shackleford', N'Kansas City', 1)
INSERT [dbo].[ScheduledClasses] ([ScheduledClassId], [CourseId], [StartDate], [EndDate], [InstructorName], [Location], [SCSID]) VALUES (4, 2, CAST(N'2021-10-23' AS Date), CAST(N'2021-02-23' AS Date), N'Peggy Hill', N'Kansas City', 1)
INSERT [dbo].[ScheduledClasses] ([ScheduledClassId], [CourseId], [StartDate], [EndDate], [InstructorName], [Location], [SCSID]) VALUES (6, 3, CAST(N'2021-10-18' AS Date), CAST(N'2021-02-21' AS Date), N'Luanne Platter', N'St. Louis', 2)
INSERT [dbo].[ScheduledClasses] ([ScheduledClassId], [CourseId], [StartDate], [EndDate], [InstructorName], [Location], [SCSID]) VALUES (8, 4, CAST(N'2021-10-16' AS Date), CAST(N'2021-02-19' AS Date), N'Dale Gribble', N'St. Louis', NULL)
SET IDENTITY_INSERT [dbo].[ScheduledClasses] OFF
SET IDENTITY_INSERT [dbo].[ScheduledClassStatuses] ON 

INSERT [dbo].[ScheduledClassStatuses] ([SCSID], [SCSName]) VALUES (1, N'Active')
INSERT [dbo].[ScheduledClassStatuses] ([SCSID], [SCSName]) VALUES (2, N'Pending')
INSERT [dbo].[ScheduledClassStatuses] ([SCSID], [SCSName]) VALUES (3, N'Completed')
INSERT [dbo].[ScheduledClassStatuses] ([SCSID], [SCSName]) VALUES (4, N'Cancelled')
SET IDENTITY_INSERT [dbo].[ScheduledClassStatuses] OFF
SET IDENTITY_INSERT [dbo].[Students] ON 

INSERT [dbo].[Students] ([StudentId], [FirstName], [LastName], [Major], [Address], [City], [State], [ZipCode], [Phone], [Email], [PhotoUrl], [SSID]) VALUES (26, N'Willl', N'Boys', N'Legal', N'417 Golden Leaf Lane', N'Boston', N'MA', N'02283', N'617-566-9139', N'hboys0@techcrunch.com', N'0c682d00-b80b-4d51-86dd-99ba9f19b842.png', 1)
INSERT [dbo].[Students] ([StudentId], [FirstName], [LastName], [Major], [Address], [City], [State], [ZipCode], [Phone], [Email], [PhotoUrl], [SSID]) VALUES (27, N'Heath', N'Berisford', N'Sales', N'29 Hayes Pass', N'Greenville', N'SC', N'29610', N'864-866-9707', N'hberisford1@cloudflare.com', N'e021054d-9220-4936-b91c-a8f0f35feabe.png', 2)
INSERT [dbo].[Students] ([StudentId], [FirstName], [LastName], [Major], [Address], [City], [State], [ZipCode], [Phone], [Email], [PhotoUrl], [SSID]) VALUES (29, N'Claudette', N'Siney', N'Services', N'879 Beilfuss Hill', N'Kissimmee', N'FL', N'34745', N'407-483-1309', N'csiney3@amazon.co.jp', N'b38bd6f8-b130-4547-b9d3-eb3f9eae5155.png', 2)
INSERT [dbo].[Students] ([StudentId], [FirstName], [LastName], [Major], [Address], [City], [State], [ZipCode], [Phone], [Email], [PhotoUrl], [SSID]) VALUES (30, N'Franciskus', N'Pannaman', N'Engineering', N'00 Hauk Road', N'Louisville', N'KY', N'40298', N'502-777-8416', N'fpannaman4@sitemeter.com', N'e7f005cd-5cce-494a-aea0-9400d1f6ccc6.png', 3)
INSERT [dbo].[Students] ([StudentId], [FirstName], [LastName], [Major], [Address], [City], [State], [ZipCode], [Phone], [Email], [PhotoUrl], [SSID]) VALUES (32, N'Loretta', N'Bloodworth', N'R&D', N'7277 Shopko Center', N'Tulsa', N'OK', N'74108', N'918-109-0711', N'lbloodworth6@narod.ru', N'd8077c08-977e-466e-86e6-c9e9a96b0679.png', 5)
INSERT [dbo].[Students] ([StudentId], [FirstName], [LastName], [Major], [Address], [City], [State], [ZipCode], [Phone], [Email], [PhotoUrl], [SSID]) VALUES (35, N'Meriel', N'Clarke-Williams', N'Sales', N'979 Waubesa Court', N'Columbus', N'OH', N'43226', N'614-646-6910', N'mclarkewilliams9@soup.io', N'10414c27-7700-4ed1-a598-0ee054232c28.png', 1)
INSERT [dbo].[Students] ([StudentId], [FirstName], [LastName], [Major], [Address], [City], [State], [ZipCode], [Phone], [Email], [PhotoUrl], [SSID]) VALUES (38, N'Eli', N'Thomasen', N'Management', N'088 Mayfield Park', N'Evansville', N'IN', N'47732', N'812-248-0242', N'ethomasen2@cpanel.net', N'e40c83c9-729d-43e8-9bbd-26005438bd9e.png', 2)
INSERT [dbo].[Students] ([StudentId], [FirstName], [LastName], [Major], [Address], [City], [State], [ZipCode], [Phone], [Email], [PhotoUrl], [SSID]) VALUES (45, N'Mary', N'Clarke-Williams', N'Sales', N'979 Waubesa Court', N'Columbus', N'OH', N'43226', N'614-646-6910', N'mclarkewilliams9@soup.io', N'bb60a5e5-8c5e-4a75-b742-a2d2a04d0526.png', 1)
INSERT [dbo].[Students] ([StudentId], [FirstName], [LastName], [Major], [Address], [City], [State], [ZipCode], [Phone], [Email], [PhotoUrl], [SSID]) VALUES (48, N'Myles', N'Thomasen', N'Management', N'088 Mayfield Park', N'Evansville', N'IN', N'47732', N'812-248-0242', N'ethomasen2@cpanel.net', N'd1a463a9-13e6-476a-981d-846217766144.png', 2)
INSERT [dbo].[Students] ([StudentId], [FirstName], [LastName], [Major], [Address], [City], [State], [ZipCode], [Phone], [Email], [PhotoUrl], [SSID]) VALUES (66, N'Meredith', N'Moore', N'IT', N'4328 Jackson Ave', N'Kansas City', N'MO', N'64130', N'8168952333', N'acarruth@ucakc.org', N'df304472-f181-40a8-9d3c-c002e840b5f1.png', 1)
SET IDENTITY_INSERT [dbo].[Students] OFF
INSERT [dbo].[StudentStatuses] ([SSID], [SSName], [SSDescription]) VALUES (1, N'Prospect', N'A student who has inquired about taking classes at the institution.')
INSERT [dbo].[StudentStatuses] ([SSID], [SSName], [SSDescription]) VALUES (2, N'Current Student', N'A student who is actively participating in classes.')
INSERT [dbo].[StudentStatuses] ([SSID], [SSName], [SSDescription]) VALUES (3, N'Former Student- Withdrawn', N'A student who has left the institution on their own accord. ')
INSERT [dbo].[StudentStatuses] ([SSID], [SSName], [SSDescription]) VALUES (4, N'	Former Student- Dismissed', N'A student who has left the institution at our request.')
INSERT [dbo].[StudentStatuses] ([SSID], [SSName], [SSDescription]) VALUES (5, N'Alumni', N'A student who has finished their coursework and left the institution.')
INSERT [dbo].[StudentStatuses] ([SSID], [SSName], [SSDescription]) VALUES (6, N'Booted', N'	This is what happens when you don''t go to class. ')
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]'))
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]'))
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]'))
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]'))
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Enrollments_ScheduledClasses1]') AND parent_object_id = OBJECT_ID(N'[dbo].[Enrollments]'))
ALTER TABLE [dbo].[Enrollments]  WITH CHECK ADD  CONSTRAINT [FK_Enrollments_ScheduledClasses1] FOREIGN KEY([ScheduledClassId])
REFERENCES [dbo].[ScheduledClasses] ([ScheduledClassId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Enrollments_ScheduledClasses1]') AND parent_object_id = OBJECT_ID(N'[dbo].[Enrollments]'))
ALTER TABLE [dbo].[Enrollments] CHECK CONSTRAINT [FK_Enrollments_ScheduledClasses1]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Enrollments_Students1]') AND parent_object_id = OBJECT_ID(N'[dbo].[Enrollments]'))
ALTER TABLE [dbo].[Enrollments]  WITH CHECK ADD  CONSTRAINT [FK_Enrollments_Students1] FOREIGN KEY([StudentId])
REFERENCES [dbo].[Students] ([StudentId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Enrollments_Students1]') AND parent_object_id = OBJECT_ID(N'[dbo].[Enrollments]'))
ALTER TABLE [dbo].[Enrollments] CHECK CONSTRAINT [FK_Enrollments_Students1]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ScheduledClasses_Courses]') AND parent_object_id = OBJECT_ID(N'[dbo].[ScheduledClasses]'))
ALTER TABLE [dbo].[ScheduledClasses]  WITH CHECK ADD  CONSTRAINT [FK_ScheduledClasses_Courses] FOREIGN KEY([CourseId])
REFERENCES [dbo].[Courses] ([CourseId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ScheduledClasses_Courses]') AND parent_object_id = OBJECT_ID(N'[dbo].[ScheduledClasses]'))
ALTER TABLE [dbo].[ScheduledClasses] CHECK CONSTRAINT [FK_ScheduledClasses_Courses]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ScheduledClasses_ScheduledClassStatuses]') AND parent_object_id = OBJECT_ID(N'[dbo].[ScheduledClasses]'))
ALTER TABLE [dbo].[ScheduledClasses]  WITH CHECK ADD  CONSTRAINT [FK_ScheduledClasses_ScheduledClassStatuses] FOREIGN KEY([SCSID])
REFERENCES [dbo].[ScheduledClassStatuses] ([SCSID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ScheduledClasses_ScheduledClassStatuses]') AND parent_object_id = OBJECT_ID(N'[dbo].[ScheduledClasses]'))
ALTER TABLE [dbo].[ScheduledClasses] CHECK CONSTRAINT [FK_ScheduledClasses_ScheduledClassStatuses]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Students_StudentStatuses]') AND parent_object_id = OBJECT_ID(N'[dbo].[Students]'))
ALTER TABLE [dbo].[Students]  WITH CHECK ADD  CONSTRAINT [FK_Students_StudentStatuses] FOREIGN KEY([SSID])
REFERENCES [dbo].[StudentStatuses] ([SSID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Students_StudentStatuses]') AND parent_object_id = OBJECT_ID(N'[dbo].[Students]'))
ALTER TABLE [dbo].[Students] CHECK CONSTRAINT [FK_Students_StudentStatuses]
GO
