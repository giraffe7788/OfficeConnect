package approval.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import approval.service.ApprovalServiceImpl;
import approval.service.IApprovalService;
import util.SessionEmpInfo;
import vo.EmpVO;

@WebServlet("/approval/send.do")
public class ApprovalSend extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		IApprovalService approvalService = ApprovalServiceImpl.getInstance();
		
		String empNo = (String)req.getSession().getAttribute("empNo");
		EmpVO empVO = SessionEmpInfo.getInstance().getEmpVO(empNo);
		List<EmpVO> empList = approvalService.getAllSuperior(empVO);
		
		req.setAttribute("empList", empList);
		req.getRequestDispatcher("/views/approvalSend.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	}
}
