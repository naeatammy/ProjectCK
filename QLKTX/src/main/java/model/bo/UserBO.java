package model.bo;

import model.bean.*;
import model.dao.*;
import java.util.*;
import java.lang.*;

public class UserBO {
	UserDAO userDAO = new UserDAO();
	public ArrayList<User> getAllUser() {
		return userDAO.getAllUser();
	}
	
	public User getUserById(String user_id) {
		User resUser = new User(user_id, null, null, null, null, false);
		for (User user : userDAO.getAllUser()) {
			if(user.getUser_id().equals(user_id)) resUser = user;
		}
		return resUser;
	}
	
	public String getIdByUsername(String username) {
		String user_id = new String();
		for (User user : userDAO.getAllUserLG()) {
			System.out.println(user.getUsername());
			if(user.getUsername().equals(username)) return user.getUser_id();
		}
		return user_id;
	}
	
	public boolean updateUser(User user) {
		return userDAO.updateUser(user);
	}
	
	public boolean addUser(User user) {
		return userDAO.addUser(user);
	}
}
