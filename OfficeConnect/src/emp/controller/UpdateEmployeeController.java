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
		
		
		// 새로 파일 첨부해주면 ( atchFileVO(=getPart로 가져온애)가 null이 아니면 )
		if(atchFileVO != null) {
			
			Part part = req.getPart("atchFile"); // 파일 파라미터 이름은 HTML 폼에서 파일 업로드 필드의 name 속성 값과 일치해야 합니다.
			
			// 파일명 추출
		    String imgName = getFileName(part);
			// 파일 경로 추출
		    String imgPath = part.getHeader("content-disposition");

		    // 파일 경로에서 실제 파일명 추출
		    if (imgPath != null && imgPath.contains("filename=")) {
		        int startIndex = imgPath.indexOf("filename=") + "filename=".length();
		        int endIndex = imgPath.lastIndexOf("\"");
		        if (startIndex != -1 && endIndex != -1) {
		        	imgName = imgPath.substring(startIndex, endIndex);
		        }
		    }
		}
		
		int fileResult = 0;
		int cnt = empService.modifyEmployee(empVO); 
		if(atchFileVO != null) {
			fileResult = empService.updateFile(atchFileVO);
		}
		String msg = "";
		
		if(cnt > 0) {
			msg = "성공";
		}else {
			msg = "실패";
		}
		
		if(fileResult > 0) {
			System.out.println("파일첨부 성공");
		} else {
			System.out.println("실패");
		}
		
		HttpSession session = req.getSession();
		session.setAttribute("msg", msg);
		
		resp.setCharacterEncoding("UTF-8");
		resp.sendRedirect(req.getContextPath() + "/join/list.do");
	}
	
	// 파일명 추출을 위한 메서드
	private String getFileName(Part part) {
	    for (String content : part.getHeader("content-disposition").split(";")) {
	        if (content.trim().startsWith("filename")) {
	            return content.substring(content.indexOf('=') + 1).trim().replace("\"", "");
	        }
	    }
	    return null;
	}
}
