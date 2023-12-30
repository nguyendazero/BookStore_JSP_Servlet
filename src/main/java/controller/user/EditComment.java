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
 * Servlet implementation class EditComment
 */
@WebServlet("/edit-comment")
public class EditComment extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public EditComment() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		String id_c = request.getParameter("id_c");
		String content = request.getParameter("content");
		
		CommentDAO cd = new CommentDAO(JDBCUtil.getConnection());
		Comment comment = cd.getCommentByID(Integer.parseInt(id_c));
		
		HttpSession session = request.getSession();
		KhachHang auth = (KhachHang) session.getAttribute("khachHang");
		String referringURL = request.getHeader("referer");
        session.setAttribute("referringURL", referringURL);
		
        if(auth != null) {
        	System.out.println(auth.getMaKhachHang()+" "+comment.getId_u());
        	if(auth.getMaKhachHang().equals(comment.getId_u())) {
    			cd.updateCommentById(content, Integer.parseInt(id_c));
    			response.sendRedirect(referringURL);
    		}else {
    			session.setAttribute("baoLoi", "Bạn không thể sửa bình luận của người khác!!");
    			response.sendRedirect(referringURL);
    		}
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
