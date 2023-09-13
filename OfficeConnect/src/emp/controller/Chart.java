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

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import emp.service.EmpServiceImpl;
import emp.service.IEmpService;
import img.service.ImageServiceImpl;
import util.TransEmpInfo;
import vo.EmpVO;
import vo.ImageVO;

@WebServlet("/emp/chart.do")
public class Chart extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		IEmpService empService = EmpServiceImpl.getInstance();
		List<EmpVO> empList = empService.selectAll();
		System.out.println(empList);
		
		req.setAttribute("empList", empList);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/views/empChart.jsp");
		dispatcher.forward(req, resp);
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		IEmpService empService = EmpServiceImpl.getInstance();
		// parameter로 넘겨준 사번으로 사원정보를 찍어주기 위한 empVO와 imageVO를 가져옴
		String empNo = req.getParameter("empNo");
		EmpVO empVO = empService.selectOne(empNo);
		ImageVO imageVO = ImageServiceImpl.getInstance().getImage(empNo);
		
		//json형태로 데이터 넘김
		JsonObject jsonObject = new JsonObject();
		jsonObject.addProperty("empNo", empVO.getEmpNo());
		jsonObject.addProperty("empName", empVO.getEmpName());
		jsonObject.addProperty("empPosit", empVO.getEmpPosit());
		jsonObject.addProperty("empTel", empVO.getEmpTel());
		jsonObject.addProperty("empDept", TransEmpInfo.getInstance().transformDeptCode(empVO.getDeptCode()));
		jsonObject.addProperty("empState", TransEmpInfo.getInstance().transformStateCode(empVO.getStateCode()));
		jsonObject.addProperty("imgName", imageVO.getImgName());
		jsonObject.addProperty("imgPath", imageVO.getImgPath());
		String jsonStr = new Gson().toJson(jsonObject);
		resp.setContentType("application/json");
		resp.getWriter().write(jsonStr);

	}
}
