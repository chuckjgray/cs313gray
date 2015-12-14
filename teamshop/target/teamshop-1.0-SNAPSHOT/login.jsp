<%-- 
    Document   : login
    Created on : Nov 11, 2015, 8:02:39 PM
    Author     : Chuck
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
        <link rel="stylesheet" type="text/css" href="style.css">
    </head>
    <body>
        <div class="thankyouMain">
            <div class="box6">
                <div class="headerleft">
                    <img src="./img/teamshop2.png" alt="TeamShop">
                </div>
            </div>
            
        <h1>Login Page</h1>
        <p>${message}</p>
        <form action="checklogin" method="POST">
            <br/>
            <br/>
              Username: <input type="text" name="username" /><br /><br/>
              Password: <input type="password" name="password" /><br /> <br/>
              <input type="submit" value="Submit Login" />
       </form><br/>
        <a href="index.jsp">Back to store</a>
        <br/>
        <br/>
        </div>
    </body>
</html>
