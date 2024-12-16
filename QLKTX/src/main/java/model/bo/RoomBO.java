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
}
