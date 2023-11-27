create database Java5_ASM;
use Java5_ASM;

Create Table NguoiDung (	
	Username Varchar(20) Primary Key NOT NULL,
	TenND NVarchar(50)	NOT NULL,	
	MatKhau NVarchar (10) NOT NULL,
	Email NVarchar (20) NOT NULL,
	DiaChi NVarchar (100)  NULL,
	Sdt NVarchar(10) NOT NULL,
	isAdmin bit not null default 0
);


Create Table DanhMuc (	
	IdDM int primary key identity,
	TenDM NVarchar(50)	NOT NULL,	
	MoTa NVarchar(100) NULL
);


Create Table SanPham (	
	IdSP int primary key identity,
	IdND Varchar(20) foreign key references NguoiDung(Username),
	TenSP NVarchar(100) NOT NULL,
	Gia money not null,
	GiamGia int null,
	MoTa NVarchar(100) NULL,
	Img NVarchar(100) NULL,
	NgayTao datetime NOT NULL default getDate(),
	NgayEdit datetime NULL
);

Create Table DanhMucCon (	
	IdDMC int primary key identity,
	TenDMC NVarchar(20) NOT NULL

);

Create table SanPham_DanhMuc (
	IdSP int foreign key references SanPham(IdSP),
	IdDMC int foreign key references DanhMucCon(IdDMC),
	Primary Key (IdDMC,IdSP)
	);

Create Table DanhMucChiTiet (	
	IdDM int foreign key references DanhMuc(IdDM),
	IdDMC int foreign key references DanhMucCon(IdDMC),
	Primary Key (IdDM,IdDMC)
);


Create Table DonHang (	
	IdDH int primary key identity,
	IdND Varchar(20) foreign key references NguoiDung(Username),
	TenNguoiNhan NVarchar(50) NOT NULL,
	DiaChiGiao NVarchar(100) NULL,
	SdtNguoiNhan Varchar(10) NOT NULL,
	NgayDat datetime NOT NULL default getDate(),
	TrangThai bit not null default 0,
	TongTien money not null,
);



Create Table DonHangChiTiet (	
	Id int ,
	IdDH int foreign key references DonHang(IdDH),
	IdSP int foreign key references SanPham(IdSP), 
	Primary Key (IdDH,IdSP),
	SoLuong int not null,
	Gia money not null
);

CREATE TABLE GioHangItem (
    ghItemId INT PRIMARY KEY ,
   idSP INT,
    quantity INT,
    totalPrice DECIMAL(10, 2),
    FOREIGN KEY (idSP) REFERENCES SanPham(idSP)
);


INSERT INTO NguoiDung(Username, TenND, MatKhau, Email, Sdt ,isAdmin) VALUES
('admin1', 'Nguyen Van A','password1', 'admin1@gmail.com','0912255877',1),
('admin2', 'Nguyen Van B','password2', 'admin2@gmail.com','0912645822',1),
('user1', 'Nguyen Van C','password3', 'user1@gmail.com','0932565822',0),
('user2', 'Nguyen Van D','password4', 'user2@gmail.com','0932559912',0),
('user3', 'Nguyen Van E','password5', 'user3@gmail.com','0932534824',0);

insert into SanPham values
/*giày thể thao nữ*/
('admin1',N'Giày nữ NUTT-0795',195000,null,N'Giày Thể Thao Nữ Phối Viền Màu Siêu Cute Sneaker Da Êm Chân Đế Bằng Hot Trend','g_nu1.jpg',getDate(),null),
('admin1',N'Giày nữ MWC-0623',235000,null,N'Giày Sục Thể Thao Nữ Phối Họa Tiết Siêu Cute,Sneaker Êm Chân Đế Bằng Hot Trend','g_nu2.jpg',getDate(),null),
('admin1',N'Giày nữ NUTT-A106',295000,null,N'Giày Thể Thao Nữ Phối Viền Màu Siêu Cute Sneaker Da Êm Chân Đế Bằng Hot Trend','g_nu3.jpg',getDate(),null),
('admin1',N'Giày nữ MWC-0735',295000,null,N'Giày Thể Thao Nữ Phối Màu Thể Thao,Sneaker Vải Siêu Êm Chân Đế Bằng 2CM Hot Trend','g_nu4.jpg',getDate(),null),
('admin1',N'Giày nữ MWC-0702',295000,null,N'Giày Thể Thao Nữ Phối Màu Siêu Cute,Sneaker Êm Chân Đế Độn 4CM Hot Trend','g_nu5.jpg',getDate(),null),

