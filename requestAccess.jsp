<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*,java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Request Access</title>
</head>
<body>
    <h2>Request Access to Software</h2>
    <form action="RequestServlet" method="post">
        <label>Software Name:</label>
        <select name="softwareId" required>
            <% 
                Connection conn = DatabaseConnection.getConnection();
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery("SELECT id, name FROM software");
                while (rs.next()) {
                    int id = rs.getInt("id");
                    String name = rs.getString("name");
            %>
            <option value="<%= id %>"><%= name %></option>
            <% 
                }
                conn.close();
            %>
        </select><br><br>

        <label>Access Type:</label>
        <select name="accessType" required>
            <option value="Read">Read</option>
            <option value="Write">Write</option>
            <option value="Admin">Admin</option>
        </select><br><br>

        <label>Reason for Request:</label>
        <textarea name="reason" required></textarea><br><br>

        <button type="submit">Request Access</button>
    </form>

    <% if (request.getParameter("error") != null) { %>
        <p style="color:red;">Error: <%= request.getParameter("error") %></p>
    <% } else if (request.getParameter("success") != null) { %>
        <p style="color:green;">Request submitted successfully!</p>
    <% } %>
</body>
</html>
