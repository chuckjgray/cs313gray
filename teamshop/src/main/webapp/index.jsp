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
                <%= session.getAttribute("theName")%>
                <br/><br/>
            </div>
            <h2>${$param.username}</h2>
            
            <hr align="center" width="70%">
            
            <div class="shirt1">
                <figure>
                    <img src="./img/btccheatblue.png" alt="Big Time Coach Blue Shirts"/>
                    <figcaption>Don't Cheat the Drill (Blue)</figcaption>
                </figure>
                <div class="form">
                <form method="POST" action="cart.jsp">
                    <input type="hidden" name="item" value="Don't Cheat the Drill (Blue)">
                    <input type=submit name="submit" value="add to cart">
                    <input type=submit name="submit" value="remove from cart">
                </form>
                </div>
            </div>

            <div class="shirt2">
                <figure>
                    <img src="./img/btccheatgrey.png" alt="Big Time Coach Gray Shirts"/>
                    <figcaption>Don't Cheat the Drill (Grey)</figcaption>
                </figure>
                <div class="form">
                <form method=POST action=cart.jsp>
                    <input type="hidden" name="item" value="Don't Cheat the Drill (Grey)">
                    <input type=submit name="submit" value="add to cart">
                    <input type=submit name="submit" value="remove from cart">
                </form>
                </div>
            </div>

            <div class="shirt3">
                <figure>
                    <img src="./img/btccheatltgrey.png" alt="Big Time Coach Light Gray Shirts"/>
                    <figcaption>Don't Cheat the Drill (Light Grey)</figcaption>
                </figure>
                <div class="form">
                <form method=POST action=cart.jsp>
                    <input type="hidden" name="item" value="Don't Cheat the Drill (Light Grey)">
                    <input type=submit name="submit" value="add to cart">
                    <input type=submit name="submit" value="remove from cart">
                </form>
                </div>
            </div>
            <hr align="center" width="70%">
            <div class="shirt1">   
                <figure>
                    <img src="./img/btciceredblack.png" alt="Big Time Coach Black Shirts"/>
                    <figcaption>We've Got Ice For That (Black)</figcaption>
                </figure>
                <div class="form">
                <form method=POST action=cart.jsp>
                    <input type="hidden" name="item" value="We've Got Ice For That (Black)">
                    <input type=submit name="submit" value="add to cart">
                    <input type=submit name="submit" value="remove from cart">
                </form>
                </div>
            </div>

            <div class="shirt2">    
                <figure>
                    <img src="./img/btciceyellow.png" alt="Big Time Coach Yellow Shirts"/>
                    <figcaption>We've Got Ice For That (Yellow)</figcaption>
                </figure>
                <div class="form">
                <form method=POST action=cart.jsp>
                    <input type="hidden" name="item" value="We've Got Ice For That (Yellow)">
                    <input type=submit name="submit" value="add to cart">
                    <input type=submit name="submit" value="remove from cart">
                </form>
                </div>
            </div>

            <div class="shirt3">
                <figure>
                    <img src="./img/btcicegrey.png" alt="Big Time Coach Grey Shirts"/>
                    <figcaption>We've Got Ice For That (Grey)</figcaption>
                </figure>
                <div class="form">
                <form method=POST action=cart.jsp>
                    <input type="hidden" name="item" value="We've Got Ice For That (Grey)">
                    <input type=submit name="submit" value="add to cart">
                    <input type=submit name="submit" value="remove from cart">
                </form>
                </div>
            </div>
            
            <hr align="center" width="70%">
            
            <div class="form">
            <form method=POST action=cart.jsp>
                <br>
                Please enter item to add or remove to the cart:
                <br>
                <select NAME="item">
                <option>Don't Cheat the Drill (Blue)
                <option>Don't Cheat the Drill (Grey)
                <option>Don't Cheat the Drill (Light Grey)
                <option>We've Got Ice For That (Black)
                <option>We've Got Ice For That (Yellow)
                <option>We've Got Ice For That (Grey)
                </select>
                <br> <br>
                <input type=submit name="submit" value="add to cart">
                <input type=submit name="submit" value="remove from cart">
            </form>
            </div>
            
            <hr align="center" width="70%">
            <p>TeamShop Copyright 2015</p>
        </div>

    </body>
</html>
