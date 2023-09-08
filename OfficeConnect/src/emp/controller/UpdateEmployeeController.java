package emp.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import emp.service.EmpServiceImpl;
import emp.service.IEmpService;
import vo.EmpVO;

@WebServlet("/update.do")
public class UpdateEmployeeController extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		String empNo = req.getParameter("empNo");
		
		IEmpService empService = EmpServiceImpl.getInstance();
		
		EmpVO ev = empService.getEmployee(empNo);
		
		req.setAttribute("ev", ev);
		
		req.getRequestDispatcher("/views/employee/updateForm.jsp").forward(req, resp);
			
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
		empVO.setDeptCode(deptCode);
		
		int cnt = empService.modifyEmployee(empVO);
		
		String msg = "";
		
		if(cnt > 0) {
			msg = "성공";
		}else {
			msg = "실패";
		}
		
		HttpSession session = req.getSession();
		session.setAttribute("msg", msg);
		
		resp.sendRedirect(req.getContextPath() + "/employee/list.do");
		resp.setCharacterEncoding("UTF-8");
	}

}
