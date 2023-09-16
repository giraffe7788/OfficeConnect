package car.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/car/Book.do")
public class CarBook extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		// 여기서 카 정보 쫙 뽑아옴 getCarInfo(), 파라미터 없음(selectAll이라서), 리턴타입 List<CarVO>
		// 그 db에서 뽑아오는 작업은 xml과 dao가 하는것이고
		// 그 뽑아온걸 sevice로 리턴해주고 그 service에서 다시 여기로 주면
		// 그 정보들(List)을 포워드 방식으로 자동차예약홈페이지 jsp로 넘겨준다음 늘 하던대로 늘 먹던대로 jsp페이지에서 그 자동차 정보들을 웹에 쫙 뿌려주면 되는것
	}
}
