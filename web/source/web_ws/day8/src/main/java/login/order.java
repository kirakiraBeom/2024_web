package login;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/order")
public class order extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
//		로그인 유무
//		HttpSession 저장소에서 로그인 값을 확인
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		
		if(id != null) {
//			
//			주문목록
			
			request.getRequestDispatcher("WEB-INF/views/order.jsp").forward(request, response);
		} else {
			response.sendRedirect("/day8/login");
		}
		
	}
}
