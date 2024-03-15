<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Movie Recommendation</title>
</head>
<body>
    <h1>Recommended Movies</h1>
    <ul>
        <c:forEach items="${recommendedMovies}" var="movie">
            <li>${movie}</li>
        </c:forEach>
    </ul>
</body>
</html>
