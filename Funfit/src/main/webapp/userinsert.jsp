<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.funfit.pojo.*" %>
  <%@ page import="com.funfit.dao.*" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
User user = new User();
user.setName(request.getParameter("name"));
user.setMobile(request.getParameter("mobile"));
user.setAge(Integer.parseInt(request.getParameter("age")));
user.setWeight(Double.parseDouble(request.getParameter("weight")));	
user.setEmail(request.getParameter("email"));
user.setPassword(request.getParameter("pwd"));
user.setAddress(request.getParameter("address"));

UserDAO dao = new UserDAO();
try {
	int rowsAffected = dao.insertUserintodb(user);
    if (rowsAffected > 0) {
        response.sendRedirect("login.jsp");
    } else {
        out.println("<p>Error: Failed to insert user. Please try again.</p>");
    }
} 
catch (Exception e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}
%>
</body>
</html>