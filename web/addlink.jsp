<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %> 

<!DOCTYPE html>
<%
    request.setCharacterEncoding("UTF-8");
    String link = request.getParameter("link");
    String user = session.getAttribute("userid").toString();
    
    
        try {
                    Connection conn = null;
                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/members?useUnicode=true&characterEncoding=UTF-8", "root", "");
                    
                    Statement st1 = null;
                    st1 = conn.createStatement();
                    
                     int i = st1.executeUpdate("insert into links(username, rss) values ('" + user + "','" + link + "')");
                     
                     if (i > 0) {
                        response.sendRedirect("success.jsp");
                      }
        } catch (Exception e) {
                    System.out.println(e.getMessage());
                }


















%>