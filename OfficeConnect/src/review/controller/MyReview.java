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
import util.SessionEmpInfo;
import vo.EmpVO;
import vo.ReviewVO;

@WebServlet("/review/list.do")
public class MyReview extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		IReviewService service = ReviewServiceImpl.getInstance();

		String empNo = (String) req.getSession().getAttribute("empNo");

		ReviewVO rvo = service.selectScore(empNo);

		SessionEmpInfo info = SessionEmpInfo.getInstance();

		EmpVO empVO = null;
		if (rvo != null) {
			empVO = info.getEmpVO(rvo.getRevEmpNo());
		}

		req.setAttribute("rvo", rvo);
		req.setAttribute("empVO", empVO);

		RequestDispatcher disp = req.getRequestDispatcher("../views/reviewCheck.jsp");
		disp.forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		doGet(req, resp);
	}
}
