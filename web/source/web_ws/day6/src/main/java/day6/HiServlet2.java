package day6;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/hi2")
public class HiServlet2 extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		
		HiService service = new HiService();
		String msg = service.getHello();
		
		
		req.setAttribute("msg", msg);		
		req.getRequestDispatcher("WEB-INF/views/hi.jsp").forward(req, resp);
		
	}

}
