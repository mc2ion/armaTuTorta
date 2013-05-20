package command;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.List;


import domain.Order;
import domain.OrderItem;

public class CreateOrder implements DatabaseCommand {
	
	private Order order;
	private List<OrderItem> orderItems;

	public CreateOrder(Order order, List<OrderItem> orderItems) {
		this.order = order;
		this.orderItems = orderItems;
	}

	@Override
	public Object executeDatabaseOperation(Connection conn) throws SQLException {
		
		PreparedStatement sta = conn.prepareStatement("INSERT INTO `order` (`CLIENT_ID`, `ORDER_TYPE_ID`, `ORDER_DATE`, `TOTAL`, `DELIVERY_DATE`, `IS_PENDING`) " +
				"VALUES (?, ?, DATE(CURDATE()), ?,?, ?)");
		sta.setLong(1, order.getClientId());
		sta.setLong(2, order.getOrderTypeId());
		sta.setDouble(3, order.getTotal());
		
		java.sql.Date dte = null;
		try{
			SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy"); 
			java.util.Date dt = formatter.parse(order.getDeliveryDate());
			dte = new java.sql.Date(dt.getTime());
		}catch(Exception e){
			e.printStackTrace();	
		}	
		
		sta.setDate(4, dte);
		sta.setInt(5, order.getIsPending());
		
		long lastIdInserted = -1;
		
		int rowsUpdated = sta.executeUpdate();
		
		if (rowsUpdated == 1){
			
			PreparedStatement getLastInsertId = conn.prepareStatement("SELECT LAST_INSERT_ID()");  
			ResultSet rs = getLastInsertId.executeQuery();
			
			if (rs.next()){
				lastIdInserted = rs.getLong("last_insert_id()"); 
				for (int i = 0; i < orderItems.size(); i++){
					OrderItem item = orderItems.get(i);
					sta = conn.prepareStatement("INSERT INTO order_item (ORDER_ID, STEP_OPTION_ID, PRICE, ADDITIONAL_INFO)" +
							" VALUES (?, ?, ?, ?)");
					sta.setLong(1, lastIdInserted);
					sta.setLong(2, item.getStepOptionId());
					sta.setDouble(3,item.getPrice());
					if (item.getNombreImg() != null)
						sta.setString(4,item.getNombreImg());
					else if(item.getCantDocenas() != null)
						sta.setString(4,item.getCantDocenas());
					else if (item.getTxtCalcomania() != null)
						sta.setString(4,item.getTxtCalcomania());
					else
						sta.setString(4,null);
					sta.executeUpdate();
				}
				
			}
			
			getLastInsertId.close();
		}
		
		sta.close();
		
		return new Long(lastIdInserted);
	}

}
