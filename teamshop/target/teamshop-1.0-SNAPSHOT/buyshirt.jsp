<%-- 
    Document   : buyshirt
    Created on : Nov 20, 2015, 11:37:15 PM
    Author     : Chuck
--%>

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
            <form action="StartPayment" method="POST">
                User ID (This will be removed when we have login database working properly.):<br/>
                <input type="text" value = "7" name="userId"><br/><br/>
                Item ID (To my knowledge, we can just increment this for each payment in the database.):<br/>
                <input type="text" value = "7" name="itemId"><br/><br/>
                Item Name (This is a bit tricky... it would be nice to add a list of items and have it do all of the back end, but that may be too much for the time given):<br/>
                <input type="text" value = "7" name="itemName"><br/><br/>
                Description: <br/>
                <input type="text" name="description"><br/><br/>
                Price: <br/>
                <input type="text" value = "1" name ="price"><br/><br/>
                <input type="image" src="https://www.paypalobjects.com/webstatic/en_US/i/buttons/checkout-logo-large.png" alt="Check out with PayPal" /><br/><br/>
            </form>
        </div>
    </body>
    
</html>
