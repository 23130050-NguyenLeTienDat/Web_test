-- Tao Bang
create table NHACC
(
	MaNCC		varchar(3),
	TenNCC		nvarchar(100),
	DiaChiNCC	nvarchar(200),
	DTNCC		char(12)
	constraint pk_nhacc primary key(MaNCC)
)

create table KH
(
	MaKH		varchar(5),
	TenKH		nvarchar(100),
	DCKH		nvarchar(200),
	DTKH		char(12),
	constraint pk_kh primary key(MaKH)
)

create table LOAINGK
(
	MaLoaiNGK	varchar(3),
	TenLoaiNGK	nvarchar(50),
	MaNCC		varchar(3)
	constraint	pk_loaingk primary key(MaLoaiNGK),
	constraint	fk_nhacc_loaingk foreign key(MaNCC) references NHACC(MaNCC)
)

create table NGK
(
	MaNGK		varchar(3),
	TenNGK		nvarchar(50),
	Quycach		nvarchar(15),
	MaLoaiNGK	varchar(3),
	constraint	pk_ngk primary key(MaNGK),
	constraint	fk_loaingk_ngk foreign key(MaLoaiNGK) references LOAINGK(MaLoaiNGK)
)

create table DDH
(
	SoDDH		varchar(5),
	NgayDH		smalldatetime,
	MaNCC		varchar(3),
	constraint pk_dd primary key(SoDDH),
	constraint fk_nhacc_ddh foreign key(MaNCC) references NHACC(MaNCC)
)

create table CT_DDH
(
	SoDDH		varchar(5),
	MaNGK		varchar(3),
	SLDat		int,
	constraint pk_ctddh primary key(SoDDH,MaNGK),
	constraint fk_ddh_ctddh foreign key(SoDDH) references DDH(SoDDH),
	constraint fk_ngk_ctddh foreign key(MaNGK) references NGK(MaNGK)
)

create table PHIEUGH
(
	SoPGH		varchar(5),
	NgayGH		smalldatetime,
	SoDDH		varchar(5),
	constraint pk_phieugh primary key(SoPGH),
	constraint fk_ddh_phieugh foreign key(SoDDH) references DDH(SoDDH)
)

create table CT_PGH
(
	SoPGH		varchar(5),
	MaNGK		varchar(3),
	SLGiao		int,
	DGGiao		int,
	constraint pk_ctphieugh primary key(SoPGH,MaNGK),
	constraint fk_phieugh_ctphieugh foreign key(SoPGH) references PHIEUGH(SoPGH),
	constraint fk_ngk_ctphieugh foreign key(MaNGK) references NGK(MaNGK)
)

create table HOADON
(
	SoHD		varchar(5),
	NgaylapHD	smalldatetime,
	MaKH		varchar(5),
	constraint pk_hoadon primary key(SoHD),
	constraint fk_kh_hoadon foreign key(MaKH) references KH(MaKH)
)

create table CT_HOADON
(
	SoHD		varchar(5),
	MaNGK		varchar(3),
	SLKHMua		int,
	DGBan		int,
	constraint pk_cthoadon primary key(SoHD,MaNGK),
	constraint fk_hoadon_cthoadon foreign key(SoHD) references HOADON(SoHD),
	constraint fk_ngk_cthoadon foreign key(MaNGK) references NGK(MaNGK)
)

create table PHIEUHEN
(
	SoPH		varchar(5),
	NgaylapPH	smalldatetime,
	NgayhenGiao	smalldatetime,
	MaKH		varchar(5),
	constraint pk_phieuhen primary key(SoPH),
	constraint fk_kh_phieuhen foreign key(MaKH) references KH(MaKH)
)

create table CT_PH
(
	SoPH		varchar(5),
	MaNGK		varchar(3),
	SLHen		int,
	constraint pk_ctphieuhen primary key(SoPH,MaNGK),
	constraint fk_ngk_ctphieuhen foreign key(MaNGK) references NGK(MaNGK)
)

create table PHIEUTRANO
(
	SoPTN		varchar(5),
	Ngaytra		smalldatetime,
	SotienTra	int,
	SoHD		varchar(5),
	constraint pk_phieutrano primary key(SoPTN),
	constraint fk_hoadon_phieutrano foreign key(SoHD) references HOADON(SoHD)
)

