package inthistogether;
import java.sql.*;

public class Education {

    private int id;
    private String customerEmail;
    private String title;
    private String typeOfEducation;
    
    public Education (int id, String customerEmail, String title, String typeOfEducation) {
		this.id = id;
		this.customerEmail = customerEmail;
		this.title = title;
        this.typeOfEducation = typeOfEducation;
	}
	
	public Education (String customerEmail, String title, String typeOfEducation) {
		this.customerEmail = customerEmail;
		this.title = title;
        this.typeOfEducation = typeOfEducation;
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

    public void setTitle(String title) {
		this.title = title;
	}

	public String getTitle() {
		return title;
	}
    
    public String getTypeOfEducation() {
		return typeOfEducation;
	}

	public void setTypeOfEducation(String typeOfEducation) {
		this.typeOfEducation = typeOfEducation;
    }
    
    @Override
	public String toString() {
		return "Ad [id=" + id + ", customerEmail=" + customerEmail + ", title=" + title + ", typeOfEducation="
				+ typeOfEducation + "]";
	}

}