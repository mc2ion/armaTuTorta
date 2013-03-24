package domain;

public class Order {
	
	private long id;
	private long clientId;
	private long orderTypeId;
	private String orderDate;
	private double total;
	private String deliveryDate;
	
	public void setId(long id) {
		this.id = id;
	}
	
	public long getId() {
		return id;
	}

	public void setClientId(long clientId) {
		this.clientId = clientId;
	}

	public long getClientId() {
		return clientId;
	}

	public void setOrderTypeId(long orderTypeId) {
		this.orderTypeId = orderTypeId;
	}

	public long getOrderTypeId() {
		return orderTypeId;
	}

	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}

	public String getOrderDate() {
		return orderDate;
	}

	public void setTotal(double total) {
		this.total = total;
	}

	public double getTotal() {
		return total;
	}

	public void setDeliveryDate(String deliveryDate) {
		this.deliveryDate = deliveryDate;
	}

	public String getDeliveryDate() {
		return deliveryDate;
	}
}
