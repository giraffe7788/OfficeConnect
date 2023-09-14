package mail.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mail.service.IMailService;
import mail.service.MailServiceImpl;

@MultipartConfig
@WebServlet("/mail/delete.do")
public class DeleteMailController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
			String mailNoStr = req.getParameter("mailNo");
			int mailNo = Integer.parseInt(mailNoStr);
			
			IMailService mailService = MailServiceImpl.getInstance();
			
			int cnt = mailService.removeMail(mailNo);
			
			String msg = "";
			
			if(cnt > 0) {
				msg = "성공";
			} else {
				msg = "실패";
			}
			
			HttpSession session = req.getSession();
			session.setAttribute("msg", msg);
			
			resp.setCharacterEncoding("UTF-8");
			resp.sendRedirect(req.getContextPath() + "/mail/mailDetail.do");
			//삭제 후 경로 어디로 가야할지 아니 갈 필요가없나? 그자리에 고정은 어떻게하지?
	
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
