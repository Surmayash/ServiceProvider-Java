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
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@WebServlet("/UpdateProfileServlet")
@MultipartConfig(maxFileSize = 16177215) 
public class UpdateProfileServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String email = (String) session.getAttribute("userEmail"); 

        // Get updated details from form
        String firstName = request.getParameter("first_name");
        String lastName = request.getParameter("last_name");
        String contact = request.getParameter("contact");
        String address = request.getParameter("address");
        String city = request.getParameter("city");
        String pinCode = request.getParameter("pin_code");
        String state = request.getParameter("state");
        String country = request.getParameter("country");
        Part filePart = request.getPart("photo");

        if (email == null) {
            response.sendRedirect("signin.jsp?error=Please log in first!");
            return;
        }

        try (Connection con = DatabaseUtil.getConnection()) {
            String sql;
            PreparedStatement ps;

            if (filePart != null && filePart.getSize() > 0) {
                InputStream inputStream = filePart.getInputStream();
                sql = "UPDATE users SET first_name=?, last_name=?, contact=?, address=?, city=?, pin_code=?, state=?, country=?, photo=? WHERE email=?";
                ps = con.prepareStatement(sql);
                
                ps.setString(1, firstName);
                ps.setString(2, lastName);
                ps.setString(3, contact);
                ps.setString(4, address);
                ps.setString(5, city);
                ps.setString(6, pinCode);
                ps.setString(7, state);
                ps.setString(8, country);
                ps.setBlob(9, inputStream);
                ps.setString(10, email);
            } else {
                sql = "UPDATE users SET first_name=?, last_name=?, contact=?, address=?, city=?, pin_code=?, state=?, country=? WHERE email=?";
                ps = con.prepareStatement(sql);
                
                ps.setString(1, firstName);
                ps.setString(2, lastName);
                ps.setString(3, contact);
                ps.setString(4, address);
                ps.setString(5, city);
                ps.setString(6, pinCode);
                ps.setString(7, state);
                ps.setString(8, country);
                ps.setString(9, email);
            }

            int rowsUpdated = ps.executeUpdate();
            if (rowsUpdated > 0) {
                // Update session attributes to reflect changes instantly
                session.setAttribute("firstName", firstName);
                session.setAttribute("lastName", lastName);
                session.setAttribute("userContact", contact);
                session.setAttribute("userAddress", address);
                session.setAttribute("userCity", city);
                session.setAttribute("userPincode", pinCode);
                session.setAttribute("userState", state);
                session.setAttribute("userCountry", country);
                
                if (filePart != null && filePart.getSize() > 0) {
                    session.setAttribute("userPhotoUpdated", true);
                }

                response.sendRedirect("profile.jsp?success=Profile updated successfully!");
            } else {
                response.sendRedirect("profile.jsp?error=Profile update failed. Try again!");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("profile.jsp?error=Something went wrong. Please try again!");
        }
    }
}
