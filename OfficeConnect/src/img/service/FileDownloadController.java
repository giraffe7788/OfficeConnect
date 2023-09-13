package img.service;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import vo.ImageVO;

@MultipartConfig
@WebServlet("/join/download.do")
public class FileDownloadController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String empNo = req.getParameter("empNo");
		String imgName = req.getParameter("imgName");
		
		ImageService fileService = ImageServiceImpl.getInstance();
		
		ImageVO fileVO = new ImageVO();

		fileVO.setEmpNo(empNo);
		fileVO.setImgName(imgName);
		List<ImageVO> atchFileList = fileService.getAtchFileList(fileVO);

		/** 다운로드 */
		resp.setContentType("application/octet-stream");
		String imgPath = "C:/Users/PC-08/git/OfficeConnect/OfficeConnect/WebContent"+atchFileList.get(0).getImgPath()+"/"+atchFileList.get(0).getImgName();
		//imgPath경로에 파일이 있어야 data뽑아낼때 프로필사진을 화면에 표시해줌, 저 밑에 업로드 시 write(data)할때 인풋스트림에 경로안넣어주면 웹상에 이미지 보이게 못한다는 소리
		//나중에 다운로드 필요할때 이쪽 다시 만져야함. 지금은 프로필변경에 다운로드 필요 없어서 그냥 두는걸로
		try{
			resp.setHeader("Content-Disposition", "attachment; filename=\"" + URLEncoder.encode(atchFileList.get(0).getImgName(),"UTF-8").replaceAll("\\+", "%20") + "\""); //DB에 있는 정보를 replace해줌
		} catch(Exception e) {
			e.printStackTrace();
		}
		/** 업로드 */
		//파일 업로드는 파일의 원본 이름과 확장자를 보여주지않고 랜덤한 문자열로 저장하는 것이 일반적임(ed47cc7e68ce4df4a13c0e82035b9ec2같은..)
		//why? 파일명에 따른 보안 문제 방지, 파일 이름에 특수 문자가 들어가서 발생하는 문제를 예방하기 위함
		//	      그래서 저장 파일명(랜덤문자열), 원본 파일명, 확장자가 필요한거고 실제로도 따로 파일을 빼서 관리함
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
