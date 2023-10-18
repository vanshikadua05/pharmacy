<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Medicine List</title>
    <style>
        body {
            background-image: url('table.jpg');
            background-size: cover;
            background-repeat: no-repeat;
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        h1 {
            text-align: center;
            margin-top: 20px;
            color:#6e95c1;
        }
        table {
            margin: 0 auto;
            border-collapse: collapse;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 5px;
        }
        th, td {
            padding: 10px;
            text-align: center;
            border-bottom: 1px solid #ccc;
        }
        th {
            background-color:#6e95c1;
            color: #fff;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        tr:nth-child(odd) {
            background-color: #e0e0e0;
        }
    </style>
</head>
<body>
    <h1>Company List</h1>
    <table border="1">
        <tr>
            
            <th>Company Name</th>
            <th>Address</th>
            <th> Experience</th>
            <th> Phone</th>
            
        </tr>
        <%
            String dbUrl = "jdbc:derby://localhost:1527/pharma";
        String dbUser = "vanshika";
        String dbPassword = "vanshika";

        Connection connection = null;
        PreparedStatement pstmt = null;
            try {
                Class.forName("org.apache.derby.jdbc.ClientDriver");
                
                 connection = DriverManager.getConnection("jdbc:derby://localhost:1527/pharma", "vanshika", "vanshika");

                String query = "SELECT * FROM companytbl";

                Statement statement = connection.createStatement();
                ResultSet resultSet = statement.executeQuery(query);

                while (resultSet.next()) {
                    out.println("<tr>");
                    out.println("<td>" + resultSet.getString("compname") + "</td>");
                    out.println("<td>" + resultSet.getString("address") + "</td>");
                    out.println("<td>" + resultSet.getString("experience") + "</td>");
                    
                    out.println("<td>" + resultSet.getString("phone") + "</td>");
                    out.println("</tr>");
                }

                resultSet.close();
                statement.close();
                connection.close();

            } catch (Exception e) {
                out.println("<p>Error: " + e.getMessage() + "</p>");
            }
        %>
    </table>
</body>
</html>
