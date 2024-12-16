package model.dto;

public class RoomRecordDTO {
	private String user_id;
	private String firstname;
	private String lastname;
	private String phonenumber;
	private String cccd;
	private boolean room;
	private boolean	electric;
	private boolean water;
	private boolean wifi;
	public RoomRecordDTO(String user_id, String firstname, String lastname, String phonenumber, String cccd,
			boolean room, boolean electric, boolean water, boolean wifi) {
		super();
		this.user_id = user_id;
		this.firstname = firstname;
		this.lastname = lastname;
		this.phonenumber = phonenumber;
		this.cccd = cccd;
		this.room = room;
		this.electric = electric;
		this.water = water;
		this.wifi = wifi;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getFirstname() {
		return firstname;
	}
	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}
	public String getLastname() {
		return lastname;
	}
	public void setLastname(String lastname) {
		this.lastname = lastname;
	}
	public String getPhonenumber() {
		return phonenumber;
	}
	public void setPhonenumber(String phonenumber) {
		this.phonenumber = phonenumber;
	}
	public String getCccd() {
		return cccd;
	}
	public void setCccd(String cccd) {
		this.cccd = cccd;
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
