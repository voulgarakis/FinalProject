<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %> 
<%@taglib uri="http://java.sun.com/jsp/jstl/xml" prefix="x"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/main.css">
        <title>error Page</title>
    </head>
 <%
    if ((session.getAttribute("userid") == null) || (session.getAttribute("userid") == "")) {
%>
You are not logged in<br/>
<a href="index.jsp">Please Login</a>
<%} else {
%>
<%
    request.setCharacterEncoding("UTF-8");  
   
    String numb = request.getParameter("num");   
    String us=session.getAttribute("userid").toString();
         try {
                    Connection conn = null;
                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/members?useUnicode=true&characterEncoding=UTF-8", "root", "");
                    Statement st1 = null;
                    st1 = conn.createStatement();
                    st1.executeUpdate("delete from links where id ='"+numb+"' && username='"+us+"'");
                    
        } catch (Exception e) {
                    System.out.println(e.getMessage());
                }
         
         response.sendRedirect("success.jsp");
    %>
    
    <%
    }
%>