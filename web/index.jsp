<%-- 
    Document   : index
    Created on : Dec 18, 2013, 4:31:02 PM
    Author     : Dimitris
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>WWW</title>
        <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <title>{{ page.title }}</title>
        <meta name="viewport" content="width=device-width">

       
        <link rel="stylesheet" href="css/main.css">

    </head>

        <script>

function setCookie(cname,cvalue,exdays)
{
var d = new Date();
d.setTime(d.getTime()+(exdays*24*60*60*1000));
var expires = "expires="+d.toGMTString();
document.cookie = cname+"="+cvalue+"; "+expires;
}

function getCookie(cname)
{
var name = cname + "=";
var ca = document.cookie.split(';');
for(var i=0; i<ca.length; i++) 
  {
  var c = ca[i].trim();
  if (c.indexOf(name)==0) return c.substring(name.length,c.length);
  }
return "";
}

function checkCookie()
{
var user=getCookie("username");
if (user!="")
  {
  alert("Welcome again " + user);
  }
else 
  {
  user = prompt("Please enter your name:","");
  if (user!="" && user!=null)
    {
    setCookie("username",user,30);
    }
  }
}

</script>

<body onload="checkCookie()"></body>
    </head>
    <body>
        <div class="forma">
        <form method="post" action="Login2">
            <center>
            <table border="3" width="30%" cellpadding="3">
                <thead>
                    <tr>
                        <th colspan="2">Login Here</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>User Name</td>
                        <td><input type="text" name="uname" value="" placeholder="Username" /></td>
                    </tr>
                    <tr>
                        <td>Password</td>
                        <td><input type="password" name="pass" value="" placeholder="Password"/></td>
                    </tr>
                    <tr>
                        <td><input type="reset" value="Reset" /></td>
                        <td><input type="submit" value="Login" /></td>
                        
                    </tr>
                    <tr>
                        <td colspan="2">Yet Not Registered!! <a href="reg.jsp">Register Here</a></td>
                    </tr>
                </tbody>
            </table>
            </center>
        </form>
            <br>
            </div>
        <p class="perigrafh">
            Σε αυτήν τη σελίδα ο χρήστης μπορεί να αποθηκεύει και να παρακολουθεί τα RSS που έχει εισάγει.
            Η δυνατότητα αυτή δίνεται στο χρήστη αφού κάνει Log In. Πιο κάτω χωρίς δημιουργία λογαριασμού μπορεί 
            να παρακολουθεί τα τελευταία νέα του Google. 
        </p>

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
        <input type="hidden" name="feedURL"
            value="http://news.google.com/?output=rss" /> 
        <input type="submit" value="Google News"/>
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
        <footer>
  <p>Created by: Dimitris Voulgarakis </p>
  
</footer>

    </body>
    
</html>