package model.dao;

import java.sql.*;
import java.util.*;
import java.lang.*;
import model.bean.*;

public class RoomDAO {
	public ArrayList<Room> getAllRoom() {
		ArrayList<Room> roomList = new ArrayList<Room>();
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://127.0.0.1:3306/qlktx";
			Connection conn = DriverManager.getConnection(url, "root", "");
			Statement sm = conn.createStatement();
			String sql = "SELECT * FROM room";
			ResultSet rs = sm.executeQuery(sql);
			while(rs.next())
			{
				roomList.add(new Room(rs.getString("room_id"), rs.getString("type"), rs.getInt("capacity"), rs.getString("price")));
			}
			conn.close();
		}catch(Exception e)
		{
			System.out.print("Error: " + e);
		}
		return roomList;
	}
}
