<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Manage Medicine</title>
</head>
<body>
    <%
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

            // Get medicine data from the request parameters (assuming you have a form)
             int id = Integer.parseInt(request.getParameter("id"));
            String medname = request.getParameter("medname");
            double price = Double.parseDouble(request.getParameter("price"));
            String manudate = request.getParameter("manudate");
            String expdate = request.getParameter("expdate");
            String company = request.getParameter("company");

            // Prepare an SQL INSERT statement
            String insertSQL = "INSERT INTO medicinetbl (id,medname, price, manudate, expdate, company) VALUES (?, ?, ?, ?, ?,?)";

            // Create a PreparedStatement
            pstmt = conn.prepareStatement(insertSQL);
             pstmt.setInt(1, id);
            pstmt.setString(2, medname);
            pstmt.setDouble(3, price);
            pstmt.setString(4, manudate);
            pstmt.setString(5, expdate);
            pstmt.setString(6, company);

            // Execute the INSERT statement
            int rowsInserted = pstmt.executeUpdate();

            if (rowsInserted > 0) {
                out.println("Medicine added successfully.");
            } else {
                out.println("Failed to add medicine.");
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
