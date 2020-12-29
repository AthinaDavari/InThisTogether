package inthistogether;

import java.sql.Date;

public class Ad {

    private int id;
    private String customerEmail;
    private Date startDate;
    private Date endDate;
    private String service;
    private String disabity;
    private String description;
    private String location;
    
    public Ad(String customerEmail, Date startDate, Date endDate, String service, String disabity,
			String description, String location) {
		this.customerEmail = customerEmail;
		this.startDate = startDate;
		this.endDate = endDate;
		this.service = service;
		this.disabity = disabity;
		this.description = description;
		this.location = location;
	}

	public Ad(int id, String customerEmail, Date startDate, Date endDate, String service, String disabity,
			String description, String location) {
		this.id = id;
		this.customerEmail = customerEmail;
		this.startDate = startDate;
		this.endDate = endDate;
		this.service = service;
		this.disabity = disabity;
		this.description = description;
		this.location = location;
	}

    
    public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getCustomerEmail() {
		return customerEmail;
	}

	public void setCustomerEmail(String customerEmail) {
		this.customerEmail = customerEmail;
	}

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public String getService() {
		return service;
	}

	public void setService(String service) {
		this.service = service;
	}

	public String getDisabity() {
		return disabity;
	}

	public void setDisabity(String disabity) {
		this.disabity = disabity;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	@Override
	public String toString() {
		return "Ad [id=" + id + ", customerEmail=" + customerEmail + ", startDate=" + startDate + ", endDate=" + endDate
				+ ", service=" + service + ", disabity=" + disabity + ", description=" + description + ", location="
				+ location + "]";
	}

	
	
	
}
