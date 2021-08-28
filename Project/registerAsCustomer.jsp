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
    <title>Register as Customer</title>
    <link href="<%=request.getContextPath() %>/css/background.css" rel="stylesheet">

    <style>
        h1 {
            text-align:center;
        }
        form {
            width: 50%;
            border-radius: 2px;
            padding: 20px;
            margin: 0 auto;
        }
        .wrapper {
            text-align: center;
        }
        label {
            font-size: 16px;
        }
        .inpt {
            width: 100%;
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
            
            request.setAttribute("message", "A customer has already logged in!");
        %>
                <jsp:forward page="error_403.jsp" />
        <% } else if(session.getAttribute("ameasupporterObj") !=null) { 
                 
            request.setAttribute("message", "An ameaSupporter has already logged in! Sign out to register!");
        %>
                <jsp:forward page="error_403.jsp" />
        <% } %>

        <div class="container theme-showcase" role="main">    

            <div class="page-header">
                <h1><b>Register As Customer</b></h1>
            </div>  
            
            <form class="form-horizontal" method="POST" action="registerAsCustomerController.jsp">
                <div class="form-group">
                    <label for="InputName" class="col-sm-2 control-label required">Name</label>
                    <div class="col-sm-7">	
                        <input type="text" name="name" class="form-control id="InputName" placeholder="Name" required>
                    </div>
                </div>

                <div class="form-group">
                    <label for="InputSurname" class="col-sm-2 control-label required">Surname</label>
                    <div class="col-sm-7">
                        <input type="text" name="surname" class="form-control" id="InputSurname" placeholder="Surname" required>
                    </div>
                </div>

                <div class="form-group">
                    <label for="InputEmail" class="col-sm-2 control-label required">Email</label>
                    <div class="col-sm-7">
                        <input type="email" name="email" class="form-control" id="InputEmail" placeholder="Email" required>
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="InputPassword" class="col-sm-2 control-label required">Password</label>
                    <div class="col-sm-7">
                        <input type="password" name="password" class="form-control" id="InputPassword" placeholder="Password" required>
                    </div>
                </div>

                <div class="form-group">
                    <label for="InputConfirmPassword" class="col-sm-2 control-label required">Confirm</label>
                    <div class="col-sm-7">
                        <input type="password" name="confirm_password" class="form-control" id="InputConfirmPassword" placeholder="Confirm your Password" required>
                    </div>
                </div>

                <div class="form-group">
                    <label for="InputPhone" class="col-sm-2 control-label required">Phone</label>
                    <div class="col-sm-7">
                        <input type="tel" name="phone" class="form-control" id="InputPhone" placeholder="Phone" required>
                    </div>
                </div>
                <br>

                <div class="wrapper">
                    <p><b>By creating an account you agree to our <a href="#">Terms & Privacy</a>.</b></p><br>
                    <button type="submit" class="btn btn-success btn-lg">Register</button>
                    <button type="reset" class="btn btn-danger btn-lg">Cancel</button>
                </div>
                

            </form>
            <br><br><br>

            
                    
        </div>
        <br><br><br><br><br>

        <%@include file="footer.jsp" %>

    </body>

</html>