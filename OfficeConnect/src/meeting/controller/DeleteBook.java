package meeting.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import meeting.service.IMeetingService;
import meeting.service.MeetingServiceImpl;

@WebServlet("/meeting/delete.do")
public class DeleteBook extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		IMeetingService meetingService = MeetingServiceImpl.getInstance();
		
		String empNo = req.getParameter("empNo"); // 회원정보 가져옴?
		
		int cnt = meetingService.deleteBook(empNo);
		
		if (cnt > 0) {
			System.out.println("삭제성공");
			
			req.getSession().setAttribute("empNo", empNo); // 다른 데에 로그인한 사람 정보 줄라고
						
			JsonObject jsonObject = new JsonObject();
			jsonObject.addProperty("isSuccess", "ok");
			String jsonStr = new Gson().toJson(jsonObject);
			resp.setContentType("application/json");
			resp.getWriter().write(jsonStr);
		} else {
			System.out.println("삭제실패");
			
			JsonObject jsonObject = new JsonObject();
			jsonObject.addProperty("isSuccess", "fail");
			String jsonStr = new Gson().toJson(jsonObject);
			resp.setContentType("application/json");
			resp.getWriter().write(jsonStr);
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		super.doPost(req, resp);
	}
}