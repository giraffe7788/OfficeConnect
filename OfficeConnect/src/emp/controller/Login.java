package emp.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.google.gson.Gson;
import com.google.gson.JsonObject;

import emp.service.IEmpService;
import vo.EmpVO;
import vo.MeetingBookVO;
import emp.service.EmpServiceImpl;

@WebServlet("/login.do")
public class Login extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// req.getRequestDispatcher("/insert.do").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String empNo = req.getParameter("emp_no");
		String empPw = req.getParameter("emp_pw");

		IEmpService loginService = EmpServiceImpl.getInstance();
		EmpVO empVO = new EmpVO();
		empVO.setEmpNo(empNo);
		empVO.setEmpPw(empPw);

		boolean adminLogin;
		
		if (loginService.loginCheck(empVO)) {
			System.out.println("로그인성공");
			
			req.getSession().setAttribute("empNo", empNo); // 다른 데에 로그인한 사람 정보 줄라고
						
			JsonObject jsonObject = new JsonObject();
			jsonObject.addProperty("isSuccess", "ok");
			String jsonStr = new Gson().toJson(jsonObject);
			resp.setContentType("application/json");
			resp.getWriter().write(jsonStr);
		} else {
			System.out.println("로그인실패");
			
			JsonObject jsonObject = new JsonObject();
			jsonObject.addProperty("isSuccess", "fail");
			String jsonStr = new Gson().toJson(jsonObject);
			resp.setContentType("application/json");
			resp.getWriter().write(jsonStr);
		}
	}
}