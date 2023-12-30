package controller.user;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.cj.x.protobuf.MysqlxCrud.Order;

import database.JDBCUtil;
import database.OrderDAO;
import database.ProductDAO;
import model.Cart;
import model.KhachHang;
import model.Order_detail;
import model.Product;

/**
 * Servlet implementation class OrderNow
 */
@WebServlet("/order-now")
public class OrderNow extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
	    response.setCharacterEncoding("UTF-8");
	    response.setContentType("text/html; charset=UTF-8");
		
		try(PrintWriter out = response.getWriter()){
	        
			KhachHang auth = (KhachHang) request.getSession().getAttribute("khachHang");
			
			if(auth != null) {
				String productId = request.getParameter("id");
				int p_id = Integer.parseInt(productId);
				
				ProductDAO pDao = new ProductDAO(JDBCUtil.getConnection());
				Product p = pDao.getProductByID(p_id);
				
				int productQuantity = Integer.parseInt(request.getParameter("quantity"));
				if(productQuantity <= 0) {
					productQuantity = 1;
				}
				
				
				
				model.Order orderModel = new model.Order();
				Random random = new Random();
				int randomNumber = random.nextInt(5000) + 1;
				orderModel.setOrderId(randomNumber);
				
				orderModel.setUid(auth.getMaKhachHang());
				orderModel.setTotal(productQuantity*p.getPrice());
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				String currentDate = sdf.format(new java.util.Date());
				orderModel.setDate(currentDate);
				
				OrderDAO orderDAO =  new OrderDAO(JDBCUtil.getConnection());
				boolean result = orderDAO.insertOrder(orderModel);
				boolean chuyenTrang = true;
				
				if(result) {
					Order_detail o_detail = new Order_detail();
					o_detail.setO_id(randomNumber);
					o_detail.setP_id(p_id);
					o_detail.setQuantity(productQuantity);
					o_detail.setPrice(p.getPrice());
					o_detail.setName(p.getName());
					o_detail.setCategory(p.getCategory());
					
					int soluongcon = p.getSoluongcon() - o_detail.getQuantity();
					p.setSoluongcon(soluongcon);
					String pIdString = String.valueOf(productId);
					pDao.updateSoluong(pIdString, soluongcon);
					
					if(p.getSoluongcon() == 0) {
						pDao.updateHetHang(pIdString);
					}else if(p.getSoluongcon() < 0) {
						p.setSoluongcon(soluongcon + o_detail.getQuantity());
						pDao.updateSoluong(pIdString, p.getSoluongcon());
						orderDAO.cancelOrder(orderModel.getOrderId());
						HttpSession session = request.getSession();
						session.setAttribute("baoLoi", "Không đủ số lượng sản phẩm <strong>" + p.getName() + "</strong> trong kho!");

						chuyenTrang = false;
					}
					
					boolean result2 = orderDAO.insertOrderDeTail(o_detail);
				}
				if(chuyenTrang == true) {
					ArrayList<Cart> cart_list = (ArrayList<Cart>) request.getSession().getAttribute("cart-list");
					if(cart_list != null) {
						for(Cart c:cart_list) {
							if(c.getId() == Integer.parseInt(productId)) {
								cart_list.remove(cart_list.indexOf(c));
								break;
							}
						}
					}
				}
				response.sendRedirect("cart.jsp");
			}else {
				response.sendRedirect("dangnhap.jsp");
			}
		}catch (Exception e) {
			e.printStackTrace();
		}		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
