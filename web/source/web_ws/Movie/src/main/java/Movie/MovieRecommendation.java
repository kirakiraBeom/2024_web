package Movie;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/movierecommendation")
public class MovieRecommendation extends HttpServlet {

    private static final String[] ACTION_MOVIES = {"다크 나이트", "인셉션", "매드 맥스: 분노의 도로"};
    private static final String[] COMEDY_MOVIES = {"행오버", "슈퍼배드", "브라이드메이드"};
    private static final String[] DRAMA_MOVIES = {"쇼생크 탈출", "포레스트 검프", "대부"};
    private static final String[] KOREAN_MOVIES = {"올드보이", "괴물", "기생충"};
    private static final String[] ANIMATION_MOVIES = {"센과 치히로의 행방불명", "너의 이름은", "토이 스토리"};

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 사용자가 선택한 장르를 파라미터로 받아옴
        String genre = request.getParameter("genre");
        
        // 추천 영화 목록을 생성
        String[] recommendedMovies = getRecommendedMovies(genre);

        // JSP로 영화 목록을 전달
        request.setAttribute("recommendedMovies", recommendedMovies);
        
        // 영화 추천 페이지로 포워딩
        request.getRequestDispatcher("/WEB-INF/views/movie_recommendation.jsp").forward(request, response);
    }

    // 장르에 따른 추천 영화 목록을 반환하는 메서드
    private String[] getRecommendedMovies(String genre) {
        switch (genre) {
            case "액션":
                return ACTION_MOVIES;
            case "코미디":
                return COMEDY_MOVIES;
            case "드라마":
                return DRAMA_MOVIES;
            case "한국영화":
                return KOREAN_MOVIES;
            case "애니메이션":
                return ANIMATION_MOVIES;
            default:
                return new String[0];
        }
    }
}
