package emp.controller;

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

@WebServlet("/emp/check.do")
public class EmpNoCheck extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		IEmpService service = EmpServiceImpl.getInstance();
		String empNo = req.getParameter("empNo");
		
		System.out.println("empNo = " + empNo);
		
		boolean isExist = service.checkEmployee(empNo);
		
		if(isExist) {
			
			JsonObject jsonObject = new JsonObject();
			jsonObject.addProperty("isExist", "ok");
			String jsonStr = new Gson().toJson(jsonObject);
			resp.setContentType("application/json");
			resp.getWriter().write(jsonStr);
			
		} else {

			JsonObject jsonObject = new JsonObject();
			jsonObject.addProperty("isExist", "fail");
			String jsonStr = new Gson().toJson(jsonObject);
			resp.setContentType("application/json");
			resp.getWriter().write(jsonStr);
		}
	}
}

