<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.ArrayList" %>
<%@ page import = "day8.Acorn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
table {
	width:600px;
	border:1px solid black;
	margin: 0 auto;
	border-collapse: collapse;
}

td{
	border: 1px solid black;
	text-align: center;
}
</style>
</head>
<body>
<table>
<tr>
<td>아이디</td>
<td>비밀번호</td>
<td>이름</td>
</tr>

<% 
ArrayList<Acorn> list = (ArrayList<Acorn>)request.getAttribute("list");
for(Acorn acorn : list) {
%>

<tr>
<td><%=acorn.getId() %></td>
<td><%=acorn.getPw() %></td>
<td><%=acorn.getName() %></td>
</tr>

<%} %>
</table>
</body>
</html>