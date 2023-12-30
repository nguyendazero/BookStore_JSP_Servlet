package controller.user;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Cart;

/**
 * Servlet implementation class AddToCart
 */
@WebServlet("/add-to-cart")
public class AddToCart extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    request.setCharacterEncoding("UTF-8");
	    response.setCharacterEncoding("UTF-8");
	    response.setContentType("text/html; charset=UTF-8");

	    try(PrintWriter out = response.getWriter()){
	        ArrayList<Cart> cartList = new ArrayList<>();

	        int id = Integer.parseInt(request.getParameter("id"));
	        Cart cm = new Cart();
	        cm.setId(id);
	        cm.setQuantity(1);

	        HttpSession session = request.getSession();
	        ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");

	        
	        String referringURL = request.getHeader("referer");
	        session.setAttribute("referringURL", referringURL);

	        if(cart_list == null) {
	            cartList.add(cm);
	            session.setAttribute("cart-list", cartList);
	            response.sendRedirect(referringURL); 
	        } else {
	            cartList = cart_list;
	            boolean exist = false;

	            for(Cart c:cart_list) {
	                if(c.getId() == id) {
	                    exist = true;
	                    out.println("<h3 style='color:crimson; text-align:center'>Sản phẩm đã được thêm vào giỏ hàng.\n<a href='cart.jsp'>Đi đến giỏ hàng</a></h3>");
	                }
	            }

	            if(!exist) {
	                cartList.add(cm);
	                response.sendRedirect(referringURL);
	            }
	        }
	    }
	}



}
