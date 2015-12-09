<%-- 
    Document   : cart
    Created on : Dec 6, 2015, 2:48:31 PM
    Author     : Dave
--%>
<%@page import="cart.addRemove" %>
<html>
    <jsp:useBean id="cart" scope="session" class="cart.addRemove" />

    <jsp:setProperty name="cart" property="*" />

    <%cart.processRequest(request);%>

    <br> Items in cart:
    <ol>
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


<!--    <br> <a href="buyshirt.jsp">GO TO CHECKOUT</a>-->
    <br>

    <br> <a href="index.jsp">Return to Shop</a>

</html>

