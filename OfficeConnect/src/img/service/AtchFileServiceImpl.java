package img.service;

import java.io.File;
import java.util.Collection;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.Part;

import img.dao.AtchFileDaoImpl;
import img.dao.IAtchFileDao;
import img.vo.AtchFileVO;

public class AtchFileServiceImpl implements IAtchFileService{
	
	private static IAtchFileService fileService;
	
	private IAtchFileDao fileDao;
	
	private AtchFileServiceImpl() {
		
		fileDao = AtchFileDaoImpl.getInstance();
	}
	
	public static IAtchFileService getInstance() {
		if(fileService == null) {
			fileService = new AtchFileServiceImpl();
		}
		return fileService;
	}

	/** 파일 저장 */
	@Override
	public AtchFileVO saveAtchFileList(Collection<Part> parts) throws Exception {
		String uploadPath = "/images/profile";
		String dir = "C:/Users/PC-08/git/OfficeConnect/OfficeConnect/WebContent";
		
		File uploadDir = new File(dir+uploadPath);
		if(!uploadDir.exists()) {
			uploadDir.mkdir();
		}
		
		AtchFileVO atchFileVO = new AtchFileVO();
		
		
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
	public List<AtchFileVO> getAtchFileList(AtchFileVO atchFileVO) {
		return fileDao.getAtchFileList(atchFileVO);
	}

	@Override
	public AtchFileVO getAtchFile(AtchFileVO atchFileVO) {
		return fileDao.getAtchFile(atchFileVO);
	}
	
	public static void main(String[] args) {
		System.out.println(UUID.randomUUID().toString());
	}
	
}