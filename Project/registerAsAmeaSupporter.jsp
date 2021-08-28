<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="errorpage.jsp"%>
<%@ page import="inthistogether.*" %>

<% Customer customer=(Customer)session.getAttribute("customerObj"); %>

<% AMEASupporter ameasupporter=(AMEASupporter)session.getAttribute("ameasupporterObj"); %>

<!doctype html>
<html lang="en">
    
    <head>
    <%@include file="header.jsp" %>
    <meta name="author" content="t8180112@aueb.gr">
    <title>Register as Amea Supporter</title>
    <link href="<%=request.getContextPath() %>/css/background.css" rel="stylesheet">

    <style>
        h1 {
            text-align:center;
        }
        fieldset {
            border-radius: 5px;
            /* background-color:#c6b0c8; */
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
        .required:after {
            content:"*";
            color: red;
        }

    </style>
    </head>

    <body>

        <%@include file="navbar.jsp" %>
        <% if(session.getAttribute("customerObj") !=null){ 
            
            request.setAttribute("message", "A customer has already logged in! Sign out to register!");
        %>
                <jsp:forward page="error_403.jsp" />
        <% } else if(session.getAttribute("ameasupporterObj") !=null) { 
                 
            request.setAttribute("message", "An ameaSupporter has already logged in!");
        %>
                <jsp:forward page="error_403.jsp" />
        <% } %>


        <div class="container theme-showcase" role="main">    

            <div class="page-header">
                <h1><b>Register As AMEA Supporter</b></h1>
            </div>

            <form class="form-horizontal" method="POST" action="registerAsAmeaSupporterController.jsp">
                
                <fieldset class="col-sm-6">
                    <div class="entry inline-form col-sm-8">
                        <label for="InputName" class="col-sm-1 control-label required">Name</label>
                        <input type="text" name="name" class="form-control col-sm-6" id="InputName" placeholder="Name" required>
                        </div>
                        <br><br><br><br>

                        <div class="entry inline-form col-sm-8"> 
                            <label for="InputEmail" class="col-sm-1 control-label required">Email</label>
                            <input type="email" name="email" class="form-control" id="InputEmail" placeholder="example@gmail.com" required>		
                        </div>
                        <br><br><br><br>

                        <div class="entry inline-form col-sm-8"> 
                            <label for="InputPassword" class="col-sm-1 control-label required">Password</label>
                            <input type="password" name="password" class="form-control" id="InputPassword" placeholder="Password" required>	
                            <input type="checkbox" onclick="myPassword()">show password	
                        </div>
                        <br><br><br><br><br>

                        <div class="entry inline-form col-sm-8"> 
                            <label for="InputBirthday" class="col-sm-1 control-label required">Birthday</label>
                            <input type="date" name="birthday" class="form-control" id="InputBirthday" required>		
                        </div>
                        <br><br><br><br>


                        <div id="myRepeatingEducation" class="form-horizontal ">
                            <div class=" dotted entry inline-form col-sm-8">
                                <label for="education" class="col-sm-1 control-label">Education</label>
                                <select class="form-control col-sm-4" name="education[]" id="education" >
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
                        <br><br><br><br>
        
                        <div class="entry inline-form col-sm-8">
                            <label for="InputLanguages" class="col-sm-3 control-label required">Languages</label>
                            <input type="text" name="languages" class="form-control" id="Languages" placeholder="Language1, language2 etc." required>
                        </div>
                        <br><br><br><br>

                        
                        <div class="entry inline-form col-sm-8">
                            <label for="ServiceTown" class="col-sm-3 control-label required">ServiceTown</label>
                            <select class="form-control col-sm-4" name="serviceTown" id="ServiceTown" required>
                                <option hidden disabled selected value> --Select a town-- </option>
                                <option value="Athens">Athens</option>
                                <option value="Thessaloniki">Thessaloniki</option>
                                <option value="Patra">Patra</option>
                                <option value="Crete">Crete</option>
                            </select>
                        </div>
                        <br><br><br><br>
        
                        
                        <div class="entry inline-form col-sm-8">
                            <label for="InputServiceArea" class="col-sm-3 control-label required">ServiceArea</label>
                            <input type="text" name="serviceArea" class="form-control" id="ServiceArea" placeholder="Area1, area2 etc." required>
                        </div>
                        <br><br><br><br>

                        <div class="entry inline-form col-sm-8">
                            <label for="DriversLicence" class="control-label required">Driver'sLicence</label>
                            <br>
                            <div class="radio">
                                <label class="radio-inline">
                                    <input type="radio" name="driversLicence" id="answer1" value="true" required> YES
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="driversLicence" id="answer2" value="false"> NO
                                </label>
                            </div>
                        </div> 
                        <br><br><br><br>
        
                        <div class="entry inline-form col-sm-8">
                            <label for="CarOwner" class="control-label required">CarOwner</label>
                            <br>
                            <div class="radio">
                                <label class="radio-inline">
                                    <input type="radio" name="carOwner" id="answ1" value="true" required> YES
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="carOwner" id="answ2" value="false"> NO
                                </label>
                            </div>
                        </div>
                        <br><br><br><br>


                        <div class="entry inline-form col-sm-8">
                            <label for="AvailableDays" class="col-sm-3 control-label">AvailableDays</label>
                            <select class="form-control col-sm-3" name="availableDays" id="availableDays" multiple="multiple">
                                <option value="monday">Monday</option>
                                <option value="tuesday">Tuesday</option>
                                <option value="wednesday">Wednesday</option>
                                <option value="thursday">Thursday</option>
                                <option value="friday">Friday</option>
                                <option value="saturday">Saturday</option>
                                <option value="dunday">Sunday</option>
                            </select>
                        </div>
                        <br><br><br><br><br><br><br>


                        <div class="entry inline-form col-sm-8">
                            <label for="AvailableNow" class="control-label required">AvailableNow</label>
                            <br>
                            <div class="radio">
                                <label class="radio-inline">
                                    <input type="radio" name="availableNow" id="ans1" value="true" required>YES
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="availableNow" id="ans2" value="false">NO
                                </label>
                            </div>
                        </div>
                        
                        <br><br><br><br>

                </fieldset>
                
                <fieldset>
                    <div class="entry inline-form col-sm-8">
                        <label for="InputSurname" class="col-sm-3 control-label required">Surname</label>
                        <input type="text" name="surname" class="form-control" id="InputSurname" placeholder="Surname" required>
                    </div>
                    <br><br><br><br>
                
                <div class="entry inline-form col-sm-8"> 
                    <label for="InputPhone" class="col-sm-3 control-label required">Phone</label>
                    <input type="tel" name="phone" class="form-control" id="InputPhone" placeholder="XXXXXXXXXX" required>		
                </div>
                <br><br><br><br>
     
                <div class="entry inline-form col-sm-8"> 
                    <label for="InputConfirmPassword" class="col-sm-3 control-label required">Confirm</label>
                    <input type="password" name="confirm-password" class="form-control" id="InputConfirmPassword" placeholder="Confirm Password" required>
                    <input type="checkbox" onclick="myConfirmPassword()">show confirm password		
                </div>
                <br><br><br><br><br>

                <div class="entry inline-form col-sm-8">
                    <label for="ChooseSex" class="control-label required">Sex</label>
                    <br>
                        <div class="radio">
                            <label class="radio-inline">
                                <input type="radio" name="sex" id="Gender1" value="male" required>  Male </label>
                            <label class="radio-inline">
                                <input type="radio" name="sex" id="Gender2" value="female">  Female </label>
                        </div>
                </div>
                <br><br><br><br>


                <div class="entry inline-form col-sm-8">
                    <label for="Service" class="col-sm-3 control-label required">Service</label>
                    <select class="form-control col-sm-3" name="service" id="service" multiple="multiple" required>
                        <option value="learningSupportPrimarySchool">Learning Support Primary School</option>
                        <option value="learningSupportJuniorHighSchool">Learning SupportJunior High School</option>
                        <option value="learningSupportSeniorHighSchool">Learning Support Senior High School</option>
                        <option value="occupationalTherapy">Occupational Therapy</option>
                        <option value="logotherapy">Logotherapy</option>
                        <option value="schoolCompanion">School Companion</option>
                        <option value="externalCompanion">External Companion</option>
                    </select>
                </div>
                <br><br><br><br><br><br><br>


                <div class="entry inline-form col-sm-8">
                    <label for="Disability" class="col-sm-3 control-label required">Disability</label>
                    <select class="form-control col-sm-3" name="disab" id="disab" multiple="multiple" required>
                        <option value="mobilityImpaired">Mobility Impaired</option>
                        <option value="blind">Blind</option>
                        <option value="deaf">Deaf</option>
                        <option value="dyslexia">Dyslexia</option>
                        <option value="autism">Autism</option>
                        <option value="epilipsy">Epilipsy</option>
                    </select>
                </div>
                <br><br><br><br><br><br><br>

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
                <br><br><br><br>

                <div class="entry inline-form col-sm-8">
                    <label for="InputPaymentPerHour" class="col-sm-4 control-label">Payment/Hour</label>
                    <input type="number" step="0.5" name="payPerH" class="form-control" id="InputPaymentPerHour" placeholder="0.00">
                </div> 

                </fieldset>

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
                    document.getElementById("InputBirthday").setAttribute("max", today);
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
                </script>

                <script>
                    function myPassword() {
                        var x = document.getElementById("InputPassword");
                        if (x.type === "password") {
                            x.type = "text";
                        } else {
                            x.type = "password";
                        }
                    }
                    </script>

                <script>
                    function myConfirmPassword() {
                        var x = document.getElementById("InputConfirmPassword");
                        if (x.type === "password") {
                            x.type = "text";
                        } else {
                            x.type = "password";
                        }
                    }
                    </script>
                
                <br><br><br><br>
                

                <div class="wrapper col-sm-12">
                    <p><b>By creating an account you agree to our <a href="#">Terms & Privacy</a>.</b></p><br>
                    <button type="submit" class="btn btn-success btn-lg">Register</button>
                    <button type="reset" class="btn btn-danger btn-lg">Cancel</button>
                </div>
                <br><br><br><br><br><br><br><br><br><br><br><br>

            </form>     
                    
        </div>
        <br><br><br><br><br><br><br>

        <%@include file="footer.jsp" %>

    </body>

</html>
