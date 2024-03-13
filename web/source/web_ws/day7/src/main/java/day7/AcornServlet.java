package day7;

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
		
//		데이터 만들기
//		Model -> 서비스, DAO (데이터베이스 연동 클래스를 객체로 사용)
		AcornService service = new AcornService();
//		ArrayList<Acorn> list = service.getMeberListTmp();
		ArrayList<Acorn> list = service.getMemberListReal();
		
		System.out.println(list.get(0).getId());
		
//		모델 심기(request 저장소 : )
		request.setAttribute("list", list);
		
		
		request.getRequestDispatcher("WEB-INF/views/list.jsp").forward(request, response);
	}

}
