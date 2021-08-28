<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="errorpage.jsp"%>

<%
session.invalidate();
%>

<!DOCTYPE html>
<html lang="en">
	<head>

		<%@include file="header.jsp" %>
        <meta name="author" content="t8180131@aueb.gr">
        <meta http-equiv="refresh" content="2;url=home.jsp" />
        <title>Logout</title>
	
	</head>
	<body>	

		<div class="container" role="main">

			<div class="alert alert-success text-center" role="alert">You logged out successfully!</div>		

		</div>
		<!-- /container -->

		<!-- footer -->
        <%@include file="footer.jsp" %>
		
	</body>
</html>
