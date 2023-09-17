package notice.controller;

import java.io.IOException;
import java.util.Collections;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import notice.service.INoticeService;
import notice.service.NoticeServiceImpl;
import vo.NoticeVO;


@WebServlet("/notice/list.do")
public class ListnoticeController extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		INoticeService noticeService = NoticeServiceImpl.GetInstance();
		List<NoticeVO> noticeList = noticeService.selectAll();
		Collections.sort(noticeList);
		
		req.setAttribute("noticeList", noticeList);
		RequestDispatcher dispacther = req.getRequestDispatcher("/views/noticeBoard.jsp");
		dispacther.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}

}
