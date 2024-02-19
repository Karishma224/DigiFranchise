<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login</title>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");

String Name = request.getParameter("Name");
String password = request.getParameter("password");

try {
    // Load the JDBC driver
    Class.forName("com.mysql.jdbc.Driver");

    // Establish a database connection
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/karishma", "root", "12345");

    // Prepare the SQL query
    String query = "SELECT * FROM candidate WHERE Name = ? AND Password = ?";
    PreparedStatement preparedStatement = con.prepareStatement(query);
    preparedStatement.setString(1, Name);
    preparedStatement.setString(2, password);

    // Execute the query
    ResultSet resultSet = preparedStatement.executeQuery();

    if (resultSet.next()) {
        // Successful login
        response.sendRedirect("candidatedisplay.jsp");
    } else {
        // Invalid credentials
        response.getWriter().println("Invalid credentials. Please try again.");
    }

    // Close resources
    resultSet.close();
    preparedStatement.close();
    con.close();
} catch (Exception e) {
    response.getWriter().println("An error occurred: " + e.getMessage());
    e.printStackTrace();
}
%>
</body>
</html>
