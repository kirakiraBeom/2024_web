<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%
    // 입력 받은 값 추출
    String bname = request.getParameter("bname");
    String mName = request.getParameter("mName");
    String phoneNumber = request.getParameter("phoneNumber");
    
    // 데이터베이스 연결 정보
    String driver = "oracle.jdbc.driver.OracleDriver";
    String url = "jdbc:oracle:thin:@localhost:1521:testdb";
    String user = "scott";
    String password = "tiger";
    
    Connection con = null;
    PreparedStatement pst = null;
    
    try {
        // JDBC 드라이버 로드
        Class.forName(driver);
        
        // 데이터베이스 연결
        con = DriverManager.getConnection(url, user, password);
        
        // 대출 정보 삽입 SQL
        String loanSql = "INSERT INTO CheckOut(bNumber, mNumber, cDate) VALUES (?, (SELECT mNumber FROM bmember WHERE mName = ? AND phoneNumber = ?), SYSDATE)";
        pst = con.prepareStatement(loanSql);
        pst.setString(1, bname);
        pst.setString(2, mName);
        pst.setString(3, phoneNumber);
        
        // 대출 실행
        int loanResult = pst.executeUpdate();
        
        if (loanResult > 0) {
            out.println("<script>");
            out.println("alert('대출이 정상적으로 처리되었습니다.');");
            out.println("window.location.href='View.jsp';");
            out.println("</script>");
        } else {
            out.println("<script>");
            out.println("alert('대출에 실패했습니다. 다시 시도해주세요.');");
            out.println("window.location.href='Loan.jsp';");
            out.println("</script>");
        }
        
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        try {
            if (pst != null) {
                pst.close();
            }
            if (con != null) {
                con.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>
