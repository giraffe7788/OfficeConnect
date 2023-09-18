package mail.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import mail.service.IMailService;
import mail.service.MailServiceImpl;

@WebServlet("/mail/delete.do")
public class DeleteMail extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String[] mailNoArr = req.getParameterValues("nums");
		
		IMailService mailService = MailServiceImpl.getInstance();
		
		int result = 0;
		int num ;
		for(int i=0; i <mailNoArr.length; i++) {
			num = Integer.parseInt(mailNoArr[i]);
			result = mailService.removeMail(num);
		}

		String msg = "";
		
		if(result > 0) {
			msg = "성공";
		} else {
			msg = "실패";
		}
		JsonObject jsonObject = new JsonObject();
		jsonObject.addProperty("isSuccess", msg);
		String jsonsStr = new Gson().toJson(jsonObject);
		resp.setContentType("application/json");
		resp.getWriter().write(jsonsStr);
	}
}
