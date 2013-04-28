package command;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import domain.Client;

public class EditClient implements DatabaseCommand {
	
	private Client client;
	
	public EditClient(Client client){
		this.client = client;
	}

	@Override
	public Object executeDatabaseOperation(Connection conn) throws SQLException {

		int lastIdInserted = -1;
		PreparedStatement sta = conn.prepareStatement("UPDATE CLIENT " +
				" SET IDENTITY_CARD = ?, FIRST_NAME = ? , LAST_NAME= ? , EMAIL= ? , ADDRESS= ? , PHONE= ? , " +
				" OTHER_PHONE= ? , IS_SHIPPING_ADDRESS= ? , SHIPPING_ADDRESS= ? , IS_COMPANY= ? " +
				" WHERE ID = ?");
		
		sta.setString(1,  client.getIdentityCard());
		sta.setString(2,  client.getFirstName());
		sta.setString(3,  client.getLastName());
		sta.setString(4,  client.getEmail());
		sta.setString(5,  client.getPassword());
		sta.setString(6,  client.getAddress());
		sta.setString(7,  client.getPhone());
		sta.setString(8,  client.getOtherPhone());
		sta.setBoolean(9, client.isShippingAddress());
		sta.setString(10, client.getShippingAddress());
		sta.setString(11, "0");
				
		int rowsUpdated = sta.executeUpdate();
		
		if (rowsUpdated == 1){
			
			PreparedStatement getLastInsertId = conn.prepareStatement("SELECT LAST_INSERT_ID()");  
			ResultSet rs = getLastInsertId.executeQuery();
			
			if (rs.next()){
				lastIdInserted = rs.getInt("last_insert_id()"); 
			}
			
			getLastInsertId.close();
		}
		
		sta.close();
		
		return new Integer(lastIdInserted);
	}

}
