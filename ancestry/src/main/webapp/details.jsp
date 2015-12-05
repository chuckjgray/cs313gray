<%-- 
    Document   : details
    Created on : Dec 5, 2015, 12:50:50 PM
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
        <title>People Details</title>
    </head>
    <body>
        <h1>Details on People</h1>

        <%
            Main getFamily = new Main();
            ArrayList<ArrayList<String>> family = getFamily.main();
            ArrayList<String> first = family.get(0);
            ArrayList<String> last = family.get(1);
            ArrayList<String> dob = family.get(2);

            try {
                family = getFamily.main();

                request.getSession().setAttribute("family", family);
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(getData.class.getName()).log(Level.SEVERE, null, ex);
            } catch (SQLException ex) {
                Logger.getLogger(getData.class.getName()).log(Level.SEVERE, null, ex);
            }

        %>
        <form name="submitForm" method="POST" action="getDetails">
            <table border="1">
                <tbody>
                    <tr>
                        <td>Full Name</td>
                        <td>Date of Birth</td>
                    </tr>


                    <%                    for (int i = 0; i < first.size(); i++) {

                            String fullname = first.get(i) + " " + last.get(i);
                            String test = (String) session.getAttribute("fullname");

                            if (fullname.equals(test)) {
                                String birth = dob.get(i);

                    %>


                    <tr>
                        <td><%= fullname%></td>
                        <td><%= birth%></td>
                    </tr>
                    <%
                            }
                        }
                    %>


                </tbody>


            </table>
        </form>








    </body>
</html>
