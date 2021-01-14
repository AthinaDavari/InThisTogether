<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isErrorPage="true"%>
<%@ page import="inthistogether.*" %>

<% Customer customer=(Customer)session.getAttribute("customerObj"); %>

<% AMEASupporter ameasupporter=(AMEASupporter)session.getAttribute("ameasupporterObj"); %>

<!DOCTYPE html>
<html lang="en">
	<head>
        
        <%@include file="header.jsp" %>
        <meta name="author" content="t8180112@aueb.gr">
        <title>Error Page</title>

        <link href="<%=request.getContextPath() %>/css/background.css" rel="stylesheet">

	</head>

	<body>

        <%@ include file="navbar.jsp" %>

		<div class="container" role="main">

	<% 
	if(request.getAttribute("message") != null) { 
	%>
			<!-- Page Title -->
			<div class="page-header">
				<h1><b>Access Denied</b></h1>
			</div>		

			<div class="alert alert-danger" role="alert">
                    <%=(String)request.getAttribute("message") %>
			</div>
	<% 
	} 
	%>			
		</div>

        <%@include file="footer.jsp" %>

	</body>
</html>