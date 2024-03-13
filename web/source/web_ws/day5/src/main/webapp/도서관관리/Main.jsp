<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <title>Insert title here</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f5f5f5;
                margin: 0;
                padding: 0;
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

            table {
                width: 100%;
                border-collapse: collapse;
                margin-top: 20px;
            }

            th,
            td {
                border: 1px solid #dddddd;
                padding: 8px;
                text-align: center;
            }

            th {
                background-color: #946749;
                color: #ffffff;
            }

            tr:nth-child(even) {
                background-color: #f2f2f2;
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
    </body>
</html>
