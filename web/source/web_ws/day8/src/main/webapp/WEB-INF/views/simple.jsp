<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.wrap {
width:300px;
height: 300px;
border: 1px solid black;
margin: 0 auto;
text-align: center; 
line-hight:300px;
}
</style>
</head>
<body>
<% String msg = (String)request.getAttribute("msg"); %>
<div class = "wrap"></div>
<%=msg %>
</body>
</html>