<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="errorpage.jsp"%>
<%@ page import="inthistogether.*" %>

<% Customer customer=(Customer)session.getAttribute("customerObj"); %>

<% AMEASupporter ameasupporter=(AMEASupporter)session.getAttribute("ameasupporterObj"); %>

<!DOCTYPE html>
<html lang="en">
    
    <head>
    
    <%@include file="header.jsp" %>
    <meta name="author" content="t8180112@aueb.gr">
    <title>Register as Customer Controller</title>
    <link href="<%=request.getContextPath() %>/css/background.css" rel="stylesheet">

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

        <%@include file="navbar.jsp" %>

        <div class="container theme-showcase" role="main">    

<%

String name = request.getParameter("name");
String surname = request.getParameter("surname"); 
String email = request.getParameter("email"); 
String password = request.getParameter("password"); 
String confirmPassword = request.getParameter("confirm_password");
String phone = request.getParameter("phone");

// convert from ISO-8859-1 (latin) to UTF-8 so as to support Greek characters
name = new String(name.getBytes("ISO-8859-1"), "UTF-8");
surname = new String(surname.getBytes("ISO-8859-1"), "UTF-8");

// if direct access (not via form) redirect to the form page
if (name == null || surname == null || email == null || password == null || confirmPassword == null || phone == null) {
    
    response.sendRedirect("registerAsCustomer.jsp");
    return;
}


boolean phoneIsLong = Customer.isLong(phone);

if ((name.length()>=3 && surname.length()>=3 && password.length()>=5 && password.equals(confirmPassword) && (phoneIsLong) && phone.length() == 10 )) {

    Long newPhone = Long.parseLong(phone);

    if (newPhone > 0) {

        CustomerDAO custdao = new CustomerDAO();
        Customer cust = new Customer(email, newPhone, password, name, surname);
        custdao.register(cust);
        %>
        <div class="page-header">
            <h1>Registration was completed successfully!</h1>
        </div>
    
    <%
    } else {
    %>
        <div class="page-header">
            <h1>Registration form has errors</h1>
        </div>
    
        <div class="alert alert-danger col-sm-12" role="alert">
                <p><b> Phone must be a positive number </b></p>
        </div>
      
    <%            
    }
   
} else {
%>

    <div class="page-header">
        <h1>Registration form has errors</h1>
    </div>

    <div class="alert alert-danger col-sm-12" role="alert">
        <ol>
        <%
        if (name.length() <3 ) {
        %>
            <li>Name must be at least 3 characters long</li>
        <%
        }
        if (surname.length() <3 ) {
        %>
            <li> Surname must be at least 3 characters long</li>   
        <%
        }
        if (password.length() < 5) {
        %> 
            <li> Password must be at least 5 characters long</li> 
        <%
        }
        if (password.equals(confirmPassword) == false) {
        %> 
            <li> Password and confirm do not match</li> 
        <%
        }
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
        %>
        </ol>
    </div>
   
    <%
    }
    %>        

        </div>
        <br><br><br><br><br><br><br><br><br><br>

    <%@include file="footer.jsp" %>

    </body>

</html>