<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="errorpage.jsp"%>

<!doctype html>
<html lang="en">
    
    <head>
    <%@include file="header.jsp" %>
    <meta name="author" content="t8180131@aueb.gr">
    <title>Login as Amea Supporter</title>
    <link href="<%=request.getContextPath() %>/css/background.css" rel="stylesheet">
    

    <style>
        .entry:not(:first-of-type) {
            margin-top: 10px;
        }
        .glyphicon {
            font-size: 12px;
        }
        .required:after {
            content:"*";
            color: red;
        }
        label {
            font-size: 16px;
        }
        h1 {
            text-align:center;
        }
        .wrapper {
            text-align: center;
        }
        form {
            width: 50%;
            border-radius: 2px;
            padding: 20px;
            margin: 0 auto;
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
                <h1><b>Log In As AMEA Supporter</b></h1>
            </div>
            <% if(request.getAttribute("message") != null) { %>		
                <div class="alert alert-danger text-center" role="alert"><%=(String)request.getAttribute("message") %></div>
            <% } %>
            <form class="form-horizontal" method="post" action="loginAsAmeaSupporterController.jsp">
                
                <div class="form-group">
                    <label for="InputEmail" class="col-sm-2 control-label required">Email</label>
                    <div class="col-sm-8">
                        <input type="email" name="email" class="form-control" id="InputEmail" placeholder="Email" required>
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="InputPassword" class="col-sm-2 control-label required">Password</label>
                    <div class="col-sm-8">
                        <input type="password" name="password" class="form-control" id="InputPassword" placeholder="Password" required>
                    </div>
                </div>
                <br><br>

                <div class="wrapper">
                    <button type="submit" class="btn btn-success btn-lg">Log in</button>
                </div>

                <br><br>
                <hr>
                <div class="wrapper"> 
                    <label for="SignUpText" >Not registered yet? <a href="registerAsAmeaSupporter.jsp">Register Now</a></label>
                </div>

                <br><br><br><br><br>

            </form>
                    
        </div>

        <br> <br><br> <br><br> <br>
        <br> <br> 
        <%@include file="footer.jsp" %>
        
    </body>

</html>