<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8" />
        <title>도서 반납</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f5f5f5;
                margin: 0;
                padding: 0;
                height: 100vh;
            }
            a {
                text-decoration: none;
                color: #ffffff;
            }
            header {
                background-color: #946749;
                color: #ffffff;
                padding: 20px;
                text-align: center;
            }
            nav {
                background-color: #c08760;
                color: #ffffff;
                padding: 10px;
                text-align: center;
            }
            nav a {
                text-decoration: none;
                color: #ffffff;
                margin: 0 10px;
            }
            section {
                padding: 20px;
            }
            footer {
                background-color: #946749;
                color: #ffffff;
                padding: 10px;
                text-align: center;
                position: fixed;
                bottom: 0;
                width: 100%;
            }
            .container {
                background-color: #ffffff;
                border-radius: 8px;
                box-shadow: 0px 0px 10px 0px rgba(0, 0, 0, 0.1);
                padding: 40px;
                max-width: 400px;
                width: 100%;
                margin: auto;
                margin-top: 120px;
            }
            .container > h1 {
                color: #333333;
                text-align: center;
            }
            form {
                margin-top: 20px;
            }
            input[type='text'],
            input[type='submit'] {
                width: 100%;
                padding: 10px;
                margin-top: 10px;
                border: 1px solid #ccc;
                border-radius: 4px;
                box-sizing: border-box;
                font-size: 16px;
            }
            input[type='submit'] {
                background-color: #946749;
                color: white;
                cursor: pointer;
            }
            input[type='submit']:hover {
                background-color: #c08760;
            }
        </style>
    </head>
    <body>
        <header>
            <h1><a href="Main.jsp">도서 관리 시스템</a></h1>
        </header>

        <nav>
            <a href="View.jsp">도서 목록</a>
            <a href="BookReg.jsp">도서 등록</a>
            <a href="Loan.jsp">도서 대출</a>
            <a href="Return.jsp">도서 반납</a>
        </nav>

        <footer>도서 관리 시스템 - © 2024 Library Inc.</footer>

        <div class="container">
            <h1>도서 반납</h1>
            <form action="returnAction.jsp" method="post">
                <input type="text" name="bookId" placeholder="도서 번호" required />
                <input type="submit" value="반납" />
            </form>
        </div>
    </body>
</html>
