<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page errorPage="errorpage.jsp" %>
<%@ page import="inthistogether.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.lang.Math" %>

<% Customer customer=(Customer)session.getAttribute("customerObj"); %>

<% AMEASupporter ameasupporter=(AMEASupporter)session.getAttribute("ameasupporterObj"); %>

<!DOCTYPE html>
<html lang="en">

<head>

    <%@include file="header.jsp" %>
        <meta name="author" content="t8180020@aueb.gr">
        <title>AMEA Supporters</title>
        <link href="<%=request.getContextPath() %>/css/background.css" rel="stylesheet">

</head>

<body>

    <%@ include file="navbar.jsp" %>

        <div class="container">

            <h1 style="text-align: center;"><i>AMEA Supporters' Profiles</i></h1>

            <br><br>
            <% AMEASupporterDAO ameasupporterdao=new AMEASupporterDAO(); List<AMEASupporter> ameasupporters =
                ameasupporterdao.getAmeaSupporters();

                int numberOfSupporters = 0;

                for (AMEASupporter ameasup : ameasupporters){
                numberOfSupporters++;

                StringBuilder service = new StringBuilder(); 
                if (ameasup.isLearningSupportPrimarySchool() == true){
                    service.append("Learning Support Primary School, "); 
                }
                if (ameasup.isLearningSupportJuniorHighSchool() == true){
                    service.append("Learning Support Junior High School, "); 
                }
                if (ameasup.isLearningSupportSeniorHighSchool() == true){
                    service.append("Learning Support Senior High School, "); 
                }
                if (ameasup.isOccupationalTherapy() == true){
                    service.append("Occupational Therapy, "); 
                }
                if (ameasup.isLogotherapy() == true){
                    service.append("Logotherapy, "); 
                }
                if (ameasup.isSchoolCompanion() == true){
                    service.append("School Companion, "); 
                }
                if (ameasup.isExternalCompanion() == true){
                    service.append("External Companion, "); 
                }

                int len = service.length();
                service.delete(len-2, len-1);
                
                StringBuilder disability =new StringBuilder();  

                if (ameasup.isDeaf() == true){
                    disability.append("Deaf, "); 
                }

                if (ameasup.isDyslexia() == true){
                    disability.append("Dyslexia, "); 
                }

                if (ameasup.isEpilipsy() == true){
                    disability.append("Epilipsy, "); 
                }

                if (ameasup.isAutism() == true){
                    disability.append("Autism, "); 
                }

                if (ameasup.isBlind() == true){
                    disability.append("Blind, "); 
                }

                if (ameasup.isMobilityImpaired() == true){
                    disability.append("Mobility Impaired, "); 
                }

                if (ameasup.isDown() == true){
                    disability.append("Down, "); 
                }

                len = disability.length();
                disability.delete(len-2, len-1);
                
                if(numberOfSupporters==1){
                %>
                <div id="1" style="display: block;">

                    <% }else if(numberOfSupporters%9==1){ int id=((numberOfSupporters-1)/9)+1; %>
                        <div id=<%=id %> style="display: none;">
                            <% } if(numberOfSupporters%3==1){ %>
                                <div class="row">
                                    <% } %>
                                        <div class="col-md-4">
                                            <div class="panel panel-default">
                                                <div class="panel-heading">
                                                    <h3 class="panel-title">
                                                        <%=ameasup.getName()%>
                                                            <%=ameasup.getSurname()%>
                                                    </h3>
                                                </div>
                                                <div class="panel-body">
                                                    <p class="card-text">Service : <%=service%></p>
                                                    <p class="card-text">Disability : <%=disability%></p>
                                                    <p class="card-text">Service Area: <%= ameasup.getServiceArea() %>
                                                    </p>
                                                    <p class="card-text">Languages: <%= ameasup.getLanguages() %>
                                                    </p>
                                                    <a href="showspecificprofile.jsp?email=<%= ameasup.getEmail() %>"
                                                        class="btn btn-primary"><i class="fas fa-user"></i>
                                                        See
                                                        profile</a>
                                                </div>
                                            </div>
                                        </div>

                                        <% if(numberOfSupporters%3==0){ %>
                                </div>
                                <% } if(numberOfSupporters%9==0){ %>
                        </div>
                        <% } } if(numberOfSupporters%3!=0){ %>
                </div>
                <% } if(numberOfSupporters%9!=0){ %>
        </div>
        <% } double pages=Math.ceil(numberOfSupporters/9.0); if(pages!=1){ %>
            <div class="text-center">
                <nav aria-label="Page navigation example">
                    <ul class="pagination">

                        <% for (int i=1; i <=pages; i++) { %>
                            <li class="page-item" onclick="myFunction(<%=i%>,<%= pages%>)"><a class="page-link"
                                    href="#">
                                    <%= i%>
                                </a></li>
                            <% } %>
                    </ul>
                </nav>
            </div>

            <% } %>

                <!-- container ends here -->
                </div>

                <script>
        function myFunction(id,pages) {
            for (var r = 1; r <= pages; r++) {
                var x = document.getElementById(r);
                if (x.style.display === 'block' && r != id) {
                    x.style.display = 'none';
                }
                if (x.style.display === 'none' && r == id) {
                    x.style.display = 'block';

                }

            }
        }
    </script>

                <br> <br> <br> <br> <br> <br>
                <%@include file="footer.jsp" %>

</body>

</html>