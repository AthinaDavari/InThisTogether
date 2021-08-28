import java.util.List;

import inthistogether.AMEASupporter;
import inthistogether.AMEASupporterDAO;
import inthistogether.Education;
import inthistogether.Experience;

import java.io.BufferedReader;
import java.io.IOException;

public class SpecificProficeServlet {

	protected static void doPost() {

		String email = "elliedam@gmail.com";
		AMEASupporterDAO objectAMEASupporterDAO = new AMEASupporterDAO();
		AMEASupporter objectAMEASupporter = null;

		try {
			objectAMEASupporter = objectAMEASupporterDAO.getAmeaSupporter(email);

			if (objectAMEASupporter == null) {
				String json = "{ \"isEmailValid\" : false }";
				return;
			}

			String name = objectAMEASupporter.getName();
			String surname = objectAMEASupporter.getSurname();
			String serviceTown = objectAMEASupporter.getServiceTown();
			int age = objectAMEASupporter.getAge();
			String gender = objectAMEASupporter.getSex();
			String available = objectAMEASupporter.isAvailable() ? "Available" : "Not Available";
			String pay = objectAMEASupporter.getPayPerHour() == -1 ? "Undefined"
					: String.valueOf(objectAMEASupporter.getPayPerHour());
			long phone = objectAMEASupporter.getPhone();
			String languages = objectAMEASupporter.getLanguages();
			String servicearea = objectAMEASupporter.getServiceArea();
			boolean driver = objectAMEASupporter.isDrivingLisence();
			boolean carOwner = objectAMEASupporter.isCarOwner();
			boolean monday = objectAMEASupporter.isMonday();
			boolean tuesday = objectAMEASupporter.isTuesday();
			boolean wednesday = objectAMEASupporter.isWednesday();
			boolean thursday = objectAMEASupporter.isThursday();
			boolean friday = objectAMEASupporter.isFriday();
			boolean saturday = objectAMEASupporter.isSaturday();
			boolean sunday = objectAMEASupporter.isSunday();
			boolean deaf = objectAMEASupporter.isDeaf();
			boolean dyslexia = objectAMEASupporter.isDyslexia();
			boolean epilipsy = objectAMEASupporter.isEpilipsy();
			boolean autism = objectAMEASupporter.isAutism();
			boolean blind = objectAMEASupporter.isBlind();
			boolean mobilityImpaired = objectAMEASupporter.isMobilityImpaired();
			boolean down = objectAMEASupporter.isDown();
			boolean learningSupportPrimarySchool = objectAMEASupporter.isLearningSupportPrimarySchool();
			boolean learningSupportJuniorHighSchool = objectAMEASupporter.isLearningSupportPrimarySchool();
			boolean learningSupportSeniorHighSchool = objectAMEASupporter.isLearningSupportSeniorHighSchool();
			boolean occupationalTherapy = objectAMEASupporter.isOccupationalTherapy();
			boolean logotherapy = objectAMEASupporter.isLogotherapy();
			boolean schoolCompanion = objectAMEASupporter.isSchoolCompanion();
			boolean externalCompanion = objectAMEASupporter.isExternalCompanion();
			List<Education> education = objectAMEASupporterDAO.getAMEASupportersEducation(email);
			List<Experience> exp = objectAMEASupporterDAO.getAMEASupportersExperience(email);

			int numberOfExperiences = 0 ;
			StringBuilder jsonExp = new StringBuilder(" \"experiences\" : {");
            for (Experience experience : exp) { 
            	if (numberOfExperiences > 0) {
            		jsonExp.append(", ");
            	}
            	numberOfExperiences ++;
            	jsonExp.append(" \"exp" + numberOfExperiences + "\" :  { ");
            	jsonExp.append(" \"description\" : \""+ experience.getDescription().replace("\"","'") +"\", ");
            	jsonExp.append(" \"start\" : \""+ experience.getStartdate() +"\", ");
                if (experience.getEnddate()!=null) {         
                	jsonExp.append(" \"end\" : \""+ experience.getEnddate() +"\" ");
                    experience.getEnddate();
                } if (experience.getEnddate()==null) {
                	jsonExp.append(" \"end\" : \"Today\"");
                } 
                jsonExp.append(" } ");
             } 
            if(numberOfExperiences == 0) {
            	jsonExp.append(" \"noexp\" : \"There is no specific information.\"");
            }
            jsonExp.append(" } ");
            
            int nEducation = 0 ;
			StringBuilder jsonEduc = new StringBuilder(" \"education\" : {");
            for (Education ed : education) { 
            	if (nEducation > 0) {
            		jsonEduc.append(", ");
            	}
            	nEducation ++;
            	jsonEduc.append(" \"ed" + nEducation + "\" :  { ");
            	jsonEduc.append(" \"title\" : \""+ ed.getTitle() +"\", ");
            	jsonEduc.append(" \"type\" : \""+ ed.getTypeOfEducation() +"\" ");
                jsonEduc.append(" } ");
             }
            if(nEducation == 0) {
            	jsonEduc.append(" \"noexp\" : \"There is no specific information.\"");
            }
            jsonEduc.append(" } ");

			int numberOfDisability = 0;
			StringBuilder jsonDis = new StringBuilder(" \"disabilities\" : {");
			if (deaf) {
				numberOfDisability++;
				jsonDis.append(" \"dis1\" : \"Deaf\"");
			}
			if (dyslexia) {
				numberOfDisability++;
				if (numberOfDisability > 1) {
					jsonDis.append(", ");
				}
				jsonDis.append(" \"dis" + numberOfDisability + "\" : \"Dyslexia\"");
			}
			if (epilipsy) {
				numberOfDisability++;
				if (numberOfDisability > 1) {
					jsonDis.append(", ");
				}
				jsonDis.append(" \"dis" + numberOfDisability + "\" : \"Epilipsy\"");
			}
			if (autism) {
				numberOfDisability++;
				if (numberOfDisability > 1) {
					jsonDis.append(", ");
				}
				jsonDis.append(" \"dis" + numberOfDisability + "\" : \"Autism\"");
			}
			if (blind) {
				numberOfDisability++;
				if (numberOfDisability > 1) {
					jsonDis.append(", ");
				}
				jsonDis.append(" \"dis" + numberOfDisability + "\" : \"Blind\"");
			}
			if (mobilityImpaired) {
				numberOfDisability++;
				if (numberOfDisability > 1) {
					jsonDis.append(", ");
				}
				jsonDis.append(" \"dis" + numberOfDisability + "\" : \"Mobility Impaired\"");
			}
			if (down) {
				numberOfDisability++;
				if (numberOfDisability > 1) {
					jsonDis.append(", ");
				}
				jsonDis.append(" \"dis" + numberOfDisability + "\" : \"Down\"");
			}
			jsonDis.append(" } ");

			int numberOfService = 0;
			StringBuilder jsonSer = new StringBuilder(" \"services\" : {");

			if (learningSupportPrimarySchool) {
				numberOfService++;
				jsonSer.append(" \"ser1\" : \"Learning Support Primary School\"");
			}
			if (learningSupportJuniorHighSchool) {
				numberOfService++;
				if (numberOfService > 1) {
					jsonSer.append(", ");
				}
				jsonSer.append(" \"ser" + numberOfService + "\" : \"Learning Support Junior High School\"");
			}
			if (learningSupportSeniorHighSchool) {
				numberOfService++;
				if (numberOfService > 1) {
					jsonSer.append(", ");
				}
				jsonSer.append(" \"ser" + numberOfService + "\" : \"Learning Support Senior School\"");
			}
			if (occupationalTherapy) {
				numberOfService++;
				if (numberOfService > 1) {
					jsonSer.append(", ");
				}
				jsonSer.append(" \"ser" + numberOfService + "\" : \"Occupational Therapy\"");
			}
			if (logotherapy) {
				numberOfService++;
				if (numberOfService > 1) {
					jsonSer.append(", ");
				}
				jsonSer.append(" \"ser" + numberOfService + "\" : \"Logotherapy\"");
			}
			if (schoolCompanion) {
				numberOfService++;
				if (numberOfService > 1) {
					jsonSer.append(", ");
				}
				jsonSer.append(" \"ser" + numberOfService + "\" : \"School Companion\"");
			}
			if (externalCompanion) {
				numberOfService++;
				if (numberOfService > 1) {
					jsonSer.append(", ");
				}
				jsonSer.append(" \"ser" + numberOfService + "\" : \"External Companion\"");
			}
			jsonSer.append(" } ");

			StringBuilder json = new StringBuilder("{ \"isEmailValid\" : true , ");
			json.append("\"phone\" : " + phone + ", \"email\" : \"" + email + "\", \"servicearea\" : \"" + servicearea
					+ "\", \"languages\" : \"" + languages + "\", \"name\" : \"" + name + "\", \"surname\" : \""
					+ surname + "\", \"age\" : " + age + ", \"gender\" : \"" + gender + "\", \"servicetown\" : \""
					+ serviceTown + "\", \"pay\" : \"" + pay + "\", \"driver\" : \"" + driver + "\", \"carowner\" : "
					+ carOwner + ", \"available\" : \"" + available + "\", " + jsonDis + ", " + jsonSer + ", " + jsonExp 
					+ ", " + jsonEduc + ", \"monday\" : " + monday + ", \"tuesday\" : " + tuesday + ", \"wednesday\" : " 
					+ wednesday + ", \"thursday\" : " + thursday + ", \"friday\" : " + friday + ", \"saturday\" : " + 
					saturday + ", \"sunday\" : " + sunday + " }");
			System.out.println(json);

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public static void main(String args[]) {
		doPost();
	}

}