-- Insert du lieu
insert into NHACC values('NC1',N'Công ty NGK quốc tế Coca Cola',N'Xa lộ Hà Nội, Thủ Đức, TP.HCM','088967908')
insert into NHACC values('NC2',N'Công ty NGK quốc tế Pepsi',N'Bến Chương Dương, Quận 1, TP.HCM','083663366')
insert into NHACC values('NC3',N'Công ty NGK Bến Chương Dương',N'Hàm Tử, Quận 5, TP.HCM','089456677')

insert into KH values('KH01',N'Cửa hàng BT',N'144 XVNT','088405996')
insert into KH values('KH02',N'Cửa hàng trà',N'198/42 NTT','085974572')
insert into KH values('KH03',N'Siêu thị COOP',N'24 ĐTH','086547888')

insert into LOAINGK values('NK1',N'Nước ngọt có gas','NC1')
insert into LOAINGK values('NK2',N'Nước ngọt không gas','NC2')
insert into LOAINGK values('NK3',N'Trà','NC1')
insert into LOAINGK values('NK4',N'Sữa','NC2')

insert into NGK values('CC1',N'Coca Cola',N'Chai','NK1')
insert into NGK values('CC2',N'Coca Cola',N'Lon','NK1')
insert into NGK values('PS1',N'Pepsi',N'Chai','NK1')
insert into NGK values('PS2',N'Pepsi',N'Lon','NK1')
insert into NGK values('SV1',N'Seven Up',N'Chai','NK1')
insert into NGK values('SV2',N'Seven Up',N'Lon','NK1')
insert into NGK values('NO1',N'Number One',N'Chai','NK1')
insert into NGK values('NO2',N'Numbet One',N'Lon','NK1')
insert into NGK values('ST1',N'Sting dâu',N'Chai','NK1')
insert into NGK values('ST2',N'Sting dâu',N'Lon','NK1')
insert into NGK values('C2', N'Trà C2',N'Chai','NK2')
insert into NGK values('OD', N'Trà xanh 0 độ',N'Chai','NK2')
insert into NGK values('ML1',N'Sữa tươi tiệt trùng',N'Bịch','NK1')
insert into NGK values('WT1',N'Nước uống đóng chai',N'Chai','NK2')

insert into DDH values('DDH01','10/05/2011','NC1')
insert into DDH values('DDH02','05/20/2011','NC1')
insert into DDH values('DDH03','05/26/2011','NC2')
insert into DDH values('DDH04','03/06/2011','NC2')

insert into CT_DDH values('DDH01','CC1','20')
insert into CT_DDH values('DDH01','CC2','15')
insert into CT_DDH values('DDH01','PS1','18')
insert into CT_DDH values('DDH01','SV2','12')
insert into CT_DDH values('DDH02','CC2','30')
insert into CT_DDH values('DDH02','PS2','10')
insert into CT_DDH values('DDH02','SV1','5')
insert into CT_DDH values('DDH02','ST1','15')
insert into CT_DDH values('DDH02','C2','10')
insert into CT_DDH values('DDH03','OD','45')
insert into CT_DDH values('DDH04','CC1','8')
insert into CT_DDH values('DDH04','ST2','12')

insert into PHIEUGH values('PGH01','12/05/2010','DDH01')
insert into PHIEUGH values('PGH02','5/05/2010','DDH01')
insert into PHIEUGH values('PGH03','1/05/2010','DDH02')
insert into PHIEUGH values('PGH04','2/05/2010','DDH02')
insert into PHIEUGH values('PGH05','8/05/2010','DDH03')

insert into CT_PGH values('PGH01','CC1','15','5000')
insert into CT_PGH values('PGH01','CC2','15','4000')
insert into CT_PGH values('PGH01','SV2','10','4000')
insert into CT_PGH values('PGH02','SV2','2','4000')
insert into CT_PGH values('PGH03','CC2','30','5000')
insert into CT_PGH values('PGH03','PS1','10','4000')
insert into CT_PGH values('PGH03','ST1','15','9000')
insert into CT_PGH values('PGH03','C2','10','8000')

insert into HOADON values('HD01','10/05/2010','KH01')
insert into HOADON values('HD02','2/05/2010','KH01')
insert into HOADON values('HD03','5/06/2010','KH02')
insert into HOADON values('HD04','6/06/2010','KH02')
insert into HOADON values('HD05','2/06/2011','KH02')
insert into HOADON values('HD06','8/07/2010','KH03')
insert into HOADON values('HD07','6/13/2010','KH03')
insert into HOADON values('HD08','6/18/2010','KH03')
insert into HOADON values('HD09','6/18/2010','KH03')
insert into HOADON values('HD010','6/18/2010','KH03')


