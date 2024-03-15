package day8;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/acornlist")
public class AcornServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
//		
		
		AcornService service = new AcornService();
		ArrayList<Acorn> list = service.getMembers();
		
//		Request 저장소 모델을 저장
		
		request.setAttribute("list", list);
		
//		view forward
		request.getRequestDispatcher("WEB-INF/views/acorn.jsp").forward(request, response);
		
		
	}

}
