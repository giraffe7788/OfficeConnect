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
import vo.ApprovalVO;

@WebServlet("/approval/receiveList.do")
public class ApprovalReceiveList extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		IApprovalService approvalService = ApprovalServiceImpl.getInstance();
		String empNo = (String)req.getSession().getAttribute("empNo");
		List<ApprovalVO> apprList = approvalService.selectReceiveAppr(empNo);
		
		req.setAttribute("apprList", apprList);
		req.getRequestDispatcher("/views/approvalBoxReceive.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	}
}
