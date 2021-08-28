<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="errorpage.jsp"%>
<%@ page import="inthistogether.*" %>
<%@ page import="java.util.*" %>

<%
Customer customer = (Customer)session.getAttribute("customerObj");

AMEASupporter ameasupporter = (AMEASupporter)session.getAttribute("ameasupporterObj");
%>

<!doctype html>
<html lang="en">
    
    <head>
   
    <%@include file="header.jsp" %>
    <meta name="author" content="t8180112@aueb.gr">
    <title>Edit Profile</title>
    <link href="<%=request.getContextPath() %>/css/background.css" rel="stylesheet">

    <style>
        h1 {
            text-align:center;
        }
        fieldset {
            border-radius: 5px;
            padding: 20px;
        }
        .wrapper {
            text-align: center;
        }
        label {
            font-size: 16px;
        }
        .dotted {
            border-style: dotted;
        }
    </style>

    </head>

    <body>

        <%@ include file="navbar.jsp" %>
        <% if(session.getAttribute("ameasupporterObj") ==null){ 
        
            request.setAttribute("message", "No AMEA Supporter has logged in!");
        %>
                <jsp:forward page="error_403.jsp" />
        <% }
    
        String email = ameasupporter.getEmail();
        AMEASupporterDAO objectAMEASupporterDAO = new AMEASupporterDAO();
        AMEASupporter objectAMEASupporter2 = null;

        if (email != null){
            objectAMEASupporter2 = objectAMEASupporterDAO.getAmeaSupporter(email);
        }
     
        List<Education> ed = objectAMEASupporterDAO.getAMEASupportersEducation(ameasupporter.getEmail());
        List<Experience> ex = objectAMEASupporterDAO.getAMEASupportersExperience(ameasupporter.getEmail());
        %>
        <div class="container theme-showcase" role="main">    

            <div class="page-header">
                <h1><b>Edit Profile</b></h1>
            </div>
            <br><br>

            <form class="form-horizontal" method="POST" action="EditProfileController.jsp">
                <fieldset class="col-sm-6">
                    <div class="entry inline-form col-sm-8">
                        <label for="InputName" class="col-sm-1 control-label">Name</label>
                        <input type="text" name="name" class="form-control col-sm-6" id="InputName" value="<%=objectAMEASupporter2.getName() %>" readonly="readonly">
                        </div>
                        <br><br><br><br>

                        <div class="entry inline-form col-sm-8"> 
                            <label for="InputEmail" class="col-sm-1 control-label">Email</label>
                            <input type="email" name="email" class="form-control" id="InputEmail" value="<%=objectAMEASupporter2.getEmail() %>" readonly="readonly">		
                        </div>
                        <br><br><br><br>

                        <div class="entry inline-form col-sm-8"> 
                            <label for="InputBirthday" class="col-sm-1 control-label">Birthday</label>
                            <input type="date" name="birthday" class="form-control" id="InputBirthday" value="<%=objectAMEASupporter2.getBirthDate() %>" readonly="readonly">		
                        </div>
                        <br><br><br><br>

                        <% for (Education education : ed) { %>

                            <div id="Education" class="form-horizontal">
                                <div class=" dotted col-sm-8">
                                    <label for="InputTitleOfEducation" class="col-sm-1 control-label">Education</label>
                                    <input type="text" name="educ" class="form-control" id="ed" readonly="readonly" value="<%=education.getTypeOfEducation()%>">

                                    <label for="education" class="col-sm-1 control-label">TitleOfEducation</label>
                                    <input type="text" name="titleOfEd" class="form-control" id="InputTitleOfEd" readonly="readonly" value="<%=education.getTitle()%>">         
                                </div>
                            </div>
                            <br><br><br><br><br><br><br><br>
                            <% } if (ed.size() == 0){ %>  
                            <br>
                            <% } %> 
        
                            <div id="myRepeatingEducation" class="form-horizontal ">
                                <div class=" dotted entry inline-form col-sm-8">
                                    <label for="education" class="col-sm-1 control-label">Education</label>
                                    <select class="form-control col-sm-4" name="education[]" id="education">
                                        <option value="">-- Please Select Education Degree --</option>
                                        <option value="High School">High School Diploma</option>
                                        <option value="Bachelor">Bachelor Degree</option>
                                        <option value="Master">Master Degree</option>
                                        <option value="Doctorate">PhD</option>
                                        <option value="Certification">Certification</option>
                                    </select>
                                    <br><br><br><br>
                                    
                                    <label for="InputTitleOfEducation" class="col-sm-1 control-label">TitleOfEducation</label>
                                    <input type="text" name="titleOfEd[]" class="form-control" id="InputTitleOfEducation" placeholder="Title of education">
            
                                    <button type="button" class="btn btn-success btn-lg btn-add">
                                        <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
                                    </button>
                                </div>
                            </div>
                            <br><br><br><br><br><br><br><br><br><br>
        
                        <div class="entry inline-form col-sm-8">
                            <label for="InputLanguages" class="col-sm-3 control-label">Languages</label>
                            <input type="text" name="languages" class="form-control" id="Languages" value="<%=objectAMEASupporter2.getLanguages() %>" placeholder="ex. English" required>
                        </div>
                        <br><br><br><br>

                        <div class="entry inline-form col-sm-8">
                            <label for="ServiceTown" class="col-sm-3 control-label">ServiceTown</label>
                            <select class="form-control col-sm-4" name="serviceTown" id="ServiceTown" required>
                                <option value=""> --Select a town-- </option>
                                <% if (objectAMEASupporter2.getServiceTown().equals("Athens")) { %>
                                    <option value="Athens" selected>Athens</option>
                                <% } else { %>
                                    <option value="Athens">Athens</option>
                                <% } 
                                if (objectAMEASupporter2.getServiceTown().equals("Thessaloniki")) { %>
                                    <option value="Thessaloniki" selected>Thessaloniki</option>
                                <% } else { %>
                                    <option value="Thessaloniki">Thessaloniki</option>
                                <% }
                                if (objectAMEASupporter2.getServiceTown().equals("Patra")) { %>
                                    <option value="Patra"selected >Patra</option>
                                <% } else { %>
                                    <option value="Patra">Patra</option>
                                <% }
                                if (objectAMEASupporter2.getServiceTown().equals("Thessaloniki")) { %>
                                    <option value="Crete" selected>Crete</option>
                                <% } else { %>
                                    <option value="Crete">Crete</option>
                                <% } %>
                            </select>
                        </div>
                        <br><br><br><br>
        
                        <div class="entry inline-form col-sm-8">
                            <label for="InputServiceArea" class="col-sm-3 control-label">ServiceArea</label>
                            <input type="text" name="serviceArea" class="form-control" id="ServiceArea" value="<%=objectAMEASupporter2.getServiceArea() %>" placeholder="ex. Area1, Area2 etc." required>
                        </div>
                        <br><br><br><br>

                        <div class="entry inline-form col-sm-8">
                            <label for="DriversLicence" class="control-label">Driver'sLicence</label>
                            <br>
                            <div class="radio">
                                <label class="radio-inline">
                                <% if (objectAMEASupporter2.isDrivingLisence()) { %>
                                    <input type="radio" name="driversLicence" id="answer1" value="true" checked="checked" required> YES
                                <% } else { %>   
                                    <input type="radio" name="driversLicence" id="answer1" value="true" required> YES
                                <% } %>  
                                </label>
        
                                <label class="radio-inline">
                                <% if (!(objectAMEASupporter2.isDrivingLisence())) { %>
                                    <input type="radio" name="driversLicence" id="answer2" value="false" checked="checked"> NO
                                <% } else { %>
                                    <input type="radio" name="driversLicence" id="answer2" value="false"> NO   
                                <% } %>            
                                </label>
                            </div>
                        </div> 
                        <br><br><br><br>
        
                        <div class="entry inline-form col-sm-8">
                            <label for="CarOwner" class="control-label">CarOwner</label>
                            <br>
                            <div class="radio">
                                <label class="radio-inline">
                                <% if (objectAMEASupporter2.isCarOwner()) { %>
                                    <input type="radio" name="carOwner" id="answ1" value="true" checked="checked" required> YES
                                <% } else { %>
                                    <input type="radio" name="carOwner" id="answ1" value="true" required> YES
                                <% } %>   
                                </label>
        
                                <label class="radio-inline">
                                <% if (!(objectAMEASupporter2.isCarOwner())) { %>
                                    <input type="radio" name="carOwner" id="answ2" value="false" checked="checked"> NO
                                <% } else { %>
                                    <input type="radio" name="carOwner" id="answ2" value="false"> NO
                                <% } %>
                                </label>
                            </div>
                        </div>
                        <br><br><br><br>
                        
                        <div class="entry inline-form col-sm-8">
                            <label for="AvailableDays" class="col-sm-3 control-label">AvailableDays</label>
                            <select class="form-control col-sm-3" name="availableDays" id="availableDays" multiple="multiple" >
                                <% if (objectAMEASupporter2.isMonday()) { %>
                                <option value="monday" selected>Monday</option>
                                <% } else { %>
                                <option value="monday">Monday</option>
                                <% }
                                if (objectAMEASupporter2.isTuesday()) { %>
                                <option value="tuesday" selected>Tuesday</option>
                                <% } else { %>
                                <option value="tuesday">Tuesday</option>
                                <% }
                                if (objectAMEASupporter2.isWednesday()) { %>
                                <option value="wednesday" selected>Wednesday</option>
                                <% } else { %>
                                <option value="wednesday">Wednesday</option>
                                <% }
                                if (objectAMEASupporter2.isThursday()) { %>
                                <option value="thursday" selected>Thursday</option>
                                <% } else { %>
                                <option value="thursday">Thursday</option>
                                <% }
                                if (objectAMEASupporter2.isFriday()) { %>
                                <option value="friday" selected>Friday</option>
                                <% } else { %>
                                <option value="friday">Friday</option>
                                <% }
                                if (objectAMEASupporter2.isSaturday()) { %>
                                <option value="saturday" selected>Saturday</option>
                                <% } else { %>
                                <option value="saturday">Saturday</option>
                                <% }
                                if (objectAMEASupporter2.isSunday()) { %>
                                <option value="dunday" selected>Sunday</option>
                                <% } else { %>
                                <option value="dunday">Sunday</option>
                                <% } %>
                            </select>
                        </div>
                        <br><br><br><br><br><br><br>


                        <div class="entry inline-form col-sm-8">
                            <label for="AvailableNow" class="control-label">AvailableNow</label>
                            <br>
                            <div class="radio">
                                <label class="radio-inline">
                                <% if (objectAMEASupporter2.isAvailable()) { %>
                                    <input type="radio" name="availableNow" id="ans1" value="true" checked="checked" required>YES
                                <% } else { %>
                                    <input type="radio" name="availableNow" id="ans1" value="true" required>YES
                                <% } %>
                                </label>

                                <label class="radio-inline">
                                <% if (!(objectAMEASupporter2.isAvailable())) { %>
                                    <input type="radio" name="availableNow" id="ans2" value="false" checked="checked">NO
                                <% } else { %>
                                    <input type="radio" name="availableNow" id="ans2" value="false">NO
                                <% } %>
                                </label>
                            </div>
                        </div>
                        <br><br><br><br>

                </fieldset>
                
                <fieldset>
                    <div class="entry inline-form col-sm-8">
                        <label for="InputSurname" class="col-sm-3 control-label">Surname</label>
                        <input type="text" name="surname" class="form-control" id="InputSurname" value="<%=objectAMEASupporter2.getSurname() %>" readonly="readonly">
                    </div>
                    <br><br><br><br>
                
                <div class="entry inline-form col-sm-8"> 
                    <label for="InputPhone" class="col-sm-3 control-label">Phone</label>
                    <input type="tel" name="phone" class="form-control" id="InputPhone" value="<%=objectAMEASupporter2.getPhone() %>">		
                </div>
                <br><br><br><br>

                <div class="entry inline-form col-sm-8">
                    <label for="ChooseSex" class="control-label">Sex</label>
                    <br>
                        <div class="radio">
                            <label class="radio-inline">
                            <% if (objectAMEASupporter2.getSex().equals("male")) { %>
                                <input type="radio" name="sex" id="Gender1" value="male" checked="checked" required>  Male </label>
                            <% } else { %>
                                <input type="radio" name="sex" id="Gender1" value="male" required>  Male 
                            <% } %>
                            </label>
                            
                            <label class="radio-inline">
                            <% if (objectAMEASupporter2.getSex().equals("female")) { %>
                                <input type="radio" name="sex" id="Gender2" value="female" checked="checked">  Female 
                            <% } else { %> 
                                <input type="radio" name="sex" id="Gender2" value="female" >  Female 
                            <% } %>  
                            </label>
                        </div>
                </div>
                <br><br><br><br>


                <div class="entry inline-form col-sm-8">
                    <label for="Service" class="col-sm-3 control-label">Service</label>
                    <select class="form-control col-sm-3" name="service" id="service" multiple="multiple" required>
                        <% if (objectAMEASupporter2.isLearningSupportPrimarySchool()) { %>
                            <option value="learningSupportPrimarySchool" selected>Learning Support Primary School</option>
                        <% } else { %>
                            <option value="learningSupportPrimarySchool">Learning Support Primary School</option>
                        <% }
                        if (objectAMEASupporter2.isLearningSupportJuniorHighSchool()) { %>
                            <option value="learningSupportJuniorHighSchool" selected>Learning SupportJunior High School</option>
                        <% } else { %>
                            <option value="learningSupportJuniorHighSchool">Learning Support Junior High School</option>
                        <% }
                        if (objectAMEASupporter2.isLearningSupportSeniorHighSchool()) { %>
                            <option value="learningSupportSeniorHighSchool" selected>Learning Support Senior High School</option>
                        <% } else { %>
                            <option value="learningSupportSeniorHighSchool">Learning Support Senior High School</option>
                        <% }
                        if (objectAMEASupporter2.isOccupationalTherapy()) { %>
                            <option value="occupationalTherapy" selected>Occupational Therapy</option>
                        <% } else { %>
                            <option value="occupationalTherapy">Occupational Therapy</option>
                        <% }
                        if (objectAMEASupporter2.isLogotherapy()) { %>
                            <option value="logotherapy" selected>Logotherapy</option>
                        <% } else { %>
                            <option value="logotherapy">Logotherapy</option>
                        <% }
                        if (objectAMEASupporter2.isSchoolCompanion()) { %>
                            <option value="schoolCompanion" selected>School Companion</option>
                        <% } else { %>
                            <option value="schoolCompanion">School Companion</option>
                        <% }
                        if (objectAMEASupporter2.isExternalCompanion()) { %>
                            <option value="externalCompanion" selected>External Companion</option>
                        <% } else { %>
                            <option value="externalCompanion">External Companion</option>
                        <% } %>
                    </select>
                </div>
                <br><br><br><br><br><br><br>

                <div class="entry inline-form col-sm-8">
                    <label for="Disability" class="col-sm-3 control-label">Disability</label>
                    <select class="form-control col-sm-3" name="disab" id="disab" multiple="multiple" required>
                        <% if (objectAMEASupporter2.isMobilityImpaired()) { %>
                            <option value="mobilityImpaired" selected>Mobility Impaired</option>
                        <% } else { %>
                            <option value="mobilityImpaired">Mobility Impaired</option>
                        <% }

                        if (objectAMEASupporter2.isBlind()) { %>
                            <option value="blind" selected>Blind</option>
                        <% } else { %>
                            <option value="blind">Blind</option>
                        <% }

                        if (objectAMEASupporter2.isDeaf()) { %>
                        <option value="deaf" selected>Deaf</option>
                        <% } else { %>
                            <option value="deaf">Deaf</option>
                        <% } 

                        if (objectAMEASupporter2.isDyslexia()) { %>
                        <option value="dyslexia" selected>Dyslexia</option>
                        <% } else { %>
                            <option value="dyslexia">Dyslexia</option>
                        <% }

                        if (objectAMEASupporter2.isAutism()) { %>
                            <option value="autism" selected>Autism</option>
                        <% } else { %>
                            <option value="autism">Autism</option>
                        <% }
                        
                        if (objectAMEASupporter2.isEpilipsy()) { %>
                            <option value="epilipsy" selected>Epilipsy</option>
                        <% } else { %>
                            <option value="epilipsy">Epilipsy</option>
                        <% } %> 
                    </select>
                </div>
                <br><br><br><br><br><br><br>

                <% for (Experience experience : ex) { %>

                    <div id="Experience" class="form-horizontal">
                        <div class="dotted col-sm-8">
                            <label for="education" class="col-sm-1 control-label">Experience</label>
                            <input type="text" name="exp" class="form-control" id="exp" readonly="readonly" value="<%=experience.getDescription()%>">

                            <label for="InputStartDate" class="col-sm-1 control-label" id="startdate">From</label>
                            <input type="date" name="startd" class="form-control" readonly="readonly" value=<%=experience.getStartdate()%>> 
                            
                            <label for="InputEndDate" class="col-sm-1 control-label" id="enddate">Until</label>
                            <input type="date" name="endd" class="form-control" readonly="readonly" value=<%=experience.getEnddate()%>> 
                        </div>
                    </div>
                    <br><br><br><br><br><br><br><br><br><br><br>
                    <% } if (ex.size() == 0){ %>  
                    <br>
                    <% } %> 

                    <div id="myRepeatingFields" class="form-horizontal">
                        <div class="dotted entry inline-form col-sm-8">
                            <label for="InputExperience" class="col-sm-1 control-label">Experience</label>
                            <input class="form-control" name="exper[]" type="text" placeholder="Experience" />
                            <br>
                            <label for="InputStartDate" class="col-sm-1 control-label" id="startdate">From</label>
                            <input type="date" name="startd[]" class="form-control" id="datefield1"> 
                            <br>
                            <label for="InputEndDate" class="col-sm-1 control-label" id="enddate">Until</label>
                            <input type="date" name="endd[]" class="form-control" id="datefield2"> 
                          
                            <button type="button" class="btn btn-success btn-lg btn-add">
                                <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
                            </button>
                               
                        </div>
                    </div>
                    <br><br><br><br><br>

                    <div class="entry inline-form col-sm-8">
                        <label for="InputPaymentPerHour" class="col-sm-4 control-label">Payment/Hour</label>
                        <% if (!(objectAMEASupporter2.getPayPerHour()==-1.0)) { %>
                            <input type="number" step="0.5" name="payPerH" class="form-control" id="InputPaymentPerHour" value="<%=objectAMEASupporter2.getPayPerHour() %>">
                        <% } else { %>
                            <input type="number" step="0.5" name="payPerH" class="form-control" id="InputPaymentPerHour" placeholder="0.0">
                        <% } %>
                    </div> 
                    <br><br><br><br><br><br><br><br><br><br><br>

                </fieldset>
                <br><br><br><br>

                <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
                <script src="https://code.jquery.com/jquery-1.12.4.min.js"
                    integrity="sha384-nvAa0+6Qg9clwYCGGPpDQLVpLNn0fRaROjHqs13t4Ggj3Ez50XnGQqc/r8MhnRDZ"
                    crossorigin="anonymous">
                </script>

                <script>
                    $(function () {
                        $('#myRepeatingEducation').on('click', '.btn-add', function (e) {
                            e.preventDefault();
                            var controlForm = $('#myRepeatingEducation:first'),
                                currentEntry = $(this).parents('.entry:first'),
                                newEntry = $(currentEntry.clone()).appendTo(controlForm);
                            newEntry.find('input').val('');
                            controlForm.find('.entry:not(:first) .btn-add')
                                .removeClass('btn-add').addClass('btn-remove')
                                .removeClass('btn-success').addClass('btn-danger')
                                .removeClass('glyphicon glyphicon-plus').addClass('glyphicon glyphicon-minus')
                                .html('');
                        }).on('click', '.btn-remove', function (e) {
                            e.preventDefault();
                            $(this).parents('.entry:first').remove();
                            return false;
                        });
                    });

                    $(function () {
                        $('#myRepeatingFields').on('click', '.btn-add', function (e) {
                            e.preventDefault();
                            var controlForm = $('#myRepeatingFields:first'),
                                currentEntry = $(this).parents('.entry:first'),
                                newEntry = $(currentEntry.clone()).appendTo(controlForm);
                            newEntry.find('input').val('');
                            controlForm.find('.entry:not(:first) .btn-add')
                                .removeClass('btn-add').addClass('btn-remove')
                                .removeClass('btn-success').addClass('btn-danger')
                                .removeClass('glyphicon glyphicon-plus').addClass('glyphicon glyphicon-minus')
                                .html('');
                        }).on('click', '.btn-remove', function (e) {
                            e.preventDefault();
                            $(this).parents('.entry:first').remove();
                            return false;
                        });
                    });
                </script>   

                <script>
                    var today = new Date();
                    var dd = today.getDate();
                    var mm = today.getMonth()+1;
                    var yyyy = today.getFullYear();
                    if(dd<10){
                        dd='0'+dd
                    } 
                    if(mm<10){
                        mm='0'+mm
                    } 
                    today = yyyy+'-'+mm+'-'+dd;
                    document.getElementById("datefield1").setAttribute("max", today);
                    document.getElementById("datefield2").setAttribute("max", today);
                </script>

                <br><br><br><br>

                <div class="wrapper col-sm-12"><br><br>
                    <button type="submit" class="btn btn-success btn-lg">Save</button>
                    <button type="reset" class="btn btn-danger btn-lg">Cancel</button>
                </div>
                
                <br><br><br><br><br><br><br><br><br><br><br><br><br><br>

            </form>    
                    
        </div>
        <br><br><br><br><br><br><br>

        <%@include file="footer.jsp" %>

    </body>

</html>