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
public class login extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// req.getRequestDispatcher("/insert.do").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String empNo = req.getParameter("emp_no");
		String empPw = req.getParameter("emp_pw");
		Boolean isAdminLogin = Boolean.parseBoolean(req.getParameter("adminLogin"));

		IEmpService loginService = EmpServiceImpl.getInstance();
		EmpVO empVO = new EmpVO();
		empVO.setEmpNo(empNo);
		empVO.setEmpPw(empPw);

		if (loginService.loginCheck(empVO, isAdminLogin)) {
			
			req.getSession().setAttribute("empNo", empNo); // 세션에 사번 넣기
						
			JsonObject jsonObject = new JsonObject();
			jsonObject.addProperty("isSuccess", "ok");
			String jsonStr = new Gson().toJson(jsonObject);
			resp.setContentType("application/json");
			resp.getWriter().write(jsonStr);
		} else {
			
			JsonObject jsonObject = new JsonObject();
			jsonObject.addProperty("isSuccess", "fail");
			String jsonStr = new Gson().toJson(jsonObject);
			resp.setContentType("application/json");
			resp.getWriter().write(jsonStr);
		}
	}
}