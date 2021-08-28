import java.util.List;

import inthistogether.AMEASupporter;
import inthistogether.AMEASupporterDAO;

public class AllProfilesServlet {

//	@Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
	public static void doPost() {
		AMEASupporterDAO ameasupporterdao = new AMEASupporterDAO();
		List<AMEASupporter> ameasupporters = null;
		try {
			ameasupporters = ameasupporterdao.getAmeaSupporters();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		StringBuilder json = new StringBuilder();
		json.append("{ \"number\":" + ameasupporters.size() + ", \"supporters\": {");

		int numberOfSupporters = 0;

		for (AMEASupporter ameasup : ameasupporters) {
			numberOfSupporters++;

			String name = ameasup.getName();
			String surname = ameasup.getSurname();

			StringBuilder service = new StringBuilder();
			if (ameasup.isLearningSupportPrimarySchool() == true) {
				service.append("Learning Support Primary School, ");
			}
			if (ameasup.isLearningSupportJuniorHighSchool() == true) {
				service.append("Learning Support Junior High School, ");
			}
			if (ameasup.isLearningSupportSeniorHighSchool() == true) {
				service.append("Learning Support Senior High School, ");
			}
			if (ameasup.isOccupationalTherapy() == true) {
				service.append("Occupational Therapy, ");
			}
			if (ameasup.isLogotherapy() == true) {
				service.append("Logotherapy, ");
			}
			if (ameasup.isSchoolCompanion() == true) {
				service.append("School Companion, ");
			}
			if (ameasup.isExternalCompanion() == true) {
				service.append("External Companion, ");
			}

			int len = service.length();
			service.delete(len - 2, len - 1);

			StringBuilder disability = new StringBuilder();

			if (ameasup.isDeaf() == true) {
				disability.append("Deaf, ");
			}

			if (ameasup.isDyslexia() == true) {
				disability.append("Dyslexia, ");
			}

			if (ameasup.isEpilipsy() == true) {
				disability.append("Epilipsy, ");
			}

			if (ameasup.isAutism() == true) {
				disability.append("Autism, ");
			}

			if (ameasup.isBlind() == true) {
				disability.append("Blind, ");
			}

			if (ameasup.isMobilityImpaired() == true) {
				disability.append("Mobility Impaired, ");
			}

			if (ameasup.isDown() == true) {
				disability.append("Down, ");
			}

			len = disability.length();
			disability.delete(len - 2, len - 1);

			String servicearea = ameasup.getServiceArea();
			String languages = ameasup.getLanguages();
			String email = ameasup.getEmail();

			json.append(" \"sup" + numberOfSupporters + "\":{ \"number\":" + numberOfSupporters + ", \"name\":\"" + name + "\", \"surname\":\""
					+ surname + "\", \"service\":\"" + service + "\", \"disability\":\"" + disability
					+ "\", \"servicearea\":\"" + servicearea + "\", \"languages\":\"" + languages + "\", \"email\":\""
					+ email + "\" }, ");

		}

		int len = json.length();
		json.delete(len - 2, len - 1);
		json.append(" } }");
		System.out.print(json);
	}
	
	public static void main(String args[]) {
		doPost();
	}
}