package model.bean;

public class U_R_Record {
	private String room_id;
	private String user_id;
	private int month;
	private int year;
	private boolean room;
	private boolean	electric;
	private boolean water;
	private boolean wifi;
	public U_R_Record(String room_id, String user_id, int month, int year, boolean room, boolean electric,
			boolean water, boolean wifi) {
		super();
		this.room_id = room_id;
		this.user_id = user_id;
		this.month = month;
		this.year = year;
		this.room = room;
		this.electric = electric;
		this.water = water;
		this.wifi = wifi;
	}
	public String getRoom_id() {
		return room_id;
	}
	public void setRoom_id(String room_id) {
		this.room_id = room_id;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public int getMonth() {
		return month;
	}
	public void setMonth(int month) {
		this.month = month;
	}
	public int getYear() {
		return year;
	}
	public void setYear(int year) {
		this.year = year;
	}
	public boolean isRoom() {
		return room;
	}
	public void setRoom(boolean room) {
		this.room = room;
	}
	public boolean isElectric() {
		return electric;
	}
	public void setElectric(boolean electric) {
		this.electric = electric;
	}
	public boolean isWater() {
		return water;
	}
	public void setWater(boolean water) {
		this.water = water;
	}
	public boolean isWifi() {
		return wifi;
	}
	public void setWifi(boolean wifi) {
		this.wifi = wifi;
	}
	
}
