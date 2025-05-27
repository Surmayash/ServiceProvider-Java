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
import java.util.Base64;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String email = request.getParameter("email");
		String password = request.getParameter("password");

		try {
			Connection conn = DatabaseUtil.getConnection();
			String query = "SELECT * FROM users WHERE email=? AND password=?";
			PreparedStatement pstmt = conn.prepareStatement(query);
			pstmt.setString(1, email);
			pstmt.setString(2, password);
			ResultSet rs = pstmt.executeQuery();

			if (rs.next()) {
				HttpSession session = request.getSession();
				session.setAttribute("userEmail", rs.getString("email"));
				session.setAttribute("firstName", rs.getString("first_name"));
				session.setAttribute("lastName", rs.getString("last_name"));
				session.setAttribute("userContact", rs.getString("contact"));
				session.setAttribute("userAddress", rs.getString("address"));
				session.setAttribute("userCity", rs.getString("city"));
				session.setAttribute("userPincode", rs.getString("pin_code"));
				session.setAttribute("userCountry", rs.getString("country"));
				session.setAttribute("userState", rs.getString("state"));

				byte[] imgData = rs.getBytes("photo");
				if (imgData != null) {
					String encodedImage = Base64.getEncoder().encodeToString(imgData);
					session.setAttribute("userPhoto", encodedImage);
				} else {
					session.setAttribute("userPhoto", "");
				}

				response.sendRedirect("userDash.jsp");
			} else {
				response.sendRedirect("signin.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect("login.jsp?error=Something went wrong");
		}
	}
}
