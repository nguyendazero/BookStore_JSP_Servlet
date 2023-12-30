<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
KhachHang kh = (KhachHang) request.getSession().getAttribute("detailUser");
if(kh.getTenDangNhap().equals("admin")){
	kh.setHoVaTen("Nguyễn Đa Đa");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Thông tin khách hàng</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">
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
</head>
<body>
	<%@include file="../headerAdmin.jsp" %>
	<div class="container" style="margin-top: 60px;">
		<section style="background-color: #eee;">
  <div class="container py-5">
    <div class="row">
      <div class="col">
        <nav aria-label="breadcrumb" class="bg-light rounded-3 p-3 mb-4">
          <ol class="breadcrumb mb-0">
            <li class="breadcrumb-item"><a href="quanlykhachhang.jsp">Tất cả</a></li>
            <li class="breadcrumb-item active" aria-current="page">User Profile</li>
          </ol>
        </nav>
      </div>
    </div>

    <div class="row">
      <div class="col-lg-4">
        <div class="card mb-4">
          <div class="card-body text-center">
          <%
          String src = kh.getGioiTinh().equals("Nam") ? "img/user/nam.png" : "img/user/nu.png";
          %>
            <img src=<%=kh.getTenDangNhap().equals("admin") ? "https://bootdey.com/img/Content/avatar/avatar1.png" : src %> alt="avatar"
              class="rounded-circle img-fluid" style="width: 150px; margin-top: 9px;">
            <h5 class="my-3"><%=kh.getTenDangNhap().equals("admin") ? "Quản trị viên cao cấp" : kh.getHoVaTen()%></h5>
            <h5 class="text-muted mb-1">Vai trò:  <%=kh.getRole().equals("0") ? "Khách hàng":"Quản trị viên"%></h5>
            <div class="d-flex justify-content-center mb-2" style="margin-top: 24px;">
              <button type="button" class="btn btn-primary">Follow</button>
              <button type="button" class="btn btn-outline-primary ms-1">Message</button>
            </div>
          </div>
        </div>
      </div>
      
      <div class="col-lg-8">
        <div class="card mb-4">
          <div class="card-body">
            <div class="row">
              <div class="col-sm-3">
                <p class="mb-0">Họ và Tên</p>
              </div>
              <div class="col-sm-9">
                <p class="text-muted mb-0"><%=kh.getHoVaTen() %></p>
              </div>
            </div>
            <hr>
            <div class="row">
              <div class="col-sm-3">
                <p class="mb-0">Email</p>
              </div>
              <div class="col-sm-9">
                <p class="text-muted mb-0"><%=kh.getEmail() %></p>
              </div>
            </div>
            <hr>
            <div class="row">
              <div class="col-sm-3">
                <p class="mb-0">Số điện thoại</p>
              </div>
              <div class="col-sm-9">
                <p class="text-muted mb-0"><%=kh.getSoDienThoai() %></p>
              </div>
            </div>
            <hr>
            <div class="row">
              <div class="col-sm-3">
                <p class="mb-0">Ngày sinh</p>
              </div>
              <div class="col-sm-9">
                <p class="text-muted mb-0"><%=kh.getNgaySinh() %></p>
              </div>
            </div>
            <hr>
            <div class="row">
              <div class="col-sm-3">
                <p class="mb-0">Địa chỉ</p>
              </div>
              <div class="col-sm-9">
                <p class="text-muted mb-0"><%=kh.getDiaChi() %></p>
              </div>
            </div>
            <hr>
            <div class="row">
              <div class="col-sm-3">
                <p class="mb-0">Giới tính</p>
              </div>
              <div class="col-sm-9">
                <p class="text-muted mb-0"><%=kh.getGioiTinh() %></p>
              </div>
            </div>
          </div>
        </div>
        
      </div>
    </div>
  </div>
</section>
	</div>
</body>
</html>