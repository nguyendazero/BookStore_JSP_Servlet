 <%@page import="database.JDBCUtil"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.List"%>
<%@page import="model.Cart"%>
<%@page import="java.util.*"%>
<%@page import="model.Product"%>
<%@page import="database.ProductDAO"%>
<%@page import="model.KhachHang"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%


%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Quản lý cửa hàng</title>
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
        /* Định dạng kiểu chữ cho tiêu đề "Tất cả sản phẩm" */
    .product-heading {
        background-color: #FFFF99;
	    color: #FF3333;
	    padding: 10px;
	    text-align: center;
	    border-radius: 10px;
	    font-size: 30px; /* Kích thước font tăng lên */
	    font-family: "Segoe UI", Arial, sans-serif; /* Loại font chữ */
	    font-weight: bold; /* Độ đậm, có thể không cần thiết nếu sử dụng font chữ in đậm */
	    border: 4px solid green; /* Tạo khung màu xanh xung quanh */
	    
    }

	/* Định dạng cho thanh menu bên trái */
.sidebar {
    width: 300px;
    background-color: #333;
    position: fixed;
    height: 100%;
    overflow: auto;
    padding-top: 30px; /* Thêm khoảng cách ở đầu sidebar */
}

.sidebar ul {
    list-style: none;
    padding: 0;
}

.sidebar li {
    padding: 10px;
    text-align: center;
    transition: background-color 0.3s; /* Hiệu ứng hover */
}

.sidebar li:hover {
    background-color: #555; /* Màu nền khi hover */
}

.sidebar a {
    text-decoration: none;
    color: #fff;
    display: block;
}

/* Định dạng cho nội dung của trang admin */
.content {
    margin-left: 250px;
    padding: 20px;
}

/* Định dạng cho tiêu đề trong nội dung */
.content h1 {
    font-size: 24px;
    margin-bottom: 20px;
    color: #333;
}



/* Định dạng cho bảng dữ liệu */
.table {
    width: 100%;
    border-collapse: collapse;
}

.table th, .table td {
    padding: 10px;
    border: 1px solid #ddd;
    text-align: left;
}

.table th {
    background-color: #333;
    color: #fff;
}

/* Định dạng cho các nút trong bảng dữ liệu */
.table button {
    padding: 5px 10px;
    border: none;
    background-color: #333;
    color: #fff;
    cursor: pointer;
}

/* Định dạng cho thông báo hoặc thông điệp */
.alert {
    padding: 10px;
    background-color: #ffcccb;
    color: #c43e38;
    margin-bottom: 20px;
}

    
</style>
</head>
<body>
	<!-- header -->
	
	<%
		Object obj = session.getAttribute("khachHang");
		KhachHang khachHang = null;
		if (obj!=null)
			khachHang = (KhachHang)obj;		
			if(khachHang!=null){	
				if(khachHang.getRole().equals("0")){
	%>
				<h1 class="text-center">Bạn không được cấp quyền vào trang này.</h1>
				<a href="index.jsp" style="margin-left: 700px;">quay lại trang chủ</a>
	<%
				}else {
				
	%>
	<jsp:include page="headerAdmin.jsp"></jsp:include>
	<div class="sidebar mt-4">
        <ul>
            <li><a href="#">Điều Khiển</a></li>
            <li><a href="quanlysanpham.jsp">Sản Phẩm</a></li>
            <li><a href="#">Đơn Hàng</a></li>
            <li><a href="quanlykhachhang.jsp">Khách Hàng</a></li>
            
            <hr style="margin-top: 400px;">
            <li><a href="#"><i class="fas fa-cogs"></i>Cài Đặt</a></lis>
        </ul>
    </div>
    <div class="content">
        <!-- Your admin content goes here -->
    </div>
	
	<!-- Page content -->
	<div class="container mt-4">
		<div class="row">

			<!-- Slider and Products -->
			<div class="col-lg-9"  style="margin-top: 10px; margin-left: 330px;">
				<!-- Slider -->
				<div id="carouselExampleIndicators" class="carousel slide mb-4" data-bs-ride="true">
					<div class="carousel-indicators">
						<button type="button" data-bs-target="#carouselExampleIndicators"
							data-bs-slide-to="0" class="active" aria-current="true"
							aria-label="Slide 1"></button>
						<button type="button" data-bs-target="#carouselExampleIndicators"
							data-bs-slide-to="1" aria-label="Slide 2"></button>
						<button type="button" data-bs-target="#carouselExampleIndicators"
							data-bs-slide-to="2" aria-label="Slide 3"></button>
					</div>
					<div class="carousel-inner">
						<div class="carousel-item active">
							<img src="img/slider/b1.png" class="d-block w-100" alt="...">
						</div>
						<div class="carousel-item">
							<img src="img/slider/b2.png" class="d-block w-100" alt="...">
						</div>
						<div class="carousel-item">
							<img src="img/slider/b3.png" class="d-block w-100" alt="...">
						</div>
					</div>
					<button class="carousel-control-prev" type="button"
						data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
						<span class="carousel-control-prev-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Previous</span>
					</button>
					<button class="carousel-control-next" type="button"
						data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
						<span class="carousel-control-next-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Next</span>
					</button>
				</div>
				<!-- End Slider -->
				<div class="text-center mb-3 product-heading">
				    <h2>QUẢN LÝ CỬA HÀNG</h2>
				</div>
				
				<div class="row">
					
				</div>

	<!-- footer -->
	<%@include file="footer.jsp"%>
		<%}%>
	<%}else{ %>
		<h1 class="text-center">Bạn chưa đăng nhập với tư cách quản trị viên!</h1>
		<a href="dangnhap.jsp" style="margin-left: 700px;">Đăng nhập vào hệ thống</a>
	<%} %>
</body>
</html>