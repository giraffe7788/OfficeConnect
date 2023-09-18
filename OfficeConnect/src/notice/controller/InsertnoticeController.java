package notice.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import notice.service.INoticeService;
import notice.service.NoticeServiceImpl;
import vo.NoticeVO;


@MultipartConfig
@WebServlet("/notice/insert.do") // value 생략가능(어노테이션)
public class InsertnoticeController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/views/noticeInsert.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		

		req.setCharacterEncoding("UTF-8");
		
		String ntcTitle = req.getParameter("ntcTitle");
		String ntcCont = req.getParameter("ntcCont");
		String empNo = req.getParameter("empNo");
		ntcCont = ntcCont.replace("\r\n","<br>");

		INoticeService noticeService = NoticeServiceImpl.GetInstance();
		
		NoticeVO nv = new NoticeVO();
		nv.setNtcTitle(ntcTitle);
		nv.setNtcCont(ntcCont);
		nv.setEmpNo(empNo);
			
		int cnt = noticeService.insertNotice(nv);

		String msg = "";

		if (cnt > 0) {
			msg = "성공";
		} else {
			msg = "실패";
		}

		HttpSession session = req.getSession();

		resp.sendRedirect(req.getContextPath() + "/notice/list.do");

	}
}