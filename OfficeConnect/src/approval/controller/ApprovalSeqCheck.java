package approval.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import approval.service.ApprovalServiceImpl;
import approval.service.IApprovalService;

@WebServlet("/approval/check.do")
public class ApprovalSeqCheck extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		IApprovalService approvalService = ApprovalServiceImpl.getInstance();
		
		int apprNo = Integer.parseInt(req.getParameter("apprNo"));
		int apprlNo = approvalService.getApprVO(apprNo).getApprlNo();
		String empNo = (String)req.getSession().getAttribute("empNo");
		
		// 내가 몇번째 결재자인지 가져옴(1, 2, 3)
		int seq = approvalService.getApprovalSeq(apprlNo, empNo);
		
		// 지금 결재가 얼마나 진행됐는지 가져옴(0, 1, 2, 3)
		int progress = approvalService.getApprlVO(apprlNo).getApprlProg();
		
		// appr테이블의 상태코드를 가져왔는데 3(=반려)이면 boolean deny를 true로 설정, 그 외는 false로 설정
		boolean deny = approvalService.getApprVO(apprNo).getApprsCode() == 3? true : false;
		
		// appr테이블의 상태코드를 가져왔는데 2(=완료)이면 boolean done를 true로 설정, 그 외는 false로 설정
		boolean done = approvalService.getApprVO(apprNo).getApprsCode() == 2? true : false;
		
		// 내가 지금 결재차례가 맞으면 isCorrect를 true로 설정
		boolean isCorrect = (seq-1) == progress ? true : false;
		
		// 앞에 변수의 상태에 따라 jsp에 json타입으로 메시지를 보냄
		JsonObject jsonObject = new JsonObject();
		if(deny) {
			jsonObject.addProperty("result", "deny");
		} else if(done) {
			jsonObject.addProperty("result", "done");
		} else if(isCorrect) {
			jsonObject.addProperty("result", "ok");
		} else if(!isCorrect) {
			jsonObject.addProperty("result", "fail");
		} 
		String jsonStr = new Gson().toJson(jsonObject);
		resp.setContentType("application/json");
		resp.getWriter().write(jsonStr);
	}
}
