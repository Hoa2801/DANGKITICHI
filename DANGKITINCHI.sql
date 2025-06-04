CREATE DATABASE DKYTINCHI
GO 
USE DKYTINCHI

CREATE TABLE NGANH (
manganh nvarchar(20) PRIMARY KEY ,
tennganh nvarchar(100)  )

ALTER TABLE NGANH 
ADD CONSTRAINT UQ_tennganh UNIQUE (tennganh);

INSERT INTO NGANH VALUES
(N'CNTT', N'CÔNG NGHỆ THÔNG TIN'),
(N'KTXD',N'KINH TẾ XÂY DỰNG'),
(N'CNOT',N'CÔNG NGHỆ OTO')
 DELETE NGANH WHERE  MANGANH = N'KTXD'

SELECT* FROM NGANH


CREATE TABLE KHOA(
makhoa nvarchar(20) PRIMARY KEY,
khoa nvarchar(20)
)

INSERT INTO KHOA VALUES
(N'K73',N'Khoá 73'),
(N'K74',N'Khóa 74 ')



CREATE TABLE HOCKY(
mahocky nvarchar(20) PRIMARY KEY,
tenhocky  nvarchar(20)
)
INSERT INTO HOCKY VALUES
(N'KY1',N'Học kỳ 1'),
(N'KY2',N'Học kỳ 2'),
(N'KY3',N'Học kỳ 3'),
(N'KY4',N'Học kỳ 4'),
(N'KY5',N'Học kỳ 5'),
(N'KY6',N'Học kỳ 6'),
(N'KY7',N'Học kỳ 7'),
(N'KY8',N'Học kỳ 8'),
(N'KY9',N'Học kỳ 9')


CREATE TABLE CTDT(
mactdt  nvarchar(20) PRIMARY KEY ,
makhoa nvarchar (20),
mamon nvarchar(20) UNIQUE,
tenmon nvarchar(100) ,
sotc int,
manganh nvarchar(20),
mahocky nvarchar(20),
FOREIGN KEY (manganh) REFERENCES NGANH(manganh),
FOREIGN KEY (makhoa) REFERENCES KHOA(makhoa),
FOREIGN KEY (mahocky) REFERENCES HOCKY(mahocky))
 
select * from ctdt

INSERT INTO CTDT  (mactdt,makhoa,mamon,tenmon,sotc,manganh,mahocky) VALUES 
(N'CTDT01',N'K73',N'23DC321',N'LẬP TRÌNH WEB',3,N'CNTT',N'KY1'),
(N'CTDT02',N'K73',N'33DC112',N'LẬP TRÌNH DI ĐỘNG',3,N'CNTT',N'KY1'),
(N'CTDT03',N'K73',N'32DC487',N'TRIẾT HỌC MÁC-LENIN',2,N'CNTT',N'KY1'),
(N'CTDT04',N'K73',N'27DC231',N'TRIẾT HỌC MÁC_LENIN',2,N'KTXD',N'KY2'),
(N'CTDT05',N'K73',N'33DC987',N'TOÁN CAO CẤP',3,N'KTXD',N'KY1'),
(N'CTDT06',N'K73',N'24DC241',N'PHÁP LUẬT ĐẠI CƯƠNG',2,N'CNOT',N'KY1'),
(N'CTDT07',N'K73',N'28DC331',N'VẬT LIỆU HỌC KĨ THUẬT',3,N'CNOT',N'KY2')

CREATE TABLE TAIKHOAN (
 tendangnhap nvarchar(20) PRIMARY KEY,
 matkhau int,
 ten nvarchar(30),
 gioitinh nvarchar(15),
 quequan nvarchar(100),
 donvi  nvarchar(20),
 chucvu  nvarchar(20),
 tinhtrang nvarchar(20),
 manganh nvarchar(20),
 makhoa nvarchar (20),
 mahocky nvarchar(20)

FOREIGN KEY (manganh) REFERENCES NGANH(manganh),
FOREIGN KEY (makhoa) REFERENCES KHOA(makhoa),
FOREIGN KEY (mahocky) REFERENCES HOCKY(mahocky)
);

