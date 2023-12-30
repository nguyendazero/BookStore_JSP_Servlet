package controller.user;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import database.JDBCUtil;
import database.OrderDAO;
import database.ProductDAO;
import model.Cart;
import model.KhachHang;
import model.Order;
import model.Order_detail;
import model.Product;

/**
 * Servlet implementation class CheckOut
 */
@WebServlet("/cart-check-out")
public class CheckOut extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
	    response.setCharacterEncoding("UTF-8");
	    response.setContentType("text/html; charset=UTF-8");
		
		try(PrintWriter out = response.getWriter()){

			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
			Date date = new Date();

			ArrayList<Cart> cart_list = (ArrayList<Cart>) request.getSession().getAttribute("cart-list");
			
			KhachHang auth = (KhachHang) request.getSession().getAttribute("khachHang");
			
			Double total = (Double) request.getSession().getAttribute("total");

			if(cart_list != null && auth != null) {
					Order order = new Order();
					
					Random random = new Random();
					int randomNumber = random.nextInt(5000) + 1;
					order.setOrderId(randomNumber);
					order.setUid(auth.getMaKhachHang());
					order.setTotal(total);
					order.setDate(formatter.format(date));
					
					OrderDAO oDao = new OrderDAO(JDBCUtil.getConnection());
					boolean result = oDao.insertOrder(order);
					
					if(order.getTotal() == 0) {
						HttpSession session = request.getSession();
						session.setAttribute("baoLoi", "Không có sản phẩm nào trong giỏ hàng!");
						response.sendRedirect("cart.jsp");
						oDao.cancelOrder(randomNumber);
					}
					
					boolean chuyenTrang = true;
					if(result) {
						
						List<Order_detail> temp = new ArrayList<>();
						int dem = 0;
						
						for(Cart od:cart_list) {
							Order_detail o_detail = new Order_detail();
							o_detail.setO_id(randomNumber);
							o_detail.setP_id(od.getId());
							int pId = o_detail.getP_id();
							o_detail.setQuantity(od.getQuantity());
							
							ProductDAO pDao = new ProductDAO(JDBCUtil.getConnection());
							Product p = pDao.getProductByID(pId);
							o_detail.setPrice(p.getPrice());
							o_detail.setName(p.getName());
							o_detail.setCategory(p.getCategory());
							
							int soluongcon = p.getSoluongcon() - o_detail.getQuantity();
							p.setSoluongcon(soluongcon);
							String pIdString = String.valueOf(pId);
							pDao.updateSoluong(pIdString, soluongcon); 
							
							if(p.getSoluongcon() == 0) {
								pDao.updateHetHang(pIdString);
							}else if(p.getSoluongcon() < 0) {
								p.setSoluongcon(soluongcon + o_detail.getQuantity());
								pDao.updateSoluong(pIdString, p.getSoluongcon());
								oDao.cancelOrder(order.getOrderId());
								HttpSession session = request.getSession();
								session.setAttribute("baoLoi", "Không đủ số lượng sản phẩm <strong>" + p.getName() + "</strong> trong kho!");

								chuyenTrang = false;
			
							}
							boolean result2 = oDao.insertOrderDeTail(o_detail);
							if(result2) {
								temp.add(o_detail);
								dem++;
							}else {
								break;
							}
						}
						if(dem != cart_list.size()) {
							for (Order_detail daThem : temp) {
								ProductDAO pDao = new ProductDAO(JDBCUtil.getConnection());
								Product p = pDao.getProductByID(daThem.getP_id());
								p.setSoluongcon(p.getSoluongcon() + daThem.getQuantity());
								pDao.updateSoluong(String.valueOf(daThem.getP_id()), p.getSoluongcon());
							}
						}
						if(chuyenTrang == false) {
							response.sendRedirect("cart.jsp");
						}else {
							cart_list.clear();
							response.sendRedirect("orders.jsp");
						}
					}
			}else {
				if(auth == null) response.sendRedirect("dangnhap.jsp");
				response.sendRedirect("cart.jsp");
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
