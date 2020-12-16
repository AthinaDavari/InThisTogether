package gr.aueb.dmst.isia.inthistogether;

import java.sql.*;

public class AdDAO {

	public void insertAd(Ad ad) throws Exception {

		DB db = new DB();
		Connection con = null;
		PreparedStatement stmt = null;
		String insertad = "INSERT INTO Ad (id, customerEmail, startDate, endDate, service, disability, description, location) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

		try {

			stmt = con.prepareStatement(insertad); // initialize stmt insert

			stmt.setInt(1, ad.getId());
			stmt.setString(2,ad.getCustomerEmail());
			stmt.setDate(3,ad.getStartDate());
			stmt.setDate(4,ad.getEndDate());
			stmt.setString(5,ad.getService());
			stmt.setString(6,ad.getDisabity());
			stmt.setString(7,ad.getDescription());
			stmt.setString(8,ad.getLocation());

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

	}// end of insertAd

}