insert into CT_HOADON values('HD01','CC1','20','6000')
insert into CT_HOADON values('HD01','CC2','50','5000')
insert into CT_HOADON values('HD02','ST1','40','10000')
insert into CT_HOADON values('HD03','SV2','60','5000')
insert into CT_HOADON values('HD04','PS2','25','5000')
insert into CT_HOADON values('HD05','CC1','100','6000')
insert into CT_HOADON values('HD05','SV1','12','8000')
insert into CT_HOADON values('HD05','C2','80','9000')
insert into CT_HOADON values('HD06','OD','55','1000')
insert into CT_HOADON values('HD06','ST2','50','11000')
insert into CT_HOADON values('HD07','CC1','15','10000')
insert into CT_HOADON values('HD08','ST1','40','10000')
insert into CT_HOADON values('HD09','ST2','50','11000')
insert into CT_HOADON values('HD010','CC2','50','5000')
DELETE FROM CT_HOADON;

insert into PHIEUHEN values('PH01','08/05/2010','09/06/2010','KH01')
insert into PHIEUHEN values('PH02','5/05/2010','8/06/2010','KH02')
insert into PHIEUHEN values('PH03','01/06/2010','02/06/2010','KH03')

insert into CT_PH values('PH01','ST2','10')
insert into CT_PH values('PH01','OD','8')
insert into CT_PH values('PH02','CC1','20')
insert into CT_PH values('PH03','ST1','7')
insert into CT_PH values('PH03','SV2','12')
insert into CT_PH values('PH03','CC2','9')
insert into CT_PH values('PH03','PS2','15')

insert into PHIEUTRANO values('PTN01','8/05/2010','500000','HD01')
insert into PHIEUTRANO values('PTN02','01/06/2010','350000','HD01')
insert into PHIEUTRANO values('PTN03','02/06/2010','650000','HD02')
insert into PHIEUTRANO values('PTN04','5/06/2010','102000','HD03')
insert into PHIEUTRANO values('PTN05','01/07/2010','108000','HD03')

-- Select
select * from NHACC
select * from KH
select * from LOAINGK
select * from NGK
select * from DDH
select * from CT_DDH
select * from PHIEUGH
select * from CT_PGH
select * from HOADON
select * from CT_HOADON
select * from PHIEUHEN
select * from CT_PH
select * from PHIEUTRANO

-- Truy Van
-- Cau 1
SELECT A.MaNGK, A.TenNGK, A.Quycach, B.MaLoaiNGK, B.TenLoaiNGK, B.MaNCC
FROM NGK A JOIN LOAINGK B ON A.MaLoaiNGK = B.MaLoaiNGK;

-- CAU 2
SELECT * 
FROM NHACC
WHERE DiaChiNCC LIKE '%TP.HCM';

-- CAU 3
SELECT * FROM HOADON 
WHERE NgaylapHD BETWEEN '2010/05/01' AND '2010/05/31';

--CAU 4
SELECT DISTINCT A.*
FROM NHACC A JOIN LOAINGK B ON A.MaNCC = B.MaNCC
	JOIN NGK C ON B.MaLoaiNGK = C.MaLoaiNGK
WHERE C.TenNGK = 'Coca Cola';

-- CAU 5 -- KHONG BIET 
SELECT A.TenNCC
FROM NHACC A JOIN LOAINGK B ON A.MaNCC = B.MaNCC
JOIN NGK C ON C.MaLoaiNGK = B.MaLoaiNGK 
GROUP BY A.MaNCC, A.TenNCC
HAVING COUNT(B.MaLoaiNGK) =  ( SELECT MAX (SOLUONG) FROM 
	( SELECT COUNT(MaLoaiNGK) AS SOLUONG
	FROM NGK
	GROUP BY MaLoaiNGK) AS COUNT
	);
	
								


-- CAU 6
SELECT TenNCC
FROM NHACC
WHERE MaNCC NOT IN ( SELECT DISTINCT A.MaNCC FROM LOAINGK A
					JOIN NGK B ON A.MaLoaiNGK = B.MaLoaiNGK
					WHERE B.TenNGK = 'Pepsi'
    );

