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
			String url = "jdbc:mysql://127.0.0.1:3366/qlktx";
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
	
	public boolean addRoom(Room room) {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://127.0.0.1:3366/qlktx";
			Connection conn = DriverManager.getConnection(url, "root", "");
			Statement sm = conn.createStatement();
			String sql = "INSERT INTO `room`(`room_id`, `type`, `capacity`, `price`) VALUES ('"+room.getRoom_id()+"','"+room.getType()+"','"+room.getCapacity()+"','"+room.getPrice()+"')";
			int rowAffected = sm.executeUpdate(sql);
			return rowAffected > 0;
		} catch(Exception e) {
			System.out.println(e);
			return false;
		}
	}
	
	public boolean updateRoom(Room room) {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://127.0.0.1:3366/qlktx";
			Connection conn = DriverManager.getConnection(url, "root", "");
			Statement sm = conn.createStatement();
			String sql = "UPDATE `room` SET `price`='" + room.getPrice() + "' WHERE `room_id` = '" + room.getRoom_id() + "'";
			int rowAffected = sm.executeUpdate(sql);
			return rowAffected > 0;
		} catch(Exception e) {
			System.out.println(e);
			return false;
		}
	}
	
	public boolean deleteRoom(String room_id) {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://127.0.0.1:3366/qlktx";
			Connection conn = DriverManager.getConnection(url, "root", "");
			Statement sm = conn.createStatement();
			String sql = "DELETE FROM `room` WHERE `room_id` = '" + room_id + "'";
			int rowAffected = sm.executeUpdate(sql);
			return rowAffected > 0;
		} catch(Exception e) {
			System.out.println(e);
			return false;
		}
	}
}
