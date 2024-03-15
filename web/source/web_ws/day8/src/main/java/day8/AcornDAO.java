package day8;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class AcornDAO {
	
	String driver="oracle.jdbc.driver.OracleDriver";
	String url="jdbc:oracle:thin:@localhost:1521:testdb";
	String user="scott";
	String password="tiger";
	
//	메서드
//	db연결
	
	public Connection dbcon() {
		Connection con = null;
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, user, password);
			
			if(con != null)
				System.out.println("db ok");
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return con;
	}
	
	public ArrayList<Acorn> selectAll() {
		Connection con = dbcon();
		
		String sql = "select * from acorntbl";
		ArrayList<Acorn> list = new ArrayList<>();
		
		try {
			PreparedStatement pst = con.prepareStatement(sql);
			ResultSet rs = pst.executeQuery();
			
			while(rs.next()) {
				String id = rs.getString(1);
				String pw = rs.getString(2);
				String name = rs.getString(3);
				System.out.println(id);
				
				Acorn acorn = new Acorn(id, pw, name);
				list.add(acorn);
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} 
		
		return list;
	}
	
	public static void main(String[] args) {
		AcornDAO dao = new AcornDAO();
		dao.dbcon();
		
		System.out.println(dao.selectAll().size());
	}
}
