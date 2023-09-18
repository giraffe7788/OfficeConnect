package emp.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import emp.service.EmpServiceImpl;
import emp.service.IEmpService;
import util.MailUtil;
import vo.EmpVO;

@WebServlet("/emp/forgotpw.do")
public class forgotPw extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String empNo = req.getParameter("empNo");
		String empEmail = req.getParameter("empEmail");
		IEmpService service = EmpServiceImpl.getInstance();

		EmpVO empVO = new EmpVO();
		empVO.setEmpNo(empNo);
		empVO.setEmpEmail(empEmail);

		String empPw = service.forgotPw(empVO);
		
		if (empPw != null) {

			MailUtil sendMail = new MailUtil();
			sendMail.sendMail("찾으신 비밀번호입니다", "비밀번호 : " + empPw, empEmail);
			
			JsonObject jsonObject = new JsonObject();
			jsonObject.addProperty("isSuccess", "ok");
			String jsonsStr = new Gson().toJson(jsonObject);
			resp.setContentType("application/json");
			resp.getWriter().write(jsonsStr);
			
		} else {

			JsonObject jsonObject = new JsonObject();
			jsonObject.addProperty("isSuccess", "fail");
			String jsonsStr = new Gson().toJson(jsonObject);
			resp.setContentType("application/json");
			resp.getWriter().write(jsonsStr);
		}
	}
}