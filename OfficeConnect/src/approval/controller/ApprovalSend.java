package approval.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import approval.service.ApprovalServiceImpl;
import approval.service.IApprovalService;
import util.MyBatisUtil;
import util.SessionEmpInfo;
import vo.ApprovalLineVO;
import vo.ApprovalVO;
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
		
		IApprovalService approvalService = ApprovalServiceImpl.getInstance();
		
		String empNo = (String)req.getSession().getAttribute("empNo");
		String seq1 = req.getParameter("seq1");
		String seq2 = req.getParameter("seq2");
		String seq3 = req.getParameter("seq3");
		String data = req.getParameter("data");
		int type = Integer.parseInt(req.getParameter("type"));
		
		System.out.println("seq1 : " + seq1 + " seq2 : " + seq2 + " seq3 : " + seq3 + " type : " + type + " data : " + data);

		ApprovalLineVO apprlVO = new ApprovalLineVO(seq1, seq2, seq3);
		ApprovalVO apprVO = new ApprovalVO(empNo, data, type);
		int cnt = approvalService.insertApproval(apprVO, apprlVO);
		
		if(cnt > 0) {
						
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
