<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="errorpage.jsp"%>
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
    <title>Terms and policies</title>
    <link href="<%=request.getContextPath() %>/css/background.css" rel="stylesheet">

    <style>

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






* {box-sizing: border-box;}

.mySlides {display: none;}
img {vertical-align: middle;}

/* Slideshow container */
.slideshow-container {
  max-width: 100%;
  position: relative;
  margin: auto;
}

/* Caption text */
.text {
  color: #f2f2f2;
  font-size: 15px;
  padding: 8px 12px;
  position: absolute;
  bottom: 8px;
  width: 100%;
  text-align: center;
}

/* Number text (1/3 etc) */
.numbertext {
  color: #f2f2f2;
  font-size: 12px;
  padding: 8px 12px;
  position: absolute;
  top: 0;
}

/* The dots/bullets/indicators */
.dot {
  height: 15px;
  width: 15px;
  margin: 0 2px;
  background-color: #bbb;
  border-radius: 50%;
  display: inline-block;
  transition: background-color 0.6s ease;
}

.active {
  background-color: #717171;
}

/* Fading animation */
.fade {
  -webkit-animation-name: fade;
  -webkit-animation-duration: 10s;
  animation-name: fade;
  animation-duration: 10s;
}

@-webkit-keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}

@keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}

/* On smaller screens, decrease text size */
@media only screen and (max-width: 300px) {
  .text {font-size: 11px}
  img {
         width: 100px;
         height: 70px;
    }
}




.responsive {
  width: 100%;
  height: auto;
}


.center {
  display: block;
  margin-left: auto;
  margin-right: auto;
}
</style>

</head>

<body>
    <%@include file="navbar.jsp" %>
    
    <div class="container theme-showcase" role="main">  
        <h1><b>Customer and Employee Privacy Policy</b></h1>
        <hr>    
            
        <form class="form-inline">
           
            <div class="form-group "> 
                <p class="col-sm-5 control-label ">
                <h1>Summary</h1>
                <br>
                <font size="+1">
                    Protecting your personal data and information is a top priority for 
                    InThisTogether and the basis of the relationship of trust we are trying 
                    to create with our customers. <br><br>

                    With this Privacy Policy statement, we want to inform you about 
                    how InThisTogether collects, processes, uses, and stores your 
                    personal information and data.<br><br>

                    If you do not accept this Privacy Policy either in part or in full, 
                    please stop visiting and/or making any use of this website or its Services.<br><br>
                
                </font>
                </p>
            </div>
            <br><br>

            <div class="form-group "> 
                <p class="col-sm-5 control-label ">
                <h1>Privacy Policy Framework</h1>
                <br>
                <font size="+1">
                    The collection, processing and use of your Personal Data by InThisTogether 
                    is governed by the provisions of Greek and European law, as indicated by 
                    the provisions of N. 2774/1999 "on the protection of personal data in 
                    the telecommunications sector". <br><br>
                
                </font>
                </p>
            </div>
            <br><br>
            
            <div class="form-group "> 
                <p class="col-sm-5 control-label ">
                    <!-- <h1>What we do </h1> -->
                    <h1>Collecting Personal Data from users</h1>
                    <br>
                    <h2>1.1.	Customer Subscription</h2>
                    <br>
                    <font size="+1">
                        To use the InThisTogether Services, you'll be invited to sign up so 
                        you can post ads based on your needs. You can also visit the profiles 
                        of our professionals without creating an account.<br><br>

                        During the registration process, we will request the following Personal Information:<br><br>

                        <ul>
                            <li>Name and Surname </li>
                            <li>Email</li>
                            <li>Phone</li>
                        </ul>
                        <br> 
                        You'll also be asked to select and enter your password, as well as, 
                        accept the Terms and Conditions of Use of InThisTogether.  <br> <br>
                        
                    </font>
                    <br>
                    <h2>1.2.	Employee Subscription</h2>
                    <br>
                    <font size="+1">
                        To use the InThisTogether Services, you'll be invited to sign up in 
                        order to publish your own profile in the InThisTogether website so 
                        people who need your services can contact you. Once you sign up, 
                        your profile will be automatically created and displayed on the 
                        FindAmeaSupporter page.<br><br>

                        During the registration process, we will request the following Personal Information:<br><br>

                        <ul>
                            <li>Name and Surname </li>
                            <li>Email</li>
                            <li>Phone</li>
                            <li>Birthday</li>
                            <li>Sex</li>
                            <li>Experience </li>
                            <li>Education </li>
                            <li>Service </li>
                            <li>Disability </li>
                            <li>Languages </li>
                            <li>Service Town</li>
                            <li>Service Area</li>
                            <li>Driver’s license (Yes or No) </li>
                            <li>Car owner (Yes or No) </li>
                            <li>Available Days </li>
                            <li>Payment per Hour</li>
                            <li>Currently Available (Yes or No) </li>
                        </ul>
                        <br>
                        You'll also be asked to select and enter your password, as well as, 
                        accept the Terms and Conditions of Use of InThisTogether. <br> <br>
                        
                    </font>
                    <br>
                        
                    <h2>1.3.	Ad Publication</h2>
                    <br>
                    <font size="+1">
                        Each time you attempt to publish an ad, you are asked to 
                        fill out a form. One can publish an ad only if they have 
                        logged in as a customer.<br><br>

                        There, we ask you for information and clarification on the ad 
                        you wish to publish, so that we, as well as, our professionals 
                        can better understand the subject of the ad (service, disability, 
                        duration, location, job description). Professionals will assess 
                        whether they can or want to claim the job offered. The ones that 
                        decide to do so will obtain your information and contact you as 
                        soon as possible.<br><br>

                        You acknowledge that when an ad is posted in the InThisTogether 
                        website, your contact information (name, phone and email) is 
                        also published in the ad so that the professionals interested 
                        can contact you.<br><br>

                        You acknowledge that you agree to the publication of the above 
                        personal information in your ad display and authorize 
                        InThisTogether to do so.<br><br>
                    </font>
                    <br>

                    <h1>Customer obligations when providing Personal Data</h1>
                    <br>
                    <font size="+1">
                        You recognize that you have an obligation to InThisTogether 
                        to provide accurate and complete information during the 
                        registration and ad creation process, and whenever you are 
                        asked for such information. In addition, you should update 
                        your profile, whenever changes occur, in order to keep them 
                        up-to-date and accurate.<br><br>

                        If InThisTogether determines that you are not honoring your 
                        above obligations or if InThisTogether has reasonable grounds 
                        to suspect that the information you provide is false or 
                        incomplete or in any way, this contradicts the law or the 
                        Terms of Use or this Privacy Policy. In that case, 
                        InThisTogether has the right to reject your registration 
                        or ad publication request, suspend or terminate your account 
                        immediately without notice. In this case, InThisTogether has 
                        no obligation to compensate you for rejecting your request, 
                        or suspending or terminating your account.<br><br>

                        All of the above information is stored automatically  
                        in the website’s databases by electronic or other means.<br><br>

                    </font>

                </p>

            </div>
            <br> <br> <br>

        </form>
        
    </div>
        </div>
    

    </div>
    <br> <br><br> <br><br> <br>
    <br> <br> <br>
    <%@include file="footer.jsp" %>
    

</body>


</html>