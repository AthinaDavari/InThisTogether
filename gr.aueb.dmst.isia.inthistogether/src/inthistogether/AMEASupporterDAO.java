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

}