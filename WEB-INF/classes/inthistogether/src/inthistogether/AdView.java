package inthistogether;

import java.sql.Date;

public class AdView extends Ad{
	private long phone;
	private String name;
	private String surname;

	public AdView(String customerEmail, Date startDate, Date endDate, String service, String disabity,
			String description, String location, long phone, String name, String surname) {
		super(customerEmail, startDate, endDate, service, disabity, description, location);
		this.phone = phone;
		this.name = name;
		this.surname = surname;
	}

	public long getPhone() {
		return phone;
	}

	public void setPhone(long phone) {
		this.phone = phone;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSurname() {
		return surname;
	}

	public void setSurname(String surname) {
		this.surname = surname;
	}

}
