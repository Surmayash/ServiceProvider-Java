package servicesystem;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/ChangePasswordServlet")
public class ChangePasswordServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String email = (String) session.getAttribute("userEmail");
        String currentPassword = request.getParameter("currentPassword");
        String newPassword = request.getParameter("newPassword");
        String confirmPassword = request.getParameter("confirmPassword");

        if (email == null) {
            response.sendRedirect("login.jsp?error=notLoggedIn");
            return;
        }

        if (!newPassword.equals(confirmPassword)) {
            response.sendRedirect("setting.jsp?error=New password and confirm password do not match!");
            return;
        }

        try (Connection con = DatabaseUtil.getConnection()) {
            // Step 1: Fetch the current password from the database
            String checkQuery = "SELECT password FROM users WHERE email = ?";
            PreparedStatement psCheck = con.prepareStatement(checkQuery);
            psCheck.setString(1, email);
            ResultSet rs = psCheck.executeQuery();

            if (rs.next()) {
                String dbPassword = rs.getString("password");

                // Step 2: Check if the current password is correct
                if (!dbPassword.equals(currentPassword)) {
                    response.sendRedirect("setting.jsp?error=Current password is incorrect!");
                    return;
                }

                // Step 3: Check if the new password is the same as the old password
                if (dbPassword.equals(newPassword)) {
                    response.sendRedirect("setting.jsp?error=New password cannot be the same as the old password!");
                    return;
                }

                // Step 4: Update the password
                String updateQuery = "UPDATE users SET password = ? WHERE email = ?";
                PreparedStatement psUpdate = con.prepareStatement(updateQuery);
                psUpdate.setString(1, newPassword);
                psUpdate.setString(2, email);
                psUpdate.executeUpdate();

                response.sendRedirect("setting.jsp?success=Password changed successfully!");
            } else {
                response.sendRedirect("setting.jsp?error=User not found!");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("setting.jsp?error=Something went wrong!");
        }
    }
}