/*cao gót nữ*/
('admin1',N'Giày cao gót NUCG-4404',195000,null,N'Cao Gót Quai Ngang Tròn Cách Điệu Gót Vuông Thời Trang','c_nu1.jpg',getDate(),null),
('admin1',N'Giày cao gót NUCG-4937',150000,null,N'Cao Gót Quai Chéo Nhún Phối Quai Hậu Gót Vuông Thời Trang','c_nu2.jpg',getDate(),null),
('admin1',N'Giày cao gót MWC-3548',150000,null,N'Cao Gót Quai Ngang Bít Gót,Gót Vuông 7cm Phối Quai Hậu Thời Trang','c_nu3.jpg',getDate(),null),
('admin1',N'Giày cao gót MWC-4179',195000,null,N'Cao Gót Quai Trong Gót Trong Viền Đá Cách Điệu Sang Chảnh Thời Trang','c_nu4.jpg',getDate(),null),
('admin1',N'Giày cao gót MWC-4364',250000,null,N'Sandal Đế Đúp Quai Ngang Nhún Cach Điệu Phối Quai Hậu Thời Trang','c_nu5.jpg',getDate(),null),
('admin1',N'Giày cao gót NUCG-4418',235000,null,N'Cao Gót Đính Khóa Mũi Nhọn Gót Nhọn Thời Trang','c_nu6.jpg',getDate(),null),

/*sandal nữ*/
('admin1',N'Sandal nữ NUSD-2888',79000,null,N'Sandal Quai Chéo Thời Trang','s_nu1.jpg',getDate(),null),
('admin1',N'Sandal nữ NUSD-2889',79000,null,N'Sandal Quai Chéo Thời Trang','s_nu2.jpg',getDate(),null),
('admin1',N'Sandal nữ NUSD-2885',79000,null,N'Sandal Quai Chéo Thời Trang','s_nu3.jpg',getDate(),null),
('admin1',N'Sandal nữ NUSD-2979',250000,null,N'Sandal Quai Tròn Ngang Chéo Cách Điệu Đế Bánh Mì Cao 5cm Cực Thời Trang','s_nu4.jpg',getDate(),null),
('admin1',N'Sandal nữ NUSD-2884',79000,null,N'Sandal Quai Chéo Thời Trang','s_nu5.jpg',getDate(),null),
('admin1',N'Sandal nữ NUSD-2787',1950000,null,N' Sandal 3 Quai Ngang Lót Dán Đế Bằng Thời Trang','s_nu6.jpg',getDate(),null),

/*dép nữ*/
('admin1',N'Dép nữ MWC-3487',79000,null,N'Dép Nữ Quai Mảnh Đế Bệt Xỏ Ngón Siêu Xinh Thời Trang Trẻ Trung Thanh Lịch','d_nu1.jpg',getDate(),null),
('admin1',N'Dép nữ MWC-8085',79000,null,N'Dép Xỏ Ngón Đính Khóa Tròn Cách Điệu, Dép Nữ Da Bóng, Mũi Vuông Hot Hit','d_nu2.jpg',getDate(),null),
('admin1',N'Dép nữ MWC-8092',79000,null,N'Dép Nữ Xỏ Ngón Quai Mảnh Cách Điệu Hot Trend Thời Trang','d_nu3.jpg',getDate(),null),
('admin1',N'Dép nữ MWC-8274',235000,null,N'Dép Nữ Bằng, Dép Nữ 2 Quai Ngang Hot Trend','d_nu4.jpg',getDate(),null),
('admin1',N'Dép nữ NUDE-8124',125000,null,N'Dép Nữ Quai Ngang Đính Lông Sành Điệu','d_nu5.jpg',getDate(),null),
('admin1',N'Dép nữ MWC-8290',79000,null,N'Dép Nữ Bằng,Dép Nữ Quai Cắt Cữ H Hot Trend','d_nu6.jpg',getDate(),null),

/*giày nam*/
('admin1',N'Giày nam MWC-5417',250000,null,N'Sneaker Nam Cổ Thấp Năng Động Cá Tính','d1.jpg',getDate(),null),
('admin1',N'Giày nam NATT-5419',250000,null,N'Sneaker Nam Cổ Thấp Năng Động Cá Tính','d2.jpg',getDate(),null),
('admin1',N'Giày nam NATT-5462',275000,null,N'Giày Thể Thao Nam Phối Sọc Thể Thao','d3.jpg',getDate(),null),
('admin1',N'Giày nam NATT-5460',275000,null,N'Sneaker Nam Cổ Thấp Năng Động Cá Tính','d4.jpg',getDate(),null),
('admin1',N'Giày nam NATT-5442',295000,null,N'Giày Thể Thao Nam Cao Cấp','d5.jpg',getDate(),null),
('admin1',N'Giày nam MWC-5416',295000,null,N'Giày Thể Thao Nam Phối Chữ Cao Cấp','d6.jpg',getDate(),null),

