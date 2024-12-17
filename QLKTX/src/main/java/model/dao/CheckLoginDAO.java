package model.dao;

import java.sql.*;
import java.util.*;
import java.lang.*;

public class CheckLoginDAO {
	public boolean CheckUserExist(String username, String password) {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://127.0.0.1:3366/qlktx";
			Connection conn = DriverManager.getConnection(url, "root", "");
			Statement sm = conn.createStatement();
			String sql = "SELECT * FROM user WHERE username = '" + username + "' AND password = '" + password + "'";
			ResultSet rs = sm.executeQuery(sql);
			if (rs.next()) {
				if (rs.getString("username") != null)
					return true;
			}
		} catch(Exception e) {
			System.out.println("Error: " + e);
		}
		return false;
	}
}
