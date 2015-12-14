<%-- 
    Document   : cart
    Created on : Dec 6, 2015, 2:48:31 PM
    Author     : Dave
--%>
<%@page import="cart.addRemove" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Shopping Cart</title>
        <link rel="stylesheet" type="text/css" href="style.css">
    </head> 
    <body>
        <div class="thankyouMain">
            <div class="box5">
                <div class="headerleft">
                    <img src="./img/teamshop2.png" alt="TeamShop">
                </div>
            </div>
            <div class="box5">
                <div class="headerleft">
                    <img src="./img/teamshopcart2.png" alt="TeamShop">
                </div>
            </div>
            <jsp:useBean id="cart" scope="session" class="cart.addRemove" />

            <jsp:setProperty name="cart" property="*" />

            <%cart.processRequest(request);%>

            <br> 
            <p>Items in cart:</p>
            <ol class="liststyle">
                <%
                    int price = 0;
                    String[] products = cart.getProducts();
                    for (int i = 0; i < products.length; i++) {
                        price += 2;
                %>
                <li> <% out.print((products[i])); %> 

                    <%
                        }
                    %>
            </ol>

            <% out.print(("Your total is " + price));%>
            <form name="submitform" action="passData" method="POST" id="1">

                <%
                    String queryString = "passData?price=" + price;

                %>

                <a href="<%= queryString%>">Checkout</a>

            </form>
            <br> <a href="index.jsp">Continue Shopping</a></br></br>
        </div>
    </body>
</html>
