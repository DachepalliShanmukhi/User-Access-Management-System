@WebServlet("/SignUpServlet")
public class SignUpServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String role = "Employee"; // Default role

        // Database connection and user insertion logic
        try (Connection conn = DatabaseConnection.getConnection()) {
            String sql = "INSERT INTO users (username, password, role) VALUES (?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, username);
            stmt.setString(2, password);
            stmt.setString(3, role);
            stmt.executeUpdate();
            response.sendRedirect("login.jsp");
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("signup.jsp?error=Unable to sign up");
        }
    }
}
