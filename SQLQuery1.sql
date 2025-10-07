
CREATE TABLE DEAN(
	MADA CHAR(100) PRIMARY KEY,
	TENDA CHAR(100),
	KINHPHI INT);
	CREATE TABLE PHONGBAN(
	MAPB CHAR(100) PRIMARY KEY,
	TENPB CHAR(100),
	MATP CHAR(100),
	DIADIEM CHAR(100));

	ALTER TABLE PHONGBAN ADD CONSTRAINT FK_MATP FOREIGN KEY (MATP) REFERENCES PHONGBAN(MAPB);
	CREATE TABLE NHANVIEN( MANV CHAR(100) PRIMARY KEY, TENNV CHAR(100), NGAYSINH DATE, GT CHAR(100), MAPB CHAR (100));
	
	ALTER TABLE NHANVIEN ADD CONSTRAINT FK_MAPB FOREIGN KEY (MAPB) REFERENCES PHONGBAN(MAPB);
	
	CREATE TABLE THAMGIA (MANV CHAR(100) , MADA CHAR(100), NGAYBD DATE, CHUCVU CHAR(100), 
	CONSTRAINT FK_MANV FOREIGN  KEY (MANV) REFERENCES NHANVIEN(MANV),
	CONSTRAINT FK_MADA FOREIGN KEY(MADA) REFERENCES DEAN(MADA)) ;
	









	DROP TABLE DEAN;
	DROP TABLE THAMGIA;
	DROP TABLE NHANVIEN;
	DROP TABLE PHONGBAN;


	--- THEM DU LIEU
	INSERT INTO DEAN (MADA, TENDA, KINHPHI)
VALUES
(1, 'Dự án Xây dựng cầu', 1000000000),
(2, 'Dự án Đào tạo nhân lực', 500000000),
(3, 'Dự án Nâng cấp hạ tầng', 800000000),
(4, 'Dự án Cải tiến phần mềm', 1200000000),
(5, 'Dự án Mở rộng văn phòng', 300000000);

INSERT INTO PHONGBAN (MAPB, TENPB, MATP, DIADIEM)
VALUES
(1, 'Phòng Kinh doanh', 1, 'Hà Nội'),
(2, 'Phòng IT', 2, 'Hồ Chí Minh'),
(3, 'Phòng Nhân sự', 3, 'Hải Phòng'),
(4, 'Phòng Marketing', 4, 'Đà Nẵng');


INSERT INTO NHANVIEN (MANV, TENNV, NGAYSINH, GT, MaPB)
VALUES
(1, 'Nguyễn Văn A', '1990-01-15', 'M', 1),
(2, 'Trần Thị B', '1988-06-20', 'F', 2),
(3, 'Lê Minh C', '1985-09-30', 'M', 3),
(4, 'Phan Thị D', '1992-02-10', 'F', 4),
(5, 'Ngô Văn E', '1987-12-05', 'M', 1),
(6, 'Vũ Minh F', '1995-03-12', 'M', 2),
(7, 'Dương Thị G', '1991-07-25', 'F', 3),
(8, 'Hoàng Văn H', '1983-11-18', 'M', 4),
(9, 'Phạm Thị I', '1994-05-08', 'F', 1),
(10, 'Bùi Minh J', '1990-04-22', 'M', 2);



INSERT INTO THAMGIA (MANV, MADA, NGAYBD, CHUCVU)
VALUES
(1, 1, '2023-01-01', 'Chủ nhiệm'),
(2, 1, '2023-02-01', 'Nhân viên'),
(3, 2, '2023-01-15', 'Chuyên viên'),
(4, 2, '2023-03-01', 'Trưởng nhóm'),
(5, 3, '2023-04-01', 'Nhân viên'),
(6, 3, '2023-05-01', 'Nhân viên'),
(7, 4, '2023-06-01', 'Chuyên gia'),
(8, 4, '2023-07-01', 'Nhân viên'),
(9, 5, '2023-08-01', 'Trưởng phòng'),
(10, 5, '2023-09-01', 'Nhân viên'),
(1, 3, '2023-10-01', 'Chủ nhiệm'),
(2, 4, '2023-11-01', 'Chuyên viên'),
(3, 5, '2023-12-01', 'Trưởng nhóm'),
(4, 1, '2024-01-01', 'Nhân viên'),
(5, 2, '2024-02-01', 'Nhân viên');



---- TRUY VAN DU LIEU---
 SELECT PB.MAPB, PB.TENPB, COUNT(*) AS SLNV
 FROM PHONGBAN PB JOIN NHANVIEN NV ON NV.MAPB = PB.MAPB
 GROUP BY PB.MAPB ,PB.TENPB  ;


 SELECT TG.MADA, DEAN.TENDA , COUNT(*) AS SLNV

 FROM DEAN JOIN THAMGIA TG ON TG.MADA = DEAN.MADA
 GROUP BY TG.MADA , DEAN.TENDA;

