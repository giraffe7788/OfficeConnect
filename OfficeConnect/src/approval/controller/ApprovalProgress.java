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
import vo.ApprovalLineVO;
import vo.ApprovalVO;

@WebServlet("/approval/progress.do")
public class ApprovalProgress extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		IApprovalService approvalService = ApprovalServiceImpl.getInstance();
		
		int apprNo = Integer.parseInt(req.getParameter("apprNo"));
		String approvalState = req.getParameter("approvalState");
		
		int cnt = 0;
		
		if(approvalState.equals("승인")) {
			
			ApprovalVO apprVO = approvalService.getApprVO(apprNo);
			ApprovalLineVO apprlVO = approvalService.getApprlVO(apprVO.getApprlNo());
		
			int cnt1 = 1;
			
			// 진행상황이 0이면 결재상태코드를 1로 바꾼다(대기중이던 문서의 상태를 진행중으로 변경)
			if(apprlVO.getApprlProg() == 0) {
				cnt1 = approvalService.setApprsCode(apprNo, 1);
			// 진행상황이 2이면 결재상태코드를 2로 바꾼다(진행중이던 문서의 결재가 완료되면 승인완료로 변경)
			} else if(apprlVO.getApprlProg() == 2) {
				cnt1 = approvalService.setApprsCode(apprNo, 2);
			}
			
			
			// 진행상황이 0이면서 문서타입이2(연차휴가신청서는 결재1번만 하면 됨)이면 결재상태코드를 2로 바꾼다(승인완료)
			if(apprlVO.getApprlProg() == 0 && apprVO.getApprType() == 2) {
				cnt1 = approvalService.setApprsCode(apprNo, 2);
			}
			
			// 결재 진행상황 1 증가 (0 1 2 3)
			int cnt2 = approvalService.addApprProg(apprlVO.getapprlNo());
			
			cnt = cnt1 * cnt2;
			System.out.println("cnt1 : " + cnt1);
			System.out.println("cnt2 : " + cnt2);
			System.out.println("cnt : " + cnt);
		} else if(approvalState.equals("반려")) {
			cnt = approvalService.setApprsCode(apprNo, 3);
		} else {
			System.out.println("approvalState 오류");
		}
		
		JsonObject jsonObject = new JsonObject();
		if(cnt > 0) {
			jsonObject.addProperty("isSuccess", "ok");
		} else {
			jsonObject.addProperty("isSuccess", "fail");
		}
		String jsonStr = new Gson().toJson(jsonObject);
		resp.setContentType("application/json");
		resp.getWriter().write(jsonStr);
	}
}
