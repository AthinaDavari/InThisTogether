package inthistogether;

import java.util.Date;

/**
 * 
 * @author t8180146@aueb.gr
 *
 */
public class Experience {
	private int id;
	private String email;
	private String description;
	private Date startdate;
	private Date enddate;
	
	/**
	 * 
	 * @param id
	 * @param email
	 * @param description
	 * @param startdate
	 * @param enddate
	 */
	public Experience(int id, String email, String description, Date startdate, Date enddate) {
		this.id = id;
		this.email = email;
		this.description = description;
		this.startdate = startdate;
		this.enddate = enddate;
    }
    
    public Experience(String email, String description, Date startdate, Date enddate) {
		this.email = email;
		this.description = description;
		this.startdate = startdate;
		this.enddate = enddate;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
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
	
	
	
}