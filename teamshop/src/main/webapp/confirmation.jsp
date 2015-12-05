<%-- 
    Document   : confirmation
    Created on : Dec 3, 2015, 9:22:54 PM
    Author     : Kapangyarihan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Confirmation</title>
        <link rel="stylesheet" type="text/css" href="style.css">
    </head>
    <body>
        <div class="main">
            <h1>Confirmation</h1>
            <p>You are about to make the payment, there is no turning back after you press that button!</p>
                <form action="Confirmation" method="POST">
                      <input type="hidden" value="${param.userId}" name="userId">
                      <input type="hidden" value="${param.itemId}" name="itemId">
                      <input type="hidden" value="${param.token}" name="token">
                      <input type="hidden" value="${param.PayerID}" name="PayerID">
                      <input type="submit" value="Confirm Payment" style="display:block;position:relative;margin-left:auto;margin-right:auto;"/>
               </form>
           <br/>
        </div>
    </body>
</html>
