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
import util.TransEmpInfo;
import vo.EmpVO;

@WebServlet("/main/mypageUpdate.do")
public class MyPageChange extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			//req.getRequestDispatcher("/views/mypage.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		IEmpService empService = EmpServiceImpl.getInstance();	
		TransEmpInfo transform = TransEmpInfo.getInstance();
		
		String empNo = (String)req.getSession().getAttribute("empNo");
		
		String empName = req.getParameter("empName");
		String empEmail = req.getParameter("empEmail");
		String empTel = req.getParameter("empTel");
		String empAddr = req.getParameter("empAddr");
		
		EmpVO empVO = new EmpVO(empName, empEmail, empTel, empAddr);
		System.out.println("empName: " + empName +"empEmail: " + empEmail
							+ "empTel: " + empTel + "empAddr: " + empAddr);
		empVO.setEmpNo(empNo);
		
		int cnt = empService.modifyEmployee(empVO, false);
		
		if(cnt > 0) {
			System .out.println("회원 정보 수정 성공");
			
			JsonObject jsonObject = new JsonObject();
			jsonObject.addProperty("isSuccess", "ok");
			String jsonStr = new Gson().toJson(jsonObject);
			resp.setContentType("application/json");
			resp.getWriter().write(jsonStr);
		}else {
			System.out.println("회원 정보 수정 실패");
			
			JsonObject jsonObject = new JsonObject();
			jsonObject.addProperty("isSuccess", "fail");
			String jsonStr = new Gson().toJson(jsonObject);
			resp.setContentType("application/json");
			resp.getWriter().write(jsonStr);
		}	
	}
}
