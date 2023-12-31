package mail.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.internet.MimeMessage;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import emp.service.EmpServiceImpl;
import emp.service.IEmpService;
import mail.service.IMailService;
import mail.service.MailServiceImpl;
import util.MailUtil;
import vo.MailVO;

@WebServlet("/mail/sendList.do")
public class SendMailList extends HttpServlet {
	
	private IMailService mailService = MailServiceImpl.getInstance();
	private IEmpService empService = EmpServiceImpl.getInstance();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String isSend = req.getParameter("isSend"); //받은메일함은 1 , 보낸메일함은 2
		
		// 1.메일조회를 하기위해 empNo값을 가져와야함
		// 2.로그인시 저장되는 세션에서 가져옴
		String empNo = (String) req.getSession().getAttribute("empNo"); 
		
		//메일조회
		String empEmail = empService.mailSelect(empNo);
		
		Map<String, Object> paramMap = new HashMap<String, Object>(); 
		paramMap.put("isSend", isSend);
		paramMap.put("empNo", empNo);

		List<MailVO> sendMailList = mailService.getMailList(paramMap); 
		
		req.setAttribute("sendMailList", sendMailList);

		req.getRequestDispatcher("/views/mailBoxSend.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	}
}
