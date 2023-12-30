package controller.admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database.KhachHangDAO;

/**
 * Servlet implementation class SearchKhachHang
 */
@WebServlet("/search-khachhang")
public class SearchKhachHang extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public SearchKhachHang() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String txtSearch = request.getParameter("txt");
		KhachHangDAO khDao = new KhachHangDAO();
		
		request.setAttribute("txt", txtSearch);
		request.setAttribute("txtS", txtSearch);
		request.getRequestDispatcher("search_khachhang.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