/*dép nam*/
('admin1',N'Dép nam NADE-7676',195000,null,N'Dép Nam 2 Quai Ngang Cách Điệu Đế Bệt Cao Cấp','d_nam1.jpg',getDate(),null),
('admin1',N'Dép nam NADE-7749',235000,null,N'Dép Nam Quai Ngang Đế Bằng','d_nam2.jpg',getDate(),null),
('admin1',N'Dép nam NADE-7724',195000,null,N'Dép Nam 2 Quai Ngang Phối Màu Cách Điệu Phong Cách','d_nam3.jpg',getDate(),null),
('admin1',N'Dép nam MWC-7791',150000,null,N'Dép Nam Quai Ngang Cách Điệu Cao Cấp','d_nam4.jpg',getDate(),null),
('admin1',N'Dép nam MWC-7567',79000,null,N'Dép Kẹp Nam Đế Đúc Nguyên Khối Phong Cách Cá Tính','d_nam5.jpg',getDate(),null),
('admin1',N'Dép nam MWC-7640',195000,null,N'Dép Nam Quai Ngang Logo Tinh Tế','d_nam6.jpg',getDate(),null),

/*sandal nam*/
('admin1',N'Sandal nam NASD-7045',195000,null,N'Sandal Quai Ngang Thời Trang Kiểu Dáng Streetwear','s_nam1.jpg',getDate(),null),
('admin1',N'Sandal nam MWC-7052',195000,null,N'Sandal Quai Ngang Chéo Kiểu Dáng Basic Đế Mềm Mại','s_nam2.jpg',getDate(),null),
('admin1',N'Sandal nam MWC-7070',225000,null,N'Sandal Nam Quai Ngang Chéo Kiểu Dáng Basic','s_nam3.jpg',getDate(),null),
('admin1',N'Sandal nam MWC-7033',225000,null,N'Sandal Quai Chéo Xỏ Ngón Kiểu Dáng Basic Đế Mềm ','s_nam4.jpg',getDate(),null),
('admin1',N'Sandal nam MWC-7031',195000,null,N'Sandal Khóa Cài Kiểu Dáng Streetwear Đế Mềm','s_nam5.jpg',getDate(),null),
('admin1',N'Sandal nam NASD-7072',295000,null,N'Sandal 3 Quai Ngang Thời Trang Kiểu Dáng Streetwear Đế Mềm','s_nam6.jpg',getDate(),null);

insert into DanhMuc values
('Giay_Nam', N'Giày Nam'),
('Giay_Nu', N'Giày Nữ');

insert into DanhMucCon values
(N'Sneaker Nữ'),(N'Giày cao gót'), (N'Sandal Nữ'),(N'Dép nữ'),
(N'Sneaker Nam'),(N'Dép Nam'),(N'Sandal Nam');


insert into DanhMucChiTiet values
/*danh mục giày nữ-dmc sp nữ*/
(2,1),(2,2),(2,3),(2,4),

/*danh mục giày nam-dmc sp nam*/
(1,5),(1,6),(1,7);


insert into SanPham_DanhMuc values 
/*sp giày nữ-dmc sneaker nữ*/ 
(1,1),(2,1),(3,1),(4,1),(5,1),

/*sp cao gót nữ-dmc cao gót*/ 
(6,2),(7,2),(8,2),(9,2),(10,2),(11,2),

/*sp sandal nữ-dmc sandal nữ*/ 
(12,3),(13,3),(14,3),(15,3),(16,3),(17,3),

/*sp dép nữ-dmc dép nữ*/
(18,4),(19,4),(20,4),(21,4),(22,4),(23,4),

/*sp giày nam-dmc sneaker nam*/ 
(24,5),(25,5),(26,5),(27,5),(28,5),(29,5),

/*sp dép nam-dmc dép nam*/
(30,6),(31,6),(32,6),(33,6),(34,6),(35,6),

/*sp sandal nam-dmc sandal nam*/
(36,7),(37,7),(38,7),(39,7),(40,7),(41,7);

select * from DanhMucCon
select * from DanhMuc
select * from DanhMucChiTiet
select * from SanPham
select * from SanPham_DanhMuc



