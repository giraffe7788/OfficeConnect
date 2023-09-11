package emp.comm.service;

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

import emp.comm.vo.AtchFileVO;

@MultipartConfig
@WebServlet("/download.do")
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
		try{
			resp.setHeader("Content-Disposition", "attachment; filename=\"" + URLEncoder.encode(atchFileVO.getOrignFileName(),"UTF-8").replaceAll("\\+", "%20") + "\""); //DB에 있는 정보를 replace해줌
		} catch(Exception e) {
			e.printStackTrace();
		}
		/** 업로드 */
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
