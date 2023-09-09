package emp.login.main;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import emp.login.service.ILoginService;
import emp.login.service.LoginServiceImpl;
import emp.vo.EmpVO;

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

		System.out.println("잘옴? " + empNo + " | " + empPw);

		ILoginService loginService = LoginServiceImpl.getInstance();
		EmpVO empVO = new EmpVO();
		empVO.setEmpNo(empNo);
		empVO.setEmpPw(empPw);

		if (loginService.loginCheck(empVO)) {
			System.out.println("로그인성공");
			String resultJson = new Gson().toJson("ok");
			resp.setContentType("application/json");
			resp.getWriter().write(resultJson);
		} else {
			System.out.println("로그인실패");
			String resultJson = new Gson().toJson("fail");
			resp.setContentType("application/json");
			resp.getWriter().write(resultJson);
		}
	}
}
