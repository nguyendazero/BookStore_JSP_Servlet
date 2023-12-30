<%@page import="database.JDBCUtil"%>
<%@page import="database.ProductDAO"%>
<%@page import="model.Cart"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%

	HttpSession sessionTotal = request.getSession();	
	
	ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
	List<Cart> cartProduct = null;
	if(cart_list != null){
		ProductDAO pDao = new ProductDAO(JDBCUtil.getConnection());
		cartProduct = pDao.getCartProducts(cart_list);
		double total = pDao.getTotalCartPrice(cart_list);
		
		session.setAttribute("total", total);
			
		request.setAttribute("cart_list", cart_list);
		request.setAttribute("total", total);
	}
	
	String baoLoi = (String) session.getAttribute("baoLoi");
	baoLoi = (baoLoi != null && !baoLoi.equals("null")) ? baoLoi : "";
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Giỏ Hàng</title>
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
<style type="text/css">

.container{
	margin-top: 80px;
}

/* Đổi màu nền và chữ cho trang */
body {
    background-color: #f7f7f7;
    font-family: Arial, sans-serif;
}

/* Đổi màu chữ cho tiêu đề */
h3 {
    color: #333;
    font-family: Arial, sans-serif;
    font-weight: bold;
}

/* Đổi màu chữ cho nút "Thanh Toán" */
.btn-primary {
    background-color: red; /* Màu nền nút */
    color: #fff; /* Màu chữ nút */
}

/* Đổi màu chữ cho nút "Xóa" */
.btn-danger {
    background-color: red;
    color: #fff;
    margin-top: 8px;
}
.btn-incre, .btn-decre{
box-shadow: none;
font-size: 15px;
}
/* Đổi màu nền cho header bảng */
thead {
    background-color: #33CC00;
    color: #fff;
}

/* Đổi màu nền cho dòng chẵn của bảng */
tbody tr:nth-child(even) {
    background-color: #F0FFF0;
}
.card-header {
        background-color: #FFFF99;
	    color: #FF3333;
	    width: 40%;
	    text-align: center;
	    font-size: 30px;
	    font-family: "Segoe UI", Arial, sans-serif;
	    font-weight: bold;
	    border: 4px solid green;
	    margin: 20px auto; /* Thay đổi giá trị margin */
    }

/* Đổi màu nền cho nút tăng và giảm số lượng */
.btn-incre, .btn-decre {
    background-color: #28a745;
    color: #fff;
}

/* Đổi màu chữ và nền của input số lượng */
.form-control {
    color: #333;
    background-color: #fff;
}
.btn-incre{
	margin-right: 10px;
}

.soluong{
	margin-left: 70px;
}
.mua:hover{
	background-color: green;
	color: white;
}

th.custom-margin:nth-child(3) {
    margin-right: 15px;
}

th.custom-margin:nth-child(4) {
    margin-left: 15px;
}


</style>
</head>
<body>
	<%@include file="../header.jsp" %>
	
	<div class="container">
	<div class="card-header" ><i class="fas fa-shopping-cart"></i>Giỏ Hàng Của Bạn</div>
	<h5 class="text-center" style="color: red; margin-top: 10px;"><%=baoLoi %></h5>
			        	<%
			        		baoLoi = null;
			        		session.setAttribute("baoLoi", baoLoi);
			        	%>
	
	<table class="table table-loght">
		<thead>
			<tr>
				<th scope="col">STT</th>
				<th scope="col">Tên Sản Phẩm</th>
				<th scope="col">Thể Loại</th>
				<th scope="col" class="custom-margin">Số Lượng</th>
				<th scope="col" class="custom-margin">Giá</th>
				
				<th scope="col">Hủy Bỏ</th>
			</tr>
		</thead>
		<tbody>
		<% 
		if(cart_list != null){
			int index = 0;
			for(Cart c:cartProduct){ index++;%>
				<tr>
				<td><%=index %></td>
				<td name="name" id="name" type="hiden"><%=c.getName() %></td>
				<td name="category" id="category" type="hiden"><%=c.getCategory() %></td>
				
				<td style="width: 400px">
					<form action="order-now" method="post" class="form-inline">
						<input type="hidden" name="id" value="<%=c.getId() %>" class="form-input">
						<div class="form-group d-flex justify-content-between w-50">
							<a class="btn  btn-decre" href="quantity-inc-dec?action=dec&id=<%= c.getId() %>"> <i2 class="fas fa-minus-square"></i2> </a>
							<input type="text" name="quantity" class="form-control w-50" value="<%=c.getQuantity() %>" readonly="readonly">
							<a class="btn  btn-incre" href="quantity-inc-dec?action=inc&id=<%= c.getId() %>"> <i2 class="fas fa-plus-square"></i2> </a>	
							<button type="submit" class="mua">Mua</button>
						</div>
					</form>
				</td>
				<td name="price" id="price" type="hiden"><%=c.getPrice() %></td>
				<td> <a class="btn btn-sm btn-danger" href="remove-from-cart?id=<%=c.getId() %>">Xóa</a> </td>
			</tr>
			<%}
		}
		%>
		
			
		</tbody>
	</table>
	<div class="d-flex py-3" style="float: right;"> 
			<h3>Tổng Tiền: <span style="color: red">${ (total>0)?total:0 }đ</span></h3>
			<a class="mx-3 btn btn-primary" style="margin-bottom: 7px" href="cart-check-out"><i class="fa-solid fa-money-check-dollar"></i></i>Thanh Toán</a>
		</div>
	</div>
	
	
	<!-- footer -->
	<div class="" style="margin-top: 80px">
		<%@include file="footer.jsp"%>
	</div>
	
</body>
</html>