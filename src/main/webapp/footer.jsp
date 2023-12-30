<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
/* Đổi màu nền và màu chữ cho thanh footer */
footer {
    background-color: #F0F0F0; /* Màu nền trắng */
    color: black; /* Màu chữ tối */
    padding: 20px 0;
    margin-top: calc(25px + 12%);
}
    
}

/* Đổi màu chữ cho các liên kết trong footer */
.footer-nav a {
    color: black; /* Màu chữ xanh dương sáng */
    text-decoration: none;
    margin: 0 10px; /* Khoảng cách giữa các liên kết */
}

/* Đổi màu chữ cho nội dung bản quyền và canh giữa nó */
.footer-copyright {
    text-align: center;
    font-size: 14px;
    height: 20px;
}
</style>
<!-- Footer -->
	<footer class="py-3">
    <ul class="nav justify-content-center border-bottom pb-3 mb-3 footer-nav">
        <li class="nav-item"><a href="#" class="nav-link px-2 text-muted">Trang chủ</a></li>
        <li class="nav-item"><a href="#" class="nav-link px-2 text-muted">Quy định giao hàng</a></li>
        <li class="nav-item"><a href="#" class="nav-link px-2 text-muted">Quy định trả hàng</a></li>
        <li class="nav-item"><a href="#" class="nav-link px-2 text-muted">Liên hệ</a></li>
    </ul>
    <p class="text-center text-muted footer-copyright">© 2023 NguyenDaDa.vn, Inc</p>
</footer>
	<!-- End footer -->