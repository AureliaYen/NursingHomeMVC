USE [fpdb2]
GO
/****** Object:  Table [dbo].[tActivity]    Script Date: 2023/4/3 下午 04:30:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tActivity](
	[actId] [int] IDENTITY(10000,1) NOT NULL,
	[eId] [int] NOT NULL,
	[act活動編號] [nvarchar](50) NOT NULL,
	[act活動名稱] [nvarchar](50) NOT NULL,
	[act活動說明] [nvarchar](max) NOT NULL,
	[act活動圖片] [nvarchar](max) NOT NULL,
	[act活動日期] [datetime] NOT NULL,
	[act地點] [nvarchar](50) NOT NULL,
	[act報名截止日] [datetime] NOT NULL,
	[act價格] [int] NOT NULL,
	[act主講人] [nvarchar](50) NOT NULL,
	[act主講人描述] [nvarchar](max) NOT NULL,
	[act注意事項] [nvarchar](max) NULL,
	[act公開狀態] [int] NOT NULL,
	[act已報名人數] [int] NOT NULL,
	[act最大人數] [int] NOT NULL,
	[act建立日期] [datetime] NOT NULL,
	[act修改日期] [datetime] NULL,
	[act最後修改人] [nvarchar](50) NULL,
	[act結案] [int] NULL,
	[act備註] [nvarchar](50) NULL,
 CONSTRAINT [PK_tActivityNumber] PRIMARY KEY CLUSTERED 
(
	[actId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tActivityCollect]    Script Date: 2023/4/3 下午 04:30:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tActivityCollect](
	[acoId] [int] IDENTITY(10000,1) NOT NULL,
	[aco活動Id] [int] NOT NULL,
	[aco會員Id] [int] NOT NULL,
	[aco收藏] [int] NOT NULL,
	[aco備註] [nvarchar](max) NULL,
 CONSTRAINT [PK_tActivityCollect] PRIMARY KEY CLUSTERED 
(
	[acoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tActivityComment]    Script Date: 2023/4/3 下午 04:30:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tActivityComment](
	[acId] [int] IDENTITY(10000,1) NOT NULL,
	[ac活動編號] [int] NOT NULL,
	[ac會員Id] [int] NOT NULL,
	[ac評價] [float] NOT NULL,
	[ac備註] [nvarchar](50) NULL,
 CONSTRAINT [PK_tActivityComment] PRIMARY KEY CLUSTERED 
(
	[acId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tActivityMessage]    Script Date: 2023/4/3 下午 04:30:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tActivityMessage](
	[amId] [int] IDENTITY(10000,1) NOT NULL,
	[am活動編號] [int] NOT NULL,
	[am會員Id] [int] NOT NULL,
	[am發送次數] [int] NOT NULL,
	[am繳費通知] [int] NOT NULL,
	[am報名成功] [int] NOT NULL,
	[am行前通知] [int] NOT NULL,
	[am緊急訊息] [int] NOT NULL,
	[am備註] [nvarchar](50) NULL,
 CONSTRAINT [PK_tActivityMessage] PRIMARY KEY CLUSTERED 
(
	[amId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tActivityOrder]    Script Date: 2023/4/3 下午 04:30:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tActivityOrder](
	[aoId] [int] IDENTITY(10000,1) NOT NULL,
	[ao會員Id] [int] NOT NULL,
	[ao參加人姓名] [nvarchar](max) NULL,
	[ao參加人電話] [nvarchar](max) NULL,
	[ao參加人Email] [nvarchar](max) NULL,
	[ao活動編號] [int] NOT NULL,
	[ao參與人數] [int] NULL,
	[ao訂單建立日期] [datetime] NOT NULL,
	[ao修改日期] [datetime] NULL,
	[ao修改人] [int] NULL,
	[ao訂單進度] [nvarchar](50) NOT NULL,
	[ao金額] [int] NOT NULL,
	[ao結案] [int] NULL,
	[ao備註] [nvarchar](50) NULL,
 CONSTRAINT [PK_tActivityOrder] PRIMARY KEY CLUSTERED 
(
	[aoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tApplicationForm]    Script Date: 2023/4/3 下午 04:30:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tApplicationForm](
	[appId] [int] IDENTITY(10000,1) NOT NULL,
	[pId] [int] NOT NULL,
	[eId] [int] NOT NULL,
	[famId] [int] NOT NULL,
	[oId] [int] NULL,
	[app申請人] [nvarchar](50) NOT NULL,
	[app陪同人員] [nvarchar](50) NOT NULL,
	[app聯絡方式] [nvarchar](50) NOT NULL,
	[app申請日期] [datetime] NOT NULL,
	[app外出日期] [datetime] NULL,
	[app事由] [nvarchar](50) NOT NULL,
	[app地點] [nvarchar](50) NOT NULL,
	[app出發時間] [datetime] NULL,
	[app預計外出時間] [int] NOT NULL,
	[app返回時間] [datetime] NULL,
	[app審核] [nvarchar](50) NULL,
	[app修改時間] [datetime] NULL,
	[app修改人員] [int] NULL,
	[app現況] [int] NULL,
	[app結案] [nvarchar](50) NULL,
	[app備註] [nvarchar](50) NULL,
 CONSTRAINT [PK_外出人員申請資料] PRIMARY KEY CLUSTERED 
(
	[appId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tBed]    Script Date: 2023/4/3 下午 04:30:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tBed](
	[bId] [int] IDENTITY(1,1) NOT NULL,
	[pId] [int] NULL,
	[rbId] [int] NULL,
	[b入住時間] [datetime] NULL,
	[b預計退房時間] [datetime] NULL,
	[b建立日期] [datetime] NULL,
	[b建立者工號] [nvarchar](50) NULL,
	[b修改日期] [datetime] NULL,
	[b修改者工號] [nvarchar](50) NULL,
 CONSTRAINT [PK_Bed] PRIMARY KEY CLUSTERED 
(
	[bId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tEmployee]    Script Date: 2023/4/3 下午 04:30:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tEmployee](
	[eId] [int] IDENTITY(1,1) NOT NULL,
	[e員工編號] [nvarchar](50) NULL,
	[e員工姓名] [nvarchar](50) NULL,
	[e電話] [nvarchar](50) NULL,
	[eEmail] [nvarchar](50) NULL,
	[e地址] [nvarchar](50) NULL,
	[e密碼] [nvarchar](50) NULL,
	[e性別] [nvarchar](50) NULL,
	[e身分證號] [nvarchar](50) NULL,
	[e職稱] [nvarchar](50) NULL,
	[e到職日期] [datetime] NULL,
	[e離職日期] [datetime] NULL,
	[e權限] [int] NULL,
	[e建立日期] [datetime] NULL,
	[e建立者工號] [nvarchar](50) NULL,
	[e修改日期] [datetime] NULL,
	[e修改者工號] [nvarchar](50) NULL,
	[e員工生日] [datetime] NULL,
	[eImagePath] [nvarchar](50) NULL,
 CONSTRAINT [PK_Employee.Shift] PRIMARY KEY CLUSTERED 
(
	[eId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tFamilyMembers]    Script Date: 2023/4/3 下午 04:30:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tFamilyMembers](
	[famId] [int] IDENTITY(1,1) NOT NULL,
	[pId] [int] NOT NULL,
	[fam姓名] [nvarchar](10) NOT NULL,
	[fam聯絡方式] [nvarchar](15) NOT NULL,
	[fam住址] [nvarchar](20) NOT NULL,
	[fam備註] [nvarchar](50) NULL,
 CONSTRAINT [PK_家屬資料表] PRIMARY KEY CLUSTERED 
(
	[famId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tImages]    Script Date: 2023/4/3 下午 04:30:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tImages](
	[maId] [int] IDENTITY(1,1) NOT NULL,
	[meId] [int] NULL,
	[月圖] [nvarchar](50) NULL,
	[早圖] [nvarchar](50) NULL,
	[午圖] [nvarchar](50) NULL,
	[晚圖] [nvarchar](50) NULL,
	[圖一] [nvarchar](50) NULL,
	[圖二] [nvarchar](50) NULL,
	[圖三] [nvarchar](50) NULL,
 CONSTRAINT [PK_tImages] PRIMARY KEY CLUSTERED 
(
	[maId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tMeal]    Script Date: 2023/4/3 下午 04:30:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tMeal](
	[meId] [int] IDENTITY(1,1) NOT NULL,
	[suId] [int] NULL,
	[月] [nvarchar](50) NULL,
	[餐種] [nvarchar](50) NULL,
	[餐別] [nvarchar](50) NULL,
	[價位] [nvarchar](50) NULL,
	[建立時間] [datetime] NULL,
	[修改時間] [datetime] NULL,
	[建立人] [nvarchar](50) NULL,
	[備註] [nvarchar](500) NULL,
 CONSTRAINT [PK_tMeal] PRIMARY KEY CLUSTERED 
(
	[meId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tMember]    Script Date: 2023/4/3 下午 04:30:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tMember](
	[mId] [int] IDENTITY(10000,1) NOT NULL,
	[m手機] [nvarchar](10) NOT NULL,
	[m密碼] [nvarchar](50) NOT NULL,
	[m姓名] [nvarchar](30) NOT NULL,
	[m性別] [bit] NULL,
	[mEmail] [nvarchar](80) NULL,
	[m照片] [nvarchar](100) NULL,
	[m住址] [nvarchar](100) NULL,
	[m加入時間] [datetime] NOT NULL,
	[m修改時間] [datetime] NULL,
	[m最後登入時間] [datetime] NULL,
	[m備註] [nvarchar](100) NULL,
	[m刪除會員] [bit] NULL,
	[m權限] [nvarchar](10) NULL,
 CONSTRAINT [PK_tMember] PRIMARY KEY CLUSTERED 
(
	[mId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tNursingRecord]    Script Date: 2023/4/3 下午 04:30:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tNursingRecord](
	[nId] [int] IDENTITY(1,1) NOT NULL,
	[eId] [int] NULL,
	[pId] [int] NULL,
	[oId] [int] NULL,
	[n舒張壓] [nvarchar](50) NULL,
	[n收縮壓] [nvarchar](50) NULL,
	[n體溫] [nvarchar](50) NULL,
	[n脈搏] [nvarchar](50) NULL,
	[n呼吸] [nvarchar](50) NULL,
	[n傷口] [nvarchar](200) NULL,
	[n三管] [nvarchar](50) NULL,
	[n其他] [nvarchar](200) NULL,
	[n紀錄時間] [nvarchar](50) NULL,
	[n修改時間] [nvarchar](50) NULL,
 CONSTRAINT [PK_nursingRecord] PRIMARY KEY CLUSTERED 
(
	[nId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tOffService]    Script Date: 2023/4/3 下午 04:30:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tOffService](
	[oId] [int] IDENTITY(1,1) NOT NULL,
	[eId] [int] NULL,
	[pId] [int] NULL,
	[o就診日期] [nvarchar](50) NULL,
	[o回診日期] [nvarchar](50) NULL,
	[o醫師診斷] [nvarchar](500) NULL,
	[o指示與用藥] [nvarchar](200) NULL,
	[o建立] [smalldatetime] NULL,
	[o更新] [smalldatetime] NULL,
 CONSTRAINT [PK_offService] PRIMARY KEY CLUSTERED 
(
	[oId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tOrder]    Script Date: 2023/4/3 下午 04:30:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tOrder](
	[m進貨編號] [int] IDENTITY(1,1) NOT NULL,
	[eId] [int] NULL,
	[m衛材編號] [int] NULL,
	[m訂購數量] [int] NULL,
	[m價錢] [money] NULL,
	[m小計] [money] NULL,
	[m訂購日期] [datetime] NULL,
	[m到貨日期] [datetime] NULL,
	[m庫存數量] [int] NULL,
	[m訂購狀態] [bit] NULL,
 CONSTRAINT [PK_tOrder] PRIMARY KEY CLUSTERED 
(
	[m進貨編號] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tOrderMeal]    Script Date: 2023/4/3 下午 04:30:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tOrderMeal](
	[omId] [int] IDENTITY(1,1) NOT NULL,
	[meId] [int] NULL,
	[訂購人] [nvarchar](50) NULL,
	[訂購人電話] [nvarchar](50) NULL,
	[訂餐起始日] [datetime] NULL,
	[訂餐結束日] [datetime] NULL,
	[總價] [nvarchar](50) NULL,
	[結帳狀態] [nvarchar](50) NULL,
	[建立時間] [datetime] NULL,
	[修改時間] [datetime] NULL,
	[修改人員] [nchar](10) NULL,
	[備註] [nvarchar](500) NULL,
 CONSTRAINT [PK_tOrderMeal] PRIMARY KEY CLUSTERED 
(
	[omId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tPatientInfo]    Script Date: 2023/4/3 下午 04:30:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tPatientInfo](
	[pId] [int] IDENTITY(1,1) NOT NULL,
	[p編號] [nvarchar](50) NULL,
	[eId] [int] NULL,
	[p姓名] [nvarchar](50) NULL,
	[p性別] [nvarchar](50) NULL,
	[p身分證字號] [varchar](10) NULL,
	[p出生日期] [nvarchar](50) NULL,
	[p地址] [nvarchar](80) NULL,
	[p聯絡電話] [varchar](15) NULL,
	[p聯絡人] [nvarchar](50) NULL,
	[p電話2] [varchar](15) NULL,
	[p餐點] [nvarchar](50) NULL,
	[p醫師診斷] [nvarchar](500) NULL,
	[p主訴] [nvarchar](500) NULL,
	[現在病史] [nvarchar](500) NULL,
	[過去病史] [nvarchar](500) NULL,
	[家族病史] [nvarchar](500) NULL,
	[檢查] [nvarchar](500) NULL,
	[指示與用藥] [nvarchar](500) NULL,
	[p建立] [smalldatetime] NULL,
	[p更新] [smalldatetime] NULL,
	[p照片] [nvarchar](50) NULL,
 CONSTRAINT [PK_patientInfo] PRIMARY KEY CLUSTERED 
(
	[pId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tProduct]    Script Date: 2023/4/3 下午 04:30:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tProduct](
	[m衛材編號] [int] IDENTITY(1,1) NOT NULL,
	[m衛材名稱] [nvarchar](100) NULL,
	[m單位] [nvarchar](10) NULL,
	[m單價] [money] NULL,
	[m庫存數量] [int] NULL,
	[m安全庫存數] [int] NULL,
	[m訂購狀態] [bit] NULL,
 CONSTRAINT [PK_tProduct] PRIMARY KEY CLUSTERED 
(
	[m衛材編號] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tRoombed]    Script Date: 2023/4/3 下午 04:30:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tRoombed](
	[rbId] [int] IDENTITY(1,1) NOT NULL,
	[rb房型] [nvarchar](50) NULL,
	[rb床號] [nvarchar](50) NULL,
	[rb空床] [nvarchar](50) NULL,
	[rb建立日期] [datetime] NULL,
	[rb建立者工號] [nvarchar](50) NULL,
	[rb修改日期] [datetime] NULL,
	[rb修改者工號] [nvarchar](50) NULL,
 CONSTRAINT [PK_tRoom] PRIMARY KEY CLUSTERED 
(
	[rbId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tShift]    Script Date: 2023/4/3 下午 04:30:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tShift](
	[sId] [int] IDENTITY(1,1) NOT NULL,
	[eId] [int] NULL,
	[s日期] [datetime] NULL,
	[s早班] [nvarchar](50) NULL,
	[s中班] [nvarchar](50) NULL,
	[s晚班] [nvarchar](50) NULL,
	[s休假] [nvarchar](50) NULL,
	[s備註] [nvarchar](50) NULL,
 CONSTRAINT [PK_tShift] PRIMARY KEY CLUSTERED 
(
	[sId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tSupplier]    Script Date: 2023/4/3 下午 04:30:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tSupplier](
	[suId] [int] IDENTITY(1,1) NOT NULL,
	[廠商名稱] [nvarchar](50) NULL,
	[廠商地址] [nvarchar](50) NULL,
	[廠商email] [nvarchar](50) NULL,
	[廠商電話] [nvarchar](50) NULL,
	[廠商聯絡人] [nvarchar](50) NULL,
	[聯絡人email] [nvarchar](50) NULL,
	[建立時間] [datetime] NULL,
	[修改時間] [datetime] NULL,
	[建立人] [nvarchar](50) NULL,
	[備註] [nvarchar](50) NULL,
 CONSTRAINT [PK_tSupplier] PRIMARY KEY CLUSTERED 
(
	[suId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tTake]    Script Date: 2023/4/3 下午 04:30:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tTake](
	[m領取編號] [int] IDENTITY(1,1) NOT NULL,
	[eId] [int] NULL,
	[m衛材編號] [int] NULL,
	[m領取數量] [int] NULL,
	[m領取時間] [datetime] NULL,
	[m用途] [nvarchar](100) NULL,
	[m庫存數量] [int] NULL,
 CONSTRAINT [PK_tTake] PRIMARY KEY CLUSTERED 
(
	[m領取編號] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tActivity] ON 

INSERT [dbo].[tActivity] ([actId], [eId], [act活動編號], [act活動名稱], [act活動說明], [act活動圖片], [act活動日期], [act地點], [act報名截止日], [act價格], [act主講人], [act主講人描述], [act注意事項], [act公開狀態], [act已報名人數], [act最大人數], [act建立日期], [act修改日期], [act最後修改人], [act結案], [act備註]) VALUES (10000, 1, N'20230326110000', N'呼吸健康', N'「保護呼吸系統：了解肺的功能、肺疾病的預防和治療」', N'2023-3-26-0-4-10.jpg', CAST(N'2023-03-31T00:00:00.000' AS DateTime), N'大廳', CAST(N'2023-03-28T00:00:00.000' AS DateTime), 333, N'裡天天醫師', N'致力聖約翰大學 胸腔科主治醫師', N'無', 1, 7, 15, CAST(N'2023-03-26T00:04:13.813' AS DateTime), CAST(N'2023-03-28T13:39:03.983' AS DateTime), N'陳宜蓁', 1, N'')
INSERT [dbo].[tActivity] ([actId], [eId], [act活動編號], [act活動名稱], [act活動說明], [act活動圖片], [act活動日期], [act地點], [act報名截止日], [act價格], [act主講人], [act主講人描述], [act注意事項], [act公開狀態], [act已報名人數], [act最大人數], [act建立日期], [act修改日期], [act最後修改人], [act結案], [act備註]) VALUES (10001, 1, N'20230326110001', N'呼吸健康', N'「保護呼吸系統：了解肺的功能、肺疾病的預防和治療」', N'2023-3-29-9-26-22.jpg', CAST(N'2023-04-04T00:00:00.000' AS DateTime), N'大廳', CAST(N'2023-03-28T00:00:00.000' AS DateTime), 333, N'裡天天醫師', N'致力聖約翰大學 胸腔科主治醫師', N'無', 1, 7, 15, CAST(N'2023-03-26T21:12:02.610' AS DateTime), CAST(N'2023-03-29T09:26:23.780' AS DateTime), N'陳宜蓁', 1, N'')
INSERT [dbo].[tActivity] ([actId], [eId], [act活動編號], [act活動名稱], [act活動說明], [act活動圖片], [act活動日期], [act地點], [act報名截止日], [act價格], [act主講人], [act主講人描述], [act注意事項], [act公開狀態], [act已報名人數], [act最大人數], [act建立日期], [act修改日期], [act最後修改人], [act結案], [act備註]) VALUES (10002, 1, N'20230327110002', N'呼吸健康', N'「保護呼吸系統：了解肺的功能、肺疾病的預防和治療」', N'2023-3-27-23-51-38.jpg', CAST(N'2023-04-08T00:00:00.000' AS DateTime), N'大廳', CAST(N'2023-03-28T00:00:00.000' AS DateTime), 333, N'裡天天醫師', N'致力聖約翰大學 胸腔科主治醫師', N'無', 0, 14, 20, CAST(N'2023-03-27T23:54:00.410' AS DateTime), CAST(N'2023-03-29T10:28:46.323' AS DateTime), N'陳宜蓁', 1, N'')
INSERT [dbo].[tActivity] ([actId], [eId], [act活動編號], [act活動名稱], [act活動說明], [act活動圖片], [act活動日期], [act地點], [act報名截止日], [act價格], [act主講人], [act主講人描述], [act注意事項], [act公開狀態], [act已報名人數], [act最大人數], [act建立日期], [act修改日期], [act最後修改人], [act結案], [act備註]) VALUES (10004, 1, N'20230328110003', N'呼吸健康', N'「保護呼吸系統：了解肺的功能、肺疾病的預防和治療」', N'2023-3-28-13-43-26.jpg', CAST(N'2023-04-03T00:00:00.000' AS DateTime), N'大廳', CAST(N'2023-03-28T00:00:00.000' AS DateTime), 333, N'裡天天醫師', N'致力聖約翰大學 胸腔科主治醫師', N'無', 0, 11, 20, CAST(N'2023-03-28T13:43:40.987' AS DateTime), CAST(N'2023-03-28T20:52:48.390' AS DateTime), N'陳宜蓁', 1, N'')
INSERT [dbo].[tActivity] ([actId], [eId], [act活動編號], [act活動名稱], [act活動說明], [act活動圖片], [act活動日期], [act地點], [act報名截止日], [act價格], [act主講人], [act主講人描述], [act注意事項], [act公開狀態], [act已報名人數], [act最大人數], [act建立日期], [act修改日期], [act最後修改人], [act結案], [act備註]) VALUES (10005, 1, N'20230328110005', N'皮膚護理', N'這場講座將介紹常見的皮膚疾病，例如痤瘡、濕疹和皮膚癌等，包括其症狀、治療和預防方法。', N'2023-3-29-10-29-50.jpg', CAST(N'2023-03-31T00:00:00.000' AS DateTime), N'大廳', CAST(N'2023-03-30T00:00:00.000' AS DateTime), 100, N'聖伯納 醫師', N'致力聖約翰大學 胸腔科主治醫師', N'無', 0, 0, 30, CAST(N'2023-03-28T20:38:35.417' AS DateTime), CAST(N'2023-03-29T20:05:11.023' AS DateTime), N'陳宜蓁', 0, N'')
INSERT [dbo].[tActivity] ([actId], [eId], [act活動編號], [act活動名稱], [act活動說明], [act活動圖片], [act活動日期], [act地點], [act報名截止日], [act價格], [act主講人], [act主講人描述], [act注意事項], [act公開狀態], [act已報名人數], [act最大人數], [act建立日期], [act修改日期], [act最後修改人], [act結案], [act備註]) VALUES (10006, 1, N'20230328110006', N'腫瘤攻略', N'「腫瘤攻略」將介紹腫瘤的成因、種類和症狀，探討最新的治療技術和預防方法，並提供關於腫瘤的實用資訊和建議，以幫助參與者更好地了解和應對這種常見的疾病。', N'2023-3-29-10-29-59.jpg', CAST(N'2023-04-08T00:00:00.000' AS DateTime), N'大廳', CAST(N'2023-03-31T00:00:00.000' AS DateTime), 333, N'治種劉 醫師', N'致力聖約翰大學 血管腫瘤主治醫師', N'無', 0, 0, 22, CAST(N'2023-03-28T20:47:01.357' AS DateTime), CAST(N'2023-03-29T20:05:12.837' AS DateTime), N'陳宜蓁', 0, N'')
INSERT [dbo].[tActivity] ([actId], [eId], [act活動編號], [act活動名稱], [act活動說明], [act活動圖片], [act活動日期], [act地點], [act報名截止日], [act價格], [act主講人], [act主講人描述], [act注意事項], [act公開狀態], [act已報名人數], [act最大人數], [act建立日期], [act修改日期], [act最後修改人], [act結案], [act備註]) VALUES (10007, 1, N'20230328110007', N'肝臟保健', N'「掌握肝臟健康要點：了解肝臟功能、預防與治療肝病」', N'2023-3-29-10-32-22.jpg', CAST(N'2023-04-05T00:00:00.000' AS DateTime), N'大廳', CAST(N'2023-04-01T00:00:00.000' AS DateTime), 90, N'肝不好 醫師', N'致力聖約翰大學 肝臟科 主治醫師', N'無', 1, 15, 30, CAST(N'2023-03-28T20:48:57.677' AS DateTime), CAST(N'2023-03-29T14:14:29.340' AS DateTime), N'陳宜蓁', 0, N'')
INSERT [dbo].[tActivity] ([actId], [eId], [act活動編號], [act活動名稱], [act活動說明], [act活動圖片], [act活動日期], [act地點], [act報名截止日], [act價格], [act主講人], [act主講人描述], [act注意事項], [act公開狀態], [act已報名人數], [act最大人數], [act建立日期], [act修改日期], [act最後修改人], [act結案], [act備註]) VALUES (10008, 1, N'20230328110008', N'步步輕鬆', N'腳步健康：了解足部結構、保護腳部健康、預防足病。', N'2023-3-29-10-30-19.jpg', CAST(N'2023-04-06T00:00:00.000' AS DateTime), N'大廳', CAST(N'2023-04-05T00:00:00.000' AS DateTime), 50, N'為鼓勵醫師', N'致力聖約翰大學 復健科 主治醫師', N'無', 1, 16, 20, CAST(N'2023-03-28T20:50:59.513' AS DateTime), CAST(N'2023-03-29T14:58:21.723' AS DateTime), N'陳宜蓁', 0, N'')
INSERT [dbo].[tActivity] ([actId], [eId], [act活動編號], [act活動名稱], [act活動說明], [act活動圖片], [act活動日期], [act地點], [act報名截止日], [act價格], [act主講人], [act主講人描述], [act注意事項], [act公開狀態], [act已報名人數], [act最大人數], [act建立日期], [act修改日期], [act最後修改人], [act結案], [act備註]) VALUES (10009, 1, N'20230329110009', N'呼吸健康', N'「保護呼吸系統：了解肺的功能、肺疾病的預防和治療」', N'2023-3-29-10-30-27.jpg', CAST(N'2023-04-15T00:00:00.000' AS DateTime), N'大廳', CAST(N'2023-04-10T00:00:00.000' AS DateTime), 333, N'裡天天醫師', N'致力聖約翰大學 胸腔科主治醫師', N'無', 1, 0, 15, CAST(N'2023-03-29T10:18:47.187' AS DateTime), CAST(N'2023-03-29T10:30:43.877' AS DateTime), N'陳宜蓁', 1, N'')
INSERT [dbo].[tActivity] ([actId], [eId], [act活動編號], [act活動名稱], [act活動說明], [act活動圖片], [act活動日期], [act地點], [act報名截止日], [act價格], [act主講人], [act主講人描述], [act注意事項], [act公開狀態], [act已報名人數], [act最大人數], [act建立日期], [act修改日期], [act最後修改人], [act結案], [act備註]) VALUES (10010, 1, N'20230329110010', N'呼吸健康', N'「保護呼吸系統：了解肺的功能、肺疾病的預防和治療」', N'2023-3-29-13-40-57.jpg', CAST(N'2023-04-15T00:00:00.000' AS DateTime), N'大廳', CAST(N'2023-04-10T00:00:00.000' AS DateTime), 333, N'裡天天醫師', N'致力聖約翰大學 胸腔科主治醫師', N'無', 1, 0, 1, CAST(N'2023-03-29T13:41:07.820' AS DateTime), CAST(N'2023-03-29T13:41:25.903' AS DateTime), N'陳宜蓁', 1, N'')
INSERT [dbo].[tActivity] ([actId], [eId], [act活動編號], [act活動名稱], [act活動說明], [act活動圖片], [act活動日期], [act地點], [act報名截止日], [act價格], [act主講人], [act主講人描述], [act注意事項], [act公開狀態], [act已報名人數], [act最大人數], [act建立日期], [act修改日期], [act最後修改人], [act結案], [act備註]) VALUES (10011, 1, N'20230329110011', N'呼吸健康', N'「保護呼吸系統：了解肺的功能、肺疾病的預防和治療」', N'2023-3-29-13-48-2.jpg', CAST(N'2023-04-15T00:00:00.000' AS DateTime), N'大廳', CAST(N'2023-04-10T00:00:00.000' AS DateTime), 333, N'裡天天醫師', N'致力聖約翰大學 胸腔科主治醫師', N'無', 1, 2, 15, CAST(N'2023-03-29T13:48:08.633' AS DateTime), CAST(N'2023-03-29T13:58:10.433' AS DateTime), N'陳宜蓁', 1, N'')
INSERT [dbo].[tActivity] ([actId], [eId], [act活動編號], [act活動名稱], [act活動說明], [act活動圖片], [act活動日期], [act地點], [act報名截止日], [act價格], [act主講人], [act主講人描述], [act注意事項], [act公開狀態], [act已報名人數], [act最大人數], [act建立日期], [act修改日期], [act最後修改人], [act結案], [act備註]) VALUES (10012, 1, N'20230329110012', N'呼吸健康', N'「保護呼吸系統：了解肺的功能、肺疾病的預防和治療」', N'2023-3-29-14-0-31.jpg', CAST(N'2023-05-04T00:00:00.000' AS DateTime), N'大廳', CAST(N'2023-04-11T00:00:00.000' AS DateTime), 333, N'裡天天醫師', N'致力聖約翰大學 胸腔科主治醫師', N'無', 1, 0, 3, CAST(N'2023-03-29T14:00:32.613' AS DateTime), CAST(N'2023-03-29T14:00:40.403' AS DateTime), N'陳宜蓁', 1, N'')
INSERT [dbo].[tActivity] ([actId], [eId], [act活動編號], [act活動名稱], [act活動說明], [act活動圖片], [act活動日期], [act地點], [act報名截止日], [act價格], [act主講人], [act主講人描述], [act注意事項], [act公開狀態], [act已報名人數], [act最大人數], [act建立日期], [act修改日期], [act最後修改人], [act結案], [act備註]) VALUES (10013, 1, N'20230329110013', N'呼吸健康', N'「保護呼吸系統：了解肺的功能、肺疾病的預防和治療」', N'2023-3-29-14-14-58.jpg', CAST(N'2023-04-15T00:00:00.000' AS DateTime), N'大廳', CAST(N'2023-04-10T00:00:00.000' AS DateTime), 333, N'裡天天醫師', N'致力聖約翰大學 胸腔科主治醫師', N'無', 1, 0, 11, CAST(N'2023-03-29T14:15:04.650' AS DateTime), NULL, NULL, 1, NULL)
INSERT [dbo].[tActivity] ([actId], [eId], [act活動編號], [act活動名稱], [act活動說明], [act活動圖片], [act活動日期], [act地點], [act報名截止日], [act價格], [act主講人], [act主講人描述], [act注意事項], [act公開狀態], [act已報名人數], [act最大人數], [act建立日期], [act修改日期], [act最後修改人], [act結案], [act備註]) VALUES (10014, 1, N'20230329110014', N'呼吸健康', N'「保護呼吸系統：了解肺的功能、肺疾病的預防和治療」', N'2023-3-29-14-38-1.jpg', CAST(N'2023-04-15T00:00:00.000' AS DateTime), N'大廳', CAST(N'2023-04-10T00:00:00.000' AS DateTime), 333, N'裡天天醫師', N'致力聖約翰大學 胸腔科主治醫師', N'無', 1, 0, 3, CAST(N'2023-03-29T14:38:03.330' AS DateTime), NULL, NULL, 1, NULL)
INSERT [dbo].[tActivity] ([actId], [eId], [act活動編號], [act活動名稱], [act活動說明], [act活動圖片], [act活動日期], [act地點], [act報名截止日], [act價格], [act主講人], [act主講人描述], [act注意事項], [act公開狀態], [act已報名人數], [act最大人數], [act建立日期], [act修改日期], [act最後修改人], [act結案], [act備註]) VALUES (10015, 1, N'20230329110015', N'呼吸健康', N'「保護呼吸系統：了解肺的功能、肺疾病的預防和治療」', N'2023-3-29-14-50-18.jpg', CAST(N'2023-04-15T00:00:00.000' AS DateTime), N'大廳', CAST(N'2023-04-10T00:00:00.000' AS DateTime), 333, N'裡天天醫師', N'致力聖約翰大學 胸腔科主治醫師', N'無', 1, 2, 3, CAST(N'2023-03-29T14:50:20.737' AS DateTime), CAST(N'2023-03-29T14:58:31.573' AS DateTime), N'陳宜蓁', 1, NULL)
INSERT [dbo].[tActivity] ([actId], [eId], [act活動編號], [act活動名稱], [act活動說明], [act活動圖片], [act活動日期], [act地點], [act報名截止日], [act價格], [act主講人], [act主講人描述], [act注意事項], [act公開狀態], [act已報名人數], [act最大人數], [act建立日期], [act修改日期], [act最後修改人], [act結案], [act備註]) VALUES (10016, 1, N'20230329110016', N'呼吸健康', N'「保護呼吸系統：了解肺的功能、肺疾病的預防和治療」', N'2023-3-29-14-58-43.jpg', CAST(N'2023-04-15T00:00:00.000' AS DateTime), N'大廳', CAST(N'2023-04-10T00:00:00.000' AS DateTime), 333, N'裡天天醫師', N'致力聖約翰大學 胸腔科主治醫師', N'無', 1, 0, 3, CAST(N'2023-03-29T14:58:45.807' AS DateTime), CAST(N'2023-03-29T15:00:51.630' AS DateTime), N'陳宜蓁', 1, NULL)
INSERT [dbo].[tActivity] ([actId], [eId], [act活動編號], [act活動名稱], [act活動說明], [act活動圖片], [act活動日期], [act地點], [act報名截止日], [act價格], [act主講人], [act主講人描述], [act注意事項], [act公開狀態], [act已報名人數], [act最大人數], [act建立日期], [act修改日期], [act最後修改人], [act結案], [act備註]) VALUES (10017, 1, N'20230329110017', N'呼吸健康', N'「保護呼吸系統：了解肺的功能、肺疾病的預防和治療」', N'2023-3-29-19-18-25.jpg', CAST(N'2023-04-15T00:00:00.000' AS DateTime), N'大廳', CAST(N'2023-04-10T00:00:00.000' AS DateTime), 333, N'裡天天醫師', N'致力聖約翰大學 胸腔科主治醫師', N'無', 1, 2, 3, CAST(N'2023-03-29T19:18:26.613' AS DateTime), NULL, NULL, 1, NULL)
INSERT [dbo].[tActivity] ([actId], [eId], [act活動編號], [act活動名稱], [act活動說明], [act活動圖片], [act活動日期], [act地點], [act報名截止日], [act價格], [act主講人], [act主講人描述], [act注意事項], [act公開狀態], [act已報名人數], [act最大人數], [act建立日期], [act修改日期], [act最後修改人], [act結案], [act備註]) VALUES (10018, 1, N'20230329110018', N'呼吸健康', N'「保護呼吸系統：了解肺的功能、肺疾病的預防和治療」', N'2023-3-29-19-26-22.jpg', CAST(N'2023-04-15T00:00:00.000' AS DateTime), N'大廳', CAST(N'2023-04-10T00:00:00.000' AS DateTime), 333, N'裡天天醫師', N'致力聖約翰大學 胸腔科主治醫師', N'無', 1, 3, 3, CAST(N'2023-03-29T19:26:26.073' AS DateTime), NULL, NULL, 1, NULL)
INSERT [dbo].[tActivity] ([actId], [eId], [act活動編號], [act活動名稱], [act活動說明], [act活動圖片], [act活動日期], [act地點], [act報名截止日], [act價格], [act主講人], [act主講人描述], [act注意事項], [act公開狀態], [act已報名人數], [act最大人數], [act建立日期], [act修改日期], [act最後修改人], [act結案], [act備註]) VALUES (10019, 1, N'20230329110019', N'呼吸健康', N'「保護呼吸系統：了解肺的功能、肺疾病的預防和治療」', N'2023-3-29-20-5-26.jpg', CAST(N'2023-04-15T00:00:00.000' AS DateTime), N'大廳', CAST(N'2023-04-10T00:00:00.000' AS DateTime), 333, N'裡天天醫師', N'致力聖約翰大學 胸腔科主治醫師', N'無', 1, 0, 3, CAST(N'2023-03-29T20:05:27.963' AS DateTime), NULL, NULL, 0, NULL)
SET IDENTITY_INSERT [dbo].[tActivity] OFF
GO
SET IDENTITY_INSERT [dbo].[tActivityOrder] ON 

INSERT [dbo].[tActivityOrder] ([aoId], [ao會員Id], [ao參加人姓名], [ao參加人電話], [ao參加人Email], [ao活動編號], [ao參與人數], [ao訂單建立日期], [ao修改日期], [ao修改人], [ao訂單進度], [ao金額], [ao結案], [ao備註]) VALUES (10000, 10001, N'', N'0911223344,0911223344,0911223344', N'aurelia@gmail.com,aurelia@gmail.com,aurelia@gmail.com', 10001, 3, CAST(N'2023-03-26T21:21:01.063' AS DateTime), CAST(N'2023-03-28T00:03:26.187' AS DateTime), 1, N'結案', 999, 1, NULL)
INSERT [dbo].[tActivityOrder] ([aoId], [ao會員Id], [ao參加人姓名], [ao參加人電話], [ao參加人Email], [ao活動編號], [ao參與人數], [ao訂單建立日期], [ao修改日期], [ao修改人], [ao訂單進度], [ao金額], [ao結案], [ao備註]) VALUES (10001, 10000, N'翔平,翔平', N'0911222333,0911222333', N'ttt@gmail.com,ttt@gmail.com', 10000, 2, CAST(N'2023-03-27T13:32:59.170' AS DateTime), CAST(N'2023-03-28T00:03:26.187' AS DateTime), 1, N'結案', 0, 1, NULL)
INSERT [dbo].[tActivityOrder] ([aoId], [ao會員Id], [ao參加人姓名], [ao參加人電話], [ao參加人Email], [ao活動編號], [ao參與人數], [ao訂單建立日期], [ao修改日期], [ao修改人], [ao訂單進度], [ao金額], [ao結案], [ao備註]) VALUES (10003, 10000, N'翔平', N'0911222333', N'ttt@gmail.com', 10000, 1, CAST(N'2023-03-27T19:37:31.427' AS DateTime), NULL, NULL, N'待發送繳費通知', 333, 1, NULL)
INSERT [dbo].[tActivityOrder] ([aoId], [ao會員Id], [ao參加人姓名], [ao參加人電話], [ao參加人Email], [ao活動編號], [ao參與人數], [ao訂單建立日期], [ao修改日期], [ao修改人], [ao訂單進度], [ao金額], [ao結案], [ao備註]) VALUES (10004, 10000, N'翔平', N'0911222333', N'ttt@gmail.com', 10000, 1, CAST(N'2023-03-27T19:49:26.467' AS DateTime), CAST(N'2023-03-29T13:19:07.193' AS DateTime), 1, N'結案', 333, 1, NULL)
INSERT [dbo].[tActivityOrder] ([aoId], [ao會員Id], [ao參加人姓名], [ao參加人電話], [ao參加人Email], [ao活動編號], [ao參與人數], [ao訂單建立日期], [ao修改日期], [ao修改人], [ao訂單進度], [ao金額], [ao結案], [ao備註]) VALUES (10005, 10000, N'翔平', N'0911222333', N'ttt@gmail.com', 10000, 1, CAST(N'2023-03-27T19:55:16.613' AS DateTime), CAST(N'2023-03-29T13:19:07.193' AS DateTime), 1, N'結案', 333, 1, NULL)
INSERT [dbo].[tActivityOrder] ([aoId], [ao會員Id], [ao參加人姓名], [ao參加人電話], [ao參加人Email], [ao活動編號], [ao參與人數], [ao訂單建立日期], [ao修改日期], [ao修改人], [ao訂單進度], [ao金額], [ao結案], [ao備註]) VALUES (10006, 10000, N'翔平,翔平,翔平,翔平', N'0911222333,0911222333,0911222333,0911222333', N'ttt@gmail.com,ttt@gmail.com,ttt@gmail.com,ttt@gmail.com', 10000, 4, CAST(N'2023-03-27T19:56:11.523' AS DateTime), CAST(N'2023-03-29T13:19:07.193' AS DateTime), 1, N'結案', 1332, 1, NULL)
INSERT [dbo].[tActivityOrder] ([aoId], [ao會員Id], [ao參加人姓名], [ao參加人電話], [ao參加人Email], [ao活動編號], [ao參與人數], [ao訂單建立日期], [ao修改日期], [ao修改人], [ao訂單進度], [ao金額], [ao結案], [ao備註]) VALUES (10007, 10000, N'翔平', N'0911222333', N'ttt@gmail.com', 10002, 1, CAST(N'2023-03-28T13:29:08.190' AS DateTime), CAST(N'2023-03-29T13:41:48.007' AS DateTime), 1, N'結案', 333, 1, NULL)
INSERT [dbo].[tActivityOrder] ([aoId], [ao會員Id], [ao參加人姓名], [ao參加人電話], [ao參加人Email], [ao活動編號], [ao參與人數], [ao訂單建立日期], [ao修改日期], [ao修改人], [ao訂單進度], [ao金額], [ao結案], [ao備註]) VALUES (10008, 10000, N'翔平', N'0911222333', N'ttt@gmail.com', 10000, 1, CAST(N'2023-03-28T13:31:09.713' AS DateTime), CAST(N'2023-03-29T13:41:48.007' AS DateTime), 1, N'結案', 333, 1, NULL)
INSERT [dbo].[tActivityOrder] ([aoId], [ao會員Id], [ao參加人姓名], [ao參加人電話], [ao參加人Email], [ao活動編號], [ao參與人數], [ao訂單建立日期], [ao修改日期], [ao修改人], [ao訂單進度], [ao金額], [ao結案], [ao備註]) VALUES (10009, 10000, N'翔平', N'0911222333', N'ttt@gmail.com', 10004, 1, CAST(N'2023-03-28T14:17:00.307' AS DateTime), CAST(N'2023-03-29T13:41:48.007' AS DateTime), 1, N'結案', 333, 1, NULL)
INSERT [dbo].[tActivityOrder] ([aoId], [ao會員Id], [ao參加人姓名], [ao參加人電話], [ao參加人Email], [ao活動編號], [ao參與人數], [ao訂單建立日期], [ao修改日期], [ao修改人], [ao訂單進度], [ao金額], [ao結案], [ao備註]) VALUES (10010, 10000, N'翔平', N'0911222333', N'ttt@gmail.com', 10004, 1, CAST(N'2023-03-28T14:23:32.203' AS DateTime), CAST(N'2023-03-29T13:41:48.003' AS DateTime), 1, N'結案', 333, 1, NULL)
INSERT [dbo].[tActivityOrder] ([aoId], [ao會員Id], [ao參加人姓名], [ao參加人電話], [ao參加人Email], [ao活動編號], [ao參與人數], [ao訂單建立日期], [ao修改日期], [ao修改人], [ao訂單進度], [ao金額], [ao結案], [ao備註]) VALUES (10011, 10000, N'翔平', N'0911222333', N'ttt@gmail.com', 10004, 1, CAST(N'2023-03-28T14:26:16.807' AS DateTime), CAST(N'2023-03-29T13:48:57.337' AS DateTime), 1, N'結案', 333, 1, NULL)
INSERT [dbo].[tActivityOrder] ([aoId], [ao會員Id], [ao參加人姓名], [ao參加人電話], [ao參加人Email], [ao活動編號], [ao參與人數], [ao訂單建立日期], [ao修改日期], [ao修改人], [ao訂單進度], [ao金額], [ao結案], [ao備註]) VALUES (10012, 10000, N'翔平', N'0911222333', N'ttt@gmail.com', 10004, 1, CAST(N'2023-03-28T14:26:52.547' AS DateTime), CAST(N'2023-03-29T13:48:57.333' AS DateTime), 1, N'結案', 333, 1, NULL)
INSERT [dbo].[tActivityOrder] ([aoId], [ao會員Id], [ao參加人姓名], [ao參加人電話], [ao參加人Email], [ao活動編號], [ao參與人數], [ao訂單建立日期], [ao修改日期], [ao修改人], [ao訂單進度], [ao金額], [ao結案], [ao備註]) VALUES (10013, 10000, N'翔平', N'0911222333', N'ttt@gmail.com', 10004, 1, CAST(N'2023-03-28T14:27:21.633' AS DateTime), CAST(N'2023-03-29T13:48:57.337' AS DateTime), 1, N'結案', 333, 1, NULL)
INSERT [dbo].[tActivityOrder] ([aoId], [ao會員Id], [ao參加人姓名], [ao參加人電話], [ao參加人Email], [ao活動編號], [ao參與人數], [ao訂單建立日期], [ao修改日期], [ao修改人], [ao訂單進度], [ao金額], [ao結案], [ao備註]) VALUES (10014, 10000, N'翔平', N'0911222333', N'ttt@gmail.com', 10004, 1, CAST(N'2023-03-28T14:27:57.323' AS DateTime), CAST(N'2023-03-29T14:00:52.983' AS DateTime), 1, N'結案', 333, 1, NULL)
INSERT [dbo].[tActivityOrder] ([aoId], [ao會員Id], [ao參加人姓名], [ao參加人電話], [ao參加人Email], [ao活動編號], [ao參與人數], [ao訂單建立日期], [ao修改日期], [ao修改人], [ao訂單進度], [ao金額], [ao結案], [ao備註]) VALUES (10015, 10000, N'翔平', N'0911222333', N'ttt@gmail.com', 10004, 1, CAST(N'2023-03-28T14:28:13.983' AS DateTime), CAST(N'2023-03-29T14:00:52.983' AS DateTime), 1, N'結案', 333, 1, NULL)
INSERT [dbo].[tActivityOrder] ([aoId], [ao會員Id], [ao參加人姓名], [ao參加人電話], [ao參加人Email], [ao活動編號], [ao參與人數], [ao訂單建立日期], [ao修改日期], [ao修改人], [ao訂單進度], [ao金額], [ao結案], [ao備註]) VALUES (10016, 10000, N'翔平', N'0911222333', N'ttt@gmail.com', 10004, 1, CAST(N'2023-03-28T14:28:27.570' AS DateTime), CAST(N'2023-03-29T14:00:52.987' AS DateTime), 1, N'結案', 333, 1, NULL)
INSERT [dbo].[tActivityOrder] ([aoId], [ao會員Id], [ao參加人姓名], [ao參加人電話], [ao參加人Email], [ao活動編號], [ao參與人數], [ao訂單建立日期], [ao修改日期], [ao修改人], [ao訂單進度], [ao金額], [ao結案], [ao備註]) VALUES (10017, 10000, N'翔平', N'0911222333', N'ttt@gmail.com', 10004, 1, CAST(N'2023-03-28T14:28:43.340' AS DateTime), CAST(N'2023-03-29T14:00:52.987' AS DateTime), 1, N'結案', 333, 1, NULL)
INSERT [dbo].[tActivityOrder] ([aoId], [ao會員Id], [ao參加人姓名], [ao參加人電話], [ao參加人Email], [ao活動編號], [ao參與人數], [ao訂單建立日期], [ao修改日期], [ao修改人], [ao訂單進度], [ao金額], [ao結案], [ao備註]) VALUES (10018, 10000, N'翔平', N'0911222333', N'0821tomcat@gmail.com', 10004, 1, CAST(N'2023-03-28T14:36:42.817' AS DateTime), NULL, NULL, N'待發送繳費通知', 333, 1, NULL)
INSERT [dbo].[tActivityOrder] ([aoId], [ao會員Id], [ao參加人姓名], [ao參加人電話], [ao參加人Email], [ao活動編號], [ao參與人數], [ao訂單建立日期], [ao修改日期], [ao修改人], [ao訂單進度], [ao金額], [ao結案], [ao備註]) VALUES (10019, 10000, N'翔平', N'0911222333', N'0821tomcat@gmail.com', 10004, 1, CAST(N'2023-03-28T14:39:18.133' AS DateTime), NULL, NULL, N'待發送繳費通知', 333, 1, NULL)
INSERT [dbo].[tActivityOrder] ([aoId], [ao會員Id], [ao參加人姓名], [ao參加人電話], [ao參加人Email], [ao活動編號], [ao參與人數], [ao訂單建立日期], [ao修改日期], [ao修改人], [ao訂單進度], [ao金額], [ao結案], [ao備註]) VALUES (10020, 10000, N'翔平', N'0911222333', N'0821tomcat@gmail.com', 10004, 1, CAST(N'2023-03-28T14:40:01.580' AS DateTime), NULL, NULL, N'待發送繳費通知', 333, 1, NULL)
INSERT [dbo].[tActivityOrder] ([aoId], [ao會員Id], [ao參加人姓名], [ao參加人電話], [ao參加人Email], [ao活動編號], [ao參與人數], [ao訂單建立日期], [ao修改日期], [ao修改人], [ao訂單進度], [ao金額], [ao結案], [ao備註]) VALUES (10021, 10000, N'翔平', N'0911222333', N'0821tomcat@gmail.com', 10004, 1, CAST(N'2023-03-28T14:40:52.680' AS DateTime), NULL, NULL, N'待發送繳費通知', 333, 1, NULL)
INSERT [dbo].[tActivityOrder] ([aoId], [ao會員Id], [ao參加人姓名], [ao參加人電話], [ao參加人Email], [ao活動編號], [ao參與人數], [ao訂單建立日期], [ao修改日期], [ao修改人], [ao訂單進度], [ao金額], [ao結案], [ao備註]) VALUES (10022, 10000, N'翔平', N'0911222333', N'0821tomcat@gmail.com', 10004, 1, CAST(N'2023-03-28T14:41:33.093' AS DateTime), NULL, NULL, N'待發送繳費通知', 333, 1, NULL)
INSERT [dbo].[tActivityOrder] ([aoId], [ao會員Id], [ao參加人姓名], [ao參加人電話], [ao參加人Email], [ao活動編號], [ao參與人數], [ao訂單建立日期], [ao修改日期], [ao修改人], [ao訂單進度], [ao金額], [ao結案], [ao備註]) VALUES (10023, 10000, N'翔平', N'0911222333', N'0821tomcat@gmail.com', 10004, 1, CAST(N'2023-03-28T14:43:25.480' AS DateTime), NULL, NULL, N'待發送繳費通知', 333, 1, NULL)
INSERT [dbo].[tActivityOrder] ([aoId], [ao會員Id], [ao參加人姓名], [ao參加人電話], [ao參加人Email], [ao活動編號], [ao參與人數], [ao訂單建立日期], [ao修改日期], [ao修改人], [ao訂單進度], [ao金額], [ao結案], [ao備註]) VALUES (10024, 10000, N'翔平', N'0911222333', N'0821tomcat@gmail.com', 10002, 1, CAST(N'2023-03-28T14:46:04.933' AS DateTime), NULL, NULL, N'待發送繳費通知', 333, 1, NULL)
INSERT [dbo].[tActivityOrder] ([aoId], [ao會員Id], [ao參加人姓名], [ao參加人電話], [ao參加人Email], [ao活動編號], [ao參與人數], [ao訂單建立日期], [ao修改日期], [ao修改人], [ao訂單進度], [ao金額], [ao結案], [ao備註]) VALUES (10025, 10000, N'翔平', N'0911222333', N'0821tomcat@gmail.com', 10002, 1, CAST(N'2023-03-28T14:46:29.140' AS DateTime), NULL, NULL, N'待發送繳費通知', 333, 1, NULL)
INSERT [dbo].[tActivityOrder] ([aoId], [ao會員Id], [ao參加人姓名], [ao參加人電話], [ao參加人Email], [ao活動編號], [ao參與人數], [ao訂單建立日期], [ao修改日期], [ao修改人], [ao訂單進度], [ao金額], [ao結案], [ao備註]) VALUES (10026, 10000, N'翔平', N'0911222333', N'0821tomcat@gmail.com', 10002, 1, CAST(N'2023-03-28T14:47:51.133' AS DateTime), NULL, NULL, N'待發送繳費通知', 333, 1, NULL)
INSERT [dbo].[tActivityOrder] ([aoId], [ao會員Id], [ao參加人姓名], [ao參加人電話], [ao參加人Email], [ao活動編號], [ao參與人數], [ao訂單建立日期], [ao修改日期], [ao修改人], [ao訂單進度], [ao金額], [ao結案], [ao備註]) VALUES (10027, 10000, N'翔平', N'0911222333', N'0821tomcat@gmail.com', 10001, 1, CAST(N'2023-03-28T14:48:17.387' AS DateTime), NULL, NULL, N'待發送繳費通知', 333, 1, NULL)
INSERT [dbo].[tActivityOrder] ([aoId], [ao會員Id], [ao參加人姓名], [ao參加人電話], [ao參加人Email], [ao活動編號], [ao參與人數], [ao訂單建立日期], [ao修改日期], [ao修改人], [ao訂單進度], [ao金額], [ao結案], [ao備註]) VALUES (10028, 10000, N'翔平', N'0911222333', N'0821tomcat@gmail.com', 10002, 1, CAST(N'2023-03-28T14:51:41.023' AS DateTime), NULL, NULL, N'待發送繳費通知', 333, 1, NULL)
INSERT [dbo].[tActivityOrder] ([aoId], [ao會員Id], [ao參加人姓名], [ao參加人電話], [ao參加人Email], [ao活動編號], [ao參與人數], [ao訂單建立日期], [ao修改日期], [ao修改人], [ao訂單進度], [ao金額], [ao結案], [ao備註]) VALUES (10029, 10000, N'翔平', N'0911222333', N'0821tomcat@gmail.com', 10002, 1, CAST(N'2023-03-28T15:18:52.650' AS DateTime), NULL, NULL, N'待發送繳費通知', 333, 1, NULL)
INSERT [dbo].[tActivityOrder] ([aoId], [ao會員Id], [ao參加人姓名], [ao參加人電話], [ao參加人Email], [ao活動編號], [ao參與人數], [ao訂單建立日期], [ao修改日期], [ao修改人], [ao訂單進度], [ao金額], [ao結案], [ao備註]) VALUES (10030, 10000, N'翔平', N'0911222333', N'0821tomcat@gmail.com', 10002, 1, CAST(N'2023-03-28T15:21:29.943' AS DateTime), NULL, NULL, N'待發送繳費通知', 333, 1, NULL)
INSERT [dbo].[tActivityOrder] ([aoId], [ao會員Id], [ao參加人姓名], [ao參加人電話], [ao參加人Email], [ao活動編號], [ao參與人數], [ao訂單建立日期], [ao修改日期], [ao修改人], [ao訂單進度], [ao金額], [ao結案], [ao備註]) VALUES (10031, 10000, N'翔平', N'0911222333', N'0821tomcat@gmail.com', 10002, 1, CAST(N'2023-03-28T15:28:43.410' AS DateTime), NULL, NULL, N'待發送繳費通知', 333, 1, NULL)
INSERT [dbo].[tActivityOrder] ([aoId], [ao會員Id], [ao參加人姓名], [ao參加人電話], [ao參加人Email], [ao活動編號], [ao參與人數], [ao訂單建立日期], [ao修改日期], [ao修改人], [ao訂單進度], [ao金額], [ao結案], [ao備註]) VALUES (10032, 10000, N'翔平', N'0911222333', N'0821tomcat@gmail.com', 10002, 1, CAST(N'2023-03-28T15:33:05.680' AS DateTime), NULL, NULL, N'待發送繳費通知', 333, 1, NULL)
INSERT [dbo].[tActivityOrder] ([aoId], [ao會員Id], [ao參加人姓名], [ao參加人電話], [ao參加人Email], [ao活動編號], [ao參與人數], [ao訂單建立日期], [ao修改日期], [ao修改人], [ao訂單進度], [ao金額], [ao結案], [ao備註]) VALUES (10033, 10000, N'翔平', N'0911222333', N'0821tomcat@gmail.com', 10002, 1, CAST(N'2023-03-28T15:33:37.247' AS DateTime), NULL, NULL, N'待發送繳費通知', 333, 1, NULL)
INSERT [dbo].[tActivityOrder] ([aoId], [ao會員Id], [ao參加人姓名], [ao參加人電話], [ao參加人Email], [ao活動編號], [ao參與人數], [ao訂單建立日期], [ao修改日期], [ao修改人], [ao訂單進度], [ao金額], [ao結案], [ao備註]) VALUES (10034, 10000, N'翔平', N'0911222333', N'0821tomcat@gmail.com', 10002, 1, CAST(N'2023-03-28T15:33:47.283' AS DateTime), NULL, NULL, N'待發送繳費通知', 333, 1, NULL)
INSERT [dbo].[tActivityOrder] ([aoId], [ao會員Id], [ao參加人姓名], [ao參加人電話], [ao參加人Email], [ao活動編號], [ao參與人數], [ao訂單建立日期], [ao修改日期], [ao修改人], [ao訂單進度], [ao金額], [ao結案], [ao備註]) VALUES (10035, 10000, N'翔平', N'0911222333', N'0821tomcat@gmail.com', 10002, 1, CAST(N'2023-03-28T15:34:32.983' AS DateTime), NULL, NULL, N'待發送繳費通知', 333, 1, NULL)
INSERT [dbo].[tActivityOrder] ([aoId], [ao會員Id], [ao參加人姓名], [ao參加人電話], [ao參加人Email], [ao活動編號], [ao參與人數], [ao訂單建立日期], [ao修改日期], [ao修改人], [ao訂單進度], [ao金額], [ao結案], [ao備註]) VALUES (10036, 10000, N'翔平', N'0911222333', N'0821tomcat@gmail.com', 10002, 1, CAST(N'2023-03-28T16:15:49.747' AS DateTime), NULL, NULL, N'待發送繳費通知', 333, 1, NULL)
INSERT [dbo].[tActivityOrder] ([aoId], [ao會員Id], [ao參加人姓名], [ao參加人電話], [ao參加人Email], [ao活動編號], [ao參與人數], [ao訂單建立日期], [ao修改日期], [ao修改人], [ao訂單進度], [ao金額], [ao結案], [ao備註]) VALUES (10037, 10000, N'翔平', N'0911222333', N'0821tomcat@gmail.com', 10002, 1, CAST(N'2023-03-28T16:19:08.740' AS DateTime), NULL, NULL, N'待發送繳費通知', 333, 1, NULL)
INSERT [dbo].[tActivityOrder] ([aoId], [ao會員Id], [ao參加人姓名], [ao參加人電話], [ao參加人Email], [ao活動編號], [ao參與人數], [ao訂單建立日期], [ao修改日期], [ao修改人], [ao訂單進度], [ao金額], [ao結案], [ao備註]) VALUES (10038, 10000, N'翔平', N'0911222333', N'0821tomcat@gmail.com', 10001, 1, CAST(N'2023-03-28T16:21:12.203' AS DateTime), NULL, NULL, N'待發送繳費通知', 333, 1, NULL)
INSERT [dbo].[tActivityOrder] ([aoId], [ao會員Id], [ao參加人姓名], [ao參加人電話], [ao參加人Email], [ao活動編號], [ao參與人數], [ao訂單建立日期], [ao修改日期], [ao修改人], [ao訂單進度], [ao金額], [ao結案], [ao備註]) VALUES (10039, 10000, N'翔平', N'0911222333', N'0821tomcat@gmail.com', 10001, 1, CAST(N'2023-03-28T16:24:13.357' AS DateTime), NULL, NULL, N'待發送繳費通知', 333, 1, NULL)
INSERT [dbo].[tActivityOrder] ([aoId], [ao會員Id], [ao參加人姓名], [ao參加人電話], [ao參加人Email], [ao活動編號], [ao參與人數], [ao訂單建立日期], [ao修改日期], [ao修改人], [ao訂單進度], [ao金額], [ao結案], [ao備註]) VALUES (10040, 10000, N'翔平', N'0911222333', N'0821tomcat@gmail.com', 10001, 1, CAST(N'2023-03-28T16:28:34.047' AS DateTime), NULL, NULL, N'待發送繳費通知', 333, 1, NULL)
INSERT [dbo].[tActivityOrder] ([aoId], [ao會員Id], [ao參加人姓名], [ao參加人電話], [ao參加人Email], [ao活動編號], [ao參與人數], [ao訂單建立日期], [ao修改日期], [ao修改人], [ao訂單進度], [ao金額], [ao結案], [ao備註]) VALUES (10041, 10000, N'翔平', N'0911222333', N'0821tomcat@gmail.com', 10001, 1, CAST(N'2023-03-28T16:45:48.560' AS DateTime), NULL, NULL, N'待發送繳費通知', 333, 1, NULL)
INSERT [dbo].[tActivityOrder] ([aoId], [ao會員Id], [ao參加人姓名], [ao參加人電話], [ao參加人Email], [ao活動編號], [ao參與人數], [ao訂單建立日期], [ao修改日期], [ao修改人], [ao訂單進度], [ao金額], [ao結案], [ao備註]) VALUES (10042, 10000, N'翔平,翔平,翔平', N'0911222333,0911222333,0911222333', N'0821tomcat@gmail.com,0821tomcat@gmail.com,0821tomcat@gmail.com', 10007, 3, CAST(N'2023-03-29T13:36:47.753' AS DateTime), NULL, NULL, N'待發送繳費通知', 270, 1, NULL)
INSERT [dbo].[tActivityOrder] ([aoId], [ao會員Id], [ao參加人姓名], [ao參加人電話], [ao參加人Email], [ao活動編號], [ao參與人數], [ao訂單建立日期], [ao修改日期], [ao修改人], [ao訂單進度], [ao金額], [ao結案], [ao備註]) VALUES (10043, 10000, N'翔平,翔平,翔平', N'0911222333,0911222333,0911222333', N'0821tomcat@gmail.com,0821tomcat@gmail.com,0821tomcat@gmail.com', 10007, 3, CAST(N'2023-03-29T13:39:29.450' AS DateTime), NULL, NULL, N'待發送繳費通知', 270, 1, NULL)
INSERT [dbo].[tActivityOrder] ([aoId], [ao會員Id], [ao參加人姓名], [ao參加人電話], [ao參加人Email], [ao活動編號], [ao參與人數], [ao訂單建立日期], [ao修改日期], [ao修改人], [ao訂單進度], [ao金額], [ao結案], [ao備註]) VALUES (10044, 10000, N'翔平,翔平,翔平', N'0911222333,0911222333,0911222333', N'0821tomcat@gmail.com,0821tomcat@gmail.com,0821tomcat@gmail.com', 10007, 3, CAST(N'2023-03-29T13:40:09.220' AS DateTime), CAST(N'2023-03-29T13:40:29.383' AS DateTime), 10000, N'待發送繳費通知', 270, 1, NULL)
INSERT [dbo].[tActivityOrder] ([aoId], [ao會員Id], [ao參加人姓名], [ao參加人電話], [ao參加人Email], [ao活動編號], [ao參與人數], [ao訂單建立日期], [ao修改日期], [ao修改人], [ao訂單進度], [ao金額], [ao結案], [ao備註]) VALUES (10045, 10000, N'翔平', N'0911222333', N'0821tomcat@gmail.com', 10007, 1, CAST(N'2023-03-29T13:47:25.923' AS DateTime), CAST(N'2023-03-29T13:47:38.163' AS DateTime), 10000, N'待發送繳費通知', 90, 1, NULL)
INSERT [dbo].[tActivityOrder] ([aoId], [ao會員Id], [ao參加人姓名], [ao參加人電話], [ao參加人Email], [ao活動編號], [ao參與人數], [ao訂單建立日期], [ao修改日期], [ao修改人], [ao訂單進度], [ao金額], [ao結案], [ao備註]) VALUES (10046, 10000, N'翔平,翔平', N'0911222333,0911222333', N'0821tomcat@gmail.com,0821tomcat@gmail.com', 10011, 2, CAST(N'2023-03-29T13:56:35.563' AS DateTime), CAST(N'2023-03-29T13:56:58.593' AS DateTime), 10000, N'待發送繳費通知', 666, 1, NULL)
INSERT [dbo].[tActivityOrder] ([aoId], [ao會員Id], [ao參加人姓名], [ao參加人電話], [ao參加人Email], [ao活動編號], [ao參與人數], [ao訂單建立日期], [ao修改日期], [ao修改人], [ao訂單進度], [ao金額], [ao結案], [ao備註]) VALUES (10047, 10000, N'翔平,翔平', N'0911222333,0911222333', N'0821tomcat@gmail.com,0821tomcat@gmail.com', 10007, 2, CAST(N'2023-03-29T13:59:35.967' AS DateTime), CAST(N'2023-03-29T14:06:18.367' AS DateTime), 10000, N'待發送繳費通知', 180, 1, NULL)
INSERT [dbo].[tActivityOrder] ([aoId], [ao會員Id], [ao參加人姓名], [ao參加人電話], [ao參加人Email], [ao活動編號], [ao參與人數], [ao訂單建立日期], [ao修改日期], [ao修改人], [ao訂單進度], [ao金額], [ao結案], [ao備註]) VALUES (10048, 10000, N'翔平,翔平,翔平', N'0911222333,0911222333,0911222333', N'0821tomcat@gmail.com,0821tomcat@gmail.com,0821tomcat@gmail.com', 10007, 3, CAST(N'2023-03-29T14:09:57.400' AS DateTime), CAST(N'2023-03-29T14:10:16.650' AS DateTime), 10000, N'待發送繳費通知', 270, 1, NULL)
INSERT [dbo].[tActivityOrder] ([aoId], [ao會員Id], [ao參加人姓名], [ao參加人電話], [ao參加人Email], [ao活動編號], [ao參與人數], [ao訂單建立日期], [ao修改日期], [ao修改人], [ao訂單進度], [ao金額], [ao結案], [ao備註]) VALUES (10049, 10000, N'翔平, 翔平', N'0911222333,0911222333', N'0821tomcat@gmail.com,0821tomcat@gmail.com', 10007, 2, CAST(N'2023-03-29T14:13:57.180' AS DateTime), CAST(N'2023-03-29T14:38:19.710' AS DateTime), 1, N'結案', 180, 1, NULL)
INSERT [dbo].[tActivityOrder] ([aoId], [ao會員Id], [ao參加人姓名], [ao參加人電話], [ao參加人Email], [ao活動編號], [ao參與人數], [ao訂單建立日期], [ao修改日期], [ao修改人], [ao訂單進度], [ao金額], [ao結案], [ao備註]) VALUES (10050, 10000, N'翔平,翔平,翔平', N'0911222333,0911222333,0911222333', N'0821tomcat@gmail.com,0821tomcat@gmail.com,0821tomcat@gmail.com', 10008, 3, CAST(N'2023-03-29T14:37:08.413' AS DateTime), CAST(N'2023-03-29T14:59:02.480' AS DateTime), 1, N'結案', 150, 1, NULL)
INSERT [dbo].[tActivityOrder] ([aoId], [ao會員Id], [ao參加人姓名], [ao參加人電話], [ao參加人Email], [ao活動編號], [ao參與人數], [ao訂單建立日期], [ao修改日期], [ao修改人], [ao訂單進度], [ao金額], [ao結案], [ao備註]) VALUES (10051, 10000, N'翔平,翔平,翔平', N'0911222333,0911222333,0911222333', N'0821tomcat@gmail.com,0821tomcat@gmail.com,0821tomcat@gmail.com', 10008, 3, CAST(N'2023-03-29T14:49:31.983' AS DateTime), CAST(N'2023-03-29T14:50:37.117' AS DateTime), 1, N'結案', 150, 1, NULL)
INSERT [dbo].[tActivityOrder] ([aoId], [ao會員Id], [ao參加人姓名], [ao參加人電話], [ao參加人Email], [ao活動編號], [ao參與人數], [ao訂單建立日期], [ao修改日期], [ao修改人], [ao訂單進度], [ao金額], [ao結案], [ao備註]) VALUES (10052, 10000, N'翔平,翔平', N'0911222333,0911222333', N'0821tomcat@gmail.com,0821tomcat@gmail.com', 10015, 2, CAST(N'2023-03-29T14:57:43.690' AS DateTime), CAST(N'2023-03-29T19:18:41.997' AS DateTime), 1, N'結案', 666, 1, NULL)
INSERT [dbo].[tActivityOrder] ([aoId], [ao會員Id], [ao參加人姓名], [ao參加人電話], [ao參加人Email], [ao活動編號], [ao參與人數], [ao訂單建立日期], [ao修改日期], [ao修改人], [ao訂單進度], [ao金額], [ao結案], [ao備註]) VALUES (10053, 10000, N'翔平', N'0911222333', N'0821tomcat@gmail.com', 10008, 1, CAST(N'2023-03-29T19:15:37.333' AS DateTime), CAST(N'2023-03-29T19:26:42.307' AS DateTime), 1, N'結案', 50, 1, NULL)
INSERT [dbo].[tActivityOrder] ([aoId], [ao會員Id], [ao參加人姓名], [ao參加人電話], [ao參加人Email], [ao活動編號], [ao參與人數], [ao訂單建立日期], [ao修改日期], [ao修改人], [ao訂單進度], [ao金額], [ao結案], [ao備註]) VALUES (10054, 10000, N'翔平,翔平,翔平', N'0911222333,0911222333,0911222333', N'0821tomcat@gmail.com,0821tomcat@gmail.com,0821tomcat@gmail.com', 10008, 3, CAST(N'2023-03-29T19:17:36.947' AS DateTime), CAST(N'2023-03-29T20:05:43.280' AS DateTime), 1, N'結案', 150, 1, NULL)
INSERT [dbo].[tActivityOrder] ([aoId], [ao會員Id], [ao參加人姓名], [ao參加人電話], [ao參加人Email], [ao活動編號], [ao參與人數], [ao訂單建立日期], [ao修改日期], [ao修改人], [ao訂單進度], [ao金額], [ao結案], [ao備註]) VALUES (10055, 10000, N'翔平,翔平', N'0911222333,0911222333', N'0821tomcat@gmail.com,0821tomcat@gmail.com', 10017, 2, CAST(N'2023-03-29T19:23:27.903' AS DateTime), CAST(N'2023-03-29T20:05:43.280' AS DateTime), 1, N'結案', 666, 1, NULL)
INSERT [dbo].[tActivityOrder] ([aoId], [ao會員Id], [ao參加人姓名], [ao參加人電話], [ao參加人Email], [ao活動編號], [ao參與人數], [ao訂單建立日期], [ao修改日期], [ao修改人], [ao訂單進度], [ao金額], [ao結案], [ao備註]) VALUES (10056, 10000, N'翔平,翔平,翔平', N'0911222333,0911222333,0911222333', N'0821tomcat@gmail.com,0821tomcat@gmail.com,0821tomcat@gmail.com', 10008, 3, CAST(N'2023-03-29T19:25:30.903' AS DateTime), CAST(N'2023-03-29T19:25:50.047' AS DateTime), 10000, N'待發送繳費通知', 150, 0, NULL)
INSERT [dbo].[tActivityOrder] ([aoId], [ao會員Id], [ao參加人姓名], [ao參加人電話], [ao參加人Email], [ao活動編號], [ao參與人數], [ao訂單建立日期], [ao修改日期], [ao修改人], [ao訂單進度], [ao金額], [ao結案], [ao備註]) VALUES (10057, 10000, N'翔平,翔平,翔平', N'0911222333,0911222333,0911222333', N'0821tomcat@gmail.com,0821tomcat@gmail.com,0821tomcat@gmail.com', 10018, 3, CAST(N'2023-03-29T20:02:15.377' AS DateTime), CAST(N'2023-03-29T20:02:34.667' AS DateTime), 10000, N'待發送繳費通知', 999, 0, NULL)
INSERT [dbo].[tActivityOrder] ([aoId], [ao會員Id], [ao參加人姓名], [ao參加人電話], [ao參加人Email], [ao活動編號], [ao參與人數], [ao訂單建立日期], [ao修改日期], [ao修改人], [ao訂單進度], [ao金額], [ao結案], [ao備註]) VALUES (10058, 10000, N'翔平,翔平,翔平', N'0911222333,0911222333,0911222333', N'0821tomcat@gmail.com,0821tomcat@gmail.com,0821tomcat@gmail.com', 10008, 3, CAST(N'2023-03-29T20:04:39.633' AS DateTime), CAST(N'2023-03-29T20:04:58.260' AS DateTime), 10000, N'待發送繳費通知', 150, 0, NULL)
INSERT [dbo].[tActivityOrder] ([aoId], [ao會員Id], [ao參加人姓名], [ao參加人電話], [ao參加人Email], [ao活動編號], [ao參與人數], [ao訂單建立日期], [ao修改日期], [ao修改人], [ao訂單進度], [ao金額], [ao結案], [ao備註]) VALUES (10059, 10000, N'翔平,翔平,翔平,翔平', N'0911222333,0911222333,0911222333,0911222333', N'0821tomcat@gmail.com,0821tomcat@gmail.com,0821tomcat@gmail.com,0821tomcat@gmail.com', 10019, 4, CAST(N'2023-04-03T15:01:16.417' AS DateTime), CAST(N'2023-04-03T15:02:02.347' AS DateTime), 10000, N'待發送繳費通知', 1332, 0, NULL)
SET IDENTITY_INSERT [dbo].[tActivityOrder] OFF
GO
SET IDENTITY_INSERT [dbo].[tApplicationForm] ON 

INSERT [dbo].[tApplicationForm] ([appId], [pId], [eId], [famId], [oId], [app申請人], [app陪同人員], [app聯絡方式], [app申請日期], [app外出日期], [app事由], [app地點], [app出發時間], [app預計外出時間], [app返回時間], [app審核], [app修改時間], [app修改人員], [app現況], [app結案], [app備註]) VALUES (10000, 4, 1, 4, NULL, N'江坤宇', N'江坤宇', N'0929880558', CAST(N'2023-03-25T00:00:00.000' AS DateTime), CAST(N'2023-03-29T00:00:00.000' AS DateTime), N'復健', N'成大', CAST(N'2023-03-29T19:14:15.853' AS DateTime), 9, CAST(N'2023-03-29T19:28:08.023' AS DateTime), N'1', CAST(N'2023-03-29T19:28:08.023' AS DateTime), 1, 0, N'1', NULL)
INSERT [dbo].[tApplicationForm] ([appId], [pId], [eId], [famId], [oId], [app申請人], [app陪同人員], [app聯絡方式], [app申請日期], [app外出日期], [app事由], [app地點], [app出發時間], [app預計外出時間], [app返回時間], [app審核], [app修改時間], [app修改人員], [app現況], [app結案], [app備註]) VALUES (10001, 7, 5, 7, NULL, N'陳鏞基', N'陳鏞基', N'0960687176', CAST(N'2023-03-25T00:00:00.000' AS DateTime), CAST(N'2023-03-29T00:00:00.000' AS DateTime), N'復健', N'成大', CAST(N'2023-03-29T19:28:04.850' AS DateTime), 3, CAST(N'2023-03-29T19:32:12.857' AS DateTime), N'1', CAST(N'2023-03-29T19:32:12.857' AS DateTime), 1, 0, N'1', NULL)
INSERT [dbo].[tApplicationForm] ([appId], [pId], [eId], [famId], [oId], [app申請人], [app陪同人員], [app聯絡方式], [app申請日期], [app外出日期], [app事由], [app地點], [app出發時間], [app預計外出時間], [app返回時間], [app審核], [app修改時間], [app修改人員], [app現況], [app結案], [app備註]) VALUES (10002, 1, 1, 1, NULL, N'林岱安', N'林岱安', N'0958063840', CAST(N'2023-03-27T00:00:00.000' AS DateTime), CAST(N'2023-03-29T00:00:00.000' AS DateTime), N'復健', N'成大', CAST(N'2023-03-29T19:32:08.047' AS DateTime), 3, NULL, N'1', CAST(N'2023-03-29T19:32:08.047' AS DateTime), 1, 1, N'0', NULL)
INSERT [dbo].[tApplicationForm] ([appId], [pId], [eId], [famId], [oId], [app申請人], [app陪同人員], [app聯絡方式], [app申請日期], [app外出日期], [app事由], [app地點], [app出發時間], [app預計外出時間], [app返回時間], [app審核], [app修改時間], [app修改人員], [app現況], [app結案], [app備註]) VALUES (10003, 6, 4, 6, NULL, N'王柏融', N'王柏融', N'0911333555', CAST(N'2023-03-25T00:00:00.000' AS DateTime), CAST(N'2023-03-29T00:00:00.000' AS DateTime), N'復健', N'成大醫院', CAST(N'2023-03-29T19:14:11.880' AS DateTime), 4, NULL, N'1', CAST(N'2023-03-29T19:14:11.880' AS DateTime), 1, 1, N'0', NULL)
INSERT [dbo].[tApplicationForm] ([appId], [pId], [eId], [famId], [oId], [app申請人], [app陪同人員], [app聯絡方式], [app申請日期], [app外出日期], [app事由], [app地點], [app出發時間], [app預計外出時間], [app返回時間], [app審核], [app修改時間], [app修改人員], [app現況], [app結案], [app備註]) VALUES (10004, 4, 1, 4, NULL, N'江坤宇', N'江坤宇', N'0929880558', CAST(N'2023-03-26T00:00:00.000' AS DateTime), CAST(N'2023-03-31T00:00:00.000' AS DateTime), N'復健', N'成大', NULL, 9, NULL, N'0', CAST(N'2023-03-26T21:08:09.090' AS DateTime), 0, 0, N'0', NULL)
INSERT [dbo].[tApplicationForm] ([appId], [pId], [eId], [famId], [oId], [app申請人], [app陪同人員], [app聯絡方式], [app申請日期], [app外出日期], [app事由], [app地點], [app出發時間], [app預計外出時間], [app返回時間], [app審核], [app修改時間], [app修改人員], [app現況], [app結案], [app備註]) VALUES (10005, 4, 1, 4, NULL, N'江坤宇', N'江坤宇', N'0929880558', CAST(N'2023-03-27T00:00:00.000' AS DateTime), CAST(N'2023-03-30T00:00:00.000' AS DateTime), N'外出', N'成大', NULL, 3, NULL, N'1', CAST(N'2023-03-27T23:30:11.397' AS DateTime), 1, 0, N'0', NULL)
INSERT [dbo].[tApplicationForm] ([appId], [pId], [eId], [famId], [oId], [app申請人], [app陪同人員], [app聯絡方式], [app申請日期], [app外出日期], [app事由], [app地點], [app出發時間], [app預計外出時間], [app返回時間], [app審核], [app修改時間], [app修改人員], [app現況], [app結案], [app備註]) VALUES (10006, 1, 1, 1, NULL, N'林岱安', N'林岱安', N'0958063840', CAST(N'2023-03-11T00:00:00.000' AS DateTime), CAST(N'2023-03-14T00:00:00.000' AS DateTime), N'復健', N'成大', NULL, 12, NULL, N'1', CAST(N'2023-03-27T23:35:19.790' AS DateTime), 0, 0, N'1', NULL)
INSERT [dbo].[tApplicationForm] ([appId], [pId], [eId], [famId], [oId], [app申請人], [app陪同人員], [app聯絡方式], [app申請日期], [app外出日期], [app事由], [app地點], [app出發時間], [app預計外出時間], [app返回時間], [app審核], [app修改時間], [app修改人員], [app現況], [app結案], [app備註]) VALUES (10007, 1, 1, 1, NULL, N'林岱安', N'林岱安', N'0958063840', CAST(N'2023-03-16T00:00:00.000' AS DateTime), CAST(N'2023-03-22T00:00:00.000' AS DateTime), N'復健', N'成大', NULL, 12, NULL, N'1', CAST(N'2023-03-28T22:24:53.610' AS DateTime), 0, 0, N'1', NULL)
INSERT [dbo].[tApplicationForm] ([appId], [pId], [eId], [famId], [oId], [app申請人], [app陪同人員], [app聯絡方式], [app申請日期], [app外出日期], [app事由], [app地點], [app出發時間], [app預計外出時間], [app返回時間], [app審核], [app修改時間], [app修改人員], [app現況], [app結案], [app備註]) VALUES (10008, 12, 4, 12, NULL, N'洪一中', N'洪一中', N'0988111333', CAST(N'2023-03-15T00:00:00.000' AS DateTime), CAST(N'2023-03-31T00:00:00.000' AS DateTime), N'回診', N'奇美', NULL, 3, NULL, N'0', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tApplicationForm] ([appId], [pId], [eId], [famId], [oId], [app申請人], [app陪同人員], [app聯絡方式], [app申請日期], [app外出日期], [app事由], [app地點], [app出發時間], [app預計外出時間], [app返回時間], [app審核], [app修改時間], [app修改人員], [app現況], [app結案], [app備註]) VALUES (10009, 25, 5, 25, NULL, N'許竹見', N'許竹見', N'0999777666', CAST(N'2023-03-02T00:00:00.000' AS DateTime), CAST(N'2023-03-17T00:00:00.000' AS DateTime), N'復健', N'奇美', NULL, 8, NULL, N'0', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tApplicationForm] ([appId], [pId], [eId], [famId], [oId], [app申請人], [app陪同人員], [app聯絡方式], [app申請日期], [app外出日期], [app事由], [app地點], [app出發時間], [app預計外出時間], [app返回時間], [app審核], [app修改時間], [app修改人員], [app現況], [app結案], [app備註]) VALUES (10010, 9, 6, 9, NULL, N'葉志仙', N'葉志仙', N'0911888333', CAST(N'2023-02-27T00:00:00.000' AS DateTime), CAST(N'2023-03-01T00:00:00.000' AS DateTime), N'回診', N'台大', NULL, 8, NULL, N'0', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tApplicationForm] ([appId], [pId], [eId], [famId], [oId], [app申請人], [app陪同人員], [app聯絡方式], [app申請日期], [app外出日期], [app事由], [app地點], [app出發時間], [app預計外出時間], [app返回時間], [app審核], [app修改時間], [app修改人員], [app現況], [app結案], [app備註]) VALUES (10011, 11, 5, 11, NULL, N'林英傑', N'林英傑', N'0977111666', CAST(N'2023-03-03T00:00:00.000' AS DateTime), CAST(N'2023-03-07T00:00:00.000' AS DateTime), N'復健', N'榮總', NULL, 9, NULL, N'0', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tApplicationForm] ([appId], [pId], [eId], [famId], [oId], [app申請人], [app陪同人員], [app聯絡方式], [app申請日期], [app外出日期], [app事由], [app地點], [app出發時間], [app預計外出時間], [app返回時間], [app審核], [app修改時間], [app修改人員], [app現況], [app結案], [app備註]) VALUES (10012, 17, 2, 17, NULL, N'林威助', N'林威助', N'0977111666', CAST(N'2023-03-05T00:00:00.000' AS DateTime), CAST(N'2023-03-12T00:00:00.000' AS DateTime), N'外出', N'家中', NULL, 10, NULL, N'0', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tApplicationForm] ([appId], [pId], [eId], [famId], [oId], [app申請人], [app陪同人員], [app聯絡方式], [app申請日期], [app外出日期], [app事由], [app地點], [app出發時間], [app預計外出時間], [app返回時間], [app審核], [app修改時間], [app修改人員], [app現況], [app結案], [app備註]) VALUES (10013, 18, 1, 18, NULL, N'陽耀勳', N'陽耀勳', N'0933666666', CAST(N'2023-03-17T00:00:00.000' AS DateTime), CAST(N'2023-03-25T00:00:00.000' AS DateTime), N'回診', N'台大', NULL, 3, NULL, N'0', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tApplicationForm] ([appId], [pId], [eId], [famId], [oId], [app申請人], [app陪同人員], [app聯絡方式], [app申請日期], [app外出日期], [app事由], [app地點], [app出發時間], [app預計外出時間], [app返回時間], [app審核], [app修改時間], [app修改人員], [app現況], [app結案], [app備註]) VALUES (10014, 23, 4, 23, NULL, N'姜建銘', N'姜建銘', N'0922333777', CAST(N'2023-03-20T00:00:00.000' AS DateTime), CAST(N'2023-03-27T00:00:00.000' AS DateTime), N'其他', N'成大', NULL, 3, NULL, N'0', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tApplicationForm] ([appId], [pId], [eId], [famId], [oId], [app申請人], [app陪同人員], [app聯絡方式], [app申請日期], [app外出日期], [app事由], [app地點], [app出發時間], [app預計外出時間], [app返回時間], [app審核], [app修改時間], [app修改人員], [app現況], [app結案], [app備註]) VALUES (10015, 15, 4, 15, NULL, N'郭泓志', N'郭泓志', N'0911222555', CAST(N'2023-03-22T00:00:00.000' AS DateTime), CAST(N'2023-03-24T00:00:00.000' AS DateTime), N'復健', N'敏勝', NULL, 8, NULL, N'0', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tApplicationForm] ([appId], [pId], [eId], [famId], [oId], [app申請人], [app陪同人員], [app聯絡方式], [app申請日期], [app外出日期], [app事由], [app地點], [app出發時間], [app預計外出時間], [app返回時間], [app審核], [app修改時間], [app修改人員], [app現況], [app結案], [app備註]) VALUES (10016, 1, 1, 1, NULL, N'林岱安', N'林岱安', N'0958063840', CAST(N'2023-03-29T00:00:00.000' AS DateTime), CAST(N'2023-04-04T00:00:00.000' AS DateTime), N'復健', N'成大', NULL, 3, NULL, N'0', CAST(N'2023-03-29T10:12:31.147' AS DateTime), NULL, 0, N'0', N'')
INSERT [dbo].[tApplicationForm] ([appId], [pId], [eId], [famId], [oId], [app申請人], [app陪同人員], [app聯絡方式], [app申請日期], [app外出日期], [app事由], [app地點], [app出發時間], [app預計外出時間], [app返回時間], [app審核], [app修改時間], [app修改人員], [app現況], [app結案], [app備註]) VALUES (10017, 4, 1, 4, NULL, N'江坤宇', N'江坤宇', N'0929880558', CAST(N'2023-03-29T00:00:00.000' AS DateTime), CAST(N'2023-05-06T00:00:00.000' AS DateTime), N'復健', N'成大', NULL, 12, NULL, N'1', CAST(N'2023-03-29T15:01:18.570' AS DateTime), 1, 0, N'1', N'')
INSERT [dbo].[tApplicationForm] ([appId], [pId], [eId], [famId], [oId], [app申請人], [app陪同人員], [app聯絡方式], [app申請日期], [app外出日期], [app事由], [app地點], [app出發時間], [app預計外出時間], [app返回時間], [app審核], [app修改時間], [app修改人員], [app現況], [app結案], [app備註]) VALUES (10018, 1, 1, 1, NULL, N'林岱安', N'林岱安', N'0958063840', CAST(N'2023-03-29T00:00:00.000' AS DateTime), CAST(N'2023-06-14T00:00:00.000' AS DateTime), N'復健', N'成大', NULL, 12, NULL, N'0', CAST(N'2023-03-29T13:50:16.333' AS DateTime), 0, 0, N'1', N'')
INSERT [dbo].[tApplicationForm] ([appId], [pId], [eId], [famId], [oId], [app申請人], [app陪同人員], [app聯絡方式], [app申請日期], [app外出日期], [app事由], [app地點], [app出發時間], [app預計外出時間], [app返回時間], [app審核], [app修改時間], [app修改人員], [app現況], [app結案], [app備註]) VALUES (10019, 4, 1, 4, NULL, N'江坤宇', N'江坤宇', N'0929880558', CAST(N'2023-03-29T00:00:00.000' AS DateTime), CAST(N'2023-04-26T00:00:00.000' AS DateTime), N'復健', N'成大', NULL, 12, NULL, N'1', CAST(N'2023-03-29T14:16:07.257' AS DateTime), 0, 0, N'1', N'')
INSERT [dbo].[tApplicationForm] ([appId], [pId], [eId], [famId], [oId], [app申請人], [app陪同人員], [app聯絡方式], [app申請日期], [app外出日期], [app事由], [app地點], [app出發時間], [app預計外出時間], [app返回時間], [app審核], [app修改時間], [app修改人員], [app現況], [app結案], [app備註]) VALUES (10020, 1, 1, 1, NULL, N'林岱安', N'林岱安', N'0958063840', CAST(N'2023-03-29T00:00:00.000' AS DateTime), CAST(N'2023-04-09T00:00:00.000' AS DateTime), N'復健', N'成大', NULL, 12, NULL, N'1', CAST(N'2023-03-29T14:38:51.613' AS DateTime), 1, 0, N'1', N'')
INSERT [dbo].[tApplicationForm] ([appId], [pId], [eId], [famId], [oId], [app申請人], [app陪同人員], [app聯絡方式], [app申請日期], [app外出日期], [app事由], [app地點], [app出發時間], [app預計外出時間], [app返回時間], [app審核], [app修改時間], [app修改人員], [app現況], [app結案], [app備註]) VALUES (10021, 1, 1, 1, NULL, N'林岱安', N'林岱安', N'0958063840', CAST(N'2023-03-29T00:00:00.000' AS DateTime), CAST(N'2023-04-29T00:00:00.000' AS DateTime), N'復健', N'成大', NULL, 12, NULL, N'1', CAST(N'2023-03-29T14:51:16.603' AS DateTime), 1, 0, N'1', N'')
INSERT [dbo].[tApplicationForm] ([appId], [pId], [eId], [famId], [oId], [app申請人], [app陪同人員], [app聯絡方式], [app申請日期], [app外出日期], [app事由], [app地點], [app出發時間], [app預計外出時間], [app返回時間], [app審核], [app修改時間], [app修改人員], [app現況], [app結案], [app備註]) VALUES (10022, 1, 1, 1, NULL, N'林岱安', N'林岱安', N'0958063840', CAST(N'2023-03-29T00:00:00.000' AS DateTime), CAST(N'2023-05-06T00:00:00.000' AS DateTime), N'復健', N'成大', NULL, 9, NULL, N'1', CAST(N'2023-03-29T15:01:18.567' AS DateTime), 1, 0, N'1', N'')
INSERT [dbo].[tApplicationForm] ([appId], [pId], [eId], [famId], [oId], [app申請人], [app陪同人員], [app聯絡方式], [app申請日期], [app外出日期], [app事由], [app地點], [app出發時間], [app預計外出時間], [app返回時間], [app審核], [app修改時間], [app修改人員], [app現況], [app結案], [app備註]) VALUES (10023, 1, 1, 1, NULL, N'林岱安', N'林岱安', N'0958063840', CAST(N'2023-03-29T00:00:00.000' AS DateTime), CAST(N'2023-04-09T00:00:00.000' AS DateTime), N'復健', N'成大', NULL, 12, NULL, N'0', CAST(N'2023-03-29T19:27:40.687' AS DateTime), 0, 0, N'0', N'')
INSERT [dbo].[tApplicationForm] ([appId], [pId], [eId], [famId], [oId], [app申請人], [app陪同人員], [app聯絡方式], [app申請日期], [app外出日期], [app事由], [app地點], [app出發時間], [app預計外出時間], [app返回時間], [app審核], [app修改時間], [app修改人員], [app現況], [app結案], [app備註]) VALUES (10024, 1, 1, 1, NULL, N'林岱安', N'林岱安', N'0958063840', CAST(N'2023-03-29T00:00:00.000' AS DateTime), CAST(N'2023-04-09T00:00:00.000' AS DateTime), N'復健', N'成大', NULL, 9, NULL, N'1', CAST(N'2023-03-29T19:30:21.190' AS DateTime), 1, 0, N'0', N'')
INSERT [dbo].[tApplicationForm] ([appId], [pId], [eId], [famId], [oId], [app申請人], [app陪同人員], [app聯絡方式], [app申請日期], [app外出日期], [app事由], [app地點], [app出發時間], [app預計外出時間], [app返回時間], [app審核], [app修改時間], [app修改人員], [app現況], [app結案], [app備註]) VALUES (10025, 1, 1, 1, NULL, N'林岱安', N'林岱安', N'0958063840', CAST(N'2023-03-29T00:00:00.000' AS DateTime), CAST(N'2023-04-09T00:00:00.000' AS DateTime), N'復健', N'成大', NULL, 12, NULL, N'0', CAST(N'2023-03-29T19:31:06.860' AS DateTime), 0, 0, N'0', N'')
INSERT [dbo].[tApplicationForm] ([appId], [pId], [eId], [famId], [oId], [app申請人], [app陪同人員], [app聯絡方式], [app申請日期], [app外出日期], [app事由], [app地點], [app出發時間], [app預計外出時間], [app返回時間], [app審核], [app修改時間], [app修改人員], [app現況], [app結案], [app備註]) VALUES (10026, 1, 1, 1, NULL, N'林岱安', N'林岱安', N'0958063840', CAST(N'2023-03-29T00:00:00.000' AS DateTime), CAST(N'2023-04-09T00:00:00.000' AS DateTime), N'復健', N'成大', NULL, 12, NULL, N'0', CAST(N'2023-03-29T19:31:51.873' AS DateTime), 0, 0, N'0', N'')
SET IDENTITY_INSERT [dbo].[tApplicationForm] OFF
GO
SET IDENTITY_INSERT [dbo].[tBed] ON 

INSERT [dbo].[tBed] ([bId], [pId], [rbId], [b入住時間], [b預計退房時間], [b建立日期], [b建立者工號], [b修改日期], [b修改者工號]) VALUES (1, 1, 1, CAST(N'2022-02-04T00:00:00.000' AS DateTime), CAST(N'2023-11-30T00:00:00.000' AS DateTime), CAST(N'2022-02-04T00:00:00.000' AS DateTime), N'E230313162521', CAST(N'2022-02-04T00:00:00.000' AS DateTime), N'E230313162521')
INSERT [dbo].[tBed] ([bId], [pId], [rbId], [b入住時間], [b預計退房時間], [b建立日期], [b建立者工號], [b修改日期], [b修改者工號]) VALUES (2, 2, 13, CAST(N'2022-02-17T00:00:00.000' AS DateTime), CAST(N'2023-06-08T00:00:00.000' AS DateTime), CAST(N'2022-02-17T00:00:00.000' AS DateTime), N'E230313162521', CAST(N'2022-02-17T00:00:00.000' AS DateTime), N'E230313162521')
INSERT [dbo].[tBed] ([bId], [pId], [rbId], [b入住時間], [b預計退房時間], [b建立日期], [b建立者工號], [b修改日期], [b修改者工號]) VALUES (3, 3, 25, CAST(N'2022-03-09T00:00:00.000' AS DateTime), CAST(N'2023-06-06T00:00:00.000' AS DateTime), CAST(N'2022-03-09T00:00:00.000' AS DateTime), N'E230313162521', CAST(N'2022-03-09T00:00:00.000' AS DateTime), N'E230313162521')
INSERT [dbo].[tBed] ([bId], [pId], [rbId], [b入住時間], [b預計退房時間], [b建立日期], [b建立者工號], [b修改日期], [b修改者工號]) VALUES (4, 4, 2, CAST(N'2022-03-11T00:00:00.000' AS DateTime), CAST(N'2023-10-29T00:00:00.000' AS DateTime), CAST(N'2022-03-11T00:00:00.000' AS DateTime), N'E230313162521', CAST(N'2022-03-11T00:00:00.000' AS DateTime), N'E230313162521')
INSERT [dbo].[tBed] ([bId], [pId], [rbId], [b入住時間], [b預計退房時間], [b建立日期], [b建立者工號], [b修改日期], [b修改者工號]) VALUES (5, 5, 9, CAST(N'2022-04-02T00:00:00.000' AS DateTime), CAST(N'2023-03-31T00:00:00.000' AS DateTime), CAST(N'2022-04-02T00:00:00.000' AS DateTime), N'E230313162521', CAST(N'2022-04-02T00:00:00.000' AS DateTime), N'E230313162521')
INSERT [dbo].[tBed] ([bId], [pId], [rbId], [b入住時間], [b預計退房時間], [b建立日期], [b建立者工號], [b修改日期], [b修改者工號]) VALUES (6, 6, 5, CAST(N'2022-04-21T00:00:00.000' AS DateTime), CAST(N'2023-07-11T00:00:00.000' AS DateTime), CAST(N'2022-04-21T00:00:00.000' AS DateTime), N'E230313162521', CAST(N'2022-04-21T00:00:00.000' AS DateTime), N'E230313162521')
INSERT [dbo].[tBed] ([bId], [pId], [rbId], [b入住時間], [b預計退房時間], [b建立日期], [b建立者工號], [b修改日期], [b修改者工號]) VALUES (7, 7, 15, CAST(N'2022-05-19T00:00:00.000' AS DateTime), CAST(N'2023-10-10T00:00:00.000' AS DateTime), CAST(N'2022-05-19T00:00:00.000' AS DateTime), N'E230313162521', CAST(N'2022-05-19T00:00:00.000' AS DateTime), N'E230313162521')
INSERT [dbo].[tBed] ([bId], [pId], [rbId], [b入住時間], [b預計退房時間], [b建立日期], [b建立者工號], [b修改日期], [b修改者工號]) VALUES (8, 8, 8, CAST(N'2022-05-27T00:00:00.000' AS DateTime), CAST(N'2024-02-06T00:00:00.000' AS DateTime), CAST(N'2022-05-27T00:00:00.000' AS DateTime), N'E230313162521', CAST(N'2022-05-27T00:00:00.000' AS DateTime), N'E230313162521')
INSERT [dbo].[tBed] ([bId], [pId], [rbId], [b入住時間], [b預計退房時間], [b建立日期], [b建立者工號], [b修改日期], [b修改者工號]) VALUES (9, 9, 3, CAST(N'2022-06-01T00:00:00.000' AS DateTime), CAST(N'2023-08-02T00:00:00.000' AS DateTime), CAST(N'2022-06-01T00:00:00.000' AS DateTime), N'E230313162521', CAST(N'2022-06-01T00:00:00.000' AS DateTime), N'E230313162521')
INSERT [dbo].[tBed] ([bId], [pId], [rbId], [b入住時間], [b預計退房時間], [b建立日期], [b建立者工號], [b修改日期], [b修改者工號]) VALUES (10, 10, 23, CAST(N'2023-06-21T00:00:00.000' AS DateTime), CAST(N'2023-08-17T00:00:00.000' AS DateTime), CAST(N'2023-06-21T00:00:00.000' AS DateTime), N'E230313162521', CAST(N'2023-06-21T00:00:00.000' AS DateTime), N'E230313162521')
INSERT [dbo].[tBed] ([bId], [pId], [rbId], [b入住時間], [b預計退房時間], [b建立日期], [b建立者工號], [b修改日期], [b修改者工號]) VALUES (11, 11, 4, CAST(N'2022-06-30T00:00:00.000' AS DateTime), CAST(N'2023-06-30T00:00:00.000' AS DateTime), CAST(N'2022-06-30T00:00:00.000' AS DateTime), N'E230313162521', CAST(N'2022-06-30T00:00:00.000' AS DateTime), N'E230313162521')
INSERT [dbo].[tBed] ([bId], [pId], [rbId], [b入住時間], [b預計退房時間], [b建立日期], [b建立者工號], [b修改日期], [b修改者工號]) VALUES (12, 12, 26, CAST(N'2022-08-02T00:00:00.000' AS DateTime), CAST(N'2023-10-02T00:00:00.000' AS DateTime), CAST(N'2022-08-02T00:00:00.000' AS DateTime), N'E230313162521', CAST(N'2022-08-02T00:00:00.000' AS DateTime), N'E230313162521')
INSERT [dbo].[tBed] ([bId], [pId], [rbId], [b入住時間], [b預計退房時間], [b建立日期], [b建立者工號], [b修改日期], [b修改者工號]) VALUES (13, 13, 14, CAST(N'2022-08-12T00:00:00.000' AS DateTime), CAST(N'2023-11-08T00:00:00.000' AS DateTime), CAST(N'2022-08-12T00:00:00.000' AS DateTime), N'E230313162521', CAST(N'2022-08-12T00:00:00.000' AS DateTime), N'E230313162521')
INSERT [dbo].[tBed] ([bId], [pId], [rbId], [b入住時間], [b預計退房時間], [b建立日期], [b建立者工號], [b修改日期], [b修改者工號]) VALUES (14, 14, 6, CAST(N'2022-08-31T00:00:00.000' AS DateTime), CAST(N'2023-08-31T00:00:00.000' AS DateTime), CAST(N'2022-08-31T00:00:00.000' AS DateTime), N'E230313162521', CAST(N'2022-08-31T00:00:00.000' AS DateTime), N'E230313162521')
INSERT [dbo].[tBed] ([bId], [pId], [rbId], [b入住時間], [b預計退房時間], [b建立日期], [b建立者工號], [b修改日期], [b修改者工號]) VALUES (15, 15, 16, CAST(N'2022-09-08T00:00:00.000' AS DateTime), CAST(N'2023-11-30T00:00:00.000' AS DateTime), CAST(N'2022-09-08T00:00:00.000' AS DateTime), N'E230313162521', CAST(N'2022-09-08T00:00:00.000' AS DateTime), N'E230313162521')
INSERT [dbo].[tBed] ([bId], [pId], [rbId], [b入住時間], [b預計退房時間], [b建立日期], [b建立者工號], [b修改日期], [b修改者工號]) VALUES (16, 16, 18, CAST(N'2022-09-14T00:00:00.000' AS DateTime), CAST(N'2023-11-29T00:00:00.000' AS DateTime), CAST(N'2022-09-14T00:00:00.000' AS DateTime), N'E230313162521', CAST(N'2022-09-14T00:00:00.000' AS DateTime), N'E230313162521')
INSERT [dbo].[tBed] ([bId], [pId], [rbId], [b入住時間], [b預計退房時間], [b建立日期], [b建立者工號], [b修改日期], [b修改者工號]) VALUES (17, 17, 29, CAST(N'2022-09-30T00:00:00.000' AS DateTime), CAST(N'2023-09-30T00:00:00.000' AS DateTime), CAST(N'2022-09-30T00:00:00.000' AS DateTime), N'E230313162521', CAST(N'2022-09-30T00:00:00.000' AS DateTime), N'E230313162521')
INSERT [dbo].[tBed] ([bId], [pId], [rbId], [b入住時間], [b預計退房時間], [b建立日期], [b建立者工號], [b修改日期], [b修改者工號]) VALUES (18, 18, 10, CAST(N'2022-10-06T00:00:00.000' AS DateTime), CAST(N'2023-10-31T00:00:00.000' AS DateTime), CAST(N'2022-10-06T00:00:00.000' AS DateTime), N'E230313162521', CAST(N'2022-10-06T00:00:00.000' AS DateTime), N'E230313162521')
INSERT [dbo].[tBed] ([bId], [pId], [rbId], [b入住時間], [b預計退房時間], [b建立日期], [b建立者工號], [b修改日期], [b修改者工號]) VALUES (19, 19, 21, CAST(N'2022-10-20T00:00:00.000' AS DateTime), CAST(N'2023-12-31T00:00:00.000' AS DateTime), CAST(N'2022-10-20T00:00:00.000' AS DateTime), N'E230313162521', CAST(N'2022-10-20T00:00:00.000' AS DateTime), N'E230313162521')
INSERT [dbo].[tBed] ([bId], [pId], [rbId], [b入住時間], [b預計退房時間], [b建立日期], [b建立者工號], [b修改日期], [b修改者工號]) VALUES (20, 20, 24, CAST(N'2023-11-01T00:00:00.000' AS DateTime), CAST(N'2023-11-15T00:00:00.000' AS DateTime), CAST(N'2023-11-01T00:00:00.000' AS DateTime), N'E230313162521', CAST(N'2023-11-01T00:00:00.000' AS DateTime), N'E230313162521')
INSERT [dbo].[tBed] ([bId], [pId], [rbId], [b入住時間], [b預計退房時間], [b建立日期], [b建立者工號], [b修改日期], [b修改者工號]) VALUES (21, 21, 27, NULL, NULL, CAST(N'2023-11-01T00:00:00.000' AS DateTime), N'E230313162521', NULL, NULL)
INSERT [dbo].[tBed] ([bId], [pId], [rbId], [b入住時間], [b預計退房時間], [b建立日期], [b建立者工號], [b修改日期], [b修改者工號]) VALUES (22, 22, 17, NULL, NULL, CAST(N'2023-11-01T00:00:00.000' AS DateTime), N'E230313162521', NULL, NULL)
INSERT [dbo].[tBed] ([bId], [pId], [rbId], [b入住時間], [b預計退房時間], [b建立日期], [b建立者工號], [b修改日期], [b修改者工號]) VALUES (25, 23, 7, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tBed] ([bId], [pId], [rbId], [b入住時間], [b預計退房時間], [b建立日期], [b建立者工號], [b修改日期], [b修改者工號]) VALUES (26, 24, 11, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tBed] ([bId], [pId], [rbId], [b入住時間], [b預計退房時間], [b建立日期], [b建立者工號], [b修改日期], [b修改者工號]) VALUES (27, 25, 12, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tBed] ([bId], [pId], [rbId], [b入住時間], [b預計退房時間], [b建立日期], [b建立者工號], [b修改日期], [b修改者工號]) VALUES (28, 26, 19, NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[tBed] OFF
GO
SET IDENTITY_INSERT [dbo].[tEmployee] ON 

INSERT [dbo].[tEmployee] ([eId], [e員工編號], [e員工姓名], [e電話], [eEmail], [e地址], [e密碼], [e性別], [e身分證號], [e職稱], [e到職日期], [e離職日期], [e權限], [e建立日期], [e建立者工號], [e修改日期], [e修改者工號], [e員工生日], [eImagePath]) VALUES (1, N'E230313162521', N'陳宜蓁', N'0982354659', N'Daphnetime@gmail.com', N'台南市', N'12345678', N'女', N'D123456789', N'護理長', CAST(N'2020-02-06T00:00:00.000' AS DateTime), NULL, NULL, CAST(N'2023-03-22T10:35:58.023' AS DateTime), NULL, CAST(N'2023-03-26T19:51:32.370' AS DateTime), N'E230313162521', CAST(N'1992-07-16T00:00:00.000' AS DateTime), N'741c42a1-036b-47cc-8047-88290d3b63f2.jpg')
INSERT [dbo].[tEmployee] ([eId], [e員工編號], [e員工姓名], [e電話], [eEmail], [e地址], [e密碼], [e性別], [e身分證號], [e職稱], [e到職日期], [e離職日期], [e權限], [e建立日期], [e建立者工號], [e修改日期], [e修改者工號], [e員工生日], [eImagePath]) VALUES (2, N'E230322103527', N'林詠晴', N'0932654982', N'Chill@gmail.com', N'台南市', N'12345678', N'女', N'D256892423', N'護理師', CAST(N'2020-05-15T00:00:00.000' AS DateTime), NULL, NULL, CAST(N'2023-03-22T10:35:58.013' AS DateTime), N'E230313162521', CAST(N'2023-03-26T19:51:58.857' AS DateTime), N'E230313162521', CAST(N'1997-12-25T00:00:00.000' AS DateTime), N'a253ccc1-bbb0-495d-8e4c-c16f8ca662ec.jpg')
INSERT [dbo].[tEmployee] ([eId], [e員工編號], [e員工姓名], [e電話], [eEmail], [e地址], [e密碼], [e性別], [e身分證號], [e職稱], [e到職日期], [e離職日期], [e權限], [e建立日期], [e建立者工號], [e修改日期], [e修改者工號], [e員工生日], [eImagePath]) VALUES (4, N'E230324142298', N'黃亮婕', N'0935325987', N'Adela@gmail.com', N'高雄市', N'12345678', N'女', N'E223546987', N'護理師', CAST(N'2018-02-27T00:00:00.000' AS DateTime), NULL, NULL, CAST(N'2023-03-24T14:22:59.717' AS DateTime), N'E230313162521', CAST(N'2023-03-26T19:52:10.327' AS DateTime), N'E230313162521', CAST(N'1991-12-19T00:00:00.000' AS DateTime), N'9999dd5d-f556-4464-920a-97365cb4c07c.jpg')
INSERT [dbo].[tEmployee] ([eId], [e員工編號], [e員工姓名], [e電話], [eEmail], [e地址], [e密碼], [e性別], [e身分證號], [e職稱], [e到職日期], [e離職日期], [e權限], [e建立日期], [e建立者工號], [e修改日期], [e修改者工號], [e員工生日], [eImagePath]) VALUES (5, N'E230324142646', N'楊汶玲', N'0982496587', N'Belle32@gamil.com', N'台南市', N'12345678', N'女', N'D254563210', N'護理師', CAST(N'2021-02-03T00:00:00.000' AS DateTime), NULL, NULL, CAST(N'2023-03-24T14:26:10.973' AS DateTime), N'E230313162521', CAST(N'2023-03-26T19:52:27.350' AS DateTime), N'E230313162521', CAST(N'1999-06-01T00:00:00.000' AS DateTime), N'34cd50f0-0c64-4020-827e-7d16ade0ced7.jpg')
INSERT [dbo].[tEmployee] ([eId], [e員工編號], [e員工姓名], [e電話], [eEmail], [e地址], [e密碼], [e性別], [e身分證號], [e職稱], [e到職日期], [e離職日期], [e權限], [e建立日期], [e建立者工號], [e修改日期], [e修改者工號], [e員工生日], [eImagePath]) VALUES (6, N'E230324142926', N'李思穎', N'0965789216', N'Candance16@gmail.com', N'台中市', N'12345678', N'女', N'B286547013', N'護理師', CAST(N'2021-02-03T00:00:00.000' AS DateTime), NULL, NULL, CAST(N'2023-03-24T14:29:41.357' AS DateTime), N'E230313162521', CAST(N'2023-03-26T19:52:39.120' AS DateTime), N'E230313162521', CAST(N'1998-10-14T00:00:00.000' AS DateTime), N'a1d14dde-c373-42fe-894f-dc261c397f5a.jpg')
SET IDENTITY_INSERT [dbo].[tEmployee] OFF
GO
SET IDENTITY_INSERT [dbo].[tFamilyMembers] ON 

INSERT [dbo].[tFamilyMembers] ([famId], [pId], [fam姓名], [fam聯絡方式], [fam住址], [fam備註]) VALUES (1, 1, N'林岱安', N'0958063840', N'花蓮市', NULL)
INSERT [dbo].[tFamilyMembers] ([famId], [pId], [fam姓名], [fam聯絡方式], [fam住址], [fam備註]) VALUES (2, 2, N'高宇杰', N'0943833201', N'嘉義市', NULL)
INSERT [dbo].[tFamilyMembers] ([famId], [pId], [fam姓名], [fam聯絡方式], [fam住址], [fam備註]) VALUES (3, 3, N'戴培峰', N'0987684122', N'嘉義市', NULL)
INSERT [dbo].[tFamilyMembers] ([famId], [pId], [fam姓名], [fam聯絡方式], [fam住址], [fam備註]) VALUES (4, 4, N'江坤宇', N'0929880558', N'台北市', NULL)
INSERT [dbo].[tFamilyMembers] ([famId], [pId], [fam姓名], [fam聯絡方式], [fam住址], [fam備註]) VALUES (5, 5, N'林智勝', N'0916340675', N'台北市', NULL)
INSERT [dbo].[tFamilyMembers] ([famId], [pId], [fam姓名], [fam聯絡方式], [fam住址], [fam備註]) VALUES (6, 6, N'王柏融', N'0958629331', N'台北市', NULL)
INSERT [dbo].[tFamilyMembers] ([famId], [pId], [fam姓名], [fam聯絡方式], [fam住址], [fam備註]) VALUES (7, 7, N'陳鏞基', N'0960687176', N'嘉義市', NULL)
INSERT [dbo].[tFamilyMembers] ([famId], [pId], [fam姓名], [fam聯絡方式], [fam住址], [fam備註]) VALUES (8, 8, N'林岳平', N'0935369021', N'彰化縣', NULL)
INSERT [dbo].[tFamilyMembers] ([famId], [pId], [fam姓名], [fam聯絡方式], [fam住址], [fam備註]) VALUES (9, 9, N'葉志仙', N'0993780381', N'雲林縣', NULL)
INSERT [dbo].[tFamilyMembers] ([famId], [pId], [fam姓名], [fam聯絡方式], [fam住址], [fam備註]) VALUES (10, 10, N'呂明賜', N'0951440413', N'嘉義市', NULL)
INSERT [dbo].[tFamilyMembers] ([famId], [pId], [fam姓名], [fam聯絡方式], [fam住址], [fam備註]) VALUES (11, 11, N'林英傑', N'0965044838', N'台北市', NULL)
INSERT [dbo].[tFamilyMembers] ([famId], [pId], [fam姓名], [fam聯絡方式], [fam住址], [fam備註]) VALUES (12, 12, N'洪一中', N'0999709536', N'彰化縣', NULL)
INSERT [dbo].[tFamilyMembers] ([famId], [pId], [fam姓名], [fam聯絡方式], [fam住址], [fam備註]) VALUES (13, 13, N'吳復連', N'0966079216', N'台中市', NULL)
INSERT [dbo].[tFamilyMembers] ([famId], [pId], [fam姓名], [fam聯絡方式], [fam住址], [fam備註]) VALUES (14, 14, N'謝長亨', N'0924056037', N'台中市', NULL)
INSERT [dbo].[tFamilyMembers] ([famId], [pId], [fam姓名], [fam聯絡方式], [fam住址], [fam備註]) VALUES (15, 15, N'郭泓志', N'0989775024', N'台中市', NULL)
INSERT [dbo].[tFamilyMembers] ([famId], [pId], [fam姓名], [fam聯絡方式], [fam住址], [fam備註]) VALUES (16, 16, N'朱尉銘', N'0911577230', N'彰化縣', NULL)
INSERT [dbo].[tFamilyMembers] ([famId], [pId], [fam姓名], [fam聯絡方式], [fam住址], [fam備註]) VALUES (17, 17, N'林威助', N'0977707658', N'南投縣', NULL)
INSERT [dbo].[tFamilyMembers] ([famId], [pId], [fam姓名], [fam聯絡方式], [fam住址], [fam備註]) VALUES (18, 18, N'陽耀勳', N'0976781820', N'台南市', NULL)
INSERT [dbo].[tFamilyMembers] ([famId], [pId], [fam姓名], [fam聯絡方式], [fam住址], [fam備註]) VALUES (19, 19, N'陽建福', N'0930997270', N'彰化縣', NULL)
INSERT [dbo].[tFamilyMembers] ([famId], [pId], [fam姓名], [fam聯絡方式], [fam住址], [fam備註]) VALUES (20, 20, N'耿伯軒', N'0931743597', N'彰化縣', NULL)
INSERT [dbo].[tFamilyMembers] ([famId], [pId], [fam姓名], [fam聯絡方式], [fam住址], [fam備註]) VALUES (21, 21, N'許文雄', N'0928449067', N'台北市', NULL)
INSERT [dbo].[tFamilyMembers] ([famId], [pId], [fam姓名], [fam聯絡方式], [fam住址], [fam備註]) VALUES (22, 22, N'胡金龍', N'0938631392', N'南投縣', NULL)
INSERT [dbo].[tFamilyMembers] ([famId], [pId], [fam姓名], [fam聯絡方式], [fam住址], [fam備註]) VALUES (23, 23, N'姜建銘', N'0976603013', N'台中市', NULL)
INSERT [dbo].[tFamilyMembers] ([famId], [pId], [fam姓名], [fam聯絡方式], [fam住址], [fam備註]) VALUES (24, 24, N'林恩宇', N'0945092560', N'高雄市', NULL)
INSERT [dbo].[tFamilyMembers] ([famId], [pId], [fam姓名], [fam聯絡方式], [fam住址], [fam備註]) VALUES (25, 25, N'許竹見', N'0999648743', N'台南市', NULL)
SET IDENTITY_INSERT [dbo].[tFamilyMembers] OFF
GO
SET IDENTITY_INSERT [dbo].[tImages] ON 

INSERT [dbo].[tImages] ([maId], [meId], [月圖], [早圖], [午圖], [晚圖], [圖一], [圖二], [圖三]) VALUES (3, 3, N'89bdd295-fd1b-4f6a-b3ec-3acec1de906f.jpg', N'3b864d0d-df45-47f2-b2a2-610a1772fb55.jpg', N'aa622382-f392-42ea-ae9c-c2749bf69092.jpg', N'97da2b91-ba21-4bfe-bf45-8fbd00667bcf.jpg', N'8583291e-4e94-47e2-a874-3d175999d537.jpg', N'e4e73e70-8c42-4dea-8c89-a24cc918c74a.jpg', N'd7a7d37e-3232-4e24-9df5-24e5db30acc5.jpg')
INSERT [dbo].[tImages] ([maId], [meId], [月圖], [早圖], [午圖], [晚圖], [圖一], [圖二], [圖三]) VALUES (4, 4, N'bd965686-7862-44ed-bb9a-c84694d6919e.jpg', N'5b01f0d3-5053-49b0-8d61-aee53d3eaeb0.jpg', N'8edb4681-0717-41c1-a810-7fa679b26736.jpg', N'c9fed825-d510-4b12-bf9c-1ca2f7e386f3.jpg', N'61193f5c-5734-4c31-8df8-7a95a7e3e859.jpg', N'ae9a588c-57c7-4618-93fa-fd52b29abfbc.jpg', N'22435263-cadc-481b-9e58-5dc7192c1df5.jpg')
INSERT [dbo].[tImages] ([maId], [meId], [月圖], [早圖], [午圖], [晚圖], [圖一], [圖二], [圖三]) VALUES (5, 5, N'7dd5374f-6aee-4e4a-8702-44046b698580.jpg', N'7f17551f-6a65-40ba-9ea4-5a562dd1d417.jpg', N'7f67cb1a-ed60-4c6a-a828-89b3c7054ee7.jpg', N'1ee7b20d-eb5e-439e-937c-ac81760d01d4.jpg', N'fbe63194-0986-41df-8d85-a20cbe579662.jpg', N'19ff9f53-79a1-4cc5-a1c5-ef2e28c8e831.jpg', N'cc947b1f-4853-40b1-82f2-dd9c0a1ee9df.jpg')
INSERT [dbo].[tImages] ([maId], [meId], [月圖], [早圖], [午圖], [晚圖], [圖一], [圖二], [圖三]) VALUES (6, 6, N'9b7c3985-82f1-40a8-a21f-504b0b8caf9f.jpg', N'896b8692-32f4-44dd-8895-c4a648779fce.jpg', N'c8200ab3-4d37-4a49-81a9-2fed98c0460e.jpg', N'6bc1f767-5fe7-4211-9860-1dfbbf595d82.jpg', N'61f47e0c-31a7-4323-8e82-9cc1f306e799.jpg', N'8dd23235-4803-47df-8338-bc5734f99ad9.jpg', N'44d02246-7a02-4a44-b24b-1929ced233b2.jpg')
INSERT [dbo].[tImages] ([maId], [meId], [月圖], [早圖], [午圖], [晚圖], [圖一], [圖二], [圖三]) VALUES (7, 7, N'7e7bfc22-5fe7-4239-bf7e-1a97965c77e0.jpg', N'64fb2b18-04ec-4c58-bfbc-c1e4583685a2.jpg', N'905a53c1-172a-4e88-9bcd-402e4a21095e.jpg', N'423040c8-45ea-4d81-93b2-cd1e0b47436b.jpg', N'90cd3b6b-8f2c-4f8a-8b6f-7ff22955bbd5.jpg', N'd323ead3-fcd9-46f8-b989-a690c2316727.jpg', N'3a15f277-f137-4864-b977-eed1a9b9b73b.jpg')
INSERT [dbo].[tImages] ([maId], [meId], [月圖], [早圖], [午圖], [晚圖], [圖一], [圖二], [圖三]) VALUES (8, 8, N'f05532be-c1a3-48d3-b834-bee2f0e00aa2.jpg', N'231dbc1d-4d10-4695-b3b1-c50e2241b987.jpg', N'8353133d-dc19-4e50-bd7d-9ee4e56d7989.jpg', N'195a16b0-cb82-4fc2-8ecc-164ecb78aa32.jpg', N'0f41c3cb-1c40-43c3-a7ef-57244b0159d5.jpg', N'a5310b58-e12e-4747-a2c3-c54add863b19.jpg', N'4c48b50f-bf2e-4d9a-b58a-081886cbdbe0.jpg')
SET IDENTITY_INSERT [dbo].[tImages] OFF
GO
SET IDENTITY_INSERT [dbo].[tMeal] ON 

INSERT [dbo].[tMeal] ([meId], [suId], [月], [餐種], [餐別], [價位], [建立時間], [修改時間], [建立人], [備註]) VALUES (3, 2, N'4月', N'普通餐', N'精緻套餐', N'880', CAST(N'2023-03-26T22:04:34.610' AS DateTime), CAST(N'2023-03-26T22:04:34.610' AS DateTime), N'吳于倩', N'特色: 多元異國風味、鮮嫩舒肥肉品、顛覆傳統健康餐盒清淡無味的刻板印象。傳統生魚、舒肥肉品與蛋白丁等多元主食，也搭配多種新鮮蔬菜，更特別選用高營養蔬菜「三日苗」提供美味、多元且便利的健康餐飲選擇，納入高抗氧力的三日苗沙拉，每日營養更升級！')
INSERT [dbo].[tMeal] ([meId], [suId], [月], [餐種], [餐別], [價位], [建立時間], [修改時間], [建立人], [備註]) VALUES (4, 2, N'4月', N'普通餐', N'養生套餐', N'1000', CAST(N'2023-03-26T22:09:58.387' AS DateTime), CAST(N'2023-03-26T22:09:58.387' AS DateTime), N'陳宜蓁', N'特色: 提供好消化、好吸收的蛋白質，有助於身體修護，還有鋅、維生素A 、C等，能增進皮膚健康與有助於傷口癒合。 。和藥膳食補，無活血中藥，無麻油，無酒精，餐點含多元植化素，幫助調整體質，健康維持！')
INSERT [dbo].[tMeal] ([meId], [suId], [月], [餐種], [餐別], [價位], [建立時間], [修改時間], [建立人], [備註]) VALUES (5, 3, N'4月', N'糖尿病餐', N'低GI套餐', N'1200', CAST(N'2023-03-26T22:11:00.763' AS DateTime), CAST(N'2023-03-26T22:11:00.763' AS DateTime), N'陳宜蓁', N'特色： 不易累積脂肪、可協助血糖平穩、較有飽足感、降低三酸甘油脂、總膽固醇及LDL；提升好膽固醇HDL與降低心血管疾病（心肌梗塞及中風）、高血壓、 糖尿病及其併發症的風險。')
INSERT [dbo].[tMeal] ([meId], [suId], [月], [餐種], [餐別], [價位], [建立時間], [修改時間], [建立人], [備註]) VALUES (6, 3, N'4月', N'腎臟病餐', N'低氮套餐', N'1200', CAST(N'2023-03-26T22:12:01.333' AS DateTime), CAST(N'2023-03-26T22:12:01.333' AS DateTime), N'陳宜蓁', N'特別採用低鹽、低油、低蛋白設計，讓身體恢復擁有充足均衡的營養，避免身體額外負擔。 含多種維生素B群與多種礦物質、鐵質，能促進新陳代謝')
INSERT [dbo].[tMeal] ([meId], [suId], [月], [餐種], [餐別], [價位], [建立時間], [修改時間], [建立人], [備註]) VALUES (7, 3, N'4月', N'癌症餐', N'低醣套餐', N'1200', CAST(N'2023-03-26T22:13:27.390' AS DateTime), CAST(N'2023-03-26T22:13:27.390' AS DateTime), N'陳宜蓁', N'特色: 提供好消化、好吸收的蛋白質，有助於身體修護，還有鋅、維生素A 、C等，能增進皮膚健康與有助於傷口癒合。')
INSERT [dbo].[tMeal] ([meId], [suId], [月], [餐種], [餐別], [價位], [建立時間], [修改時間], [建立人], [備註]) VALUES (8, 3, N'4月', N'癌症餐', N'化療套餐', N'1500', CAST(N'2023-03-26T22:14:34.630' AS DateTime), CAST(N'2023-03-26T22:14:34.630' AS DateTime), N'陳宜蓁', N'特色: 提供好消化、好吸收的蛋白質，有助於身體修護，還有鋅、維生素A 、C等，能增進皮膚健康與有助於傷口癒合。')
SET IDENTITY_INSERT [dbo].[tMeal] OFF
GO
SET IDENTITY_INSERT [dbo].[tMember] ON 

INSERT [dbo].[tMember] ([mId], [m手機], [m密碼], [m姓名], [m性別], [mEmail], [m照片], [m住址], [m加入時間], [m修改時間], [m最後登入時間], [m備註], [m刪除會員], [m權限]) VALUES (10000, N'0911222333', N'aaaaa1234', N'翔平', 1, N'0821tomcat@gmail.com', N'ff06a861-d86b-4111-bfd4-0de69fd72b42.jpg', N'台北市中山區四平街', CAST(N'2023-03-26T00:37:21.437' AS DateTime), CAST(N'2023-03-29T19:41:25.020' AS DateTime), CAST(N'2023-04-03T15:00:44.190' AS DateTime), NULL, 0, N'一般會員')
INSERT [dbo].[tMember] ([mId], [m手機], [m密碼], [m姓名], [m性別], [mEmail], [m照片], [m住址], [m加入時間], [m修改時間], [m最後登入時間], [m備註], [m刪除會員], [m權限]) VALUES (10001, N'0911223344', N'aaaa1245', N' 黃欽智', 0, N'0821tomcat@gmail.com', N'60e4db72-9e65-496f-aea7-adf711ad0bd3.jpg', N'Tainan', CAST(N'2023-03-26T00:38:05.553' AS DateTime), NULL, NULL, NULL, 0, N'一般會員')
INSERT [dbo].[tMember] ([mId], [m手機], [m密碼], [m姓名], [m性別], [mEmail], [m照片], [m住址], [m加入時間], [m修改時間], [m最後登入時間], [m備註], [m刪除會員], [m權限]) VALUES (10002, N'0912341234', N'acer1234', N'郭建霖', 0, N'0821tomcat@gmail.com', N'91d788c9-cb0e-4088-bc8b-1dc2710cfb97.jpg', N'USA', CAST(N'2023-03-26T00:38:48.537' AS DateTime), NULL, NULL, NULL, 0, N'一般會員')
INSERT [dbo].[tMember] ([mId], [m手機], [m密碼], [m姓名], [m性別], [mEmail], [m照片], [m住址], [m加入時間], [m修改時間], [m最後登入時間], [m備註], [m刪除會員], [m權限]) VALUES (10003, N'0912344321', N'david1234', N'陳鴻文 ', 1, N'0821tomcat@gmail.com', N'2ddd174a-3f28-43c8-92d2-d8f5447c745a.jpg', N'高雄市', CAST(N'2023-03-26T00:39:41.830' AS DateTime), NULL, NULL, NULL, 0, N'一般會員')
SET IDENTITY_INSERT [dbo].[tMember] OFF
GO
SET IDENTITY_INSERT [dbo].[tNursingRecord] ON 

INSERT [dbo].[tNursingRecord] ([nId], [eId], [pId], [oId], [n舒張壓], [n收縮壓], [n體溫], [n脈搏], [n呼吸], [n傷口], [n三管], [n其他], [n紀錄時間], [n修改時間]) VALUES (1, 1, NULL, 1, N'79', N'125', N'36.4', N'90', N'17', NULL, NULL, NULL, N'2023/2/28 下午 02:30:00', NULL)
INSERT [dbo].[tNursingRecord] ([nId], [eId], [pId], [oId], [n舒張壓], [n收縮壓], [n體溫], [n脈搏], [n呼吸], [n傷口], [n三管], [n其他], [n紀錄時間], [n修改時間]) VALUES (2, 1, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tNursingRecord] ([nId], [eId], [pId], [oId], [n舒張壓], [n收縮壓], [n體溫], [n脈搏], [n呼吸], [n傷口], [n三管], [n其他], [n紀錄時間], [n修改時間]) VALUES (3, 5, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tNursingRecord] ([nId], [eId], [pId], [oId], [n舒張壓], [n收縮壓], [n體溫], [n脈搏], [n呼吸], [n傷口], [n三管], [n其他], [n紀錄時間], [n修改時間]) VALUES (4, 5, NULL, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tNursingRecord] ([nId], [eId], [pId], [oId], [n舒張壓], [n收縮壓], [n體溫], [n脈搏], [n呼吸], [n傷口], [n三管], [n其他], [n紀錄時間], [n修改時間]) VALUES (5, 2, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tNursingRecord] ([nId], [eId], [pId], [oId], [n舒張壓], [n收縮壓], [n體溫], [n脈搏], [n呼吸], [n傷口], [n三管], [n其他], [n紀錄時間], [n修改時間]) VALUES (6, 2, NULL, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tNursingRecord] ([nId], [eId], [pId], [oId], [n舒張壓], [n收縮壓], [n體溫], [n脈搏], [n呼吸], [n傷口], [n三管], [n其他], [n紀錄時間], [n修改時間]) VALUES (7, 1, NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tNursingRecord] ([nId], [eId], [pId], [oId], [n舒張壓], [n收縮壓], [n體溫], [n脈搏], [n呼吸], [n傷口], [n三管], [n其他], [n紀錄時間], [n修改時間]) VALUES (8, 2, NULL, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tNursingRecord] ([nId], [eId], [pId], [oId], [n舒張壓], [n收縮壓], [n體溫], [n脈搏], [n呼吸], [n傷口], [n三管], [n其他], [n紀錄時間], [n修改時間]) VALUES (9, 2, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tNursingRecord] ([nId], [eId], [pId], [oId], [n舒張壓], [n收縮壓], [n體溫], [n脈搏], [n呼吸], [n傷口], [n三管], [n其他], [n紀錄時間], [n修改時間]) VALUES (10, 5, NULL, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tNursingRecord] ([nId], [eId], [pId], [oId], [n舒張壓], [n收縮壓], [n體溫], [n脈搏], [n呼吸], [n傷口], [n三管], [n其他], [n紀錄時間], [n修改時間]) VALUES (11, 1, NULL, 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tNursingRecord] ([nId], [eId], [pId], [oId], [n舒張壓], [n收縮壓], [n體溫], [n脈搏], [n呼吸], [n傷口], [n三管], [n其他], [n紀錄時間], [n修改時間]) VALUES (12, 1, NULL, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tNursingRecord] ([nId], [eId], [pId], [oId], [n舒張壓], [n收縮壓], [n體溫], [n脈搏], [n呼吸], [n傷口], [n三管], [n其他], [n紀錄時間], [n修改時間]) VALUES (13, 1, NULL, 13, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tNursingRecord] ([nId], [eId], [pId], [oId], [n舒張壓], [n收縮壓], [n體溫], [n脈搏], [n呼吸], [n傷口], [n三管], [n其他], [n紀錄時間], [n修改時間]) VALUES (14, 1, NULL, 14, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tNursingRecord] ([nId], [eId], [pId], [oId], [n舒張壓], [n收縮壓], [n體溫], [n脈搏], [n呼吸], [n傷口], [n三管], [n其他], [n紀錄時間], [n修改時間]) VALUES (15, 1, NULL, 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tNursingRecord] ([nId], [eId], [pId], [oId], [n舒張壓], [n收縮壓], [n體溫], [n脈搏], [n呼吸], [n傷口], [n三管], [n其他], [n紀錄時間], [n修改時間]) VALUES (16, 1, NULL, 16, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tNursingRecord] ([nId], [eId], [pId], [oId], [n舒張壓], [n收縮壓], [n體溫], [n脈搏], [n呼吸], [n傷口], [n三管], [n其他], [n紀錄時間], [n修改時間]) VALUES (17, 1, NULL, 17, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tNursingRecord] ([nId], [eId], [pId], [oId], [n舒張壓], [n收縮壓], [n體溫], [n脈搏], [n呼吸], [n傷口], [n三管], [n其他], [n紀錄時間], [n修改時間]) VALUES (18, 1, NULL, 18, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tNursingRecord] ([nId], [eId], [pId], [oId], [n舒張壓], [n收縮壓], [n體溫], [n脈搏], [n呼吸], [n傷口], [n三管], [n其他], [n紀錄時間], [n修改時間]) VALUES (19, 1, NULL, 19, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tNursingRecord] ([nId], [eId], [pId], [oId], [n舒張壓], [n收縮壓], [n體溫], [n脈搏], [n呼吸], [n傷口], [n三管], [n其他], [n紀錄時間], [n修改時間]) VALUES (20, 1, NULL, 20, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tNursingRecord] ([nId], [eId], [pId], [oId], [n舒張壓], [n收縮壓], [n體溫], [n脈搏], [n呼吸], [n傷口], [n三管], [n其他], [n紀錄時間], [n修改時間]) VALUES (21, 1, NULL, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tNursingRecord] ([nId], [eId], [pId], [oId], [n舒張壓], [n收縮壓], [n體溫], [n脈搏], [n呼吸], [n傷口], [n三管], [n其他], [n紀錄時間], [n修改時間]) VALUES (22, 1, NULL, 22, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tNursingRecord] ([nId], [eId], [pId], [oId], [n舒張壓], [n收縮壓], [n體溫], [n脈搏], [n呼吸], [n傷口], [n三管], [n其他], [n紀錄時間], [n修改時間]) VALUES (23, 1, NULL, 23, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tNursingRecord] ([nId], [eId], [pId], [oId], [n舒張壓], [n收縮壓], [n體溫], [n脈搏], [n呼吸], [n傷口], [n三管], [n其他], [n紀錄時間], [n修改時間]) VALUES (24, 1, NULL, 24, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tNursingRecord] ([nId], [eId], [pId], [oId], [n舒張壓], [n收縮壓], [n體溫], [n脈搏], [n呼吸], [n傷口], [n三管], [n其他], [n紀錄時間], [n修改時間]) VALUES (25, 1, NULL, 25, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tNursingRecord] ([nId], [eId], [pId], [oId], [n舒張壓], [n收縮壓], [n體溫], [n脈搏], [n呼吸], [n傷口], [n三管], [n其他], [n紀錄時間], [n修改時間]) VALUES (26, 1, NULL, 1, N'79', N'124', N'36.8', N'90', N'19', NULL, NULL, NULL, N'2023/3/1 下午 02:30:00', NULL)
INSERT [dbo].[tNursingRecord] ([nId], [eId], [pId], [oId], [n舒張壓], [n收縮壓], [n體溫], [n脈搏], [n呼吸], [n傷口], [n三管], [n其他], [n紀錄時間], [n修改時間]) VALUES (27, 1, NULL, 1, N'77', N'129', N'36.4', N'61', N'14', NULL, NULL, NULL, N'2023/3/2 下午 02:30:00', NULL)
INSERT [dbo].[tNursingRecord] ([nId], [eId], [pId], [oId], [n舒張壓], [n收縮壓], [n體溫], [n脈搏], [n呼吸], [n傷口], [n三管], [n其他], [n紀錄時間], [n修改時間]) VALUES (28, 1, NULL, 1, N'71', N'127', N'37.1', N'64', N'18', NULL, NULL, NULL, N'2023/3/3 下午 02:30:00', NULL)
INSERT [dbo].[tNursingRecord] ([nId], [eId], [pId], [oId], [n舒張壓], [n收縮壓], [n體溫], [n脈搏], [n呼吸], [n傷口], [n三管], [n其他], [n紀錄時間], [n修改時間]) VALUES (29, 1, NULL, 1, N'79', N'115', N'36.8', N'61', N'19', NULL, NULL, NULL, N'2023/3/4 下午 02:30:00', NULL)
INSERT [dbo].[tNursingRecord] ([nId], [eId], [pId], [oId], [n舒張壓], [n收縮壓], [n體溫], [n脈搏], [n呼吸], [n傷口], [n三管], [n其他], [n紀錄時間], [n修改時間]) VALUES (30, 1, NULL, 1, N'76', N'122', N'36.6', N'69', N'17', NULL, NULL, NULL, N'2023/3/5 下午 02:30:00', NULL)
INSERT [dbo].[tNursingRecord] ([nId], [eId], [pId], [oId], [n舒張壓], [n收縮壓], [n體溫], [n脈搏], [n呼吸], [n傷口], [n三管], [n其他], [n紀錄時間], [n修改時間]) VALUES (31, 1, NULL, 1, N'85', N'125', N'37.3', N'79', N'12', NULL, NULL, NULL, N'2023/3/6 下午 02:30:00', NULL)
INSERT [dbo].[tNursingRecord] ([nId], [eId], [pId], [oId], [n舒張壓], [n收縮壓], [n體溫], [n脈搏], [n呼吸], [n傷口], [n三管], [n其他], [n紀錄時間], [n修改時間]) VALUES (32, 1, NULL, 1, N'72', N'134', N'36.5', N'85', N'13', NULL, NULL, NULL, N'2023/3/7 下午 02:30:00', NULL)
INSERT [dbo].[tNursingRecord] ([nId], [eId], [pId], [oId], [n舒張壓], [n收縮壓], [n體溫], [n脈搏], [n呼吸], [n傷口], [n三管], [n其他], [n紀錄時間], [n修改時間]) VALUES (33, 1, NULL, 1, N'77', N'128', N'36.6', N'97', N'14', NULL, NULL, NULL, N'2023/3/8 下午 02:30:00', NULL)
INSERT [dbo].[tNursingRecord] ([nId], [eId], [pId], [oId], [n舒張壓], [n收縮壓], [n體溫], [n脈搏], [n呼吸], [n傷口], [n三管], [n其他], [n紀錄時間], [n修改時間]) VALUES (34, 1, NULL, 1, N'83', N'115', N'36.5', N'87', N'19', NULL, NULL, NULL, N'2023/3/9 下午 02:30:00', NULL)
INSERT [dbo].[tNursingRecord] ([nId], [eId], [pId], [oId], [n舒張壓], [n收縮壓], [n體溫], [n脈搏], [n呼吸], [n傷口], [n三管], [n其他], [n紀錄時間], [n修改時間]) VALUES (35, 1, NULL, 1, N'76', N'122', N'37.2', N'66', N'18', NULL, NULL, NULL, N'2023/3/10 下午 02:30:00', NULL)
INSERT [dbo].[tNursingRecord] ([nId], [eId], [pId], [oId], [n舒張壓], [n收縮壓], [n體溫], [n脈搏], [n呼吸], [n傷口], [n三管], [n其他], [n紀錄時間], [n修改時間]) VALUES (36, 1, NULL, 1, N'89', N'110', N'36.8', N'86', N'12', NULL, NULL, NULL, N'2023/3/11 下午 02:30:00', NULL)
INSERT [dbo].[tNursingRecord] ([nId], [eId], [pId], [oId], [n舒張壓], [n收縮壓], [n體溫], [n脈搏], [n呼吸], [n傷口], [n三管], [n其他], [n紀錄時間], [n修改時間]) VALUES (37, 1, NULL, 1, N'70', N'112', N'36.5', N'62', N'12', NULL, NULL, NULL, N'2023/3/12 下午 02:30:00', NULL)
INSERT [dbo].[tNursingRecord] ([nId], [eId], [pId], [oId], [n舒張壓], [n收縮壓], [n體溫], [n脈搏], [n呼吸], [n傷口], [n三管], [n其他], [n紀錄時間], [n修改時間]) VALUES (38, 1, NULL, 1, N'87', N'133', N'37.2', N'61', N'14', NULL, NULL, NULL, N'2023/3/13 下午 02:30:00', NULL)
INSERT [dbo].[tNursingRecord] ([nId], [eId], [pId], [oId], [n舒張壓], [n收縮壓], [n體溫], [n脈搏], [n呼吸], [n傷口], [n三管], [n其他], [n紀錄時間], [n修改時間]) VALUES (39, 1, NULL, 1, N'75', N'117', N'36.2', N'99', N'15', NULL, NULL, NULL, N'2023/3/14 下午 02:30:00', NULL)
INSERT [dbo].[tNursingRecord] ([nId], [eId], [pId], [oId], [n舒張壓], [n收縮壓], [n體溫], [n脈搏], [n呼吸], [n傷口], [n三管], [n其他], [n紀錄時間], [n修改時間]) VALUES (40, 1, NULL, 1, N'86', N'133', N'36.9', N'89', N'13', NULL, NULL, NULL, N'2023/3/15 下午 02:30:00', NULL)
INSERT [dbo].[tNursingRecord] ([nId], [eId], [pId], [oId], [n舒張壓], [n收縮壓], [n體溫], [n脈搏], [n呼吸], [n傷口], [n三管], [n其他], [n紀錄時間], [n修改時間]) VALUES (41, 1, NULL, 1, N'72', N'111', N'37.1', N'74', N'14', NULL, NULL, NULL, N'2023/3/16 下午 02:30:00', NULL)
INSERT [dbo].[tNursingRecord] ([nId], [eId], [pId], [oId], [n舒張壓], [n收縮壓], [n體溫], [n脈搏], [n呼吸], [n傷口], [n三管], [n其他], [n紀錄時間], [n修改時間]) VALUES (42, 1, NULL, 1, N'77', N'130', N'37.0', N'86', N'12', NULL, NULL, NULL, N'2023/3/17 下午 02:30:00', NULL)
INSERT [dbo].[tNursingRecord] ([nId], [eId], [pId], [oId], [n舒張壓], [n收縮壓], [n體溫], [n脈搏], [n呼吸], [n傷口], [n三管], [n其他], [n紀錄時間], [n修改時間]) VALUES (43, 1, NULL, 1, N'71', N'116', N'37.0', N'83', N'12', NULL, NULL, NULL, N'2023/3/18 下午 02:30:00', NULL)
INSERT [dbo].[tNursingRecord] ([nId], [eId], [pId], [oId], [n舒張壓], [n收縮壓], [n體溫], [n脈搏], [n呼吸], [n傷口], [n三管], [n其他], [n紀錄時間], [n修改時間]) VALUES (44, 1, NULL, 1, N'75', N'118', N'36.5', N'92', N'15', NULL, NULL, NULL, N'2023/3/19 下午 02:30:00', NULL)
INSERT [dbo].[tNursingRecord] ([nId], [eId], [pId], [oId], [n舒張壓], [n收縮壓], [n體溫], [n脈搏], [n呼吸], [n傷口], [n三管], [n其他], [n紀錄時間], [n修改時間]) VALUES (45, 1, NULL, 1, N'87', N'120', N'36.5', N'76', N'17', NULL, NULL, NULL, N'2023/3/20 下午 02:30:00', NULL)
INSERT [dbo].[tNursingRecord] ([nId], [eId], [pId], [oId], [n舒張壓], [n收縮壓], [n體溫], [n脈搏], [n呼吸], [n傷口], [n三管], [n其他], [n紀錄時間], [n修改時間]) VALUES (46, 1, NULL, 1, N'71', N'117', N'37.2', N'90', N'12', NULL, NULL, NULL, N'2023/3/21 下午 02:30:00', NULL)
INSERT [dbo].[tNursingRecord] ([nId], [eId], [pId], [oId], [n舒張壓], [n收縮壓], [n體溫], [n脈搏], [n呼吸], [n傷口], [n三管], [n其他], [n紀錄時間], [n修改時間]) VALUES (47, 1, NULL, 1, N'74', N'121', N'37.3', N'76', N'19', NULL, NULL, NULL, N'2023/3/22 下午 02:30:00', NULL)
INSERT [dbo].[tNursingRecord] ([nId], [eId], [pId], [oId], [n舒張壓], [n收縮壓], [n體溫], [n脈搏], [n呼吸], [n傷口], [n三管], [n其他], [n紀錄時間], [n修改時間]) VALUES (48, 1, NULL, 1, N'70', N'119', N'36.0', N'88', N'17', NULL, NULL, NULL, N'2023/3/23 下午 02:30:00', NULL)
INSERT [dbo].[tNursingRecord] ([nId], [eId], [pId], [oId], [n舒張壓], [n收縮壓], [n體溫], [n脈搏], [n呼吸], [n傷口], [n三管], [n其他], [n紀錄時間], [n修改時間]) VALUES (49, 1, NULL, 1, N'73', N'112', N'36.2', N'61', N'13', NULL, NULL, NULL, N'2023/3/24 下午 02:30:00', NULL)
INSERT [dbo].[tNursingRecord] ([nId], [eId], [pId], [oId], [n舒張壓], [n收縮壓], [n體溫], [n脈搏], [n呼吸], [n傷口], [n三管], [n其他], [n紀錄時間], [n修改時間]) VALUES (50, 1, NULL, 1, N'70', N'125', N'36.8', N'95', N'13', NULL, NULL, NULL, N'2023/3/25 下午 02:30:00', NULL)
INSERT [dbo].[tNursingRecord] ([nId], [eId], [pId], [oId], [n舒張壓], [n收縮壓], [n體溫], [n脈搏], [n呼吸], [n傷口], [n三管], [n其他], [n紀錄時間], [n修改時間]) VALUES (51, 1, NULL, 1, N'81', N'122', N'37.2', N'69', N'14', NULL, NULL, NULL, N'2023/3/26 下午 02:30:00', NULL)
INSERT [dbo].[tNursingRecord] ([nId], [eId], [pId], [oId], [n舒張壓], [n收縮壓], [n體溫], [n脈搏], [n呼吸], [n傷口], [n三管], [n其他], [n紀錄時間], [n修改時間]) VALUES (52, 1, NULL, 1, N'86', N'130', N'36.5', N'89', N'14', NULL, NULL, NULL, N'2023/3/27 下午 02:30:00', NULL)
INSERT [dbo].[tNursingRecord] ([nId], [eId], [pId], [oId], [n舒張壓], [n收縮壓], [n體溫], [n脈搏], [n呼吸], [n傷口], [n三管], [n其他], [n紀錄時間], [n修改時間]) VALUES (53, 1, NULL, 1, N'72', N'135', N'37.4', N'85', N'18', NULL, NULL, NULL, N'2023/3/28 下午 02:30:00', NULL)
INSERT [dbo].[tNursingRecord] ([nId], [eId], [pId], [oId], [n舒張壓], [n收縮壓], [n體溫], [n脈搏], [n呼吸], [n傷口], [n三管], [n其他], [n紀錄時間], [n修改時間]) VALUES (54, 1, NULL, 1, N'83', N'120', N'36.4', N'87', N'12', NULL, NULL, NULL, N'2023/3/29 下午 02:30:00', NULL)
INSERT [dbo].[tNursingRecord] ([nId], [eId], [pId], [oId], [n舒張壓], [n收縮壓], [n體溫], [n脈搏], [n呼吸], [n傷口], [n三管], [n其他], [n紀錄時間], [n修改時間]) VALUES (55, 1, NULL, 1, N'89', N'118', N'37.0', N'62', N'14', NULL, NULL, NULL, N'2023/3/30 下午 02:30:00', NULL)
SET IDENTITY_INSERT [dbo].[tNursingRecord] OFF
GO
SET IDENTITY_INSERT [dbo].[tOffService] ON 

INSERT [dbo].[tOffService] ([oId], [eId], [pId], [o就診日期], [o回診日期], [o醫師診斷], [o指示與用藥], [o建立], [o更新]) VALUES (1, 1, 1, N'2023-03-02', N'2023-03-24', N'蜂窩組織炎', N'Amoxicillin, Clavulanate Potassium (Augmentin 1gm/顆)每天早晚口服一顆', CAST(N'2023-03-24T21:54:00' AS SmallDateTime), CAST(N'2023-03-24T21:54:00' AS SmallDateTime))
INSERT [dbo].[tOffService] ([oId], [eId], [pId], [o就診日期], [o回診日期], [o醫師診斷], [o指示與用藥], [o建立], [o更新]) VALUES (2, 1, 2, N'2023-02-21', N'2023-03-21', N'Gout', N'藥名: Indomethacin 25mg/cap 用法: 每次1顆，一日2-3次，需在飯後服用。 藥名: Prednisolone 5mg/tab 用法: 每次2-5顆，一日2-4次，需在飯後服用。 藥名: Hydrochlorothiazide 25mg/tab 用法: 每日1次，飯後服用。', CAST(N'2023-03-24T21:55:00' AS SmallDateTime), CAST(N'2023-03-24T21:55:00' AS SmallDateTime))
INSERT [dbo].[tOffService] ([oId], [eId], [pId], [o就診日期], [o回診日期], [o醫師診斷], [o指示與用藥], [o建立], [o更新]) VALUES (3, 1, 3, N'2023-03-01', N'2023-04-01', N'Kidney stones', N'藥名: Acetaminophen 500mg/tab
用法: 每次1-2顆，一日4次，需在餐後服用。', CAST(N'2023-03-24T21:55:00' AS SmallDateTime), CAST(N'2023-03-24T21:55:00' AS SmallDateTime))
INSERT [dbo].[tOffService] ([oId], [eId], [pId], [o就診日期], [o回診日期], [o醫師診斷], [o指示與用藥], [o建立], [o更新]) VALUES (4, 1, 4, N'2023-02-03', N'2023-03-03', N'Analgesics, Urinary tract antispasmodic', N'藥名: Prednisolone 5mg/tab
用法: 每次2-5顆，一日2-4次，需在飯後服用。
藥名: Hydrochlorothiazide 25mg/tab
用法: 每日1次，飯後服用。
', CAST(N'2023-03-24T21:55:00' AS SmallDateTime), CAST(N'2023-03-24T21:55:00' AS SmallDateTime))
INSERT [dbo].[tOffService] ([oId], [eId], [pId], [o就診日期], [o回診日期], [o醫師診斷], [o指示與用藥], [o建立], [o更新]) VALUES (5, 2, 5, N'2023-03-03', N'2023-04-01', N'Shingles', N'藥名: Acetaminophen 500mg/tab
用法: 每次1-2顆，一日4次，需在餐後服用。
藥名: Hyoscine Butylbromide 10mg/tab
用法: 每次1-2顆，一日3次，需在餐後服用。
藥名: Sodium Bicarbonate 500mg/tab
用法: 每次1-2顆，一日3-4次，需在飯後服用。
', CAST(N'2023-03-24T21:55:00' AS SmallDateTime), CAST(N'2023-03-24T21:55:00' AS SmallDateTime))
INSERT [dbo].[tOffService] ([oId], [eId], [pId], [o就診日期], [o回診日期], [o醫師診斷], [o指示與用藥], [o建立], [o更新]) VALUES (6, 2, 6, N'2023-03-30', N'2023-04-02', N'支氣管炎、肋膜炎', N'藥名: Acyclovir 200mg/tab
用法: 每次2顆，一日5次，需在餐後服用。
藥名: Acetaminophen 500mg/tab
用法: 每次1-2顆，一日4次，需在餐後服用。
藥名: Prednisolone 5mg/tab
用法: 每次2-5顆，一日2-4次，需在餐後服用。
', CAST(N'2023-03-24T21:55:00' AS SmallDateTime), CAST(N'2023-03-24T21:55:00' AS SmallDateTime))
INSERT [dbo].[tOffService] ([oId], [eId], [pId], [o就診日期], [o回診日期], [o醫師診斷], [o指示與用藥], [o建立], [o更新]) VALUES (7, 2, 7, N'2023-03-11', N'2023-04-10', N'中暑、腦膜炎', N'藥名: Prednisolone 5mg/tab
用法: 每次2-5顆，一日2-4次，需在餐後服用。', CAST(N'2023-03-24T21:55:00' AS SmallDateTime), CAST(N'2023-03-24T21:55:00' AS SmallDateTime))
INSERT [dbo].[tOffService] ([oId], [eId], [pId], [o就診日期], [o回診日期], [o醫師診斷], [o指示與用藥], [o建立], [o更新]) VALUES (8, 2, 8, N'2023-04-01', N'2023-04-31', N'腕管綜合症、關節炎', N'藥名: Acetaminophen 500mg/tab
用法: 每次1-2顆，一日4次，需在餐後服用。
藥名: Hyoscine Butylbromide 10mg/tab
用法: 每次1-2顆，一日3次，需在餐後服用。
藥名: Sodium Bicarbonate 500mg/tab
用法: 每次1-2顆，一日3-4次，需在飯後服用。
', CAST(N'2023-03-24T21:55:00' AS SmallDateTime), CAST(N'2023-03-24T21:55:00' AS SmallDateTime))
INSERT [dbo].[tOffService] ([oId], [eId], [pId], [o就診日期], [o回診日期], [o醫師診斷], [o指示與用藥], [o建立], [o更新]) VALUES (9, 4, 9, N'2023-03-08', N'2023-04-08', N'喉嚨疼痛、發燒（體溫計量度為攝氏38度）、咳嗽、噁心、嘔吐。', N'
藥名: Indomethacin 25mg/cap
用法: 每次1顆，一日2-3次，需在飯後服用。', CAST(N'2023-03-24T21:55:00' AS SmallDateTime), CAST(N'2023-03-24T21:55:00' AS SmallDateTime))
INSERT [dbo].[tOffService] ([oId], [eId], [pId], [o就診日期], [o回診日期], [o醫師診斷], [o指示與用藥], [o建立], [o更新]) VALUES (10, 1, 10, N'2023-03-30', N'2023-04-08', N'腸胃炎、膽囊炎', N'藥名: Naproxen 500mg/tab
用法: 每次1顆，一日2-3次，需在餐後服用。
藥名: Levonorgestrel/Ethinyl Estradiol 0.15/0.03mg/tab
用法: 每日1顆，連續
', CAST(N'2023-03-24T21:55:00' AS SmallDateTime), CAST(N'2023-03-24T21:55:00' AS SmallDateTime))
INSERT [dbo].[tOffService] ([oId], [eId], [pId], [o就診日期], [o回診日期], [o醫師診斷], [o指示與用藥], [o建立], [o更新]) VALUES (11, 1, 11, N'2023-03-08', N'2023-04-02', N'風濕性關節炎、維生素缺乏、中風', N'藥名: Prednisolone 5mg/tab
用法: 每次2-5顆，一日2-4次，需在餐後服用。', CAST(N'2023-03-24T21:55:00' AS SmallDateTime), CAST(N'2023-03-24T21:55:00' AS SmallDateTime))
INSERT [dbo].[tOffService] ([oId], [eId], [pId], [o就診日期], [o回診日期], [o醫師診斷], [o指示與用藥], [o建立], [o更新]) VALUES (12, 1, 12, N'2023-03-08', N'2023-04-08', N'腸胃炎、膽囊炎', N'藥名: Naproxen 500mg/tab
用法: 每次1顆，一日2-3次，需在餐後服用。
藥名: Levonorgestrel/Ethinyl Estradiol 0.15/0.03mg/tab
用法: 每日1顆，連續
', CAST(N'2023-03-24T21:55:00' AS SmallDateTime), CAST(N'2023-03-24T21:55:00' AS SmallDateTime))
INSERT [dbo].[tOffService] ([oId], [eId], [pId], [o就診日期], [o回診日期], [o醫師診斷], [o指示與用藥], [o建立], [o更新]) VALUES (13, 1, 13, N'2023-02-21', N'2023-03-03', N'角膜炎、青光眼', N'藥名: Prednisolone 5mg/tab
用法: 每次2-5顆，一日2-4次，需在餐後服用。', CAST(N'2023-03-24T21:55:00' AS SmallDateTime), CAST(N'2023-03-24T21:55:00' AS SmallDateTime))
INSERT [dbo].[tOffService] ([oId], [eId], [pId], [o就診日期], [o回診日期], [o醫師診斷], [o指示與用藥], [o建立], [o更新]) VALUES (14, 1, 14, N'2023-02-08', N'2023-03-08', N'支氣管炎、肋膜炎', N'藥名: Naproxen 500mg/tab
用法: 每次1顆，一日2-3次，需在餐後服用。
藥名: Levonorgestrel/Ethinyl Estradiol 0.15/0.03mg/tab
用法: 每日1顆，連續
', CAST(N'2023-03-24T21:55:00' AS SmallDateTime), CAST(N'2023-03-24T21:55:00' AS SmallDateTime))
INSERT [dbo].[tOffService] ([oId], [eId], [pId], [o就診日期], [o回診日期], [o醫師診斷], [o指示與用藥], [o建立], [o更新]) VALUES (15, 1, 15, N'2023-03-05', N'2023-04-05', N'腸胃炎、膽囊炎', N'藥名: Acetaminophen 500mg/tab
用法: 每次1-2顆，一日4次，需在餐後服用。
藥名: Hyoscine Butylbromide 10mg/tab
用法: 每次1-2顆，一日3次，需在餐後服用。
藥名: Sodium Bicarbonate 500mg/tab
用法: 每次1-2顆，一日3-4次，需在飯後服用。
', CAST(N'2023-03-24T21:55:00' AS SmallDateTime), CAST(N'2023-03-24T21:55:00' AS SmallDateTime))
INSERT [dbo].[tOffService] ([oId], [eId], [pId], [o就診日期], [o回診日期], [o醫師診斷], [o指示與用藥], [o建立], [o更新]) VALUES (16, 1, 16, N'2023-03-08', N'2023-04-08', N'頸椎病', N'藥名: Naproxen 500mg/tab
用法: 每次1顆，一日2-3次，需在餐後服用。
藥名: Levonorgestrel/Ethinyl Estradiol 0.15/0.03mg/tab
用法: 每日1顆，連續
', CAST(N'2023-03-24T21:55:00' AS SmallDateTime), CAST(N'2023-03-24T21:55:00' AS SmallDateTime))
INSERT [dbo].[tOffService] ([oId], [eId], [pId], [o就診日期], [o回診日期], [o醫師診斷], [o指示與用藥], [o建立], [o更新]) VALUES (17, 1, 17, N'2023-03-08', N'2023-04-08', N'滑膜炎、半月板損傷', N'藥名: Prednisolone 5mg/tab
用法: 每次2-5顆，一日2-4次，需在餐後服用。', CAST(N'2023-03-24T21:55:00' AS SmallDateTime), CAST(N'2023-03-24T21:55:00' AS SmallDateTime))
INSERT [dbo].[tOffService] ([oId], [eId], [pId], [o就診日期], [o回診日期], [o醫師診斷], [o指示與用藥], [o建立], [o更新]) VALUES (18, 1, 18, N'2023-03-08', N'2023-04-08', N'頸椎病', N'藥名: Gemfibrozil 300mg/tab
用法: 每日2次，飯後服用。
藥名: Niacin 500mg/tab
用法: 每日1次，飯後服用。
', CAST(N'2023-03-24T21:55:00' AS SmallDateTime), CAST(N'2023-03-24T21:55:00' AS SmallDateTime))
INSERT [dbo].[tOffService] ([oId], [eId], [pId], [o就診日期], [o回診日期], [o醫師診斷], [o指示與用藥], [o建立], [o更新]) VALUES (19, 1, 19, N'2023-03-08', N'2023-04-08', N'泌尿系感染、膀胱炎', N'藥名: Gemfibrozil 300mg/tab
用法: 每日2次，飯後服用。
藥名: Niacin 500mg/tab
用法: 每日1次，飯後服用。
', CAST(N'2023-03-24T21:55:00' AS SmallDateTime), CAST(N'2023-03-24T21:55:00' AS SmallDateTime))
INSERT [dbo].[tOffService] ([oId], [eId], [pId], [o就診日期], [o回診日期], [o醫師診斷], [o指示與用藥], [o建立], [o更新]) VALUES (20, 1, 20, N'2023-03-08', N'2023-04-08', N'泌尿系感染、膀胱炎', N'藥名: Gemfibrozil 300mg/tab
用法: 每日2次，飯後服用。
藥名: Niacin 500mg/tab
用法: 每日1次，飯後服用。
', CAST(N'2023-03-24T21:55:00' AS SmallDateTime), CAST(N'2023-03-24T21:55:00' AS SmallDateTime))
INSERT [dbo].[tOffService] ([oId], [eId], [pId], [o就診日期], [o回診日期], [o醫師診斷], [o指示與用藥], [o建立], [o更新]) VALUES (21, 1, 21, N'2023-03-08', N'2023-04-08', N'泌尿系感染、膀胱炎', N'藥名: Gemfibrozil 300mg/tab
用法: 每日2次，飯後服用。
藥名: Niacin 500mg/tab
用法: 每日1次，飯後服用。
', CAST(N'2023-03-24T21:55:00' AS SmallDateTime), CAST(N'2023-03-24T21:55:00' AS SmallDateTime))
INSERT [dbo].[tOffService] ([oId], [eId], [pId], [o就診日期], [o回診日期], [o醫師診斷], [o指示與用藥], [o建立], [o更新]) VALUES (22, 1, 22, N'2023-03-08', N'2023-04-08', N'泌尿系感染、膀胱炎', N'藥名: Gemfibrozil 300mg/tab
用法: 每日2次，飯後服用。
藥名: Niacin 500mg/tab
用法: 每日1次，飯後服用。
', CAST(N'2023-03-24T21:55:00' AS SmallDateTime), CAST(N'2023-03-24T21:55:00' AS SmallDateTime))
INSERT [dbo].[tOffService] ([oId], [eId], [pId], [o就診日期], [o回診日期], [o醫師診斷], [o指示與用藥], [o建立], [o更新]) VALUES (23, 1, 23, N'2023-03-08', N'2023-04-08', N'泌尿系感染、膀胱炎', N'藥名: Gemfibrozil 300mg/tab
用法: 每日2次，飯後服用。
藥名: Niacin 500mg/tab
用法: 每日1次，飯後服用。
', CAST(N'2023-03-24T21:55:00' AS SmallDateTime), CAST(N'2023-03-24T21:55:00' AS SmallDateTime))
INSERT [dbo].[tOffService] ([oId], [eId], [pId], [o就診日期], [o回診日期], [o醫師診斷], [o指示與用藥], [o建立], [o更新]) VALUES (24, 1, 24, N'2023-03-08', N'2023-04-08', N'泌尿系感染、膀胱炎', N'藥名: Gemfibrozil 300mg/tab
用法: 每日2次，飯後服用。
藥名: Niacin 500mg/tab
用法: 每日1次，飯後服用。
', CAST(N'2023-03-24T21:55:00' AS SmallDateTime), CAST(N'2023-03-24T21:55:00' AS SmallDateTime))
INSERT [dbo].[tOffService] ([oId], [eId], [pId], [o就診日期], [o回診日期], [o醫師診斷], [o指示與用藥], [o建立], [o更新]) VALUES (25, 1, 25, N'2023-03-08', N'2023-04-08', N'泌尿系感染、膀胱炎', N'藥名: Gemfibrozil 300mg/tab
用法: 每日2次，飯後服用。
藥名: Niacin 500mg/tab
用法: 每日1次，飯後服用。
', CAST(N'2023-03-24T21:55:00' AS SmallDateTime), CAST(N'2023-03-24T21:55:00' AS SmallDateTime))
SET IDENTITY_INSERT [dbo].[tOffService] OFF
GO
SET IDENTITY_INSERT [dbo].[tOrder] ON 

INSERT [dbo].[tOrder] ([m進貨編號], [eId], [m衛材編號], [m訂購數量], [m價錢], [m小計], [m訂購日期], [m到貨日期], [m庫存數量], [m訂購狀態]) VALUES (1, 1, 1, 24, 50.0000, 1200.0000, CAST(N'2023-03-16T00:45:00.000' AS DateTime), NULL, 25, 1)
INSERT [dbo].[tOrder] ([m進貨編號], [eId], [m衛材編號], [m訂購數量], [m價錢], [m小計], [m訂購日期], [m到貨日期], [m庫存數量], [m訂購狀態]) VALUES (2, 5, 3, 10, 50.0000, 500.0000, CAST(N'2023-03-01T00:45:00.000' AS DateTime), CAST(N'2023-03-08T00:45:00.000' AS DateTime), 25, 0)
INSERT [dbo].[tOrder] ([m進貨編號], [eId], [m衛材編號], [m訂購數量], [m價錢], [m小計], [m訂購日期], [m到貨日期], [m庫存數量], [m訂購狀態]) VALUES (3, 4, 4, 5, 200.0000, 1000.0000, CAST(N'2023-03-08T00:45:00.000' AS DateTime), CAST(N'2023-03-26T00:45:00.000' AS DateTime), 15, 0)
INSERT [dbo].[tOrder] ([m進貨編號], [eId], [m衛材編號], [m訂購數量], [m價錢], [m小計], [m訂購日期], [m到貨日期], [m庫存數量], [m訂購狀態]) VALUES (4, 4, 2, 20, 10.0000, 200.0000, CAST(N'2023-03-15T00:46:00.000' AS DateTime), NULL, 43, 1)
INSERT [dbo].[tOrder] ([m進貨編號], [eId], [m衛材編號], [m訂購數量], [m價錢], [m小計], [m訂購日期], [m到貨日期], [m庫存數量], [m訂購狀態]) VALUES (5, 6, 5, 20, 150.0000, 3000.0000, CAST(N'2023-03-14T16:42:00.000' AS DateTime), CAST(N'2023-03-27T16:42:00.000' AS DateTime), 30, 0)
INSERT [dbo].[tOrder] ([m進貨編號], [eId], [m衛材編號], [m訂購數量], [m價錢], [m小計], [m訂購日期], [m到貨日期], [m庫存數量], [m訂購狀態]) VALUES (6, 2, 6, 20, 150.0000, 3000.0000, CAST(N'2023-03-23T19:42:00.000' AS DateTime), CAST(N'2023-03-29T19:43:00.000' AS DateTime), 30, 0)
SET IDENTITY_INSERT [dbo].[tOrder] OFF
GO
SET IDENTITY_INSERT [dbo].[tOrderMeal] ON 

INSERT [dbo].[tOrderMeal] ([omId], [meId], [訂購人], [訂購人電話], [訂餐起始日], [訂餐結束日], [總價], [結帳狀態], [建立時間], [修改時間], [修改人員], [備註]) VALUES (1, 5, N'劉尚森', N'0912345678', CAST(N'2023-04-13T00:00:00.000' AS DateTime), CAST(N'2023-04-21T00:00:00.000' AS DateTime), N'9600', N'未結帳', CAST(N'2023-04-03T15:54:37.810' AS DateTime), NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[tOrderMeal] OFF
GO
SET IDENTITY_INSERT [dbo].[tPatientInfo] ON 

INSERT [dbo].[tPatientInfo] ([pId], [p編號], [eId], [p姓名], [p性別], [p身分證字號], [p出生日期], [p地址], [p聯絡電話], [p聯絡人], [p電話2], [p餐點], [p醫師診斷], [p主訴], [現在病史], [過去病史], [家族病史], [檢查], [指示與用藥], [p建立], [p更新], [p照片]) VALUES (1, N'P230322103912', 1, N'劉尚森', N'女', N'J163618323', N'2023-03-15', N'高雄市楠梓區後昌路13號', N'0912345678', N'林辛鋭', N'0953726789', N'普通餐', N'蜂窩組織炎', N'右小腿紅腫熱痛併發燒約兩天', N'3 天前無明顯誘因出現右足背紅斑，迅速於一天之
內擴散至右小腿前側與後側，於兩天前進展至明顯的小腿紅腫熱痛，並且有
發燒、畏寒等症狀
', N'10 年前有類似病史，經治療後好轉，診斷為蜂窩組織炎,自訴過去無高血壓、糖尿病、肝炎、肺結核、血友病等疾病。
自訴過去無外傷、手術及輸血情形。
自訴過去無藥物及食物過敏。', N'自訴家族中無類似疾病患者，自訴家族中無肝炎、肺結核、高血壓、糖尿病、
血友病及腫瘤等疾病。', N'體溫 38.9∘C、脈搏 100 次/分、呼吸 22 次/分、血壓 100/70mmHg
發育正常，無營養不良，神智清楚，精神稍疲，以臥床入院，可自行翻身。定
向力、計算力正常。
無貧血貌，顏面、口唇無發紺。無黃疸。
頭顱、五官無畸形，雙側瞳孔等圓等大，直徑約 3mm，對光反射靈敏，外耳道、
鼻腔無異常分泌物。伸舌居中，雙側扁桃體未見腫大。
頸靜脈無怒張，頸軟，無抵抗，氣管居中，甲狀腺無腫大。
胸廓無畸形，胸骨無壓痛，雙肺呼吸音清，雙肺無乾、溼性囉音。
心界正常，心率 80 次/分，心律規則，各瓣膜聽診區無病理性雜音。
腹平軟，未發現胃腸型蠕動波及腹壁靜脈曲張，無觸及腫塊，無壓痛或反跳痛，
肝大小正常，無觸痛，肋下無可觸及之脾臟。肝區輕度叩擊痛，雙腎區無叩擊
痛，
無移動性濁音，腸嗚音約 4-5 次/分。外生殖器及肛周未檢查。
', N'Amoxicillin, Clavulanate Potassium (Augmentin 1gm/顆)每天早晚口服一顆', CAST(N'2023-03-22T10:39:00' AS SmallDateTime), CAST(N'2023-04-03T16:29:00' AS SmallDateTime), N'7c963c0d-980a-4b6e-a9c2-a13438948837.jpg')
INSERT [dbo].[tPatientInfo] ([pId], [p編號], [eId], [p姓名], [p性別], [p身分證字號], [p出生日期], [p地址], [p聯絡電話], [p聯絡人], [p電話2], [p餐點], [p醫師診斷], [p主訴], [現在病史], [過去病史], [家族病史], [檢查], [指示與用藥], [p建立], [p更新], [p照片]) VALUES (2, N'P230322111418', 1, N'王維', N'男', N'A123456789', N'2023-03-02', N'嘉義縣溪口鄉新生街30號', N'09778542135', N'黃晉誠', N'0989108434', N'糖尿病餐', N'Gout', N'昨天晚上開始出現頭痛、噁心、嘔吐，喉嚨痛，發燒（體溫計量度為攝氏38.5度），同時對光線感到非常敏感，今天早上症狀仍持續。', N'無呼吸道症狀，亦無腹瀉、
腹痛、嘔吐等症狀，大小便亦無異常。食慾、睡眠尚正常。擬住院給予靜脈
注射抗生素治療。
', N'生接受靜脈注射 Augmentin 治療，第二天之後退燒，白血球計數
有由急診時的白血球 18.6K/uL，分葉形白血球（segment）92%，出院前降至
7.3K/uL，分葉形白血球（segment）68%：C 型反應性蛋白（ＣＲＰ）也由
20.45 降至 1.14。右小腿與右足背紅腫熱痛逐漸消退。血液培養至出院時仍未
發現培養出細菌。病人於住院後十日出院。', N'自訴家族中無類似疾病患者，自訴家族中無肝炎、肺結核、高血壓、糖尿病、
血友病及腫瘤等疾病。', N'頭顱、五官無畸形，雙側瞳孔等圓等大，直徑約 3mm，對光反射靈敏，外耳道、
鼻腔無異常分泌物。伸舌居中，雙側扁桃體未見腫大。
頸靜脈無怒張，頸軟，無抵抗，氣管居中，甲狀腺無腫大。', N'藥名: Indomethacin 25mg/cap
用法: 每次1顆，一日2-3次，需在飯後服用。
藥名: Prednisolone 5mg/tab
用法: 每次2-5顆，一日2-4次，需在飯後服用。
藥名: Hydrochlorothiazide 25mg/tab
用法: 每日1次，飯後服用。', CAST(N'2023-03-22T11:14:00' AS SmallDateTime), CAST(N'2023-03-26T22:26:00' AS SmallDateTime), N'8fcb89d4-0936-45eb-9b10-5f03e4091f38.jpg')
INSERT [dbo].[tPatientInfo] ([pId], [p編號], [eId], [p姓名], [p性別], [p身分證字號], [p出生日期], [p地址], [p聯絡電話], [p聯絡人], [p電話2], [p餐點], [p醫師診斷], [p主訴], [現在病史], [過去病史], [家族病史], [檢查], [指示與用藥], [p建立], [p更新], [p照片]) VALUES (3, N'P230324150982', 1, N'林沛筑', N'女', N'Q202099323', N'1996-03-12', N'苗栗縣大湖鄉明湖街8號', N'0917652710', N'顏晴璐', N'0921135561', N'腎臟病餐', N'Kidney stones', N'我感到腰部疼痛，尤其是右側，同時伴有尿頻、排尿困難和疼痛。', N'急診
發現體溫 39.3∘C，白血球 18.6K/uL，分葉形白血球（segment）92%，C 型
反應性蛋白（CRP）20.45。系統回顧發現病人並無呼吸道症狀，亦無腹瀉、
腹痛、嘔吐等症狀，大小便亦無異常。食慾、睡眠尚正常。擬住院給予靜脈
注射抗生素治療', N'生接受靜脈注射 Augmentin 治療，第二天之後退燒，白血球計數
有由急診時的白血球 18.6K/uL，分葉形白血球（segment）92%，出院前降至
7.3K/uL，分葉形白血球（segment）68%：C 型反應性蛋白（ＣＲＰ）也由
20.45 降至 1.14。右小腿與右足背紅腫熱痛逐漸消退。血液培養至出院時仍未
發現培養出細菌。病人於住院後十日出院。', N'自訴家族中無類似疾病患者，自訴家族中無肝炎、肺結核、高血壓、糖尿病、
血友病及腫瘤等疾病。', N'體溫 38.9∘C、脈搏 100 次/分、呼吸 22 次/分、血壓 100/70mmHg
發育正常，無營養不良，神智清楚，精神稍疲，以臥床入院，可自行翻身。定
向力、計算力正常。
無貧血貌，顏面、口唇無發紺。無黃疸。
頭顱、五官無畸形，雙側瞳孔等圓等大，直徑約 3mm，對光反射靈敏，外耳道、
鼻腔無異常分泌物。伸舌居中，雙側扁桃體未見腫大。
頸靜脈無怒張，頸軟，無抵抗，氣管居中，甲狀腺無腫大。
胸廓無畸形，胸骨無壓痛，雙肺呼吸音清，雙肺無乾、溼性囉音。
', N'Acetaminophen 500mg/tab
Usage: 1-2 tablets each time, 4 times a day, take after meals.
Hyoscine Butylbromide 10mg/tab
Usage: 1-2 tablets each time, 3 times a day, take after meals.
Sodium Bicarbonate 500mg/tab
Usage: 1-2 tablets each time, 3-4 times a day, take after meals.
Diagnosis: Hyperlipidemia
Medication: Statins, Bezafibrate, Vitamin B3', CAST(N'2023-03-24T15:09:00' AS SmallDateTime), CAST(N'2023-03-26T22:27:00' AS SmallDateTime), N'024fe445-f26b-44a2-b054-38ede0d4217a.jpg')
INSERT [dbo].[tPatientInfo] ([pId], [p編號], [eId], [p姓名], [p性別], [p身分證字號], [p出生日期], [p地址], [p聯絡電話], [p聯絡人], [p電話2], [p餐點], [p醫師診斷], [p主訴], [現在病史], [過去病史], [家族病史], [檢查], [指示與用藥], [p建立], [p更新], [p照片]) VALUES (4, N'P230324151023', 1, N'趙採樂', N'女', N'K255300931', N'1979-01-01', N'臺中市南屯區工業區十九路7號9樓', N'0986813553', N'邱暉港', N'0986813553', N'普通餐', N'Analgesics, Urinary tract antispasmodic', N'左腹疼痛、腹部膨脹、噁心、嘔吐、排便不暢。
人事，在家工作，沒有旅遊史或接觸過有感染性疾病', N'急診
發現體溫 39.3∘C，白血球 18.6K/uL，分葉形白血球（segment）92%，C 型
反應性蛋白（CRP）20.45。系統回顧發現病人並無呼吸道症狀，亦無腹瀉、
腹痛、嘔吐等症狀，大小便亦無異常。食慾、睡眠尚正常。擬住院給予靜脈
注射抗生素治療', N'生接受靜脈注射 Augmentin 治療，第二天之後退燒，白血球計數
有由急診時的白血球 18.6K/uL，分葉形白血球（segment）92%，出院前降至
7.3K/uL，分葉形白血球（segment）68%：C 型反應性蛋白（ＣＲＰ）也由
20.45 降至 1.14。右小腿與右足背紅腫熱痛逐漸消退。血液培養至出院時仍未
發現培養出細菌。病人於住院後十日出院。', N'自訴家族中無類似疾病患者，自訴家族中無肝炎、肺結核、高血壓、糖尿病、
血友病及腫瘤等疾病。', N'體溫 38.9∘C、脈搏 100 次/分、呼吸 22 次/分、血壓 100/70mmHg
發育正常，無營養不良，神智清楚，精神稍疲，以臥床入院，可自行翻身。定
向力、計算力正常。
無貧血貌，顏面、口唇無發紺。無黃疸。
頭顱、五官無畸形，雙側瞳孔等圓等大，直徑約 3mm，對光反射靈敏，外耳道、
鼻腔無異常分泌物。伸舌居中，雙側扁桃體未見腫大。
頸靜脈無怒張，頸軟，無抵抗，氣管居中，甲狀腺無腫大。
胸廓無畸形，胸骨無壓痛，雙肺呼吸音清，雙肺無乾、溼性囉音。
', N'Indomethacin 25mg/cap
Usage: 1 capsule each time, 2-3 times a day, taken after meals.
Prednisolone 5mg/tab
Usage: 2-5 tablets each time, 2-4 times a day, taken after meals.
Hydrochlorothiazide 25mg/tab
Usage: Once a day, taken after meals.
Diagnosis: Shingles
Medication: Antivirals, Analgesics, Steroids', CAST(N'2023-03-24T15:11:00' AS SmallDateTime), CAST(N'2023-03-26T22:27:00' AS SmallDateTime), N'd884781e-1fc9-424f-b59c-380955e4e8ee.jpg')
INSERT [dbo].[tPatientInfo] ([pId], [p編號], [eId], [p姓名], [p性別], [p身分證字號], [p出生日期], [p地址], [p聯絡電話], [p聯絡人], [p電話2], [p餐點], [p醫師診斷], [p主訴], [現在病史], [過去病史], [家族病史], [檢查], [指示與用藥], [p建立], [p更新], [p照片]) VALUES (5, N'P230324151221', 2, N'吳昱淑', N'女', N'E277333037', N'2023-03-01', N'新北市瑞芳區大埔路慶安新村69號', N'0953875109', N'姜潤逸', N'0935962952', N'糖尿病餐', N'Shingles', N'左腹疼痛、腹部膨脹、噁心、嘔吐、排便不暢。
人事，在家工作，沒有旅遊史或接觸過有感染性疾病', N'急診
發現體溫 39.3∘C，白血球 18.6K/uL，分葉形白血球（segment）92%，C 型
反應性蛋白（CRP）20.45。系統回顧發現病人並無呼吸道症狀，亦無腹瀉、
腹痛、嘔吐等症狀，大小便亦無異常。食慾、睡眠尚正常。擬住院給予靜脈
注射抗生素治療', N'生接受靜脈注射 Augmentin 治療，第二天之後退燒，白血球計數
有由急診時的白血球 18.6K/uL，分葉形白血球（segment）92%，出院前降至
7.3K/uL，分葉形白血球（segment）68%：C 型反應性蛋白（ＣＲＰ）也由
20.45 降至 1.14。右小腿與右足背紅腫熱痛逐漸消退。血液培養至出院時仍未
發現培養出細菌。病人於住院後十日出院。', N'自訴家族中無類似疾病患者，自訴家族中無肝炎、肺結核、高血壓、糖尿病、
血友病及腫瘤等疾病。', N'體溫 38.9∘C、脈搏 100 次/分、呼吸 22 次/分、血壓 100/70mmHg
發育正常，無營養不良，神智清楚，精神稍疲，以臥床入院，可自行翻身。定
向力、計算力正常。
無貧血貌，顏面、口唇無發紺。無黃疸。
頭顱、五官無畸形，雙側瞳孔等圓等大，直徑約 3mm，對光反射靈敏，外耳道、
鼻腔無異常分泌物。伸舌居中，雙側扁桃體未見腫大。
頸靜脈無怒張，頸軟，無抵抗，氣管居中，甲狀腺無腫大。
胸廓無畸形，胸骨無壓痛，雙肺呼吸音清，雙肺無乾、溼性囉音。
', N'Acyclovir 200mg/tab: 每次2顆，一日5次，需在餐後服用。
 Acetaminophen 500mg/tab: 每次1-2顆，一日4次，需在餐後服用。
 Prednisolone 5mg/tab: 每次2-5顆，一日2-4次，需在餐後服用。', CAST(N'2023-03-24T15:12:00' AS SmallDateTime), CAST(N'2023-03-26T22:27:00' AS SmallDateTime), N'322c8e00-d1d3-4724-9e4b-f86357edca64.jpg')
INSERT [dbo].[tPatientInfo] ([pId], [p編號], [eId], [p姓名], [p性別], [p身分證字號], [p出生日期], [p地址], [p聯絡電話], [p聯絡人], [p電話2], [p餐點], [p醫師診斷], [p主訴], [現在病史], [過去病史], [家族病史], [檢查], [指示與用藥], [p建立], [p更新], [p照片]) VALUES (6, N'P230324151357', 4, N'薛又玲', N'女', N'K255300931', N'1927-01-01', N'臺南市新營區中山路35號之3', N'0937313340', N'謝康鶴', N'0956600982', N'普通餐', N'支氣管炎、肋膜炎', N'我的胸口疼痛，尤其在呼吸時更加嚴重，同時感到呼吸困難、喉嚨痛和咳嗽。', N'急診
發現體溫 39.3∘C，白血球 18.6K/uL，分葉形白血球（segment）92%，C 型
反應性蛋白（CRP）20.45。系統回顧發現病人並無呼吸道症狀，亦無腹瀉、
腹痛、嘔吐等症狀，大小便亦無異常。食慾、睡眠尚正常。擬住院給予靜脈
注射抗生素治療', N'生接受靜脈注射 Augmentin 治療，第二天之後退燒，白血球計數
有由急診時的白血球 18.6K/uL，分葉形白血球（segment）92%，出院前降至
7.3K/uL，分葉形白血球（segment）68%：C 型反應性蛋白（ＣＲＰ）也由
20.45 降至 1.14。右小腿與右足背紅腫熱痛逐漸消退。血液培養至出院時仍未
發現培養出細菌。病人於住院後十日出院。', N'自訴家族中無類似疾病患者，自訴家族中無肝炎、肺結核、高血壓、糖尿病、
血友病及腫瘤等疾病。', N'體溫 38.9∘C、脈搏 100 次/分、呼吸 22 次/分、血壓 100/70mmHg
發育正常，無營養不良，神智清楚，精神稍疲，以臥床入院，可自行翻身。定
向力、計算力正常。
無貧血貌，顏面、口唇無發紺。無黃疸。
頭顱、五官無畸形，雙側瞳孔等圓等大，直徑約 3mm，對光反射靈敏，外耳道、
鼻腔無異常分泌物。伸舌居中，雙側扁桃體未見腫大。
頸靜脈無怒張，頸軟，無抵抗，氣管居中，甲狀腺無腫大。
胸廓無畸形，胸骨無壓痛，雙肺呼吸音清，雙肺無乾、溼性囉音。
', N'藥名: Atorvastatin Calcium 10mg/tab
用法: 每日1次，一般於睡前服用。
藥名: Gemfibrozil 300mg/tab
用法: 每日2次，飯後服用。
藥名: Niacin 500mg/tab
用法: 每日1次，飯後服用。
', CAST(N'2023-03-24T15:13:00' AS SmallDateTime), CAST(N'2023-03-26T22:26:00' AS SmallDateTime), N'93056556-f39d-4117-a7dc-5f2265f16dfb.jpg')
INSERT [dbo].[tPatientInfo] ([pId], [p編號], [eId], [p姓名], [p性別], [p身分證字號], [p出生日期], [p地址], [p聯絡電話], [p聯絡人], [p電話2], [p餐點], [p醫師診斷], [p主訴], [現在病史], [過去病史], [家族病史], [檢查], [指示與用藥], [p建立], [p更新], [p照片]) VALUES (7, N'P230324151446', 5, N'劉保淳', N'男', N'U163079558', N'1956-01-01', N'高雄市茄萣區信義路２段20號12樓', N'0916767307', N'謝好恩', N'0958018365', N'普通餐', N'中暑、腦膜炎', N'呼吸急促、胸口緊迫、咳嗽、噁心、乏力。', N'急診
發現體溫 39.3∘C，白血球 18.6K/uL，分葉形白血球（segment）92%，C 型
反應性蛋白（CRP）20.45。系統回顧發現病人並無呼吸道症狀，亦無腹瀉、
腹痛、嘔吐等症狀，大小便亦無異常。食慾、睡眠尚正常。擬住院給予靜脈
注射抗生素治療', N'生接受靜脈注射 Augmentin 治療，第二天之後退燒，白血球計數
有由急診時的白血球 18.6K/uL，分葉形白血球（segment）92%，出院前降至
7.3K/uL，分葉形白血球（segment）68%：C 型反應性蛋白（ＣＲＰ）也由
20.45 降至 1.14。右小腿與右足背紅腫熱痛逐漸消退。血液培養至出院時仍未
發現培養出細菌。病人於住院後十日出院。', N'自訴家族中無類似疾病患者，自訴家族中無肝炎、肺結核、高血壓、糖尿病、
血友病及腫瘤等疾病。', N'體溫 38.9∘C、脈搏 100 次/分、呼吸 22 次/分、血壓 100/70mmHg
發育正常，無營養不良，神智清楚，精神稍疲，以臥床入院，可自行翻身。定
向力、計算力正常。
無貧血貌，顏面、口唇無發紺。無黃疸。
頭顱、五官無畸形，雙側瞳孔等圓等大，直徑約 3mm，對光反射靈敏，外耳道、
鼻腔無異常分泌物。伸舌居中，雙側扁桃體未見腫大。
頸靜脈無怒張，頸軟，無抵抗，氣管居中，甲狀腺無腫大。
胸廓無畸形，胸骨無壓痛，雙肺呼吸音清，雙肺無乾、溼性囉音。
', N'Atorvastatin Calcium 10mg/tab
Usage: Once a day, usually taken before bedtime.
Gemfibrozil 300mg/tab
Usage: Twice a day, taken after meals.
Niacin 500mg/tab
Usage: Once a day, taken after meals.
Diagnosis: Gout
Medication: NSAIDs, Steroids, Diuretics', CAST(N'2023-03-24T15:14:00' AS SmallDateTime), CAST(N'2023-03-26T22:27:00' AS SmallDateTime), N'268e8472-83bc-4fcb-a487-22e8e915385b.jpg')
INSERT [dbo].[tPatientInfo] ([pId], [p編號], [eId], [p姓名], [p性別], [p身分證字號], [p出生日期], [p地址], [p聯絡電話], [p聯絡人], [p電話2], [p餐點], [p醫師診斷], [p主訴], [現在病史], [過去病史], [家族病史], [檢查], [指示與用藥], [p建立], [p更新], [p照片]) VALUES (8, N'P230324151599', 6, N'陳英露', N'女', N'P221185852', N'1927-03-15', N'臺中市南屯區惠德街47號', N'0958018365', N'戴淼華', N'0958018365', N'腎臟病餐', N'腕管綜合症、關節炎', N'左腕疼痛，有些腫脹和發紅，同時手部活動受限。', N'急診
發現體溫 39.3∘C，白血球 18.6K/uL，分葉形白血球（segment）92%，C 型
反應性蛋白（CRP）20.45。系統回顧發現病人並無呼吸道症狀，亦無腹瀉、
腹痛、嘔吐等症狀，大小便亦無異常。食慾、睡眠尚正常。擬住院給予靜脈
注射抗生素治療', N'生接受靜脈注射 Augmentin 治療，第二天之後退燒，白血球計數
有由急診時的白血球 18.6K/uL，分葉形白血球（segment）92%，出院前降至
7.3K/uL，分葉形白血球（segment）68%：C 型反應性蛋白（ＣＲＰ）也由
20.45 降至 1.14。右小腿與右足背紅腫熱痛逐漸消退。血液培養至出院時仍未
發現培養出細菌。病人於住院後十日出院。', N'自訴家族中無類似疾病患者，自訴家族中無肝炎、肺結核、高血壓、糖尿病、
血友病及腫瘤等疾病。', N'體溫 38.9∘C、脈搏 100 次/分、呼吸 22 次/分、血壓 100/70mmHg
發育正常，無營養不良，神智清楚，精神稍疲，以臥床入院，可自行翻身。定
向力、計算力正常。
無貧血貌，顏面、口唇無發紺。無黃疸。
頭顱、五官無畸形，雙側瞳孔等圓等大，直徑約 3mm，對光反射靈敏，外耳道、
鼻腔無異常分泌物。伸舌居中，雙側扁桃體未見腫大。
頸靜脈無怒張，頸軟，無抵抗，氣管居中，甲狀腺無腫大。
胸廓無畸形，胸骨無壓痛，雙肺呼吸音清，雙肺無乾、溼性囉音。
', N'Acyclovir 200mg/tab
Usage: 2 tablets each time, 5 times a day, taken after meals.
Acetaminophen 500mg/tab
Usage: 1-2 tablets each time, 4 times a day, taken after meals.
Prednisolone 5mg/tab
Usage: 2-5 tablets each time, 2-4 times a day, taken after meals.
Diagnosis: Dysmenorrhea
Medication: Analgesics, Contraceptives, Antispasmodics', CAST(N'2023-03-24T15:16:00' AS SmallDateTime), CAST(N'2023-03-26T22:28:00' AS SmallDateTime), N'9c1cb8a1-7f0e-4573-891d-ab68e6d1371c.jpg')
INSERT [dbo].[tPatientInfo] ([pId], [p編號], [eId], [p姓名], [p性別], [p身分證字號], [p出生日期], [p地址], [p聯絡電話], [p聯絡人], [p電話2], [p餐點], [p醫師診斷], [p主訴], [現在病史], [過去病史], [家族病史], [檢查], [指示與用藥], [p建立], [p更新], [p照片]) VALUES (9, N'P230324151669', 6, N'邱暉港', N'男', N'F142631092', N'1911-03-02', N'彰化縣溪州鄉民生路13號', N'0956600982', N'王廷晟', N'0956600982', N'普通餐', N'喉嚨疼痛、發燒（體溫計量度為攝氏38度）、咳嗽、噁心、嘔吐。', N'我昨天晚上開始出現嚴重的頭痛、噁心、嘔吐，喉嚨痛，發燒（體溫計量度為攝氏38.5度），同時對光線感到非常敏感，今天早上症狀仍持續。', N'急診
發現體溫 39.3∘C，白血球 18.6K/uL，分葉形白血球（segment）92%，C 型
反應性蛋白（CRP）20.45。系統回顧發現病人並無呼吸道症狀，亦無腹瀉、
腹痛、嘔吐等症狀，大小便亦無異常。食慾、睡眠尚正常。擬住院給予靜脈
注射抗生素治療', N'生接受靜脈注射 Augmentin 治療，第二天之後退燒，白血球計數
有由急診時的白血球 18.6K/uL，分葉形白血球（segment）92%，出院前降至
7.3K/uL，分葉形白血球（segment）68%：C 型反應性蛋白（ＣＲＰ）也由
20.45 降至 1.14。右小腿與右足背紅腫熱痛逐漸消退。血液培養至出院時仍未
發現培養出細菌。病人於住院後十日出院。', N'自訴家族中無類似疾病患者，自訴家族中無肝炎、肺結核、高血壓、糖尿病、
血友病及腫瘤等疾病。', N'體溫 38.9∘C、脈搏 100 次/分、呼吸 22 次/分、血壓 100/70mmHg
發育正常，無營養不良，神智清楚，精神稍疲，以臥床入院，可自行翻身。定
向力、計算力正常。
無貧血貌，顏面、口唇無發紺。無黃疸。
頭顱、五官無畸形，雙側瞳孔等圓等大，直徑約 3mm，對光反射靈敏，外耳道、
鼻腔無異常分泌物。伸舌居中，雙側扁桃體未見腫大。
頸靜脈無怒張，頸軟，無抵抗，氣管居中，甲狀腺無腫大。
胸廓無畸形，胸骨無壓痛，雙肺呼吸音清，雙肺無乾、溼性囉音。
', N'Acetaminophen 500mg/tab: 每次1顆，一日4次，餐後服用。
 Hyoscine Butylbromide 10mg/tab: 每次1顆，一日3次，餐後服用。
藥名: Sodium Bicarbonate 500mg/tab:每次1顆，一日3次，飯後服用。', CAST(N'2023-03-24T15:17:00' AS SmallDateTime), CAST(N'2023-03-26T22:28:00' AS SmallDateTime), N'32c89e9f-8b9c-476e-b213-d94ee87c5212.jpg')
INSERT [dbo].[tPatientInfo] ([pId], [p編號], [eId], [p姓名], [p性別], [p身分證字號], [p出生日期], [p地址], [p聯絡電話], [p聯絡人], [p電話2], [p餐點], [p醫師診斷], [p主訴], [現在病史], [過去病史], [家族病史], [檢查], [指示與用藥], [p建立], [p更新], [p照片]) VALUES (10, N'P230324151888', 1, N'陳怡瑩', N'女', N'T278616171', N'1921-01-01', N'臺中市大安區三元路68號之4', N'0910886973', N'顏晴璐', N'0910886973', N'普通餐', N'腸胃炎、膽囊炎', N'左腹疼痛、腹部膨脹、噁心、嘔吐、排便不暢。', N'急診
發現體溫 39.3∘C，白血球 18.6K/uL，分葉形白血球（segment）92%，C 型
反應性蛋白（CRP）20.45。系統回顧發現病人並無呼吸道症狀，亦無腹瀉、
腹痛、嘔吐等症狀，大小便亦無異常。食慾、睡眠尚正常。擬住院給予靜脈
注射抗生素治療', N'生接受靜脈注射 Augmentin 治療，第二天之後退燒，白血球計數
有由急診時的白血球 18.6K/uL，分葉形白血球（segment）92%，出院前降至
7.3K/uL，分葉形白血球（segment）68%：C 型反應性蛋白（ＣＲＰ）也由
20.45 降至 1.14。右小腿與右足背紅腫熱痛逐漸消退。血液培養至出院時仍未
發現培養出細菌。病人於住院後十日出院。', N'自訴家族中無類似疾病患者，自訴家族中無肝炎、肺結核、高血壓、糖尿病、
血友病及腫瘤等疾病。', N'體溫 38.9∘C、脈搏 100 次/分、呼吸 22 次/分、血壓 100/70mmHg
發育正常，無營養不良，神智清楚，精神稍疲，以臥床入院，可自行翻身。定
向力、計算力正常。
無貧血貌，顏面、口唇無發紺。無黃疸。
頭顱、五官無畸形，雙側瞳孔等圓等大，直徑約 3mm，對光反射靈敏，外耳道、
鼻腔無異常分泌物。伸舌居中，雙側扁桃體未見腫大。
頸靜脈無怒張，頸軟，無抵抗，氣管居中，甲狀腺無腫大。
胸廓無畸形，胸骨無壓痛，雙肺呼吸音清，雙肺無乾、溼性囉音。
', N'Acetaminophen 500mg/tab: 每次1顆，一日4次，餐後服用。
 Hyoscine Butylbromide 10mg/tab: 每次1顆，一日3次，餐後服用。
藥名: Sodium Bicarbonate 500mg/tab:每次1顆，一日3次，飯後服用。', CAST(N'2023-03-24T15:18:00' AS SmallDateTime), CAST(N'2023-03-26T22:28:00' AS SmallDateTime), N'35de4b3c-4833-4a94-a95e-e9cf5b877269.jpg')
INSERT [dbo].[tPatientInfo] ([pId], [p編號], [eId], [p姓名], [p性別], [p身分證字號], [p出生日期], [p地址], [p聯絡電話], [p聯絡人], [p電話2], [p餐點], [p醫師診斷], [p主訴], [現在病史], [過去病史], [家族病史], [檢查], [指示與用藥], [p建立], [p更新], [p照片]) VALUES (11, N'P230324151932', 5, N'連勁書', N'男', N'L122426348', N'1955-03-14', N'苗栗縣苗栗市華清街61號', N'0925913660', N'程俊振', N'0925913645', N'普通餐', N'風濕性關節炎、維生素缺乏、中風', N'感到肌肉疼痛和僵硬，尤其是在早上起床時更加明顯，同時手腳也感到麻木。', N'急診
發現體溫 39.3∘C，白血球 18.6K/uL，分葉形白血球（segment）92%，C 型
反應性蛋白（CRP）20.45。系統回顧發現病人並無呼吸道症狀，亦無腹瀉、
腹痛、嘔吐等症狀，大小便亦無異常。食慾、睡眠尚正常。擬住院給予靜脈
注射抗生素治療', N'生接受靜脈注射 Augmentin 治療，第二天之後退燒，白血球計數
有由急診時的白血球 18.6K/uL，分葉形白血球（segment）92%，出院前降至
7.3K/uL，分葉形白血球（segment）68%：C 型反應性蛋白（ＣＲＰ）也由
20.45 降至 1.14。右小腿與右足背紅腫熱痛逐漸消退。血液培養至出院時仍未
發現培養出細菌。病人於住院後十日出院。', N'自訴家族中無類似疾病患者，自訴家族中無肝炎、肺結核、高血壓、糖尿病、
血友病及腫瘤等疾病。', N'體溫 38.9∘C、脈搏 100 次/分、呼吸 22 次/分、血壓 100/70mmHg
發育正常，無營養不良，神智清楚，精神稍疲，以臥床入院，可自行翻身。定
向力、計算力正常。
無貧血貌，顏面、口唇無發紺。無黃疸。
頭顱、五官無畸形，雙側瞳孔等圓等大，直徑約 3mm，對光反射靈敏，外耳道、
鼻腔無異常分泌物。伸舌居中，雙側扁桃體未見腫大。
頸靜脈無怒張，頸軟，無抵抗，氣管居中，甲狀腺無腫大。
胸廓無畸形，胸骨無壓痛，雙肺呼吸音清，雙肺無乾、溼性囉音。
', N'AAcetaminophen 500mg/tab
Usage: 1-2 tablets each time, 4 times a day, take after meals.
Hyoscine Butylbromide 10mg/tab
Usage: 1-2 tablets each time, 3 times a day, take after meals.
Sodium Bicarbonate 500mg/tab
Usage: 1-2 tablets each time, 3-4 times a day, take after meals.
Diagnosis: Hyperlipidemia
Medication: Statins, Bezafibrate, Vitamin B3', CAST(N'2023-03-24T15:19:00' AS SmallDateTime), CAST(N'2023-03-26T22:28:00' AS SmallDateTime), N'6f2d9d80-a68a-4c75-bb3d-e7af6a87cb52.jpg')
INSERT [dbo].[tPatientInfo] ([pId], [p編號], [eId], [p姓名], [p性別], [p身分證字號], [p出生日期], [p地址], [p聯絡電話], [p聯絡人], [p電話2], [p餐點], [p醫師診斷], [p主訴], [現在病史], [過去病史], [家族病史], [檢查], [指示與用藥], [p建立], [p更新], [p照片]) VALUES (12, N'P230324152012', 4, N'簡穎菡', N'女', N'R208580020', N'1944-03-13', N'屏東縣屏東市中正路78號之11', N'0910755077', N'白濤邦', N'0910755077', N'糖尿病餐', N'腸胃炎、膽囊炎', N'左腹疼痛、腹部膨脹、噁心、嘔吐、排便不暢。', N'無呼吸道症狀，亦無腹瀉、
腹痛、嘔吐等症狀，大小便亦無異常。食慾、睡眠尚正常。擬住院給予靜脈
注射抗生素治療。
', N'生接受靜脈注射 Augmentin 治療，第二天之後退燒，白血球計數
有由急診時的白血球 18.6K/uL，分葉形白血球（segment）92%，出院前降至
7.3K/uL，分葉形白血球（segment）68%：C 型反應性蛋白（ＣＲＰ）也由
20.45 降至 1.14。右小腿與右足背紅腫熱痛逐漸消退。血液培養至出院時仍未
發現培養出細菌。病人於住院後十日出院。', N'自訴家族中無類似疾病患者，自訴家族中無肝炎、肺結核、高血壓、糖尿病、
血友病及腫瘤等疾病。', N'體溫 38.9∘C、脈搏 100 次/分、呼吸 22 次/分、血壓 100/70mmHg
發育正常，無營養不良，神智清楚，精神稍疲，以臥床入院，可自行翻身。定
向力、計算力正常。
無貧血貌，顏面、口唇無發紺。無黃疸。
頭顱、五官無畸形，雙側瞳孔等圓等大，直徑約 3mm，對光反射靈敏，外耳道、
鼻腔無異常分泌物。伸舌居中，雙側扁桃體未見腫大。
頸靜脈無怒張，頸軟，無抵抗，氣管居中，甲狀腺無腫大。
胸廓無畸形，胸骨無壓痛，雙肺呼吸音清，雙肺無乾、溼性囉音。
', N'Naproxen 500mg/tab
Usage: 1 tablet each time, 2-3 times a day, taken after meals.
Levonorgestrel/Ethinyl Estradiol 0.15/0.03mg/tab
Usage: 1 tablet daily, taken continuously.', CAST(N'2023-03-24T15:20:00' AS SmallDateTime), CAST(N'2023-03-26T22:29:00' AS SmallDateTime), N'4f20b134-9787-4c37-8a69-ff99dab6b4e3.jpg')
INSERT [dbo].[tPatientInfo] ([pId], [p編號], [eId], [p姓名], [p性別], [p身分證字號], [p出生日期], [p地址], [p聯絡電話], [p聯絡人], [p電話2], [p餐點], [p醫師診斷], [p主訴], [現在病史], [過去病史], [家族病史], [檢查], [指示與用藥], [p建立], [p更新], [p照片]) VALUES (13, N'P230324152187', 4, N'蘇洋英', N'男', N'Z180118718', N'1966-03-03', N'桃園市中壢區內厝子95號', N'0910886973', N'李慶越', N'0910886973', N'普通餐', N'角膜炎、青光眼', N'我的右眼感到疼痛和灼熱，同時有些模糊，視野也變窄了', N'無呼吸道症狀，亦無腹瀉、
腹痛、嘔吐等症狀，大小便亦無異常。食慾、睡眠尚正常。擬住院給予靜脈
注射抗生素治療。
', N'生接受靜脈注射 Augmentin 治療，第二天之後退燒，白血球計數
有由急診時的白血球 18.6K/uL，分葉形白血球（segment）92%，出院前降至
7.3K/uL，分葉形白血球（segment）68%：C 型反應性蛋白（ＣＲＰ）也由
20.45 降至 1.14。右小腿與右足背紅腫熱痛逐漸消退。血液培養至出院時仍未
發現培養出細菌。病人於住院後十日出院。', N'自訴家族中無類似疾病患者，自訴家族中無肝炎、肺結核、高血壓、糖尿病、
血友病及腫瘤等疾病。', N'體溫 38.9∘C、脈搏 100 次/分、呼吸 22 次/分、血壓 100/70mmHg
發育正常，無營養不良，神智清楚，精神稍疲，以臥床入院，可自行翻身。定
向力、計算力正常。
無貧血貌，顏面、口唇無發紺。無黃疸。
頭顱、五官無畸形，雙側瞳孔等圓等大，直徑約 3mm，對光反射靈敏，外耳道、
鼻腔無異常分泌物。伸舌居中，雙側扁桃體未見腫大。
頸靜脈無怒張，頸軟，無抵抗，氣管居中，甲狀腺無腫大。
胸廓無畸形，胸骨無壓痛，雙肺呼吸音清，雙肺無乾、溼性囉音。
', N'
藥名: Naproxen 500mg/tab
用法: 每次1顆，一日2-3次，需在餐後服用。
藥名: Levonorgestrel/Ethinyl Estradiol 0.15/0.03mg/tab
用法: 每日1顆，連續', CAST(N'2023-03-24T15:22:00' AS SmallDateTime), CAST(N'2023-03-26T22:29:00' AS SmallDateTime), N'9fddb700-46fa-48eb-9bd6-e779c584b58e.jpg')
INSERT [dbo].[tPatientInfo] ([pId], [p編號], [eId], [p姓名], [p性別], [p身分證字號], [p出生日期], [p地址], [p聯絡電話], [p聯絡人], [p電話2], [p餐點], [p醫師診斷], [p主訴], [現在病史], [過去病史], [家族病史], [檢查], [指示與用藥], [p建立], [p更新], [p照片]) VALUES (14, N'P230324152372', 6, N'陳英露', N'女', N'P221185852', N'1921-03-18', N'花蓮縣花蓮市中福路78號9樓之12', N'0935969774', NULL, N'0935969456', N'普通餐', N'支氣管炎、肋膜炎', N'呼吸急促、胸口緊迫、咳嗽、噁心、乏力。', N'無呼吸道症狀，亦無腹瀉、
腹痛、嘔吐等症狀，大小便亦無異常。食慾、睡眠尚正常。擬住院給予靜脈
注射抗生素治療。
', N'生接受靜脈注射 Augmentin 治療，第二天之後退燒，白血球計數
有由急診時的白血球 18.6K/uL，分葉形白血球（segment）92%，出院前降至
7.3K/uL，分葉形白血球（segment）68%：C 型反應性蛋白（ＣＲＰ）也由
20.45 降至 1.14。右小腿與右足背紅腫熱痛逐漸消退。血液培養至出院時仍未
發現培養出細菌。病人於住院後十日出院。', N'自訴家族中無類似疾病患者，自訴家族中無肝炎、肺結核、高血壓、糖尿病、
血友病及腫瘤等疾病。', N'體溫 38.9∘C、脈搏 100 次/分、呼吸 22 次/分、血壓 100/70mmHg
發育正常，無營養不良，神智清楚，精神稍疲，以臥床入院，可自行翻身。定
向力、計算力正常。
無貧血貌，顏面、口唇無發紺。無黃疸。
頭顱、五官無畸形，雙側瞳孔等圓等大，直徑約 3mm，對光反射靈敏，外耳道、
鼻腔無異常分泌物。伸舌居中，雙側扁桃體未見腫大。
頸靜脈無怒張，頸軟，無抵抗，氣管居中，甲狀腺無腫大。
胸廓無畸形，胸骨無壓痛，雙肺呼吸音清，雙肺無乾、溼性囉音。
', N'
藥名: Naproxen 500mg/tab
用法: 每次1顆，一日2-3次，需在餐後服用。
藥名: Levonorgestrel/Ethinyl Estradiol 0.15/0.03mg/tab
用法: 每日1顆，連續', CAST(N'2023-03-24T15:23:00' AS SmallDateTime), CAST(N'2023-03-26T22:29:00' AS SmallDateTime), N'3c2b47c3-8b3c-43e9-ac68-2059c0614897.jpg')
INSERT [dbo].[tPatientInfo] ([pId], [p編號], [eId], [p姓名], [p性別], [p身分證字號], [p出生日期], [p地址], [p聯絡電話], [p聯絡人], [p電話2], [p餐點], [p醫師診斷], [p主訴], [現在病史], [過去病史], [家族病史], [檢查], [指示與用藥], [p建立], [p更新], [p照片]) VALUES (15, N'P230324152456', 4, N'謝好恩', N'女', N'R275933548', N'2023-03-27', N'臺中市南屯區惠德街47號', N'0912195260', N'何星温', N'0912195260', N'普通餐', N'腸胃炎、膽囊炎', N'左腹疼痛、腹部膨脹、噁心、嘔吐、排便不暢。', N'無呼吸道症狀，亦無腹瀉、
腹痛、嘔吐等症狀，大小便亦無異常。食慾、睡眠尚正常。擬住院給予靜脈
注射抗生素治療。
', N'生接受靜脈注射 Augmentin 治療，第二天之後退燒，白血球計數
有由急診時的白血球 18.6K/uL，分葉形白血球（segment）92%，出院前降至
7.3K/uL，分葉形白血球（segment）68%：C 型反應性蛋白（ＣＲＰ）也由
20.45 降至 1.14。右小腿與右足背紅腫熱痛逐漸消退。血液培養至出院時仍未
發現培養出細菌。病人於住院後十日出院。', N'自訴家族中無類似疾病患者，自訴家族中無肝炎、肺結核、高血壓、糖尿病、
血友病及腫瘤等疾病。', N'體溫 38.9∘C、脈搏 100 次/分、呼吸 22 次/分、血壓 100/70mmHg
發育正常，無營養不良，神智清楚，精神稍疲，以臥床入院，可自行翻身。定
向力、計算力正常。
無貧血貌，顏面、口唇無發紺。無黃疸。
頭顱、五官無畸形，雙側瞳孔等圓等大，直徑約 3mm，對光反射靈敏，外耳道、
鼻腔無異常分泌物。伸舌居中，雙側扁桃體未見腫大。
頸靜脈無怒張，頸軟，無抵抗，氣管居中，甲狀腺無腫大。
胸廓無畸形，胸骨無壓痛，雙肺呼吸音清，雙肺無乾、溼性囉音。
', N'
藥名: Naproxen 500mg/tab
用法: 每次1顆，一日2-3次，需在餐後服用。
藥名: Levonorgestrel/Ethinyl Estradiol 0.15/0.03mg/tab
用法: 每日1顆，連續', CAST(N'2023-03-24T15:24:00' AS SmallDateTime), CAST(N'2023-03-26T22:30:00' AS SmallDateTime), N'e09fc944-e609-41a3-b340-a840b5d41bf5.jpg')
INSERT [dbo].[tPatientInfo] ([pId], [p編號], [eId], [p姓名], [p性別], [p身分證字號], [p出生日期], [p地址], [p聯絡電話], [p聯絡人], [p電話2], [p餐點], [p醫師診斷], [p主訴], [現在病史], [過去病史], [家族病史], [檢查], [指示與用藥], [p建立], [p更新], [p照片]) VALUES (16, N'P230324152553', 6, N'黃吉政', N'男', N'F142357242', N'1958-03-15', N'臺南市歸仁區成功路１段52號11樓之11', N'098910843', N'鄭澍良', N'0989108434', N'普通餐', N'頸椎病', N'我感到頸部僵硬和疼痛，同時頭痛和發燒。', N'無呼吸道症狀，亦無腹瀉、
腹痛、嘔吐等症狀，大小便亦無異常。食慾、睡眠尚正常。擬住院給予靜脈
注射抗生素治療。
', N'生接受靜脈注射 Augmentin 治療，第二天之後退燒，白血球計數
有由急診時的白血球 18.6K/uL，分葉形白血球（segment）92%，出院前降至
7.3K/uL，分葉形白血球（segment）68%：C 型反應性蛋白（ＣＲＰ）也由
20.45 降至 1.14。右小腿與右足背紅腫熱痛逐漸消退。血液培養至出院時仍未
發現培養出細菌。病人於住院後十日出院。', N'自訴家族中無類似疾病患者，自訴家族中無肝炎、肺結核、高血壓、糖尿病、
血友病及腫瘤等疾病。', N'體溫 38.9∘C、脈搏 100 次/分、呼吸 22 次/分、血壓 100/70mmHg
發育正常，無營養不良，神智清楚，精神稍疲，以臥床入院，可自行翻身。定
向力、計算力正常。
無貧血貌，顏面、口唇無發紺。無黃疸。
頭顱、五官無畸形，雙側瞳孔等圓等大，直徑約 3mm，對光反射靈敏，外耳道、
鼻腔無異常分泌物。伸舌居中，雙側扁桃體未見腫大。
頸靜脈無怒張，頸軟，無抵抗，氣管居中，甲狀腺無腫大。
胸廓無畸形，胸骨無壓痛，雙肺呼吸音清，雙肺無乾、溼性囉音。
', N'
藥名: Naproxen 500mg/tab
用法: 每次1顆，一日2-3次，需在餐後服用。
藥名: Levonorgestrel/Ethinyl Estradiol 0.15/0.03mg/tab
用法: 每日1顆，連續', CAST(N'2023-03-24T15:25:00' AS SmallDateTime), CAST(N'2023-03-26T22:30:00' AS SmallDateTime), N'70e4a3c2-afef-4ae6-885f-81c05b8a9d30.jpg')
INSERT [dbo].[tPatientInfo] ([pId], [p編號], [eId], [p姓名], [p性別], [p身分證字號], [p出生日期], [p地址], [p聯絡電話], [p聯絡人], [p電話2], [p餐點], [p醫師診斷], [p主訴], [現在病史], [過去病史], [家族病史], [檢查], [指示與用藥], [p建立], [p更新], [p照片]) VALUES (17, N'P230324152610', 2, N'姜潤逸', N'男', N'C135609809', N'1955-03-22', N'桃園市龜山區明德路明駝巷92號', N'0910953056', N'蔡清葉', N'0910953056', N'普通餐', N'滑膜炎、半月板損傷', N'感到膝蓋疼痛，尤其是行走或跑步時更加嚴重，同時膝蓋周圍有些腫脹和發紅。
可能疾病', N'無呼吸道症狀，亦無腹瀉、
腹痛、嘔吐等症狀，大小便亦無異常。食慾、睡眠尚正常。擬住院給予靜脈
注射抗生素治療。
', N'生接受靜脈注射 Augmentin 治療，第二天之後退燒，白血球計數
有由急診時的白血球 18.6K/uL，分葉形白血球（segment）92%，出院前降至
7.3K/uL，分葉形白血球（segment）68%：C 型反應性蛋白（ＣＲＰ）也由
20.45 降至 1.14。右小腿與右足背紅腫熱痛逐漸消退。血液培養至出院時仍未
發現培養出細菌。病人於住院後十日出院。', N'自訴家族中無類似疾病患者，自訴家族中無肝炎、肺結核、高血壓、糖尿病、
血友病及腫瘤等疾病。', N'體溫 38.9∘C、脈搏 100 次/分、呼吸 22 次/分、血壓 100/70mmHg
發育正常，無營養不良，神智清楚，精神稍疲，以臥床入院，可自行翻身。定
向力、計算力正常。
無貧血貌，顏面、口唇無發紺。無黃疸。
頭顱、五官無畸形，雙側瞳孔等圓等大，直徑約 3mm，對光反射靈敏，外耳道、
鼻腔無異常分泌物。伸舌居中，雙側扁桃體未見腫大。
頸靜脈無怒張，頸軟，無抵抗，氣管居中，甲狀腺無腫大。
胸廓無畸形，胸骨無壓痛，雙肺呼吸音清，雙肺無乾、溼性囉音。
', N'
藥名: Naproxen 500mg/tab
用法: 每次1顆，一日2-3次，需在餐後服用。
藥名: Levonorgestrel/Ethinyl Estradiol 0.15/0.03mg/tab
用法: 每日1顆，連續', CAST(N'2023-03-24T15:26:00' AS SmallDateTime), CAST(N'2023-03-26T22:31:00' AS SmallDateTime), N'71d8f274-c482-4270-8441-64383dc0d44b.jpg')
INSERT [dbo].[tPatientInfo] ([pId], [p編號], [eId], [p姓名], [p性別], [p身分證字號], [p出生日期], [p地址], [p聯絡電話], [p聯絡人], [p電話2], [p餐點], [p醫師診斷], [p主訴], [現在病史], [過去病史], [家族病史], [檢查], [指示與用藥], [p建立], [p更新], [p照片]) VALUES (18, N'P230324152791', 1, N'簡穎菡', N'女', N'R208580020', N'2023-03-14', N'臺中市大安區北汕路29號之12', N'0912195260', N'劉善平', N'0912895264', N'普通餐', N'頸椎病', N'我感到頸部僵硬和疼痛，同時頭痛和發燒。', N'無呼吸道症狀，亦無腹瀉、
腹痛、嘔吐等症狀，大小便亦無異常。食慾、睡眠尚正常。擬住院給予靜脈
注射抗生素治療。
', N'生接受靜脈注射 Augmentin 治療，第二天之後退燒，白血球計數
有由急診時的白血球 18.6K/uL，分葉形白血球（segment）92%，出院前降至
7.3K/uL，分葉形白血球（segment）68%：C 型反應性蛋白（ＣＲＰ）也由
20.45 降至 1.14。右小腿與右足背紅腫熱痛逐漸消退。血液培養至出院時仍未
發現培養出細菌。病人於住院後十日出院。', N'自訴家族中無類似疾病患者，自訴家族中無肝炎、肺結核、高血壓、糖尿病、
血友病及腫瘤等疾病。', N'體溫 38.9∘C、脈搏 100 次/分、呼吸 22 次/分、血壓 100/70mmHg
發育正常，無營養不良，神智清楚，精神稍疲，以臥床入院，可自行翻身。定
向力、計算力正常。
無貧血貌，顏面、口唇無發紺。無黃疸。
頭顱、五官無畸形，雙側瞳孔等圓等大，直徑約 3mm，對光反射靈敏，外耳道、
鼻腔無異常分泌物。伸舌居中，雙側扁桃體未見腫大。
頸靜脈無怒張，頸軟，無抵抗，氣管居中，甲狀腺無腫大。
胸廓無畸形，胸骨無壓痛，雙肺呼吸音清，雙肺無乾、溼性囉音。
', N'
藥名: Naproxen 500mg/tab
用法: 每次1顆，一日2-3次，需在餐後服用。
藥名: Levonorgestrel/Ethinyl Estradiol 0.15/0.03mg/tab
用法: 每日1顆，連續', CAST(N'2023-03-24T15:27:00' AS SmallDateTime), CAST(N'2023-03-26T22:31:00' AS SmallDateTime), N'687d1130-9939-405b-a13d-a8b0fbf0dae0.jpg')
INSERT [dbo].[tPatientInfo] ([pId], [p編號], [eId], [p姓名], [p性別], [p身分證字號], [p出生日期], [p地址], [p聯絡電話], [p聯絡人], [p電話2], [p餐點], [p醫師診斷], [p主訴], [現在病史], [過去病史], [家族病史], [檢查], [指示與用藥], [p建立], [p更新], [p照片]) VALUES (19, N'P230324154852', 2, N'劉仲志', N'男', N'V112498635', N'2023-02-28', N'彰化縣溪州鄉民生路13號', N'0956600982', N'王廷晟', N'0956600654', N'普通餐', N'泌尿系感染、膀胱炎', N'我的胸口疼痛，尤其在呼吸時更加嚴重，同時感到呼吸困難、喉嚨痛和咳嗽。', N'無呼吸道症狀，亦無腹瀉、
腹痛、嘔吐等症狀，大小便亦無異常。食慾、睡眠尚正常。擬住院給予靜脈
注射抗生素治療。
', N'生接受靜脈注射 Augmentin 治療，第二天之後退燒，白血球計數
有由急診時的白血球 18.6K/uL，分葉形白血球（segment）92%，出院前降至
7.3K/uL，分葉形白血球（segment）68%：C 型反應性蛋白（ＣＲＰ）也由
20.45 降至 1.14。右小腿與右足背紅腫熱痛逐漸消退。血液培養至出院時仍未
發現培養出細菌。病人於住院後十日出院。', N'自訴家族中無類似疾病患者，自訴家族中無肝炎、肺結核、高血壓、糖尿病、
血友病及腫瘤等疾病。', N'體溫 38.9∘C、脈搏 100 次/分、呼吸 22 次/分、血壓 100/70mmHg
發育正常，無營養不良，神智清楚，精神稍疲，以臥床入院，可自行翻身。定
向力、計算力正常。
無貧血貌，顏面、口唇無發紺。無黃疸。
頭顱、五官無畸形，雙側瞳孔等圓等大，直徑約 3mm，對光反射靈敏，外耳道、
鼻腔無異常分泌物。伸舌居中，雙側扁桃體未見腫大。
頸靜脈無怒張，頸軟，無抵抗，氣管居中，甲狀腺無腫大。
胸廓無畸形，胸骨無壓痛，雙肺呼吸音清，雙肺無乾、溼性囉音。
', N'
藥名: Naproxen 500mg/tab
用法: 每次1顆，一日2-3次，需在餐後服用。
藥名: Levonorgestrel/Ethinyl Estradiol 0.15/0.03mg/tab
用法: 每日1顆，連續', CAST(N'2023-03-24T15:48:00' AS SmallDateTime), CAST(N'2023-03-26T22:31:00' AS SmallDateTime), N'e1fe8a96-5001-404b-95fa-4e74a22b5c5a.jpg')
INSERT [dbo].[tPatientInfo] ([pId], [p編號], [eId], [p姓名], [p性別], [p身分證字號], [p出生日期], [p地址], [p聯絡電話], [p聯絡人], [p電話2], [p餐點], [p醫師診斷], [p主訴], [現在病史], [過去病史], [家族病史], [檢查], [指示與用藥], [p建立], [p更新], [p照片]) VALUES (20, N'P230324154947', 6, N'簡筑語', N'女', N'K255300931', N'1977-03-04', N'高雄市楠梓區後昌路13號', N'0953473009', N'柯勵晉', N'0953473998', N'普通餐', N'泌尿系感染、膀胱炎', N'我的胸口疼痛，尤其在呼吸時更加嚴重，同時感到呼吸困難、喉嚨痛和咳嗽。', N'無呼吸道症狀，亦無腹瀉、
腹痛、嘔吐等症狀，大小便亦無異常。食慾、睡眠尚正常。擬住院給予靜脈
注射抗生素治療。
', N'生接受靜脈注射 Augmentin 治療，第二天之後退燒，白血球計數
有由急診時的白血球 18.6K/uL，分葉形白血球（segment）92%，出院前降至
7.3K/uL，分葉形白血球（segment）68%：C 型反應性蛋白（ＣＲＰ）也由
20.45 降至 1.14。右小腿與右足背紅腫熱痛逐漸消退。血液培養至出院時仍未
發現培養出細菌。病人於住院後十日出院。', N'自訴家族中無類似疾病患者，自訴家族中無肝炎、肺結核、高血壓、糖尿病、
血友病及腫瘤等疾病。', N'體溫 38.9∘C、脈搏 100 次/分、呼吸 22 次/分、血壓 100/70mmHg
發育正常，無營養不良，神智清楚，精神稍疲，以臥床入院，可自行翻身。定
向力、計算力正常。
無貧血貌，顏面、口唇無發紺。無黃疸。
頭顱、五官無畸形，雙側瞳孔等圓等大，直徑約 3mm，對光反射靈敏，外耳道、
鼻腔無異常分泌物。伸舌居中，雙側扁桃體未見腫大。
頸靜脈無怒張，頸軟，無抵抗，氣管居中，甲狀腺無腫大。
胸廓無畸形，胸骨無壓痛，雙肺呼吸音清，雙肺無乾、溼性囉音。
', N'
藥名: Naproxen 500mg/tab
用法: 每次1顆，一日2-3次，需在餐後服用。
藥名: Levonorgestrel/Ethinyl Estradiol 0.15/0.03mg/tab
用法: 每日1顆，連續', CAST(N'2023-03-24T15:50:00' AS SmallDateTime), CAST(N'2023-03-26T22:32:00' AS SmallDateTime), N'943035a9-ba60-4613-a216-69ac2da78c8c.jpg')
INSERT [dbo].[tPatientInfo] ([pId], [p編號], [eId], [p姓名], [p性別], [p身分證字號], [p出生日期], [p地址], [p聯絡電話], [p聯絡人], [p電話2], [p餐點], [p醫師診斷], [p主訴], [現在病史], [過去病史], [家族病史], [檢查], [指示與用藥], [p建立], [p更新], [p照片]) VALUES (21, N'P230324155151', 4, N'楊泉雨', N'男', N'U163079558', N'1654-03-08', N'花蓮縣壽豐鄉大坑6號', N'0922830169', N'巫正賢', N'0922830887', N'癌症餐', N'泌尿系感染、膀胱炎', N'我的胸口疼痛，尤其在呼吸時更加嚴重，同時感到呼吸困難、喉嚨痛和咳嗽。', N'無呼吸道症狀，亦無腹瀉、
腹痛、嘔吐等症狀，大小便亦無異常。食慾、睡眠尚正常。擬住院給予靜脈
注射抗生素治療。
', N'生接受靜脈注射 Augmentin 治療，第二天之後退燒，白血球計數
有由急診時的白血球 18.6K/uL，分葉形白血球（segment）92%，出院前降至
7.3K/uL，分葉形白血球（segment）68%：C 型反應性蛋白（ＣＲＰ）也由
20.45 降至 1.14。右小腿與右足背紅腫熱痛逐漸消退。血液培養至出院時仍未
發現培養出細菌。病人於住院後十日出院。', N'自訴家族中無類似疾病患者，自訴家族中無肝炎、肺結核、高血壓、糖尿病、
血友病及腫瘤等疾病。', N'體溫 38.9∘C、脈搏 100 次/分、呼吸 22 次/分、血壓 100/70mmHg
發育正常，無營養不良，神智清楚，精神稍疲，以臥床入院，可自行翻身。定
向力、計算力正常。
無貧血貌，顏面、口唇無發紺。無黃疸。
頭顱、五官無畸形，雙側瞳孔等圓等大，直徑約 3mm，對光反射靈敏，外耳道、
鼻腔無異常分泌物。伸舌居中，雙側扁桃體未見腫大。
頸靜脈無怒張，頸軟，無抵抗，氣管居中，甲狀腺無腫大。
胸廓無畸形，胸骨無壓痛，雙肺呼吸音清，雙肺無乾、溼性囉音。
', N'
藥名: Naproxen 500mg/tab
用法: 每次1顆，一日2-3次，需在餐後服用。
藥名: Levonorgestrel/Ethinyl Estradiol 0.15/0.03mg/tab
用法: 每日1顆，連續', CAST(N'2023-03-24T15:52:00' AS SmallDateTime), CAST(N'2023-03-26T22:32:00' AS SmallDateTime), N'd74c20f9-3910-4906-8817-1a3602511f33.jpg')
INSERT [dbo].[tPatientInfo] ([pId], [p編號], [eId], [p姓名], [p性別], [p身分證字號], [p出生日期], [p地址], [p聯絡電話], [p聯絡人], [p電話2], [p餐點], [p醫師診斷], [p主訴], [現在病史], [過去病史], [家族病史], [檢查], [指示與用藥], [p建立], [p更新], [p照片]) VALUES (22, N'P230324155799', 2, N'陳恩歆', N'男', N'L122426348', N'1944-03-15', N'臺北市北投區新民路香丘巷68號', N'0939179250', N'盧哲月', N'0939179987', N'普通餐', N'泌尿系感染、膀胱炎', N'我的胸口疼痛，尤其在呼吸時更加嚴重，同時感到呼吸困難、喉嚨痛和咳嗽。', N'無呼吸道症狀，亦無腹瀉、
腹痛、嘔吐等症狀，大小便亦無異常。食慾、睡眠尚正常。擬住院給予靜脈
注射抗生素治療。
', N'生接受靜脈注射 Augmentin 治療，第二天之後退燒，白血球計數
有由急診時的白血球 18.6K/uL，分葉形白血球（segment）92%，出院前降至
7.3K/uL，分葉形白血球（segment）68%：C 型反應性蛋白（ＣＲＰ）也由
20.45 降至 1.14。右小腿與右足背紅腫熱痛逐漸消退。血液培養至出院時仍未
發現培養出細菌。病人於住院後十日出院。', N'自訴家族中無類似疾病患者，自訴家族中無肝炎、肺結核、高血壓、糖尿病、
血友病及腫瘤等疾病。', N'體溫 38.9∘C、脈搏 100 次/分、呼吸 22 次/分、血壓 100/70mmHg
發育正常，無營養不良，神智清楚，精神稍疲，以臥床入院，可自行翻身。定
向力、計算力正常。
無貧血貌，顏面、口唇無發紺。無黃疸。
頭顱、五官無畸形，雙側瞳孔等圓等大，直徑約 3mm，對光反射靈敏，外耳道、
鼻腔無異常分泌物。伸舌居中，雙側扁桃體未見腫大。
頸靜脈無怒張，頸軟，無抵抗，氣管居中，甲狀腺無腫大。
胸廓無畸形，胸骨無壓痛，雙肺呼吸音清，雙肺無乾、溼性囉音。
', N'
藥名: Naproxen 500mg/tab
用法: 每次1顆，一日2-3次，需在餐後服用。
藥名: Levonorgestrel/Ethinyl Estradiol 0.15/0.03mg/tab
用法: 每日1顆，連續', CAST(N'2023-03-24T15:58:00' AS SmallDateTime), CAST(N'2023-03-26T22:32:00' AS SmallDateTime), N'4f3f2a0d-740f-403f-96ec-fc1bdaba66a5.jpg')
INSERT [dbo].[tPatientInfo] ([pId], [p編號], [eId], [p姓名], [p性別], [p身分證字號], [p出生日期], [p地址], [p聯絡電話], [p聯絡人], [p電話2], [p餐點], [p醫師診斷], [p主訴], [現在病史], [過去病史], [家族病史], [檢查], [指示與用藥], [p建立], [p更新], [p照片]) VALUES (23, N'P230324155817', 4, N'劉千洪', N'男', N'F142631092', N'1977-03-16', N'嘉義縣溪口鄉新生街30號', N'0917781987', N'王嬈正', N'0917781987', N'普通餐', N'泌尿系感染、膀胱炎', N'我的胸口疼痛，尤其在呼吸時更加嚴重，同時感到呼吸困難、喉嚨痛和咳嗽。', N'無呼吸道症狀，亦無腹瀉、
腹痛、嘔吐等症狀，大小便亦無異常。食慾、睡眠尚正常。擬住院給予靜脈
注射抗生素治療。
', N'生接受靜脈注射 Augmentin 治療，第二天之後退燒，白血球計數
有由急診時的白血球 18.6K/uL，分葉形白血球（segment）92%，出院前降至
7.3K/uL，分葉形白血球（segment）68%：C 型反應性蛋白（ＣＲＰ）也由
20.45 降至 1.14。右小腿與右足背紅腫熱痛逐漸消退。血液培養至出院時仍未
發現培養出細菌。病人於住院後十日出院。', N'自訴家族中無類似疾病患者，自訴家族中無肝炎、肺結核、高血壓、糖尿病、
血友病及腫瘤等疾病。', N'體溫 38.9∘C、脈搏 100 次/分、呼吸 22 次/分、血壓 100/70mmHg
發育正常，無營養不良，神智清楚，精神稍疲，以臥床入院，可自行翻身。定
向力、計算力正常。
無貧血貌，顏面、口唇無發紺。無黃疸。
頭顱、五官無畸形，雙側瞳孔等圓等大，直徑約 3mm，對光反射靈敏，外耳道、
鼻腔無異常分泌物。伸舌居中，雙側扁桃體未見腫大。
頸靜脈無怒張，頸軟，無抵抗，氣管居中，甲狀腺無腫大。
胸廓無畸形，胸骨無壓痛，雙肺呼吸音清，雙肺無乾、溼性囉音。
', N'
藥名: Naproxen 500mg/tab
用法: 每次1顆，一日2-3次，需在餐後服用。
藥名: Levonorgestrel/Ethinyl Estradiol 0.15/0.03mg/tab
用法: 每日1顆，連續', CAST(N'2023-03-24T15:59:00' AS SmallDateTime), CAST(N'2023-03-26T22:32:00' AS SmallDateTime), N'e45e5ca6-4f3c-4007-857c-6728ed6a2920.jpg')
INSERT [dbo].[tPatientInfo] ([pId], [p編號], [eId], [p姓名], [p性別], [p身分證字號], [p出生日期], [p地址], [p聯絡電話], [p聯絡人], [p電話2], [p餐點], [p醫師診斷], [p主訴], [現在病史], [過去病史], [家族病史], [檢查], [指示與用藥], [p建立], [p更新], [p照片]) VALUES (24, N'P230324160116', 4, N'吳丞夕', N'男', N'G127292492', N'1989-03-20', N'臺中市太平區新坪87號', N'0953726025', N'楊夫瞻', N'0953726789', N'普通餐', N'泌尿系感染、膀胱炎', N'我的胸口疼痛，尤其在呼吸時更加嚴重，同時感到呼吸困難、喉嚨痛和咳嗽。', N'無呼吸道症狀，亦無腹瀉、
腹痛、嘔吐等症狀，大小便亦無異常。食慾、睡眠尚正常。擬住院給予靜脈
注射抗生素治療。
', N'生接受靜脈注射 Augmentin 治療，第二天之後退燒，白血球計數
有由急診時的白血球 18.6K/uL，分葉形白血球（segment）92%，出院前降至
7.3K/uL，分葉形白血球（segment）68%：C 型反應性蛋白（ＣＲＰ）也由
20.45 降至 1.14。右小腿與右足背紅腫熱痛逐漸消退。血液培養至出院時仍未
發現培養出細菌。病人於住院後十日出院。', N'自訴家族中無類似疾病患者，自訴家族中無肝炎、肺結核、高血壓、糖尿病、
血友病及腫瘤等疾病。', N'體溫 38.9∘C、脈搏 100 次/分、呼吸 22 次/分、血壓 100/70mmHg
發育正常，無營養不良，神智清楚，精神稍疲，以臥床入院，可自行翻身。定
向力、計算力正常。
無貧血貌，顏面、口唇無發紺。無黃疸。
頭顱、五官無畸形，雙側瞳孔等圓等大，直徑約 3mm，對光反射靈敏，外耳道、
鼻腔無異常分泌物。伸舌居中，雙側扁桃體未見腫大。
頸靜脈無怒張，頸軟，無抵抗，氣管居中，甲狀腺無腫大。
胸廓無畸形，胸骨無壓痛，雙肺呼吸音清，雙肺無乾、溼性囉音。
', N'
藥名: Naproxen 500mg/tab
用法: 每次1顆，一日2-3次，需在餐後服用。
藥名: Levonorgestrel/Ethinyl Estradiol 0.15/0.03mg/tab
用法: 每日1顆，連續', CAST(N'2023-03-24T16:01:00' AS SmallDateTime), CAST(N'2023-03-26T22:33:00' AS SmallDateTime), N'44214ff2-ecb7-4857-8c83-0ded937edbe1.jpg')
INSERT [dbo].[tPatientInfo] ([pId], [p編號], [eId], [p姓名], [p性別], [p身分證字號], [p出生日期], [p地址], [p聯絡電話], [p聯絡人], [p電話2], [p餐點], [p醫師診斷], [p主訴], [現在病史], [過去病史], [家族病史], [檢查], [指示與用藥], [p建立], [p更新], [p照片]) VALUES (25, N'P230324160292', 5, N'張德振', N'男', N'R170963302', N'1933-03-03', N'高雄市小港區沿海四路94號', N'0958959646', N'鄒健豐', N'0958959646', N'普通餐', N'泌尿系感染、膀胱炎', N'我的胸口疼痛，尤其在呼吸時更加嚴重，同時感到呼吸困難、喉嚨痛和咳嗽。', N'無呼吸道症狀，亦無腹瀉、
腹痛、嘔吐等症狀，大小便亦無異常。食慾、睡眠尚正常。擬住院給予靜脈
注射抗生素治療。
', N'生接受靜脈注射 Augmentin 治療，第二天之後退燒，白血球計數
有由急診時的白血球 18.6K/uL，分葉形白血球（segment）92%，出院前降至
7.3K/uL，分葉形白血球（segment）68%：C 型反應性蛋白（ＣＲＰ）也由
20.45 降至 1.14。右小腿與右足背紅腫熱痛逐漸消退。血液培養至出院時仍未
發現培養出細菌。病人於住院後十日出院。', N'自訴家族中無類似疾病患者，自訴家族中無肝炎、肺結核、高血壓、糖尿病、
血友病及腫瘤等疾病。', N'體溫 38.9∘C、脈搏 100 次/分、呼吸 22 次/分、血壓 100/70mmHg
發育正常，無營養不良，神智清楚，精神稍疲，以臥床入院，可自行翻身。定
向力、計算力正常。
無貧血貌，顏面、口唇無發紺。無黃疸。
頭顱、五官無畸形，雙側瞳孔等圓等大，直徑約 3mm，對光反射靈敏，外耳道、
鼻腔無異常分泌物。伸舌居中，雙側扁桃體未見腫大。
頸靜脈無怒張，頸軟，無抵抗，氣管居中，甲狀腺無腫大。
胸廓無畸形，胸骨無壓痛，雙肺呼吸音清，雙肺無乾、溼性囉音。
', N'
藥名: Naproxen 500mg/tab
用法: 每次1顆，一日2-3次，需在餐後服用。
藥名: Levonorgestrel/Ethinyl Estradiol 0.15/0.03mg/tab
用法: 每日1顆，連續', CAST(N'2023-03-24T16:03:00' AS SmallDateTime), CAST(N'2023-03-26T22:33:00' AS SmallDateTime), N'ca828fe1-cc83-418d-b3fb-dc90c271ff0c.jpg')
INSERT [dbo].[tPatientInfo] ([pId], [p編號], [eId], [p姓名], [p性別], [p身分證字號], [p出生日期], [p地址], [p聯絡電話], [p聯絡人], [p電話2], [p餐點], [p醫師診斷], [p主訴], [現在病史], [過去病史], [家族病史], [檢查], [指示與用藥], [p建立], [p更新], [p照片]) VALUES (26, N'P230327161461', 1, N'林憂樹', N'女', N'A122345678', N'2023-03-10', N'A', N'A', N'A', N'A', N'普通餐', N'A', N'A', N'A', N'A', N'A', N'A', N'A', CAST(N'2023-03-27T16:14:00' AS SmallDateTime), CAST(N'2023-03-27T16:14:00' AS SmallDateTime), N'b30236f4-40a5-4a17-83ae-74445d215309.jpg')
SET IDENTITY_INSERT [dbo].[tPatientInfo] OFF
GO
SET IDENTITY_INSERT [dbo].[tProduct] ON 

INSERT [dbo].[tProduct] ([m衛材編號], [m衛材名稱], [m單位], [m單價], [m庫存數量], [m安全庫存數], [m訂購狀態]) VALUES (1, N'酒精', N'瓶', 50.0000, 23, 30, 1)
INSERT [dbo].[tProduct] ([m衛材編號], [m衛材名稱], [m單位], [m單價], [m庫存數量], [m安全庫存數], [m訂購狀態]) VALUES (2, N'繃帶', N'綑', 10.0000, 41, 40, 1)
INSERT [dbo].[tProduct] ([m衛材編號], [m衛材名稱], [m單位], [m單價], [m庫存數量], [m安全庫存數], [m訂購狀態]) VALUES (3, N'碘酒', N'罐', 50.0000, 23, 20, 0)
INSERT [dbo].[tProduct] ([m衛材編號], [m衛材名稱], [m單位], [m單價], [m庫存數量], [m安全庫存數], [m訂購狀態]) VALUES (4, N'注射管', N'管', 200.0000, 15, 5, 0)
INSERT [dbo].[tProduct] ([m衛材編號], [m衛材名稱], [m單位], [m單價], [m庫存數量], [m安全庫存數], [m訂購狀態]) VALUES (5, N'抗生素', N'盒', 150.0000, 20, 15, 0)
INSERT [dbo].[tProduct] ([m衛材編號], [m衛材名稱], [m單位], [m單價], [m庫存數量], [m安全庫存數], [m訂購狀態]) VALUES (6, N'益生菌', N'盒', 150.0000, 30, 20, 0)
SET IDENTITY_INSERT [dbo].[tProduct] OFF
GO
SET IDENTITY_INSERT [dbo].[tRoombed] ON 

INSERT [dbo].[tRoombed] ([rbId], [rb房型], [rb床號], [rb空床], [rb建立日期], [rb建立者工號], [rb修改日期], [rb修改者工號]) VALUES (1, N'多人房', N'1011', N'空床', CAST(N'2023-03-22T10:36:48.120' AS DateTime), N'E230313162521', NULL, NULL)
INSERT [dbo].[tRoombed] ([rbId], [rb房型], [rb床號], [rb空床], [rb建立日期], [rb建立者工號], [rb修改日期], [rb修改者工號]) VALUES (2, N'多人房', N'1012', N'空床', CAST(N'2023-03-22T10:36:59.237' AS DateTime), N'E230313162521', NULL, NULL)
INSERT [dbo].[tRoombed] ([rbId], [rb房型], [rb床號], [rb空床], [rb建立日期], [rb建立者工號], [rb修改日期], [rb修改者工號]) VALUES (3, N'多人房', N'1013', N'空床', CAST(N'2023-03-22T10:37:10.060' AS DateTime), N'E230313162521', NULL, NULL)
INSERT [dbo].[tRoombed] ([rbId], [rb房型], [rb床號], [rb空床], [rb建立日期], [rb建立者工號], [rb修改日期], [rb修改者工號]) VALUES (4, N'多人房', N'1014', N'空床', CAST(N'2023-03-22T10:37:17.897' AS DateTime), N'E230313162521', NULL, NULL)
INSERT [dbo].[tRoombed] ([rbId], [rb房型], [rb床號], [rb空床], [rb建立日期], [rb建立者工號], [rb修改日期], [rb修改者工號]) VALUES (5, N'多人房', N'1021', N'空床', CAST(N'2023-03-24T14:32:56.253' AS DateTime), N'E230313162521', NULL, NULL)
INSERT [dbo].[tRoombed] ([rbId], [rb房型], [rb床號], [rb空床], [rb建立日期], [rb建立者工號], [rb修改日期], [rb修改者工號]) VALUES (6, N'多人房', N'1022', N'空床', CAST(N'2023-03-24T14:33:11.850' AS DateTime), N'E230313162521', NULL, NULL)
INSERT [dbo].[tRoombed] ([rbId], [rb房型], [rb床號], [rb空床], [rb建立日期], [rb建立者工號], [rb修改日期], [rb修改者工號]) VALUES (7, N'多人房', N'1023', N'空床', CAST(N'2023-03-24T14:33:19.107' AS DateTime), N'E230313162521', NULL, NULL)
INSERT [dbo].[tRoombed] ([rbId], [rb房型], [rb床號], [rb空床], [rb建立日期], [rb建立者工號], [rb修改日期], [rb修改者工號]) VALUES (8, N'多人房', N'1024', N'空床', CAST(N'2023-03-24T14:33:30.513' AS DateTime), N'E230313162521', NULL, NULL)
INSERT [dbo].[tRoombed] ([rbId], [rb房型], [rb床號], [rb空床], [rb建立日期], [rb建立者工號], [rb修改日期], [rb修改者工號]) VALUES (9, N'多人房', N'1031', N'空床', CAST(N'2023-03-24T14:34:19.357' AS DateTime), N'E230313162521', NULL, NULL)
INSERT [dbo].[tRoombed] ([rbId], [rb房型], [rb床號], [rb空床], [rb建立日期], [rb建立者工號], [rb修改日期], [rb修改者工號]) VALUES (10, N'多人房', N'1032', N'空床', CAST(N'2023-03-24T14:34:28.570' AS DateTime), N'E230313162521', NULL, NULL)
INSERT [dbo].[tRoombed] ([rbId], [rb房型], [rb床號], [rb空床], [rb建立日期], [rb建立者工號], [rb修改日期], [rb修改者工號]) VALUES (11, N'多人房', N'1033', N'空床', CAST(N'2023-03-24T14:34:39.000' AS DateTime), N'E230313162521', NULL, NULL)
INSERT [dbo].[tRoombed] ([rbId], [rb房型], [rb床號], [rb空床], [rb建立日期], [rb建立者工號], [rb修改日期], [rb修改者工號]) VALUES (12, N'多人房', N'1034', N'空床', CAST(N'2023-03-24T14:34:49.707' AS DateTime), N'E230313162521', NULL, NULL)
INSERT [dbo].[tRoombed] ([rbId], [rb房型], [rb床號], [rb空床], [rb建立日期], [rb建立者工號], [rb修改日期], [rb修改者工號]) VALUES (13, N'雙人房', N'1041', N'空床', CAST(N'2023-03-24T14:35:32.320' AS DateTime), N'E230313162521', NULL, NULL)
INSERT [dbo].[tRoombed] ([rbId], [rb房型], [rb床號], [rb空床], [rb建立日期], [rb建立者工號], [rb修改日期], [rb修改者工號]) VALUES (14, N'雙人房', N'1042', N'空床', CAST(N'2023-03-24T14:35:46.193' AS DateTime), N'E230313162521', NULL, NULL)
INSERT [dbo].[tRoombed] ([rbId], [rb房型], [rb床號], [rb空床], [rb建立日期], [rb建立者工號], [rb修改日期], [rb修改者工號]) VALUES (15, N'雙人房', N'1051', N'空床', CAST(N'2023-03-24T14:36:00.547' AS DateTime), N'E230313162521', NULL, NULL)
INSERT [dbo].[tRoombed] ([rbId], [rb房型], [rb床號], [rb空床], [rb建立日期], [rb建立者工號], [rb修改日期], [rb修改者工號]) VALUES (16, N'雙人房', N'1052', N'空床', CAST(N'2023-03-24T14:36:06.727' AS DateTime), N'E230313162521', NULL, NULL)
INSERT [dbo].[tRoombed] ([rbId], [rb房型], [rb床號], [rb空床], [rb建立日期], [rb建立者工號], [rb修改日期], [rb修改者工號]) VALUES (17, N'雙人房', N'1061', N'空床', CAST(N'2023-03-24T14:36:39.887' AS DateTime), N'E230313162521', NULL, NULL)
INSERT [dbo].[tRoombed] ([rbId], [rb房型], [rb床號], [rb空床], [rb建立日期], [rb建立者工號], [rb修改日期], [rb修改者工號]) VALUES (18, N'雙人房', N'1062', N'空床', CAST(N'2023-03-24T14:36:47.263' AS DateTime), N'E230313162521', NULL, NULL)
INSERT [dbo].[tRoombed] ([rbId], [rb房型], [rb床號], [rb空床], [rb建立日期], [rb建立者工號], [rb修改日期], [rb修改者工號]) VALUES (19, N'雙人房', N'1071', N'空床', CAST(N'2023-03-24T14:37:09.120' AS DateTime), N'E230313162521', NULL, NULL)
INSERT [dbo].[tRoombed] ([rbId], [rb房型], [rb床號], [rb空床], [rb建立日期], [rb建立者工號], [rb修改日期], [rb修改者工號]) VALUES (20, N'雙人房', N'1072', N'空床', CAST(N'2023-03-24T14:37:15.680' AS DateTime), N'E230313162521', NULL, NULL)
INSERT [dbo].[tRoombed] ([rbId], [rb房型], [rb床號], [rb空床], [rb建立日期], [rb建立者工號], [rb修改日期], [rb修改者工號]) VALUES (21, N'雙人房', N'1081', N'空床', CAST(N'2023-03-24T14:37:36.640' AS DateTime), N'E230313162521', NULL, NULL)
INSERT [dbo].[tRoombed] ([rbId], [rb房型], [rb床號], [rb空床], [rb建立日期], [rb建立者工號], [rb修改日期], [rb修改者工號]) VALUES (22, N'雙人房', N'1082', N'空床', CAST(N'2023-03-24T14:37:43.880' AS DateTime), N'E230313162521', NULL, NULL)
INSERT [dbo].[tRoombed] ([rbId], [rb房型], [rb床號], [rb空床], [rb建立日期], [rb建立者工號], [rb修改日期], [rb修改者工號]) VALUES (23, N'單人房', N'109', N'空床', CAST(N'2023-03-24T14:38:06.953' AS DateTime), N'E230313162521', NULL, NULL)
INSERT [dbo].[tRoombed] ([rbId], [rb房型], [rb床號], [rb空床], [rb建立日期], [rb建立者工號], [rb修改日期], [rb修改者工號]) VALUES (24, N'單人房', N'110', N'空床', CAST(N'2023-03-24T14:38:26.880' AS DateTime), N'E230313162521', NULL, NULL)
INSERT [dbo].[tRoombed] ([rbId], [rb房型], [rb床號], [rb空床], [rb建立日期], [rb建立者工號], [rb修改日期], [rb修改者工號]) VALUES (25, N'單人房', N'111', N'空床', CAST(N'2023-03-24T14:38:33.983' AS DateTime), N'E230313162521', NULL, NULL)
INSERT [dbo].[tRoombed] ([rbId], [rb房型], [rb床號], [rb空床], [rb建立日期], [rb建立者工號], [rb修改日期], [rb修改者工號]) VALUES (26, N'單人房', N'112', N'空床', CAST(N'2023-03-24T14:38:41.040' AS DateTime), N'E230313162521', NULL, NULL)
INSERT [dbo].[tRoombed] ([rbId], [rb房型], [rb床號], [rb空床], [rb建立日期], [rb建立者工號], [rb修改日期], [rb修改者工號]) VALUES (27, N'單人房', N'113', N'空床', CAST(N'2023-03-24T14:38:50.143' AS DateTime), N'E230313162521', NULL, NULL)
INSERT [dbo].[tRoombed] ([rbId], [rb房型], [rb床號], [rb空床], [rb建立日期], [rb建立者工號], [rb修改日期], [rb修改者工號]) VALUES (28, N'單人房', N'114', N'空床', CAST(N'2023-03-24T14:38:57.087' AS DateTime), N'E230313162521', NULL, NULL)
INSERT [dbo].[tRoombed] ([rbId], [rb房型], [rb床號], [rb空床], [rb建立日期], [rb建立者工號], [rb修改日期], [rb修改者工號]) VALUES (29, N'單人房', N'115', N'空床', CAST(N'2023-03-24T14:39:08.297' AS DateTime), N'E230313162521', NULL, NULL)
INSERT [dbo].[tRoombed] ([rbId], [rb房型], [rb床號], [rb空床], [rb建立日期], [rb建立者工號], [rb修改日期], [rb修改者工號]) VALUES (31, N'單人房', N'116', N'空床', CAST(N'2023-03-26T19:54:47.390' AS DateTime), N'E230313162521', NULL, NULL)
SET IDENTITY_INSERT [dbo].[tRoombed] OFF
GO
SET IDENTITY_INSERT [dbo].[tSupplier] ON 

INSERT [dbo].[tSupplier] ([suId], [廠商名稱], [廠商地址], [廠商email], [廠商電話], [廠商聯絡人], [聯絡人email], [建立時間], [修改時間], [建立人], [備註]) VALUES (2, N'家馨團膳', N'台南市', N'113@gmail.com', N'0958517246', N'王凌昭', N'cockburn7521@yahoo.com', CAST(N'2023-03-26T22:01:17.850' AS DateTime), CAST(N'2023-03-26T22:01:17.850' AS DateTime), N'李筱聖', NULL)
INSERT [dbo].[tSupplier] ([suId], [廠商名稱], [廠商地址], [廠商email], [廠商電話], [廠商聯絡人], [聯絡人email], [建立時間], [修改時間], [建立人], [備註]) VALUES (3, N'圓圓膳食', N'臺中市清水區中社路24號', N'ton9596@gmail.com', N'0958517246', N'洪沐璇', N'carlisle5372@gmail.com', CAST(N'2023-03-26T22:03:00.753' AS DateTime), CAST(N'2023-03-26T22:03:00.753' AS DateTime), N'吳于倩', NULL)
SET IDENTITY_INSERT [dbo].[tSupplier] OFF
GO
SET IDENTITY_INSERT [dbo].[tTake] ON 

INSERT [dbo].[tTake] ([m領取編號], [eId], [m衛材編號], [m領取數量], [m領取時間], [m用途], [m庫存數量]) VALUES (1, 2, 2, 2, CAST(N'2023-03-26T00:46:36.570' AS DateTime), N'E2021', 41)
INSERT [dbo].[tTake] ([m領取編號], [eId], [m衛材編號], [m領取數量], [m領取時間], [m用途], [m庫存數量]) VALUES (2, 4, 1, 2, CAST(N'2023-03-26T00:46:48.390' AS DateTime), N'E3212', 23)
INSERT [dbo].[tTake] ([m領取編號], [eId], [m衛材編號], [m領取數量], [m領取時間], [m用途], [m庫存數量]) VALUES (3, 1, 3, 2, CAST(N'2023-03-26T00:47:15.480' AS DateTime), N'E1111', 23)
INSERT [dbo].[tTake] ([m領取編號], [eId], [m衛材編號], [m領取數量], [m領取時間], [m用途], [m庫存數量]) VALUES (4, 4, 5, 10, CAST(N'2023-03-27T16:43:28.463' AS DateTime), N'E1233', 20)
SET IDENTITY_INSERT [dbo].[tTake] OFF
GO
ALTER TABLE [dbo].[tActivity]  WITH CHECK ADD  CONSTRAINT [FK_tActivityNumber_tEmployee] FOREIGN KEY([eId])
REFERENCES [dbo].[tEmployee] ([eId])
GO
ALTER TABLE [dbo].[tActivity] CHECK CONSTRAINT [FK_tActivityNumber_tEmployee]
GO
ALTER TABLE [dbo].[tActivityCollect]  WITH CHECK ADD  CONSTRAINT [FK_tActivityCollect_tActivityNumber] FOREIGN KEY([aco活動Id])
REFERENCES [dbo].[tActivity] ([actId])
GO
ALTER TABLE [dbo].[tActivityCollect] CHECK CONSTRAINT [FK_tActivityCollect_tActivityNumber]
GO
ALTER TABLE [dbo].[tActivityCollect]  WITH CHECK ADD  CONSTRAINT [FK_tActivityCollect_tMember] FOREIGN KEY([aco會員Id])
REFERENCES [dbo].[tMember] ([mId])
GO
ALTER TABLE [dbo].[tActivityCollect] CHECK CONSTRAINT [FK_tActivityCollect_tMember]
GO
ALTER TABLE [dbo].[tActivityComment]  WITH CHECK ADD  CONSTRAINT [FK_tActivityComment_tActivityNumber] FOREIGN KEY([ac活動編號])
REFERENCES [dbo].[tActivity] ([actId])
GO
ALTER TABLE [dbo].[tActivityComment] CHECK CONSTRAINT [FK_tActivityComment_tActivityNumber]
GO
ALTER TABLE [dbo].[tActivityComment]  WITH CHECK ADD  CONSTRAINT [FK_tActivityComment_tMember] FOREIGN KEY([ac會員Id])
REFERENCES [dbo].[tMember] ([mId])
GO
ALTER TABLE [dbo].[tActivityComment] CHECK CONSTRAINT [FK_tActivityComment_tMember]
GO
ALTER TABLE [dbo].[tActivityMessage]  WITH CHECK ADD  CONSTRAINT [FK_tActivityMessage_tMember] FOREIGN KEY([am會員Id])
REFERENCES [dbo].[tMember] ([mId])
GO
ALTER TABLE [dbo].[tActivityMessage] CHECK CONSTRAINT [FK_tActivityMessage_tMember]
GO
ALTER TABLE [dbo].[tActivityOrder]  WITH CHECK ADD  CONSTRAINT [FK_tActivityOrder_tActivityNumber] FOREIGN KEY([ao活動編號])
REFERENCES [dbo].[tActivity] ([actId])
GO
ALTER TABLE [dbo].[tActivityOrder] CHECK CONSTRAINT [FK_tActivityOrder_tActivityNumber]
GO
ALTER TABLE [dbo].[tActivityOrder]  WITH CHECK ADD  CONSTRAINT [FK_tActivityOrder_tMember] FOREIGN KEY([ao會員Id])
REFERENCES [dbo].[tMember] ([mId])
GO
ALTER TABLE [dbo].[tActivityOrder] CHECK CONSTRAINT [FK_tActivityOrder_tMember]
GO
ALTER TABLE [dbo].[tApplicationForm]  WITH CHECK ADD  CONSTRAINT [FK_tApplicationForm_tEmployee] FOREIGN KEY([eId])
REFERENCES [dbo].[tEmployee] ([eId])
GO
ALTER TABLE [dbo].[tApplicationForm] CHECK CONSTRAINT [FK_tApplicationForm_tEmployee]
GO
ALTER TABLE [dbo].[tApplicationForm]  WITH CHECK ADD  CONSTRAINT [FK_tApplicationForm_tFamilyMembers] FOREIGN KEY([famId])
REFERENCES [dbo].[tFamilyMembers] ([famId])
GO
ALTER TABLE [dbo].[tApplicationForm] CHECK CONSTRAINT [FK_tApplicationForm_tFamilyMembers]
GO
ALTER TABLE [dbo].[tApplicationForm]  WITH CHECK ADD  CONSTRAINT [FK_tApplicationForm_tPatientInfo] FOREIGN KEY([pId])
REFERENCES [dbo].[tPatientInfo] ([pId])
GO
ALTER TABLE [dbo].[tApplicationForm] CHECK CONSTRAINT [FK_tApplicationForm_tPatientInfo]
GO
ALTER TABLE [dbo].[tBed]  WITH CHECK ADD  CONSTRAINT [FK_tBed_tPatientInfo] FOREIGN KEY([pId])
REFERENCES [dbo].[tPatientInfo] ([pId])
GO
ALTER TABLE [dbo].[tBed] CHECK CONSTRAINT [FK_tBed_tPatientInfo]
GO
ALTER TABLE [dbo].[tBed]  WITH CHECK ADD  CONSTRAINT [FK_tBed_tRoombed] FOREIGN KEY([rbId])
REFERENCES [dbo].[tRoombed] ([rbId])
GO
ALTER TABLE [dbo].[tBed] CHECK CONSTRAINT [FK_tBed_tRoombed]
GO
ALTER TABLE [dbo].[tFamilyMembers]  WITH CHECK ADD  CONSTRAINT [FK_tFamilyMembers_tPatientInfo] FOREIGN KEY([pId])
REFERENCES [dbo].[tPatientInfo] ([pId])
GO
ALTER TABLE [dbo].[tFamilyMembers] CHECK CONSTRAINT [FK_tFamilyMembers_tPatientInfo]
GO
ALTER TABLE [dbo].[tImages]  WITH CHECK ADD  CONSTRAINT [FK_tImages_tMeal] FOREIGN KEY([meId])
REFERENCES [dbo].[tMeal] ([meId])
GO
ALTER TABLE [dbo].[tImages] CHECK CONSTRAINT [FK_tImages_tMeal]
GO
ALTER TABLE [dbo].[tMeal]  WITH CHECK ADD  CONSTRAINT [FK_tMeal_tSupplier] FOREIGN KEY([suId])
REFERENCES [dbo].[tSupplier] ([suId])
GO
ALTER TABLE [dbo].[tMeal] CHECK CONSTRAINT [FK_tMeal_tSupplier]
GO
ALTER TABLE [dbo].[tNursingRecord]  WITH CHECK ADD  CONSTRAINT [FK_tNursingRecord_tEmployee] FOREIGN KEY([eId])
REFERENCES [dbo].[tEmployee] ([eId])
GO
ALTER TABLE [dbo].[tNursingRecord] CHECK CONSTRAINT [FK_tNursingRecord_tEmployee]
GO
ALTER TABLE [dbo].[tNursingRecord]  WITH CHECK ADD  CONSTRAINT [FK_tNursingRecord_tOffService] FOREIGN KEY([oId])
REFERENCES [dbo].[tOffService] ([oId])
GO
ALTER TABLE [dbo].[tNursingRecord] CHECK CONSTRAINT [FK_tNursingRecord_tOffService]
GO
ALTER TABLE [dbo].[tNursingRecord]  WITH CHECK ADD  CONSTRAINT [FK_tNursingRecord_tPatientInfo] FOREIGN KEY([pId])
REFERENCES [dbo].[tPatientInfo] ([pId])
GO
ALTER TABLE [dbo].[tNursingRecord] CHECK CONSTRAINT [FK_tNursingRecord_tPatientInfo]
GO
ALTER TABLE [dbo].[tOffService]  WITH CHECK ADD  CONSTRAINT [FK_tOffService_tEmployee] FOREIGN KEY([eId])
REFERENCES [dbo].[tEmployee] ([eId])
GO
ALTER TABLE [dbo].[tOffService] CHECK CONSTRAINT [FK_tOffService_tEmployee]
GO
ALTER TABLE [dbo].[tOffService]  WITH CHECK ADD  CONSTRAINT [FK_tOffService_tPatientInfo] FOREIGN KEY([pId])
REFERENCES [dbo].[tPatientInfo] ([pId])
GO
ALTER TABLE [dbo].[tOffService] CHECK CONSTRAINT [FK_tOffService_tPatientInfo]
GO
ALTER TABLE [dbo].[tOrder]  WITH CHECK ADD  CONSTRAINT [FK_tOrder_tEmployee] FOREIGN KEY([eId])
REFERENCES [dbo].[tEmployee] ([eId])
GO
ALTER TABLE [dbo].[tOrder] CHECK CONSTRAINT [FK_tOrder_tEmployee]
GO
ALTER TABLE [dbo].[tOrder]  WITH CHECK ADD  CONSTRAINT [FK_tOrder_tProduct] FOREIGN KEY([m衛材編號])
REFERENCES [dbo].[tProduct] ([m衛材編號])
GO
ALTER TABLE [dbo].[tOrder] CHECK CONSTRAINT [FK_tOrder_tProduct]
GO
ALTER TABLE [dbo].[tOrderMeal]  WITH CHECK ADD  CONSTRAINT [FK_tOrderMeal_tMeal] FOREIGN KEY([meId])
REFERENCES [dbo].[tMeal] ([meId])
GO
ALTER TABLE [dbo].[tOrderMeal] CHECK CONSTRAINT [FK_tOrderMeal_tMeal]
GO
ALTER TABLE [dbo].[tPatientInfo]  WITH CHECK ADD  CONSTRAINT [FK_tPatientInfo_tEmployee] FOREIGN KEY([eId])
REFERENCES [dbo].[tEmployee] ([eId])
GO
ALTER TABLE [dbo].[tPatientInfo] CHECK CONSTRAINT [FK_tPatientInfo_tEmployee]
GO
ALTER TABLE [dbo].[tShift]  WITH CHECK ADD  CONSTRAINT [FK_tShift_tEmployee] FOREIGN KEY([eId])
REFERENCES [dbo].[tEmployee] ([eId])
GO
ALTER TABLE [dbo].[tShift] CHECK CONSTRAINT [FK_tShift_tEmployee]
GO
ALTER TABLE [dbo].[tTake]  WITH CHECK ADD  CONSTRAINT [FK_tTake_tEmployee] FOREIGN KEY([eId])
REFERENCES [dbo].[tEmployee] ([eId])
GO
ALTER TABLE [dbo].[tTake] CHECK CONSTRAINT [FK_tTake_tEmployee]
GO
ALTER TABLE [dbo].[tTake]  WITH CHECK ADD  CONSTRAINT [FK_tTake_tProduct] FOREIGN KEY([m衛材編號])
REFERENCES [dbo].[tProduct] ([m衛材編號])
GO
ALTER TABLE [dbo].[tTake] CHECK CONSTRAINT [FK_tTake_tProduct]
GO
/****** Object:  StoredProcedure [dbo].[checkPatient]    Script Date: 2023/4/3 下午 04:30:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[checkPatient]
	@out_date DATE
	
	AS
BEGIN
    SELECT tP.pId, p姓名, e員工姓名, tr.rb床號 
    FROM tPatientInfo tP
    LEFT JOIN tApplicationForm ta ON ta.pId = tP.pId AND ta.app出發時間 >=  @out_date  AND  ta.app現況 = '1'
    LEFT JOIN tEmployee te ON te.eId = tP.eId
    LEFT JOIN tBed tb ON tb.pId = tP.pId
    LEFT JOIN tRoombed tr ON tr.rbId = tb.rbId
    WHERE ta.pId IS NULL
END



GO
