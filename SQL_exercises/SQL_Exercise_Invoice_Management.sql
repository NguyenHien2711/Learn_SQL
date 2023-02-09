--Create database
CREATE DATABASE QuanLyHoaDon
on primary
(name = QuanLyHoaDon_data,
filename = 'D:\SQL\QuanLyHoaDon_data.mdf',
size =10MB,
maxsize = 50,
filegrowth = 5)
log on 
(name = QuanLyHoaDon_log,
filename = 'D:\SQL\QuanLyHoaDon_log.ldf',
size =10MB,
maxsize = 50,
filegrowth = 5)
--Create table 
use QuanLyHoaDon
create table tbSanPham (
MaSp nchar(10) primary key,
TenSp nvarchar(100) not null,
Dvt nvarchar(50) not null,
DonGia int not null,
SoLuongTon int not null
)

create table tbNhanVien (
MaNv nchar(6) primary key,
HoNv nvarchar(100) not null,
TenNv nvarchar(30) not null,
GioiTinhNv nvarchar(10),
NgaySinhNv datetime not null,
NgayNv datetime not null,
DiaChiNv nvarchar(150),
SoDtNv nchar(10),
EmailNv nvarchar(100)
)

create table tbHoaDon (
MaHd nchar(10) primary key,
MaKh nchar(6) not null,
MaNv nchar(6) not null,
NgayLapHd date default getdate(),
NgayNhanHang date default getdate()
)

create table tbChiTietHoaDon (
MaHd nchar(10) primary key,
MaSp nchar(10) not null,
SoLuong int not null,
)
create table tbKhachHang (
MaKh nchar(6) primary key,
HoKh nvarchar(100) not null,
TenKh nvarchar(50) not null,
DiaChiKh nvarchar(100),
EmailKh nchar(100),
SoDtKh nchar(10),
)
-- Sửa đơn giá và số lượng tồn thành kiểu float
alter table tbSanPham
alter column DonGia float not null
alter table tbSanPham
add constraint chktbSanPham
check (DonGia>=0)

--3. Viết câu lệnh Insert Into để nhập dữ liệu vào bảng
-- Bảng Nhân viên
delete tbNhanVien
insert into tbNhanVien values ('TN101',N'Nguyễn Hoàng', 'Anh', N'Nữ', '12/21/2001', '10/9/2020',N'TP Thủ Đức', '0365798712', 'lanhoangnguyen@gmail.com')
insert into tbNhanVien values ('TN102',N'Nguyễn Hoàng Lan', 'Vy', N'Nữ', '2/21/2000', '10/9/2020',N'TP Thủ Đức', '0966798702', 'vylanhoangnguyen@gmail.com')
insert into tbNhanVien values ('KT111',N'Trần Hải', N'Đăng', N'Nam', '12/21/1999', '10/9/2022',N'Bình Thạnh', '0905799710', 'haidangnguyen@gmail.com')
insert into tbNhanVien values ('MKT121',N'Lê Hoà', N'Bình', N'Nam', '10/2/1997', '1/20/2021',N'TP Thủ Đức', '0315708719', 'binhhoale@gmail.com')
insert into tbNhanVien values ('MK122',N'Nguyễn Lê Hải', 'Anh', N'Nữ', '12/21/2002', '10/9/2022',N'Gò Vấp', '0325790710', 'anhhailenguyen@gmail.com')
insert into tbNhanVien values ('TN103',N'Nguyễn Minh', N'Tuấn', N'Nam', '12/21/2002', '10/9/2022',N'Quận 3', '0925790719', 'tuanminhnguyen@gmail.com')
select * from tbNhanVien
-- Bảng Sản phẩm
insert into tbSanPham values ('8', N'Cambridge Ielts Practice', N'Cuốn', 100000, 100)
insert into tbSanPham values ('9', N'Sách tiếng trung luyện khẩu ngữ', N'Cuốn', 235000, 13)
insert into tbSanPham values ('10', N'Bí quyết nấu ngon', N'Cuốn', 93000, 9)
insert into tbSanPham values ('11', N'Mẹ và bé', N'Cuốn', 75000, 10)
insert into tbSanPham values ('12', N'Nhà giả kim', N'Cuốn', 65000, 77)
insert into tbSanPham values ('13', N'Hạnh phúc', N'Cuốn', 99000, 1)
insert into tbSanPham values ('14', N'Hướng dẫn trở thành người tốt', N'Cuốn', 99000, 100)
insert into tbSanPham values ('15', N'The subtle art of not giving the fuck', N'Cuốn', 278000, 100)
select * from tbSanPham
-- Bảng Khách Hàng
insert into tbKhachHang values ('KH0001', N'Vũ Minh', N'Tuấn', N'TP Thủ Đức', 'tuanmv@gmail.com', '0355573733')
insert into tbKhachHang values ('KH0002', N'Trần Hoành', N'Quốc', N'Quận 2', 'quochoanh@gmail.com', '0352573434')
insert into tbKhachHang values ('KH0003', N'Trần Hải', N'Hà', N'Bình Thạnh', 'hahaitran@gmail.com', '0355473743')
insert into tbKhachHang values ('KH0004', N'Nguyễn Thị Thanh', N'Thủy', N'TP Thủ Đức', 'thuy@gmail.com', '0955673733')
insert into tbKhachHang values ('KH0005', N'Vũ Hà', N'Trang', N'Thủ Dầu Một', 'trangvuha@gmail.com', '0912373733')
select * from tbKhachHang
-- Bảng Hoá đơn
insert into tbHoaDon values ('12421','KH0001', 'TN103', '11/22/2022', '11/22/2022')
insert into tbHoaDon values ('12422','KH0002', 'TN103', '11/23/2022', '11/24/2022')
insert into tbHoaDon values ('12423','KH0003', 'TN101', '12/24/2022', '12/24/2022')
insert into tbHoaDon values ('12424','KH0004', 'TN102', '12/25/2022', '12/25/2022')
insert into tbHoaDon values ('12425','KH0005', 'TN101', '12/26/2022', '12/27/2022')
insert into tbHoaDon values ('12426','KH0001', 'TN103', '12/13/2022', '12/27/2022')
insert into tbHoaDon values ('12427','KH0005', 'TN101', '12/26/2022', '12/27/2022')

