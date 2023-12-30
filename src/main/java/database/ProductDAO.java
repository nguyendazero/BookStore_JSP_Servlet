package database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.*;
import model.*;

public class ProductDAO {
	private Connection con;
	private String query;
	private PreparedStatement pst;
	private ResultSet rs;
	
	public ProductDAO(Connection con) {
		this.con = con;
	}
	
	public List<Product> getAllProducts(){
		List<Product> products = new ArrayList<Product>();
		
		try {
			query = "SELECT * FROM product WHERE trangthai NOT IN ('hết hàng', 'giảm giá') ORDER BY product.id asc";
			pst = this.con.prepareStatement(query);
			rs = pst.executeQuery();
			while(rs.next()) {
				Product row = new Product();
				row.setId(rs.getInt("id"));
				row.setName(rs.getString("name"));
				row.setCategory(rs.getString("category"));
				row.setPrice(rs.getDouble("price"));
				row.setImage(rs.getString("image"));
				row.setTym(rs.getInt("tym"));
				row.setSoluongcon(rs.getInt("soluongcon"));
				
				products.add(row);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return products;
	}
	
	public List<Product> getAllProductsAdmin(){
		List<Product> products = new ArrayList<Product>();
		
		try {
			query = "SELECT * FROM product ORDER BY name ASC";
			pst = this.con.prepareStatement(query);
			rs = pst.executeQuery();
			while(rs.next()) {
				Product row = new Product();
				row.setId(rs.getInt("id"));
				row.setName(rs.getString("name"));
				row.setCategory(rs.getString("category"));
				row.setPrice(rs.getDouble("price"));
				row.setPrice_goc(rs.getDouble("price_goc"));
				row.setImage(rs.getString("image"));
				row.setMota(rs.getString("mota"));
				row.setTrangthai(rs.getString("trangthai"));
				row.setTym(rs.getInt("tym"));
				row.setSoluongcon(rs.getInt("soluongcon"));
				
				products.add(row);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return products;
	}
	
	public List<Product> getKhoaHocProducts(){
		List<Product> products = new ArrayList<Product>();
		
		try {
			query = "select * from product where category=?";
			pst = this.con.prepareStatement(query);
			pst.setString(1, "Khoa Học");
			rs = pst.executeQuery();
			while(rs.next()) {
				Product row = new Product();
				row.setId(rs.getInt("id"));
				row.setName(rs.getString("name"));
				row.setCategory(rs.getString("category"));
				row.setPrice(rs.getDouble("price"));
				row.setImage(rs.getString("image"));
				row.setTym(rs.getInt("tym"));
				row.setSoluongcon(rs.getInt("soluongcon"));
				
				products.add(row);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return products;
	}
	
	public List<Product> getLoiSongProducts(){
		List<Product> products = new ArrayList<Product>();
		
		try {
			query = "select * from product where category=?";
			pst = this.con.prepareStatement(query);
			pst.setString(1, "Lối Sống");
			rs = pst.executeQuery();
			while(rs.next()) {
				Product row = new Product();
				row.setId(rs.getInt("id"));
				row.setName(rs.getString("name"));
				row.setCategory(rs.getString("category"));
				row.setPrice(rs.getDouble("price"));
				row.setImage(rs.getString("image"));
				row.setTym(rs.getInt("tym"));
				row.setSoluongcon(rs.getInt("soluongcon"));
				
				products.add(row);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return products;
	}
	
	public List<Product> getNuocNgoaiProducts(){
		List<Product> products = new ArrayList<Product>();
		
		try {
			query = "select * from product where category=?";
			pst = this.con.prepareStatement(query);
			pst.setString(1, "Nước Ngoài");
			rs = pst.executeQuery();
			while(rs.next()) {
				Product row = new Product();
				row.setId(rs.getInt("id"));
				row.setName(rs.getString("name"));
				row.setCategory(rs.getString("category"));
				row.setPrice(rs.getDouble("price"));
				row.setImage(rs.getString("image"));
				row.setTym(rs.getInt("tym"));
				row.setSoluongcon(rs.getInt("soluongcon"));
				
				products.add(row);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return products;
	}
	
	public List<Product> getThamKhaoProducts(){
		List<Product> products = new ArrayList<Product>();
		
		try {
			query = "select * from product where category=?";
			pst = this.con.prepareStatement(query);
			pst.setString(1, "Tham Khảo");
			rs = pst.executeQuery();
			while(rs.next()) {
				Product row = new Product();
				row.setId(rs.getInt("id"));
				row.setName(rs.getString("name"));
				row.setCategory(rs.getString("category"));
				row.setPrice(rs.getDouble("price"));
				row.setImage(rs.getString("image"));
				row.setTym(rs.getInt("tym"));
				row.setSoluongcon(rs.getInt("soluongcon"));
				
				products.add(row);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return products;
	}
	
	public List<Product> getThieuNhiProducts(){
		List<Product> products = new ArrayList<Product>();
		
		try {
			query = "select * from product where category=?";
			pst = this.con.prepareStatement(query);
			pst.setString(1, "Thiếu Nhi");
			rs = pst.executeQuery();
			while(rs.next()) {
				Product row = new Product();
				row.setId(rs.getInt("id"));
				row.setName(rs.getString("name"));
				row.setCategory(rs.getString("category"));
				row.setPrice(rs.getDouble("price"));
				row.setImage(rs.getString("image"));
				row.setTym(rs.getInt("tym"));
				row.setSoluongcon(rs.getInt("soluongcon"));
				
				products.add(row);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return products;
	}
	
	public List<Product> getTHotProducts(){
		List<Product> products = new ArrayList<Product>();
		
		try {
			query = "SELECT * FROM product ORDER BY tym DESC LIMIT 4";
			pst = this.con.prepareStatement(query);
//			pst.setString(1, "Thiếu Nhi");
			rs = pst.executeQuery();
			while(rs.next()) {
				Product row = new Product();
				row.setId(rs.getInt("id"));
				row.setName(rs.getString("name"));
				row.setCategory(rs.getString("category"));
				row.setPrice(rs.getDouble("price"));
				row.setPrice_goc(rs.getDouble("price_goc"));
				row.setImage(rs.getString("image"));
				row.setTym(rs.getInt("tym"));
				row.setSoluongcon(rs.getInt("soluongcon"));
				
				products.add(row);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return products;
	}
	
	public List<Product> getHetHangProducts(){
		List<Product> products = new ArrayList<Product>();
		
		try {
			query = "select * from product where trangthai=?";
			pst = this.con.prepareStatement(query);
			pst.setString(1, "hết hàng");
			rs = pst.executeQuery();
			while(rs.next()) {
				Product row = new Product();
				row.setId(rs.getInt("id"));
				row.setName(rs.getString("name"));
				row.setCategory(rs.getString("category"));
				row.setPrice(rs.getDouble("price"));
				row.setImage(rs.getString("image"));
				row.setTym(rs.getInt("tym"));
				row.setSoluongcon(rs.getInt("soluongcon"));
				
				products.add(row);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return products;
	}
	
	public List<Product> getGiamGiaProducts(){
		List<Product> products = new ArrayList<Product>();
		
		try {
			query = "select * from product where trangthai=?";
			pst = this.con.prepareStatement(query);
			pst.setString(1, "giảm giá");
			rs = pst.executeQuery();
			while(rs.next()) {
				Product row = new Product();
				row.setId(rs.getInt("id"));
				row.setName(rs.getString("name"));
				row.setCategory(rs.getString("category"));
				row.setPrice(rs.getDouble("price"));
				row.setPrice_goc(rs.getDouble("price_goc"));
				row.setImage(rs.getString("image"));
				row.setTym(rs.getInt("tym"));
				row.setSoluongcon(rs.getInt("soluongcon"));
				
				
				products.add(row);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return products;
	}
	
	public List<Cart> getCartProducts(ArrayList<Cart> cartList){
		List<Cart> products = new ArrayList<Cart>();
		try {
			if(cartList.size()>0) {
				for(Cart item:cartList) {
					query = "select * from product where id=?";
					pst = this.con.prepareStatement(query);
					pst.setInt(1, item.getId());
					rs = pst.executeQuery();
					while(rs.next()) {
						Cart row = new Cart();
						row.setId(rs.getInt("id"));
						row.setName(rs.getString("name"));
						row.setCategory(rs.getString("category"));
						row.setPrice(rs.getDouble("price")*item.getQuantity());
						row.setQuantity(item.getQuantity());
						products.add(row);
						
					}
				}
			}
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
		}
		return products;
	}
	

	
	public Product getProductByID(int id) {
		Product row = null;
		try {
			query = "select * from product where id=?";
			pst = con.prepareStatement(query);
			pst.setInt(1, id);
			rs = pst.executeQuery();
			
			while(rs.next()) {
				row = new Product();
				row.setId(rs.getInt("id"));
				row.setName(rs.getString("name"));
				row.setCategory(rs.getString("category"));
				row.setPrice(rs.getDouble("price"));
				row.setImage(rs.getString("image"));	
				row.setMota(rs.getString("mota"));
				row.setTrangthai(rs.getString("trangthai"));
				row.setTym(rs.getInt("tym"));
				row.setSoluongcon(rs.getInt("soluongcon"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return row;
	}
	
	public List<Product> searchByName(String txtSearch){
		List<Product> list = new ArrayList<>();
		try {
			query = "select * from product where name like ?";
			pst = con.prepareStatement(query);
			pst.setString(1,"%" + txtSearch+"%");
			rs = pst.executeQuery();
			while(rs.next()) {
				Product row = new Product();
				row.setId(rs.getInt("id"));
				row.setName(rs.getString("name"));
				row.setCategory(rs.getString("category"));
				row.setPrice(rs.getDouble("price"));
				row.setImage(rs.getString("image"));
				row.setMota(rs.getString("mota"));
				row.setTrangthai(rs.getString("trangthai"));
				row.setTym(rs.getInt("tym"));
				row.setSoluongcon(rs.getInt("soluongcon"));
				
				list.add(row);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public double getTotalCartPrice(ArrayList<Cart> cartList) {
		double sum = 0;
		
		try {
			if(cartList.size() > 0) {
				for(Cart item:cartList) {
					query = "select price from product where id=?";
					pst = this.con.prepareStatement(query);
					pst.setInt(1, item.getId());
					rs = pst.executeQuery();
					
					while(rs.next()) {
						sum+=rs.getDouble("price")*item.getQuantity();
					}
				}
			}
			
			 
		} catch (Exception e) {
			e.printStackTrace();
		}
		return sum;
	}
	
	public void insertProduct(String name, String category, double price, double price_goc, String image, String trangthai, String mota, int tym, int soluongcon) {
		try {
			query = "INSERT INTO product( NAME, category, price, price_goc, image, trangthai, mota, tym, soluongcon)\n"
					+ "VALUE(?,?,?,?,?,?,?,?,?)";
			pst = con.prepareStatement(query);
			pst.setString(1,name);
			pst.setString(2,category);
			pst.setDouble(3,price);
			pst.setDouble(4,price_goc);
			pst.setString(5,image);
			pst.setString(6,trangthai);
			pst.setString(7,mota);
			pst.setInt(8, tym);
			pst.setInt(9, soluongcon);
			
			pst.executeUpdate();
		} catch (Exception e) {
			
		}
	}
	
	public void editProduct(String name, String category, double price, double price_goc, String image, String trangthai, String mota, int soluong, int id) {
		try {
			query = "UPDATE product\n"
					+ "SET NAME = ?, category = ?, price = ?, price_goc = ?, image = ?, trangthai = ?, mota = ?, soluongcon = ?\n"
					+ "WHERE id = ?";
			pst = con.prepareStatement(query);
			
			
			pst.setString(1,name);
			pst.setString(2,category);
			pst.setDouble(3,price);
			pst.setDouble(4,price_goc);
			pst.setString(5,image);
			pst.setString(6,trangthai);
			pst.setString(7,mota);
			pst.setInt(8,soluong);
			pst.setInt(9,id);
			
			pst.executeUpdate();
		} catch (Exception e) {
			
		}
	}
	
	public void updateProductTym(String id, int tym){
		try {
			query = "UPDATE product\n"
					+ "SET tym = ?\n"
					+ "WHERE id = ?";
			pst = con.prepareStatement(query);

			pst.setInt(1,tym);
			pst.setString(2,id);
			
			pst.executeUpdate();
		} catch (Exception e) {
			
		}
	}
	
	public void updateSoluong(String id, int soluongcon){
		try {
			query = "UPDATE product\n"
					+ "SET soluongcon = ?\n"
					+ "WHERE id = ?";
			pst = con.prepareStatement(query);

			pst.setInt(1,soluongcon);
			pst.setString(2,id);
			
			pst.executeUpdate();
		} catch (Exception e) {
			
		}
	}
	
	public void updateHetHang(String id){
		try {
			query = "UPDATE product\n"
					+ "SET trangthai = 'hết hàng'\n"
					+ "WHERE id = ?";
			pst = con.prepareStatement(query);

			pst.setString(1,id);
			pst.executeUpdate();
		} catch (Exception e) {
			
		}
	}
	
	public void deleteProduct(String pid) {
		try {
			query = "delete from product where id=?";
			pst = con.prepareStatement(query);
			pst.setString(1,pid);
			pst.executeUpdate();
		} catch (Exception e) {
			
		}
	}
	
	
}
