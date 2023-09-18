package review.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import review.service.IReviewService;
import review.service.ReviewServiceImpl;
import util.SessionEmpInfo;
import vo.EmpVO;
import vo.ReviewVO;

@WebServlet("/review/insert.do")
public class Review extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		IReviewService service = ReviewServiceImpl.getInstance();
		
		String empNo = (String) req.getSession().getAttribute("empNo");
		EmpVO empVO = SessionEmpInfo.getInstance().getEmpVO(empNo);
		List<EmpVO> empList = service.getInferiorList(empVO);
		ReviewVO reviewVO = new ReviewVO();
		
		req.setAttribute("empVO", empVO);
		req.setAttribute("empList", empList);
		RequestDispatcher disp = req.getRequestDispatcher("/views/review.jsp");
		disp.forward(req, resp);
		
		int resScore = Integer.parseInt(req.getParameter("optionValue"));
		int scrScore = Integer.parseInt(req.getParameter("optionValue"));
		int copScore = Integer.parseInt(req.getParameter("optionValue"));
		int creScore = Integer.parseInt(req.getParameter("optionValue"));
		
		if(service.insertScore(reviewVO) > 0) {
			
			System.out.println("돼라 제발 집에 가자");
			
			JsonObject jsonObject = new JsonObject();
			jsonObject.addProperty("isSuccess", "ok");
			String jsonsStr = new Gson().toJson(jsonObject);
			resp.setContentType("application/json");
			resp.getWriter().write(jsonsStr);
		}else {
			
			System.out.println("실패");
			
			JsonObject jsonObject = new JsonObject();
			jsonObject.addProperty("isSuccess", "fail");
			String jsonsStr = new Gson().toJson(jsonObject);
			resp.setContentType("application/json");
			resp.getWriter().write(jsonsStr);
			
		}
		
		
	}
}