-- CAU 7
SELECT MaNGK,TenNGK,Quycach,MaLoaiNGK
FROM NGK
WHERE MaNGK NOT IN ( SELECT DISTINCT MaNGK
        FROM CT_HOADON
    );
	
-- CAU 8
SELECT A.TenNGK, SUM (B.SLKHMua) AS TONGSOLUONGBAN
FROM NGK A
JOIN CT_HOADON B ON A.MaNGK = B.MaNGK 
GROUP BY A.TenNGK;

-- CAU 9
SELECT A.TenNGK, SUM (B.SLDat) AS TONGSOLUONGNHAP
FROM NGK A
JOIN CT_DDH B ON A.MaNGK = B.MaNGK 
GROUP BY A.TenNGK;

-- CAU 10
SELECT A.SoDDH, A.MaNGK, A.SLDat AS SLDATNHIEUNHAT
FROM CT_DDH A
JOIN (SELECT MaNGK, MAX(SLDat) AS SLDATNHIEUNHAT
		FROM CT_DDH
		GROUP BY MaNGK) AS SLDATNHIEUNHAT ON A.MaNGK = SLDATNHIEUNHAT.MaNGK AND A.SLDat = SLDATNHIEUNHAT.SLDATNHIEUNHAT ;

-- CAU 11
SELECT * 
FROM NGK A
WHERE A.MaNGK NOT IN ( SELECT DISTINCT C.MaNGK
						FROM PHIEUGH B
						JOIN CT_PGH C ON B.SoPGH = C.SoPGH
						WHERE MONTH(B.NgayGH) = 1 AND YEAR(B.NGAYGH) = 2010);


-- CAU 12
SELECT DISTINCT TenNGK
FROM NGK
WHERE MaNGK NOT IN (SELECT DISTINCT B.MaNGK
					FROM HOADON A JOIN CT_HOADON B ON A.SoHD = B.SoHD 
					WHERE A.NgaylapHD >= '2010-06-01' AND A.NgaylapHD < '2010-07-01'
    );

-- CAU 13 
SELECT COUNT(DISTINCT MaNGK) AS SoLoaiNGKBan
FROM CT_HOADON;

-- CAU 14 
SELECT A.MaKH, A.TenKH, COUNT(DISTINCT C.MaNGK) AS SOLOAINGKBAN
FROM KH A
JOIN HOADON B ON A.MaKH = B.MaKH
JOIN CT_HOADON C ON B.SoHD = C.SoHD
GROUP BY A.MaKH, A.TenKH;

-- CAU 15
SELECT KH.MaKH,KH.TenKH,KH.DTKH,KH.DCKH , COUNT(HOADON.MaKH) AS SOLANMUA
FROM KH JOIN HOADON ON KH.MaKH = HOADON.MaKH
GROUP BY KH.MaKH,KH.TenKH,KH.DTKH,KH.DCKH
HAVING COUNT(HOADON.MaKH) = (SELECT MAX(SOLUONGKHACHHANG) 
								FROM ( SELECT COUNT(HOADON.MaKH) AS SOLUONGKHACHHANG FROM HOADON GROUP BY HOADON.MaKH) AS COUNTKH);

-- CAU 16
SELECT A.MaKH, A.TenKH, SUM(C.SLKHMua * C.DGBan) AS DOANHTHU
FROM KH A JOIN HOADON B ON A.MaKH = B.MaKH
JOIN CT_HOADON C ON C.SoHD = B.SoHD
WHERE YEAR(B.NgaylapHD) = 2010
GROUP BY A.MaKH, A.TenKH;
								
-- CAU 17
SELECT TOP 5 
     C.MaNGK, C.TenNGK, SUM(B.SLKHMua * B.DGBan) AS TongDoanhThu
FROM HOADON A
JOIN CT_HOADON B ON A.SoHD = B.SoHD
JOIN NGK C ON B.MaNGK = C.MaNGK
WHERE A.NgaylapHD >= '05-01-2010' AND A.NgaylapHD < '06-01-2010' 
GROUP BY C.MaNGK, C.TenNGK
ORDER BY TongDoanhThu DESC;

-- CAU 18
SELECT C.MaNGK, C.TenNGK, SUM(B.SLKHMua) AS SLBAN
FROM HOADON A
JOIN CT_HOADON B ON A.SoHD = B.SoHD
JOIN NGK C ON B.MaNGK = C.MaNGK
WHERE A.NgaylapHD >= '2010-05-01' AND A.NgaylapHD < '2010-06-01' 
GROUP BY C.MaNGK, C.TenNGK
ORDER BY SLBAN DESC;

