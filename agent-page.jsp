<%@ page import="java.sql.*" %>
<%@ page language="java" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Manage Agents</title>
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

                String aname = request.getParameter("aname");
                int age = Integer.parseInt(request.getParameter("age"));
                String address = request.getParameter("address");
              int experience = Integer.parseInt(request.getParameter("experience"));
                String phone = request.getParameter("phone");

                // Execute the SQL INSERT statement to add a company
                // Customize this SQL statement according to your database schema
                String insertSQL = "INSERT INTO agenttbl (aname,age, address, experience, phone) VALUES (?, ?, ?, ?,?)";
                pstmt = conn.prepareStatement(insertSQL);
                pstmt.setString(1, aname);
                pstmt.setInt(2, age);
                pstmt.setString(3, address);
                pstmt.setInt(4, experience);
                pstmt.setString(5, phone);

                int rowsInserted = pstmt.executeUpdate();

                if (rowsInserted > 0) {
                    out.println("Agent added successfully.");
                } else {
                    out.println("Failed to add agent.");
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