select * from tbHoaDon
--Bảng chi tiết hóa đơn
insert into tbChiTietHoaDon values ('12421','13', 2)
insert into tbChiTietHoaDon values ('12422','15', 1)
insert into tbChiTietHoaDon values ('12423','11', 1)
insert into tbChiTietHoaDon values ('12424','8', 2)
insert into tbChiTietHoaDon values ('12425','9', 3)
insert into tbChiTietHoaDon values ('12426','10', 1)
insert into tbChiTietHoaDon values ('12427','9', 5)
select * from tbChiTietHoaDon

--4. Cập nhật lại số điện thoại của nhân viên Nguyễn Hoàng Anh: 091232323 
update tbNhanVien
set SoDtNv = '091232323'
where HoNv + ' '+ TenNv = N'Nguyễn Hoàng Anh'
--5. Cập nhật lại tên sản phẩm “Mẹ và bé” thành “Câu chuyện về mẹ và em bé” 
update tbSanPham
set TenSp = N'Câu chuyện về mẹ và em bé'
where TenSp = N'Mẹ và bé'
--6. Cập nhật giá của sản phẩm có mã là 8: 17500
update tbSanPham
set DonGia = 17500
where MaSp = '8'
--7. Cập  nhật  địa  chỉ  email  của  khách  hàng  có  tên  là  Trần  Hoành  Quốc  là quochoanh123@gmail.com 
update tbKhachHang 
set EmailKh = 'quochoanh123@gmail.com'
where HoKh + ' '+ TenKh = N'Trần  Hoành  Quốc'
--8. Xóa sản phẩm có mã 13 
delete from tbSanPham where MaSp = '13'
--9. Hiển thị danh sách nhân viên gồm các thông tin: Mã nhân viên, Họ, Tên, Giới tính, Nơi sinh.  
select MaNv, HoNv, TenNv, GioiTinhNv, DiaChiNv from tbNhanVien
--10. Hiển thị tất cả các thông tin về nhân viên và sắp xếp theo ngày sinh tăng dần. 
select * from tbNhanVien order by NgaySinhNv asc
--11. Liệt kê thông tin của tất cả các nhân viên nam và sắp xếp theo ngày sinh giảm dần 
select * from tbNhanVien where GioiTinhNv = 'Nam' order by NgaySinhNv asc
--12. Cho biết địa chỉ và số điện thoại của khách hàng có mã KH0003 
select DiaChiKh, SoDtKh from tbKhachHang where MaKh = 'KH0003'
--13. Cho biết tất cả các hóa đơn do nhân viên Nguyễn Minh Tuấn lập 
--14. Cho biết tổng số nhân viên 
select count(*) as N'Tổng nhân viên' from tbNhanVien
--15. Cho biết tổng số khách hàng 
select count(*) as N'Tổng khách hàng' from tbKhachHang
--16. Cho biết tổng số nhân viên nữ 
select count(*) as N'Tổng nhân viên nữ' from tbNhanVien where GioiTinhNv = N'Nữ'
--17. Cho biết tổng số nhân viên nam 
select count(*) as N'Tổng nhân viên nam' from tbNhanVien where GioiTinhNv = N'Nam'
--18. Tìm tất cả các nhân viên nữ và các hóa đơn mà họ đã lập 
select * from tbHoaDon where MaNv in 
(select MaNv from tbNhanVien where GioiTinhNv = N'Nữ')
--19. Cho biết mỗi khách hàng đã đặt bao nhiêu hóa đơn. 
select MaKh, count(MaHd) as N'Số hóa đơn'from tbHoaDon group by MaKh
--20. Cho biết tổng số tiền các hóa đơn của tháng 11/2022. 
select Trigia = sum(SoLuong*DonGia) from tbChiTietHoaDon CTHD, tbSanPham SP
where CTHD.MaHd in (select MaHd from tbHoaDon where year(NgayLapHd) = 2022 and month(NgayLapHd)=12) and CTHD.MaSp = SP.MaSp
--21. Cho biết tổng số hoá đơn theo từng loại sản phẩm.  
select MaSp, SoHoaDon=count(MaHd) from tbChiTietHoaDon group by MaSp
--22. Cho biết danh sách nMaSphững nhân viên (Họ, Tên) lập trên 2 hóa đơn 
select MaNv, HoTen = HoNv + ' ' + TenNv from tbNhanVien 
where MaNv in (select MaNv from tbHoaDon group by MaNv having count(MaNv) >2)
--23. Cho biết các thông tin về sản phẩm chưa có hóa đơn nào. 
select * from tbSanPham where MaSp not in (select distinct MaSp from tbChiTietHoaDon)
--24. Cho biết họ tên nhân viên chưa lập hóa đơn nào 
select MaNv, HoTen = HoNv + ' ' + TenNv from tbNhanVien 
where MaNv not in (select distinct MaNv from tbHoaDon) 
--25. Cho biết các thông tin về sản phẩm có tổng số  hóa đơn cao nhất. 
select * from tbSanPham where MaSp in 
(select MaSp from tbChiTietHoaDon
group by MaSp 
having count(MaSp) >= all(select count(MaSp) from  tbChiTietHoaDon group by Masp))

--26. Cho biết khách hàng nào có nhiều hóa đơn nhất.  
--select * from  tbKhachHang where MaKh in 
select * from tbKhachHang where MaKh in 
(select MaKh from tbHoaDon 
group by MaKh
having count(MaKh) >= all(select count(MaKh) from tbHoaDon group by MaKh))
--27. Cho biết họ tên nhân viên lập được nhiều hóa đơn nhất. 
select * from tbNhanVien where MaNv in 
(select MaNv from tbHoaDon 
group by MaNv
having count(MaNv) >= all(select count(MaNv) from tbHoaDon group by MaNv))
--28. Cho biết khách hàng nào có ít hóa đơn nhất 
select * from tbKhachHang where MaKh in 
(select MaKh from tbHoaDon 
group by MaKh
having count(MaKh) <= all(select count(MaKh) from tbHoaDon group by MaKh))
--29. Cho biết họ tên nhân viên lập được ít hóa đơn nhất. 
select * from tbNhanVien where MaNv in 
(select MaNv from tbHoaDon 
group by MaNv
having count(MaNv) >= all(select count(MaNv) from tbHoaDon group by MaNv))
