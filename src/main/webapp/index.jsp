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
	List<Product> products = pd.getAllProducts();
	
	ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
	if(cart_list != null){
		request.setAttribute("cart_list", cart_list);
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cửa hàng sách</title>
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
				    <h2 class="m-0">TẤT CẢ SẢN PHẨM</h2>
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