package database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.*;

import model.Cart;
import model.Order;
import model.Order_detail;
import model.Product;

public class OrderDAO {
	private Connection con;
	private String query;
	private PreparedStatement pst;
	private ResultSet rs;
	
	public OrderDAO(Connection con) {
		this.con = con;
	}
	
	public boolean insertOrder(Order model) {
		boolean kq = false;
		try {
			query = "insert into orders(o_id, u_id, total, date) values(?,?,?,?)";
			
			pst = this.con.prepareStatement(query);
			pst.setInt(1, model.getOrderId());
			pst.setString(2, model.getUid());
			pst.setDouble(3, model.getTotal());
			pst.setString(4, model.getDate());
			pst.executeUpdate();
			kq = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return kq;
	}
	
	public boolean insertOrderDeTail(Order_detail model) {
		boolean result = false;
		try {
			
			query = "insert into order_detail(o_id, p_id, quantity, price, name, category) VALUES(?,?,?,?,?,?)";
			
			pst = this.con.prepareStatement(query);
			
		    pst.setInt(1, model.getO_id());
			pst.setInt(2, model.getP_id());
			pst.setInt(3, model.getQuantity());
			pst.setDouble(4, model.getPrice());
			pst.setString(5, model.getName());
			pst.setString(6, model.getCategory());
			pst.executeUpdate();
			result = true;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	public List<Order_detail> Orders_id(int o_id){
		List<Order_detail> list = new ArrayList<>();
		try {
			
			query = "SELECT *FROM order_detail WHERE o_id = ?";
			pst = this.con.prepareStatement(query);
			pst.setLong(1, o_id);
			rs = pst.executeQuery();
			
			while(rs.next()) {
				Order_detail order_detail = new Order_detail();
				ProductDAO productDao = new ProductDAO(this.con);
				int pId = rs.getInt("p_id");
				
				
				Product product = productDao.getProductByID(pId);
				order_detail.setO_id(rs.getInt("o_id"));
				order_detail.setP_id(pId);
				order_detail.setPrice(product.getPrice()*rs.getInt("quantity"));
				order_detail.setQuantity(rs.getInt("quantity"));
				
				
				list.add(order_detail);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public void cancelOrder(int id) {
		try {
			query = "delete from orders where o_id=?";
			pst = this.con.prepareStatement(query);
			pst.setInt(1, id);
			pst.execute();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public List<Order> userOrders(long id){
		List<Order> list = new ArrayList<>();
		try {
			
			query = "select * from orders where u_id=? order by orders.date DESC";
			pst = this.con.prepareStatement(query);
			pst.setLong(1, id);
			rs = pst.executeQuery();
			
			while(rs.next()) {
				Order order = new Order();
				
				order.setOrderId(rs.getInt("o_id"));
				order.setTotal(rs.getDouble("total"));
				order.setDate(rs.getString("date"));
				
				list.add(order);
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public List<Order_detail> getOrderDeTailById(int id){
		List<Order_detail> list = new ArrayList<>();
		try {
			query = "SELECT * FROM order_detail WHERE order_detail.o_id = ?";
			pst = con.prepareStatement(query);
			pst.setInt(1, id);
			rs = pst.executeQuery();
			while(rs.next()) {
				Order_detail row = new Order_detail();
				row.setO_id(rs.getInt("o_id"));
				row.setP_id(rs.getInt("p_id"));
				row.setName(rs.getString("name"));
				row.setPrice(rs.getDouble("price"));
				row.setQuantity(rs.getInt("quantity"));
				row.setCategory(rs.getString("category"));
				
				
				list.add(row);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public Order getOrderByID(int id) {
		Order row = null;
		try {
			query = "select * from orders WHERE o_id=?";
			pst = con.prepareStatement(query);
			pst.setInt(1, id);
			rs = pst.executeQuery();
			
			while(rs.next()) {
				row = new Order();
				row.setOrderId(rs.getInt("o_id"));
				row.setUid(rs.getString("u_id"));
				row.setTotal(rs.getDouble("total"));
				row.setDate(rs.getString("date"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return row;
	}
	
}
