<%@page import="java.util.*"%>
<%@page import="model.Cart"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Đăng nhập</title>
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
	integrity="sha384-7VPbUDkoPSGFnVtYi0QogXtr74QeVeeIs99Qx`x`fg5YCF+TidwNdjvaKZX19NZ/e6oz"
	crossorigin="anonymous"></script>
	
<style type="text/css">
body {
  background: #007bff;
  background: linear-gradient(to right, #CCFFFF, #33AEFF);
}

.card-img-left {
  width: 45%;
  /* Link to your background image using in the property below! */
  background: scroll center url('https://source.unsplash.com/WEQbe2jBg40/414x512');
  background-size: cover;
}

.btn-login {
  font-size: 0.9rem;
  letter-spacing: 0.05rem;
  padding: 0.75rem 1rem;
}

.btn-google {
  color: white !important;
  background-color: #ea4335;
}

.btn-facebook {
  color: white !important;
  background-color: #3b5998;
}

.red {
	color: red;
}

.dangnhap{
	font-weight: bold;
}

</style>

 <!-- Custom styles for this template -->
<%
String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
		+ request.getContextPath();

%>
    
</head>

<body>
  <div class="container">
    <div class="row">
      <div class="col-lg-10 col-xl-9 mx-auto">
        <div class="card flex-row my-5 border-0 shadow rounded-3 overflow-hidden">
          <div class="card-img-left d-none d-md-flex">
            <img class="mb-4" src="<%=url %>/img/logo/login.png" width="100%" height="100%">
          </div>
          <div class="card-body p-4 p-sm-5">
            <h5 class="card-title text-center mb-5 fw-light fs-5 dangnhap">ĐĂNG NHẬP</h5>
						<form action="dang-nhap" method="post">
						
						<%
					    	String baoLoi = request.getAttribute("baoLoi")+"";
					    	if(baoLoi.equals("null")){
					    		baoLoi = "";
					    	}
					    %>
						<div class="text-center mb-3 "><span class="red"><%=baoLoi %></span> </div>
						
							<div class="form-floating mb-3">
								<input type="text" class="form-control"
									id="tenDangNhap" placeholder="Tên đăng nhập" name="tenDangNhap" required
									autofocus> <label for="tenDangNhap">Tên
									Đăng Nhập</label>
							</div>

							<hr>

							<div class="form-floating mb-3">
								<input type="password" class="form-control"
									id="matKhau" placeholder="Mật khẩu" name="matKhau"> <label
									for="matKhau">Mật Khẩu</label>
							</div>
							
							<div class="form-check text-start my-3">
						      <input class="form-check-input" type="checkbox" value="remember-me" id="flexCheckDefault">
						      <label class="form-check-label" for="flexCheckDefault">
						        Ghi nhớ tài khoản
						      </label>
						    </div>

							<div class="d-grid mb-2">
								<button
									class="btn btn-lg btn-primary btn-login fw-bold text-uppercase"
									type="submit">Đăng Nhập</button>
							</div>

							<a class="d-block text-center mt-2 small" href="dangky.jsp">Đăng ký
								tài khoản mới</a>

							<hr class="my-4">

							<div class="d-grid mb-2">
								<button
									class="btn btn-lg btn-google btn-login fw-bold text-uppercase"
									type="submit">
									<i class="fab fa-google me-2"></i> ĐĂNG NHẬP VỚI GOOGLE
								</button>
							</div>

							<div class="d-grid">
								<button
									class="btn btn-lg btn-facebook btn-login fw-bold text-uppercase"
									type="submit">
									<i class="fab fa-facebook-f me-2"></i> ĐĂNG NHẬP VỚI FACEBOOK
								</button>
							</div>
						</form>
					</div>
        </div>
      </div>
    </div>
  </div>
</body>

</html>