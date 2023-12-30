package model;

public class Order_detail extends Product{
	private int o_id;
	private int p_id;
	private int quantity;
	
	public Order_detail() {
		
	}
	
	public Order_detail(int o_id, int p_id, int quantity) {
		this.o_id = o_id;
		this.p_id = p_id;
		this.quantity = quantity;
	}

	public int getO_id() {
		return o_id;
	}

	public void setO_id(int o_id) {
		this.o_id = o_id;
	}

	public int getP_id() {
		return p_id;
	}

	public void setP_id(int p_id) {
		this.p_id = p_id;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}


	@Override
	public String toString() {
		return "Order_detail [o_id=" + o_id + ", p_id=" + p_id + ", quantity=" + quantity + "]";
	}
	
	
	
	
}
