package command;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import domain.Album;

public class CreateAlbum implements DatabaseCommand {
	
	private Album album;
	
	public CreateAlbum(Album album){
		this.album = album;
	}

	@Override
	public Object executeDatabaseOperation(Connection conn) throws SQLException {
		
		PreparedStatement sta = conn.prepareStatement("INSERT INTO ALBUM (NAME, IMAGE, IS_ACTIVE, IS_NEW) VALUES (?, ?, ?, ?)");
		
		sta.setString(1, album.getName());
		sta.setString(2, album.getImage());
		sta.setInt(3, album.isActive());
		sta.setInt(4, album.isNew());
		int rowsUpdated = sta.executeUpdate();
		sta.close();
		return new Integer(rowsUpdated);
	}

}
