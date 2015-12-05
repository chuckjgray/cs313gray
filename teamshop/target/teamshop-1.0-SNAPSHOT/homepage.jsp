<%-- 
    Document   : homepage
    Created on : Nov 17, 2015, 10:02:29 PM
    Author     : Chuck
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>
        <link rel="stylesheet" type="text/css" href="style.css">
    </head>

    <body> 

        <div class="main">
            <h1>Team Shop</h1>
            <div class="login">
                <form action="login.jsp">
                    <input type="submit" value="login">
                </form>
                
                <br/><br/>
            </div>
            <h2>${$param.username}</h2>
            <hr align="center" width="70%">
            <div class="shirt1">
                <figure>
                    <a href="buyshirt.jsp"><img src="./img/btccheatblue.png" alt="Big Time Coach Blue Shirts"/></a>
                    <figcaption>DON'T CHEAT THE DRILL</figcaption>
                </figure>
            </div>

            <div class="shirt2">
                <figure>
                    <img src="./img/btccheatgrey.png" alt="Big Time Coach Gray Shirts"/>
                    <figcaption>DON'T CHEAT THE DRILL</figcaption>
                </figure>
            </div>

            <div class="shirt3">
                <figure>
                    <img src="./img/btccheatltgrey.png" alt="Big Time Coach Light Gray Shirts"/>
                    <figcaption>DON'T CHEAT THE DRILL</figcaption>
                </figure>
            </div>
            <hr align="center" width="70%">
            <div class="shirt1">   
                <figure>
                    <img src="./img/btciceredblack.png" alt="Big Time Coach Black Shirts"/>
                    <figcaption>WE'VE GOT ICE FOR THAT</figcaption>
                </figure>
            </div>

            <div class="shirt2">    
                <figure>
                    <img src="./img/btciceyellow.png" alt="Big Time Coach Yellow Shirts"/>
                    <figcaption>WE'VE GOT ICE FOR THAT</figcaption>
                </figure>
            </div>

            <div class="shirt3">
                <figure>
                    <img src="./img/btcicegrey.png" alt="Big Time Coach Grey Shirts"/>
                    <figcaption>WE'VE GOT ICE FOR THAT</figcaption>
                </figure>
            </div>
            <hr align="center" width="70%">
            <p>TeamShop Copyright 2015</p>
        </div>

    </body>
</html>
