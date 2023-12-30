package controller.user;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import database.JDBCUtil;
import database.ProductDAO;
import model.Cart;
import model.KhachHang;
import model.Product;

/**
 * Servlet implementation class IncreaseTym
 */
@WebServlet("/inc-tym")
public class IncreaseTym extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IncreaseTym() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		try {
			KhachHang auth = (KhachHang) request.getSession().getAttribute("khachHang");
			
			if(auth != null) {
				String id_string = request.getParameter("id");
				int id = Integer.parseInt(id_string);
				
				ProductDAO pd = new ProductDAO(JDBCUtil.getConnection());
				List<Product> products = pd.getAllProductsAdmin();

				Product sanPham = pd.getProductByID(id);
				
				if(sanPham != null) {
					for(Product p:products) {
						if(p.getId() == id) {
							int luotThich = p.getTym();
							luotThich++;
							p.setTym(luotThich);
							pd.updateProductTym(id_string, luotThich);
							
							HttpSession session = request.getSession();
							String referringURL = request.getHeader("referer");
					        session.setAttribute("referringURL", referringURL);
					        
					        response.sendRedirect(referringURL);
						}
					}
				}
			}else {
				request.setAttribute("baoLoi", "Bạn chưa đăng nhập vào hệ thống!");
				request.getRequestDispatcher("dangnhap.jsp").forward(request, response);
			}
			
			
		} catch (Exception e) {
			
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
