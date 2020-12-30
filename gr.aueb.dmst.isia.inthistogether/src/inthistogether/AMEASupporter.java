package inthistogether;

import java.sql.Date;

public class AMEASupporter {

	private String email;
	private String name;
	private String surname;
	private long phone;
	private String serviceTown;
	private String serviceArea;
	private String password;
	private String sex;
	private Date birthDate;
	private String languages;
	private boolean drivingLisence;
	private boolean carOwner;
	private double payPerHour;
	private boolean available;
	private boolean monday;
	private boolean tuesday;
	private boolean wednesday;
	private boolean thursday;
	private boolean friday;
	private boolean saturday;
	private boolean sunday;
	private boolean deaf;
	private boolean dyslexia;
	private boolean epilipsy;
	private boolean autism;
	private boolean blind;
	private boolean mobilityImpaired;
	private boolean down;
	private boolean learningSupportPrimarySchool;
	private boolean learningSupportJuniorHighSchool;
	private boolean learningSupportSeniorHighSchool;
	private boolean occupationalTherapy;
	private boolean logotherapy;
	private boolean schoolCompanion;
	private boolean externalCompanion;
	private int age;

	public AMEASupporter(String email, String name, String surname, String serviceArea, String languages, boolean deaf,
			boolean dyslexia, boolean epilipsy, boolean autism, boolean blind, boolean mobilityImpaired, boolean down,
			boolean learningSupportPrimarySchool, boolean learningSupportJuniorHighSchool,
			boolean learningSupportSeniorHighSchool, boolean occupationalTherapy, boolean logotherapy,
			boolean schoolCompanion, boolean externalCompanion) {
		this.email = email;
		this.name = name;
		this.surname = surname;
		this.serviceArea = serviceArea;
		this.languages = languages;
		this.deaf = deaf;
		this.dyslexia = dyslexia;
		this.epilipsy = epilipsy;
		this.autism = autism;
		this.blind = blind;
		this.mobilityImpaired = mobilityImpaired;
		this.down = down;
		this.learningSupportPrimarySchool = learningSupportPrimarySchool;
		this.learningSupportJuniorHighSchool = learningSupportJuniorHighSchool;
		this.learningSupportSeniorHighSchool = learningSupportSeniorHighSchool;
		this.occupationalTherapy = occupationalTherapy;
		this.logotherapy = logotherapy;
		this.schoolCompanion = schoolCompanion;
		this.externalCompanion = externalCompanion;
	}
	
	public AMEASupporter(String email, String name, String surname, int age, long phone, String serviceTown, String serviceArea,
			String sex, Date birthDate, String languages, boolean drivingLisence, boolean carOwner, double payPerHour,
			boolean available, boolean monday, boolean tuesday, boolean wednesday, boolean thursday, boolean friday,
			boolean saturday, boolean sunday, boolean deaf, boolean dyslexia, boolean epilipsy, boolean autism,
			boolean blind, boolean mobilityImpaired, boolean down, boolean learningSupportPrimarySchool,
			boolean learningSupportJuniorHighSchool, boolean learningSupportSeniorHighSchool,
			boolean occupationalTherapy, boolean logotherapy, boolean schoolCompanion, boolean externalCompanion) {
		super();
		this.email = email;
		this.name = name;
		this.surname = surname;
		this.age = age;
		this.phone = phone;
		this.serviceTown = serviceTown;
		this.serviceArea = serviceArea;
		this.sex = sex;
		this.birthDate = birthDate;
		this.languages = languages;
		this.drivingLisence = drivingLisence;
		this.carOwner = carOwner;
		this.payPerHour = payPerHour;
		this.available = available;
		this.monday = monday;
		this.tuesday = tuesday;
		this.wednesday = wednesday;
		this.thursday = thursday;
		this.friday = friday;
		this.saturday = saturday;
		this.sunday = sunday;
		this.deaf = deaf;
		this.dyslexia = dyslexia;
		this.epilipsy = epilipsy;
		this.autism = autism;
		this.blind = blind;
		this.mobilityImpaired = mobilityImpaired;
		this.down = down;
		this.learningSupportPrimarySchool = learningSupportPrimarySchool;
		this.learningSupportJuniorHighSchool = learningSupportJuniorHighSchool;
		this.learningSupportSeniorHighSchool = learningSupportSeniorHighSchool;
		this.occupationalTherapy = occupationalTherapy;
		this.logotherapy = logotherapy;
		this.schoolCompanion = schoolCompanion;
		this.externalCompanion = externalCompanion;
	}



