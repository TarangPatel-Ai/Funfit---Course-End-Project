<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.funfit.dao.SlotsDAO, com.funfit.pojo.Slots, com.funfit.pojo.User, java.util.List" %>


<!DOCTYPE html>
<html>
<head>
    <title>Register for Slot - Funfit</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <style>
        .slot-card {
            border: 1px solid #ddd;
            border-radius: 8px;
            padding: 15px;
            margin-bottom: 15px;
            background: #f9f9f9;
        }
        .slot-card h4 {
            margin-top: 0;
            color: #337ab7;
        }
        .btn-register {
            margin-top: 10px;
        }
    </style>
</head>
<body>

<div class="container">
    <%
        // Already checked in processRegisterSlot.jsp, but safe to double-check
        User user = (User) session.getAttribute("user");
        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }
    %>

    <h2 class="text-center">Choose a Slot to Register</h2>
    <p class="text-center">Hello <strong><%= user.getName() %></strong> (<%= user.getEmail() %>)</p>

    <!-- Flash Messages -->
    <%
        String msg = (String) session.getAttribute("msg");
        String err = (String) session.getAttribute("err");
        if (msg != null) {
            out.println("<div class='alert alert-success text-center'><strong>Success!</strong> " + msg + "</div>");
            session.removeAttribute("msg");
        }
        if (err != null) {
            out.println("<div class='alert alert-danger text-center'><strong>Error!</strong> " + err + "</div>");
            session.removeAttribute("err");
        }
    %>

    <div class="row">
        <%
            SlotsDAO slotsDAO = new SlotsDAO();
            List<Slots> slots = slotsDAO.retrieveAllSlots();
            if (slots.isEmpty()) {
        %>
            <div class="col-md-12 text-center">
                <p class="text-muted">No slots available at the moment.</p>
            </div>
        <%
            } else {
                for (Slots slot : slots) {
        %>
            <div class="col-md-4">
                <div class="slot-card">
                    <h4>Slot ID: <%= slot.getId() %></h4>
                    <p><strong>Date:</strong> <%= slot.getDate() %></p>
                    <p><strong>Time:</strong> <%= slot.getTime() %></p>
                    <p><strong>Available Seats:</strong> 
                        <span class="badge <%= slot.getCount() > 0 ? "badge-success" : "badge-danger" %>">
                            <%= slot.getCount() %>
                        </span>
                    </p>

                    <% if (slot.getCount() > 0) { %>
                        <form action="processRegisterSlot.jsp" method="post" style="display:inline;">
                            <input type="hidden" name="slotId" value="<%= slot.getId() %>">
                            <input type="hidden" name="date" value="<%= slot.getDate() %>">
                            <input type="hidden" name="time" value="<%= slot.getTime() %>">
                            <button type="submit" class="btn btn-success btn-sm btn-register">
                                Register Now
                            </button>
                        </form>
                    <% } else { %>
                        <button class="btn btn-default btn-sm btn-register" disabled>
                            Full
                        </button>
                    <% } %>
                </div>
            </div>
        <%
                }
            }
        %>
    </div>

    <div class="text-center" style="margin-top: 30px;">
        <a href="dashboard.jsp" class="btn btn-primary">Back to Dashboard</a>
        <a href="addSlot.jsp" class="btn btn-info">Add New Slot (Admin)</a>
    </div>
</div>

</body>
</html>