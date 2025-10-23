<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.funfit.dao.SlotsDAO" %>
<%@ page import="com.funfit.pojo.Slots" %>
<%@ page import="com.funfit.pojo.User" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <title>Slots List - Funfit</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
    <div class="container">
        
        <%
            User user = (User) session.getAttribute("user");
            if (user == null) {
                response.sendRedirect("login.jsp");
                return;
            }
        %>
        
        <center>
            <h2>Slots List</h2><br>
            <p>Below is the list of available slots</p>
        </center>
        <%
            String error = (String) session.getAttribute("error");
            if (error != null) {
                out.println("<div class='alert alert-danger'>" + error + "</div>");
                session.removeAttribute("error");
            }
            String message = (String) session.getAttribute("message");
            if (message != null) {
                out.println("<div class='alert alert-success'>" + message + "</div>");
                session.removeAttribute("message");
            }
        %>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Date</th>
                    <th>Time</th>
                    <th>Available Seats</th>
                    <th>Register</th>
                </tr>
            </thead>
            <tbody>
                <%
                    try {
                        SlotsDAO dao = new SlotsDAO();
                        List<Slots> slots = dao.retrieveAllSlots();
                        if (slots.isEmpty()) {
                            out.println("<tr><td colspan='5' class='text-center'>No slots found.</td></tr>");
                        } else {
                            for (Slots slot : slots) {
                %>
                <tr>
                    <td><%= slot.getId() %></td>
                    <td><%= slot.getDate() %></td>
                    <td><%= slot.getTime() %></td>
                    <td><%= slot.getCount() %></td>
                    <td>
                        <% if (slot.getCount() > 0) { %>
                            <a href="registerSlot.jsp?slotId=<%= slot.getId() %>" class="btn btn-success btn-sm">Register</a>
                        <% } else { %>
                            <span class="text-danger">No seats available</span>
                        <% } %>
                    </td>
                </tr>
                <%
                            }
                        }
                    } catch (Exception e) {
                        out.println("<tr><td colspan='5' class='text-danger'>Error: " + e.getMessage() + "</td></tr>");
                        e.printStackTrace();
                    }
                %>
            </tbody>
        </table>
        <a href="addSlot.jsp" class="btn btn-primary">Add New Slot</a>
        <a href="dashboard.jsp" class="btn btn-default">Back to Dashboard</a>
    </div>
</body>
</html>