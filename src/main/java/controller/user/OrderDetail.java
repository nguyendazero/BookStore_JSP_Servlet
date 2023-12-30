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
import database.OrderDAO;
import model.Cart;
import model.Order;
import model.Order_detail;


@WebServlet("/order-detail")
public class OrderDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public OrderDetail() {
        super();

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
	    response.setCharacterEncoding("UTF-8");
	    response.setContentType("text/html; charset=UTF-8");
		try {
			String id_string = request.getParameter("id");
			int id = Integer.parseInt(id_string);
			
			HttpSession session_id_Orders = request.getSession();
			session_id_Orders.setAttribute("session_id_Orders", id_string);
			
			if(id_string!=null) {
				OrderDAO oDao = new OrderDAO(JDBCUtil.getConnection());
	            List<Order_detail> order_list = oDao.getOrderDeTailById(id);
			}
			response.sendRedirect("orders_detail.jsp");
            
            
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
