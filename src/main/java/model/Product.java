package model;

public class Product {
	private int id;
	private String name;
	private String category;
	private double price;
	private double price_goc;
	private String image;
	private String trangthai;
	private String mota;
	private int tym;
	private int soluongcon;
	
	
	public Product() {

	}
	
	public Product(int id, String name, String category, double price,double price_goc, String image, String trangthai, String mota, int tym, int soluongcon) {
		this.id = id;
		this.name = name;
		this.category = category;
		this.price = price;
		this.price_goc = price_goc;
		this.image = image;
		this.trangthai = trangthai;
		this.mota = mota;
		this.tym = tym;
		this.soluongcon = soluongcon;
	}
	
	

	public int getSoluongcon() {
		return soluongcon;
	}

	public void setSoluongcon(int soluongcon) {
		this.soluongcon = soluongcon;
	}

	public int getTym() {
		return tym;
	}

	public void setTym(int tym) {
		this.tym = tym;
	}

	public String getTrangthai() {
		return trangthai;
	}

	public void setTrangthai(String trangthai) {
		this.trangthai = trangthai;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public double getPrice_goc() {
		return price_goc;
	}

	public void setPrice_goc(double price_goc) {
		this.price_goc = price_goc;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}
	
	

	public String getMota() {
		return mota;
	}

	public void setMota(String mota) {
		this.mota = mota;
	}

	@Override
	public String toString() {
		return "Product [id=" + id + ", name=" + name + ", category=" + category + ", price=" + price + ", price_goc="
				+ price_goc + ", image=" + image + ", trangthai=" + trangthai + ", mota=" + mota + ", tym=" + tym
				+ ", soluongcon=" + soluongcon + "]";
	}
	
	
}
