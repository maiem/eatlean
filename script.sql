USE [CSDL_EATCLEAN]
GO
/****** Object:  Table [dbo].[ACCOUNT]    Script Date: 4/8/2021 12:04:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ACCOUNT](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[account_name] [varchar](50) NOT NULL,
	[account_password] [varchar](50) NOT NULL,
	[account_type_id] [int] NULL,
	[account_state_id] [int] NULL,
	[email] [varchar](50) NULL,
	[phone] [varchar](50) NULL,
	[address] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CART]    Script Date: 4/8/2021 12:04:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CART](
	[account_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[amount_of] [int] NULL,
	[total_price] [real] NULL,
 CONSTRAINT [PK_CART] PRIMARY KEY CLUSTERED 
(
	[account_id] ASC,
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ORDER_DETAILS]    Script Date: 4/8/2021 12:04:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ORDER_DETAILS](
	[order_product_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[amount_of] [int] NULL,
	[unit_price] [real] NULL,
 CONSTRAINT [PK_ORDER_DETAILS] PRIMARY KEY CLUSTERED 
(
	[order_product_id] ASC,
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ORDER_PRODUCT]    Script Date: 4/8/2021 12:04:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ORDER_PRODUCT](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[account_id] [int] NULL,
	[ordered_date] [date] NULL,
	[total_price] [real] NULL,
	[order_state_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ORDER_STATE]    Script Date: 4/8/2021 12:04:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ORDER_STATE](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name_order_state] [nvarchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PRODUCT]    Script Date: 4/8/2021 12:04:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PRODUCT](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name_product] [nvarchar](50) NOT NULL,
	[img_url] [varchar](100) NULL,
	[descreption] [nvarchar](1000) NULL,
	[price] [int] NULL,
	[total] [int] NULL,
	[product_state_id] [int] NULL,
 CONSTRAINT [PK__PRODUCT__3213E83F3B92AC82] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[ACCOUNT] ON 

INSERT [dbo].[ACCOUNT] ([id], [account_name], [account_password], [account_type_id], [account_state_id], [email], [phone], [address]) VALUES (1, N'admin', N'admin', 1, 1, NULL, NULL, NULL)
INSERT [dbo].[ACCOUNT] ([id], [account_name], [account_password], [account_type_id], [account_state_id], [email], [phone], [address]) VALUES (2, N'maiem', N'maiem', 0, 1, N'anhhtm99@gmail.com', N'0354662889', N'Thiệu Tân,  Thiệu Hóa, Thanh Hóa')
INSERT [dbo].[ACCOUNT] ([id], [account_name], [account_password], [account_type_id], [account_state_id], [email], [phone], [address]) VALUES (3, N'mynhu', N'mynhu', 0, 1, N'huonghae@gmail.com', N'0123456678', N'97 Man Thiện, Hiệp Phú, quận 9, TP Hồ Chí Minh')
INSERT [dbo].[ACCOUNT] ([id], [account_name], [account_password], [account_type_id], [account_state_id], [email], [phone], [address]) VALUES (4, N'maianh', N'5619734', 0, 0, N'anhhtm03@gmail.com', N'0359843255', N'87/8 đhường 379,  Tăng Nhơn Phú A, quận 9, TP Hồ Chí Minh')
INSERT [dbo].[ACCOUNT] ([id], [account_name], [account_password], [account_type_id], [account_state_id], [email], [phone], [address]) VALUES (5, N'hieu', N'8139013', 0, 0, N'n17dccn048@student.ptithcm.edu.vn', N'0398264123', N'84 Nguyễn Xuân Hợp, Tăng Nhơn Phú B, quận 9, TP Hồ Chí Minh')
INSERT [dbo].[ACCOUNT] ([id], [account_name], [account_password], [account_type_id], [account_state_id], [email], [phone], [address]) VALUES (6, N'huuan', N'anha123', 0, 1, N'huuan@gmail.com', N'0989098882', N'chung cư Thạnh Lộc, Thạnh Lộc, quận 12, TP Hồ Chí Minh')
INSERT [dbo].[ACCOUNT] ([id], [account_name], [account_password], [account_type_id], [account_state_id], [email], [phone], [address]) VALUES (8, N'huonghae', N'9766644', 0, 0, N'huonghae@gmail.com', N'', N'97 Man Thiện, Quận 9, TP HCM')
INSERT [dbo].[ACCOUNT] ([id], [account_name], [account_password], [account_type_id], [account_state_id], [email], [phone], [address]) VALUES (10, N'''or 1 =1 ', N'1', 0, 1, N'gggggggggg@gmail.com', N'1', N'234')
SET IDENTITY_INSERT [dbo].[ACCOUNT] OFF
INSERT [dbo].[ORDER_DETAILS] ([order_product_id], [product_id], [amount_of], [unit_price]) VALUES (58, 44, 1, 130000)
INSERT [dbo].[ORDER_DETAILS] ([order_product_id], [product_id], [amount_of], [unit_price]) VALUES (59, 47, 1, 60000)
INSERT [dbo].[ORDER_DETAILS] ([order_product_id], [product_id], [amount_of], [unit_price]) VALUES (62, 45, 1, 150000)
INSERT [dbo].[ORDER_DETAILS] ([order_product_id], [product_id], [amount_of], [unit_price]) VALUES (71, 61, 2, 2400000)
INSERT [dbo].[ORDER_DETAILS] ([order_product_id], [product_id], [amount_of], [unit_price]) VALUES (72, 44, 1, 130000)
INSERT [dbo].[ORDER_DETAILS] ([order_product_id], [product_id], [amount_of], [unit_price]) VALUES (77, 43, 1, 120000)
INSERT [dbo].[ORDER_DETAILS] ([order_product_id], [product_id], [amount_of], [unit_price]) VALUES (78, 44, 1, 130000)
INSERT [dbo].[ORDER_DETAILS] ([order_product_id], [product_id], [amount_of], [unit_price]) VALUES (79, 43, -2, -240000)
INSERT [dbo].[ORDER_DETAILS] ([order_product_id], [product_id], [amount_of], [unit_price]) VALUES (80, 45, -99999999, -1.97405235E+09)
SET IDENTITY_INSERT [dbo].[ORDER_PRODUCT] ON 

INSERT [dbo].[ORDER_PRODUCT] ([id], [account_id], [ordered_date], [total_price], [order_state_id]) VALUES (58, 1, CAST(N'2021-01-08' AS Date), 130000, 3)
INSERT [dbo].[ORDER_PRODUCT] ([id], [account_id], [ordered_date], [total_price], [order_state_id]) VALUES (59, 1, CAST(N'2021-01-08' AS Date), 60000, 3)
INSERT [dbo].[ORDER_PRODUCT] ([id], [account_id], [ordered_date], [total_price], [order_state_id]) VALUES (62, 1, CAST(N'2021-01-08' AS Date), 150000, 3)
INSERT [dbo].[ORDER_PRODUCT] ([id], [account_id], [ordered_date], [total_price], [order_state_id]) VALUES (71, 3, CAST(N'2021-01-09' AS Date), 2400000, 3)
INSERT [dbo].[ORDER_PRODUCT] ([id], [account_id], [ordered_date], [total_price], [order_state_id]) VALUES (72, 3, CAST(N'2021-01-09' AS Date), 130000, 3)
INSERT [dbo].[ORDER_PRODUCT] ([id], [account_id], [ordered_date], [total_price], [order_state_id]) VALUES (77, 2, CAST(N'2021-01-13' AS Date), 120000, 3)
INSERT [dbo].[ORDER_PRODUCT] ([id], [account_id], [ordered_date], [total_price], [order_state_id]) VALUES (78, 2, CAST(N'2021-01-13' AS Date), 130000, 3)
INSERT [dbo].[ORDER_PRODUCT] ([id], [account_id], [ordered_date], [total_price], [order_state_id]) VALUES (79, 10, CAST(N'2021-01-16' AS Date), -240000, 3)
INSERT [dbo].[ORDER_PRODUCT] ([id], [account_id], [ordered_date], [total_price], [order_state_id]) VALUES (80, 10, CAST(N'2021-01-16' AS Date), -1.97405235E+09, 3)
SET IDENTITY_INSERT [dbo].[ORDER_PRODUCT] OFF
SET IDENTITY_INSERT [dbo].[ORDER_STATE] ON 

INSERT [dbo].[ORDER_STATE] ([id], [name_order_state]) VALUES (1, N'Đã xác nhận')
INSERT [dbo].[ORDER_STATE] ([id], [name_order_state]) VALUES (3, N'Chưa xác nhận')
SET IDENTITY_INSERT [dbo].[ORDER_STATE] OFF
SET IDENTITY_INSERT [dbo].[PRODUCT] ON 

INSERT [dbo].[PRODUCT] ([id], [name_product], [img_url], [descreption], [price], [total], [product_state_id]) VALUES (43, N'Granola chocolate', N'granola_choco.jpg', N'Yến mạch mix vị chocolate, kết hợp cùng các loại hạt: óc chó, hạnh nhân, bí, nho xanh sấy, hạnh nhân, việt quất, macca.  Kết hợp ăn kèm với sữa chua, trái cây tươi làm nên bữa sáng hoặc các bữa ăn phụ đầy đủ chất dinh dưỡng, tạo cảm giác no lâu, giảm thèm ăn. Đây là 1 sản phẩm tuyệt vời trong chế độ ăn diet.  Sản phẩm có khổi lượng 250g. ', 120000, 135, 1)
INSERT [dbo].[PRODUCT] ([id], [name_product], [img_url], [descreption], [price], [total], [product_state_id]) VALUES (44, N'Bánh biscotti truyền thống', N'biscotti_yenmach.jpg', N'Bánh nướng theo công thức chuẩn Ý với nguyên liệu 100% nguyên cám mang lại cảm giác giòn xốp với nguyên tắc 3 không: không đường, không bơ, không sữa. Đây sẽ là món ăn vặt lí tưởng cho những bạn đang theo đuổi chế đọ ăn diet. Sản phẩm có khổi lượng 250g.', 130000, 68, 1)
INSERT [dbo].[PRODUCT] ([id], [name_product], [img_url], [descreption], [price], [total], [product_state_id]) VALUES (45, N'Bánh biscotti matcha', N'biscotti_matcha.jpg', N'Bánh nướng theo công thức chuẩn Ý với nguyên liệu 100% nguyên cám + vị trà xanh + các loại hạt  mang lại cảm giác giòn xốp với nguyên tắc 3 không: không đường, không bơ, không sữa. Đây sẽ là món ăn vặt lí tưởng cho những bạn đang theo đuổi chế đọ ăn diet. Sản phẩm có khổi lượng 250g.', 150000, 150, 1)
INSERT [dbo].[PRODUCT] ([id], [name_product], [img_url], [descreption], [price], [total], [product_state_id]) VALUES (46, N'Bánh biscotti chocolate', N'biscotti_choco.jpg', N'Bánh nướng theo công thức chuẩn Ý với nguyên liệu 100% nguyên cám + vị chocolate + các loại hạt  mang lại cảm giác giòn xốp với nguyên tắc 3 không: không đường, không bơ, không sữa. Đây sẽ là món ăn vặt lí tưởng cho những bạn đang theo đuổi chế đọ ăn diet. Sản phẩm có khổi lượng 250g.', 150000, 245, 1)
INSERT [dbo].[PRODUCT] ([id], [name_product], [img_url], [descreption], [price], [total], [product_state_id]) VALUES (47, N'Mì rau củ', N'miraucu.jpg', N'Những sợi mì được tạo ra từ lúa mạch cùng các loại rau củ: rau chân vịt, bí đỏ, than tre. Sản phẩm không chiên qua dầu, không chứa chất béo.', 60000, 145, 1)
INSERT [dbo].[PRODUCT] ([id], [name_product], [img_url], [descreption], [price], [total], [product_state_id]) VALUES (48, N'Bánh cookie', N'cookies.jpg', N'Là sự kết hợp giữa yến mạch cùng các loại hạt. Và là bánh ăn vặt được ưa chuộng trong chế độ diet. Sản phẩm có khối lượng 250g. ', 120000, 123, 1)
INSERT [dbo].[PRODUCT] ([id], [name_product], [img_url], [descreption], [price], [total], [product_state_id]) VALUES (53, N'Hồng sấy dẻo', N'hongsay.jpg', NULL, 80000, 59, 1)
INSERT [dbo].[PRODUCT] ([id], [name_product], [img_url], [descreption], [price], [total], [product_state_id]) VALUES (54, N'Granola matcha', N'granola_matcha.jpg', N'Yến mạch mix vị trà xanh, kết hợp cùng các loại hạt: óc chó, hạnh nhân, bí, nho xanh sấy, hạnh nhân, việt quất, macca.  Kết hợp ăn kèm với sữa chua, trái cây tươi làm nên bữa sáng hoặc các bữa ăn phụ đầy đủ chất dinh dưỡng, tạo cảm giác no lâu, giảm thèm ăn. Đây là 1 sản phẩm tuyệt vời trong chế độ ăn diet.  Sản phẩm có khổi lượng 250g. ', 120000, 67, 1)
INSERT [dbo].[PRODUCT] ([id], [name_product], [img_url], [descreption], [price], [total], [product_state_id]) VALUES (55, N'Yến mạch', N'yenmach.jpg', N'Yến mạch sấy cung cấp dinh dưỡng trongn thực đơn ăn kiêng.  Sản phẩm có khổi lượng 250g. ', 1200000, 200, 1)
INSERT [dbo].[PRODUCT] ([id], [name_product], [img_url], [descreption], [price], [total], [product_state_id]) VALUES (56, N'Bánh mì đen nguyên cám', N'banh-mi-den-nguyen-cam.jpg', N'Cung cấp năng lượng cho bữa sáng với hàm lượng chất xơ cao, rất tốt cho sức khoẻ. ', 80000, 100, 1)
INSERT [dbo].[PRODUCT] ([id], [name_product], [img_url], [descreption], [price], [total], [product_state_id]) VALUES (58, N'Hạt óc chó sấy', N'qua-oc-cho.jpg', N'Là món ăn vặt cung cấp năng lượng, làm giảm cảm giác thèm ăn, cung cấp chất xơ.', 150000, 150, 1)
INSERT [dbo].[PRODUCT] ([id], [name_product], [img_url], [descreption], [price], [total], [product_state_id]) VALUES (59, N'Hạt điều sấy ', N'hat-dieu.jpg', N'', 80000, 75, 1)
INSERT [dbo].[PRODUCT] ([id], [name_product], [img_url], [descreption], [price], [total], [product_state_id]) VALUES (60, N'Hạt hạnh nhân sấy', N'hanh-nhan.jpg', N'Thành phần bao gồm chất xơ và chất béo tự nhiên, đem lại cảm giác no lâu.', 120000, 78, 1)
INSERT [dbo].[PRODUCT] ([id], [name_product], [img_url], [descreption], [price], [total], [product_state_id]) VALUES (61, N'Hạt mắc ca', N'hat-mac-ca.jpg', N'Cung cấp năng lượng cho bữa sáng với hàm lượng chất xơ cao, rất tốt cho sức khoẻ. ', 120000, 67, 1)
INSERT [dbo].[PRODUCT] ([id], [name_product], [img_url], [descreption], [price], [total], [product_state_id]) VALUES (64, N'Hạt sen', N'hat-sen.jpg', N'Cung cấp năng lượng cho bữa sáng với hàm lượng chất xơ cao, rất tốt cho sức khoẻ. ', 120000, 67, 1)
INSERT [dbo].[PRODUCT] ([id], [name_product], [img_url], [descreption], [price], [total], [product_state_id]) VALUES (66, N'Granola mix', N'bg1.jpg', N'Yến mạch sấy cung cấp dinh dưỡng trongn thực đơn ăn kiêng.  Sản phẩm có khổi lượng 250g. ', 120000, 59, 0)
INSERT [dbo].[PRODUCT] ([id], [name_product], [img_url], [descreption], [price], [total], [product_state_id]) VALUES (68, N'hạt nho khô', N'bgr1.png', N'Cung cấp năng lượng cho bữa sáng với hàm lượng chất xơ cao, rất tốt cho sức khoẻ. ', 80000, 20, 1)
INSERT [dbo].[PRODUCT] ([id], [name_product], [img_url], [descreption], [price], [total], [product_state_id]) VALUES (69, N'hat de', N'', N'Yến mạch mix vị trà xanh, kết hợp cùng các loại hạt: óc chó, hạnh nhân, bí, nho xanh sấy, hạnh nhân, việt quất, macca.  Kết hợp ăn kèm với sữa chua, trái cây tươi làm nên bữa sáng hoặc các bữa ăn phụ đầy đủ chất dinh dưỡng, tạo cảm giác no lâu, giảm thèm ăn. Đây là 1 sản phẩm tuyệt vời trong chế độ ăn diet.  Sản phẩm có khổi lượng 250g. ', 100000, 10, 1)
SET IDENTITY_INSERT [dbo].[PRODUCT] OFF
ALTER TABLE [dbo].[CART]  WITH CHECK ADD  CONSTRAINT [FK_CART_ACCOUNT] FOREIGN KEY([account_id])
REFERENCES [dbo].[ACCOUNT] ([id])
GO
ALTER TABLE [dbo].[CART] CHECK CONSTRAINT [FK_CART_ACCOUNT]
GO
ALTER TABLE [dbo].[CART]  WITH CHECK ADD  CONSTRAINT [FK_CART_PRODUCT] FOREIGN KEY([product_id])
REFERENCES [dbo].[PRODUCT] ([id])
GO
ALTER TABLE [dbo].[CART] CHECK CONSTRAINT [FK_CART_PRODUCT]
GO
ALTER TABLE [dbo].[ORDER_DETAILS]  WITH CHECK ADD  CONSTRAINT [FK_ORDER_DETAILS_ORDER_PRODUCT] FOREIGN KEY([order_product_id])
REFERENCES [dbo].[ORDER_PRODUCT] ([id])
GO
ALTER TABLE [dbo].[ORDER_DETAILS] CHECK CONSTRAINT [FK_ORDER_DETAILS_ORDER_PRODUCT]
GO
ALTER TABLE [dbo].[ORDER_DETAILS]  WITH CHECK ADD  CONSTRAINT [FK_ORDER_DETAILS_PRODUCT] FOREIGN KEY([product_id])
REFERENCES [dbo].[PRODUCT] ([id])
GO
ALTER TABLE [dbo].[ORDER_DETAILS] CHECK CONSTRAINT [FK_ORDER_DETAILS_PRODUCT]
GO
ALTER TABLE [dbo].[ORDER_PRODUCT]  WITH CHECK ADD  CONSTRAINT [FK_ORDER_PRODUCT_ACCOUNT] FOREIGN KEY([account_id])
REFERENCES [dbo].[ACCOUNT] ([id])
GO
ALTER TABLE [dbo].[ORDER_PRODUCT] CHECK CONSTRAINT [FK_ORDER_PRODUCT_ACCOUNT]
GO
ALTER TABLE [dbo].[ORDER_PRODUCT]  WITH CHECK ADD  CONSTRAINT [FK_ORDER_PRODUCT_ORDER_STATE] FOREIGN KEY([order_state_id])
REFERENCES [dbo].[ORDER_STATE] ([id])
GO
ALTER TABLE [dbo].[ORDER_PRODUCT] CHECK CONSTRAINT [FK_ORDER_PRODUCT_ORDER_STATE]
GO
