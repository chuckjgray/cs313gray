<%-- 
    Document   : index
    Created on : Dec 4, 2015, 12:48:25 AM
    Author     : Chuck
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.logging.Logger"%>
<%@page import="java.util.logging.Level"%>
<%@page import="database.getData"%>
<%@page import="database.Main"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.*"%>
<% Class.forName("com.mysql.jdbc.Driver");%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ancestry</title>
    </head>
    <body>
        <h1>Display Data From Family DB</h1>

        <%
            Main getFamily = new Main();
            ArrayList<ArrayList<String>> family = getFamily.main();
            ArrayList<String> first = family.get(0);
            ArrayList<String> last = family.get(1);
            try {
                family = getFamily.main();

                request.getSession().setAttribute("family", family);
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(getData.class.getName()).log(Level.SEVERE, null, ex);
            } catch (SQLException ex) {
                Logger.getLogger(getData.class.getName()).log(Level.SEVERE, null, ex);
            }

        %>

        <!--        while (resultSet.next()) {
                    iCount =iCount+1;-->

        <form name="submitForm" id = "1" method="POST" >

            <tbody>

            <h2>Full Name</h2>


            <%                    for (int i = 0; i < first.size(); i++) {
                    String fullname = first.get(i) + " " + last.get(i);


            %>

            <input type ="hidden" name ="fullname" value = "<%= fullname%>">
<!--                    <td><a href="javascript:{}" onclick="document.getElementById('1').submit(); return false;"><%= fullname%></a></td>-->
            <a href="getDetails?fullname=<%= fullname%>"><%= fullname%><br/></a>
            <!--                 <a href="getDetails?param1=fullname">Test</a>-->


            <%
                }

            %>




        </form>





    </body>
</html>
