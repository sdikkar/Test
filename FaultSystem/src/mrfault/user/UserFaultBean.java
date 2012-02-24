package mrfault.user;

import java.util.ArrayList;

import mrfault.mysql.MySQLAccess;

public class UserFaultBean {

	private String logonid = null;
	private String faultid = null;
	
	public ArrayList<FaultBean> getAllFaultsForUser(){
		
		ArrayList<FaultBean> faultlist = new ArrayList<FaultBean>(); 
		String query1 = "select * from mrfault.FAULTS where logonId ='"+ getLogonid() +"'";

		
		try {
			MySQLAccess db = new MySQLAccess();
			faultlist = db.executeGetFaultQuery(query1);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return faultlist;
	}
	
	public ArrayList<FaultBean> getAllFaults(){
		
		ArrayList<FaultBean> faultlist = new ArrayList<FaultBean>(); 
		String query1 = "select * from mrfault.FAULTS";

		
		try {
			MySQLAccess db = new MySQLAccess();
			faultlist = db.executeGetFaultQuery(query1);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return faultlist;
	}
	
	
	public ArrayList<FaultBean> getFaultByFaultId(){
		
		ArrayList<FaultBean> faultlist = new ArrayList<FaultBean>(); 
		String query1 = "select * from mrfault.FAULTS where faultid = '"+getFaultid()+"'";

		
		try {
			MySQLAccess db = new MySQLAccess();
			faultlist = db.executeGetFaultQuery(query1);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return faultlist;
	}
	
	public Long getMaxFaultId(){
		
		Long faultId = null; 
		String query1 = "select max(faultid) from mrfault.FAULTS";
		
		try {
			MySQLAccess db = new MySQLAccess();
			faultId = db.executeFaultIdQuery(query1);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return faultId;
	}
		
	public ArrayList<UserBean> getAllUsers(){
		
		ArrayList<UserBean> usersList = null;
		usersList = new ArrayList<UserBean>();
		
		String query1 = "select * from mrfault.USERS";
		
		try {
			MySQLAccess db = new MySQLAccess();
			usersList = db.executeAllUsersQuery(query1);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return usersList;
	}
	
	public ArrayList<UserBean> getUsersByType(){
		
		ArrayList<UserBean> userList = new ArrayList<UserBean>(); 
		String query1 = "select * from mrfault.USERS where usertype = '"+getLogonid()+"'";
		
		try {
			MySQLAccess db = new MySQLAccess();
			userList = db.executeAllUsersByUserTypeQuery(query1);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return userList;
	}
	
	public String getUserTypeByLogin(){
		String userType = "";
		String query1 = "select usertype from mrfault.USERS where logonid = '"+getLogonid()+"'";
		
		try {
			MySQLAccess db = new MySQLAccess();
			userType = db.executeUserTypeByLogonIdQuery(query1);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return userType;
	}
	
	
	public String getLogonid() {
		return logonid;
	}

	public void setLogonid(String logonid) {
		this.logonid = logonid;
	}

	public String getFaultid() {
		return faultid;
	}

	public void setFaultid(String faultid) {
		this.faultid = faultid;
	}
}
