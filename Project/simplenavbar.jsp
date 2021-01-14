<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

    <!--Fixed navbar-->
    <nav class="navbar navbar-custom  navbar-fixed-top">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar"
                    aria-expanded="false" aria-controls="navbar">
                    <i class="fas fa-bars"></i>

                </button>
                <a href="home.jsp"><img class="navbar-brand" style="height: 53px;" src="<%=request.getContextPath() %>/images/logo3.png"></a>
            </div>
            <div id="navbar" class="navbar-collapse collapse">
                <ul class="nav navbar-nav ">
                    <li class="nav-item active"><a class="nav-link" href="home.jsp"><b>Home</b></a></li>
                    <li class="nav-item"><a class="nav-link" href="ShowAds.jsp"><b>See Ads</b></a>
                    </li>
                    <li class="nav-item"><a class="nav-link" href="ShowAllProfiles.jsp"><b>Find AMEA
                                Supporter</b></a></li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                            aria-expanded="false"><b>Log In <span class="caret"></span></b></a>
                        <ul class="dropdown-menu">
                            <li><a href="loginAsAmeaSupporter.jsp"><b>As Amea
                                        Supporter</b></a></li>
                            <li><a href="loginAsCustomer.jsp"><b>As Customer</b></a>
                            </li>
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                            aria-expanded="false"><b>Register <span class="caret"></b></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="registerAsAmeaSupporter.jsp"><b>As Amea
                                        Supporter</b></a></li>
                            <li><a href="registerAsCustomer.jsp"><b>As
                                        Customer</b></a></li>
                        </ul>
                    </li>
                </ul>
            </div>
            <!--/.nav-collapse -->
        </div>
    </nav>