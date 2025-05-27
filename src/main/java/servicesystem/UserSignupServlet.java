package servicesystem;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet("/SignupServlet")
@MultipartConfig(maxFileSize = 16177215)
public class UserSignupServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String firstName = request.getParameter("first_name");
        String lastName = request.getParameter("last_name");
        String email = request.getParameter("email");
        String contact = request.getParameter("contact");
        String password = request.getParameter("password");
        String address = request.getParameter("address");
        String city = request.getParameter("city");
        String pinCode = request.getParameter("pin_code");
        String country = request.getParameter("country");
        String state = request.getParameter("state");
        Part photo = request.getPart("photo");
        
        InputStream inputStream = null;
        if (photo != null) {
            inputStream = photo.getInputStream();
        }

        try (Connection conn = DatabaseUtil.getConnection()) {
            String sql = "INSERT INTO users (first_name, last_name, email, contact, password, address, city, pin_code, country, state, photo) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, firstName);
            stmt.setString(2, lastName);
            stmt.setString(3, email);
            stmt.setString(4, contact);
            stmt.setString(5, password);
            stmt.setString(6, address);
            stmt.setString(7, city);
            stmt.setString(8, pinCode);
            stmt.setString(9, country);
            stmt.setString(10, state);
            
            if (inputStream != null) {
                stmt.setBlob(11, inputStream);
            } else {
                stmt.setNull(11, java.sql.Types.BLOB);
            }

            int row = stmt.executeUpdate();
            if (row > 0) {
            	response.sendRedirect("signin.jsp");
            } else {
                response.sendRedirect("signup.jsp?error=Signup failed. Try again!");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("signup.jsp?error=Something went wrong. Please try again!");
        } finally {
            if (inputStream != null) {
                inputStream.close();
            }
        }
    }
}
