package controller.admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database.JDBCUtil;
import database.ProductDAO;

/**
 * Servlet implementation class AddProduct
 */
@WebServlet("/add-product")
public class AddProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public AddProduct() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String name = request.getParameter("name");
		String category = request.getParameter("category");
		String sl = request.getParameter("soluong");
		int soluong = Integer.parseInt(sl);
		String price_string = request.getParameter("price");
		double price = Double.parseDouble(price_string);
		String image = request.getParameter("image");
		String mota = request.getParameter("mota");
		
		ProductDAO pDao = new ProductDAO(JDBCUtil.getConnection());
		pDao.insertProduct(name, category, price, 0, image, "đang bán", mota,0, soluong);
		response.sendRedirect("manager-product");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
