<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
   <style>


/* Background color and padding */
.container-fluid {
    background-color: #FFFF99; /* Đổi màu nền theo ý muốn */
}

/* Navbar brand (logo) */
.navbar-brand img {
    max-height: 50px; /* Tùy chỉnh chiều cao tối đa của logo */
}

/* Navigation links (navbar items) */
.navbar-nav .nav-link {
    color: green; /* Màu chữ cho các liên kết */
    font-weight: bold; /* Đậm chữ */
	padding-right: 0;
	padding-left: 0;
}
.navbar-nav .nav-link:hover {
    background-color: #006633; /* Màu nền khi di chuột qua các mục trong menu dropdown */
    color: white; /* Màu chữ khi di chuột qua các mục trong menu dropdown */
    border-radius: 5px;
    
}

/* Active link (current page) */
.navbar-nav .nav-link.active {
    background-color: #0056b3; /* Màu nền cho liên kết hiện tại */
    border-radius: 5px; /* Bo tròn góc cho liên kết hiện tại */
    color: white; /* Màu chữ cho liên kết hiện tại */
}

/* Button style for "Đăng nhập" */
.navbar .btn-primary {
    background-color: #28a745; /* Màu nền cho nút "Đăng nhập" */
    color: white; /* Màu chữ cho nút "Đăng nhập" */
    font-weight: bold; /* Đậm chữ */
    margin-right: 10px; /* Tùy chỉnh khoảng cách giữa nút và các liên kết */
    margin-left: 20px; 
}

/* Dropdown menu */
.navbar .dropdown-menu {
    background-color: #F0FFF0; /* Màu nền cho menu dropdown */
    box-shadow: 0px 0px 5px 0px #888;
}

/* Dropdown items */
.navbar .dropdown-item {
    color: green; /* Màu chữ cho các mục trong menu dropdown */
    font-weight: bold; /* Đậm chữ */
}

/* Dropdown items on hover */
.navbar .dropdown-item:hover {
    color: white; /* Màu chữ khi di chuột qua các mục trong menu dropdown */
    background-color: #006633; /* Màu nền khi di chuột qua các mục trong menu dropdown */
}

/* Additional styles for your specific elements can be added as needed. */

/* Navbar text input and button style (for the search bar) */
.navbar .form-control {
    border: 3px solid green; /* Viền input */
    background-color: transparent; /* Màu nền trong suốt */
    color: white; /* Màu chữ */
    font-weight: bold; /* Đậm chữ */
    margin-right: 10px; /* Tùy chỉnh khoảng cách giữa input và nút Tìm */
}

/* Button style for the search */
.navbar .btn-outline-success {
    border: 0px solid black; /* Viền nút */
    color: #28a745; /* Màu chữ */
    font-weight: bold; /* Đậm chữ */
}

.navbar .form-control:focus, .navbar .form-control {
    color: black; /* Đặt màu chữ là màu đen khi input được focus */
}

i{
	margin-right:7px;
}
.fa-search{
	margin-left:7px;
}
</style>
    <%
    String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
	+ request.getContextPath();
    %>
<!-- Navbar -->
	<%@page import="model.KhachHang"%>
<nav class="navbar navbar-expand-lg bg-light" style="height: 50px; text-align: center;  position: fixed; top: 0; left: 0; right: 0; z-index: 100;">
		<div class="container-fluid">
			<a class="navbar-brand" href="#"> <img
				src="https://iweb.tatthanh.com.vn/pic/3/blog/images/logo-sach(58).jpg"
				alt="Bootstrap" height="40" width="50">
			</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link active" aria-current="page" href="<%=url %>/index.jsp">Trang chủ</a></li>
					<li class="nav-item"><a class="nav-link" href="<%=url %>/giamgia.jsp">Giảm giá</a></li>
					<li class="nav-item"><a class="nav-link" href="<%=url %>/hethang.jsp">Hết hàng</a>
					<li class="nav-item"><a class="nav-link" href="<%=url %>/hotproduct.jsp">Sản phẩm hot</a></li>
				    <li class="nav-item"><a class="nav-link" href="<%=url %>/cart.jsp">Giỏ hàng<span class="badge badge-danger" style="background-color: red">${cart_list.size()}</span></a></li>
					</li>
				</ul>
				<form action="search" method="get" class="d-flex m-0" role="search">
					<input value="${txtS}" name="txt" class="form-control me-2" type="text" placeholder="Nội dung tìm kiếm" aria-label="Search">
					<button class="btn btn-outline-success" type="submit">
						<i class="fa fa-search"></i>
					</button>
					<%
						Object obj = session.getAttribute("khachHang");
						KhachHang khachHang = null;
						if(obj != null){
							khachHang = (KhachHang)obj;
						}
						
						if(obj == null){
					%>
					<a class="btn btn-primary" style="white-space: nowrap;" href="dangnhap.jsp">
						Đăng nhập
					</a>
					<%}else{ %>
					<ul class="navbar-nav me-auto mb-2 mb-lg-0 bg-infor ">
						<li class="nav-item dropstart"><a
							class="nav-link dropdown-toggle" href="#" role="button"
							data-bs-toggle="dropdown" aria-expanded="false">Tài khoản</a>
							<ul class="dropdown-menu">
								<li><a class="dropdown-item" href="<%=url %>/cart.jsp"><i class="fas fa-shopping-cart"></i>Giỏ hàng của tôi <span class="badge badge-danger" style="background-color: red">${cart_list.size()}</span> </a></li>
								<li><a class="dropdown-item" href="<%=url %>/orders.jsp"><i class="fas fa-shopping-bag"></i>Đơn hàng đã đặt</a></li>
								<li><a class="dropdown-item" href="#"><i class="fas fa-bell"></i>Thông báo</a></li>
								<li><a class="dropdown-item" href="<%=url %>/thaydoithongtin.jsp"><i class="fas fa-user-edit"></i>Thay đổi thông tin</a></li>
								<li><a class="dropdown-item" href="<%=url %>/doimatkhau.jsp"><i class="fas fa-key"></i>Đổi mật khẩu</a></li>
								<li><hr class="dropdown-divider"></li>
								<li><a class="dropdown-item" href="dang-xuat"><i class="fas fa-sign-out-alt"></i>Thoát tài khoản</a></li>
							</ul></li>
					</ul>
					</div>
					<%} %>
				</form>
			</div>
		</div>
	</nav>
	<!-- End Navbar -->