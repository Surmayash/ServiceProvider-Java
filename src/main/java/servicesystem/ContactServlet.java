package servicesystem;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ContactServlet")
public class ContactServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String message = request.getParameter("message");

        if (email == null || email.isEmpty() || message == null || message.isEmpty()) {
            response.sendRedirect("setting.jsp?error=Email and message are required!");
            return;
        }

        try (Connection con = DatabaseUtil.getConnection()) {
            String sql = "INSERT INTO user_queries (email, message) VALUES (?, ?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, message);

            int rowsInserted = ps.executeUpdate();
            if (rowsInserted > 0) {
                response.sendRedirect("setting.jsp?success=Your query has been submitted successfully!");
            } else {
                response.sendRedirect("setting.jsp?error=Failed to submit your query. Please try again!");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("setting.jsp?error=Something went wrong. Try again later!");
        }
    }
}