-- CAU 19

SELECT A.*, SUM(B.SLKHMua) AS SOLUONGKHACHHANGMUA
FROM NGK A JOIN CT_HOADON B ON B.MaNGK = A.MaNGK
GROUP BY A.MaLoaiNGK, A.MaNGK, A.Quycach, A.TenNGK
HAVING SUM(B.SLKHMua) = (SELECT MAX(SLMUA) 
						FROM (
							  SELECT SUM(CT_HOADON.SLKHMua) AS SLMUA 
							  FROM CT_HOADON 
							  GROUP BY CT_HOADON.MaNGK) AS COUNTSA);
-- CAU 20
SELECT TOP 1 DDH.NgayDH
FROM DDH 
ORDER BY DDH.NgayDH DESC;
-- CAU 21
SELECT COUNT(*) AS SoLanMuaHang
FROM HOADON
WHERE MaKH = 'KH01';

-- CAU 22
select SoHD, Sum(SLKHMua * DGBan)  as tong_gia_tien
from CT_HOADON
group by SoHD;

-- CAU 23
SELECT A.SoHD, A.NgaylapHD, A.MaKH, B.TenKH, SUM(C.SLKHMua * C.DGBan) AS TongTriGia
FROM HOADON A
JOIN KH B ON A.MaKH = B.MaKH
JOIN CT_HOADON C ON A.SoHD = C.SoHD
GROUP BY A.SoHD, A.NgaylapHD, A.MaKH, B.TenKH
ORDER BY A.NgaylapHD ASC, TongTriGia DESC;

-- CAU 24  done
SELECT A.SoHD, SUM(B.SLKHMua * B.DGBan) AS TongTriGia 
FROM HOADON A
JOIN CT_HOADON B ON A.SoHD = B.SoHD
WHERE A.NgaylapHD = '2010-06-18'
GROUP BY A.SoHD
having Sum(B.SLKHMua * B.DGBan) > (select avg(gttb)
									from (
										select sum(ct1.SLKHMua * ct1.DGBan) as gttb
										from CT_HOADON ct1
										join HOADON hd on ct1.SoHD = hd.SoHD
										where  hd.NgaylapHD = '2010-06-18'
										group by ct1.SoHD
										)as S_CTHD
								)

-- CAU 25
SELECT C.MaNGK, C.TenNGK, MONTH(A.NgaylapHD) AS THANG, SUM(B.SLKHMua) AS SoLuongTieuThu
FROM HOADON A
JOIN CT_HOADON B ON A.SoHD = B.SoHD
JOIN NGK C ON B.MaNGK = C.MaNGK
WHERE YEAR(A.NgaylapHD) = 2010
GROUP BY C.MaNGK, C.TenNGK, MONTH(A.NgaylapHD)
ORDER BY THANG, C.MaNGK;

-- CAU 26
SELECT A.MaNGK, A.TenNGK
FROM NGK A
WHERE A.MaNGK NOT IN (
SELECT DISTINCT B.MaNGK
FROM HOADON C
JOIN CT_HOADON B ON C.SoHD = B.SoHD
WHERE YEAR(C.NgaylapHD) = 2010 AND MONTH(C.NgaylapHD) = 9 );

-- CAU 27
SELECT DISTINCT A.MaKH, A.TenKH, A.DCKH
FROM KH A
JOIN HOADON B ON A.MaKH = B.MaKH
JOIN CT_HOADON C ON B.SoHD = C.SoHD
WHERE A.DCKH LIKE '%TP.HCM%'
AND YEAR(B.NgaylapHD) = 2010
AND MONTH(B.NgaylapHD) = 9;

-- CAU 28
SELECT A.MaNGK, A.TenNGK, ISNULL(SUM(C.SLKHMua), 0) AS SoLuongBan
FROM NGK A
JOIN CT_HOADON C ON A.MaNGK = C.MaNGK
JOIN HOADON B ON C.SoHD = B.SoHD
WHERE (YEAR(B.NgaylapHD) = 2010 AND MONTH(B.NgaylapHD) = 10) OR B.SoHD IS NULL
GROUP BY A.MaNGK, A.TenNGK;

