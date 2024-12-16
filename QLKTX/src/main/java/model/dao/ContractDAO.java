package model.dao;

import model.bean.*;
import java.util.*;
import java.sql.*;
import java.lang.*;

public class ContractDAO {
	public ArrayList<Contract> getAllContract() {
		ArrayList<Contract> contractList = new ArrayList<Contract>();
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://127.0.0.1:3306/qlktx";
			Connection conn = DriverManager.getConnection(url, "root", "");
			Statement sm = conn.createStatement();
			String sql = "SELECT * FROM contract";
			ResultSet rs = sm.executeQuery(sql);
			while(rs.next())
			{
				contractList.add(new Contract(rs.getString("contract_id"), rs.getString("user_id"), rs.getString("room_id"), rs.getInt("duration"), rs.getDate("start"), rs.getDate("end"), rs.getString("state")));
			}
			conn.close();
		}catch(Exception e)
		{
			System.out.print("Error: " + e);
		}
		return contractList;
	}
}
