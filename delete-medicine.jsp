<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Delete Medicine</title>
    <script type="text/javascript">
        function showAlert(message) {
            alert(message);
        }
    </script>
</head>
<body>
    <%
        // Database connection settings
        String dbUrl = "jdbc:derby://localhost:1527/pharma";
        String dbUser = "vanshika";
        String dbPassword = "vanshika";

        Connection conn = null;
        PreparedStatement pstmt = null;
            int medid=0;
         try {
            medid = Integer.parseInt(request.getParameter("id"));
        } catch (NumberFormatException e) {
            out.println("<h1>Invalid medicine ID provided.</h1>");
        }

        if (medid > 0) {
            try {
                // Step 2: Connect to the database (you need to configure your database connection)
                Class.forName("org.apache.derby.jdbc.ClientDriver");

            // Establish a database connection
            conn = DriverManager.getConnection("jdbc:derby://localhost:1527/pharma", "vanshika", "vanshika"); // Replace with your database connection code

                // Step 3: Execute the SQL DELETE statement
                String deleteSQL = "DELETE FROM medicinetbl WHERE id = ?";
                PreparedStatement preparedStatement = conn.prepareStatement(deleteSQL);
                preparedStatement.setInt(1, medid);
                int rowsAffected = preparedStatement.executeUpdate();
                
                // Check if any rows were deleted
                if (rowsAffected > 0) {
                   String successMessage = "Medicine with ID " + medid + " has been deleted.";
                    out.println("<h1>" + successMessage + "</h1>");
                    // Display the message in a JavaScript alert
                    out.println("<script>showAlert('" + successMessage + "');</script>");
                } else {
                    out.println("<h1>Medicine not found or could not be deleted.</h1>");
                }

                // Step 4: Close the database resources
                preparedStatement.close();
                conn.close();

            } catch (Exception e) {
                out.println("<h1>Error: " + e.getMessage() + "</h1>");
            }
        }
    %>
    
    
  
    
</body>
</html>
