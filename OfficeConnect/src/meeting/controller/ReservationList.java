package meeting.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import vo.MeetingRoomVO;
import meeting.service.IMeetingService;
import meeting.service.MeetingServiceImpl;
import vo.MeetingBookVO;

@WebServlet("/meeting/list.do")
public class ReservationList extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		IMeetingService service = MeetingServiceImpl.getInstance();
		List<MeetingBookVO> mtrList = service.selectAll();
		
		req.setAttribute("empNo", req.getSession().getAttribute("empNo"));
		
		req.setAttribute("mtrList", mtrList);
		System.out.println("empNo : " + req.getSession().getAttribute("empNo") + "  mtrList : " + mtrList);
		
		// 회의실 이름과 수용인원을 가져와서 Map에 저장
		List<vo.MeetingRoomVO> roomList = service.getRoomList();
		req.setAttribute("roomList", roomList);

		RequestDispatcher disp = req.getRequestDispatcher("../views/meetingRoom.jsp");
		disp.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}

}

