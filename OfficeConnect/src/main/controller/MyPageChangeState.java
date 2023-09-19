package main.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import emp.service.EmpServiceImpl;
import emp.service.IEmpService;
import vo.EmpVO;

@WebServlet("/main/mypageChangeState.do")
public class MyPageChangeState extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/views/mypages.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		IEmpService empService = EmpServiceImpl.getInstance();
		
		String empNo = (String)req.getSession().getAttribute("empNo");
		int stateCode = Integer.parseInt(req.getParameter("currentState"));
		
		EmpVO empVO = new EmpVO(empNo, stateCode);
		empVO.setEmpNo(empNo);
		
		int cnt = empService.updateEmployeeState(empVO);
		
		System.out.println( "empNo: " + empNo + "  cnt:  " + cnt);
		
		if(cnt > 0) {
			System.out.println("상태 수정 성공");
			
			JsonObject jsonObject = new JsonObject();
			jsonObject.addProperty("isSuccess", "ok");
			String jsonStr = new Gson().toJson(jsonObject);
			resp.setContentType("application/json");
			resp.getWriter().write(jsonStr);
		} else {
			System.out.println("상태 수정 실패");
			
			JsonObject jsonObject = new JsonObject();
			jsonObject.addProperty("isSuccess", "fail");
			String jsonStr = new Gson().toJson(jsonObject);
			resp.setContentType("application/json");
			resp.getWriter().write(jsonStr);
		}
	}
}
