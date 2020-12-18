package inthistogether;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class AMEASupporterDAO {

    /**
	 * This method is used to authenticate a user.
	 * 
	 * @param email, String
	 * @param password, String
	 * @return User, the User object
	 * @throws Exception, if the credentials are not valid
	 */
	public AMEASupporter authenticate(String email, String password) throws Exception {
		
		DB db = new DB();
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String sqlquery = "SELECT * FROM ameasupporter WHERE email=? AND password=?;";

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
            AMEASupporter ameasupporter = new AMEASupporter(rs.getString("email"), rs.getString("name"), rs.getString("surname"),

                                                            rs.getLong("phone"), rs.getString("serviceTown"), rs.getString("serviceArea"),

                                                            rs.getString("password"), rs.getString("sex"), rs.getDate("birthDate"),

                                                            rs.getString("languages"), rs.getBoolean("drivingLisence"), rs.getBoolean("carOwner"),

                                                            rs.getDouble("payPerHour"), rs.getBoolean("available"), rs.getBoolean("monday"),

                                                            rs.getBoolean("tuesday"), rs.getBoolean("wednesday"), rs.getBoolean("thursday"),

                                                            rs.getBoolean("friday"), rs.getBoolean("saturday"), rs.getBoolean("sunday"),

                                                            rs.getBoolean("deaf"), rs.getBoolean("dyslexia"), rs.getBoolean("epilipsy"),

                                                            rs.getBoolean("autism"), rs.getBoolean("blind"), rs.getBoolean("mobilityImpaired"),

                                                            rs.getBoolean("down"), rs.getBoolean("learningSupportPrimarySchool"), rs.getBoolean("learningSupportJuniorHighSchool"),

                                                            rs.getBoolean("learningSupportSeniorHighSchool"), rs.getBoolean("occupationalTherapy"), rs.getBoolean("logotherapy"),
                                                            
                                                            rs.getBoolean("schoolCompanion"), rs.getBoolean("externalCompanion")

                                                            );
			
			rs.close();
			stmt.close();

			return ameasupporter;

		} catch(Exception e){
			throw new Exception(e.getMessage());
		} finally{
			try{
				db.close();
			} catch(Exception e){

			}
		}	
		
	} //End of authenticate
	
	public List<AMEASupporter> getAmeaSupporters() throws Exception {
				
		List<AMEASupporter> ameasup =  new ArrayList<AMEASupporter>();

		DB db = new DB();
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;

		String sql = "SELECT * FROM ameasupporter;";

		try {
			
			con = db.getConnection();
			stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery();

			while(rs.next()) {
				ameasup.add(new AMEASupporter(rs.getString("email"), rs.getString("name"), rs.getString("surname"),
				rs.getLong("phone"), rs.getString("serviceTown"), rs.getString("serviceArea"),
				rs.getString("password"), rs.getString("sex"), rs.getDate("birthDate"),
				rs.getString("languages"), rs.getBoolean("drivingLisence"), rs.getBoolean("carOwner"),
				rs.getDouble("payPerHour"), rs.getBoolean("available"), rs.getBoolean("monday"),
				rs.getBoolean("tuesday"), rs.getBoolean("wednesday"), rs.getBoolean("thursday"),
				rs.getBoolean("friday"), rs.getBoolean("saturday"), rs.getBoolean("sunday"),
				rs.getBoolean("deaf"), rs.getBoolean("dyslexia"), rs.getBoolean("epilipsy"),
				rs.getBoolean("autism"), rs.getBoolean("blind"), rs.getBoolean("mobilityImpaired"),
				rs.getBoolean("down"), rs.getBoolean("learningSupportPrimarySchool"), rs.getBoolean("learningSupportJuniorHighSchool"),
				rs.getBoolean("learningSupportSeniorHighSchool"), rs.getBoolean("occupationalTherapy"), rs.getBoolean("logotherapy"),			
				rs.getBoolean("schoolCompanion"), rs.getBoolean("externalCompanion")));
			}

			rs.close();
			stmt.close();
			return ameasup;

		} catch (Exception e) {
			throw new Exception(e.getMessage());

		} finally {

			try {
				db.close();
			} catch (Exception e) {

			}

		}
		
	} //End of getUsers
    
}