<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Sign Up</title>
</head>
<body>
    <h2>Sign Up</h2>
    <form action="SignUpServlet" method="post">
        <label>Username:</label>
        <input type="text" name="username" required><br><br>

        <label>Password:</label>
        <input type="password" name="password" required><br><br>

        <button type="submit">Sign Up</button>
    </form>
    
    <% if (request.getParameter("error") != null) { %>
        <p style="color:red;">Error: <%= request.getParameter("error") %></p>
    <% } %>
</body>
</html>
