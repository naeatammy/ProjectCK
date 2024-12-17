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


public class UserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		UserBO userBO = new UserBO();
		ContractBO contractBO = new ContractBO();
		if(action.equals("viewalluser")) {
			ArrayList<User> userList = userBO.getAllUser();
			request.setAttribute("userList", userList);
			request.getRequestDispatcher("Admin/showAllUser.jsp").forward(request, response);
			return;
		}
		if(action.equals("contracthistory")) {
			String user_id = request.getParameter("userid");
			ArrayList<Contract> contractList = contractBO.getByUserID(user_id);
			User user = userBO.getUserById(user_id);
			request.setAttribute("user", user);
			request.setAttribute("contractList", contractList);
			request.getRequestDispatcher("Admin/showRoomRentalHistory.jsp").forward(request, response);
			return;
		}
		if(action.equals("_contracthistory")) {
			String user_id = request.getParameter("userid");
			ArrayList<Contract> contractList = contractBO.getByUserID(user_id);
			User user = userBO.getUserById(user_id);
			request.setAttribute("user", user);
			request.setAttribute("contractList", contractList);
			request.getRequestDispatcher("User/showRoomRentalHistoryOfUser.jsp").forward(request, response);
			return;
		}
		if(action.equals("adduser")) {
			response.sendRedirect("Admin/addUser.jsp");
			return;
		}
		if(action.equals("adduserhandle")) {
			String user_id = request.getParameter("userid");
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			String firstname = request.getParameter("firstname");
			String lastname = request.getParameter("lastname");
			String gender = request.getParameter("gender");
			String phonenumber = request.getParameter("phonenumber");
			String cccd = request.getParameter("cccd");
			User user = new User(user_id, username, password, firstname, lastname, phonenumber, cccd, (gender.equals("Nam") ? true : false));
			boolean isAdded = userBO.addUser(user);
			if(isAdded) {
				System.out.println("Add Success");
			} else {
				System.out.println("Add Failed");
			}
			ArrayList<User> userList = userBO.getAllUser();
			request.setAttribute("userList", userList);
			request.getRequestDispatcher("Admin/showAllUser.jsp").forward(request, response);
			return;
		}
		if(action.equals("edituser")) {
			String user_id = request.getParameter("userid");
			User user = userBO.getUserById(user_id);
			request.setAttribute("user", user);
			request.getRequestDispatcher("User/editUserInformation.jsp").forward(request, response);
			return;
		}
		if(action.equals("edithandle")) {
			String user_id = (String) request.getSession().getAttribute("userid");
			String firstname = request.getParameter("firstname");
			String lastname = request.getParameter("lastname");
			String phonenumber = request.getParameter("phonenumber");
			String gender = request.getParameter("gender");
			String cccd = request.getParameter("cccd");
			User user = new User(user_id, firstname, lastname, phonenumber, cccd, gender.equals("Nam"));
			boolean isUpdated = userBO.updateUser(user);
			if(isUpdated) {
				System.out.println("Success");
			}
			else {
				System.out.println("Failed");
			}
			request.setAttribute("user", user);
			request.getRequestDispatcher("User/editUserInformation.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
