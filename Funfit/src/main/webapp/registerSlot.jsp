<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.funfit.dao.RegisterSlotsDAO, com.funfit.pojo.User" %>
<%
    // ----- must be logged in -----
    User u = (User) session.getAttribute("user");
    if (u == null) {
        session.setAttribute("err", "Login required.");
        response.sendRedirect("login.jsp");
        return;
    }

    String sid = request.getParameter("slotId");
    if (sid == null || sid.trim().isEmpty()) {
        session.setAttribute("err", "Invalid slot.");
        response.sendRedirect("registerSlotForm.jsp");
        return;
    }

    int slotId = Integer.parseInt(sid);
    RegisterSlotsDAO dao = new RegisterSlotsDAO();

    boolean ok = dao.registerSlot(slotId, u.getEmail());

    if (ok) {
        session.setAttribute("msg", "Slot registered successfully!");
    } else {
        session.setAttribute("err", "Cannot register – slot full or already booked.");
    }
    response.sendRedirect("registerSlotForm.jsp");
%>