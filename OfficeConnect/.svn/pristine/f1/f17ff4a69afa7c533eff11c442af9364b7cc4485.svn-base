package mail.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

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
import vo.EmpVO;
import vo.MailVO;

@MultipartConfig
@WebServlet("/mail/insert.do")
public class InsertMail extends HttpServlet {

	@Override
	// get으로 들어왔다는 의미는 링크를 타고 들어왔다는 뜻, 그래서 메일 작성 화면을 보여줌
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<EmpVO> empList = EmpServiceImpl.getInstance().selectAll();
		req.setAttribute("empList", empList);
		req.getRequestDispatcher("../views/mailWrite.jsp").forward(req, resp);
	}
	
	@Override
	// post로 들어왔다는 뜻 -> form에서 보내줬다는 뜻, 그래서 메일 작성한걸 db에 보내준다음 성공여부를 세션에 써주고 보낸메일함으로 리디렉션
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");

		// 접속중인 사번 가져오기
		String empNo = (String) req.getSession().getAttribute("empNo");

		// 사용자로부터 입력 받은 데이터를 DB로 가져온다.
		String mailTitle = req.getParameter("mailTitle");
		String mailCont = req.getParameter("mailCont");
		System.out.println(req.getParameter("receiverEmpNo"));
		String mailReceiver = req.getParameter("receiverEmpNo");
		Date mailSendDate = new Date(); // 현재 날짜 설정
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String formattedDate = sdf.format(mailSendDate);

		IMailService mailService = MailServiceImpl.getInstance();

		MailVO mailVO = new MailVO();
		mailVO.setMailTitle(mailTitle);
		mailVO.setMailCont(mailCont);
		mailVO.setMailReceiver(mailReceiver);
		mailVO.setMailSender(empNo);
		mailVO.setMailSendstat(0);
		mailVO.setMailRecestat(0);
		mailVO.setMailSenddate(mailSendDate);

		int cnt = mailService.writeMail(mailVO); // 메일 저장

		String msg = "";

		if (cnt > 0) {
			msg = "성공";
			// httpservletRequest 객체인 req의 "속성을 MailVO에 설정"해줘야 MailVO를 가져올 수 있음
			req.setAttribute("MailVO", mailVO);
		} else {
			msg = "실패";
		}

		HttpSession session = req.getSession();
		session.setAttribute("msg", msg);

		resp.setCharacterEncoding("UTF-8");
		resp.sendRedirect("../mail/sendList.do");
		
	}
}
