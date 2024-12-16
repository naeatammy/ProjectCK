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
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
