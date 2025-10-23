<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.funfit.dao.UserDAO" %>
<%@ page import="com.funfit.pojo.User" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Processing Login</title>
</head>
<body>
    <%
        try {
            String email = request.getParameter("email");
            String password = request.getParameter("pwd");

            // Server-side validation
            if (email == null || email.trim().isEmpty()) {
                session.setAttribute("error", "Email is required.");
                response.sendRedirect("login.jsp");
                return;
            }
            if (password == null || password.trim().isEmpty()) {
                session.setAttribute("error", "Password is required.");
                response.sendRedirect("login.jsp");
                return;
            }

            UserDAO dao = new UserDAO();
            User user = dao.validateUser(email, password);

            if (user != null) {
                // Store user in session for use in dashboard
                session.setAttribute("user", user);
                response.sendRedirect("dashboard.jsp");
            } else {
                session.setAttribute("error", "Invalid email or password.");
                response.sendRedirect("login.jsp");
            }
        } catch (Exception e) {
            session.setAttribute("error", "Error: " + e.getMessage());
            response.sendRedirect("login.jsp");
            e.printStackTrace();
        }
    %>
</body>
</html>