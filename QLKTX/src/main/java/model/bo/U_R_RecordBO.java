package model.bo;

import model.bean.*;
import model.dao.*;
import java.util.*;
import java.lang.*;

public class U_R_RecordBO {
	U_R_RecordDAO recordDAO = new U_R_RecordDAO();
	public int countRecord(int month, int year, String room_id) {
		ArrayList<U_R_Record> recordList = recordDAO.getAllRecord();
		int cnt = 0;
		for (U_R_Record record : recordList) {
			if(month == record.getMonth() && year == record.getYear() && room_id.equals(record.getRoom_id())) {
				cnt++;
			}
		}
		return cnt;
	}
	public ArrayList<U_R_Record> getAllRecord(int month, int year, String room_id) {
		ArrayList<U_R_Record> recordList = new ArrayList<U_R_Record>();
		for (U_R_Record record : recordDAO.getAllRecord()) {
			if(month == record.getMonth() && year == record.getYear() && room_id.equals(record.getRoom_id())) {
				recordList.add(record);
			}
		}
		return recordList;
	}
	
	public boolean addRecord(U_R_Record record) {
		return recordDAO.addRecord(record);
	}
}
