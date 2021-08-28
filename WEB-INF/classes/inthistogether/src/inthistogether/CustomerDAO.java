package inthistogether;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CustomerDAO {

    /**
	 * This method is used to authenticate a user.
	 * 
	 * @param email, String
	 * @param password, String
	 * @return User, the User object
	 * @throws Exception, if the credentials are not valid
	 */
	public Customer authenticate(String email, String password) throws Exception {
		
		DB db = new DB();
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String sqlquery = "SELECT * FROM customer WHERE email=? AND password=?;";

		try{
			con = db.getConnection();
			stmt =  con.prepareStatement(sqlquery);
			stmt.setString(1, email);
			stmt.setString(2, password);
			rs = stmt.executeQuery();

			if(!rs.next()){
				rs.close();
				stmt.close(); 
				throw new Exception("Wrong username or password");
			}
			Customer cust = new Customer(rs.getString("email"), rs.getLong("phone"), rs.getString("password"),rs.getString("name"), rs.getString("surname"));
			
			rs.close();
			stmt.close();

			return cust;

		} catch(Exception e){
			throw new Exception(e.getMessage());
		} finally{
			try{
				db.close();
			} catch(Exception e){

			}
		}	
		
	} //End of authenticate

	public void register(Customer cust) throws Exception {
			

		DB db = new DB();
		Connection con = null;
		PreparedStatement stmt = null;
		String checksql = "SELECT * FROM ismgroup10.customer WHERE email=?;"; 
		String sql = "INSERT INTO ismgroup10.customer (email, phone, password, name, surname) VALUES(?, ?, ?, ?, ?)";

		try {

			con = db.getConnection();
			stmt = con.prepareStatement(checksql); 
			stmt.setString(1,cust.getEmail());
			ResultSet rs = stmt.executeQuery();

			if (rs.next()) {

				rs.close();
				stmt.close();
				throw new Exception("Email already registered");

			}

			stmt = con.prepareStatement(sql);
				
			stmt.setString(1,cust.getEmail());
			stmt.setLong(2,cust.getPhone());
			stmt.setString(3,cust.getPassword());
			stmt.setString(4,cust.getName());
			stmt.setString(5,cust.getSurname());

			stmt.executeUpdate();

			stmt.close();

		} catch (Exception e) {

			throw new Exception(e.getMessage());

		} finally {

			try {
				db.close();
			} catch (Exception e) {

			}
		}
		
	}//end of register
} 
