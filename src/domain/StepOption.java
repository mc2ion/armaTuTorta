package domain;

public class StepOption {
	
	private long id;
	private long orderStepId;
	private String name;
	private int position;
	private double price;
	private boolean isUnavailable;
	
	public void setId(long id) {
		this.id = id;
	}
	
	public long getId() {
		return id;
	}

	public void setOrderStepId(long orderStepId) {
		this.orderStepId = orderStepId;
	}

	public long getOrderStepId() {
		return orderStepId;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getName() {
		return name;
	}

	public void setPosition(int position) {
		this.position = position;
	}

	public int getPosition() {
		return position;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public double getPrice() {
		return price;
	}

	public void setUnavailable(boolean isUnavailable) {
		this.isUnavailable = isUnavailable;
	}

	public boolean isUnavailable() {
		return isUnavailable;
	}
	
	

}
