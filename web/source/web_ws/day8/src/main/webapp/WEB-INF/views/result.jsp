<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	String animal = (String)session.getAttribute("animal");
	String flower = (String)session.getAttribute("flower");

%>

<h2>당신이 좋아하는 것은?</h2>

<%=animal %>
<%=flower %>



</body>
</html>