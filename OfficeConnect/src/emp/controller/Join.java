package emp.controller;

import java.io.File;
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
import img.service.IImageService;
import util.MailUtil;
import util.TransEmpInfo;
import vo.ImageVO;
import vo.EmpVO;

@MultipartConfig
@WebServlet("/emp/join.do")
public class Join extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("서블릿옴?");
		req.getRequestDispatcher("/views/empRegister.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		IEmpService empService = EmpServiceImpl.getInstance();
		IImageService imageService = ImageServiceImpl.getInstance();
		TransEmpInfo transform = TransEmpInfo.getInstance();

		String empNo = req.getParameter("empNo");
		String empPw = req.getParameter("empPw");
		String empAddr = req.getParameter("empAddr");
		String empTel = req.getParameter("empTel");
		String empEmail = req.getParameter("empEmail");
		String empName = req.getParameter("empName");
		String empPosit = req.getParameter("empPosit");
		System.out.println("empNo : " + empNo + " empPosit : " + empPosit);
		System.out.println(req.getParameter("isAdmin"));
		System.out.println(req.getParameter("empDept"));
		int adminCode = Boolean.parseBoolean(req.getParameter("isAdmin")) ? 1 : 0;
		int deptCode = transform.transformDeptName(req.getParameter("empDept"));

		EmpVO empVO = new EmpVO(empPw, empAddr, empTel, empEmail, empName, empPosit, adminCode, deptCode);
		empVO.setEmpNo(empNo);

		int cnt = empService.registEmployee(empVO);

		if (cnt > 0) {
			
			ImageVO imageVO = imageService.saveImage(req.getParts(), empNo);
			if(imageService.insertImage(imageVO) > 0) {
				System.out.println("ImageVO db 삽입 성공");
			} else {
				System.out.println("ImageVO db 삽입 실패");
			}
			
			System.out.println("회원가입성공");

			MailUtil sendMail = new MailUtil();
			sendMail.sendMail("임시 비밀번호가 발급되었습니다", "사번 : " + empVO.getEmpNo() + "<br>임시 비밀번호 : " + empPw, empEmail);

			JsonObject jsonObject = new JsonObject();
			jsonObject.addProperty("isSuccess", "ok");
			String jsonStr = new Gson().toJson(jsonObject);
			resp.setContentType("application/json");
			resp.getWriter().write(jsonStr);
		} else {
			System.out.println("회원가입실패");

			JsonObject jsonObject = new JsonObject();
			jsonObject.addProperty("isSuccess", "fail");
			String jsonStr = new Gson().toJson(jsonObject);
			resp.setContentType("application/json");
			resp.getWriter().write(jsonStr);
		}
	}
}