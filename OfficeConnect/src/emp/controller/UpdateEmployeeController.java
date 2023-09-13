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

import emp.service.EmpServiceImpl;
import emp.service.IEmpService;
import img.service.AtchFileServiceImpl;
import img.service.IAtchFileService;
import img.vo.AtchFileVO;
import vo.EmpVO;

@MultipartConfig
@WebServlet("/join/update.do")
public class UpdateEmployeeController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		String empNo = req.getParameter("empNo");
		
		IEmpService empService = EmpServiceImpl.getInstance();
		
		EmpVO ev = empService.getEmployee(empNo);
		
		req.setAttribute("ev", ev);
		
		if(empNo != null && !empNo.isEmpty()) {
			IAtchFileService fileService =
					AtchFileServiceImpl.getInstance();
			
			AtchFileVO atchFileVO = new AtchFileVO();
			atchFileVO.setEmpNo(ev.getEmpNo());
			
			List<AtchFileVO> fileList =
					fileService.getAtchFileList(atchFileVO);
			
			req.setAttribute("fileList", fileList);
		}
		
		req.getRequestDispatcher("/views/employee/updateForm.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		IEmpService empService = EmpServiceImpl.getInstance();

		req.setCharacterEncoding("UTF-8");
		String empNo = req.getParameter("empNo");
		String empPw = req.getParameter("empPw");
		String empName = req.getParameter("empName");
		String empPosit = req.getParameter("empPosit");
		String empTel = req.getParameter("empTel");
		String empEmail = req.getParameter("empEmail");
		String empAddr = req.getParameter("empAddr");
		int empState = Integer.parseInt(req.getParameter("empState"));
		int adminCode = Integer.parseInt(req.getParameter("adminCode"));
		int deptCode = Integer.parseInt(req.getParameter("deptCode"));
		
		// 파일 서비스 호출
		IAtchFileService fileService = AtchFileServiceImpl.getInstance();
		AtchFileVO atchFileVO = null;
		
		// 업로드 된 파일 처리(req.getParts() 사용), 객체에 새로운 파일정보 저장
		try {
			atchFileVO = fileService.saveAtchFileList(req.getParts());
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}

		EmpVO empVO = new EmpVO(empPw, empAddr, empTel, empEmail, empName, empPosit, adminCode, deptCode);
		empVO.setEmpState(empState);
		empVO.setEmpNo(empNo);
		
		AtchFileVO atchfileVO = new AtchFileVO();
		
		if(atchFileVO != null) {
			empVO.setEmpNo(empNo);
		}else {
			empVO.setEmpNo(atchFileVO.getEmpNo());
			atchfileVO.setImgName(atchFileVO.getImgName());
		}
		
		int cnt = empService.modifyEmployee(empVO); 
		if(atchFileVO != null) {
			atchFileVO.setEmpNo(empVO.getEmpNo());
			int fileResult = empService.updateFile(atchFileVO);
		}
		String msg = "";
		
		if(cnt > 0) {
			msg = "성공";
		}else {
			msg = "실패";
		}
		
		HttpSession session = req.getSession();
		session.setAttribute("msg", msg);
		
		resp.setCharacterEncoding("UTF-8");
		resp.sendRedirect(req.getContextPath() + "/join/list.do");
	}
	
}
