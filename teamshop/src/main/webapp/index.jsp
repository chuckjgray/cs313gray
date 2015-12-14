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
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>
        <link rel="stylesheet" type="text/css" href="style.css">
    </head>

    <body>
        <div class="main">
            <div class="header">
                <div class="leftlogo">

                    <a href="login.jsp"><img src="./img/teamshop2.png" alt="TeamShop"></a>

                </div>
                <div class="rightlogo">

                    <a href="login.jsp"><img src="./img/login.png" alt="login"/></a>

                </div>
            </div>
            <div class="wrap">


                <div class="box">
                    <div class="innerContent">
                        <figure>
                            <a href="dontcheatBLUE.jsp"><img src="./img/btccheatblue.png" alt="Big Time Coach Blue Shirts"/></a>
                            <figcaption>DON'T CHEAT THE DRILL</figcaption>
                        </figure>
                        <div class="form">
                            <form method="POST" action="cart.jsp">
                                <input type="hidden" name="item" value="Don't Cheat the Drill (Blue)">
                                <input type=submit name="submit" value="add to cart">
                                <input type=submit name="submit" value="remove from cart">
                            </form>
                        </div>
                    </div>
                </div>
                <div class="box">
                    <div class="innerContent">
                        <figure>
                            <a href="dontcheatGrey.jsp"><img src="./img/btccheatgrey.png" alt="Big Time Coach Gray Shirts"/></a>
                            <figcaption>DON'T CHEAT THE DRILL</figcaption>
                        </figure>
                        <div class="form">
                            <form method=POST action=cart.jsp>
                                <input type="hidden" name="item" value="Don't Cheat the Drill (Grey)">
                                <input type=submit name="submit" value="add to cart">
                                <input type=submit name="submit" value="remove from cart">
                            </form>
                        </div>
                    </div>
                </div>
                <div class="box">
                    <div class="innerContent">
                        <figure>
                            <a href="dontcheatLTGREY.jsp"><img src="./img/btccheatltgrey.png" alt="Big Time Coach Light Gray Shirts"/></a>
                            <figcaption>DON'T CHEAT THE DRILL</figcaption>
                        </figure>
                        <div class="form">
                            <form method=POST action=cart.jsp>
                                <input type="hidden" name="item" value="Don't Cheat the Drill (Light Grey)">
                                <input type=submit name="submit" value="add to cart">
                                <input type=submit name="submit" value="remove from cart">
                            </form>
                        </div>
                    </div>
                </div>

                <div class="box">
                    <div class="innerContent">
                        <figure>
                            <a href="wegoticeRED.jsp"><img src="./img/btciceredblack.png" alt="Big Time Coach Black Shirts"/></a>
                            <figcaption>WE'VE GOT ICE FOR THAT</figcaption>
                        </figure>
                        <div class="form">
                            <form method=POST action=cart.jsp>
                                <input type="hidden" name="item" value="We've Got Ice For That (Black)">
                                <input type=submit name="submit" value="add to cart">
                                <input type=submit name="submit" value="remove from cart">
                            </form>
                        </div>
                    </div>
                </div>
                <div class="box">
                    <div class="innerContent">
                        <figure>
                            <a href="wegoticeYELLOW.jsp"><img src="./img/btciceyellow.png" alt="Big Time Coach Yellow Shirts"/></a>
                            <figcaption>WE'VE GOT ICE FOR THAT</figcaption>
                        </figure>
                        <div class="form">
                            <form method=POST action=cart.jsp>
                                <input type="hidden" name="item" value="We've Got Ice For That (Yellow)">
                                <input type=submit name="submit" value="add to cart">
                                <input type=submit name="submit" value="remove from cart">
                            </form>
                        </div>
                    </div>
                </div>
                <div class="box">
                    <div class="innerContent">
                        <figure>
                            <a href="wegoticeGREY.jsp"><img src="./img/btcicegrey.png" alt="Big Time Coach Grey Shirts"/></a>
                            <figcaption>WE'VE GOT ICE FOR THAT</figcaption>
                        </figure>
                        <div class="form">
                            <form method=POST action=cart.jsp>
                                <input type="hidden" name="item" value="We've Got Ice For That (Grey)">
                                <input type=submit name="submit" value="add to cart">
                                <input type=submit name="submit" value="remove from cart">
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <div class="linespace"></div>
            <div class="form2">
                <form method=POST action=cart.jsp>

                    Please enter item to add or remove to the cart:
                    <br>
                    <select NAME="item">
                        <option>Don't Cheat the Drill (Blue)
                        <option>Don't Cheat the Drill (Grey)
                        <option>Don't Cheat the Drill (Lt Grey)
                        <option>We've Got Ice For That (Black)
                        <option>We've Got Ice For That (Yellow)
                        <option>We've Got Ice For That (Grey)
                    </select>
                    <br> <br>
                    <input type=submit name="submit" value="add to cart">
                    <input type=submit name="submit" value="remove from cart">
                </form>
            </div>
            <hr align="center" width="85%">
            <p>TeamShop Copyright 2015</p> 


        </div>
    </body>
</html>