package img.service;

import java.io.File;
import java.util.Collection;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.Part;

import img.dao.ImageDaoImpl;
import vo.ImageVO;
import img.dao.IImageFileDao;

public class ImageServiceImpl implements ImageService{
	
	private static ImageService fileService;
	
	private IImageFileDao fileDao;
	
	private ImageServiceImpl() {
		
		fileDao = ImageDaoImpl.getInstance();
	}
	
	public static ImageService getInstance() {
		if(fileService == null) {
			fileService = new ImageServiceImpl();
		}
		return fileService;
	}

	/** 파일 저장 */
	@Override
	public ImageVO saveAtchFileList(Collection<Part> parts) throws Exception {
		String uploadPath = "/images/profile";
		String dir = "C:/Users/PC-08/git/OfficeConnect/OfficeConnect/WebContent";
		
		File uploadDir = new File(dir+uploadPath);
		if(!uploadDir.exists()) {
			uploadDir.mkdir();
		}
		
		ImageVO atchFileVO = new ImageVO();
		
		
		boolean isFirstFile = true;
		
		for(Part part : parts) {
			
			String fileName = part.getSubmittedFileName();
			
			if(fileName != null && !fileName.equals("")) {
			if(isFirstFile) {
				isFirstFile = false;
				
			}
			
			String ImgName = fileName;
			String saveFilePath = "";
			String saveFileName = "";
			
			saveFileName = UUID.randomUUID().toString().replace("-","");
			
			saveFilePath = uploadDir + File.separator + saveFileName;

			String fileExtension = ImgName.lastIndexOf(".") < 0 ? "" :
				ImgName.substring(ImgName.lastIndexOf(".")+1);
			
			part.write(saveFilePath);
			atchFileVO.setImgPath(uploadPath);
			atchFileVO.setImgName(saveFileName);
			part.delete();
			}
		}
		
		return atchFileVO;
	}
	
	@Override
	public ImageVO getImage(String empNo) {
		return fileDao.getImage(empNo);
	}
	
	public static void main(String[] args) {
		System.out.println(UUID.randomUUID().toString());
	}
	
}