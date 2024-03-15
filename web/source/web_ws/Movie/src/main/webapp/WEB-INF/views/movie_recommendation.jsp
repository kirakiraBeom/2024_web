<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Movie Recommendation</title>
</head>
<body>
    <h1>영화를 추천합니다.</h1>
    <ul>
        <% 
            String[] movies = (String[]) request.getAttribute("recommendedMovies");
            for (String movie : movies) {
        %>
            <li><%= movie %></li>
        <% } %>
    </ul>
</body>
</html>
