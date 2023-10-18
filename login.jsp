<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

    
    <%
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        if (username != null && password != null) {
            if (username.equals("vanshika") && password.equals("vanshika")) {
                // Redirect to the welcome page if the username and password are correct
                response.sendRedirect("welcome.html");
            } else {
                out.println("<p>Incorrect username or password. Please try again.</p>");
            }
        }
    %>
</body>
</html>
