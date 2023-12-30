package controller.admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import database.JDBCUtil;
import database.KhachHangDAO;
import database.ProductDAO;
import model.KhachHang;

/**
 * Servlet implementation class DeleteUser
 */
@WebServlet("/delete-user")
public class DeleteUser extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public DeleteUser() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		String id = request.getParameter("id");
		KhachHangDAO khDao = new KhachHangDAO();
		
		HttpSession session = request.getSession();
		KhachHang khachHangHienTai = (KhachHang) session.getAttribute("khachHang");
		if(khachHangHienTai.getTenDangNhap().equals("admin")) {
			khDao.deleteKhachHang(id);
		}else {
			session.setAttribute("baoLoi", "Bạn không được cấp quyền này!!");

		}
		response.sendRedirect("quanlykhachhang.jsp");
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
