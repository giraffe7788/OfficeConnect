package meeting.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import meeting.service.IMeetingService;
import meeting.service.MeetingServiceImpl;
import vo.MeetingVO;
/*
@WebServlet("/list.do")
public class ReservationList extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		IMeetingService mtrService = MeetingServiceImpl.getInstance();
		List<MeetingVO> mtrList = mtrService.selectAll();
		
		req.setAttribute("mtrList", mtrList);
		
		RequestDispatcher disp = req.getRequestDispatcher("/meeting.jsp");
		disp.forward(req, resp);
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	}

}
*/
