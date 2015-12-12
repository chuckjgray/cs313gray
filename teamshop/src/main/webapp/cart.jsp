<%-- 
    Document   : cart
    Created on : Dec 6, 2015, 2:48:31 PM
    Author     : Dave
--%>
<%@page import="cart.addRemove" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Shopping Cart</title>
        <link rel="stylesheet" type="text/css" href="style.css">
    </head> 
    <body>
        <div class="cartMain">
             <div class="box5">
                <div class="headerleft">
                    <img src="./img/teamshop.png" alt="TeamShop">
                </div>
            </div>
            <div class="box5">
                <div class="headerleft">
                    <img src="./img/teamshopcart.png" alt="TeamShop">
                </div>
            </div>
<jsp:useBean id="cart" scope="session" class="cart.addRemove" />

<jsp:setProperty name="cart" property="*" />

<%cart.processRequest(request);%>

<br> Items in cart:
<ol>
<% 
	String[] products = cart.getProducts();
	for (int i=0; i<products.length; i++) {
         out.print( (i+1)+". " + (products[i])+ "<br/>"); 
         //out.print("<li>" + (products[i])); 
	}
%>
</ol>

<br> 
<input type="button" onclick="location.href='buyshirt.jsp';" value="Go To CHECKOUT"/>

<br>

<br> <a href="index.jsp">continue shopping</a></br></br>
        </div>
    </body>
</html>
