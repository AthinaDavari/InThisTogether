<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="errorpage.jsp"%>

<!doctype html>
<html lang="en">
    
    <head>
    <%@include file="header.jsp" %>
    <meta name="author" content="t8180131@aueb.gr">
    <title>Login as Customer</title>
    <link href="<%=request.getContextPath() %>/css/background.css" rel="stylesheet">

    <style>

       .entry:not(:first-of-type) {
            margin-top: 10px;
        }

        .glyphicon {
            font-size: 12px;
        }

        .required:after {
            content:" *";
            color: red;
        }
    </style>

    </head>

    <body>
        
        <%@include file="simplenavbar.jsp" %>

        <% if(session.getAttribute("customerObj") !=null){ 
            
            request.setAttribute("message", "A customer has already logged in! Sign out to log in again!");
        %>
                <jsp:forward page="error_403.jsp" />
        <% } else if(session.getAttribute("ameasupporterObj") !=null) { 
                 
            request.setAttribute("message", "An ameaSupporter has already logged in! Sign out to log in again!");
        %>
                <jsp:forward page="error_403.jsp" />
        <% } %>

        <div class="container theme-showcase" role="main">    

            <div class="page-header">
                <h1><b>Log In As Customer</b></h1>
            </div>
            <% if(request.getAttribute("message") != null) { %>		
                <div class="alert alert-danger text-center" role="alert"><%=(String)request.getAttribute("message") %></div>
            <% } %>
            <form class="form-inline" method="post" action="loginAsCustomerController.jsp">
                
                <div class="form-group col-sm-9"> 
                    <label for="InputEmail" class="col-sm-3 control-label required">Email</label>
                    <input type="email" name="email" class="form-control" id="InputEmail" placeholder="example@gmail.com" required>		
                </div>
                <br> <br> <br>
                <div class="form-group col-sm-9"> 
                    <label for="InputPassword" class="col-sm-3 control-label required">Password</label>
                    <input type="password" name="password" class="form-control" id="InputPassword" placeholder="Password" minlength="5" required>		
                </div>
                <br><br><br>

                <div class="col-sm-offset-3 col-sm-9">
                    <button type="submit" class="btn btn-success btn-lg">Log in</button>
                </div>

                <br><br><br><br><br>
                <hr>
                <div class="col-sm-offset-4 col-sm-8"> 
                    <label for="SignUpText" >Not registered yet? <a href="registerAsCustomer.jsp">Register Now</a></label>
                </div>

                <br><br><br><br><br>

            </form>
                    
        </div>

        <br> <br><br> <br><br> <br>
        <br> <br> <br>

        <%@include file="footer.jsp" %>

        
    </body>

</html>