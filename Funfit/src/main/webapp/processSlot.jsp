<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.funfit.dao.SlotsDAO" %>
<%@ page import="com.funfit.pojo.Slots" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Processing Slot</title>
</head>
<body>
    <%
        try {
            String date = request.getParameter("date");
            String time = request.getParameter("time");
            String countStr = request.getParameter("count");

            // Server-side validation
            if (date == null || !date.matches("\\d{4}-\\d{2}-\\d{2}")) {
                out.println("<p>Error: Invalid date format (use YYYY-MM-DD).</p>");
                return;
            }
            if (time == null || !time.matches("\\d{2}:\\d{2}:\\d{2}")) {
                out.println("<p>Error: Invalid time format (use HH:MM:SS).</p>");
                return;
            }
            int count;
            try {
                count = Integer.parseInt(countStr);
                if (count < 1) {
                    out.println("<p>Error: Count must be positive.</p>");
                    return;
                }
            } catch (NumberFormatException e) {
                out.println("<p>Error: Invalid count format.</p>");
                return;
            }

            Slots slot = new Slots();
            slot.setDate(date);
            slot.setTime(time);
            slot.setCount(count);

            SlotsDAO dao = new SlotsDAO();
            int rowsAffected = dao.insertSlot(slot);
            if (rowsAffected > 0) {
                response.sendRedirect("displaySlots.jsp");
            } else {
                out.println("<p>Error: Failed to add slot.</p>");
            }
        } catch (Exception e) {
            out.println("<p>Error: " + e.getMessage() + "</p>");
            e.printStackTrace();
        }
    %>
</body>
</html>