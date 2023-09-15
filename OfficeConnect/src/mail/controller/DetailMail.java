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

@MultipartConfig
@WebServlet("/mail/mailDetail.do")
public class DetailMail extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		IMailService mailService = MailServiceImpl.getInstance();
		//List<MailVO> mailList = mailService.getMailList(true);
//		//mailNo는 보통 ?로 가져오니까 get에 써주는듯
//		String mailNo = (String)req.getParameter("mailNo");
	//	req.setAttribute("mailList", mailList);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/views/mailDetail.jsp");
		
		dispatcher.forward(req, resp);
		
		
//		String mailNo = (String)req.getParameter("mailNo");
//		// mailNo있으면 db에서 현재 조회중인 mailVO 가져올 수 있짢아
//		// 그걸 그대로 req객체(고기)에 담아줘 setAttribute("키", 밸류);
//		// 그걸 이제 엄마집으로 가져가는거야
//		req.getRequestDispatcher("경로(jsp = 엄마집)").forward(req, resp);
//		// 그럼 이제 엄마집=jsp 에서 고기를 통해 요리<%=mailVO.getTitle%>를 할 수 있다
//		// 고기를 가져오는 코드는 <%MailVO mailVO = (MailVO)request.getAttribute("키")%>
//		// <% ;%> 왼쪽코드는 그냥 안에 자바 코드 넣는거야 
//		// <%= %> 이 코드는 변수
//		// alert() 제목을 띄우고싶어 그럼
//		// alert(<%=mailVO.getTitle()%>)
//		// if문/for문 등등을 쓰고싶어 자바코드처럼
//		// <% if ( 어쩌구저쩌구 ) { %>
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
