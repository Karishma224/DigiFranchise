package Servlet;
import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/Registration")
public class Registration extends HttpServlet implements Serializable {
    private static final long serialVersionUID = 1L; // SerialVersionUID

    private static final String DB_URL = "jdbc:mysql://localhost:3307/karishma";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "12345";

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String Name = request.getParameter("Name");
        String dob = request.getParameter("dob");
        String gender = request.getParameter("gender");
        String AadharNo = request.getParameter("AadharNo");
        String district = request.getParameter("district");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String[] check = request.getParameterValues("modePost");
        String password = request.getParameter("password");
        String repassword = request.getParameter("repassword");
       //System. out.println(Name);
       

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

            String insertQuery = "INSERT INTO register(Name, Date_of_Birth, Gender, Aadhar_No,District,Phone,Current_Address,Modepost,Password,Retype_password) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement preparedStatement = conn.prepareStatement(insertQuery);
            preparedStatement .setString(1, Name);
            preparedStatement .setString(2, dob);
            preparedStatement .setString(3, gender);
            preparedStatement .setString(4, AadharNo);
            preparedStatement .setString(5, district);
            preparedStatement .setString(6, phone);
            preparedStatement .setString(7, address);
            preparedStatement .setString(8, String.join(",", check));
            preparedStatement .setString(9, password);
            preparedStatement .setString(10, repassword);
            preparedStatement.executeUpdate();
            preparedStatement.close();
            conn.close();

            // Redirect to the success page
            response.sendRedirect("welcome.html");
        } catch (Exception e) {
            e.printStackTrace();
            // Handle the exception and redirect to an error page if needed
        }
    }
}