-- CAU 29
SELECT A.MaKH, A.TenKH, D.MaNGK, D.TenNGK, SUM(C.SLKHMua) AS TongSoLuong
FROM KH A
JOIN HOADON B ON A.MaKH = B.MaKH
JOIN CT_HOADON C ON B.SoHD = C.SoHD
JOIN NGK D ON C.MaNGK = D.MaNGK
GROUP BY A.MaKH, A.TenKH, D.MaNGK, D.TenNGK
ORDER BY A.MaKH, D.MaNGK;

-- CAU 30
SELECT TOP 1 A.MaKH, A.TenKH, SUM(C.SotienTra) AS TongNo
FROM KH A
JOIN HOADON B ON A.MaKH = B.MaKH
JOIN PHIEUTRANO C ON B.SoHD = C.SoHD
WHERE YEAR(B.NgaylapHD) = 2010
GROUP BY A.MaKH, A.TenKH
ORDER BY TongNo DESC;

-- CAU 31
SELECT COUNT(DISTINCT A.SoHD) AS SoHoaDonChuaThanhToanHet
FROM HOADON A
JOIN CT_HOADON B ON A.SoHD = B.SoHD
JOIN PHIEUTRANO C ON A.SoHD = C.SoHD
GROUP BY A.SoHD
HAVING SUM(B.SLKHMua * B.DGBan) > ISNULL(SUM(C.SotienTra), 0);

-- CAU 32
SELECT A.SoHD, D.TenKH
FROM HOADON A
JOIN KH D ON A.MaKH = D.MaKH
JOIN CT_HOADON B ON A.SoHD = B.SoHD
JOIN PHIEUTRANO C ON A.SoHD = C.SoHD
WHERE C.SoPTN IS NULL
GROUP BY A.SoHD, D.TenKH;

-- CAU 33
SELECT A.MaNGK, B.TenNGK, SUM(A.SLDat) AS TongSLDat
FROM CT_DDH A
JOIN NGK B ON A.MaNGK = B.MaNGK
JOIN DDH C ON A.SoDDH = C.SoDDH
WHERE YEAR(C.NgayDH) = 2010
GROUP BY A.MaNGK, B.TenNGK;

-- CAU 34
SELECT A.MaKH, A.TenKH, SUM(C.SLKHMua * C.DGBan) AS TongSoTien
FROM KH A
JOIN HOADON B ON A.MaKH = B.MaKH
JOIN CT_HOADON C ON B.SoHD = C.SoHD
WHERE YEAR(B.NgaylapHD) = 2010
GROUP BY A.MaKH, A.TenKH
ORDER BY TongSoTien DESC;

-  - VIEW 
-- View 1
CREATE VIEW V_NGK AS
SELECT A.MaNGK, A.TenNGK, A.Quycach, SUM(B.SLKHMua) AS SoLuongBan, SUM(B.SLKHMua * B.DGBan) AS TongTien
FROM NGK A
JOIN CT_HOADON B ON A.MaNGK = B.MaNGK
GROUP BY A.MaNGK, A.TenNGK, A.Quycach;

-- View 2
CREATE VIEW V_khachang AS
SELECT TOP 10 A.MaKH, A.TenKH, A.DTKH, SUM(C.SLKHMua * C.DGBan) AS TongTien
FROM KH A
JOIN HOADON B ON A.MaKH = B.MaKH
JOIN CT_HOADON C ON B.SoHD = C.SoHD
GROUP BY A.MaKH, A.TenKH, A.DTKH
ORDER BY TongTien DESC;

-- View 3
CREATE VIEW V_TRANO AS
SELECT A.MaKH, A.TenKH, A.DTKH, 
       SUM(C.SLKHMua * C.DGBan) AS TongTienPhaiTra, 
       ISNULL(SUM(D.SotienTra), 0) AS TongTienDaTra, 
       COUNT(D.SoPTN) AS SoLanThuTien
FROM KH A
JOIN HOADON B ON A.MaKH = B.MaKH
JOIN CT_HOADON C ON B.SoHD = C.SoHD
JOIN PHIEUTRANO D ON B.SoHD = D.SoHD
GROUP BY A.MaKH, A.TenKH, A.DTKH
HAVING COUNT(D.SoPTN) > 2 AND ISNULL(SUM(D.SotienTra), 0) < SUM(C.SLKHMua * C.DGBan);

-- View 4
CREATE VIEW V_ngk_ton AS
SELECT MaNGK, TenNGK, Quycach, MaLoaiNGK
FROM NGK
WHERE MaNGK NOT IN (SELECT DISTINCT MaNGK FROM CT_HOADON);