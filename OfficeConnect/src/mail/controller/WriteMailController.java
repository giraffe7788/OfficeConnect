package mail.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mail.service.IMailService;
import mail.service.MailServiceImpl;
import util.MailUtil;
import vo.MailVO;

@MultipartConfig
@WebServlet("/mail/write.do")
public class WriteMailController extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/views/mailWrite.jsp").forward(req, resp);
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		IMailService mailService = MailServiceImpl.getInstance();
		
		req.setCharacterEncoding("UTF-8");
		
		String mailCont = req.getParameter("mailCont");
		String mailSender = req.getParameter("mailSender");
		String mailReceiver = req.getParameter("mailReceiver");
		int mailNo = Integer.parseInt(req.getParameter("mailNo"));
		int mailSendStat = Integer.parseInt(req.getParameter("mailSendStat"));
		int mailReceStat = Integer.parseInt(req.getParameter("mailReceStat"));
		
		Date mailSendDate = null; // 전역변수 선언 및 초기화
		
		try{
			String mailDateStr = req.getParameter("mailSendDate");
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			mailSendDate = dateFormat.parse(mailDateStr); // mailDate에 값 할당
		} catch (java.text.ParseException e) {
			e.printStackTrace();
		}
		
		MailVO mailVO = new MailVO();
		mailVO.setMailCont(mailCont);
		mailVO.setMailSender(mailSender);
		mailVO.setMailReceiver(mailReceiver);
		mailVO.setMailNo(mailNo);
		mailVO.setMailSendStat(mailSendStat);
		mailVO.setMailReceStat(mailReceStat);
		mailVO.setMailSendDate(mailSendDate);// 이 변수들로 메일 객체에 값 설정
		
		int cnt = mailService.writeMail(mailVO);
		if(mailVO != null) {
			mailVO.setMailNo(mailNo);
		}
		String msg ="";
		
		if(cnt > 0) {
			msg = "성공";
			
			MailUtil sendMail = new MailUtil();
			sendMail.sendMail("여기 화면에서 쓰는 제목", "여기 화면에서 쓰는 내용", "여기 화면에서 적은 받는사람");
			//을.. 어떻게하지? 화면에서 입력한게 여기로 와서 다시 화면으로 쏴준다????
			
		} else {
			msg = "실패";
		}
		
		HttpSession session = req.getSession();
		session.setAttribute("msg", msg);
		resp.setCharacterEncoding("UTF-8");
		resp.sendRedirect(req.getContextPath() + "/mail/mailBoxMine.do");
		// 1. 메일 보내면 메일 보내기를 완료했다는 화면을 만들던지
		// 2. 그냥 alert창에 메일전송 완료하고 메인(지금 경로 mailBoxMine)으로 돌아가던지 둘 중 하나?
	
	}

}
