<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="error_403.jsp"%>
<%@ page import="inthistogether.*" %>

<%
Customer customer = (Customer)session.getAttribute("customerObj");
%>

<%
AMEASupporter ameasupporter = (AMEASupporter)session.getAttribute("ameasupporterObj");
%>

<!doctype html>
<html lang="en">
    
    <head>
    <%@include file="header.jsp" %>
    <meta name="author" content="t8180131@aueb.gr">
    <title>Home</title>

    <style>

body {
          background-image: url('<%=request.getContextPath() %>/images/handstogether.png');
          background-repeat: no-repeat;
          background-attachment: fixed;
          background-size: cover;
        }

/* When the screen is less than 600px wide, stack the links and the search field vertically instead of horizontally */
@media screen and (max-width: 600px) {
  .topnav a, .topnav input[type=text] {
    float: none;
    display: block;
    text-align: left;
    width: 100%;
    margin: 0;
    padding: 14px;
  }
  .topnav input[type=text] {
    border: 1px solid #ccc;
  }
}

* {
  box-sizing: border-box;
}

.column {
  float: left;
  width: 25%;
  padding: 5px;
}

/* Clearfix (clear floats) */
.row::after {
  content: "";
  clear: both;
  display: table;
}
</style>

</head>

<body>
    <%@include file="navbar.jsp" %>

    <div class="form-group "> 
        <p class="col-sm-5 control-label" style="text-align:right; ">
            <h1>What we do </h1>
            We help those who are in need find the perfect supporter for their everyday lives. 
            We 've created a website where people with mental or physical disabilities and their relatives 
            can search or publish an ad for a candidate who will help them with their day to day activities!
        </p>	
    </div>

    <div class="container theme-showcase" role="main">  
        <h1><b>About us</b></h1>
        <hr>    
            
        <form class="form-inline">
            
                <div class="form-group "> 
                    <p class="col-sm-5 control-label" style="text-align:right; ">
                        <h1>What we do </h1>
                        We help those who are in need find the perfect supporter for their everyday lives. 
                        We 've created a website where people with mental or physical disabilities and their relatives 
                        can search or publish an ad for a candidate who will help them with their day to day activities!
                    </p>	
                </div>
                <br> <br> <br>
                <div class="form-group "> 
                    <p class="col-sm-5 control-label ">
                    <h1>Our vision </h1>
                    To remind people that they don't have to fight alone. Everyone needs someone by their side!We are all InThisTogether!
                    </p>
                </div>
                <br><br><br>

        </form>
    
          
       
    </div>
        </div>
    

    </div>
    <br> <br><br> <br><br> <br>
    <br> <br> <br>
    <%@include file="footer.jsp" %>
    
    </script>

</body>


</html>