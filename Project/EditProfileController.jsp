<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="errorpage.jsp"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.sql.Date" %>
<%@ page import="inthistogether.*" %>
<%@ page import="java.util.*" %>

<% Customer customer=(Customer)session.getAttribute("customerObj"); %>

<% AMEASupporter ameasupporter=(AMEASupporter)session.getAttribute("ameasupporterObj"); %>

<!doctype html>
<html lang="en">
    
    <head>
   
    <%@include file="header.jsp" %>
    <meta name="author" content="t8180112@aueb.gr">
    <title>Edit Profile Controller</title>
    <link href="<%=request.getContextPath() %>/css/background.css" rel="stylesheet">

    </head>

    <body>
        <%@ include file="navbar.jsp" %>
            
<%
String name = request.getParameter("name");
String surname = request.getParameter("surname"); 
String email = request.getParameter("email"); 
String phone = request.getParameter("phone");
String bday = request.getParameter("birthday");
String sex = request.getParameter("sex");
String languages = request.getParameter("languages");
String serviceTown = request.getParameter("serviceTown");
String serviceArea = request.getParameter("serviceArea");
String drivLicence = request.getParameter("driversLicence");
String carOwn = request.getParameter("carOwner");
String payPerH = request.getParameter("payPerH");
String availNow = request.getParameter("availableNow");

String[] education = request.getParameterValues("education[]");
String[] titleOfEd = request.getParameterValues("titleOfEd[]");
String[] experience = request.getParameterValues("exper[]");
String[] startDate = request.getParameterValues("startd[]");
String[] endDate = request.getParameterValues("endd[]");

String[] availableDays = request.getParameterValues("availableDays");
if (null==availableDays || availableDays.length==0) {
    availableDays = new String[0];
}
String[] service = request.getParameterValues("service");
String[] disab = request.getParameterValues("disab");


// convert from ISO-8859-1 (latin) to UTF-8 so as to support Greek characters
name = new String(name.getBytes("ISO-8859-1"), "UTF-8");
surname = new String(surname.getBytes("ISO-8859-1"), "UTF-8");
languages = new String(languages.getBytes("ISO-8859-1"), "UTF-8");
//titleOfEd = new String(titleOfEd.getBytes("ISO-8859-1"), "UTF-8");
//experience = new String(experience.getBytes("ISO-8859-1"), "UTF-8");
serviceArea = new String(serviceArea.getBytes("ISO-8859-1"), "UTF-8");

// if direct access (not via form) redirect to the form page


if (phone==null || sex==null || languages==null || serviceTown==null || serviceArea==null || drivLicence==null || carOwn==null || availNow==null || service==null || disab==null) {
    
    response.sendRedirect("registerAsAmeaSupporterController.jsp");
    return;
} 


Date birthday=java.sql.Date.valueOf(bday);

Date[] start = new Date[startDate.length];
Date a;
for (int i=0; i < startDate.length; i++) {
    if (startDate[i].equals("")){
        start[i] = null;
    } else {
        a = java.sql.Date.valueOf(startDate[i]);
        start[i] = a;
    }
}

Date[] end = new Date[endDate.length];
Date b;
for (int i=0; i < endDate.length; i++) {
    if (endDate[i].equals("")){
        end[i] = null;
    } else {
        b = java.sql.Date.valueOf(endDate[i]);
        end[i] = b;
    }
}

double payPerHour;
if (!(payPerH.equals(""))) {
     payPerHour=Double.parseDouble(payPerH); 
} else {
    payPerHour = -1.0;
}
boolean phoneIsLong = AMEASupporter.isLong(phone);
boolean driversLisence=Boolean.parseBoolean(drivLicence);
boolean carOwner=Boolean.parseBoolean(carOwn);
boolean availableNow=Boolean.parseBoolean(availNow);


boolean monday = false;
boolean tuesday = false;
boolean wednesday = false;
boolean thursday = false;
boolean friday = false;
boolean saturday = false;
boolean sunday = false;
for ( String days : availableDays) {
    
    if (days.equals("monday")) {
        monday = true;
        continue;
    }
    if (days.equals("tuesday")) {
        tuesday = true;
        continue;
    }
    if (days.equals("wednesday")) {
        wednesday = true;
        continue;
    }
    if (days.equals("thursday")) {
        thursday = true;
        continue;
    }
    if (days.equals("friday")) {
        friday = true;
        continue;
    }
    if (days.equals("saturday")) {
        saturday = true;
        continue;
    }
    if (days.equals("sunday")) {
        sunday = true;
        continue;
    }
}

