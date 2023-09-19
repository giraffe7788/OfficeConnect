package main.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import car.service.CarServiceImpl;
import car.service.ICarService;
import main.service.IMainService;
import main.service.MainServiceImpl;
import meeting.service.IMeetingService;
import meeting.service.MeetingServiceImpl;
import sun.print.resources.serviceui;
import util.MyBatisUtil;
import util.SessionEmpInfo;
import vo.ApprovalVO;
import vo.BoardVO;
import vo.CarBookVO;
import vo.CarVO;
import vo.EmpVO;
import vo.MailVO;
import vo.MeetingBookVO;
import vo.NoticeVO;

@WebServlet("/main/main.do")
public class MainPage extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		String empNo = (String)req.getSession().getAttribute("empNo");
		
		
		// 이름
		String empName = SessionEmpInfo.getInstance().getEmpVO(empNo).getEmpName();
		req.setAttribute("empName", empName);
		
		
		// 현재 내 회의실
		IMeetingService meetingService = MeetingServiceImpl.getInstance();
		MeetingBookVO mtrVO = meetingService.getMeetingBookVO(empNo);
		req.setAttribute("mtrVO", mtrVO);	
		req.setAttribute("empNo", empNo);
	

		// 차량 예약정보
		ICarService carService = CarServiceImpl.getInstance();
		CarBookVO carBookVO = carService.selectOneMyCarBook(empNo);
		req.setAttribute("carBookVO", carBookVO);
		
		
		// 최근 내가 보낸결재 5개 getSendApprovalList	
		IMainService mainService = MainServiceImpl.getInstance();
		List<ApprovalVO> apprList = mainService.getSendApprovalList(empNo);
		req.setAttribute("apprList", apprList);
		
		
		// 최근 공지사항 내역 5개씩
		List<NoticeVO> noticeList = mainService.getCurrentNoticeList();
		req.setAttribute("noticeList", noticeList);
		
		
		// 최근 자유게시판 내역 5개씩
		List<BoardVO> boardList = mainService.getCurrentBoardList();
		req.setAttribute("boardList", boardList);
		
		
		// 최근 받은메일 5개
		List<MailVO> mailList = mainService.getCurrentReceiveMailList(empNo);
		req.setAttribute("mailList", mailList);

		RequestDispatcher dispatcher = req.getRequestDispatcher("/views/main.jsp");
		dispatcher.forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