INSERT INTO TAIKHOAN (tendangnhap,matkhau,ten,gioitinh,quequan,donvi,chucvu,tinhtrang,manganh) VALUES
(N'GVDCX0001','12345',N'Nguyễn Quang Tuấn',N'Nam',N'Hải Hậu - Nam Định',N'CNTT',N'Giảng viên',N'Đang giảng dạy', N'CNTT'),
(N'73DCTT23401','123',N'Nguyễn Quang Hòa ',N'Nam',N'Hải Hậu - Nam Định',N'73DCTT25',N'Sinh viên ',N'Đang học', N'CNTT'),
(N'73DCKX23456','1234',N'Nguyễn Bá Vương',N'Nam',N'Hà Nội',N'73DCKX21',N'Sinh viên ',N'Đang học', N'KTXD'),
(N'73DCOT12543','1234',N'Kim Văn Quý',N'Nam',N'Phủ Lý - Hà Nam',N'73DCOT21',N'Sinh viên ',N'Đang học', N'CNOT')



CREATE TABLE DANGKIHOC (
madk nvarchar(100) PRIMARY KEY,
mactdt nvarchar(20),
sisomax int,
ngayhoc VARCHAR(20)
FOREIGN KEY (mactdt) REFERENCES CTDT(mactdt)
)

INSERT INTO DANGKIHOC VALUES 
(N'DK01',N'CTDT01',60,N'T2,3 8h -12h P401.A2'),
(N'DK02',N'CTDT02',60,N'T4,5 13h-17h P402.A3'),
(N'DK03',N'CTDT03',100,N'T6,7 9h-12h P301.A5'),
(N'DK04',N'CTDT04',120,N'T3,4 9h -12h P201.A2'),
(N'DK05',N'CTDT05',45,N'T3,4 7h-10h P203.A2'),
(N'DK06',N'CTDT06',70,N'T2,3 8h -12h P501.A1'),
(N'DK07',N'CTDT07',60,N'T6,7 9h-12h P304.A6')




CREATE TABLE DADKY(
id nvarchar(20) PRIMARY KEY,
tendangnhap nvarchar(20), 
madk nvarchar(100),
FOREIGN KEY (tendangnhap) REFERENCES TAIKHOAN(tendangnhap),
FOREIGN KEY (madk) REFERENCES DANGKIHOC(madk)

)




CREATE TABLE DIEMTHI(
madiem int PRIMARY KEY IDENTITY,
tendangnhap nvarchar(20),
mamon nvarchar(20)  REFERENCES CTDT(mamon),
diem float,
trangthai nvarchar(20),
FOREIGN KEY (tendangnhap) REFERENCES TAIKHOAN(tendangnhap)
)

SELECT * FROM CTDT
select * from DANGKIHOC
SELECT * FROM TAIKHOAN
SELECT* FROM DADKY
SELECT * FROM GOPY




ALTER TABLE TAIKHOAN ADD ngaysinh date ;
 
 UPDATE TAIKHOAN
SET ngaysinh = '1995-05-12'
WHERE tendangnhap = 'GVDCX0001';

UPDATE TAIKHOAN
SET makhoa = 'K73', ngaysinh = '2004-01-28'
WHERE tendangnhap = '73DCTT23401';

UPDATE TAIKHOAN
SET makhoa = 'K73', ngaysinh = '2004-01-27'
WHERE tendangnhap = '73DCKX23456';

UPDATE TAIKHOAN
SET makhoa = 'K73', ngaysinh = '2004-11-7'
WHERE tendangnhap = '73DCOT12543';


SELECT dk.MADK, ctdt.MAMON, ctdt.TENMON, ctdt.SOTC, dk.SISOMAX, dk.NGAYHOC
FROM DANGKIHOC dk
JOIN CTDT ctdt ON dk.MACTDT = ctdt.MACTDT
JOIN TAIKHOAN tk ON ctdt.MANGANH = tk.MANGANH
WHERE tk.TENDANGNHAP = '73DCKX23456';  

INSERT INTO DADKY (id, tendangnhap, madk) VALUES (NEWID(),'73dctt23401', 'DK01')

ALTER TABLE DADKY DROP CONSTRAINT PK__DADKY__3213E83F5B517F26;
ALTER TABLE DADKY ALTER COLUMN id UNIQUEIDENTIFIER NOT NULL;
ALTER TABLE DADKY ADD CONSTRAINT PK_DADKY PRIMARY KEY (id);

CREATE TABLE THONGBAO (
noidung nvarchar(500),
tgian datetime
PRIMARY KEY(noidung,tgian))

CREATE TABLE GOPY(
    tendangnhap nvarchar(20),
    noidung nvarchar(450),
    times datetime,
    phanhoi nvarchar(450),
    FOREIGN KEY (tendangnhap) REFERENCES TAIKHOAN(tendangnhap),
    CONSTRAINT PK_GOPY PRIMARY KEY (tendangnhap)
);


UPDATE KHOA
SET khoa = 'Khóa 73'
WHERE makhoa = 'K73';
