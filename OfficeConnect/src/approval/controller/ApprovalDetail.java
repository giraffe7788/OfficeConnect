package approval.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import approval.service.ApprovalServiceImpl;
import approval.service.IApprovalService;
import vo.ApprovalLineVO;
import vo.ApprovalVO;

@WebServlet("/approval/detail.do")
public class ApprovalDetail extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		IApprovalService approvalService = ApprovalServiceImpl.getInstance();
		int apprNo = Integer.parseInt(req.getParameter("apprNo"));
		ApprovalVO apprVO = approvalService.getApprVO(apprNo);
		ApprovalLineVO apprlVO = approvalService.getApprlVO(apprVO.getApprlNo());
		
		req.setAttribute("apprVO", apprVO);
		req.setAttribute("apprlVO", apprlVO);
		req.getRequestDispatcher("/views/approvalDetail.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
	}
}
