<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Movie Genre Selection</title>
</head>
<body>
    <h1>Select Your Favorite Movie Genre</h1>
    <form action="moviegenre" method="post">
        <select name="genre">
            <option value="action">Action</option>
            <option value="comedy">Comedy</option>
            <option value="drama">Drama</option>
        </select>
        <input type="submit" value="Submit">
    </form>
</body>
</html>
