package img.service;

import java.util.Collection;
import java.util.List;

import javax.servlet.http.Part;

import vo.ImageVO;

public interface IImageService {

	/**
	 * 파라미터로 파일정보와 회원id넣음, 리턴타입으로 ImageVO를 만들어서 뱉음
	 * @param parts
	 * @param empId
	 * @return
	 */
	public ImageVO saveImage(Collection<Part> parts, String empId);
	
	/**
	 * 파라미터로 입력된 사번을 통해 프로필 사진을 찾아와서 정보를 ImageVO에 담아서 리턴
	 * @param empNo
	 * @return ImageVO
	 */
	public ImageVO getImage(String empNo);

	/**
	 * 파라미터로 입력된 imageVO를 db에 넣어줌
	 * @param imageVO
	 * @return 성공여부
	 */
	public int insertImage(ImageVO imageVO);
	
	/**
	 * 파라미터로 입력된 imageVO로 db의 image테이블값 변경
	 * @param imageVO
	 * @return 성공여부
	 */
	public int updateImage(ImageVO imageVO);
}

