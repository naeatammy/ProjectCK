package model.bo;

import model.dao.*;
import model.bean.*;
import java.util.*;
import java.lang.*;
import java.io.*;

public class ContractBO {
	ContractDAO contractDAO = new ContractDAO();
	public ArrayList<Contract> getAllContract() {
		return contractDAO.getAllContract();
	}
	
	public ArrayList<Contract> getByUserID(String user_id) {
		ArrayList<Contract> contractList = new ArrayList<Contract>();
		for (Contract contract : contractDAO.getAllContract()) {
			if(contract.getUser_id().equals(user_id)) {
				contractList.add(contract);
			}
		}
		return contractList;
	}
}
