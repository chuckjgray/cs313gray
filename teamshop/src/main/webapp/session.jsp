<%-- 
    Document   : session
    Created on : Dec 8, 2015, 10:11:37 PM
    Author     : Chuck
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
   String name = request.getParameter( "username" );
   session.setAttribute( "theName", name );

//HttpSession cookie = request.getSession(false);
//if(cookie!=null)
//  cookie.setAttribute("username", username);
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Session</title>
    </head>
    <body>
        
        <p>${username} you are logged in. Click <a href="index.jsp">here</a> to continue.</p>






    </body>
</html>
