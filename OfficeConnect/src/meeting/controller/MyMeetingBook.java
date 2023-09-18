package meeting.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import meeting.service.IMeetingService;
import meeting.service.MeetingServiceImpl;
import vo.MeetingBookVO;

@WebServlet("/meeting/mybook.do")
public class MyMeetingBook extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		IMeetingService meetingService = MeetingServiceImpl.getInstance();
		
		String empNo = (String)req.getSession().getAttribute("empNo");
		MeetingBookVO mtrVO = meetingService.getMeetingBookVO(empNo);

		req.setAttribute("mtrVO", mtrVO);	
		req.setAttribute("empNo", empNo);
	
		RequestDispatcher disp = req.getRequestDispatcher("../views/meetingRoomBook.jsp");
		disp.forward(req, resp);
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}