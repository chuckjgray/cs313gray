<%-- 
    Document   : dontcheatBLUE
    Created on : Dec 12, 2015, 7:53:51 PM
    Author     : Jonathon
--%>



<%@page import="java.util.Random"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Item Page</title>
        <link rel="stylesheet" type="text/css" href="style.css">
    </head>
    <body>
        <div class="thankyouMain">
            <div class="box6">
                <div class="headerleft">
                    <img src="./img/teamshop2.png" alt="TeamShop">
                </div>
            </div>
           
           
            <h1>Don't Cheat the Drill (Blue)</h1>
            <img src="./img/btccheatblue.png" alt="Dont cheat the drill (Blue)" height="300" width="200">
            <br/>
           
                Price: $2.00  <br/> <br/>
                    
                <form method=POST action=cart.jsp>
                                <input type="hidden" name="item" value="Dont cheat the drill (Blue)">
                                <input type=submit name="submit" value="add to cart">
                            </form><br/>
                <input type="button" onclick="location.href='index.jsp';" value="Back to Store"/>
                <div id="added"></div>
                <br/>
            <br/>
        </div>
    </body> 

</html>