	public AMEASupporter(String email, String name, String surname, long phone, String serviceTown, String serviceArea,
			String password, String sex, Date birthDate, String languages, boolean drivingLisence, boolean carOwner,
			double payPerHour, boolean available, boolean monday, boolean tuesday, boolean wednesday, boolean thursday,
			boolean friday, boolean saturday, boolean sunday, boolean deaf, boolean dyslexia, boolean epilipsy,
			boolean autism, boolean blind, boolean mobilityImpaired, boolean down, boolean learningSupportPrimarySchool,
			boolean learningSupportJuniorHighSchool, boolean learningSupportSeniorHighSchool,
			boolean occupationalTherapy, boolean logotherapy, boolean schoolCompanion, boolean externalCompanion) {
		this.email = email;
		this.name = name;
		this.surname = surname;
		this.phone = phone;
		this.serviceTown = serviceTown;
		this.serviceArea = serviceArea;
		this.password = password;
		this.sex = sex;
		this.birthDate = birthDate;
		this.languages = languages;
		this.drivingLisence = drivingLisence;
		this.carOwner = carOwner;
		this.payPerHour = payPerHour;
		this.available = available;
		this.monday = monday;
		this.tuesday = tuesday;
		this.wednesday = wednesday;
		this.thursday = thursday;
		this.friday = friday;
		this.saturday = saturday;
		this.sunday = sunday;
		this.deaf = deaf;
		this.dyslexia = dyslexia;
		this.epilipsy = epilipsy;
		this.autism = autism;
		this.blind = blind;
		this.mobilityImpaired = mobilityImpaired;
		this.down = down;
		this.learningSupportPrimarySchool = learningSupportPrimarySchool;
		this.learningSupportJuniorHighSchool = learningSupportJuniorHighSchool;
		this.learningSupportSeniorHighSchool = learningSupportSeniorHighSchool;
		this.occupationalTherapy = occupationalTherapy;
		this.logotherapy = logotherapy;
		this.schoolCompanion = schoolCompanion;
		this.externalCompanion = externalCompanion;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getName() {
		return name;
	}
	
	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
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

	public long getPhone() {
		return phone;
	}

	public void setPhone(long phone) {
		this.phone = phone;
	}

	public String getServiceTown() {
		return serviceTown;
	}

	public void setServiceTown(String serviceTown) {
		this.serviceTown = serviceTown;
	}

	public String getServiceArea() {
		return serviceArea;
	}

	public void setServiceArea(String serviceArea) {
		this.serviceArea = serviceArea;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public Date getBirthDate() {
		return birthDate;
	}

	public void setBirthDate(Date birthDate) {
		this.birthDate = birthDate;
	}

	public String getLanguages() {
		return languages;
	}

	public void setLanguages(String languages) {
		this.languages = languages;
	}

	public boolean isDrivingLisence() {
		return drivingLisence;
	}

	public void setDrivingLisence(boolean drivingLisence) {
		this.drivingLisence = drivingLisence;
	}

	public boolean isCarOwner() {
		return carOwner;
	}

	public void setCarOwner(boolean carOwner) {
		this.carOwner = carOwner;
	}

	public double getPayPerHour() {
		return payPerHour;
	}

	public void setPayPerHour(double payPerHour) {
		this.payPerHour = payPerHour;
	}

	public boolean isAvailable() {
		return available;
	}

	public void setAvailable(boolean available) {
		this.available = available;
	}

	public boolean isMonday() {
		return monday;
	}

	public void setMonday(boolean monday) {
		this.monday = monday;
	}

	public boolean isTuesday() {
		return tuesday;
	}

	public void setTuesday(boolean tuesday) {
		this.tuesday = tuesday;
	}

	public boolean isWednesday() {
		return wednesday;
	}

	public void setWednesday(boolean wednesday) {
		this.wednesday = wednesday;
	}

	public boolean isThursday() {
		return thursday;
	}

	public void setThursday(boolean thursday) {
		this.thursday = thursday;
	}

	public boolean isFriday() {
		return friday;
	}

	public void setFriday(boolean friday) {
		this.friday = friday;
	}

	public boolean isSaturday() {
		return saturday;
	}

	public void setSaturday(boolean saturday) {
		this.saturday = saturday;
	}

	public boolean isSunday() {
		return sunday;
	}

	public void setSunday(boolean sunday) {
		this.sunday = sunday;
	}

	public boolean isDeaf() {
		return deaf;
	}

	public void setDeaf(boolean deaf) {
		this.deaf = deaf;
	}

	public boolean isDyslexia() {
		return dyslexia;
	}

	public void setDyslexia(boolean dyslexia) {
		this.dyslexia = dyslexia;
	}

	public boolean isEpilipsy() {
		return epilipsy;
	}

	public void setEpilipsy(boolean epilipsy) {
		this.epilipsy = epilipsy;
	}

	public boolean isAutism() {
		return autism;
	}

	public void setAutism(boolean autism) {
		this.autism = autism;
	}

	public boolean isBlind() {
		return blind;
	}

	public void setBlind(boolean blind) {
		this.blind = blind;
	}

	public boolean isMobilityImpaired() {
		return mobilityImpaired;
	}

	public void setMobilityImpaired(boolean mobilityImpaired) {
		this.mobilityImpaired = mobilityImpaired;
	}

	public boolean isDown() {
		return down;
	}

	public void setDown(boolean down) {
		this.down = down;
	}

	public boolean isLearningSupportPrimarySchool() {
		return learningSupportPrimarySchool;
	}

	public void setLearningSupportPrimarySchool(boolean learningSupportPrimarySchool) {
		this.learningSupportPrimarySchool = learningSupportPrimarySchool;
	}

	public boolean isLearningSupportJuniorHighSchool() {
		return learningSupportJuniorHighSchool;
	}

	public void setLearningSupportJuniorHighSchool(boolean learningSupportJuniorHighSchool) {
		this.learningSupportJuniorHighSchool = learningSupportJuniorHighSchool;
	}

	public boolean isLearningSupportSeniorHighSchool() {
		return learningSupportSeniorHighSchool;
	}

	public void setLearningSupportSeniorHighSchool(boolean learningSupportSeniorHighSchool) {
		this.learningSupportSeniorHighSchool = learningSupportSeniorHighSchool;
	}

	public boolean isOccupationalTherapy() {
		return occupationalTherapy;
	}

	public void setOccupationalTherapy(boolean occupationalTherapy) {
		this.occupationalTherapy = occupationalTherapy;
	}

	public boolean isLogotherapy() {
		return logotherapy;
	}

	public void setLogotherapy(boolean logotherapy) {
		this.logotherapy = logotherapy;
	}

	public boolean isSchoolCompanion() {
		return schoolCompanion;
	}

	public void setSchoolCompanion(boolean schoolCompanion) {
		this.schoolCompanion = schoolCompanion;
	}

	public boolean isExternalCompanion() {
		return externalCompanion;
	}

	public void setExternalCompanion(boolean externalCompanion) {
		this.externalCompanion = externalCompanion;
	}

}
