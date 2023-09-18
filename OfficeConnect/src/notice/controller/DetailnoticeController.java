package notice.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import notice.service.INoticeService;
import notice.service.NoticeServiceImpl;
import vo.NoticeVO;


//寃뚯떆�뙋 �젣紐� �겢由��떆 �솕硫� 
@WebServlet("/notice/detail.do")
public class DetailnoticeController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		int ntcNo = Integer.parseInt(req.getParameter("ntcNo"));
		System.out.println(ntcNo);
		INoticeService noticeService = NoticeServiceImpl.GetInstance();
		
		int cnt = noticeService.updateViews(ntcNo);
		
		NoticeVO noticeVO = noticeService.detailNotice(ntcNo);
		req.setAttribute("noticeVO", noticeVO);
		
		
		System.out.println("공지사항 리뷰수 cnt값" + cnt);
		req.getRequestDispatcher("/views/noticeBoardInfo.jsp").forward(req, resp);

	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);

	}

}