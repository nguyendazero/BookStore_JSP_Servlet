<%@page import="model.KhachHang"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Thông tin</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
	integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.min.js"
	integrity="sha384-7VPbUDkoPSGFnVtYi0QogXtr74QeVeeIs99Qfg5YCF+TidwNdjvaKZX19NZ/e6oz"
	crossorigin="anonymous"></script>
	
<style type="text/css">
	.red{
		color: red;
	}
	/* Định dạng trang web chính */
    body {
        font-family: Arial, sans-serif;
        background-color: #f7f7f7;
        background: linear-gradient(to right, #228B22, #98FB98);
    }
    .container {
        background-color: #F0FFF0;
        padding-top: 5px;
        margin-top: 30px;
    }
    h1 {
        background-color: #FFFF99;
	    color: #FF3333;
	    padding: 10px;
	    text-align: center;
	    border-radius: 10px;
	    font-size: 30px; /* Kích thước font tăng lên */
	    font-family: "Segoe UI", Arial, sans-serif; /* Loại font chữ */
	    font-weight: bold; /* Độ đậm, có thể không cần thiết nếu sử dụng font chữ in đậm */
	    border: 2px solid #00FF00; /* Tạo khung màu xanh xung quanh */
    }
    h3 {
        background-color: #F0F0F0;
	    color: #000;
	    padding: 10px;
	    text-align: center;
	    border-radius: 10px;
	    font-size: 30px; /* Kích thước font tăng lên */
	    font-family: "Segoe UI", Arial, sans-serif; /* Loại font chữ */
	    font-weight: bold; /* Độ đậm, có thể không cần thiết nếu sử dụng font chữ in đậm */
	    border: 2px solid #000; /* Tạo khung màu xanh xung quanh */
    }
    
    /* Định dạng các input và select */
    input[type="text"],
    input[type="date"],
    input[type="tel"],
    input[type="email"],
    select {
        width: 100%;
        border: 1px solid #ccc;
    }

    /* Định dạng nút Lưu thông tin */
    .btn-primary {
    	height: 45px;
    	margin-top: 30px;
        background-color: #007bff;
        color: #fff;
        padding: 10px 20px;
        cursor: pointer;
        width: 100%;
    }
	
	.gioiTinh {
       height: 45px;
    }
	
    /* Định dạng checkbox */
    .form-check-input{
        margin-left: 10px;
    }
    
    .form-label{
    	font-weight: bold;
    }
    
    /* Tùy chỉnh màu sắc cho select và option */
    select {
        background-color: #f8f8f8;
    }
    
    select option {
        background-color: #f8f8f8;
    }
</style>
</head>
<body>

<div class="container">
	 <%
		Object obj = session.getAttribute("khachHang");
		KhachHang khachHang = null;
		if (obj!=null)
			khachHang = (KhachHang)obj;		
			if(khachHang==null){		
	%>
	<h1>Bạn chưa đăng nhập vào hệ thống. Vui lòng quay lại trang chủ!</h1>
	<a href="index.jsp" style="margin-left: 500px;">Quay lại trang chủ</a>
	<br>
	<a href="dangnhap.jsp" style="margin-left: 500px;">Đăng nhập vào hệ thống</a>
	
	<%
			}else {
				
	%>
	<%
		String baoLoi = request.getAttribute("baoLoi")+"";
		baoLoi = (baoLoi.equals("null"))?"" : baoLoi;
		
		
		String hoVaTen = khachHang.getHoVaTen();
	
		
		String gioiTinh= khachHang.getGioiTinh();
		
		
		String ngaySinh = khachHang.getNgaySinh().toString();
		
		
		String diaChi = khachHang.getDiaChi();
		
		
		String diaChiMuaHang = khachHang.getDiaChiMuaHang();
		
		
		String diaChiNhanHang = khachHang.getDiaChiNhanHang();
		
		
		String dienThoai = khachHang.getSoDienThoai();
		
		
		String email = khachHang.getEmail();
		
		
		boolean dongYNhanMail = khachHang.isDangKyNhanBangTin();
	%>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="container p-4">
		<div class="text-center">
			<h1><i class="fas fa-user"></i>THÔNG TIN TÀI KHOẢN</h1>
		</div>
		<div class="red" id="baoLoi">
			<%=baoLoi %>
		</div>
		<form action="thay-doi-thong-tin" method="post" >
			
			<div class="row">
				
				<div class="col">
					<h3>Địa chỉ khách hàng</h3>
					
					<div class="mb-3">
					  <label for="diaChi" class="form-label">Địa chỉ khách hàng</label>
					  <input type="text" class="form-control" id="diaChi" name="diaChi" value="<%=diaChi %>">
					</div>
					
					<div class="mb-3">
					  <label for="diaChiNhanHang" class="form-label">Địa chỉ nhận hàng</label>
					  <input type="text" class="form-control" id="diaChiNhanHang" name="diaChiNhanHang" value="<%=diaChiNhanHang %>">
					</div>
					
					<div class="mb-3">
					  <label for="diaChiMuaHang" class="form-label">Địa chỉ mua hàng</label>
					  <input type="text" class="form-control" id="diaChiMuaHang" name="diaChiMuaHang" value="<%=diaChiMuaHang %>">
					</div>
					
					<div class="mb-3">
					  <label for="dienThoai" class="form-label1">Điện thoại</label>
					  <input type="tel" class="form-control" id="dienThoai" name="dienThoai" value="<%=dienThoai %>">
					</div>
					
					<div class="mb-3">
					  <label for="email" class="form-label">Email</label>
					  <input type="email" class="form-control" id="email" name="email" value="<%=email %>">
					</div>
				</div>	
				<div class="col">
					<h3>Thông tin khách hàng</h3>
					
					<div class="mb-3">
					  <label for="hoVaTen" class="form-label">Họ và Tên</label>
					  <input type="text" class="form-control" id="hoVaTen" name="hoVaTen" value="<%=hoVaTen %>">
					</div>
					
					<div class="mb-3">
					  <label for="ngaySinh" class="form-label">Ngày Sinh</label>
					  <input type="date" class="form-control" id="ngaySinh" name="ngaySinh" value="<%=ngaySinh %>">
					</div>
					
					<div class="mb-3">
					  <label for="gioiTinh" class="form-label">Giới tính</label>
					  <select class="form-control gioiTinh" id="gioiTinh" name="gioiTinh">
					  		<option></option>
					  		<option value="Nam" <%=(gioiTinh.equals("Nam"))?"selected='selected'":"" %> >Nam</option>
					  		<option value="Nữ" <%=(gioiTinh.equals("Nữ"))?"selected='selected'":"" %>>Nữ</option>
					  		<option value="Khác" <%=(gioiTinh.equals("Khác"))?"selected='selected'":"" %>>Khác</option>
					  </select>
					</div>
					
					
					
					<br>
					<hr>
					<div class="mb-3">
					  <label for="dongYNhanMail" class="form-label1">Đồng ý nhận email</label>
					  <input type="checkbox" class="form-check-input1" id="dongYNhanMail" name="dongYNhanMail" <%=(dongYNhanMail?"checked":"") %> >
					</div>
					<input class="btn btn-primary" type="submit" value="Lưu Thông Tin" name="submit" id="submit" />
				</div>
			</div>
		</form>
	</div>
	</div>
	<%} %>
</body>
</html>