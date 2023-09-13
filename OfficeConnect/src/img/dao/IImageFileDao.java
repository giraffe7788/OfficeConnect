package img.dao;

import java.util.List;

import vo.ImageVO;

public interface IImageFileDao {

		/**
		 * 첨부파일 저장
		 * @param atchFileVO
		 * @return
		 */
		public int insertAtchFile(ImageVO atchFileVO);
		
		
		/**
		 * 파라미터로 입력된 사번을 통해 프로필 사진을 찾아와서 정보를 ImageVO에 담아서 리턴
		 * @param empNo
		 * @return ImageVO
		 */
		public ImageVO getImage(String empNo);

}	
