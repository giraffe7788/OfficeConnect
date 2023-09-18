package img.dao;

import java.util.List;

import vo.ImageVO;

public interface IImageDao {

	/**
	 * 파라미터로 입력된 imageVO를 db에 넣어줌
	 * @param imageVO
	 * @return 성공여부
	 */
	public int insertImage(ImageVO imageVO);

	/**
	 * 파라미터로 입력된 사번을 통해 프로필 사진을 찾아와서 정보를 ImageVO에 담아서 리턴
	 * @param empNo
	 * @return ImageVO
	 */
	public ImageVO getImage(String empNo);
	
	/**
	 * 파라미터로 입력된 imageVO로 db의 image테이블값 변경
	 * @param imageVO
	 * @return 성공여부
	 */
	public int updateImage(ImageVO imageVO);
}
