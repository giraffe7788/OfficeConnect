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
		
		String empNo = req.getParameter("empNo");
		
		IReviewService service = ReviewServiceImpl.getInstance();
		ReviewVO rvo = service.selectOne(empNo);
		
		req.setAttribute("rvo", rvo);
		
		System.out.println("empNo ? " + empNo);
		
		RequestDispatcher disp = req.getRequestDispatcher("/views/reviewCheck.jsp");
		disp.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
