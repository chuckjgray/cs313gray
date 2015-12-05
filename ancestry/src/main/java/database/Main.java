/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package database;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class Main {

    private static final String DBCLASS = "com.mysql.jdbc.Driver";
    private static final String USERNAME = "dbuser";
    private static final String PASSWORD = "dbpassword";
    private static final String CONN_STRING = "jdbc:mysql://localhost/family";

    public static ArrayList<ArrayList<String>> main() throws ClassNotFoundException, SQLException {

        Connection conn = null;
        ArrayList<String> first = new ArrayList<String>();
        ArrayList<String> last = new ArrayList<String>();
        ArrayList<String> dob = new ArrayList<String>();
        try {
            Class.forName(DBCLASS);
            conn = DriverManager.getConnection(CONN_STRING, USERNAME, PASSWORD);
            Statement statement = conn.createStatement();
            String query = "Select * from person";
            ResultSet resultSet = statement.executeQuery(query);

            while (resultSet.next()) {

                String firstdb = resultSet.getString(2);
                String lastdb = resultSet.getString(3);
                String dobdb = resultSet.getString(4);

                first.add(firstdb);
                last.add(lastdb);
                dob.add(dobdb);
//                people.add(id);

            }

        } catch (SQLException e) {
            System.err.println(e);
        } finally {
            if (conn != null) {
                conn.close();

            }

        }
        ArrayList<ArrayList<String>> returnList = new ArrayList<ArrayList<String>>();
        returnList.add(first);
        returnList.add(last);
        returnList.add(dob);
        return returnList;

    }
}
