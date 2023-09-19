  package emp.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import emp.service.EmpServiceImpl;
import emp.service.IEmpService;
import img.service.ImageServiceImpl;
import util.TransEmpInfo;
import img.service.IImageService;
import vo.ImageVO;
import vo.EmpVO;

@MultipartConfig
@WebServlet("/emp/update.do")
public class Update extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		IEmpService service = EmpServiceImpl.getInstance();
		TransEmpInfo transform = TransEmpInfo.getInstance();

		// form에서 업데이트 정보들을 가져와서 회원 정보 수정
		req.setCharacterEncoding("UTF-8");
		String empNo = req.getParameter("empNo");
		String empPw = req.getParameter("empPw");
		String empName = req.getParameter("empName");
		String empTel = req.getParameter("empTel");
		String empEmail = req.getParameter("empEmail");
		String empAddr = req.getParameter("empAddr");
		String empPosit = req.getParameter("empPosit");
		int stateCode = transform.transformStateName(req.getParameter("empState"));
		int adminCode = Boolean.parseBoolean(req.getParameter("isAdmin"))? 1 : 0;
		int deptCode = transform.transformDeptName(req.getParameter("empDept"));
		
		EmpVO empVO = new EmpVO(empPw, empAddr, empTel, empEmail, empName, empPosit, adminCode, deptCode);
		empVO.setStateCode(stateCode);
		empVO.setEmpNo(empNo);
		empVO.setAdminCode(adminCode);
		
		int cnt = service.modifyEmployee(empVO, true);
		
		if (cnt>0) {
			System.out.println("회원 정보 수정 성공");
			
			JsonObject jsonObject = new JsonObject();
			jsonObject.addProperty("isSuccess", "ok");
			String jsonStr = new Gson().toJson(jsonObject);
			resp.setContentType("application/json");
			resp.getWriter().write(jsonStr);
		} else {
			System.out.println("회원 정보 수정 실패");
			
			JsonObject jsonObject = new JsonObject();
			jsonObject.addProperty("isSuccess", "fail");
			String jsonStr = new Gson().toJson(jsonObject);
			resp.setContentType("application/json");
			resp.getWriter().write(jsonStr);
		}
	}
}
