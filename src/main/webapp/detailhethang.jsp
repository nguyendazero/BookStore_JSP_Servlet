<%@page import="database.KhachHangDAO"%>
<%@page import="model.KhachHang"%>
<%@page import="model.Comment"%>
<%@page import="java.util.List"%>
<%@page import="database.JDBCUtil"%>
<%@page import="database.CommentDAO"%>
<%@page import="model.Cart"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<%
HttpSession session2 = request.getSession();
Integer id_p = (Integer) session2.getAttribute("id_p");

CommentDAO cd = new CommentDAO(JDBCUtil.getConnection());
List<Comment> comments = cd.getAllCommentByIdProduct(id_p);

ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
if(cart_list != null){
	request.setAttribute("cart_list", cart_list);
}

String baoLoi = (String) session.getAttribute("baoLoi");
baoLoi = (baoLoi != null && !baoLoi.equals("null")) ? baoLoi : "";
%>
<jsp:include page="header.jsp"></jsp:include>
<style>
	
/*****************globals*************/
body {
  font-family: 'open sans';
  background: linear-gradient(to right, #CCFFFF, #33AEFF);
}

.img2 {
  max-width: 50%; }

.preview {
  display: -webkit-box;
  display: -webkit-flex;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-orient: vertical;
  -webkit-box-direction: normal;
  -webkit-flex-direction: column;
      -ms-flex-direction: column;
          flex-direction: column; }
  @media screen and (max-width: 996px) {
    .preview {
      margin-bottom: 20px; } }

.preview-pic {
  -webkit-box-flex: 1;
  -webkit-flex-grow: 1;
      -ms-flex-positive: 1;
          flex-grow: 1; }

.preview-thumbnail.nav-tabs {
  border: none;
  margin-top: 15px; }
  .preview-thumbnail.nav-tabs li {
    width: 18%;
    margin-right: 2.5%; }
    .preview-thumbnail.nav-tabs li img {
      max-width: 100%;
      display: block; }
    .preview-thumbnail.nav-tabs li a {
      padding: 0;
      margin: 0; }
    .preview-thumbnail.nav-tabs li:last-of-type {
      margin-right: 0; }

.tab-content {
  overflow: hidden; }
  .tab-content img {
    width: 100%;
    -webkit-animation-name: opacity;
            animation-name: opacity;
    -webkit-animation-duration: .3s;
            animation-duration: .3s; }

.card {
  margin-top: 50px;
  background: #eee;
  padding: 3em;
  line-height: 1.5em; }

.details {
  display: -webkit-box;
  display: -webkit-flex;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-orient: vertical;
  -webkit-box-direction: normal;
  -webkit-flex-direction: column;
  -ms-flex-direction: column;
  flex-direction: column;
  margin-left: -120px; /* Điều chỉnh giá trị này để kiểm soát khoảng cách */
 }


.product-title, .price{
	color: blue;	
  text-transform: UPPERCASE;
  font-weight: bold; }

.checked, .price span {
  color: #ff9f1a; }

.product-title, .rating, .product-description, .price {
  margin-bottom: 15px; }

.product-title {
  margin-top: 0; }


.add-to-cart, .like {
  margin-top: 30px;
  background: #ff9f1a;
  padding: 1.2em 1.5em;
  border: none;
  text-transform: UPPERCASE;
  font-weight: bold;
  color: #fff;
  -webkit-transition: background .3s ease;
          transition: background .3s ease; 
}
  .add-to-cart:hover, .like:hover {
    background: #b36800;
    color: #fff; }

@-webkit-keyframes opacity {
  0% {
    opacity: 0;
    -webkit-transform: scale(3);
            transform: scale(3); }
  100% {
    opacity: 1;
    -webkit-transform: scale(1);
            transform: scale(1); } }

@keyframes opacity {
  0% {
    opacity: 0;
    -webkit-transform: scale(3);
            transform: scale(3); }
  100% {
    opacity: 1;
    -webkit-transform: scale(1);
            transform: scale(1); } }

/*# sourceMappingURL=style.css.map */
.container2{
	margin-top: 100px;
	max-width: 80%;
}
.comment {
    border: 1px solid #ccc;
    border-radius: 8px;
    padding: 10px;
    margin-bottom: 15px;
    background-color: #f8f8f8;
}

.comment p {
    margin: 0;
}

.comment strong {
    color: #333;
}

/* Tùy chỉnh màu nền và màu chữ cho thẩm mỹ hơn */
#comments-list {
    background-color: #f4f4f4;
    padding: 20px;
}

.comment {
    background-color: #fff;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

/* Tạo hiệu ứng hover cho comment */
.comment:hover {
    background-color: #f0f0f0;
}

/* CSS cho nút chỉnh sửa và xóa */
.comment-actions a {
    margin-right: 5px;
    color: red;
    text-decoration: none;
    padding: 2px 4px; /* Điều chỉnh kích thước của nút */
    border: 1px solid red;
    border-radius: 3px;
    font-size: 12px; /* Điều chỉnh kích thước chữ của nút */
    transition: background-color 0.3s;

}

.comment-actions a:hover {
    background-color: red;
    color: #000;
}

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
    
.btn-outline-info{
	padding: 2px 4px; /* Điều chỉnh kích thước của nút */
    border: 1px solid #428bca;
    border-radius: 3px;
    font-size: 11px; /* Điều chỉnh kích thước chữ của nút */
}
</style>
<!------ Include the above in your HEAD tag ---------->

<!DOCTYPE html>
<html lang="en">
  <head>
    
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Chi Tiết Sản Phẩm</title>
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:400,700" rel="stylesheet">

  </head>

  <body>
	
	<div class="container container2">
		<div class="card">
			<div class="container-fliud">
				<div class="row">
					<div class="preview col-md-6">
						<div class="preview-pic tab-content">
						  <div class="tab-pane active"><img src="img/product/${detail.image}" class="img2"/></div>
						</div>
					</div>
					<div class="details col-md-6">
						<h3 class="product-title">${detail.name}</h3>
						<h6 style="color: red"><i class="fa-brands fa-gratipay"></i>Lượt thích: ${detail.tym}</h6>
						<h6 style="color: green"><i class="fa-solid fa-warehouse"></i>Còn trong kho 0 sản phẩm</h6>
						<div class="rating">
							<div class="stars">
								<span class="fa fa-star checked"></span>
								<span class="fa fa-star checked"></span>
								<span class="fa fa-star checked"></span>
								<span class="fa fa-star checked"></span>
								<span class="fa fa-star"></span>
							</div>
							
						</div>
						<p class="product-description">${detail.mota}</p>
						<h4 class="price">Giá: <span style="color: red">${detail.price}</span></h4>
						
						
						
						<div class="action">
							<a class="add-to-cart btn btn-default" type="button"></i>Đã hết hàng</a>
							<a href="inc-tym?id=${detail.id}"> <button class="like btn btn-default" type="button"><span class="fa fa-heart"></span></button></a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Thêm sau phần hiển thị thông tin sản phẩm -->
			<div class="comments-section">
			    
			    <div class="text-center mb-3 product-heading mt-3">
			    	<h2 class="m-0">Bình Luận Đánh Giá Sản Phẩm</h2>
				</div>
				<h5 class="text-center" style="color: red; margin-top: 10px;"><%=baoLoi %></h5>
			        	<%
			        		baoLoi = null;
			        		session.setAttribute("baoLoi", baoLoi);
			        	%>
			    <!-- Hiển thị danh sách bình luận -->
			    <div id="comments-list">
			        <%
			    	if(!comments.isEmpty()){
						for(Comment c:comments){
							KhachHang kh = new KhachHang();
							kh.setMaKhachHang(c.getId_u());
							KhachHangDAO khd = new KhachHangDAO();
						    KhachHang khachHang = khd.selectUserById(kh);
							String name = khachHang.getHoVaTen();
			        %>
			            <div class="comment">
			            	<p><strong style="color:red;"><%= c.getDate() %></strong></p>
			                <p><strong><%=name %>:</strong> <%= c.getContent() %></p>
			                <div class="comment-actions">

					            <button type="button" class="btn btn-outline-info edit-comment-btn"
					            		data-bs-toggle="modal" data-bs-target="#commentModal_<%=c.getId_comment() %>"
										data-comment-id="<%=c.getId_comment() %>"												 
										data-comment-content="<%=c.getContent() %>">Chỉnh sửa
								</button>
								<!-- Modal -->
								<div class="modal fade" id="commentModal_<%=c.getId_comment() %>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
									<div class="modal-dialog">
										<div class="modal-content">
											<form action="edit-comment?id_c=<%=c.getId_comment() %>" method="post">
												<div class="modal-header">
													<h5 class="modal-title" id="exampleModalLabel">Chỉnh sửa bình luận</h5>
													<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button></div>
												        
												<div class="modal-body">
												  <input name="commentId" id="commentId" type="hidden" class="form-control">
												    <div class="form-label">
												       <label>Nội dung</label> <input name="content" id="content" type="text" class="form-control" required="required">
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

				            	<a href="delete-comment?id_c=<%=c.getId_comment() %>">Xóa</a>
       						 </div>
			            </div>
			        <%
			                }
			            }else{
			         %>   
			         		<h4 class="text-center" style="font-weight: bold;">Sản phẩm chưa có bình luận nào, hãy là người đầu tiên đánh giá sản phẩm</h4>	
			         <% 
			            }
			        %>
			    </div>
			
			    <!-- Form nhập bình luận -->
			  
			    <form id="comment-form" action="add-comment" method="get">
			        <div class="form-group">
			            <label for="comment" style="font-size: 20px; margin-top: 4px; margin-bottom: 5px;">Nhập bình luận của bạn:</label>
			            <textarea class="form-control" id="comment" name="comment" rows="2" required></textarea>
			        </div>
			        <button type="submit" class="btn btn-primary mt-2">Gửi bình luận</button>
			    </form> 
			</div>
	</div>
	<%@include file="footer.jsp"%>
  </body>
</html>
