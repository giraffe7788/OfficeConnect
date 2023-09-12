package meeting.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import meeting.service.IMeetingService;
import meeting.service.MeetingServiceImpl;

@WebServlet("/deleteBook.do")
public class deleteBook extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		IMeetingService service = MeetingServiceImpl.getInstance();
		
		String empNo = req.getParameter("empNo"); // 회원정보 가져옴?
		int cnt = service.removeBook(empNo);
		String msg = "";
		if(cnt > 0) {
			msg = "ok";
		}else {
			msg = "fail";
		}
		
		req.setAttribute("msg", msg);
		req.getRequestDispatcher(req.getContextPath() + "/MyBook.do").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		super.doPost(req, resp);
	}
}
