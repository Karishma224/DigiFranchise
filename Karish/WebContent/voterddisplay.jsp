<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Candidate List</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            margin: 0;
            padding: 0;
        }

        h2 {
            text-align: center;
            margin-top: 20px;
        }

        table {
            border-collapse: collapse;
            width: 80%;
            margin: 20px auto;
            background-color: #fff;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }

        th {
            background-color: #007bff;
            color: #fff;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        tr:hover {
            background-color: #ddd;
        }
    </style>
</head>
<body>
    <h2>Voter List</h2>
    <table border="1">
        <tr>
            <th>Name</th>
            <th>Date_of_Birth</th>
            <th>Gender</th>
            <th>Aadhar_no</th>
            <th>District</th>
            <th>Phone</th>
            <th>Current_Address</th>
            <th>Modepost</th>
            <th>Password</th>
            <th>Retype_password</th>
        </tr>
        <%
        String url = "jdbc:mysql://localhost:3307/karishma"; // Replace with your database name
        String username = "root"; // Replace with your database username
        String password = "12345"; // Replace with your database password
        try {
            // Load the JDBC driver and establish a database connection
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection(url, username, password);

            // Prepare the SQL query to fetch data from the table
            String query = "SELECT * FROM register";
            Statement statement = con.createStatement();
            ResultSet resultSet = statement.executeQuery(query);

            // Iterate through the result set and display data in the table
            while (resultSet.next()) {
        %>
        <tr>
            <td><%= resultSet.getString("Name") %></td>
            <td><%= resultSet.getString("Date_of_Birth") %></td>
            <td><%= resultSet.getString("Gender") %></td>
            <td><%= resultSet.getString("Aadhar_no") %></td>
            <td><%= resultSet.getString("District") %></td>
            <td><%= resultSet.getString("Phone") %></td>
            <td><%= resultSet.getString("Current_Address") %></td>
            <td><%= resultSet.getString("Modepost") %></td>
            <td><%= resultSet.getString("Password") %></td>
            <td><%= resultSet.getString("Retype_password") %></td>
        </tr>
        <%
            }
            
            // Close resources
            resultSet.close();
            statement.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        %>
    </table>
</body>
</html>
