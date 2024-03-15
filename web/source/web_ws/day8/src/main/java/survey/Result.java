package survey;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/result")
public class Result extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		String flower = request.getParameter("flower");
		
		HttpSession session = request.getSession();
		session.setAttribute("flower", flower);
		
//		최종결과
		
		request.getRequestDispatcher("WEB-INF/views/result.jsp").forward(request, response);
		
	}

}
