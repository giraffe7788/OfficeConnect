package emp.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import emp.common.MailUtil;
import emp.service.EmpServiceImpl;
import emp.service.IEmpService;
import vo.EmpVO;

@MultipartConfig
@WebServlet("/join.do")
public class JoinController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.getRequestDispatcher("/views/employee/insertForm.jsp").forward(req, resp);

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String empPw = req.getParameter("empPw");
		String empAddr = req.getParameter("empAddr");
		String empTel = req.getParameter("empTel");
		String empEmail = req.getParameter("empEmail");
		String empName = req.getParameter("empName");
		String empPosit = req.getParameter("empPosit");
		int adminCode = Integer.parseInt(req.getParameter("adminCode"));
		int empState =Integer.parseInt(req.getParameter("empState"));
		int deptCode = Integer.parseInt(req.getParameter("deptCode"));
		
		IEmpService empService = EmpServiceImpl.getInstance();
		
		EmpVO empVO = new EmpVO();
		empVO.setEmpPw(empPw);
		empVO.setEmpAddr(empAddr);
		empVO.setEmpTel(empTel);
		empVO.setEmpEmail(empEmail);
		empVO.setEmpName(empName);
		empVO.setEmpPosit(empPosit);
		empVO.setAdminCode(adminCode);
		empVO.setEmpState(empState);
		empVO.setDeptCode(deptCode);
		
		int cnt = empService.registEmployee(empVO);
		
		String msg ="";
		
		if(cnt > 0) {
			msg = "성공";

			MailUtil sendMail = new MailUtil();
			sendMail.sendMail("임시 비밀번호가 발급되었습니다", "임시비밀번호 : "+ empPw , empEmail);
		} else {
			msg = "실패";
		}
		HttpSession session = req.getSession();
		session.setAttribute("msg", msg);
		resp.setCharacterEncoding("UTF-8");
		resp.sendRedirect(req.getContextPath() + "/list.do");

	}
}