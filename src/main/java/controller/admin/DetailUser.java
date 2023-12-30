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
 * Servlet implementation class DetailUser
 */
@WebServlet("/detail-user")
public class DetailUser extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public DetailUser() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String id = request.getParameter("id");
		
		KhachHang kh = new KhachHang();
		kh.setMaKhachHang(id);
		KhachHangDAO khd = new KhachHangDAO();
		KhachHang khachHang = khd.selectUserById(kh);
		HttpSession session = request.getSession();
		session.setAttribute("detailUser", khachHang);
		request.getRequestDispatcher("thongtinuser.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
