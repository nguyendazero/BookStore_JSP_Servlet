<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Đăng ký</title>
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
body{
	background: linear-gradient(to right, #228B22, #98FB98);
}
	.red{
		color: red;
	}
	/* Định dạng container chứa nội dung trang */
.container {
    max-width: 1000px;
    margin-top: 70px;
    padding: 20px;
    background-color: #F0FFF0;
    border: 1px solid #ddd;
    border-radius: 5px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.dktk{
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

.tk-dc{
	margin-top: 10px;
}

.tk-dc, .ttkh{
        background-color: #FFFF99;
	    color: #FF3333;
	    padding: 10px;
	    text-align: center;
	    border-radius: 10px;
	    font-size: 20px; /* Kích thước font tăng lên */
	    font-family: "Segoe UI", Arial, sans-serif; /* Loại font chữ */
	    font-weight: bold; /* Độ đậm, có thể không cần thiết nếu sử dụng font chữ in đậm */
	    border: 2px solid #00FF00; /* Tạo khung màu xanh xung quanh */
}

.form-label{
	font-weight: bold;
}

</style>
</head>
<body>
	<%@include file="header.jsp" %>
	
	<%
		String baoLoi = request.getAttribute("baoLoi")+"";
		baoLoi = (baoLoi.equals("null"))?"" : baoLoi;
		
		String tenDangNhap = request.getAttribute("tenDangNhap")+"";		
		tenDangNhap = (tenDangNhap.equals("null"))?"" : tenDangNhap;
		
		String hoVaTen = request.getAttribute("hoVaTen"+"")+"";
		hoVaTen = (hoVaTen.equals("null"))?"" : hoVaTen;
		
		String gioiTinh= request.getAttribute("gioiTinh")+"";
		gioiTinh = (gioiTinh.equals("null"))?"" : gioiTinh;
		
		String ngaySinh = request.getAttribute("ngaySinh")+"";
		ngaySinh = (ngaySinh.equals("null"))?"" : ngaySinh;
		
		String diaChi = request.getAttribute("diaChi")+"";
		diaChi = (diaChi.equals("null"))?"" : diaChi;
		
		String diaChiMuaHang = request.getAttribute("diaChiMuaHang")+"";
		diaChiMuaHang = (diaChiMuaHang.equals("null"))?"" : diaChiMuaHang;
		
		String diaChiNhanHang = request.getAttribute("diaChiNhanHang")+"";
		diaChiNhanHang = (diaChiNhanHang.equals("null"))?"" : diaChiNhanHang;
		
		String dienThoai = request.getAttribute("dienThoai")+"";
		dienThoai = (dienThoai.equals("null"))?"" : dienThoai;
		
		String email = request.getAttribute("email")+"";
		email = (email.equals("null"))?"" : email;
		
		String dongYNhanMail = request.getAttribute("dongYNhanMail")+"";
		dongYNhanMail = (dongYNhanMail.equals("null"))?"" : dongYNhanMail;
	
	%>

	<div class="container">
		<div class="dktk">
			<h1>ĐĂNG KÝ TÀI KHOẢN</h1>
		</div>
		<div class="red" id="baoLoi">
			<%=baoLoi %>
		</div>
		<form action="dang-ky" method="post">
			<div class="row">
				<div class="col">
					<h3 class="tk-dc">Tài khoản</h3>
					
					<div class="mb-3">
					  <label for="tenDangNhap" class="form-label">Tên Đăng Nhập</label> <span class="red">*</span>
					  <input type="text" class="form-control" id="tenDangNhap" name="tenDangNhap" required="required" value="<%=tenDangNhap %>">
					</div>
					
					<div class="mb-3">
					  <label for="matKhau" class="form-label">Mật Khẩu</label> <span class="red">*</span>
					  <input type="password" class="form-control" id="matKhau" name="matKhau" required="required" onkeyup="kiemTraMatKhau()">
					</div>
					
					<div class="mb-3">
					  <label for="matKhauNhapLai" class="form-label">Nhập Lại Mật Khẩu</label> <span class="red">*</span> <span id="msg" class="red"></span>
					  <input type="password" class="form-control" id="matKhauNhapLai" name="matKhauNhapLai" required="required" onkeyup="kiemTraMatKhau()" >
					</div>
				
					<hr>
				
					<h3 class="ttkh">Thông tin khách hàng</h3>
					
					<div class="mb-3">
					  <label for="hoVaTen" class="form-label" style="margin-top: 9px">Họ và Tên</label>
					  <input type="text" class="form-control" id="hoVaTen" name="hoVaTen" value="<%=hoVaTen %>">
					</div>
					
					<div class="mb-3">
					  <label for="gioiTinh" class="form-label">Giới tính</label>
					  <select class="form-control" id="gioiTinh" name="gioiTinh">
					  		<option></option>
					  		<option value="Nam" <%=(gioiTinh.equals("Nam"))?"selected='selected'":"" %> >Nam</option>
					  		<option value="Nữ" <%=(gioiTinh.equals("Nữ"))?"selected='selected'":"" %>>Nữ</option>
					  		<option value="Khác" <%=(gioiTinh.equals("Khác"))?"selected='selected'":"" %>>Khác</option>
					  </select>
					</div>
					
					<div class="mb-3">
					  <label for="ngaySinh" class="form-label">Ngày Sinh</label>
					  <input type="date" class="form-control" id="ngaySinh" name="ngaySinh" value="<%=ngaySinh %>">
					</div>
				
				</div>
				<div class="col">
					<h3 class="tk-dc">Địa chỉ</h3>
					
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
					  <label for="dienThoai" class="form-label">Điện thoại</label>
					  <input type="tel" class="form-control" id="dienThoai" name="dienThoai" value="<%=dienThoai %>">
					</div>
					
					<div class="mb-3">
					  <label for="email" class="form-label">Email</label>
					  <input type="email" class="form-control" id="email" name="email" value="<%=email %>">
					</div>
					
					<hr>
					
					<div class="mb-3">
					  <label for="dongYDieuKhoan" class="form-label">Đồng ý với điều khoản của công ty <span class="red">*</span> </label>
					  <input type="checkbox" class="form-check-input" id="dongYDieuKhoan" name="dongYDieuKhoan" required="required" onchange="xuLiChonDongY()">
					</div>
					
					<div class="mb-3">
					  <label for="dongYNhanMail" class="form-label">Đồng ý nhận email</label>
					  <input type="checkbox" class="form-check-input" id="dongYNhanMail" name="dongYNhanMail">
					</div>
					<input class="btn btn-primary form-control" type="submit" value="Đăng ký" name="submit" id="submit" style="visibility: hidden;"/>
				</div>	
			</div>
		</form>
	</div>
</body>
<script>
	function kiemTraMatKhau(){
		matKhau = document.getElementById("matKhau").value;
		matKhauNhapLai = document.getElementById("matKhauNhapLai").value;

		if(matKhau != matKhauNhapLai){
			document.getElementById("msg").innerHTML = "Mật khẩu không khớp";
			return false;
		}else{
			document.getElementById("msg").innerHTML = "";
			return true;
		}
	}

	function xuLiChonDongY(){
		dongYDieuKhoan = document.getElementById("dongYDieuKhoan");
		if(dongYDieuKhoan.checked == true){
			document.getElementById("submit").style.visibility="visible";
		}else{
			document.getElementById("submit").style.visibility="hidden";
		}
		
	}
</script>
</html>