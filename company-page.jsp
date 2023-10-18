<%@ page import="java.sql.*" %>
<%@ page language="java" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Manage Company</title>
</head>

<body>
    <%
        //String action = request.getParameter("action"); // Get the action parameter from the form

        // Database connection settings
        String dbUrl = "jdbc:derby://localhost:1527/pharma";
        String dbUser = "vanshika";
        String dbPassword = "vanshika";

        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            // Load the Derby JDBC driver
            Class.forName("org.apache.derby.jdbc.ClientDriver");

            // Establish a database connection
            conn = DriverManager.getConnection("jdbc:derby://localhost:1527/pharma", "vanshika", "vanshika");

           
                // Process the "Add Company" action
                // Customize this part to handle adding companies

                String compname = request.getParameter("compname");
                String address = request.getParameter("address");
                String experience = request.getParameter("experience");
                String phone = request.getParameter("phone");

                // Execute the SQL INSERT statement to add a company
                // Customize this SQL statement according to your database schema
                String insertSQL = "INSERT INTO companytbl (compname, address, experience, phone) VALUES (?, ?, ?, ?)";
                pstmt = conn.prepareStatement(insertSQL);
                pstmt.setString(1, compname);
                pstmt.setString(2, address);
                pstmt.setString(3, experience);
                pstmt.setString(4, phone);

                int rowsInserted = pstmt.executeUpdate();

                if (rowsInserted > 0) {
                    out.println("Company added successfully.");
                } else {
                    out.println("Failed to add company.");
                }
            
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // Close resources
            if (pstmt != null) pstmt.close();
            if (conn != null) conn.close();
        }
    %>
</body>
</html>
