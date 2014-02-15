
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %> 
 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
          <link rel="stylesheet" href="css/main2.css">
 </head>
<%
    if ((session.getAttribute("userid") == null) || (session.getAttribute("userid") == "")) {
%>
You are not logged in<br/>
<a href="index.jsp">Please Login</a>
<%} else {
%>

<h1>Welcome <%=session.getAttribute("userid")%></h1>

<a href='logout.jsp'><input type="button" value="Log Out" name="cancel"/></a>
<br>
<%  request.setCharacterEncoding("UTF-8");
    String user=  session.getAttribute("userid").toString();
    
   Class.forName("com.mysql.jdbc.Driver");
   Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/members?useUnicode=true&characterEncoding=UTF-8","root","%vo32174");
    
    Statement st = conn.createStatement();
    
    
    ResultSet rs;
    rs = st.executeQuery("select * from links where username='" +  user + "'");
    
    while(rs.next()){
        String rss = rs.getString(3);
        String id = rs.getString(1);
    
%>    

<html>
   
    
    <body>
        <TABLE cellpadding="15" border="1" style="background-color: #ffffcc;">
        <TR>
        <TD> <%=id%>  </TD>
        <TD> <%=rss%>  </TD>
        </TR>
        </TABLE>
    </body>
</html>


<%  }  %>



<h3>Add your Links Here:</h3>

<head>
<title>RSS Links</title>
</head>
<body>


<body>
        <form method="post" action="addlink.jsp">
            
            <table border="1" width="30%" cellpadding="5">
                
                <tbody>
                    <tr>
                        <td>Link</td>
                        <td><input type="text" name="link" value="" required=""/></td>
                    </tr>
                    
                     
                    
                    <tr>
                        <td><input type="reset" value="Reset" /></td>
                        <td><input type="submit" value="Submit" /></td>
                        
                    </tr>
                    
                </tbody>
            </table>
            
        </form>
<h3>Delete Link</h3>

<form method="post" action="delete.jsp">
            
            <table border="1" width="30%" cellpadding="5">
                
                <tbody>
                    <tr>
                        <td>Number</td>
                        <td><input type="text" name="num" value="" required=""/></td>
                    </tr>
                    
                     
                    
                    <tr>
                         <td><input type="reset" value="Reset" /></td>
                        <td><input type="submit" value="Submit" /></td>
                       
                    </tr>
                    
                </tbody>
            </table>
            
        </form>
<h4>Type the link you want to display</h4>
<%@taglib uri="http://java.sun.com/jsp/jstl/xml" prefix="x"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<HTML>
<HEAD>
    <TITLE>Feed Reader in JSTL</TITLE>
   
    <STYLE>
        table 
             {border: 2px ridge ; width: 500px}
        #feed .title
             {font-family: Arial; font-weight: bold; font-size: 18px}
        #feed .label
             {font-family: Tahoma; font-weight: bold; font-size: 11px}
        #feed td 
             {font-family: Tahoma; font-size: 11px}
    </style>
</HEAD>
<BODY>
    <form>
        <input type="text" name="feedURL"
            value="" /> 
        <input type="submit" value="Display"/>
    </form>
 
    <c:if test="${param.feedURL != null}">
         
    Feed URL: ${param.feedURL}
 
    <c:import var="xmlContent" url="${param.feedURL}"/>
     
    <x:parse var="doc" xml="${xmlContent}"/>
         
         
    <table class="content-table"" id="feed">
    <tr class="profile_odd">
        <td align="center" colspan="2">  
            <span class="title">
               <x:out select="$doc/rss/channel/title" />
            </span> 
        </td>
    </tr>
     <x:forEach var="story"
                select="$doc/rss/channel/item" varStatus="status">
        <tr>
            <td colspan="2"> <hr/> </td>
        </tr>
        <tr class="profile_even">
          <td class="label">Topic</td>
          <td> <x:out select="title" /> </td> 
        </tr>
        <tr class="profile_even">
          <td class="label">Published Date</td>
          <td> <x:out select="pubDate" /> </td>   
        </tr>
        <tr class="profile_even">
          <td class="label">Category</td>
          <td> <x:out select="category" /> </td>  
        </tr>
        <tr class="" valign="top">
            <td class="label">Description</td>
            <td><x:out select="description" escapeXml="false"/></td>
        </tr>
      </x:forEach>
    </table>
    </c:if>
</BODY>
</HTML>
<br>

 <footer>
  <p>Created by: Dimitris Voulgarakis </p>
  
</footer>
<%
    }
%>