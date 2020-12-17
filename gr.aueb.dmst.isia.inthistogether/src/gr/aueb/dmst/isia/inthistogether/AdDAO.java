package gr.aueb.dmst.isia.inthistogether;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class AdDAO {
	
	public List<Ad> getAds() throws Exception{
		
		DB db = new DB();
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		List<Ad> ads = new ArrayList<Ad>();
		String getads = "SELECT * FROM Ad";

		try {

			stmt = con.prepareStatement(getads); // initialize stmt insert
			rs = stmt.executeQuery();

			while(rs.next()) {
				ads.add(new Ad(rs.getInt("id"), rs.getString("customerEmail"), rs.getDate("startDate"), rs.getDate("endDate"), rs.getString("service"), rs.getString("disability"), rs.getString("description"), rs.getString("location") ));
			}
			
			rs.close();
			stmt.close();


		} catch (Exception e) {
			throw new Exception(e.getMessage());
		} finally {
			try {
				db.close();
			} catch (Exception e) {

			}
		}
		
		return ads;

	}

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
