package controller.user;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import database.CommentDAO;
import database.JDBCUtil;
import model.Comment;
import model.KhachHang;

/**
 * Servlet implementation class DeleteComment
 */
@WebServlet("/delete-comment")
public class DeleteComment extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public DeleteComment() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		String id_c_str = request.getParameter("id_c");
		int id_c = Integer.parseInt(id_c_str);

		
		CommentDAO cd = new CommentDAO(JDBCUtil.getConnection());
		Comment comment = cd.getCommentByID(id_c);
		
		KhachHang auth = (KhachHang) request.getSession().getAttribute("khachHang");
		HttpSession session = request.getSession();
		String referringURL = request.getHeader("referer");
        session.setAttribute("referringURL", referringURL);
        
		String baoLoi="";
		if(auth != null) {
			if(auth.getMaKhachHang().equals(comment.getId_u())) {
				cd.deleteComment(id_c);
				response.sendRedirect(referringURL);
			}else {
				session.setAttribute("baoLoi", "Bạn không thể xóa bình luận của người khác!");
				response.sendRedirect(referringURL);
			}
		}else {
			session.setAttribute("baoLoi", "Bạn chưa đăng nhập!!");
			response.sendRedirect(referringURL);
		}
		
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
