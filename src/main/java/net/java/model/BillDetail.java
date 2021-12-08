package net.java.model;

public class BillDetail {
	private int id;
	private long unitPrice;
	private int quantity;
	private Shoes shoes;
	
	public BillDetail() {
		super();
	}

	public BillDetail(int id, long unitPrice, int quantity, Shoes shoes) {
		super();
		this.id = id;
		this.unitPrice = unitPrice;
		this.quantity = quantity;
		this.shoes = shoes;
	}
	
	public int getId() {
		return id;
	}
	
	public void setId(int id) {
		this.id = id;
	}
	public long getUnitPrice() {
		return unitPrice;
	}
	public void setUnitPrice(long unitPrice) {
		this.unitPrice = unitPrice;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public Shoes getShoes() {
		return shoes;
	}
	public void setShoes(Shoes shoes) {
		this.shoes = shoes;
	}
	
	
}
