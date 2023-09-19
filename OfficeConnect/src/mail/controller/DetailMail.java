package mail.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mail.service.IMailService;
import mail.service.MailServiceImpl;
import vo.MailVO;

@MultipartConfig
@WebServlet("/mail/detail.do")
public class DetailMail extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		IMailService mailService = MailServiceImpl.getInstance();
		// 사용자로부터 입력 받은 URL파라미터로 전달된 mailNo
		String mailNo = req.getParameter("mailNo");
		
		// DB에서 실제로 가져온 메일 정보를 사용자로부터 전달된 MailNo를 사용해서 해당 메일 정보를 조회
		MailVO mailVO = mailService.getMailByMailNo(mailNo);//
		
		req.setAttribute("mailVO", mailVO);
		// 메일 내용을 포함한 페이지로 포워딩 시킨다.
		req.getRequestDispatcher("/views/mailDetail.jsp").forward(req, resp);
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
