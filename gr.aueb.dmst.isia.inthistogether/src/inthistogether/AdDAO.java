package inthistogether;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class AdDAO {

	public List<AdView> getAds() throws Exception {

		DB db = new DB();
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		List<AdView> ads = new ArrayList<AdView>();
		String getads = "SELECT Customer.email, Customer.phone, Customer.name, Customer.surname, Ad.startDate, Ad.endDate, Ad.service, Ad.disability, Ad.description, Ad.location FROM (Customer INNER JOIN Ad ON Ad.customerEmail= Customer.email);";

		try {

			con = db.getConnection();
			stmt = con.prepareStatement(getads); // initialize stmt insert
			rs = stmt.executeQuery();

			while (rs.next()) {
				ads.add(new AdView(rs.getString("email"), rs.getDate("startDate"),
						rs.getDate("endDate"), rs.getString("service"), rs.getString("disability"),
						rs.getString("description"), rs.getString("location"), rs.getLong("phone"), rs.getString("name"), rs.getString("surname")));
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
		String insertad = "INSERT INTO Ad (customerEmail, startDate, endDate, service, disability, description, location) VALUES (?, ?, ?, ?, ?, ?, ?)";

		try {

			con = db.getConnection();
			stmt = con.prepareStatement(insertad); // initialize stmt insert

			stmt.setString(1, ad.getCustomerEmail());
			stmt.setDate(2, ad.getStartDate());
			stmt.setDate(3, ad.getEndDate());
			stmt.setString(4, ad.getService());
			stmt.setString(5, ad.getDisabity());
			stmt.setString(6, ad.getDescription());
			stmt.setString(7, ad.getLocation());

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
