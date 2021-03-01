<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="errorpage.jsp"%>
<%@ page import="inthistogether.*" %>

<%
String email = request.getParameter("email");
String password = request.getParameter("password");

// support Greek characters
email = new String(email.getBytes("ISO-8859-1"), "UTF-8");
password = new String(password.getBytes("ISO-8859-1"), "UTF-8");

if (email == null || password == null) {

    response.sendRedirect("loginAsCustomer.jsp");
    return;
}


CustomerDAO custdao = new CustomerDAO();
Customer customer;

try{ 
    customer = custdao.authenticate(email, password);
    session.setAttribute("customerObj", customer);
    session.setAttribute("ameasupporterObj", null);
%>
    <jsp:forward page="home.jsp" />
<%
} catch(Exception e) {
   
    request.setAttribute("message", "Seems like the credentials are incorrect. Please try again!");
%>
    <jsp:forward page="loginAsCustomer.jsp" />
<%
} finally {

}
%>