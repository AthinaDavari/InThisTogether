import java.util.Date;

/**
 * 
 * @author t8180146@aueb.gr
 *
 */
public class Ad {
	private String email;
	private String disability;
	private String service;
	private Date startdate;
	private Date enddate;
	private String location;
	private String description;
	
	/**
	 * 
	 * @param email
	 * @param disability
	 * @param service
	 * @param startdate
	 * @param enddate
	 * @param location
	 * @param description
	 */
	public Ad(String email, String disability, String service, Date startdate, Date enddate, String location, String description) {
		this.email = email;
		this.disability = disability;
		this.service = service;
		this.startdate = startdate;
		this.enddate = enddate;
		this.location = location;
		this.description = description;
	}
	
	

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getDisability() {
		return disability;
	}

	public void setDisability(String disability) {
		this.disability = disability;
	}

	public String getService() {
		return service;
	}

	public void setService(String service) {
		this.service = service;
	}

	public Date getStartdate() {
		return startdate;
	}

	public void setStartdate(Date startdate) {
		this.startdate = startdate;
	}

	public Date getEnddate() {
		return enddate;
	}

	public void setEnddate(Date enddate) {
		this.enddate = enddate;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}
	
}