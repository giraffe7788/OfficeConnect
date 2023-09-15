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

import main.service.IMainService;
import main.service.MainServiceImpl;
import sun.print.resources.serviceui;
import util.MyBatisUtil;
import vo.EmpVO;

@WebServlet("/Main.do")
public class MainPage extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String empNo = req.getParameter("empNo");

		IMainService service = MainServiceImpl.getInstance();

		List<EmpVO> ev = service.getMtrBook(empNo);

//		현재 내 회의실
//		차량 예약정보
//		최근 공지사항 내역 5개씩
//		최근 자유게시판 내역 5개씩: getNoticeList -> 최근 공지사항 5개 뽑아오는 메소드
//		최근 내 결재내역5개
//		최근 내 받은메일5개: getReceiveMailList -> 최근 받은 메일 5개뽀바오는 메소드		
//		지금 이름

		RequestDispatcher dispatcher = req.getRequestDispatcher("/views/main.jsp");
		dispatcher.forward(req, resp);
	}


}
