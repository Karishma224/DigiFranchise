package Servlet;
import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/Voting")
public class Voting extends HttpServlet implements Serializable {
    private static final long serialVersionUID = 1L; // SerialVersionUID

    private static final String DB_URL = "jdbc:mysql://localhost:3307/karishma";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "12345";

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String name = request.getParameter("name");
        
        String candidate = request.getParameter("candidate");
       System. out.println(name);
       

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

            String insertQuery = "INSERT INTO votes(name, candidate) VALUES (?, ?)";
            PreparedStatement preparedStatement = conn.prepareStatement(insertQuery);
            preparedStatement .setString(1, name);
            preparedStatement .setString(2, candidate);
            preparedStatement.executeUpdate();
            preparedStatement.close();
            conn.close();

            // Redirect to the success page
            response.sendRedirect("New.html");
        } catch (Exception e) {
            e.printStackTrace();
            // Handle the exception and redirect to an error page if needed
        }
    }
}
