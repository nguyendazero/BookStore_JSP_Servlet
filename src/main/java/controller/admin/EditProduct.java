package controller.admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database.JDBCUtil;
import database.ProductDAO;
import model.Product;

/**
 * Servlet implementation class LoadProduct
 */
@WebServlet("/edit-product")
public class EditProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public EditProduct() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String pid_string = request.getParameter("id");
		int pid = Integer.parseInt(pid_string);
		String name = request.getParameter("name");
		String category = request.getParameter("category");
		String sl = request.getParameter("soluong");
		int soluong = Integer.parseInt(sl);
		
		String price_goc_string = request.getParameter("price_goc");
		double price_goc = Double.parseDouble(price_goc_string);
		String price_string = request.getParameter("price");
		double price = Double.parseDouble(price_string);
		
		String image = request.getParameter("image");
		String trangthai = request.getParameter("trangthai");
		String mota = request.getParameter("mota");
		
		ProductDAO pDao = new ProductDAO(JDBCUtil.getConnection());
		pDao.editProduct(name, category, price, price_goc, image, trangthai, mota,soluong, pid );
		response.sendRedirect("manager-product");

		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
