<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.sql.Date" %>
<%@ page errorPage="errorpage.jsp"%>
<%@ page import="inthistogether.*" %>

<%
Customer customer = (Customer)session.getAttribute("customerObj");
%>

<%
AMEASupporter ameasupporter = (AMEASupporter)session.getAttribute("ameasupporterObj");
%>
<DOCTYPE html>
<html lang="en">
    <head>
        <%@include file="header.jsp" %>
        <meta name="author" content="t8180146@aueb.gr">

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

            <% 
            String service=request.getParameter("service");
            String disability=request.getParameter("disability");
            String startdate=request.getParameter("startdate");
            String enddate=request.getParameter("enddate");  
            String location=request.getParameter("location");
            String description=request.getParameter("description"); 
            Date start=java.sql.Date.valueOf(startdate);
            Date end=java.sql.Date.valueOf(enddate);
            
            AdDAO objectAdDAO=new AdDAO();
            Ad objectAd = new Ad(customer.getEmail(), start, end, service, disability, description, location);
            objectAdDAO.insertAd(objectAd);
            
            %>
            <div class="page-header">
                <h1>Ad has been published successfully!</h1>
            </div>

            <br><br><br><br>

        </div>

        <%@include file="footer.jsp" %>

    </body>
</html>