<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
	div {
		width: 300px;
		height: 300px;
		border: 1px solid black;
	}
</style>

</head>
<body>

<%
String  msg  = (String)request.getAttribute("msg"); 

%>


<div>
<%=msg %>
</div>
</body>
</html>