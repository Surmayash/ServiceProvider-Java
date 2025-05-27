package servicesystem;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;

@WebServlet("/FetchMessagesServlet")
public class FetchMessagesServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String receiver = request.getParameter("receiver");
        String sender = (String) request.getSession().getAttribute("userEmail");

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/service_system", "root", "vipin0987654321");

            String query = "SELECT sender_name, message FROM messages WHERE (sender_name=? AND receiver_name=?) OR (sender_name=? AND receiver_name=?) ORDER BY timestamp";
            PreparedStatement pst = con.prepareStatement(query);
            pst.setString(1, sender);
            pst.setString(2, receiver);
            pst.setString(3, receiver);
            pst.setString(4, sender);
            ResultSet rs = pst.executeQuery();

            while (rs.next()) {
                String senderName = rs.getString("sender_name");
                String message = rs.getString("message");
                out.println("<div><b>" + senderName + ":</b> " + message + "</div>");
            }
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
