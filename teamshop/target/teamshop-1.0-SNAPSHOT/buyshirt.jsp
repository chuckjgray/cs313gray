<%-- 
    Document   : buyshirt
    Created on : Nov 20, 2015, 11:37:15 PM
    Author     : Chuck
--%>


<%@page import="java.util.Random"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Buy Shirt</title>
        <link rel="stylesheet" type="text/css" href="style.css">
    </head>
    <body>
        <div class="main">

            <h1>Buy Your Shirt Here</h1>
            <form action="homepage.jsp" method="POST">
                <input type="submit" value="Continue Shopping">
            </form>

            <br/>
            <%
                Random r = new Random();
                int rint1 = r.nextInt((2400000) + 1);
                int rint2 = r.nextInt((2400000) + 1);
            %>
            <form action="StartPayment" method="POST">
                <!--User ID:<br/>-->
                <input type="hidden" value = "<%= rint1%>" name="userId">
                <!--Item ID:<br/>-->
                <input type="hidden" value = "<%= rint2%>" name="itemId">
                Item Name: Shirts<br/>
                <input type="hidden" value = "Shirts" name="itemName"><br/><br/>
                Your Total Price:  ${price}<br/>
                <input type="hidden" value = "${price}" name ="price"><br/><br/>
                <input type="hidden" name="description" value ="These are awesome shirts!">
                <p>Note - You will be directed to the PayPal site for the transaction.</p>
                <input type="image" src="https://www.paypalobjects.com/webstatic/en_US/i/buttons/checkout-logo-large.png" alt="Check out with PayPal" /><br/><br/>
            </form>
        </div>
    </body>

</html>
