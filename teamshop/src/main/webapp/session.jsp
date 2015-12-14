<%-- 
    Document   : session
    Created on : Dec 8, 2015, 10:11:37 PM
    Author     : Chuck
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String name = request.getParameter("username");
    session.setAttribute("theName", name);

//HttpSession cookie = request.getSession(false);
//if(cookie!=null)
//  cookie.setAttribute("username", username);
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Session</title>
        <link rel="stylesheet" type="text/css" href="style.css">
    </head>

    <body>
        <div class="thankyouMain">
        <div class="box6">
                <div class="headerleft">
                    <img src="./img/teamshop2.png" alt="TeamShop">
                </div>
            </div>
           
            <h1>Confirmed Login</h1>
            <br/>
            <br/>
            <p>${$param.username} You are logged in. Click <a href="index.jsp">here</a> to continue.</p>

            </br> </br>
        </div>




    </body>
</html>
