package emp.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import emp.service.EmpServiceImpl;
import emp.service.IEmpService;

@WebServlet("/emp/forgotpw.do")
public class forgotPw extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String empNo = req.getParameter("empNo");
		String empTel = req.getParameter("empTel");

		IEmpService service = EmpServiceImpl.getInstance();
		
		req.setAttribute("empNo", req.getSession().getAttribute("empNo"));
		req.setAttribute("empTel", req.getSession().getAttribute("empTel"));

//		req.getSession().setAttribute("empNo", empNo);
//		req.getSession().setAttribute("empTel", empTel);

		RequestDispatcher disp = req.getRequestDispatcher("/views/forgot-password.jsp");
		disp.forward(req, resp);
		
		

	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	}
}