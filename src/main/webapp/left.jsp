<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
.list-group{
	border: 4px solid green;
}
.list-group-item{
	border: 2px solid green;
	font-family: "Segoe UI", Arial, sans-serif;
	font-weight: bold;
	background-color: #F0FFF0;
}
.ac{
	background-color: #F0FFF0;
}

.list-group-item:hover {
        background-color: white;
        color: black;
}

.theloai{
	background-color: green;
	color: white;
	text-align: center;
	margin-bottom: 20px;
	height: 40px;
	font-weight: bold;
	 font-size: 25px; 
}

</style>
<div class="col-lg-3 mt-10" style="position: fixed; top: 70px; left:1px ;">
				<div class="list-group ">
					<p class="theloai"><i class="fa-solid fa-list"></i>Thể loại</p>
					<a href="loisong.jsp" class="list-group-item list-group-item-action a">Sách Lối Sống</a> 
					<a href="thieunhi.jsp" class="list-group-item list-group-item-action ac">Sách Thiếu Nhi</a> 
					<a href="thamkhao.jsp" class="list-group-item list-group-item-action a">Sách Tham Khảo</a>
					<a href="khoahoc.jsp" class="list-group-item list-group-item-action ac">Sách Khoa Học Và Công Nghệ</a> 
					<a href="nuocngoai.jsp" class="list-group-item list-group-item-action a">Sách Nước Ngoài</a>
				</div>
			</div>