@WebServlet("/ApprovalServlet")
public class ApprovalServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String requestId = request.getParameter("requestId");
        String action = request.getParameter("action");

        try (Connection conn = DatabaseConnection.getConnection()) {
            String status = action.equals("approve") ? "Approved" : "Rejected";
            String sql = "UPDATE requests SET status = ? WHERE id = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, status);
            stmt.setInt(2, Integer.parseInt(requestId));
            stmt.executeUpdate();
            response.sendRedirect("pendingRequests.jsp?success=Request updated");
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("pendingRequests.jsp?error=Unable to update request");
        }
    }
}
