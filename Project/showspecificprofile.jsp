<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="inthistogether.*" %>
<%@ page import="java.util.*" %>
<%@ page errorPage="errorpage.jsp" %>

<%
Customer customer = (Customer)session.getAttribute("customerObj");
%>

<%
AMEASupporter ameasupporter = (AMEASupporter)session.getAttribute("ameasupporterObj");
%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta name="author" content="t8180146@aueb.gr">
    
    <%@ include file="header.jsp" %>
    <link href="<%=request.getContextPath() %>/css/background.css" rel="stylesheet">


    <style>
        p,
        .card-title {
            text-align: center;
        }

        img {
            display: block;
            margin-left: auto;
            margin-right: auto;
        }

    </style>

</head>

<body>

    <%@ include file="navbar.jsp" %>
    
    <%
        String email = request.getParameter("email");
        AMEASupporterDAO objectAMEASupporterDAO = new AMEASupporterDAO();
        AMEASupporter objectAMEASupporter2 = null;

        if (email != null){
            objectAMEASupporter2 = objectAMEASupporterDAO.getAmeaSupporter(email);
        }

    %>

    <div class="container">
        <br><br>
        <div class="row">
            <div class="panel panel-default col-sm-3 col-sm-offset-1">
                <div class="panel-body" id="panel">
                    <img class="card-img-top" src="<%=request.getContextPath() %>/images/member1.png" alt="There is no available photo">
                    <h5 class="card-title" id="full name" style="font-size: large;"><b><%=objectAMEASupporter2.getName()%> <%=objectAMEASupporter2.getSurname()%></b></h5>
                    <hr>
                    <p class="card-text" id="town">
                        <%if(objectAMEASupporter2.getServiceTown()!=null){%>
                            Service Town: <%=objectAMEASupporter2.getServiceTown()%>
                        <% } else { %>
                            There is no specific Service Town.
                        <% } %>
                    </p>
                    <p class="card-text" id="age">
                        <% if (objectAMEASupporter2.getAge()!=0){ %>
                            Age: <%=objectAMEASupporter2.getAge()%>
                        <% } else { %>
                            There is no specific Service Town.
                        <% } %>
                    </p>
                    <p class="card-text" id="age">Sex: <%=objectAMEASupporter2.getSex()%></p>
                    <p class="card-text" id="available">
                        <% if (objectAMEASupporter2.isAvailable()){ %>
                            Available
                        <% } else { %>
                            Not Available
                        <% } %>
                    </p>
                    <p class="card-text" id="payment">
                        <% if (objectAMEASupporter2.getPayPerHour()!=-1) { %>
                            &euro; Payment per hour: <%=objectAMEASupporter2.getPayPerHour()%>
                        <% } else { %>
                            &euro; Payment per hour: not defined
                        <% } %>
                    </p>
                </div>
            </div>

            <div class="panel-body col-sm-6 col-sm-offset-2" id="disabilityservice">
                <div class="panel panel-default">
                    <div class="panel-heading">Disability Service</div>
                    <div class="panel-body">
                        <%if(objectAMEASupporter2.isDeaf()==false && objectAMEASupporter2.isDyslexia()==false && objectAMEASupporter2.isEpilipsy()==false && 
                        objectAMEASupporter2.isAutism()==false && objectAMEASupporter2.isBlind()==false && objectAMEASupporter2.isMobilityImpaired()==false && 
                        objectAMEASupporter2.isDown()==false ){%>
                            There is no specific information.
                        <% } else { %>
                            <ul class>
                                <% if (objectAMEASupporter2.isDeaf()) { %>
                                    <li>Deaf</li>
                                <% } %> 
                                <% if (objectAMEASupporter2.isDyslexia()) { %>
                                    <li>Dyslexia</li>
                                <% } %> 
                                </li>
                                <% if (objectAMEASupporter2.isEpilipsy()) { %>
                                    <li>Epilipsy</li>
                                <% } %> 
                                </li>
                                <% if (objectAMEASupporter2.isAutism()) { %>
                                    <li>Autism</li>
                                <% } %> 
                                </li>
                                <% if (objectAMEASupporter2.isBlind()) { %>
                                    <li>Blind</li>
                                <% } %> 
                                </li>
                                <% if (objectAMEASupporter2.isMobilityImpaired()) { %>
                                    <li>Mobility Impaired</li>
                                <% } %> 
                                </li>
                                <% if (objectAMEASupporter2.isDown()) { %>
                                    <li>Down</li>
                                <% } %> 
                                </li>
                            </ul>
                        <% } %>
                    </div>
                </div>
            </div>

            <div class="panel-body col-sm-6 col-sm-offset-2" id="service">
                <div class="panel panel-default">
                    <div class="panel-heading">Service</div>
                    <div class="panel-body">
                        <%if(objectAMEASupporter2.isLearningSupportPrimarySchool()==false && objectAMEASupporter2.isLearningSupportJuniorHighSchool()==false && objectAMEASupporter2.isLearningSupportSeniorHighSchool()==false && 
                        objectAMEASupporter2.isOccupationalTherapy()==false && objectAMEASupporter2.isLogotherapy()==false && objectAMEASupporter2.isSchoolCompanion()==false && 
                        objectAMEASupporter2.isExternalCompanion()==false ){%>
                            There is no specific information.
                        <% } else { %>
                            <ul class>
                                <% if (objectAMEASupporter2.isLearningSupportPrimarySchool()) { %>
                                    <li>Learning Support Primary School</li>
                                <% } %> 
                                <% if (objectAMEASupporter2.isLearningSupportJuniorHighSchool()) { %>
                                    <li>Learning Support Junior HighSchool</li>
                                <% } %> 
                                <% if (objectAMEASupporter2.isLearningSupportSeniorHighSchool()) { %>
                                    <li>Learning Support Senior HighSchool</li>
                                <% } %> 
                                <% if (objectAMEASupporter2.isOccupationalTherapy()) { %>
                                    <li>Occupational Therapy</li>
                                <% } %> 
                                <% if (objectAMEASupporter2.isLogotherapy()) { %>
                                    <li>Logotherapy</li>
                                <% } %> 
                                <% if (objectAMEASupporter2.isSchoolCompanion()) { %>
                                    <li>School Companion</li>
                                <% } %> 
                                <% if (objectAMEASupporter2.isExternalCompanion()) { %>
                                    <li>External Companion</li>
                                <% } %> 
                            </ul>
                        <% } %>
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="panel-body col-sm-5" id="contact">
                <div class="panel panel-default">
                    <div class="panel-heading">Contact Info</div>
                    <div class="panel-body">
                        <ul class>
                            <li>email: <%=objectAMEASupporter2.getEmail()%></li>
                            <li>phone: <%=objectAMEASupporter2.getPhone()%></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="panel-body col-sm-6 col-sm-offset-1" id="experience">
                <div class="panel panel-default">
                    <div class="panel-heading">Experience</div>
                    <div class="panel-body">
                        <%if(objectAMEASupporterDAO.getAMEASupportersExperience(email).size()!=0){%>
                        <ul class>
                            <%List<Experience> exp = objectAMEASupporterDAO.getAMEASupportersExperience(email);
                            for (Experience experience : exp) { %>
                                <% if (experience.getEnddate()!=null) { %>
                                    <li><%=experience.getStartdate()%> - <%=experience.getEnddate()%> : <%=experience.getDescription()%></li>
                                <%} if (experience.getEnddate()==null) {%>
                                    <li><%=experience.getStartdate()%> - Today : <%=experience.getDescription()%></li>
                                <% } %>
                            <% } %>
                        </ul>
                        <%} else {%>
                            There is no specific information.
                        <% } %>
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="panel-body col-sm-5" id="language">
                <div class="panel panel-default">
                    <div class="panel-heading">Languages</div>
                    <div class="panel-body">
                        <%if(objectAMEASupporter2.getLanguages()!=null){%>
                            <%=objectAMEASupporter2.getLanguages()%>
                        <% } else { %>
                            There is no specific information.
                        <% } %>
                    </div>
                </div>
            </div>

            <div class="panel-body col-sm-6 col-sm-offset-1" id="education">
                <div class="panel panel-default">
                    <div class="panel-heading">Education</div>
                    <div class="panel-body">
                        <%if(objectAMEASupporterDAO.getAMEASupportersEducation(email).size()!=0){%>
                            <ul class>
                                <% for (Education education : objectAMEASupporterDAO.getAMEASupportersEducation(email)) { %>
                                    <li><%=education.getTitle()%> : <%=education.getTypeOfEducation()%></li>
                                <% } %>
                            </ul>
                        <%} else {%>
                            There is no specific information.
                        <% } %>
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="panel-body col-sm-5" id="servicearea">
                <div class="panel panel-default">
                    <div class="panel-heading">Service Area</div>
                        <div class="panel-body"> 
                            <%if(objectAMEASupporter2.getServiceArea()!=null){%>
                                <%=objectAMEASupporter2.getServiceArea()%>
                            <%} else {%>
                                There is no specific information.
                            <% } %>
                        </div>
                </div>
            </div>
            
            <div class="panel-body col-sm-6 col-sm-offset-1" id="driver">
                <div class="panel panel-default">
                    <div class="panel-heading">Driver</div>
                    <div class="panel-body">
                        <%if (objectAMEASupporter2.isDrivingLisence()){ %>
                            &#10003; Driver
                        <% } else { %>
                            &#10007; Driver
                        <% } %>
                        <br>
                        <%if (objectAMEASupporter2.isCarOwner()){ %>
                            &#10003; Car Owner
                        <% } else { %>
                            &#10007; Car Owner
                        <% } %>
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="panel-body col-sm-5" id="availability">
                <div class="panel panel-default">
                    <div class="panel-heading">Availabiable Days</div>
                    <div class="panel-body">
                        <%if(objectAMEASupporter2.isMonday()==false && objectAMEASupporter2.isTuesday()==false && objectAMEASupporter2.isWednesday()==false && 
                        objectAMEASupporter2.isThursday()==false && objectAMEASupporter2.isFriday()==false && objectAMEASupporter2.isSaturday()==false && 
                        objectAMEASupporter2.isSunday()==false ){%>
                            There is no specific information.
                        <% } else { %>
                            <ul class>
                                <% if (objectAMEASupporter2.isMonday()) { %>
                                    <li>Monday</li>
                                <% } %> 
                                <% if (objectAMEASupporter2.isTuesday()) { %>
                                    <li>Tuesday</li>
                                <% } %> 
                                <% if (objectAMEASupporter2.isWednesday()) { %>
                                    <li>Wednesday</li>
                                <% } %> 
                                <% if (objectAMEASupporter2.isThursday()) { %>
                                    <li>Thursday</li>
                                <% } %> 
                                <% if (objectAMEASupporter2.isFriday()) { %>
                                    <li>Friday</li>
                                <% } %> 
                                <% if (objectAMEASupporter2.isSaturday()) { %>
                                    <li>Saturday</li>
                                <% } %> 
                                <% if (objectAMEASupporter2.isSunday()) { %>
                                    <li>Sunday</li>
                                <% } %> 
                            </ul>
                        <% } %>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <br> <br> <br> <br> <br> <br>
    <%@ include file="footer.jsp" %>
</body>

</html>