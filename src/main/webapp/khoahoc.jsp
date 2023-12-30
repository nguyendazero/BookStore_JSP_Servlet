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
	ProductDAO pd = new ProductDAO(JDBCUtil.getConnection());
	List<Product> products = pd.getKhoaHocProducts();
	
	ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
	if(cart_list != null){
		request.setAttribute("cart_list", cart_list);
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sách khoa học</title>
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

    /* Định dạng kiểu chữ cho tên sản phẩm */
    .product-name {
        font-size: 22px;
        font-weight: bold;
        color: #333; /* Màu chữ tên sản phẩm */
    }

    /* Định dạng kiểu chữ cho giá sản phẩm */
    .product-price {
        font-size: 20px;
        color: red; /* Màu chữ giá sản phẩm */
    }

    /* Định dạng kiểu chữ cho nút "Add to Cart" */
    .add-to-cart-button {
        font-size: 14px;
        font-weight: bold;
        background-color: #33CC33; /* Màu nền nút */
        color: #FFFF99; /* Màu chữ nút */
        padding: 5px 10px;
        border: none;
        border-radius: 5px;
    }
    .card{
    	border: 2px solid green; /* Tạo khung màu xanh xung quanh */
    }
    
</style>
</head>
<body>
	<!-- header -->
	<jsp:include page="header.jsp"></jsp:include>
	
	<!-- Page content -->
	<div class="container mt-4">
		<div class="row">
			<!-- Menu left -->
			<jsp:include page="left.jsp"></jsp:include>
			<!-- End Menu left -->

			<!-- Slider and Products -->
			<div class="col-lg-9"  style="margin-top: 50px; margin-left: 330px;">
				
				<div class="text-center mb-3 product-heading">
				    <h1 style="margin: 0;">Danh Mục Sách Khoa Học</h1>
				</div>
				
				<!-- Products -->
				<div class="row">
				<%
					if(!products.isEmpty()){
						for(Product p:products){%>
							<div class="col-lg-3 col-md-6 mb-4">
							<div class="card h-80" style="height: 530px">
								<img class="card-img-top" src="img/product/<%= p.getImage() %>" alt="">
								<div class="card-body">
									<h4 class="text-center product-name">
										<a href="detail?id=<%=p.getId() %>" style="text-decoration: none;"><%= p.getName() %></a>
									</h4>
									
								</div>
								<h5 class="text-center product-price">Giá: <%= p.getPrice() %>đ</h5>
								<div class="card-footer">
									<small class="text-muted">&#9733; &#9733; &#9733; &#9733; &#9734;</small>
									<a href="add-to-cart?id=<%=p.getId() %>" class="btn btn-primary add-to-cart-button" style="float: right">Add to Cart</a>
								</div>
							</div>
						</div>	
						<%}
					}
				%>	
				</div>
				
				<!-- End Products -->
			</div>
			<!-- End Slider and Products -->
		</div>
	</div>
	<!-- End Page content -->

	<!-- footer -->
	<%@include file="footer.jsp"%>
</body>
</html>