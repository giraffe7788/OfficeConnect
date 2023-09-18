package review.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import review.service.IReviewService;
import review.service.ReviewServiceImpl;
import vo.ReviewVO;

@WebServlet("/review/list.do")
public class MyReview  extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		IReviewService service = ReviewServiceImpl.getInstance();
		
		String empNo = (String) req.getSession().getAttribute("empNo");
//		req.getParameter("empNo");
//		get or post방식으로 밖에서 주는거야
//		get방식으로 줄 때는 주소로 주는방식
//		list.do?empNo=101
//		post방식
//		form으로 줄 때 name으로찾아오는거야 예를들어 name이 empNo인 input type="text"라고하자 거기 입력된값을 가져올 수있어
//		ajax로 줄 때 data = {"empNo" : value}
		
		req.setAttribute("empNo", empNo);
//		req.getAttribute("empNo");
		
		ReviewVO rvo = service.selectOne(empNo);
		
		req.setAttribute("rvo", rvo);
		
		RequestDispatcher disp = req.getRequestDispatcher("/views/reviewCheck.jsp");
		disp.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		doGet(req, resp);
	}
}
