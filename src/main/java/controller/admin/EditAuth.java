package controller.admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import database.KhachHangDAO;
import model.KhachHang;

/**
 * Servlet implementation class EditAuth
 */
@WebServlet("/edit-auth")
public class EditAuth extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public EditAuth() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String uid = request.getParameter("id");
		
		KhachHang kh = new KhachHang();
		kh.setMaKhachHang(uid);
		
		KhachHangDAO khDao = new KhachHangDAO();
		KhachHang khachHang = khDao.selectUserById(kh);
		
		HttpSession session = request.getSession();
		KhachHang khachHangHienTai = (KhachHang) session.getAttribute("khachHang");
		if(khachHangHienTai.getTenDangNhap().equals("admin")) {
			if(khachHang!=null) {
				if(khachHang.getRole().equals("1")) {
					khDao.editUser1(uid);
				}else {
					khDao.editUser0(uid);
				}
			}
		}else {
			session.setAttribute("baoLoi", "Bạn không được cấp quyền này!!");
		}

		response.sendRedirect("manager-user");
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
