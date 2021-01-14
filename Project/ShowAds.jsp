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
        <meta name="author" content="t8180020@aueb.gr">

        <%@ include file="header.jsp" %>
        <link href="<%=request.getContextPath() %>/css/background.css" rel="stylesheet">

            <title>AMEA Ads</title>

            <Style>
                .panel-body {
                    background: #FFCCFF;
                }
            </Style>

    </head>

    <body>

        <%@ include file="navbar.jsp" %>

        <div class="container">

            <h1 style="text-align: center;"><i>AMEA Ads</i></h1>

            <br><br>

            <% AdDAO addao=new AdDAO(); 

               List<AdView> ads = addao.getAds();

               int numberOfAds = 0;

               for (AdView adview : ads){
                   numberOfAds++;
                   if(numberOfAds==1){
                       %>
                       <div id="1" style="display: block;">
                        
                        <%
                   }else if(numberOfAds%9==1){
                       int id=((numberOfAds-1)/9)+1;
                       %>
                    <div id=<%=id %> style="display: none;">
                       <%
                    }
                   if(numberOfAds%3==1){
                %>
                <div class="row">
                    <%
                }
                    %>
                    <div class="col-md-4">
                        <div class="panel panel-default">
                            <div class="panel-body">
                                <li class="list-group-item">
                                    <p class="card-text">Posted by: <%=adview.getName()%>
                                            <%=adview.getSurname()%>
                                    </p>
                                    <p class="card-text">Email: <%=adview.getCustomerEmail()%>
                                    </p>
                                    <p class="card-text">Phone: <%=adview.getPhone()%>
                                    </p>
                                </li>
                                <li class="list-group-item">
                                    <p class="card-text">Start Date: <%=adview.getStartDate()%>
                                    </p>
                                    <p class="card-text">End Date: <%=adview.getEndDate()%>
                                    </p>
                                </li>
                                <li class="list-group-item">
                                    <p class="card-text">Service : <%=adview.getService()%>
                                    </p>
                                    <p class="card-text">Disability : <%=adview.getDisabity()%>
                                    </p>
                                </li>
                                <li class="list-group-item">
                                    <p class="card-text">Location : <%=adview.getLocation()%>
                                    </p>
                                    <p class="card-text">Description :
                                        <%=adview.getDescription()%>
                                    </p>
                                </li>
                            </div>
                        </div>
                    </div>

                <%
                if(numberOfAds%3==0){
                    %>
                </div>
                        <%
                    }
                    if(numberOfAds%9==0){
                        %>
                    </div>
                <% } }
                
                if(numberOfAds%3!=0){
                    %>
                </div>
                        <%
                    }
                    if(numberOfAds%9!=0){
                %>
            </div>
            <%
        }
        double pages = Math.ceil(numberOfAds/9.0);
        

        if(pages!=1){
            %>
        <div class="text-center">
            <nav aria-label="Page navigation example">
                <ul class="pagination">

                    <%
                    for (int i = 1; i <= pages; i++) {
                        %>
                    <li class="page-item" onclick="myFunction(<%=i%>,<%= pages%>)"><a class="page-link" href="#"><%= i%></a></li>           
            <%
            }
            %>
                 </ul>
            </nav>
        </div>

        <%
    }
    %>
                    <!-- container ends here -->
        </div>

        <br> <br> <br> <br> <br> <br>

        <%@ include file="footer.jsp" %>

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

    </html>