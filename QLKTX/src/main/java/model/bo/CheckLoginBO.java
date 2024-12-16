package model.bo;

import model.dao.*;

public class CheckLoginBO {
	CheckLoginDAO checkloginDAO = new CheckLoginDAO();
	public boolean CheckUserExist(String username, String password) {
		return checkloginDAO.CheckUserExist(username, password);
	}
}
