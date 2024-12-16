package model.dao;

import model.bean.*;
import java.util.*;
import java.lang.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.io.*;

public class UserDAO {
	public ArrayList<User> getAllUser() {
		ArrayList<User> userList = new ArrayList<User>();
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://127.0.0.1:3306/qlktx";
			Connection conn = DriverManager.getConnection(url, "root", "");
			Statement sm = conn.createStatement();
			String sql = "SELECT * FROM user";
			ResultSet rs = sm.executeQuery(sql);
			while(rs.next())
			{
				if(rs.getString("id").equals("0000000000")) continue;
				userList.add(new User(rs.getString("id"), rs.getString("firstname"), rs.getString("lastname"), rs.getString("phonenumber"), rs.getString("cccd"), rs.getBoolean("gender")));
			}
			conn.close();
		}catch(Exception e)
		{
			System.out.print("Error: " + e);
		}
		return userList;
	}
}
