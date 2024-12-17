package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import model.bean.*;
import model.bo.*;
import model.dto.*;
import java.util.*;
import java.lang.*;


public class RoomController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		RoomBO roomBO = new RoomBO();
		U_R_RecordBO recordBO = new U_R_RecordBO();
		UserBO userBO = new UserBO();
		if(action.equals("viewallroom")) {
			String month = request.getParameter("month");
			String year = request.getParameter("year");
			ArrayList<Room> roomList = roomBO.getAllRoom();	
			ArrayList<RoomDTO> roomDtoList = new ArrayList<RoomDTO>();
			for (Room room : roomList) {
				String state = recordBO.countRecord(Integer.parseInt(month), Integer.parseInt(year), room.getRoom_id()) + "/" + room.getCapacity();
				roomDtoList.add(new RoomDTO(room.getRoom_id(), room.getType(), room.getCapacity(), state, room.getPrice()));
			}
			request.setAttribute("roomDtoList", roomDtoList);
			request.setAttribute("month", month);
			request.setAttribute("year", year);
			request.getRequestDispatcher("Admin/showAllRoom.jsp").forward(request, response);
			return;
		}
		if(action.equals("_viewallroom")) {
			String month = request.getParameter("month");
			String year = request.getParameter("year");
			System.out.println(month);
			System.out.println(year);
			ArrayList<Room> roomList = roomBO.getAllRoom();	
			ArrayList<RoomDTO> roomDtoList = new ArrayList<RoomDTO>();
			for (Room room : roomList) {
				String state = recordBO.countRecord(Integer.parseInt(month), Integer.parseInt(year), room.getRoom_id()) + "/" + room.getCapacity();
				roomDtoList.add(new RoomDTO(room.getRoom_id(), room.getType(), room.getCapacity(), state, room.getPrice()));
			}
			request.setAttribute("roomDtoList", roomDtoList);
			request.setAttribute("month", month);
			request.setAttribute("year", year);
			request.getRequestDispatcher("User/rentRoom.jsp").forward(request, response);
			return;
		}
		if(action.equals("viewdetailroom")) {
			String month = request.getParameter("month");
			String year = request.getParameter("year");
			String room_id = request.getParameter("roomid");
			ArrayList<U_R_Record> recordList = recordBO.getAllRecord(Integer.parseInt(month), Integer.parseInt(year), room_id);
			ArrayList<RoomRecordDTO> recordDtoList = new ArrayList<RoomRecordDTO>();
			for (U_R_Record record : recordList) {
				User user = userBO.getUserById(record.getUser_id());
				recordDtoList.add(new RoomRecordDTO(user.getUser_id(), user.getFirstname(), user.getLastname(), user.getPhonenumber(), user.getCccd(), record.isRoom(), record.isElectric(), record.isWater(), record.isWifi()));
			}
			Room room = roomBO.getRoomById(room_id);
			String state = recordBO.countRecord(Integer.parseInt(month), Integer.parseInt(year), room.getRoom_id()) + "/" + room.getCapacity();
			request.setAttribute("room", room);
			request.setAttribute("state", state);
			request.setAttribute("month", month);
			request.setAttribute("year", year);
			request.setAttribute("recordDtoList", recordDtoList);
			request.getRequestDispatcher("Admin/showOneRoom.jsp").forward(request, response);
			return;
		}
		if(action.equals("addroom")) {
			response.sendRedirect("Admin/addRoom.jsp");
			return;
		}
		if(action.equals("addroomhandle")) {
			String room_id = request.getParameter("roomid");
			String type = request.getParameter("type");
			String capacity = request.getParameter("capacity");
			String price = request.getParameter("price");
			Room roomAdd = new Room(room_id, type, Integer.parseInt(capacity), price);
			boolean isAdded = roomBO.addRoom(roomAdd);
			if(isAdded) {
				System.out.println("Add Success");
			}
			else {
				System.out.println("Add Failed");
			}
			Calendar calendar = Calendar.getInstance();
			int month = calendar.get(Calendar.MONTH) + 1;
			int year = calendar.get(Calendar.YEAR);
			ArrayList<Room> roomList = roomBO.getAllRoom();	
			ArrayList<RoomDTO> roomDtoList = new ArrayList<RoomDTO>();
			for (Room room : roomList) {
				String state = recordBO.countRecord(month, year, room.getRoom_id()) + "/" + room.getCapacity();
				roomDtoList.add(new RoomDTO(room.getRoom_id(), room.getType(), room.getCapacity(), state, room.getPrice()));
			}
			request.setAttribute("roomDtoList", roomDtoList);
			request.setAttribute("month", Integer.toString(month));
			request.setAttribute("year", Integer.toString(year));
			request.getRequestDispatcher("Admin/showAllRoom.jsp").forward(request, response);
			return;
		}
		if(action.equals("editroom")) {
			String room_id = request.getParameter("roomid");
			Room room = roomBO.getRoomById(room_id);
			request.setAttribute("room", room);
			request.getRequestDispatcher("Admin/editRoom.jsp").forward(request, response);
		}
		if(action.equals("editroomhandle")) {
			String room_id = request.getParameter("roomid");
			String type = request.getParameter("type");
			String capacity = request.getParameter("capacity");
			String price = request.getParameter("price");
			Room roomEdit = new Room(room_id, type, Integer.parseInt(capacity), price);
			boolean isUpdated = roomBO.updateRoom(roomEdit);
			if(isUpdated) {
				System.out.println("Update Success");
			}
			else {
				System.out.println("Update Failed");
			}
			Calendar calendar = Calendar.getInstance();
			int month = calendar.get(Calendar.MONTH) + 1;
			int year = calendar.get(Calendar.YEAR);
			ArrayList<Room> roomList = roomBO.getAllRoom();	
			ArrayList<RoomDTO> roomDtoList = new ArrayList<RoomDTO>();
			for (Room room : roomList) {
				String state = recordBO.countRecord(month, year, room.getRoom_id()) + "/" + room.getCapacity();
				roomDtoList.add(new RoomDTO(room.getRoom_id(), room.getType(), room.getCapacity(), state, room.getPrice()));
			}
			request.setAttribute("roomDtoList", roomDtoList);
			request.setAttribute("month", Integer.toString(month));
			request.setAttribute("year", Integer.toString(year));
			request.getRequestDispatcher("Admin/showAllRoom.jsp").forward(request, response);
			return;
		}
		if(action.equals("deleteroom")) {
			String room_id = request.getParameter("roomid");
			Room room = roomBO.getRoomById(room_id);
			request.setAttribute("room", room);
			request.getRequestDispatcher("Admin/deleteRoom.jsp").forward(request, response);
		}
		if(action.equals("deleteroomhandle")) {
			String room_id = request.getParameter("roomid");
			boolean isDeleted = roomBO.deleteRoom(room_id);
			if(isDeleted) {
				System.out.println("Delete Success");
			} else {
				System.out.println("Delete Failed");
			}
			Calendar calendar = Calendar.getInstance();
			int month = calendar.get(Calendar.MONTH) + 1;
			int year = calendar.get(Calendar.YEAR);
			ArrayList<Room> roomList = roomBO.getAllRoom();	
			ArrayList<RoomDTO> roomDtoList = new ArrayList<RoomDTO>();
			for (Room room : roomList) {
				String state = recordBO.countRecord(month, year, room.getRoom_id()) + "/" + room.getCapacity();
				roomDtoList.add(new RoomDTO(room.getRoom_id(), room.getType(), room.getCapacity(), state, room.getPrice()));
			}
			request.setAttribute("roomDtoList", roomDtoList);
			request.setAttribute("month", Integer.toString(month));
			request.setAttribute("year", Integer.toString(year));
			request.getRequestDispatcher("Admin/showAllRoom.jsp").forward(request, response);
			return;
		}
		if(action.equals("updaterecord")) {
			String user_id = request.getParameter("userid");
			String room_id = request.getParameter("roomid");
			String isroom = request.getParameter("room");
			String electric = request.getParameter("electric");
			String water = request.getParameter("water");
			String wifi = request.getParameter("wifi");
			String month = request.getParameter("month");
			String year = request.getParameter("year");
			U_R_Record recordUpdate = new U_R_Record(room_id, user_id, Integer.parseInt(month), Integer.parseInt(year), Boolean.parseBoolean(isroom), Boolean.parseBoolean(electric), Boolean.parseBoolean(water), Boolean.parseBoolean(wifi));
			boolean isUpdated = recordBO.updateRecord(recordUpdate);
			if(isUpdated) {
				System.out.println("Success");
			} else {
				System.out.println("Failed");
			}
			ArrayList<U_R_Record> recordList = recordBO.getAllRecord(Integer.parseInt(month), Integer.parseInt(year), room_id);
			ArrayList<RoomRecordDTO> recordDtoList = new ArrayList<RoomRecordDTO>();
			for (U_R_Record record : recordList) {
				User user = userBO.getUserById(record.getUser_id());
				recordDtoList.add(new RoomRecordDTO(user.getUser_id(), user.getFirstname(), user.getLastname(), user.getPhonenumber(), user.getCccd(), record.isRoom(), record.isElectric(), record.isWater(), record.isWifi()));
			}
			Room room = roomBO.getRoomById(room_id);
			String state = recordBO.countRecord(Integer.parseInt(month), Integer.parseInt(year), room.getRoom_id()) + "/" + room.getCapacity();
			request.setAttribute("room", room);
			request.setAttribute("state", state);
			request.setAttribute("month", month);
			request.setAttribute("year", year);
			request.setAttribute("recordDtoList", recordDtoList);
			request.getRequestDispatcher("Admin/showOneRoom.jsp").forward(request, response);
 			return;
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
