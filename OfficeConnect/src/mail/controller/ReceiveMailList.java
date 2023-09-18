package mail.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mail.service.IMailService;
import mail.service.MailServiceImpl;
import vo.MailVO;

@WebServlet("/mail/receiveList.do")//"/mail/mailBoxMine.do"??
public class ReceiveMailList extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		IMailService mailService = MailServiceImpl.getInstance();
		List<MailVO> mailList = mailService.getMailList(true);
		//true면 받은메일목록을 가져와?, false면 보낸메일 목록을 가져와?
		
		req.setAttribute("mailList", mailList);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/mailBoxReceived.jsp");
	
		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
