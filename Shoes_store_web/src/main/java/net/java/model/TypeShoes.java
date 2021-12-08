package net.java.model;

public class TypeShoes {
	private int id;
	private String name;
	private int manOrWomen;
	
	
	public TypeShoes(int id, String name, int manOrWomen) {
		super();
		this.id = id;
		this.name = name;
		this.manOrWomen = manOrWomen;
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
	public int getManOrWomen() {
		return manOrWomen;
	}
	public void setManOrWomen(int manOrWomen) {
		this.manOrWomen = manOrWomen;
	}
	
}
