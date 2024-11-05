<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*,java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Pending Access Requests</title>
</head>
<body>
    <h2>Pending Access Requests</h2>
    <form action="ApprovalServlet" method="post">
        <table border="1">
            <tr>
                <th>Employee Name</th>
                <th>Software Name</th>
                <th>Access Type</th>
                <th>Reason</th>
                <th>Action</th>
            </tr>
            <% 
                Connection conn = DatabaseConnection.getConnection();
                Statement stmt = conn.createStatement();
                String query = "SELECT r.id, u.username, s.name, r.access_type, r.reason " +
                               "FROM requests r JOIN users u ON r.user_id = u.id " +
                               "JOIN software s ON r.software_id = s.id WHERE r.status = 'Pending'";
                ResultSet rs = stmt.executeQuery(query);

                while (rs.next()) {
                    int requestId = rs.getInt("id");
                    String username = rs.getString("username");
                    String softwareName = rs.getString("name");
                    String accessType = rs.getString("access_type");
                    String reason = rs.getString("reason");
            %>
            <tr>
                <td><%= username %></td>
                <td><%= softwareName %></td>
                <td><%= accessType %></td>
                <td><%= reason %></td>
                <td>
                    <button type="submit" name="action" value="approve_<%= requestId %>">Approve</button>
                    <button type="submit" name="action" value="reject_<%= requestId %>">Reject</button>
                </td>
            </tr>
            <% 
                }
                conn.close();
            %>
        </table>
    </form>

    <% if (request.getParameter("error") != null) { %>
        <p style="color:red;">Error: <%= request.getParameter("error") %></p>
    <% } else if (request.getParameter("success") != null) { %>
        <p style="color:green;">Request updated successfully!</p>
    <% } %>
</body>
</html>
