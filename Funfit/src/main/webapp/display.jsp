<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.funfit.dao.UserDAO" %>
<%@ page import="com.funfit.pojo.User" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <title>User List - Funfit</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
    <div class="container">
        <center>
            <h2>User List</h2><br>
            <p>Below is the list of registered users</p>
        </center>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Mobile</th>
                    <th>Age</th>
                    <th>Weight (kg)</th>
                    <th>Email</th>
                    <th>Password</th>
                    <th>Address</th>
                </tr>
            </thead>
            <tbody>
                <%
                    try {
                        UserDAO dao = new UserDAO();
                        List<User> users = dao.retreiveUserData();
                        if (users.isEmpty()) {
                            out.println("<tr><td colspan='8' class='text-center'>No users found.</td></tr>");
                        } else {
                            for (User user : users) {
                %>
                <tr>
                    <td><%= user.getId() %></td>
                    <td><%= user.getName() %></td>
                    <td><%= user.getMobile() %></td>
                    <td><%= user.getAge() %></td>
                    <td><%= user.getWeight() %></td>
                    <td><%= user.getEmail() %></td>
                    <td><%= user.getPassword() %></td>
                    <td><%= user.getAddress() %></td>
                </tr>
                <%
                            }
                        }
                    } catch (Exception e) {
                        out.println("<tr><td colspan='8' class='text-danger'>Error: " + e.getMessage() + "</td></tr>");
                        e.printStackTrace();
                    }
                %>
            </tbody>
        </table>
        <a href="index.jsp" class="btn btn-primary">Back to Registration</a>
    </div>
</body>
</html>