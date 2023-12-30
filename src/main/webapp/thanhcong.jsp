<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
	+ request.getContextPath();
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Thành Công</title>
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
 <style>
        /* Thiết lập kiểu dáng cho thanh h1 */
        h1.mt-5 {
            background-color: #007bff; /* Màu nền xanh dương */
            color: #fff; /* Màu chữ trắng */
            padding: 10px; /* Khoảng cách bên trong thanh h1 */
            border-radius: 15px; /* Đường viền cong */
            text-align: center; /* Căn giữa văn bản */
        }
        
        .container{
        	margin-top: 100px;
        }
        
        .d{
        	margin-top: 30px;
        	text-align: center;
        	margin-bottom: 350px;
        }
        
    </style>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
<div class="container">
		<h1 class="mt-5 alert">Thao tác đã thành công!</h1>
</div>
<div class="d">
		<a  href="<%=url %>/index.jsp">Quay lại trang chủ</a>
</div>

	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>