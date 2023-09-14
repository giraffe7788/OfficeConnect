package mail.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.mail.internet.MimeMessage;
import javax.servlet.RequestDispatcher;
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
@WebServlet("/mail/sendList.do")
public class SendListMail extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		req.getRequestDispatcher("/views/mailWrite.jsp").forward(req, resp);

	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		
		String empNo = (String)req.getSession().getAttribute("empNo");
		
		// MailUtil의 제목, 내용, 받은사람 이메일주소의 매개변수를 가져옴
		String title = req.getParameter("title");
		String body = req.getParameter("body");
		String address = req.getParameter("address");
		
		// 사용자로부터 입력 받은 데이터를 DB로 가져온다.
		String mailCont = req.getParameter("body");
		String mailReceiver = req.getParameter("address");
		String mailSender = req.getParameter("empNo");
		IMailService mailService = MailServiceImpl.getInstance();
		
	    MailVO mailVO = new MailVO();
	    
	    mailVO.setMailCont(mailCont);
	    mailVO.setMailSender(mailSender);
	    mailVO.setMailReceiver(mailReceiver);
	    mailVO.setMailSendStat(0); // 보낸 메일 상태: 삭제 안함
	    mailVO.setMailReceStat(0); // 받은 메일 상태: 삭제 안함
		
		Date mailSendDate = new Date(); // 현재 날짜 설정?
		mailVO.setMailSendDate(mailSendDate);
		
	    int cnt = mailService.writeMail(mailVO); // 메일 저장
	    
	    String msg = "";
		if(cnt > 0) {
			msg = "성공";
			System.out.println("성공!!!!!!!!!!!");
			
			// 메일 API
			MailUtil sendMail = new MailUtil();
			sendMail.sendMail("title", "body", "address");
			
		} else {
			msg = "실패";
		}
		
		HttpSession session = req.getSession();
		session.setAttribute("msg", msg);
		
		resp.setCharacterEncoding("UTF-8");
		resp.sendRedirect(req.getContextPath() + "/mail/mailDetail.do");
	
//		doGet(req, resp);
	}
}