boolean learningSupportPrimarySchool = false;
boolean learningSupportJuniorHighSchool = false;
boolean learningSupportSeniorHighSchool = false;
boolean occupationalTherapy = false;
boolean logotherapy = false;
boolean schoolCompanion = false;
boolean externalCompanion = false;
for (String serv : service) {

    if (serv.equals("learningSupportPrimarySchool")) {
        learningSupportPrimarySchool = true;
        continue;
    }
    if (serv.equals("learningSupportJuniorHighSchool")) {
        learningSupportJuniorHighSchool = true;
        continue;
    }
    if (serv.equals("learningSupportSeniorHighSchool")) {
        learningSupportSeniorHighSchool = true;
        continue;
    }
    if (serv.equals("occupationalTherapy")) {
        occupationalTherapy = true;
        continue;
    }
    if (serv.equals("logotherapy")) {
        logotherapy = true;
        continue;
    }
    if (serv.equals("schoolCompanion")) {
        schoolCompanion = true;
        continue;
    }
    if (serv.equals("externalCompanion")) {
        externalCompanion = true;
        continue;
    }
}

boolean deaf = false;
boolean dyslexia = false;
boolean epilipsy = false;
boolean autism = false;
boolean blind = false;
boolean mobilityImpaired = false;
boolean down = false;
for (String dis : disab) {

    if (dis.equals("deaf")) {
        deaf = true;
        continue;
    }
    if (dis.equals("dyslexia")) {
        dyslexia = true;
        continue;
    }
    if (dis.equals("epilipsy")) {
        epilipsy = true;
        continue;
    }
    if (dis.equals("autism")) {
        autism = true;
        continue;
    }
    if (dis.equals("blind")) {
        blind = true;
        continue;
    }
    if (dis.equals("mobilityImpaired")) {
        mobilityImpaired = true;
        continue;
    }
    if (dis.equals("down")) {
        down = true;
        continue;
    }
}

AnyMatch anymatch = new AnyMatch();
List<Education> educationList = new ArrayList<Education>();
Boolean errorEduc = false;
if (education.length==titleOfEd.length) {

    if (education.length==1) {

        if (!education[0].equals("") && !titleOfEd[0].equals("")) {
            educationList.add(new Education(email, titleOfEd[0], education[0]));
        } else if (!(education[0].equals("") && titleOfEd[0].equals(""))) {
            errorEduc = true;
        }
    } else {
        
        if (!(anymatch.anyMatch(education)) && !(anymatch.anyMatch(titleOfEd))) {
            
            for ( int i=0; i<(education.length); i++ ) {
                educationList.add(new Education(email, titleOfEd[i], education[i]));
            }

        } else if (anymatch.anyMatch(education) && anymatch.anyMatch(titleOfEd)) {

            for ( int i=0; i<(education.length); i++ ) {
                if (!education[i].equals("") && !titleOfEd[i].equals("")) {
                    educationList.add(new Education(email, titleOfEd[i], education[i]));
                } else if (!(education[i].equals("") && titleOfEd[i].equals(""))) {
                    errorEduc = true;
                }            }

        } else {
            errorEduc = true;
        }
    }

} else {
    errorEduc = true;
} 

