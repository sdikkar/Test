package mrfault.mysql;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import mrfault.user.FaultBean;
import mrfault.user.UserBean;

public class MySQLAccess {
	private Connection connect = null;
	private Statement statement = null;
	private ResultSet resultSet = null;
		
	public boolean executeLogonQuery(String query){
		boolean isUserAuthentic = false;
		
		try {
			// This will load the MySQL driver, each DB has its own driver
			Class.forName("com.mysql.jdbc.Driver");
			// Setup the connection with the DB
			connect = DriverManager
					.getConnection("jdbc:mysql://localhost/mrfault?"
							+ "user=shradha&password=shradhapw");
			
			// Statements allow to issue SQL queries to the database
			statement = connect.createStatement();
			
			// Result set get the result of the SQL query
			resultSet = statement.executeQuery(query);
			
			while (resultSet.next()) {
				isUserAuthentic = true;
	        }
			
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return isUserAuthentic;
	}
	
	
	public ArrayList<FaultBean> executeGetFaultQuery(String query){
		ArrayList<FaultBean> faultObjs = null;
		faultObjs = new ArrayList<FaultBean>();
		
		try {
			// This will load the MySQL driver, each DB has its own driver
			Class.forName("com.mysql.jdbc.Driver");
			// Setup the connection with the DB
			connect = DriverManager
					.getConnection("jdbc:mysql://localhost/mrfault?"
							+ "user=shradha&password=shradhapw");
			
			// Statements allow to issue SQL queries to the database
			statement = connect.createStatement();
			
			// Result set get the result of the SQL query
			resultSet = statement.executeQuery(query);
			
			FaultBean fb = null;
			
			while (resultSet.next()) {
				
				fb = new FaultBean();
				
				String faultid 			= resultSet.getString("faultid");
				String logonid 			= resultSet.getString("logonid");
				String shortdescription = resultSet.getString("shortdescription");
				String longdescription 	= resultSet.getString("longdescription");
				String reporter 		= resultSet.getString("reporter");
				String priority 		= resultSet.getString("priority");
				String status 			= resultSet.getString("status");
				String field1 			= resultSet.getString("field1");
				String field2 			= resultSet.getString("field2");
				String field3 			= resultSet.getString("field3");
				String field4 			= resultSet.getString("field4");
				String field5 			= resultSet.getString("field5");
				
				fb.setFaultid(faultid);
				fb.setLogonid(logonid);
				fb.setShortdescription(shortdescription);
				fb.setLongdescription(longdescription);
				fb.setReporter(reporter);
				fb.setPriority(priority);
				fb.setStatus(status);
				fb.setField1(field1);
				fb.setField2(field2);
				fb.setField3(field3);
				fb.setField4(field4);
				fb.setField5(field5);
				
				faultObjs.add(fb);		
	        }
			
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}		
		
		return faultObjs;
	}
	
	public void executeCreateUpdateQuery(String query){
		
		try {
			// This will load the MySQL driver, each DB has its own driver
			Class.forName("com.mysql.jdbc.Driver");
			// Setup the connection with the DB
			connect = DriverManager
					.getConnection("jdbc:mysql://localhost/mrfault?"
							+ "user=shradha&password=shradhapw");
			
			// Statements allow to issue SQL queries to the database
			statement = connect.createStatement();
			
			// Result set get the result of the SQL query
			statement.executeUpdate(query);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
	}
	
	public Long executeFaultIdQuery(String query){
		
		Long faultId = null;
		
		try {
			// This will load the MySQL driver, each DB has its own driver
			Class.forName("com.mysql.jdbc.Driver");
			// Setup the connection with the DB
			connect = DriverManager
					.getConnection("jdbc:mysql://localhost/mrfault?"
							+ "user=shradha&password=shradhapw");
			
			// Statements allow to issue SQL queries to the database
			statement = connect.createStatement();
			
			// Result set get the result of the SQL query
			resultSet = statement.executeQuery(query);
						
			while (resultSet.next()) {
				faultId = resultSet.getLong(1);
				faultId = faultId + 1;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return faultId;
		
	}
	
	public ArrayList<UserBean> executeAllUsersQuery(String query){
		
		ArrayList<UserBean> allusersList = null;
		allusersList = new ArrayList<UserBean>();
		
		try {
			// This will load the MySQL driver, each DB has its own driver
			Class.forName("com.mysql.jdbc.Driver");
			// Setup the connection with the DB
			connect = DriverManager
					.getConnection("jdbc:mysql://localhost/mrfault?"
							+ "user=shradha&password=shradhapw");
			
			// Statements allow to issue SQL queries to the database
			statement = connect.createStatement();
			
			// Result set get the result of the SQL query
			resultSet = statement.executeQuery(query);
			
			UserBean Ub = null;
			
			while (resultSet.next()) {
				
				Ub = new UserBean();				
				
				String logonid 		= resultSet.getString("logonid"); 
				String password		= resultSet.getString("password");
				String firstname	= resultSet.getString("firstname");
				String lastname		= resultSet.getString("lastname");
				String email		= resultSet.getString("email");
				String usertype		= resultSet.getString("usertype");
				String field1		= resultSet.getString("field1");
				String field2		= resultSet.getString("field2");
				String field3		= resultSet.getString("field3");
				String field4		= resultSet.getString("field4");
				String field5		= resultSet.getString("field5");
				
				Ub.setLogonid(logonid);
				Ub.setPassword(password);
				Ub.setFirstname(firstname);
				Ub.setLastname(lastname);
				Ub.setEmail(email);
				Ub.setUsertype(usertype);
				Ub.setField1(field1);
				Ub.setField2(field2);
				Ub.setField3(field3);
				Ub.setField4(field4);
				Ub.setField5(field5);
				
				allusersList.add(Ub);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return allusersList;		
	}
	
	public ArrayList<UserBean> executeAllUsersByUserTypeQuery(String query){
		
		ArrayList<UserBean> alluserByTypeList = null;
		alluserByTypeList = new ArrayList<UserBean>();
		
		try {
			// This will load the MySQL driver, each DB has its own driver
			Class.forName("com.mysql.jdbc.Driver");
			// Setup the connection with the DB
			connect = DriverManager
					.getConnection("jdbc:mysql://localhost/mrfault?"
							+ "user=shradha&password=shradhapw");
			
			// Statements allow to issue SQL queries to the database
			statement = connect.createStatement();
			
			// Result set get the result of the SQL query
			resultSet = statement.executeQuery(query);
			
			UserBean Ub = null;
			
			while (resultSet.next()) {
				
				Ub = new UserBean();				
				
				String logonid 		= resultSet.getString("logonid"); 
				String password		= resultSet.getString("password");
				String firstname	= resultSet.getString("firstname");
				String lastname		= resultSet.getString("lastname");
				String email		= resultSet.getString("email");
				String usertype		= resultSet.getString("usertype");
				String field1		= resultSet.getString("field1");
				String field2		= resultSet.getString("field2");
				String field3		= resultSet.getString("field3");
				String field4		= resultSet.getString("field4");
				String field5		= resultSet.getString("field5");
				
				Ub.setLogonid(logonid);
				Ub.setPassword(password);
				Ub.setFirstname(firstname);
				Ub.setLastname(lastname);
				Ub.setEmail(email);
				Ub.setUsertype(usertype);
				Ub.setField1(field1);
				Ub.setField2(field2);
				Ub.setField3(field3);
				Ub.setField4(field4);
				Ub.setField5(field5);
				
				alluserByTypeList.add(Ub);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return alluserByTypeList;		
	}
	
	
	public String executeUserTypeByLogonIdQuery(String query){
		
		String UserType = null;
		
		try {
			// This will load the MySQL driver, each DB has its own driver
			Class.forName("com.mysql.jdbc.Driver");
			// Setup the connection with the DB
			connect = DriverManager
					.getConnection("jdbc:mysql://localhost/mrfault?"
							+ "user=shradha&password=shradhapw");
			
			// Statements allow to issue SQL queries to the database
			statement = connect.createStatement();
			
			// Result set get the result of the SQL query
			resultSet = statement.executeQuery(query);
						
			while (resultSet.next()) {
				UserType = resultSet.getString(1);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return UserType;
		
	}

	// You need to close the resultSet
	private void close() {
		try {
			if (resultSet != null) {
				resultSet.close();
			}

			if (statement != null) {
				statement.close();
			}

			if (connect != null) {
				connect.close();
			}
		} catch (Exception e) {

		}
	}

}