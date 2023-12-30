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
	String txt = (String) request.getAttribute("txt");
	ProductDAO pd = new ProductDAO(JDBCUtil.getConnection());
	List<Product> products = pd.searchByName(txt);

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Tìm kiếm sách</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
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
	@media (max-width: 767.98px) { .border-sm-start-none { border-left: none !important; } }
	
	body{
		background: linear-gradient(to right, #98FB98, #98FB98);
	}
	
	.me-2{
		border: 3px solid black; /* Viền input */
	    background-color: white; /* Màu nền trong suốt */
	    color: white; /* Màu chữ */
	    font-weight: bold; /* Đậm chữ */
	    margin-right: 10px; /* Tùy chỉnh khoảng cách giữa input và nút Tìm */
	    width: 400px;
	    
	}
	
	.c2{
	 	border-radius: 10px;
		background-color: #228B22;
		border: 3px solid black; /* Viền input */
		margin-top: 60px;
	}
	
	.btn-outline-success{
		background-color: white;
	}
	
	.btn-warning{
		margin-left: 600px;
	}
	
	
</style>
</head>
<body>
<jsp:include page="headerAdmin.jsp"></jsp:include>
	<div class="container c1">
		<div class="container c2 py-3 d-flex">
		  <form action="search-admin" method="get" class="d-flex" role="search">
		    <input value="${txtS}" name="txt" class="form-control me-2" type="text" placeholder="Tìm kiếm sản phẩm" aria-label="Search" style="color: black;">
		    <button class="btn btn-outline-success" type="submit">
		      <i class="fa fa-search"></i>
		    </button>
		  </form>
			<a href="quanlysanpham.jsp" class="btn btn-primary "><i class="fa-solid fa-house"></i></a>
			
		  <!-- Button trigger modal -->
		  
			<button type="button" class="btn btn-primary btn-warning" data-bs-toggle="modal" data-bs-target="#exampleModal">
			  <i class="fa-solid fa-circle-plus"></i>  Thêm sản phẩm
			</button>
			
			<!-- Modal -->
			<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			  <div class="modal-dialog">
			    <div class="modal-content">
			    <form action="add-product" method="post">
			      <div class="modal-header">
			        <h5 class="modal-title" id="exampleModalLabel">Thêm sản phẩm</h5>
			        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			      </div>
			      <div class="modal-body">
			        <div class="form-label">
			        	<label>Id</label>
			        	<input name="id" type="text" class="form-control" required="required">
			        </div>
			        <div class="form-label">
			        	<label>Tên sản phẩm</label>
			        	<input name="name" type="text" class="form-control" required="required">
			        </div>
			        <div class="form-label">
			        	<label>Thể loại</label>
			        	<input name="category" type="text" class="form-control" required="required">
			        </div>
			        <div class="form-label">
			        	<label>Số lượng</label>
			        	<input name="soluong" type="text" class="form-control" required="required">
			        </div>
			        <div class="form-label">
			        	<label>Giá</label>
			        	<input name="price" type="text" class="form-control" required="required">
			        </div>
			        <div class="form-label">
			        	<label>Hình ảnh</label>
			        	<input name="image" type="text" class="form-control" required="required">
			        </div>
			        <div class="form-label">
			        	<label>Mô tả</label>
			        	<input name="mota" type="text" class="form-control" required="required">
			        </div>
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
			        <button type="submit" class="btn btn-primary">Thêm</button>
			      </div>
			     </form>
			    </div>
			  </div>
			</div>
			
		  	
		  
		</div>
		
		<%
					if(!products.isEmpty()){
						for(Product p:products){%>
							<section style="background-color: #eee;">
							  <div class="container c3 py-3">
							    <div class="row justify-content-center">
							      <div class="col-md-12 col-xl-10">
							        <div class="card shadow-0 border rounded-3 d-flex">
							          <div class="card-body">
							            <div class="row">
							              <div class="col-md-12 col-lg-3 col-xl-3 mb-4 mb-lg-0">
							                <div class="bg-image hover-zoom ripple rounded ripple-surface">
							                  <img src="img/product/<%= p.getImage() %>" class="w-50" />
							                   
							                </div>
							              </div>
							              <div class="col-md-6 col-lg-6 col-xl-6">
							                <h5><%= p.getName() %></h5>
							                <div class="d-flex flex-row">
							                  <div class="text-danger mb-1 me-2">
							                   
							                  </div>
							                 
							                </div>
							                <div class="mt-1 mb-3 text-muted small">
							                  <span>Thể loại: <%= p.getCategory() %></span>
							                </div>
							                
							                <p class="text-truncate mb-4 mb-md-0">
							                  <%= p.getMota() %>
							                </p>
							              </div>
							              <div class="col-md-6 col-lg-3 col-xl-3 border-sm-start-none border-start">
							                <div class="d-flex flex-row align-items-center mb-1">
							                  <h4 class="mb-1 me-1"><%= p.getPrice() %>đ</h4>
							                  <span class="text-danger"><s><%= p.getPrice_goc() %></s></span>
							                </div>
							                <h6 class="text-success"><%= p.getTrangthai() %></h6>
							                
							                <div class="d-flex flex-column mt-4">
							                
							                
							                  <!-- Chỉnh sửa -->
							                  <a><button class="btn btn-primary btn-sm edit-product w-100" type="button" data-bs-toggle="modal" data-bs-target="#exampleModal2"
												  data-product-id="<%=p.getId() %>"
												  data-product-name="<%=p.getName() %>"
												  data-product-category="<%=p.getCategory() %>"
												  data-product-soluong="<%=p.getSoluongcon() %>"
												  data-product-price-goc="<%=p.getPrice() %>"
												  data-product-price="0"
												  data-product-image="<%=p.getImage() %>"
												  data-product-trangthai="<%=p.getTrangthai() %>"
												  data-product-mota="<%=p.getMota() %>">
												  <i class="fa-solid fa-pen-to-square mr-4"></i>Chỉnh sửa
											</button></a> 
							                  
							                  <!-- Modal -->
												<div class="modal fade" id="exampleModal2" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
												  <div class="modal-dialog">
												    <div class="modal-content">
												      <form action="edit-product?pid=<%=p.getId() %>" method="post">
												        <div class="modal-header">
												          <h5 class="modal-title" id="exampleModalLabel">Chỉnh sửa sản phẩm</h5>
												          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
												        </div>
												        <div class="modal-body">
												        	<input name="id" id="productId" type="hidden" class="form-control">
												        	
												          <div class="form-label">
												            <label>Tên sản phẩm</label> <input name="name" id="productName" type="text" class="form-control" required="required">
												          </div>
												          <div class="form-label">
												            <label>Thể loại</label> <input name="category" id="productCategory" type="text" class="form-control" required="required">
												          </div>
												          <div class="form-label">
												            <label>Số lượng</label> <input name="soluong" id="productSoluong" type="text" class="form-control" required="required">
												          </div>
												          <div class="form-label">
												            <label>Giá hiện tại</label> <input name="price_goc" id="productPriceGoc" type="text" class="form-control" required="required">
												          </div>
												          <div class="form-label">
												            <label>Giá mới</label> <input name="price" id="productPrice" type="text" class="form-control" required="required">
												          </div>
												          <div class="form-label">
												            <label>Hình ảnh</label> <input name="image" id="productImage" type="text" class="form-control" required="required">
												          </div>
												          <div class="form-label">
												            <label>Trạng Thái</label> <input name="trangthai" id="productTrangthai" type="text" class="form-control" required="required">
												          </div>
												          <div class="form-label">
												            <label>Mô tả</label> <input name="mota" id="productMota" type="text" class="form-control" required="required">
												          </div>
												        </div>
												        <div class="modal-footer">
												          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
												          <button type="submit" class="btn btn-primary">Lưu</button>
												        </div>
												      </form>
												    </div>
												  </div>
												</div>
							                 
							                 
							                  <a href="delete-product?pid=<%=p.getId() %>"><button class="btn btn-danger btn-sm mt-2 w-100" type="button">
							                        <i class="fa-solid fa-trash"></i> Xóa sản phẩm     
							                  </button></a> 
							                </div>
							                
							              </div>
							            </div>
							          </div>
							        </div>
							      </div>
							    </div>
							  </div>
							  
							</section>
						<%}
					}
				%>	
		
	</div>
<script>
//Lắng nghe sự kiện khi người dùng nhấp vào nút "Chỉnh sửa"
var editButtons = document.querySelectorAll('.edit-product');

editButtons.forEach(function(button) {
  button.addEventListener('click', function() {
    // Lấy dữ liệu sản phẩm từ thuộc tính data-attribute của nút "Chỉnh sửa"
    var productId = button.getAttribute('data-product-id');
    var productName = button.getAttribute('data-product-name');
    var category = button.getAttribute('data-product-category');
    var soluong = button.getAttribute('data-product-soluong');
    var price_goc = button.getAttribute('data-product-price-goc');
    var price = button.getAttribute('data-product-price');
    var image = button.getAttribute('data-product-image');
    var trangthai = button.getAttribute('data-product-trangthai');
    var mota = button.getAttribute('data-product-mota');

    // Đặt giá trị của các trường trong modal bằng dữ liệu sản phẩm cụ thể
    document.getElementById('productId').value = productId;
    document.getElementById('productName').value = productName;
    document.getElementById('productCategory').value = category;
    document.getElementById('productSoluong').value = soluong;
    document.getElementById('productPriceGoc').value = price_goc;
    document.getElementById('productPrice').value = price;
    document.getElementById('productImage').value = image;
    document.getElementById('productTrangthai').value = trangthai;
    document.getElementById('productMota').value = mota;
  });
});
</script>
</body>
</html>