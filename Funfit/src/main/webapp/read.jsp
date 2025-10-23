<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.funfit.pojo.*" %>
    <%@ page import="com.funfit.dao.*" %> 
    <%@ page import="java.util.*" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
UserDAO dao = new UserDAO();
List<User> list = dao.retreiveUserData();
%>
	<center>
	
	<h1>List of Student Information</h1>
	<a href="index.jsp"><h3>Insert Data</h3></a><br>
	<table border="1" align="center">
	<tr>
		
		<th>User Name</th>
		<th>User Email</th>
		<th>Edit</th>
		<th>Delete</th>
	</tr>
	
	<% for(User user:list) { %>
	<tr>
		<td><%= user.getId() %></td>
		<td><%= user.getName() %></td>
		<td><%= user.getEmail() %></td>
		<td><a href="EditStudent.jsp?id=<%= user.getId() %> ">Edit</a></td>
		<td><a href="DeleteStudent.jsp?id=<%= user.getId() %> ">Delete</a></td>
	</tr>
	<% } %>
	</table>
    </center>		

</body>
</html>