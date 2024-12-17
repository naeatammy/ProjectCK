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
import java.text.SimpleDateFormat;

public class ContractController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		UserBO userBO = new UserBO();
		ContractBO contractBO = new ContractBO();
		U_R_RecordBO recordBO = new U_R_RecordBO();
		if(action.equals("extend")) {
			String user_id = request.getParameter("userid");
			String room_id = request.getParameter("roomid");
			User user = userBO.getUserById(user_id);
			request.setAttribute("user", user);
			request.setAttribute("roomid", room_id);
			request.getRequestDispatcher("Admin/contractExtension.jsp").forward(request, response);
			return;
		}
		if(action.equals("addcontract")) {
			String contract_id = request.getParameter("contractid");
			String user_id = request.getParameter("userid");
			String room_id = request.getParameter("roomid");
			String duration = request.getParameter("duration");
			System.out.println(duration);
			String start = request.getParameter("start");
			String end = request.getParameter("end");
			SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
			try {
				
				Contract contract = new Contract(contract_id, user_id, room_id, Integer.parseInt(duration), dateFormat.parse(start), dateFormat.parse(end), 
						"Đang thuê");
				boolean isAdded = contractBO.addContract(contract);
				if(isAdded) {
					System.out.println("Success");
					Date startDate = dateFormat.parse(start);
					Calendar calendar = Calendar.getInstance();
					calendar.setTime(startDate);
					for(int i = 0; i < Integer.parseInt(duration); i++) {
						int month = calendar.get(Calendar.MONTH) + 1;
						int year = calendar.get(Calendar.YEAR);
						U_R_Record record = new U_R_Record(room_id, user_id, month, year, false, false, false, false);
						isAdded = recordBO.addRecord(record);
						if(isAdded) {
							System.out.println("Add rc success");
						} else {
							System.out.println("Add rc failed");
						}
						calendar.add(Calendar.MONTH, 1);
					}
				} else {
					System.out.println("Failed");
				}
				ArrayList<Contract> contractList = contractBO.getByUserID(user_id);
				User user = userBO.getUserById(user_id);
				request.setAttribute("user", user);
				request.setAttribute("contractList", contractList);
				request.getRequestDispatcher("Admin/showRoomRentalHistory.jsp").forward(request, response);
				return;
			} catch (Exception e) {
				System.out.println("Error: " + e);
			}
			return;
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
