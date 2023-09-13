//package img.controller;
//import javax.servlet.http.HttpSession;
//
//import img.service.ImageService;
//import img.service.ImageServiceImpl;
//import vo.ImageVO;
//
//public class UpdateImage {
//	
//	// 파일 서비스 호출
//	ImageService fileService = ImageServiceImpl.getInstance();
//	ImageVO atchFileVO = null;
//	
//	// 업로드 된 파일 처리(req.getParts() 사용), 객체에 새로운 파일정보 저장
//	try {
//		atchFileVO = fileService.saveAtchFileList(req.getParts());
//		
//	}catch(Exception ex) {
//		ex.printStackTrace();
//	}
//ImageVO atchfileVO = new ImageVO();
//
//if(atchFileVO != null) {
//empVO.setEmpNo(empNo);
//}else {
//empVO.setEmpNo(atchFileVO.getEmpNo());
//atchfileVO.setImgName(atchFileVO.getImgName());
//}
//
//int cnt = empService.modifyEmployee(empVO); 
//if(atchFileVO != null) {
//atchFileVO.setEmpNo(empVO.getEmpNo());
//int fileResult = empService.updateFile(atchFileVO);
//}
//String msg = "";
//
//if(cnt > 0) {
//msg = "성공";
//}else {
//msg = "실패";
//}
//
//HttpSession session = req.getSession();
//session.setAttribute("msg", msg);
//
//resp.setCharacterEncoding("UTF-8");
//resp.sendRedirect(req.getContextPath() + "/join/list.do");
//}
