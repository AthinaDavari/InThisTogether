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

		try {
			con = db.getConnection();
			stmt = con.prepareStatement(sqlquery);
			stmt.setString(1, email);
			stmt.setString(2, password);
			rs = stmt.executeQuery();

			if (!rs.next()) {
				rs.close();
				stmt.close();
				throw new Exception("Wrong email or password");
			}
			AMEASupporter ameasupporter = new AMEASupporter(rs.getString("email"), rs.getString("name"),
					rs.getString("surname"),

					rs.getLong("phone"), rs.getString("serviceTown"), rs.getString("serviceArea"),

					rs.getString("password"), rs.getString("sex"), rs.getDate("birthDate"),

					rs.getString("languages"), rs.getBoolean("drivingLisence"), rs.getBoolean("carOwner"),

					rs.getDouble("payPerHour"), rs.getBoolean("available"), rs.getBoolean("monday"),

					rs.getBoolean("tuesday"), rs.getBoolean("wednesday"), rs.getBoolean("thursday"),

					rs.getBoolean("friday"), rs.getBoolean("saturday"), rs.getBoolean("sunday"),

					rs.getBoolean("deaf"), rs.getBoolean("dyslexia"), rs.getBoolean("epilipsy"),

					rs.getBoolean("autism"), rs.getBoolean("blind"), rs.getBoolean("mobilityImpaired"),

					rs.getBoolean("down"), rs.getBoolean("learningSupportPrimarySchool"),
					rs.getBoolean("learningSupportJuniorHighSchool"),

					rs.getBoolean("learningSupportSeniorHighSchool"), rs.getBoolean("occupationalTherapy"),
					rs.getBoolean("logotherapy"),

					rs.getBoolean("schoolCompanion"), rs.getBoolean("externalCompanion")

			);

			rs.close();
			stmt.close();

			return ameasupporter;

		} catch (Exception e) {
			throw new Exception(e.getMessage());
		} finally {
			try {
				db.close();
			} catch (Exception e) {

			}
		}

	} // End of authenticate

	public AMEASupporter getAmeaSupporter(String email) throws Exception {
		DB db = new DB();
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String sqlquery = "SELECT * FROM ameasupporter WHERE email=?;";

		try {
			con = db.getConnection();
			stmt = con.prepareStatement(sqlquery);
			stmt.setString(1, email);
			rs = stmt.executeQuery();

			if (!rs.next()) {
				rs.close();
				stmt.close();
				throw new Exception("That email does not exist!");
			}

			String getage = "select * from age where email = ?";
			stmt = con.prepareStatement(getage);
			stmt.setString(1, email);
			ResultSet rs1 = stmt.executeQuery();
			rs1.next();

			AMEASupporter ameasupporter = new AMEASupporter(rs.getString("email"), rs.getString("name"),
					rs.getString("surname"),

					rs1.getInt("age"), rs.getLong("phone"), rs.getString("serviceTown"), rs.getString("serviceArea"),

					rs.getString("sex"), rs.getDate("birthDate"),

					rs.getString("languages"), rs.getBoolean("drivingLisence"), rs.getBoolean("carOwner"),

					rs.getDouble("payPerHour"), rs.getBoolean("available"), rs.getBoolean("monday"),

					rs.getBoolean("tuesday"), rs.getBoolean("wednesday"), rs.getBoolean("thursday"),

					rs.getBoolean("friday"), rs.getBoolean("saturday"), rs.getBoolean("sunday"),

					rs.getBoolean("deaf"), rs.getBoolean("dyslexia"), rs.getBoolean("epilipsy"),

					rs.getBoolean("autism"), rs.getBoolean("blind"), rs.getBoolean("mobilityImpaired"),

					rs.getBoolean("down"), rs.getBoolean("learningSupportPrimarySchool"),
					rs.getBoolean("learningSupportJuniorHighSchool"),

					rs.getBoolean("learningSupportSeniorHighSchool"), rs.getBoolean("occupationalTherapy"),
					rs.getBoolean("logotherapy"),

					rs.getBoolean("schoolCompanion"), rs.getBoolean("externalCompanion")

			);

			rs.close();
			stmt.close();

			return ameasupporter;

		} catch (Exception e) {
			throw new Exception(e.getMessage());
		} finally {
			try {
				db.close();
			} catch (Exception e) {

			}
		}
	} // End of getAmeaSupporter
	
	public List<Education> getAMEASupportersEducation(String email) throws Exception {

		List<Education> ameasuped = new ArrayList<Education>();

		DB db = new DB();
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;

		String sql = "SELECT * FROM Education where AMEASupEmail = ?";

		try {

			con = db.getConnection();
			stmt = con.prepareStatement(sql);
			stmt.setString(1, email);
			rs = stmt.executeQuery();
			while (rs.next()) {
				ameasuped.add(new Education(rs.getInt("id"), rs.getString("AMEASupEmail"), rs.getString("title"),
						rs.getString("typeOfEducation")));
			}

			rs.close();
			stmt.close();
			return ameasuped;

		} catch (Exception e) {
			throw new Exception(e.getMessage());

		} finally {

			try {
				db.close();
			} catch (Exception e) {

			}

		}

	}// End of getAmeaSupportersEducation

	public List<Experience> getAMEASupportersExperience(String email) throws Exception {

		List<Experience> ameasupex = new ArrayList<Experience>();

		DB db = new DB();
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;

		String sql = "SELECT * FROM Experience where AMEASupEmail = ?";

		try {

			con = db.getConnection();
			stmt = con.prepareStatement(sql);
			stmt.setString(1, email);
			rs = stmt.executeQuery();
			while (rs.next()) {
				ameasupex.add(new Experience(rs.getInt("id"), rs.getString("AMEASupEmail"), rs.getString("description"),
						rs.getDate("startdate"), rs.getDate("enddate")));
			}

			rs.close();
			stmt.close();
			return ameasupex;

		} catch (Exception e) {
			throw new Exception(e.getMessage());

		} finally {

			try {
				db.close();
			} catch (Exception e) {

			}

		}

	}// End of getAmeaSupportersExperience

	public List<AMEASupporter> getAmeaSupporters() throws Exception {

		List<AMEASupporter> ameasup = new ArrayList<AMEASupporter>();

		DB db = new DB();
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;

		String sql = "SELECT email, name, surname, deaf,dyslexia,epilipsy,autism,blind,mobilityImpaired,down, learningSupportPrimarySchool,learningSupportJuniorHighSchool,learningSupportSeniorHighSchool,occupationalTherapy,logotherapy,schoolCompanion, externalCompanion,serviceArea, languages FROM ameasupporter;";

		try {

			con = db.getConnection();
			stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery();

			while (rs.next()) {
				ameasup.add(new AMEASupporter(rs.getString("email"), rs.getString("name"), rs.getString("surname"),
						rs.getString("serviceArea"), rs.getString("languages"), rs.getBoolean("deaf"),
						rs.getBoolean("dyslexia"), rs.getBoolean("epilipsy"), rs.getBoolean("autism"),
						rs.getBoolean("blind"), rs.getBoolean("mobilityImpaired"), rs.getBoolean("down"),
						rs.getBoolean("learningSupportPrimarySchool"), rs.getBoolean("learningSupportJuniorHighSchool"),
						rs.getBoolean("learningSupportSeniorHighSchool"), rs.getBoolean("occupationalTherapy"),
						rs.getBoolean("logotherapy"), rs.getBoolean("schoolCompanion"),
						rs.getBoolean("externalCompanion")));
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

	} // End of getUsers
	
	public void register(AMEASupporter ameasup, List<Education> educList, List<Experience> experList) throws Exception {
			

		DB db = new DB();
		Connection con = null;
		PreparedStatement stmt = null;
		String checksql = "SELECT * FROM ismgroup10.ameasupporter WHERE email=?;"; 
		String sql1 = "INSERT INTO ismgroup10.ameasupporter (email, name, surname, phone, serviceTown, serviceArea, password, sex, birthdate, languages, drivingLisence, carOwner, payPerHour, available, monday, tuesday, wednesday, thursday, friday, saturday, sunday, deaf, dyslexia, epilipsy, autism, blind, mobilityImpaired, down, learningSupportPrimarySchool, learningSupportJuniorHighSchool, learningSupportSeniorHighSchool, occupationalTherapy, logotherapy, schoolCompanion, externalCompanion) VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ? )";
		String sql2 = "INSERT INTO ismgroup10.education (AMEASupEmail, title, typeOfEducation) VALUES(?, ?, ?)";
		String sql3 = "INSERT INTO ismgroup10.experience (AMEASupEmail, description, startdate, enddate ) VALUES(?, ?, ?, ?)";

		try {

			con = db.getConnection();
			stmt = con.prepareStatement(checksql); 
			stmt.setString(1,ameasup.getEmail());
			ResultSet rs = stmt.executeQuery();

			if (rs.next()) {

				rs.close();
				stmt.close();
				throw new Exception("Email already registered");

			}

			stmt = con.prepareStatement(sql1);
				
			stmt.setString(1,ameasup.getEmail());
			stmt.setString(2,ameasup.getName());
			stmt.setString(3,ameasup.getSurname());
			stmt.setLong(4,ameasup.getPhone());
			stmt.setString(5,ameasup.getServiceTown());
			stmt.setString(6,ameasup.getServiceArea());
			stmt.setString(7,ameasup.getPassword());
			stmt.setString(8,ameasup.getSex());
			stmt.setDate(9,ameasup.getBirthDate());
			stmt.setString(10,ameasup.getLanguages());
			stmt.setBoolean(11,ameasup.isDrivingLisence());
			stmt.setBoolean(12,ameasup.isCarOwner());
			stmt.setDouble(13,ameasup.getPayPerHour());
			stmt.setBoolean(14,ameasup.isAvailable());
			stmt.setBoolean(15,ameasup.isMonday());
			stmt.setBoolean(16,ameasup.isTuesday());
			stmt.setBoolean(17,ameasup.isWednesday());
			stmt.setBoolean(18,ameasup.isThursday());
			stmt.setBoolean(19,ameasup.isFriday());
			stmt.setBoolean(20,ameasup.isSaturday());
			stmt.setBoolean(21,ameasup.isSunday());
			stmt.setBoolean(22,ameasup.isDeaf());
			stmt.setBoolean(23,ameasup.isDyslexia());
			stmt.setBoolean(24,ameasup.isEpilipsy());
			stmt.setBoolean(25,ameasup.isAutism());
			stmt.setBoolean(26,ameasup.isBlind());
			stmt.setBoolean(27,ameasup.isMobilityImpaired());
			stmt.setBoolean(28,ameasup.isDown());
			stmt.setBoolean(29,ameasup.isLearningSupportPrimarySchool());
			stmt.setBoolean(30,ameasup.isLearningSupportJuniorHighSchool());
			stmt.setBoolean(31,ameasup.isLearningSupportSeniorHighSchool());
			stmt.setBoolean(32,ameasup.isOccupationalTherapy());
			stmt.setBoolean(33,ameasup.isLogotherapy());
			stmt.setBoolean(34,ameasup.isSchoolCompanion());
			stmt.setBoolean(35,ameasup.isExternalCompanion());
			stmt.executeUpdate();

			for (Education ed : educList) {
				stmt = con.prepareStatement(sql2);

				stmt.setString(1,ed.getCustomerEmail());
				stmt.setString(2,ed.getTitle());
				stmt.setString(3,ed.getTypeOfEducation());
				stmt.executeUpdate();
			}
			
			for (Experience exp : experList) {
				stmt = con.prepareStatement(sql3);

				stmt.setString(1,exp.getEmail());
				stmt.setString(2,exp.getDescription());
				stmt.setDate(3, (Date) exp.getStartdate());
				stmt.setDate(4, (Date) exp.getEnddate());
				stmt.executeUpdate();
			}

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

	public void editProfile(AMEASupporter ameasup, List<Education> educList, List<Experience> experList) throws Exception {
			
		DB db = new DB();
		Connection con = null;
		PreparedStatement stmt = null; 
		String sql1 = "UPDATE ismgroup10.ameasupporter SET phone=?, serviceTown=? , serviceArea=? , languages=? , drivingLisence=? , carOwner=? , payPerHour=? , available=? , monday=? , tuesday=? , wednesday=? , thursday=? , friday=? , saturday=? , sunday=? , deaf=? , dyslexia=? , epilipsy=? , autism=? , blind=? , mobilityImpaired=? , down=? , learningSupportPrimarySchool=? , learningSupportJuniorHighSchool=? , learningSupportSeniorHighSchool=? , occupationalTherapy=? , logotherapy=? , schoolCompanion=? , externalCompanion=? WHERE email=?";
		String sql2 = "INSERT INTO ismgroup10.education (AMEASupEmail, title, typeOfEducation) VALUES(?, ?, ?)";
		String sql3 = "INSERT INTO ismgroup10.experience (AMEASupEmail, description, startdate, enddate ) VALUES(?, ?, ?, ?)";

		try {

			con = db.getConnection();
			stmt = con.prepareStatement(sql1);

			stmt.setLong(1,ameasup.getPhone());
			stmt.setString(2,ameasup.getServiceTown());
			stmt.setString(3,ameasup.getServiceArea());
			stmt.setString(4,ameasup.getLanguages());
			stmt.setBoolean(5,ameasup.isDrivingLisence());
			stmt.setBoolean(6,ameasup.isCarOwner());
			stmt.setDouble(7,ameasup.getPayPerHour());
			stmt.setBoolean(8,ameasup.isAvailable());
			stmt.setBoolean(9,ameasup.isMonday());
			stmt.setBoolean(10,ameasup.isTuesday());
			stmt.setBoolean(11,ameasup.isWednesday());
			stmt.setBoolean(12,ameasup.isThursday());
			stmt.setBoolean(13,ameasup.isFriday());
			stmt.setBoolean(14,ameasup.isSaturday());
			stmt.setBoolean(15,ameasup.isSunday());
			stmt.setBoolean(16,ameasup.isDeaf());
			stmt.setBoolean(17,ameasup.isDyslexia());
			stmt.setBoolean(18,ameasup.isEpilipsy());
			stmt.setBoolean(19,ameasup.isAutism());
			stmt.setBoolean(20,ameasup.isBlind());
			stmt.setBoolean(21,ameasup.isMobilityImpaired());
			stmt.setBoolean(22,ameasup.isDown());
			stmt.setBoolean(23,ameasup.isLearningSupportPrimarySchool());
			stmt.setBoolean(24,ameasup.isLearningSupportJuniorHighSchool());
			stmt.setBoolean(25,ameasup.isLearningSupportSeniorHighSchool());
			stmt.setBoolean(26,ameasup.isOccupationalTherapy());
			stmt.setBoolean(27,ameasup.isLogotherapy());
			stmt.setBoolean(28,ameasup.isSchoolCompanion());
			stmt.setBoolean(29,ameasup.isExternalCompanion());
			stmt.setString(30,ameasup.getEmail());
			stmt.executeUpdate();

			for (Education ed : educList) {
				stmt = con.prepareStatement(sql2);

				stmt.setString(1,ed.getCustomerEmail());
				stmt.setString(2,ed.getTitle());
				stmt.setString(3,ed.getTypeOfEducation());
				stmt.executeUpdate();
			}
			
			for (Experience exp : experList) {
				stmt = con.prepareStatement(sql3);

				stmt.setString(1,exp.getEmail());
				stmt.setString(2,exp.getDescription());
				stmt.setDate(3, (Date) exp.getStartdate());
				stmt.setDate(4, (Date) exp.getEnddate());
				stmt.executeUpdate();
			}

			stmt.close();

		} catch (Exception e) {
			throw new Exception(e.getMessage());

		} finally {

			try {
				db.close();
			} catch (Exception e) {

			} 
		}
		
	}//end of editProfile

} 
