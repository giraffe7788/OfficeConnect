package main.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import emp.service.EmpServiceImpl;
import emp.service.IEmpService;
import img.service.IImageService;
import img.service.ImageServiceImpl;
import util.TransEmpInfo;
import vo.EmpVO;
import vo.ImageVO;

@WebServlet("/main/mypage.do")
public class MyPage extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.getRequestDispatcher("/views/mypage.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String empNo = (String)req.getSession().getAttribute("empNo");
		IEmpService empService = EmpServiceImpl.getInstance();
		TransEmpInfo transform = TransEmpInfo.getInstance();
		
		String empName = req.getParameter("empName");
		String empEmail = req.getParameter("empEmail");
		String empTel = req.getParameter("empTel");
		String empAddr = req.getParameter("empAddr");
		
		EmpVO ev = empService.selectOne(empNo);
		
		req.setAttribute("ev", ev);
		
		EmpVO myempVO = new EmpVO(empName, empEmail, empTel, empAddr);
				
		int cnt = empService.changeEmployee(empNo);
		
		if(empNo != null && !empNo.isEmpty()) {		
			IImageService imageService = ImageServiceImpl.getInstance();
			
			ImageVO imageVO = imageService.getImage(empNo);
			
			req.setAttribute("imageVO", imageVO);
			
			System.out.println(imageVO);
		
			
		}
	}
}
