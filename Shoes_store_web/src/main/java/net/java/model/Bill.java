package net.java.model;

public class Bill {

	private String id;
	private long TotalPrice;
	private String buyDate;
	
	
	public Bill(String id, long totalPrice, String buyDate) {
		super();
		this.id = id;
		TotalPrice = totalPrice;
		this.buyDate = buyDate;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public long getTotalPrice() {
		return TotalPrice;
	}
	public void setTotalPrice(long totalPrice) {
		TotalPrice = totalPrice;
	}
	public String getBuyDate() {
		return buyDate;
	}
	public void setBuyDate(String buyDate) {
		this.buyDate = buyDate;
	}
	
}
