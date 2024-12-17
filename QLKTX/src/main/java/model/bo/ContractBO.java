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
	
	public Contract getByContractID(String contract_id) {
		ArrayList<Contract> contractList = contractDAO.getAllContract();
		Contract rescontract = contractList.get(0);
		for(Contract contract : contractList) {
			if(contract.getContract_id().equals(contract_id)) {
				return contract;
			}
		}
		return rescontract;
	}
	
	public boolean addContract(Contract contract) {
		return contractDAO.addContract(contract);
	}
	
	public boolean updateContract(Contract contract) {
		return contractDAO.updateContract(contract);
	}
}
