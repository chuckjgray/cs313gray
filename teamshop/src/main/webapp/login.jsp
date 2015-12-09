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
    </head>
    <body>
        <h1>Login Page</h1>
        <p>${message}</p>
        <form action="checklogin" method="POST">
              Username: <input type="text" name="username" /><br />
              Password: <input type="password" name="password" /><br /> 
              <input type="submit" value="Submit Login" />
       </form>
    </body>
</html>
