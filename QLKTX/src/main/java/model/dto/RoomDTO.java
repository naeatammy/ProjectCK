package model.dto;

public class RoomDTO {
	private String room_id;
	private String type;
	private int capacity;
	private String state;
	private String price;
	public RoomDTO(String room_id, String type, int capacity, String state, String price) {
		super();
		this.room_id = room_id;
		this.type = type;
		this.capacity = capacity;
		this.state = state;
		this.price = price;
	}
	public String getRoom_id() {
		return room_id;
	}
	public void setRoom_id(String room_id) {
		this.room_id = room_id;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public int getCapacity() {
		return capacity;
	}
	public void setCapacity(int capacity) {
		this.capacity = capacity;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
}
