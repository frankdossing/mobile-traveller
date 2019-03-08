USE [master]
GO
/****** Object:  Database [CHEER_DB]    Script Date: 28/01/2019 8:22:18 AM ******/
CREATE DATABASE [CHEER_DB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CHEER_dat', FILENAME = N'C:\CHEERDB\CHEER_DB_BU.MDF' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 10%)
 LOG ON 
( NAME = N'VMS_log', FILENAME = N'C:\CHEERDB\CHEER_DB_BU.LDF' , SIZE = 1280KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [CHEER_DB] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CHEER_DB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CHEER_DB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CHEER_DB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CHEER_DB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CHEER_DB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CHEER_DB] SET ARITHABORT OFF 
GO
ALTER DATABASE [CHEER_DB] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [CHEER_DB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CHEER_DB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CHEER_DB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CHEER_DB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CHEER_DB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CHEER_DB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CHEER_DB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CHEER_DB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CHEER_DB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CHEER_DB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CHEER_DB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CHEER_DB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CHEER_DB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CHEER_DB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CHEER_DB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CHEER_DB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CHEER_DB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [CHEER_DB] SET  MULTI_USER 
GO
ALTER DATABASE [CHEER_DB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CHEER_DB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CHEER_DB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CHEER_DB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CHEER_DB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CHEER_DB] SET QUERY_STORE = OFF
GO
USE [CHEER_DB]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [CHEER_DB]
GO
/****** Object:  Table [dbo].[data_EmailSendLog]    Script Date: 28/01/2019 8:22:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[data_EmailSendLog](
	[EmailUID] [int] IDENTITY(1,1) NOT NULL,
	[TUserUID] [int] NULL,
	[ToAddress] [varchar](200) NULL,
	[Subject] [varchar](200) NULL,
	[EmailDateTime] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[data_EventDefinition]    Script Date: 28/01/2019 8:22:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[data_EventDefinition](
	[EventUID] [int] IDENTITY(1,1) NOT NULL,
	[EventName] [varchar](500) NULL,
	[EventLocation] [varchar](500) NULL,
	[EventContactName] [varchar](200) NULL,
	[EventContactPhone] [varchar](200) NULL,
	[EventContactEmail] [varchar](200) NULL,
	[EventDateTime] [datetime] NULL,
	[EventComplete] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[data_EventGroupData]    Script Date: 28/01/2019 8:22:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[data_EventGroupData](
	[FieldUID] [int] IDENTITY(1,1) NOT NULL,
	[EventUID] [int] NULL,
	[GroupUID] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[data_GroupAccomDefinition]    Script Date: 28/01/2019 8:22:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[data_GroupAccomDefinition](
	[AccomUID] [int] IDENTITY(1,1) NOT NULL,
	[GroupUID] [int] NULL,
	[PackUID] [int] NULL,
	[Visible] [bit] NULL,
	[AccomName] [varchar](300) NULL,
	[RoomType] [varchar](300) NULL,
	[AccomDescription] [varchar](800) NULL,
	[NumberPeople] [int] NULL,
	[PackageCost] [varchar](200) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[data_GroupAirlineRefNumber]    Script Date: 28/01/2019 8:22:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[data_GroupAirlineRefNumber](
	[FieldUID] [int] IDENTITY(1,1) NOT NULL,
	[GroupUID] [int] NULL,
	[AirlineRefNumber] [varchar](200) NULL,
	[Description] [varchar](500) NULL,
	[DefaultNumber] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[data_GroupArrivingHotelDetails]    Script Date: 28/01/2019 8:22:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[data_GroupArrivingHotelDetails](
	[HotelUID] [int] IDENTITY(1,1) NOT NULL,
	[GroupUID] [int] NULL,
	[HotelName] [varchar](500) NULL,
	[HotelStreetName] [varchar](500) NULL,
	[HotelCity] [varchar](500) NULL,
	[HotelState] [varchar](200) NULL,
	[HotelZipCode] [varchar](200) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[data_GroupDefinition]    Script Date: 28/01/2019 8:22:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[data_GroupDefinition](
	[GroupUID] [int] IDENTITY(1,1) NOT NULL,
	[SiteUID] [int] NULL,
	[EventUID] [int] NULL,
	[GroupName] [varchar](200) NULL,
	[GroupDescription] [varchar](500) NULL,
	[DepartureDate] [datetime] NULL,
	[ReturnDate] [datetime] NULL,
	[GroupOrganisationName] [varchar](200) NULL,
	[GroupContactName] [varchar](200) NULL,
	[GroupContactPhone] [varchar](200) NULL,
	[GroupContactEmail] [varchar](200) NULL,
	[GroupComplete] [bit] NULL,
	[TramadaFileNumber] [varchar](200) NULL,
	[GroupDepositRequired] [varchar](200) NULL,
	[GroupAirlineFFText] [varchar](200) NULL,
	[PackageCostVisible] [bit] NULL,
	[PackageDisclaimerText] [varchar](800) NULL,
	[GroupDepositVisible] [bit] NULL,
	[GroupFinalPaymentVisible] [bit] NULL,
	[ChildDiscountAmount] [varchar](200) NULL,
	[InfantPackageAmount] [varchar](200) NULL,
	[RegistrationOpen] [bit] NULL,
	[ShowExtensionOption] [bit] NULL,
	[ExtensionDeadlineDate] [datetime] NULL,
	[UpdatedDateTime] [datetime] NULL,
	[Updatedby] [varchar](200) NULL,
	[IsActive] [bit] NULL,
	[GymUID] [int] NULL,
	[ItineraryFilename] [varchar](200) NULL,
	[PackageDisplayOption] [varchar](200) NULL,
	[GroupPaymentMethod] [varchar](200) NULL,
	[ShowDirectDeposit] [bit] NULL,
	[ShowBalanceStatement] [bit] NULL,
	[AllowNoAthlete] [bit] NULL,
	[AllowAthleteSelectPackageAccomm] [bit] NULL,
	[ShowFrequentFlyerField] [bit] NULL,
	[GroupPaymentVisible] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[data_GroupItineraryDefinition]    Script Date: 28/01/2019 8:22:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[data_GroupItineraryDefinition](
	[GrItUID] [int] IDENTITY(1,1) NOT NULL,
	[GroupUID] [int] NULL,
	[PackUID] [int] NULL,
	[ItineraryName] [varchar](200) NULL,
	[ItineraryDescription] [varchar](900) NULL,
	[PrimaryItinerary] [bit] NULL,
	[Status] [varchar](200) NULL,
	[NoTravellers] [int] NULL,
	[NoSegments] [int] NULL,
	[UniqueItineraryLabel] [varchar](500) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[data_GroupItinerarySegmentList]    Script Date: 28/01/2019 8:22:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[data_GroupItinerarySegmentList](
	[GrItSegUID] [int] IDENTITY(1,1) NOT NULL,
	[GroupUID] [int] NULL,
	[GrItUID] [int] NULL,
	[SegUID] [varchar](100) NULL,
	[Zindex] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[data_GroupMessages]    Script Date: 28/01/2019 8:22:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[data_GroupMessages](
	[MessUID] [int] IDENTITY(1,1) NOT NULL,
	[GroupUID] [int] NULL,
	[TUserUID] [int] NULL,
	[MessageRead] [bit] NULL,
	[MessageActioned] [bit] NULL,
	[MessageContent] [varchar](900) NULL,
	[ActionNote] [varchar](900) NULL,
	[MessageDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[data_GroupNoExpectedTrav]    Script Date: 28/01/2019 8:22:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[data_GroupNoExpectedTrav](
	[ExpUID] [int] IDENTITY(1,1) NOT NULL,
	[GroupUID] [int] NULL,
	[TTypeUID] [int] NULL,
	[TypeLabel] [varchar](200) NULL,
	[ExpectedNoTravellers] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[data_GroupNoteData]    Script Date: 28/01/2019 8:22:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[data_GroupNoteData](
	[GNoteUID] [int] IDENTITY(1,1) NOT NULL,
	[GroupUID] [int] NULL,
	[NoteName] [varchar](200) NULL,
	[NoteText] [varchar](500) NULL,
	[NoteDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[data_GroupPackageDefinition]    Script Date: 28/01/2019 8:22:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[data_GroupPackageDefinition](
	[PackUID] [int] IDENTITY(1,1) NOT NULL,
	[GroupUID] [int] NULL,
	[TTypeUID] [int] NULL,
	[Visible] [bit] NULL,
	[PackageName] [varchar](500) NULL,
	[PackageDescription] [varchar](800) NULL,
	[ChildDiscount] [bit] NULL,
	[ChildDiscountAmount] [varchar](200) NULL,
	[GymAdditionalCost] [varchar](200) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[data_GroupPackageSegment]    Script Date: 28/01/2019 8:22:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[data_GroupPackageSegment](
	[PackSegUID] [int] IDENTITY(1,1) NOT NULL,
	[GroupUID] [int] NULL,
	[SegUID] [int] NULL,
	[PackUID] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[data_GroupReceipts]    Script Date: 28/01/2019 8:22:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[data_GroupReceipts](
	[ReceiptUID] [int] IDENTITY(1,1) NOT NULL,
	[GroupUID] [int] NULL,
	[TransactionName] [varchar](200) NULL,
	[TransactionMethod] [varchar](200) NULL,
	[Amount] [varchar](200) NULL,
	[Filename] [varchar](200) NULL,
	[ReceiptDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[data_GroupReceiptTransactions]    Script Date: 28/01/2019 8:22:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[data_GroupReceiptTransactions](
	[ReceiptUID] [int] NULL,
	[TransUID] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[data_GroupSegmentBookingReference]    Script Date: 28/01/2019 8:22:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[data_GroupSegmentBookingReference](
	[RefUID] [int] IDENTITY(1,1) NOT NULL,
	[SegUID] [int] NULL,
	[TUID] [int] NULL,
	[BookingRef] [varchar](200) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[data_GroupSegmentDefinition]    Script Date: 28/01/2019 8:22:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[data_GroupSegmentDefinition](
	[SegUID] [int] IDENTITY(1,1) NOT NULL,
	[GroupUID] [int] NULL,
	[SuppUID] [int] NULL,
	[ProvUID] [int] NULL,
	[SegServiceType] [varchar](100) NULL,
	[Status] [varchar](200) NULL,
	[SegmentDate] [datetime] NULL,
	[AirlineCode] [varchar](100) NULL,
	[FlightNumber] [varchar](200) NULL,
	[DepDate] [date] NULL,
	[DepTime] [time](7) NULL,
	[DepCity] [varchar](200) NULL,
	[DepTerminal] [varchar](200) NULL,
	[ArrDate] [date] NULL,
	[ArrTime] [time](7) NULL,
	[ArrCity] [varchar](200) NULL,
	[ArrTerminal] [varchar](200) NULL,
	[AircraftType] [varchar](100) NULL,
	[BookingClass] [varchar](100) NULL,
	[FlightDuration] [varchar](100) NULL,
	[Stops] [varchar](200) NULL,
	[AirlineRef] [varchar](200) NULL,
	[Seats] [varchar](200) NULL,
	[CodeShare] [varchar](200) NULL,
	[Baggage] [varchar](200) NULL,
	[TransferName] [varchar](100) NULL,
	[PickUpDate] [date] NULL,
	[PickUpTime] [time](7) NULL,
	[PickUpLocation] [varchar](200) NULL,
	[DropOffDate] [date] NULL,
	[DropOffTime] [time](7) NULL,
	[DropOffLocation] [varchar](200) NULL,
	[TransferVehicleType] [varchar](200) NULL,
	[TransferBookingReference] [varchar](200) NULL,
	[TransferPaymentMethod] [varchar](200) NULL,
	[CheckInDate] [date] NULL,
	[CheckInTime] [time](7) NULL,
	[CheckOutDate] [date] NULL,
	[CheckOutTime] [time](7) NULL,
	[RoomType] [varchar](200) NULL,
	[HotelBookingReference] [varchar](200) NULL,
	[HotelPaymentMethod] [varchar](200) NULL,
	[HotelDuration] [varchar](200) NULL,
	[Inclusions] [varchar](500) NULL,
	[AllowGymPortalAllocateRooms] [bit] NULL,
	[TourName] [varchar](100) NULL,
	[TourStartDate] [date] NULL,
	[TourStartTime] [time](7) NULL,
	[TourStartLocation] [varchar](200) NULL,
	[TourEndDate] [date] NULL,
	[TourEndTime] [time](7) NULL,
	[TourEndLocation] [varchar](200) NULL,
	[TourType] [varchar](200) NULL,
	[TourBookingReference] [varchar](200) NULL,
	[TourPaymentMethod] [varchar](200) NULL,
	[TourDuration] [varchar](200) NULL,
	[CarPickUpDate] [date] NULL,
	[CarPickUpTime] [time](7) NULL,
	[CarPickUpLocation] [varchar](200) NULL,
	[CarDropOffDate] [date] NULL,
	[CarDropOffTime] [time](7) NULL,
	[CarDropOffLocation] [varchar](200) NULL,
	[VehicleType] [varchar](200) NULL,
	[CarHireBookingReference] [varchar](200) NULL,
	[CarHirePaymentMethod] [varchar](200) NULL,
	[MiscName] [varchar](200) NULL,
	[MiscStartDate] [date] NULL,
	[MiscStartTime] [time](7) NULL,
	[MiscStartLocation] [varchar](200) NULL,
	[MiscEndDate] [date] NULL,
	[MiscEndTime] [time](7) NULL,
	[MiscEndLocation] [varchar](200) NULL,
	[OAName] [varchar](200) NULL,
	[OAStartDate] [date] NULL,
	[OAStartTime] [time](7) NULL,
	[OAStartLocation] [varchar](200) NULL,
	[OAEndDate] [date] NULL,
	[OAEndTime] [time](7) NULL,
	[OAEndLocation] [varchar](200) NULL,
	[CommentName] [varchar](200) NULL,
	[CommentDate] [date] NULL,
	[CommentTime] [time](7) NULL,
	[CommentNotes] [varchar](900) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[data_GroupSegmentNotes]    Script Date: 28/01/2019 8:22:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[data_GroupSegmentNotes](
	[SegNoteUID] [int] IDENTITY(1,1) NOT NULL,
	[SegUID] [int] NULL,
	[GroupUID] [int] NULL,
	[SegNoteTitle] [varchar](200) NULL,
	[SegNote] [varchar](900) NULL,
	[Zindex] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[data_GroupSegmentNotesTraveller]    Script Date: 28/01/2019 8:22:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[data_GroupSegmentNotesTraveller](
	[SegNoteUID] [int] IDENTITY(1,1) NOT NULL,
	[SegUID] [int] NULL,
	[TUID] [int] NULL,
	[SegNoteTitle] [varchar](200) NULL,
	[SegNote] [varchar](900) NULL,
	[Zindex] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[data_GroupTaskList]    Script Date: 28/01/2019 8:22:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[data_GroupTaskList](
	[TaskUID] [int] IDENTITY(1,1) NOT NULL,
	[GroupUID] [int] NULL,
	[TaskName] [varchar](200) NULL,
	[TaskDescription] [varchar](500) NULL,
	[TaskDueDate] [datetime] NULL,
	[TaskComplete] [bit] NULL,
	[TaskCompletedDate] [datetime] NULL,
	[TaskNote] [varchar](900) NULL,
	[Status] [varchar](200) NULL,
	[AssignedToUsername] [varchar](200) NULL,
	[UserUID] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[data_GroupTransactions]    Script Date: 28/01/2019 8:22:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[data_GroupTransactions](
	[TransUID] [int] IDENTITY(1,1) NOT NULL,
	[GroupUID] [int] NULL,
	[Amount] [varchar](200) NULL,
	[MerchantFee] [varchar](200) NULL,
	[CardType] [varchar](200) NULL,
	[TransactionType] [varchar](200) NULL,
	[TransactionMethod] [varchar](200) NULL,
	[TransactionName] [varchar](200) NULL,
	[Description] [varchar](500) NULL,
	[TransactionDate] [datetime] NULL,
	[Status] [varchar](200) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[data_GroupTravellerData]    Script Date: 28/01/2019 8:22:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[data_GroupTravellerData](
	[FieldUID] [int] IDENTITY(1,1) NOT NULL,
	[GroupUID] [int] NULL,
	[TUID] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[data_GroupTravellerTypeDefault]    Script Date: 28/01/2019 8:22:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[data_GroupTravellerTypeDefault](
	[DefaultUID] [int] IDENTITY(1,1) NOT NULL,
	[GroupUID] [int] NULL,
	[TTypeUID] [int] NULL,
	[PackUID] [int] NULL,
	[AccomUID] [int] NULL,
	[PaymentRequired] [bit] NULL,
	[DefaultDescription] [varchar](800) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[data_GroupVISADefinition]    Script Date: 28/01/2019 8:22:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[data_GroupVISADefinition](
	[GroupVISAUID] [int] IDENTITY(1,1) NOT NULL,
	[GroupUID] [int] NULL,
	[VISAUID] [int] NULL,
	[VISAName] [varchar](300) NULL,
	[VISADescription] [varchar](800) NULL,
	[VISAWebLinkName] [varchar](200) NULL,
	[VISAApplicationLink] [varchar](800) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[data_GymDefinition]    Script Date: 28/01/2019 8:22:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[data_GymDefinition](
	[GymUID] [int] IDENTITY(1,1) NOT NULL,
	[GymName] [varchar](500) NULL,
	[GymRefCode] [varchar](200) NULL,
	[GymDescription] [varchar](500) NULL,
	[GymAddress1] [varchar](500) NULL,
	[GymAddress2] [varchar](500) NULL,
	[GymSuburb] [varchar](500) NULL,
	[GymPostcode] [varchar](200) NULL,
	[GymState] [varchar](200) NULL,
	[GymGeneralPhone] [varchar](200) NULL,
	[GymGeneralEmail] [varchar](200) NULL,
	[GymContactName] [varchar](200) NULL,
	[GymContactPhone] [varchar](200) NULL,
	[GymContactEmail] [varchar](200) NULL,
	[GymLogoFilename] [varchar](500) NULL,
	[GymLogoPixelWidth] [varchar](200) NULL,
	[GymLogoPixelHeight] [varchar](200) NULL,
	[UpdatedDateTime] [datetime] NULL,
	[Updatedby] [varchar](200) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[data_GymPortalDirectDepositTransactions]    Script Date: 28/01/2019 8:22:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[data_GymPortalDirectDepositTransactions](
	[GPDDUID] [int] IDENTITY(1,1) NOT NULL,
	[GroupUID] [int] NULL,
	[TUserUID] [int] NULL,
	[TUID] [int] NULL,
	[Amount] [varchar](200) NULL,
	[TransferReference] [varchar](500) NULL,
	[TransactionName] [varchar](500) NULL,
	[Description] [varchar](500) NULL,
	[Status] [varchar](200) NULL,
	[ReceiptUID] [int] NULL,
	[DDDateTime] [datetime] NULL,
	[Updatedby] [varchar](200) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[data_GymPortalEmailSendLog]    Script Date: 28/01/2019 8:22:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[data_GymPortalEmailSendLog](
	[EmailUID] [int] IDENTITY(1,1) NOT NULL,
	[GPUserUID] [int] NULL,
	[ToAddress] [varchar](200) NULL,
	[Subject] [varchar](200) NULL,
	[EmailDateTime] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[data_GymPortalReceipts]    Script Date: 28/01/2019 8:22:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[data_GymPortalReceipts](
	[ReceiptUID] [int] IDENTITY(1,1) NOT NULL,
	[TUserUID] [int] NULL,
	[GroupUID] [int] NULL,
	[TransactionName] [varchar](200) NULL,
	[TransactionMethod] [varchar](200) NULL,
	[Amount] [varchar](200) NULL,
	[Filename] [varchar](200) NULL,
	[ReceiptDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[data_GymPortalReceiptTransactions]    Script Date: 28/01/2019 8:22:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[data_GymPortalReceiptTransactions](
	[ReceiptUID] [int] NULL,
	[TransUID] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[data_GymPortalTrainingSchedule]    Script Date: 28/01/2019 8:22:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[data_GymPortalTrainingSchedule](
	[ScheduleUID] [int] IDENTITY(1,1) NOT NULL,
	[GroupUID] [int] NULL,
	[EventName] [varchar](200) NULL,
	[EventDescription] [varchar](500) NULL,
	[StartDateTime] [datetime] NULL,
	[EndDateTime] [datetime] NULL,
	[EventLocation] [varchar](300) NULL,
	[EventType] [varchar](300) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[data_GymPortalTravellerTransactions]    Script Date: 28/01/2019 8:22:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[data_GymPortalTravellerTransactions](
	[TransUID] [int] IDENTITY(1,1) NOT NULL,
	[TUserUID] [int] NULL,
	[TUID] [int] NULL,
	[GroupUID] [int] NULL,
	[Amount] [varchar](200) NULL,
	[TransactionType] [varchar](200) NULL,
	[TransactionMethod] [varchar](200) NULL,
	[TransactionName] [varchar](500) NULL,
	[TransactionDescription] [varchar](500) NULL,
	[TransactionDate] [datetime] NULL,
	[Status] [varchar](200) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[data_GymPortalTUserNotes]    Script Date: 28/01/2019 8:22:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[data_GymPortalTUserNotes](
	[GPTUserNoteUID] [int] IDENTITY(1,1) NOT NULL,
	[TUserUID] [int] NULL,
	[GroupUID] [int] NULL,
	[NoteTitle] [varchar](200) NULL,
	[NoteData] [varchar](900) NULL,
	[NoteDateTime] [datetime] NULL,
	[Updatedby] [varchar](200) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[data_GymPortalUserData]    Script Date: 28/01/2019 8:22:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[data_GymPortalUserData](
	[GPUserUID] [int] IDENTITY(1,1) NOT NULL,
	[GymUID] [int] NULL,
	[Username] [varchar](500) NULL,
	[Password] [varchar](200) NULL,
	[Firstname] [varchar](500) NULL,
	[Lastname] [varchar](500) NULL,
	[EmailAddress] [varchar](500) NULL,
	[MobileNumber] [varchar](200) NULL,
	[UserType] [varchar](200) NULL,
	[PasswordReset] [bit] NULL,
	[Active] [bit] NULL,
	[UpdatedDateTime] [datetime] NULL,
	[Updatedby] [varchar](200) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[data_TravellerChecklist]    Script Date: 28/01/2019 8:22:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[data_TravellerChecklist](
	[CheckDataUID] [int] IDENTITY(1,1) NOT NULL,
	[CheckUID] [int] NULL,
	[GroupUID] [int] NULL,
	[TUID] [int] NULL,
	[CheckValue] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[data_TravellerDetails]    Script Date: 28/01/2019 8:22:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[data_TravellerDetails](
	[TUID] [int] IDENTITY(1,1) NOT NULL,
	[TUserUID] [int] NULL,
	[GroupUID] [int] NULL,
	[TravellerTypeUID] [int] NULL,
	[AdultChild] [varchar](50) NULL,
	[Surname] [varchar](200) NULL,
	[Middlename] [varchar](200) NULL,
	[Firstname] [varchar](200) NULL,
	[Title] [varchar](200) NULL,
	[Sex] [varchar](50) NULL,
	[DateOfBirth] [datetime] NULL,
	[Email] [varchar](200) NULL,
	[MobileNo] [varchar](200) NULL,
	[PhoneNo] [varchar](200) NULL,
	[StreetAddress] [varchar](200) NULL,
	[Suburb] [varchar](200) NULL,
	[State] [varchar](200) NULL,
	[Postcode] [varchar](200) NULL,
	[MedicalConditions] [varchar](500) NULL,
	[DietaryRequirements] [varchar](500) NULL,
	[HasInsurance] [bit] NULL,
	[InsuranceProvider] [varchar](200) NULL,
	[InsurancePolicyNo] [varchar](200) NULL,
	[HasPassport] [bit] NULL,
	[PassportNo] [varchar](200) NULL,
	[PassportNationality] [varchar](200) NULL,
	[PassportExpiryDate] [datetime] NULL,
	[PassportIssueCountry] [varchar](200) NULL,
	[FFnumber] [varchar](200) NULL,
	[SpecialMealRequest] [varchar](200) NULL,
	[SpecialNeedsRequest] [varchar](200) NULL,
	[PackUID] [int] NULL,
	[AccomUID] [int] NULL,
	[Deviation] [bit] NULL,
	[Comments] [varchar](500) NULL,
	[RegDateTime] [datetime] NULL,
	[UpdatedDateTime] [datetime] NULL,
	[Updatedby] [varchar](200) NULL,
	[IsDeviation] [bit] NULL,
	[DeviationNotes] [varchar](500) NULL,
	[AirlineRefNumber] [varchar](200) NULL,
	[PassportStatus] [varchar](200) NULL,
	[GrItUID] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[data_TravellerNoteData]    Script Date: 28/01/2019 8:22:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[data_TravellerNoteData](
	[TNoteUID] [int] IDENTITY(1,1) NOT NULL,
	[TUID] [int] NULL,
	[GroupUID] [int] NULL,
	[NoteName] [varchar](200) NULL,
	[NoteText] [varchar](500) NULL,
	[NoteDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[data_TravellerPendingPayments]    Script Date: 28/01/2019 8:22:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[data_TravellerPendingPayments](
	[PPUID] [int] IDENTITY(1,1) NOT NULL,
	[GroupUID] [int] NULL,
	[TUserUID] [int] NULL,
	[TUID] [int] NULL,
	[Amount] [varchar](200) NULL,
	[TransferReference] [varchar](500) NULL,
	[Description] [varchar](500) NULL,
	[Status] [varchar](200) NULL,
	[ReceiptUID] [int] NULL,
	[DDDateTime] [datetime] NULL,
	[Updatedby] [varchar](200) NULL,
	[TransactionName] [varchar](200) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[data_TravellerReceiptTransactions]    Script Date: 28/01/2019 8:22:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[data_TravellerReceiptTransactions](
	[ReceiptUID] [int] NULL,
	[TransUID] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[data_TravellerTasksData]    Script Date: 28/01/2019 8:22:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[data_TravellerTasksData](
	[TaskDataUID] [int] IDENTITY(1,1) NOT NULL,
	[TaskUID] [int] NULL,
	[TUID] [int] NULL,
	[GroupUID] [int] NULL,
	[TaskVisibletoUser] [bit] NULL,
	[TaskStatus] [varchar](200) NULL,
	[TaskDueText] [varchar](200) NULL,
	[TaskCompletedbyUser] [bit] NULL,
	[TaskVerified] [bit] NULL,
	[UploadedFileName] [varchar](500) NULL,
	[UploadedFilePath] [varchar](500) NULL,
	[UpdatedDateTime] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[data_TravellerTransactionReceipt]    Script Date: 28/01/2019 8:22:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[data_TravellerTransactionReceipt](
	[ReceiptUID] [int] IDENTITY(1,1) NOT NULL,
	[TUserUID] [int] NULL,
	[GroupUID] [int] NULL,
	[TransactionName] [varchar](500) NULL,
	[TransactionMethod] [varchar](500) NULL,
	[Amount] [varchar](200) NULL,
	[Filename] [varchar](200) NULL,
	[ReceiptDate] [datetime] NULL,
	[MerchantFee] [varchar](200) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[data_TravellerTransactions]    Script Date: 28/01/2019 8:22:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[data_TravellerTransactions](
	[TransUID] [int] IDENTITY(1,1) NOT NULL,
	[TUID] [int] NULL,
	[TUserUID] [int] NULL,
	[AmountOweing] [varchar](200) NULL,
	[AmountReceived] [varchar](200) NULL,
	[TransactionType] [varchar](200) NULL,
	[TransactionName] [varchar](500) NULL,
	[TransactionDescription] [varchar](500) NULL,
	[TransactionDate] [datetime] NULL,
	[TransactionMethod] [varchar](500) NULL,
	[GroupUID] [int] NULL,
	[Status] [varchar](200) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[data_TravellerTransactionTracking]    Script Date: 28/01/2019 8:22:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[data_TravellerTransactionTracking](
	[TrackUID] [int] IDENTITY(1,1) NOT NULL,
	[TUID] [int] NULL,
	[TUserUID] [int] NULL,
	[GroupUID] [int] NULL,
	[TransUID] [int] NULL,
	[GPTransUID] [int] NULL,
	[TransactionType] [varchar](200) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[data_TravellerTypeDefinition]    Script Date: 28/01/2019 8:22:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[data_TravellerTypeDefinition](
	[TTypeUID] [int] IDENTITY(1,1) NOT NULL,
	[TypeLabel] [varchar](500) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[data_TravellerVISAData]    Script Date: 28/01/2019 8:22:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[data_TravellerVISAData](
	[VISADataUID] [int] IDENTITY(1,1) NOT NULL,
	[TUID] [int] NULL,
	[VISAUID] [int] NULL,
	[HasVISA] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[data_TUserLoginData]    Script Date: 28/01/2019 8:22:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[data_TUserLoginData](
	[TUserUID] [int] IDENTITY(1,1) NOT NULL,
	[GroupUID] [int] NULL,
	[Username] [varchar](500) NULL,
	[Password] [varchar](200) NULL,
	[Firstname] [varchar](200) NULL,
	[Lastname] [varchar](200) NULL,
	[MobileNo] [varchar](200) NULL,
	[CompleteMyReg] [bit] NULL,
	[DepositPayment] [varchar](200) NULL,
	[DepositPaymentMethod] [varchar](200) NULL,
	[DepositAmountDue] [varchar](200) NULL,
	[DepositAmountReceived] [varchar](200) NULL,
	[DepositDate] [datetime] NULL,
	[FinalPayment] [varchar](200) NULL,
	[FinalPaymentMethod] [varchar](200) NULL,
	[FinalPaymentAmountDue] [varchar](200) NULL,
	[FinalPaymentAmountReceived] [varchar](200) NULL,
	[FinalPaymentDate] [datetime] NULL,
	[ExtensionRequest] [bit] NULL,
	[ExtensionNotes] [varchar](200) NULL,
	[SharingNames] [varchar](800) NULL,
	[RegDateTime] [datetime] NULL,
	[PasswordReset] [bit] NULL,
	[Active] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[data_TUserNotes]    Script Date: 28/01/2019 8:22:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[data_TUserNotes](
	[NoteUID] [int] IDENTITY(1,1) NOT NULL,
	[TUserUID] [int] NULL,
	[GroupUID] [int] NULL,
	[NoteTitle] [varchar](200) NULL,
	[NoteData] [varchar](900) NULL,
	[NoteDateTime] [datetime] NULL,
	[Updatedby] [varchar](200) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[data_TUserTravellerData]    Script Date: 28/01/2019 8:22:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[data_TUserTravellerData](
	[FieldUID] [int] IDENTITY(1,1) NOT NULL,
	[TUserUID] [int] NULL,
	[TUID] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[data_UploadedTravellerDocs]    Script Date: 28/01/2019 8:22:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[data_UploadedTravellerDocs](
	[FileUID] [int] IDENTITY(1,1) NOT NULL,
	[TUID] [int] NULL,
	[GroupUID] [int] NULL,
	[DocLabel] [varchar](100) NULL,
	[DocPath] [varchar](200) NULL,
	[DocVerified] [bit] NULL,
	[UploadDateTime] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ref_AirportCodeDefinition]    Script Date: 28/01/2019 8:22:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ref_AirportCodeDefinition](
	[AirportCode] [varchar](200) NULL,
	[AirportDescription] [varchar](500) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ref_GroupTaskListTemplate]    Script Date: 28/01/2019 8:22:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ref_GroupTaskListTemplate](
	[TemplateUID] [int] IDENTITY(1,1) NOT NULL,
	[TemplateName] [varchar](200) NULL,
	[TemplateDescription] [varchar](500) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ref_GroupTaskListTemplateItems]    Script Date: 28/01/2019 8:22:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ref_GroupTaskListTemplateItems](
	[TaskUID] [int] IDENTITY(1,1) NOT NULL,
	[TemplateUID] [int] NULL,
	[TaskName] [varchar](200) NULL,
	[TaskDescription] [varchar](500) NULL,
	[TaskDueDate] [datetime] NULL,
	[TaskComplete] [bit] NULL,
	[TaskCompletedDate] [datetime] NULL,
	[TaskNote] [varchar](900) NULL,
	[Status] [varchar](200) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ref_ProviderDefinition]    Script Date: 28/01/2019 8:22:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ref_ProviderDefinition](
	[ProvUID] [int] IDENTITY(1,1) NOT NULL,
	[ProviderName] [varchar](200) NULL,
	[ProviderDescription] [varchar](500) NULL,
	[ProviderPhone] [varchar](100) NULL,
	[ProviderEmail] [varchar](100) NULL,
	[ProviderContactName] [varchar](100) NULL,
	[ProviderNotes] [varchar](600) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ref_SupplierDefinition]    Script Date: 28/01/2019 8:22:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ref_SupplierDefinition](
	[SuppUID] [int] IDENTITY(1,1) NOT NULL,
	[SupplierName] [varchar](200) NULL,
	[SupplierDescription] [varchar](500) NULL,
	[SupplierServiceType] [varchar](100) NULL,
	[SupplierPhone] [varchar](100) NULL,
	[SupplierStreet] [varchar](300) NULL,
	[SupplierSuburb] [varchar](300) NULL,
	[SupplierPostcode] [varchar](300) NULL,
	[SupplierState] [varchar](300) NULL,
	[SupplierCountry] [varchar](300) NULL,
	[SupplierNotes] [varchar](600) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ref_SystemSettings]    Script Date: 28/01/2019 8:22:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ref_SystemSettings](
	[SettingUID] [int] IDENTITY(1,1) NOT NULL,
	[SettingLabel] [varchar](200) NULL,
	[SettingDescription] [varchar](500) NULL,
	[SettingType] [varchar](200) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ref_SystemSettingsData]    Script Date: 28/01/2019 8:22:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ref_SystemSettingsData](
	[SettingDataUID] [int] IDENTITY(1,1) NOT NULL,
	[SettingUID] [int] NULL,
	[SettingText] [varchar](200) NULL,
	[SettingInt] [int] NULL,
	[SettingSingle] [float] NULL,
	[SettingDate] [datetime] NULL,
	[SettingTF] [bit] NULL,
	[SettingPara] [varchar](500) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ref_TaskGroupDefinition]    Script Date: 28/01/2019 8:22:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ref_TaskGroupDefinition](
	[FieldUID] [int] IDENTITY(1,1) NOT NULL,
	[GroupUID] [int] NULL,
	[TaskUID] [int] NULL,
	[TaskInitialVisible] [bit] NULL,
	[TaskInitialStatusText] [varchar](500) NULL,
	[TaskInitialDueText] [varchar](500) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ref_TravellerChecklistDefinition]    Script Date: 28/01/2019 8:22:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ref_TravellerChecklistDefinition](
	[CheckUID] [int] IDENTITY(1,1) NOT NULL,
	[GroupUID] [int] NULL,
	[CheckName] [varchar](100) NULL,
	[CheckDescription] [varchar](500) NULL,
	[Zindex] [int] NULL,
	[Visible] [bit] NULL,
	[Summary] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ref_TravellerTasksDefinition]    Script Date: 28/01/2019 8:22:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ref_TravellerTasksDefinition](
	[TaskUID] [int] IDENTITY(1,1) NOT NULL,
	[TaskLabel] [varchar](200) NULL,
	[ShortTaskLabel] [varchar](100) NULL,
	[TaskDescription] [varchar](500) NULL,
	[TaskActionRequired] [varchar](200) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ref_UserAccess]    Script Date: 28/01/2019 8:22:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ref_UserAccess](
	[UserAccessUID] [int] IDENTITY(1,1) NOT NULL,
	[UserUID] [int] NULL,
	[AccessList] [varchar](1000) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ref_UserList]    Script Date: 28/01/2019 8:22:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ref_UserList](
	[UserUID] [int] IDENTITY(1,1) NOT NULL,
	[SiteUID] [int] NULL,
	[ActiveUser] [bit] NULL,
	[ReadOnly] [bit] NULL,
	[SessionExpiryTime] [int] NULL,
	[AccessTickList] [varchar](500) NULL,
	[Username] [varchar](200) NULL,
	[Userpassword] [varchar](200) NULL,
	[Firstname] [varchar](200) NULL,
	[Surname] [varchar](200) NULL,
	[Title] [varchar](200) NULL,
	[EmailAddress] [varchar](200) NULL,
	[PhoneNumber] [varchar](200) NULL,
	[MobileNumber] [varchar](200) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ref_UserLoginHistory]    Script Date: 28/01/2019 8:22:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ref_UserLoginHistory](
	[HistoryUID] [int] IDENTITY(1,1) NOT NULL,
	[UserUID] [int] NULL,
	[LoginDateTime] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ref_VISADefinition]    Script Date: 28/01/2019 8:22:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ref_VISADefinition](
	[VISAUID] [int] IDENTITY(1,1) NOT NULL,
	[VISAName] [varchar](300) NULL,
	[VISADescription] [varchar](800) NULL,
	[VISAWebLinkName] [varchar](200) NULL,
	[VISAApplicationLink] [varchar](800) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[System_LockedTraveller]    Script Date: 28/01/2019 8:22:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[System_LockedTraveller](
	[TUID] [int] NULL,
	[UserName] [varchar](100) NULL,
	[LockDateTime] [datetime] NULL,
	[UserUID] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[System_LoggedInUsers]    Script Date: 28/01/2019 8:22:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[System_LoggedInUsers](
	[UserName] [varchar](100) NULL,
	[ActionTime] [datetime] NULL,
	[Section] [varchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[temp_GymPortalUserBalance]    Script Date: 28/01/2019 8:22:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[temp_GymPortalUserBalance](
	[TUserUID] [int] NULL,
	[AmountDue] [float] NULL,
	[AmountReceived] [float] NULL,
	[AmountOutstanding] [float] NULL
) ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [CHEER_DB] SET  READ_WRITE 
GO