AnyMatch anym = new AnyMatch();
List<Experience> experienceList = new ArrayList<Experience>();
Boolean errorExp = false;
Boolean wrongDate = false;
if ( experience.length>=start.length && experience.length>=end.length && start.length>=end.length) {

    if (experience.length==1) {

        if (!experience[0].equals("") && start[0]!=null && end[0]!=null) {
            if (start[0].before(end[0])) {
                experienceList.add(new Experience(email, experience[0], start[0], end[0]));
            } else {
                wrongDate = true;
            }
        } else if (!experience[0].equals("") && start[0]!=null && end[0]==null) {
            experienceList.add(new Experience(email, experience[0], start[0], end[0]));
        } else if (!experience[0].equals("") && start[0]==null && end[0]==null) {
            experienceList.add(new Experience(email, experience[0], start[0], end[0]));
        } else if (!(experience[0].equals("") && start[0]==null && end[0]==null)) {
            errorExp = true;
        } 

    } else {
        
        if (!(anym.anyMatch(experience))) {
            
            for ( int i=0; i<(experience.length); i++ ) {
                if (start[i]!=null && end[i]!=null) {
                    if (start[i].before(end[i])) {
                        experienceList.add(new Experience(email, experience[i], start[i], end[i]));
                    } else {
                        wrongDate = true;
                    }
                } else if (start[i]!=null && end[i]==null) {
                    experienceList.add(new Experience(email, experience[i], start[i], end[i]));
                } else if (start[i]==null && end[i]==null) {
                    experienceList.add(new Experience(email, experience[i], start[i], end[i]));
                } else {
                    errorExp = true;
                }
            }

        } else {

            for ( int i=0; i<(experience.length); i++ ) {
                if (!experience[i].equals("") && start[i]!=null && end[i]!=null) {
                    if (start[i].before(end[i])) {
                        experienceList.add(new Experience(email, experience[i], start[i], end[i]));
                    } else {
                        wrongDate = true;
                    }
                } else if (!experience[i].equals("") && start[i]!=null && end[i]==null) {
                    experienceList.add(new Experience(email, experience[i], start[i], end[i]));
                } else if (!experience[i].equals("") && start[i]==null && end[i]==null) {
                    experienceList.add(new Experience(email, experience[i], start[i], end[i]));
                } else if (!(experience[i].equals("") && start[i]==null && end[i]==null)) {
                    errorExp = true;
                } 
            }
        }
    }

} else {
    errorExp = true;
}

// start if for the main code 
if ( (phoneIsLong) && phone.length() == 10 && !(errorEduc) && !(errorExp) && !(wrongDate)  && languages.length()>=5 && serviceArea.length()>=3 ) {
    
    Long newPhone = Long.parseLong(phone);
    // start if nested for the phone isPositive check 
    if (newPhone > 0) {
        AMEASupporterDAO ameasupdao = new AMEASupporterDAO();
        AMEASupporter ameasup = new AMEASupporter(email, name, surname, newPhone, serviceTown, serviceArea, sex, birthday, languages, driversLisence, carOwner,
                                                payPerHour, availableNow, monday, tuesday, wednesday, thursday, friday, saturday, sunday, deaf, dyslexia, epilipsy, autism, blind, 
                                                mobilityImpaired, down, learningSupportPrimarySchool, learningSupportJuniorHighSchool, learningSupportSeniorHighSchool, 
                                                occupationalTherapy, logotherapy, schoolCompanion, externalCompanion);
        
        ameasupdao.editProfile(ameasup, educationList, experienceList);
    %>
        <div class="container theme-showcase" role="main">
            <div class="page-header">
                <h1>Edit was completed successfully!</h1>
            </div>
        </div>
     
    <%
    } else {
    %>
    <div class="container theme-showcase" role="main">
        <div class="page-header">
            <h1>Edit form has errors</h1>
        </div>

        <div class="alert alert-danger col-sm-12" role="alert">
            <p><b> Phone must be a positive number </b></p>
        </div>
    </div>
        
    <%
    } //end if nested

//wrong inputs-mistakes
} else {
    %>
    <div class="container theme-showcase" role="main">
        <div class="page-header">
            <h1>Edit form has errors</h1>
        </div>
        
        <div class="alert alert-danger col-sm-12" role="alert">
            <ol>
            <%
            if (!(phoneIsLong)) {
            %> 
                <li> Not a valid phone number </li> 
            <%
            } else {
                if (Long.parseLong(phone) < 0) {
                %>
                    <li> Phone must be a positive number </li>
                <%
                }
                if (phone.length() < 10 || phone.length() > 10) {
                %> 
                    <li> Phone must have exactly 10 numbers </li> 
                <%
                }
            }
            if (languages.length() < 5 ) {
            %>
                <li>Language must be at least 5 characters long</li>
            <%
            }
            if (serviceArea.length() <3 ) {
            %>
                <li>Service Area must be at least 3 characters long</li>
            <%
            }
            if (errorEduc) {
            %>
                <li> Education form has errors. Please make sure the fields are filled correctly. </li>
            <%
            }
            if (errorExp) {
            %>
                <li> Experience form has errors. Please make sure the fields are filled correctly. </li>
            <%
            }
            if (wrongDate) {
            %>
                <li> Experience form has errors. Please make sure the end date is larger than the start date. </li>
            <%
            }
            %>
            </ol>
        </div>
    </div>
       
    <%
    }  // end if for main code
    %>  
    </div>
    <br><br><br><br><br><br><br><br><br><br>
    
        <%@include file="footer.jsp" %>
    
        </body>
    
    </html>