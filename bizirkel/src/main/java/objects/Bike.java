package objects;

public class Bike {

	private String id;
	private String name;
	private String description;
	private String type;
	private double price;
	private int amount; 
	private String category;
	private String img;
	
	
	//Getter / Setter
	public String getId() {
		return id;
	}



	public void setId(String id) {
		this.id = id;
	}



	public String getName() {
		return name;
	}



	public void setName(String name) {
		this.name = name;
	}



	public String getDescription() {
		return description;
	}



	public void setDescription(String description) {
		this.description = description;
	}



	public String getType() {
		return type;
	}



	public void setType(String type) {
		this.type = type;
	}



	public double getPrice() {
		return price;
	}



	public void setPrice(double price) {
		this.price = price;
	}



	public int getAmount() {
		return amount;
	}



	public void setAmount(int amount) {
		this.amount = amount;
	}



	public String getCategory() {
		return category;
	}



	public void setCategory(String category) {
		this.category = category;
	}



	public String getImg() {
		return img;
	}



	public void setImg(String img) {
		this.img = img;
	}


	public Bike() {
		this.id=id;
		this.name=name;
		this.description=description;
		this.type=type;
		this.price=price;
		this.amount=amount;
		this.category = category;
		this.img = img;
	}
	
}
