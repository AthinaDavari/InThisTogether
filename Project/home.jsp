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
    <title>Home</title>

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
    
    <div class="slideshow-container">

        <div class="mySlides fade">
          <div class="numbertext">1 / 3</div>
          <img src="<%=request.getContextPath() %>/images/kid4.jpg" class="responsive" style="width:100%; height:100%;">
          <div class="text">Get your kid the appropriate learning support!</div>
        </div>
        
        <div class="mySlides fade">
          <div class="numbertext">2 / 3</div>
          <img src="<%=request.getContextPath() %>/images/blind2.jpg" class="responsive" style="width:100%;height:100%;">
          <div class="text">Eveyday life made easier!</div>
        </div>
        
        <div class="mySlides fade">
          <div class="numbertext">3 / 3</div>
          <img src="<%=request.getContextPath() %>/images/deaf4.jpg" class="responsive" style="width:100%;height:100%;">
          <div class="text">Communicate in Sign language!</div>
        </div>
        
        </div>
        <br>
        
        <div style="text-align:center">
          <span class="dot"></span> 
          <span class="dot"></span> 
          <span class="dot"></span> 
        </div>
 
        <!-- <div>
            <img src="<%=request.getContextPath() %>/images/disabled2.jpg" alt=" Trulli" style="width:100%;height:100%;" alt="" />
        </div> -->
    <div class="container theme-showcase" role="main">  
        <h1><b>About us</b></h1>
        <hr>    
            
        <form class="form-inline">
           
            <div class="form-group "> 
                <p class="col-sm-5 control-label ">
                <h1>Our vision </h1>
                <font size="+1">
                    We help those who are in need finding the perfect supporter for their everyday lives. 
                    We 've created a website where people with mental or physical disabilities and their relatives 
                    can <a href="ShowAllProfiles.jsp">search for a supporter</a> who will help them with their day to day activities! <br> <br>
                    Our vision is to remind people that they don't have to fight alone.
                    Everyone needs someone by their side! We are all <b>InThisTogether!</b></font>
                
                </p>
            </div>
            <br><br><br>
            
            <div class="form-group "> 
                <p class="col-sm-5 control-label ">
                    <!-- <h1>What we do </h1> -->

                    <h2>Are you a person with disabilities?</h2>
                    <br>
                    <font size="+1">
                        <ul>
                            <li><u>Are you searching for a supporter to assist you in your everyday life?</u><br>
                                <a href="ShowAllProfiles.jsp">Check out our qualified supporters</a> profiles and choose the most suitable for your needs(type of disability, service, etc.).
                                Feel free to contact them through email or phone number. Our qualified candidates support the following disabilities.<br> <br> 
                            </li>
                            <li><u>Can't find a suitable match?</u><br>
                                If you need a different kind of help, <a href="PublishAd.jsp">feel free to publish an ad</a> and describe your requirements.
                                Our available and suitable supporters will reach you as soon as possible!
                                Don't forget, you need to <a href="registerAsCustomer.jsp">create an account</a> in order to publish an ad!</li>
                          </ul>  
                    
                    </font>
                    <br>
                    <h2>Are you an AMEA supporter?</h2>
                    <br>
                    <font size="+1">
                        <ul>
                            <li><u>Are you searching for a job in your specialty?</u><br>
                                <a href="registerAsAmeaSupporter.jsp">Create an Account</a> with all your basic information, type of education and experience. 
                                Once you do that, your profile will appear <a href="ShowAllProfiles.jsp">here</a> and people in need of your services will reach you
                                through your contact information(email, phone number). <br>
                                Don't forget to constantly <a href="ShowAds.jsp">check on the ads</a>. Might be someone out there looking for someone just like you! 
                            </li>
                        </ul>  
                    
                    </font>
                        
                </p>	
                <img class="center" src="<%=request.getContextPath() %>/images/circle2.png" style="width:60%; height:50%;" alt="circle">

            </div>
            <br> <br> <br>

        </form>
    
          
        <form class="form-group" > <!-- text align--> 
            <h1 style="text-align:center"><b>Our amazing team</b></h1>
            <hr>
            <div class="row">
                <div class="column">
                    <img class="media-object img-thumbnail img-with-text" width="100" height="100" src="<%=request.getContextPath() %>/images/athina.jfif" alt="Member1">
                    <p><b>Athina Davari</b></p>
                    <p> In three words I can sum up <br>
                         everything I 've learned about life: <br>
                         it goes on! </p>
            </div>
            <div class="column">
                <img class="media-object img-thumbnail img-with-text" width="100" height="100"src="<%=request.getContextPath() %>/images/anna.jfif" alt="Member1">
                <p><b>Anna Shambel</b></p>
                <p>Earn your success based on <br> service to others, not 
                    <br> at the expense of others.</p>
            </div>
            <div class="column">
                <img class="media-object img-thumbnail img-with-text" width="100" height="100" src="<%=request.getContextPath() %>/images/elena.jpg" alt="Member1">
                <p><b>Elena Tzerefou</b></p>
                <p> Service to others 
                    is the <br>rent you pay 
                    for <br>your room here on earth. </p>
            </div>
            <div class="column">
                <img class="media-object img-thumbnail img-with-text" width="100" height="100" src="<%=request.getContextPath() %>/images/basiliki.jfif" alt="Member1">
                <p><b>Vassiliki Chalkiopoulou</b></p>
                <p> Life is too short <br>to live the same day twice! </p>
            </div>
        </form>
    </div>
        </div>
    

    </div>
    <br> <br><br> <br><br> <br>
    <br> <br> <br>
    <%@include file="footer.jsp" %>
    <script>
        var slideIndex = 0;
        showSlides();
        
        function showSlides() {
          var i;
          var slides = document.getElementsByClassName("mySlides");
          var dots = document.getElementsByClassName("dot");
          for (i = 0; i < slides.length; i++) {
            slides[i].style.display = "none";  
          }
          slideIndex++;
          if (slideIndex > slides.length) {slideIndex = 1}    
          for (i = 0; i < dots.length; i++) {
            dots[i].className = dots[i].className.replace(" active", "");
          }
          slides[slideIndex-1].style.display = "block";  
          dots[slideIndex-1].className += " active";
          setTimeout(showSlides, 5000); // Change image every 2 seconds
        }
    </script>

</body>


</html>