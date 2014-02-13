<%-- 
    Document   : dupuname
    Created on : Jan 19, 2014, 4:21:26 PM
    Author     : Dimitris
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    if ((session.getAttribute("userid") == null) || (session.getAttribute("userid") == "")) {
%>
You are not logged in<br/>
<a href="index.jsp">Please Login</a>
<%} else {
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/main.css">
        <title>error Page</title>
    </head>
    <body>
        <h1>Error: Username already exists.. <a href='reg.jsp'>Go to Registration</a></h1>
        
        <footer>
  <p>Created by: Dimitris Voulgarakis </p>
  
</footer>
    </body>
</html>
   <%
    }
%>