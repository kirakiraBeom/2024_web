<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@  page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>도서 관리 시스템</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 0;
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

        th, td {
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
    <h1>도서 관리 시스템</h1>
</header>

<nav>
    <a href="#">도서 목록</a>
    <a href="#">도서 등록</a>
    <a href="#">도서 대출</a>
    <a href="#">도서 반납</a>
</nav>

<section>
    <table>
        <caption>도서 목록</caption>
        <tr>
            <th>도서번호</th>
            <th>도서명</th>
            <th>분류</th>
            <th>저자</th>
        </tr>
        <%-- 여기에 데이터베이스에서 조회한 도서 목록을 출력하는 코드를 추가하세요 --%>
        <% 
            try {
                String driver = "oracle.jdbc.driver.OracleDriver";
                String url = "jdbc:oracle:thin:@localhost:1521:testdb";
                String user = "scott";
                String password = "tiger";

                Class.forName(driver);
                Connection con = DriverManager.getConnection(url, user, password);
                String sql = "SELECT * FROM book";
                PreparedStatement pst = con.prepareStatement(sql);
                ResultSet rs = pst.executeQuery();

                while (rs.next()) {
        %>
        <tr>
            <td><%= rs.getString("bno") %></td>
            <td><%= rs.getString("bname") %></td>
            <td><%= rs.getString("bclass") %></td>
            <td><%= rs.getString("bauthor") %></td>
        </tr>
        <%
                }
                con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>
    </table>
</section>

<footer>
    도서 관리 시스템 - © 2024 Library Inc.
</footer>

</body>
</html>
