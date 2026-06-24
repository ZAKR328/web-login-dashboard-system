<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    if (session.getAttribute("user") == null) {
        response.sendRedirect("index.html");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Dashboard</title>
</head>
<body>
<h1>Welcome <%= ((com.example.assignment02.model.User)session.getAttribute("user")).getName() %>!</h1>
<p>You are logged in successfully!</p>
<a href="logout">Logout</a>
</body>
</html>