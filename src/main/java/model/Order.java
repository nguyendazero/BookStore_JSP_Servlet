package model;

public class Order{
	private int orderId;
	private String uid;
	private double total;
	private String date;
	
	public Order() {
		
	}

	public Order(int orderId, String uid, int total, String date) {
		super();
		this.orderId = orderId;
		this.uid = uid;
		this.total = total;
		this.date = date;
	}

	public Order(String uid, int total, String date) {
		super();
		this.uid = uid;
		this.total = total;
		this.date = date;
	}

	public int getOrderId() {
		return orderId;
	}

	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}

	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public double getTotal() {
		return total;
	}

	public void setTotal(double d) {
		this.total = d;
	}

	@Override
	public String toString() {
		return "Order [orderId=" + orderId + ", uid=" + uid + ", total=" + total + ", date=" + date + "]";
	}
	
}
