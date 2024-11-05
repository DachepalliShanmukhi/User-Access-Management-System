<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Create Software</title>
</head>
<body>
    <h2>Create New Software</h2>
    <form action="SoftwareServlet" method="post">
        <label>Software Name:</label>
        <input type="text" name="name" required><br><br>

        <label>Description:</label>
        <textarea name="description" required></textarea><br><br>

        <label>Access Levels:</label><br>
        <input type="checkbox" name="accessLevels" value="Read"> Read<br>
        <input type="checkbox" name="accessLevels" value="Write"> Write<br>
        <input type="checkbox" name="accessLevels" value="Admin"> Admin<br><br>

        <button type="submit">Create Software</button>
    </form>

    <% if (request.getParameter("error") != null) { %>
        <p style="color:red;">Error: <%= request.getParameter("error") %></p>
    <% } else if (request.getParameter("success") != null) { %>
        <p style="color:green;">Software added successfully!</p>
    <% } %>
</body>
</html>
