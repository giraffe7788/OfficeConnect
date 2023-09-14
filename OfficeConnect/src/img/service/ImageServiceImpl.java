package img.service;

import java.io.File;
import java.util.Collection;

import javax.servlet.http.Part;

import img.dao.IImageDao;
import img.dao.ImageDaoImpl;
import img.service.IImageService;
import vo.ImageVO;

public class ImageServiceImpl implements IImageService{

	public IImageDao imageDao = null;
	public static IImageService instance = null;
	private ImageServiceImpl() {
		imageDao = ImageDaoImpl.getInstance();
	}
	public static IImageService getInstance() {
		if (instance == null)
			instance = new ImageServiceImpl();
		return instance;
	}

	/** 파일 저장 */
	@Override
	public ImageVO saveImage(Collection<Part> parts, String empId) {
		
		String uploadPath = "/images/profiles/";
		String dir = "C:\\Users\\giraf\\git\\OfficeConnect\\OfficeConnect\\WebContent";

		File uploadDir = new File(dir + uploadPath);
		if (!uploadDir.exists()) {
			uploadDir.mkdir();
		}

		ImageVO imageVO = new ImageVO();

		boolean isFirstFile = true;

		for (Part part : parts) {
			String fileName = part.getSubmittedFileName();
			

			if (fileName != null && !fileName.equals("")) {
				if (isFirstFile) {
					isFirstFile = false;

				}

				String saveFilePath = "";
				saveFilePath = uploadDir + File.separator + fileName;

				try {
					part.write(saveFilePath);
					imageVO.setImgPath("../images/profiles/");
					imageVO.setImgName(fileName);
					imageVO.setEmpNo(empId);
					part.delete();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		
		return imageVO;
	}
	
	@Override
	public int insertImage(ImageVO imageVO) {
		return imageDao.insertImage(imageVO);
	}

	@Override
	public ImageVO getImage(String empNo) {
		return imageDao.getImage(empNo);
	}

	@Override
	public int updateImage(ImageVO imageVO) {
		return imageDao.updateImage(imageVO);
	}
}
