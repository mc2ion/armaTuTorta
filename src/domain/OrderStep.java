package domain;

public class OrderStep {
	
	private long id;
	private long orderTypeId;
	private String name;
	private int position;
	private boolean isMultipleChoice;
	
	public void setId(long id) {
		this.id = id;
	}
	
	public long getId() {
		return id;
	}
	
	public void setOrderTypeId(long orderTypeId) {
		this.orderTypeId = orderTypeId;
	}
	
	public long getOrderTypeId() {
		return orderTypeId;
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

	public void setMultipleChoice(boolean isMultipleChoice) {
		this.isMultipleChoice = isMultipleChoice;
	}

	public boolean isMultipleChoice() {
		return isMultipleChoice;
	}

}
