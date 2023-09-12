package img.service;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import img.vo.AtchFileVO;

@MultipartConfig
@WebServlet("/join/download.do")
public class FileDownloadController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String empNo = req.getParameter("empNo");
		String imgExtin = req.getParameter("imgExtin");
		
		IAtchFileService fileService = AtchFileServiceImpl.getInstance();
		
		AtchFileVO fileVO = new AtchFileVO();

		fileVO.setEmpNo(empNo);
		fileVO.setImgExtin(imgExtin);
		AtchFileVO atchFileVO = fileService.getAtchFile(fileVO);
		
		/** 다운로드 */
		resp.setContentType("application/octet-stream");
		String imgPath = "C:/Users/PC-08/git/OfficeConnect/OfficeConnect/WebContent"+atchFileVO.getImgPath()+"/"+atchFileVO.getImgExtin();
		//여기 위에 imgPath 변수 경로에 파일이 있어야 저 아래의 data변수에서 프로필사진을 화면에 표시해주는것 같음
		try{
			resp.setHeader("Content-Disposition", "attachment; filename=\"" + URLEncoder.encode(atchFileVO.getOrignFileName(),"UTF-8").replaceAll("\\+", "%20") + "\""); //DB에 있는 정보를 replace해줌
		} catch(Exception e) {
			e.printStackTrace();
		}
		/** 업로드 */
		//파일 업로드는 파일의 원본 이름과 확장자를 유지하지 않고 랜덤한 문자열로 저장하는 것이 일반적임
		//why? 파일명에 따른 보안 문제 방지, 파일 이름에 특수 문자가 들어가더라도 문제가 발생하지 않도록 하기 위함
		FileInputStream fis = new FileInputStream(imgPath);
		OutputStream out = resp.getOutputStream();
		BufferedInputStream bis = new BufferedInputStream(fis);
		BufferedOutputStream bos = new BufferedOutputStream(out);
		
		int data = 0;
		
		while((data = bis.read()) != -1 ) {
			bos.write(data);
		}
		
		bis.close();
		bos.close();
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	doGet(req, resp);
	}

}
