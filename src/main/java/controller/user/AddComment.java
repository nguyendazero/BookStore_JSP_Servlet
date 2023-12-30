package controller.user;

import java.io.IOException;
import java.text.SimpleDateFormat;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import database.CommentDAO;
import database.JDBCUtil;
import model.KhachHang;

/**
 * Servlet implementation class AddComment
 */
@WebServlet("/add-comment")
public class AddComment extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public AddComment() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
	    response.setCharacterEncoding("UTF-8");
	    response.setContentType("text/html; charset=UTF-8");
	    
	    HttpSession session = request.getSession();
	    String referringURL = request.getHeader("referer");
        session.setAttribute("referringURL", referringURL);
        
	    KhachHang khachHangHienTai = (KhachHang) session.getAttribute("khachHang");

	    if(khachHangHienTai != null) {
	    	Integer id_p = (Integer) session.getAttribute("id_p");
		    
		    String u_id = khachHangHienTai.getMaKhachHang();
		    String content = request.getParameter("comment");
		    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String currentDate = sdf.format(new java.util.Date());
			
			CommentDAO cDao = new CommentDAO(JDBCUtil.getConnection());
			cDao.addComment(u_id, id_p, content, currentDate);
	        response.sendRedirect(referringURL);
	    }else {
	    	session.setAttribute("baoLoi", "Bạn chưa đăng nhập!!");
			response.sendRedirect(referringURL);
	    }
	    
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
