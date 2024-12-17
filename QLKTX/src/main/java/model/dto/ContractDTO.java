package model.dto;

import java.util.Date;

public class ContractDTO {
	private String contract_id;
	private String user_id;
	private String firstname;
	private String lastname;
	private String room_id;
	private int duration;
	private Date start;
	private Date end;
	private String state;
	public ContractDTO(String contract_id, String user_id, String firstname, String lastname, String room_id, int duration, Date start,
			Date end, String state) {
		super();
		this.contract_id = contract_id;
		this.user_id = user_id;
		this.firstname = firstname;
		this.lastname = lastname;
		this.room_id = room_id;
		this.duration = duration;
		this.start = start;
		this.end = end;
		this.state = state;
	}
	public String getContract_id() {
		return contract_id;
	}
	public void setContract_id(String contract_id) {
		this.contract_id = contract_id;
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
	public String getRoom_id() {
		return room_id;
	}
	public void setRoom_id(String room_id) {
		this.room_id = room_id;
	}
	public int getDuration() {
		return duration;
	}
	public void setDuration(int duration) {
		this.duration = duration;
	}
	public Date getStart() {
		return start;
	}
	public void setStart(Date start) {
		this.start = start;
	}
	public Date getEnd() {
		return end;
	}
	public void setEnd(Date end) {
		this.end = end;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
}
