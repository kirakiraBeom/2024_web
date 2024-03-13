package day7;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/update")
public class UpdateServlet extends HttpServlet{
	
//	@Override
//	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		String method = req.getMethod();
//		
//		if(method.equals("get")) {
//			doGet(req, resp);
//		}
//		else if(method.equals("post")) {
//			doPost(req, resp);
//		}
//	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String id = req.getParameter("id");
		String pw = req.getParameter("pw");
		
		System.out.println(id);
		System.out.println(pw);
		
		AcornService service = new AcornService();
		service.modifyMember(id, pw);
		
		
		req.getRequestDispatcher("WEB-INF/views/updateok.jsp").forward(req, resp);
	}
}
