<%@page import="model.Order"%>
<%@page import="database.OrderDAO"%>
<%@page import="model.Order_detail"%>
<%@page import="database.JDBCUtil"%>
<%@page import="database.ProductDAO"%>
<%@page import="model.Cart"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	HttpSession session_id_Orders = request.getSession();
	String id_string = (String) session_id_Orders.getAttribute("session_id_Orders");
	int order_id_int = Integer.parseInt(id_string);
	
	OrderDAO oDao = new OrderDAO(JDBCUtil.getConnection());
	Order order = oDao.getOrderByID(order_id_int);
	double total = order.getTotal();
	
	
	List<Order_detail> cartOrder = null;
	cartOrder = oDao.getOrderDeTailById(order_id_int);

	ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
	if(cart_list != null){
		request.setAttribute("cart_list", cart_list);
	}
	
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
	<div class="card-header" ><i class="fas fa-shopping-cart"></i>Chi Tiết Đơn Hàng </div>
	
	<table class="table table-loght">
		<thead>
			<tr>
				<th scope="col">Số Thứ Tự</th>
				<th scope="col">Tên Sản Phẩm</th>
				<th scope="col">Thể Loại</th>
				<th scope="col" class="custom-margin">Số Lượng</th>
				<th scope="col" class="custom-margin">Đơn Giá</th>
			</tr>
		</thead>
		<tbody>
		<% 
			int index = 0;
			for(Order_detail o:cartOrder){ index++;%>
				
				<tr>
				<td><%=index %></td>
				<td><%=o.getName() %></td>
				<td><%=o.getCategory() %></td>
				<td><%=o.getQuantity() %></td>
				<td><%=o.getPrice()%></td>
			</tr>
			<%}%>

		
			
		</tbody>
	</table>
	<div class="d-flex py-3" style="float: right;"> 
			<h3>Tổng Tiền: <span style="color: red"><%=total %>đ</span></h3>
		</div>
	</div>
	
	
	<!-- footer -->
	<div class="" style="margin-top: 80px">
		<%@include file="footer.jsp"%>
	</div>
	
</body>
</html>