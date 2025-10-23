<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.funfit.pojo.User" %>
<!DOCTYPE html>
<html>
<head>
    <title>Dashboard - Funfit</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
    <div class="container">
        <center>
            <h2>Welcome to Funfit</h2><br>
        </center>
        <%
            User user = (User) session.getAttribute("user");
            if (user == null) {
                response.sendRedirect("login.jsp");
                return;
            }
        %>
        <h3>Welcome, <%= user.getName() %>!</h3>
        
        <a href="displaySlots.jsp">Display All Slots</a>
        <a href="profile.jsp">My Profile</a>
        <a href="logout.jsp">Logout</a>
        <%-- <p><strong>ID:</strong> <%= user.getId() %></p>
        <p><strong>Email:</strong> <%= user.getEmail() %></p>
        <p><strong>Mobile:</strong> <%= user.getMobile() %></p>
        <p><strong>Age:</strong> <%= user.getAge() %></p>
        <p><strong>Weight:</strong> <%= user.getWeight() %> kg</p>
        <p><strong>Address:</strong> <%= user.getAddress() %></p>
        <a href="display.jsp" class="btn btn-primary">View All Users</a>
        <a href="logout.jsp" class="btn btn-danger">Logout</a> --%>
    </div>
</body>
</html>