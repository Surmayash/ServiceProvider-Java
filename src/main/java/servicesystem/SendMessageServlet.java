package servicesystem;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/SendMessageServlet")
public class SendMessageServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String sender = request.getParameter("sender");
        String receiver = request.getParameter("receiver");
        String message = request.getParameter("message");

        // Check if parameters are received correctly
        System.out.println("Sender: " + sender);
        System.out.println("Receiver: " + receiver);
        System.out.println("Message: " + message);

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/service_system", "root", "vipin0987654321");

            // Check if the connection is successful
            if (con != null) {
                System.out.println("Database connected successfully!");
            }

            String query = "INSERT INTO messages (sender_name, receiver_name, message) VALUES (?, ?, ?)";
            PreparedStatement pst = con.prepareStatement(query);
            pst.setString(1, sender);
            pst.setString(2, receiver);
            pst.setString(3, message);

            int rowsAffected = pst.executeUpdate();

            // Check if data is inserted
            if (rowsAffected > 0) {
                System.out.println("Message stored successfully!");
            } else {
                System.out.println("Message insertion failed!");
            }

            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

