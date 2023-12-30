<%@page import="model.Order"%>
<%@page import="database.JDBCUtil"%>
<%@page import="database.OrderDAO"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="model.KhachHang"%>
<%@page import="java.util.*"%>
<%@page import="model.Cart"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

KhachHang auth = (KhachHang) request.getSession().getAttribute("khachHang");
List<Order> orders = null;
if(auth != null){
	request.setAttribute("auth", auth);

	String maKhachHangStr = auth.getMaKhachHang();
	long maKhachHang = 0L; // Sử dụng 	kiểu long và gán giá trị mặc định
	try {
	    maKhachHang = Long.parseLong(maKhachHangStr);
	} catch (NumberFormatException e) {
	    e.printStackTrace();
	}
	orders = new OrderDAO(JDBCUtil.getConnection()).userOrders(maKhachHang);
	
}else{
	response.sendRedirect("dangnhap.jsp");
}

ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
if(cart_list != null){
	request.setAttribute("cart_list", cart_list);
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Đơn hàng của bạn</title>
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
.card-header {
        background-color: #FFFF99;
	    color: #FF3333;
	    
	    text-align: center;
	   
	    font-size: 30px; /* Kích thước font t	ăng lên */
	    font-family: "Segoe UI", Arial, sans-serif; /* Loại font chữ */
	    font-weight: bold; /* Độ đậm, có thể không cần thiết nếu sử dụng font chữ in đậm */
	    border: 4px solid green; /* Tạo khung màu xanh xung quanh */
	    margin-top: 80px;
	    margin-bottom: 20px;
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


/* Để cố định chiều rộng của các cột */
th {
    min-width: 100px;
    background-color: green;
}


/* Để làm cho nút Hủy Bỏ nhỏ hơn */
.btn-sm {
    font-size: 14px;
    background-color: red;
}

/* Để làm cho footer được căn giữa */
#footer {
    text-align: center;
}
</style>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	
	<div class="container">
		<div class="card-header" ><i class="fas fa-shopping-bag"></i>TẤT CẢ ĐƠN HÀNG BẠN ĐÃ ĐẶT THÀNH CÔNG</div>
		<table class="table table-loght">
			<thead>
				<tr>
					
					<th scope="col">STT</th>
					<th scope="col">Mã Đơn Hàng</th>
					<th scope="col">Ngày</th>
					<th scope="col">Tổng Tiền</th>
					<th scope="col">Xem Chi Tiết</th>
					<th scope="col">Hủy Bỏ</th>
				</tr>
			</thead>
			<tbody>
			<%
			int index = 1;
			if(orders != null ){
				for(Order o:orders){%>
				<tr>
					<td><%=index++ %></td>
					<td><%=o.getOrderId() %></td>
					<td><%=o.getDate() %></td>
					<td><%=o.getTotal() %></td>
					<td> <a href="order-detail?id=<%=o.getOrderId()%>"><button type="button" class="btn btn-success">Xem Chi Tiết</button></a></td>
					<td> <a class="btn btn-sm btn-danger" href="cancel-order?id=<%=o.getOrderId() %>">Xóa</a> </td>
				</tr>
				<%}
			}
			%>
			
			</tbody>
		</table>
	</div>
	
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>