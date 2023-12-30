package controller.user;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import database.JDBCUtil;
import database.ProductDAO;
import model.Product;

/**
 * Servlet implementation class DetailProduct
 */
@WebServlet("/detail")
public class DetailProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DetailProduct() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String id_string = request.getParameter("id");
		int id = Integer.parseInt(id_string);
		
		HttpSession session = request.getSession();
		session.setAttribute("id_p", id);
		
		ProductDAO pDao = new ProductDAO(JDBCUtil.getConnection());
		Product p = pDao.getProductByID(id);
		request.setAttribute("detail", p);
		
		if(p.getTrangthai().equals("hết hàng")) {
			request.getRequestDispatcher("detailhethang.jsp").forward(request, response);
		}else {
			request.getRequestDispatcher("detail.jsp").forward(request, response);
		}
		
			
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
