package model.dao;

import model.bean.*;
import java.sql.*;
import java.util.*;
import java.lang.*;

public class U_R_RecordDAO {
	public ArrayList<U_R_Record> getAllRecord() {
		ArrayList<U_R_Record> recordList = new ArrayList<U_R_Record>();
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://127.0.0.1:3306/qlktx";
			Connection conn = DriverManager.getConnection(url, "root", "");
			Statement sm = conn.createStatement();
			String sql = "SELECT * FROM user_room_record";
			ResultSet rs = sm.executeQuery(sql);
			while(rs.next())
			{
				recordList.add(new U_R_Record(rs.getString("room_id"), rs.getString("user_id"), rs.getInt("month"), rs.getInt("year"), rs.getBoolean("room"), rs.getBoolean("electric"), rs.getBoolean("water"), rs.getBoolean("wifi")));
			}
			conn.close();
		}catch(Exception e)
		{
			System.out.print("Error: " + e);
		}
		return recordList;
	}
}