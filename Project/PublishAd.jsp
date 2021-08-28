<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page errorPage="errorpage.jsp"%>
<%@ page import="inthistogether.*" %>

<%
if (session.getAttribute("customerObj") == null) {

	request.setAttribute("message", "You are not authorized to access this resource. Please login.");
%>
	<jsp:forward page="loginAsCustomer.jsp" />
<%
}
Customer customer = (Customer)session.getAttribute("customerObj");
%>

<%
AMEASupporter ameasupporter = (AMEASupporter)session.getAttribute("ameasupporterObj");
%>

<!doctype html>
<html lang="en">
    
    <%@include file="header.jsp" %>
    <meta name="author" content="t8180112@aueb.gr">
    <title>Publish Ad</title>
    <style>
        body {
          background-image: url('<%=request.getContextPath() %>/images/help.jpg');
          background-repeat: no-repeat;
          background-attachment: fixed;
          background-size: cover;
        }
    </style>

    </head>

    <body>
        <%@ include file="navbar.jsp" %>

        <div class="container theme-showcase" role="main">    

            <div class="page-header">
                <h1><b>Publish Ad</b></h1>
            </div>

            <form class="form-horizontal" method="POST" action="PublishAdController.jsp">

                <div class="text">
                    <p><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span><b> What type of service do you need?</b></p>
                </div>
                <br>
                <div class="form-group col-sm-9"> 
                    <input type="text" name="service" required class="form-control" id="InputDisabilityService" placeholder="Write the service that you are looking for, ex.Logotherapy, External Companion etc.">
                </div>
                <br><br><br>

                <div class="text">
                    <p><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span><b> What type of disability are you looking help for?</b></p>
                </div>
                <br>
                <div class="form-group col-sm-9"> 
                    <input type="text" name="disability" required class="form-control" id="InputDisabilityService" placeholder="Write the disability in which you need help, ex.Mobility Impaired.">
                </div>
                <br><br><br>
                

                <div class="text">
                    <p><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span><b> Choose the date you will need help. </b></p>
                </div>
                <br> 

                
                
                
                <div class="form-inline col-sm-2">
                    <label for="StartDate" class="col-sm-3" id="startdate">StartDate</label>
                    <input type="date" name="startdate" required class="form-control" id="datefield1"> 
                </div>
                <br><br><br><br>

                <div class="form-inline col-sm-2">
                    <label for="EndDate" class="col-sm-3" id="enddate">EndDate</label>
                    <input type="date" name="enddate" required min="datefield1" class="form-control" id="datefield2"> 
                </div>
                
                <br><br><br><br>

                <div class="text">
                    <p><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span><b> Write your location. </b></p>
                </div>
                <br>
                <div class="form-group col-sm-9"> 
                    <input type="text" name="location" required class="form-control" id="InputLocation" placeholder="Ex. Athens, Agios Eleutherios, Central Attiki">
                </div>
                <br><br><br>

                <div class="text">
                    <p><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span><b> Write a job description. </b></p>
                </div>
                <br>
                <div class="form-group col-sm-9">
                    <textarea class="form-control" name="description" required rows="4" placeholder="Write the service you need, the employee's qualifications, skills and characteristics and any other details about the job."></textarea>
                </div>
                <br><br><br><br><br><br><br>
                
                <div class="col-sm-offset-2 col-sm-10">
                    <p><b>By creating an ad you agree to our <a href="TermsAndPolicies.jsp">Terms & Privacy</a>.</b></p><br>
                </div>

                <div class="col-sm-offset-3 col-sm-9">
                    <button type="submit" class="btn btn-success btn-lg">Publish</button>
					<button type="reset" class="btn btn-danger btn-lg">Clear</button>
                </div>
                
            </form>
                    
        </div>
        <br><br><br><br><br><br><br><br><br><br><br><br>

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
            document.getElementById("datefield1").setAttribute("min", today);
        </script>

        <script>
            document.getElementById("datefield1").onchange = function () {
                var input = document.getElementById("datefield2");
                input.setAttribute("min", this.value);
            }
        </script>

        <%@include file="footer.jsp" %>

    </body>

</html>