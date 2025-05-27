package servicesystem;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/DeleteAccountServlet")
public class DeleteAccountServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String email = (String) session.getAttribute("userEmail");
        String reason = request.getParameter("reason");

        if (email == null) {
            response.sendRedirect("signin.jsp?error=You must be logged in to delete your account!");
            return;
        }

        if (reason == null || reason.trim().isEmpty()) {
            response.sendRedirect("deleteAccount.jsp?error=Please provide a reason for account deletion!");
            return;
        }

        try (Connection con = DatabaseUtil.getConnection()) {
            // Step 1: Store the delete reason
            String insertQuery = "INSERT INTO user_delete (email, reason) VALUES (?, ?)";
            PreparedStatement ps = con.prepareStatement(insertQuery);
            ps.setString(1, email);
            ps.setString(2, reason);
            ps.executeUpdate();

            // Step 2: Delete the user account
            String deleteQuery = "DELETE FROM users WHERE email = ?";
            PreparedStatement psDelete = con.prepareStatement(deleteQuery);
            psDelete.setString(1, email);
            int deletedRows = psDelete.executeUpdate();

            if (deletedRows > 0) {
                // Step 3: Invalidate session
                session.invalidate();
                response.sendRedirect("index.jsp?success=Your account has been deleted successfully!");
            } else {
                response.sendRedirect("deleteAccount.jsp?error=Account deletion failed. Please try again!");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("deleteAccount.jsp?error=Something went wrong. Try again later!");
        }
    }
}
