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
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
        }

        h2 {
            text-align: center;
            margin: 20px 0;
            color: #007bff;
        }

        table {
            border-collapse: collapse;
            width: 80%;
            max-width: 800px;
            background-color: #fff;
            border: 1px solid #ddd;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        th, td {
            border: 1px solid #ddd;
            padding: 12px;
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
    <h2>Candidate List</h2>
    <table>
        <tr>
            <th>Name</th>
            <th>Age</th>
            <th>Date of Birth</th>
            <th>Gender</th>
            <th>Party</th>
            <th>Aadhar No</th>
            <th>Password</th>
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
            String query = "SELECT * FROM candidate";
            Statement statement = con.createStatement();
            ResultSet resultSet = statement.executeQuery(query);

            // Iterate through the result set and display data in the table
            while (resultSet.next()) {
        %>
        <tr>
            <td><%= resultSet.getString("Name") %></td>
            <td><%= resultSet.getString("Age") %></td>
            <td><%= resultSet.getString("Dob") %></td>
            <td><%= resultSet.getString("Gender") %></td>
            <td><%= resultSet.getString("Party") %></td>
            <td><%= resultSet.getString("Aadhar") %></td>
            <td><%= resultSet.getString("Password") %></td>
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
