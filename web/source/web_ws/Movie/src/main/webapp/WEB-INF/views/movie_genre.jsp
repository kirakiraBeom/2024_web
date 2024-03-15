<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Movie Genre Selection</title>
</head>
<body>
    <h1>당신이 가장 좋아하는 영화는 ?</h1>
    <form action="/Movie/moviegenre" method="post">
        <select name="genre">
            <option value="액션">액션</option>
            <option value="코미디">코미디</option>
            <option value="드라마">드라마</option>
            <option value="한국영화">한국영화</option>
            <option value="애니메이션">애니메이션</option>
        </select>
        <input type="submit" value="제출하기">
    </form>
</body>
</html>
