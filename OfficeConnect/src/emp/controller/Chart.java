package emp.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import emp.service.EmpServiceImpl;
import emp.service.IEmpService;
import vo.EmpVO;

@WebServlet("/empChart.do")
public class Chart extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		IEmpService empService = EmpServiceImpl.getInstance();
		List<EmpVO> empList = empService.selectAll();
		System.out.println(empList);
		
		req.setAttribute("empList", empList);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/empChart.jsp");
		dispatcher.forward(req, resp);
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String empNo = req.getParameter("empNo");
		
		// 얘를 다시 서비스로 보내 준 다음 다오로 넘겨줘서 (xml)에 쿼리 작성, 그 다음 불러 온 그 데이터를 다시 jsp 로 보내줌 
		IEmpService empService = EmpServiceImpl.getInstance();
		
		EmpVO empVO = empService.empChart(empNo);
		
		resp.setCharacterEncoding("utf-8");
		
		PrintWriter out = resp.getWriter();
		
		//json형태로 데이터 넘김
		out.println("{\"empNo\": \"" + empVO.getEmpNo() + "\", \"empName\": \"" + empVO.getEmpName() + "\", \"empPosit\": \"" + empVO.getEmpPosit() + "\", \"empTel\": \"" + empVO.getEmpTel() + "\", \"deptCode\": \"" + empVO.getDeptCode() + "\"}");
		
		
	}
}
