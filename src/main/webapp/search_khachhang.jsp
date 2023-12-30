<%@page import="java.util.List"%>
<%@page import="model.KhachHang"%>
<%@page import="database.JDBCUtil"%>
<%@page import="database.KhachHangDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
	String txt = (String) request.getAttribute("txt");
	KhachHangDAO khd = new KhachHangDAO();
	List<KhachHang> customers = khd.searchByNameKhachHang(txt);
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Tìm khách hàng</title>
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
	body{margin-top:20px;
background:#eee;
}
.card {
    box-shadow: 0 20px 27px 0 rgb(0 0 0 / 5%);
}
.avatar.sm {
    width: 2.25rem;
    height: 2.25rem;
    font-size: .818125rem;
}
.table-nowrap .table td, .table-nowrap .table th {
    white-space: nowrap;
}
.table>:not(caption)>*>* {
    padding: 0.75rem 1.25rem;
    border-bottom-width: 1px;
}
table th {
    font-weight: 600;
    background-color: #eeecfd !important;
}
.container{
	margin-top: 40px;
}
.card-header{
		background-color: #FFFF99;
	    color: #FF3333;
	    padding: 10px;
	    border-radius: 10px;
	    font-size: 50px; /* Kích thước font tăng lên */
	    font-family: "Segoe UI", Arial, sans-serif; /* Loại font chữ */
	    font-weight: bold; /* Độ đậm, có thể không cần thiết nếu sử dụng font chữ in đậm */
	    border: 4px solid green; /* Tạo khung màu xanh xung quanh */
}
.card-header2{
	padding:  7px 0 7px 0;
	background-color: #FFFBD1; 
}	

.fa-solid{
	margin-right: 5px;
}

.table tbody tr:nth-child(even) {
    background-color: #f2f2f2; /* Màu nền cho dòng chẵn */
}

.icon{
	margin-right: 10px;
}
</style>s
</head>
<body>
<jsp:include page="headerAdmin.jsp"></jsp:include>
	<div class="container">
    <div class="row">
        <div class="col-12 mb-3 mb-lg-5">
            <div class="overflow-hidden card table-nowrap table-card">
            	<div class="card-header p-3">
                    <h4 class="text-center m-0" >DANH SÁCH KHÁCH HÀNG</h4>
                </div>
                <div class="card-header2 d-flex justify-content-between align-items-center">
                    <form action="search-khachhang" method="get" class="d-flex" role="search" style="margin-left: 7px"; >
					    <input value="${txtS}" name="txt" class="form-control me-2" type="text" placeholder="Tìm kiếm khách hàng" aria-label="Search">
					  	<button class="btn btn-outline-success" type="submit">
					      <i class="fa fa-search" style="background-color: while;"></i>
					    </button>
					   
					</form>
					 <a href="quanlykhachhang.jsp" class="btn btn-primary icon"><i class="fa-solid fa-reply"></i>Quay lại</a>
			        <button type="button" class="btn btn-primary btn-success" data-bs-toggle="modal" data-bs-target="#exampleModal" style="margin-right: 7px;">
					  <i class="fa-solid fa-user-plus"></i>  Thêm khách hàng
					</button>
		                </div>
                
                <div class="table-responsive">
                    <table class="table mb-0">
                        <thead class="" >
                            <tr>
                                <th>Họ Tên</th>
                                <th>Email</th>
                                <th>Địa chỉ</th>
                                <th>Vai trò</th>
                                <th>Ngày Sinh</th>
                                <th class="text-end">Lựa Chọn</th>
                            </tr>
                        </thead>
                        <tbody>
                        <%
						if(!customers.isEmpty()){
							for(KhachHang kh:customers){%>
                            <tr class="align-middle">
                                <td>
                                    <div class="d-flex align-items-center">
                                        <img src="https://bootdey.com/img/Content/avatar/avatar1.png" class="avatar sm rounded-pill me-3 flex-shrink-0" alt="Customer">
                                        <div>
                                            <div class="h6 mb-0 lh-1"><%=kh.getHoVaTen() %></div>
                                        </div>
                                    </div>
                                </td>
                                <td><%=kh.getEmail() %></td>
                                <td> <span class="d-inline-block align-middle"><%=kh.getDiaChi() %></span></td>
                                <td><span><%=kh.getRole().equals("0") ? "Khách hàng":"Quản trị viên"%></span></td>
                                <td><%=kh.getNgaySinh() %></td>
                                <td class="text-end">
                                    <div class="drodown">
                                        <a data-bs-toggle="dropdown" href="#" class="btn p-1" aria-expanded="false">
                                  <i class="fa fa-bars" aria-hidden="true"></i>
                                </a>
                                        <div class="dropdown-menu dropdown-menu-end" style="">
                                        	<a href="detail-user?id=<%=kh.getMaKhachHang() %>" class="dropdown-item"><i class="fa-solid fa-address-book"></i>  Xem thông tin chi tiết</a>
                                            <a href="edit-auth?id=<%=kh.getMaKhachHang() %>" class="dropdown-item"><i class="fa-solid fa-user-pen"></i>Trao/Hủy quyền quản trị</a>
                                            <a href="delete-user?id=<%=kh.getMaKhachHang() %>" class="dropdown-item"><i class="fa-solid fa-user-slash"></i>Xóa người dùng</a>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <%}
					}
				%>	
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>