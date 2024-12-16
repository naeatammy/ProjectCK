package model.bo;

import java.sql.*;
import java.util.*;
import java.lang.*;
import model.bean.*;
import model.dao.*;

public class RoomBO {
	RoomDAO roomDAO = new RoomDAO();
	public ArrayList<Room> getAllRoom() {
		return roomDAO.getAllRoom();
	}
	
	public Room getRoomById(String room_id) {
		Room resRoom = new Room(room_id, "Nam", 4, "500000");
		for (Room room : roomDAO.getAllRoom()) {
			if(room.getRoom_id().equals(room_id)) resRoom = room;
		}
		return resRoom;
	}
	
	public boolean addRoom(Room room) {
		return roomDAO.addRoom(room);
	}
}
