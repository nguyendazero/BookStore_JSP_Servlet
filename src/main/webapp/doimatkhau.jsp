<%@page import="model.KhachHang"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Đổi Mật Khẩu</title>
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
<style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(to right, #228B22, #98FB98);
        }

        .container {
            background-color: #F0FFF0;
            padding: 20px;
            border-radius: 5px;
            margin-top: 100px;
            box-shadow: 0px 0px 5px 0px #888;
            max-width: 500px; /* Giới hạn chiều rộng */
            
        }

        h1 {
            //color: #333;
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

        .form-group {
            margin-bottom: 20px;
        }

        label {
            font-weight: bold;
        }

        input[type="password"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 3px;
        }

        button.btn-primary {
            background-color: #007bff;
            color: #fff;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            display: block;
            margin: 0 auto; /* Đặt margin để căn giữa theo chiều ngang */
            transition: background-color 0.3s; /* Hiệu ứng chuyển đổi màu sau 0.3 giây */
        }

        button.btn-primary:hover {
            background-color: #007f3e;
        }

        span {
            color: red;
        }
    </style>
</head>
<body>
	
<div>
	 <%
		Object obj = session.getAttribute("khachHang");
		KhachHang khachHang = null;
		if (obj!=null)
			khachHang = (KhachHang)obj;		
			if(khachHang==null){		
	%>
	<h1>Bạn chưa đăng nhập vào hệ thống. Vui lòng quay lại trang chủ!</h1>
	<a href="index.jsp" style="margin-left: 650px;">Quay lại trang chủ</a>
	<br>
	<a href="dangnhap.jsp" style="margin-left: 650px;">Đăng nhập vào hệ thống</a>
	<%
			}else {
				String baoLoi = request.getAttribute("baoLoi")+"";
				if(baoLoi.equals("null")){
					baoLoi = "";
				}
	%>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="container">
		<h1><i class="fas fa-key"></i>ĐỔI MẬT KHẨU</h1>
		<span style="color: red">
			<%=baoLoi %>
		</span>
			<form action="doi-mat-khau" method="post">
				
				  <div class="form-group">
				    <label for="matKhauHienTai">Mật khẩu hiện tại</label>
				    <input type="password" class="form-control" id="matKhauHienTai" name="matKhauHienTai">
				  </div>
				  <div class="form-group">
				    <label for="matKhauMoi">Mật khẩu mới</label>
				    <input type="password" class="form-control" id="matKhauMoi" name="matKhauMoi">
				  </div>
				 <div class="form-group">
				    <label for="matKhauMoiNhapLai">Nhập lại mật khẩu mới</label>
				    <input type="password" class="form-control" id="matKhauMoiNhapLai" name="matKhauMoiNhapLai">
				  </div>
				  <button type="submit" class="btn btn-primary">Lưu mật khẩu</button>
			</form>
	</div>
	<%}%>
</body>
</html>