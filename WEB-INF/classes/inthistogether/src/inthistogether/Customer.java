package inthistogether;

public class Customer {
    
    private String email;
	private Long phone;
	private String password;
	private String name;
    private String surname;
	
	
	public Customer(String email, Long phone, String password, String name, String surname) {
		
		this.email = email;
		this.phone = phone;
		this.password = password;
		this.name = name;
		this.surname = surname;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public Long getPhone() {
		return phone;
	}


	public void setPhone(Long phone) {
		this.phone = phone;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
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


	@Override
	public String toString() {
		return "Customer [email=" + email + ", phone=" + phone + ", password=" + password + ", name=" + name
				+ ", surname=" + surname + "]";
	}


	public static boolean isLong(String s) {
		boolean isValidLong = true;
		try
		{
		   Long.parseLong(s); 
		   // s is a valid integer
		}
		catch (NumberFormatException ex)
		{
			isValidLong = false;
		   // s is not an integer
		}
		return isValidLong;
	 }

} 
