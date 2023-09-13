package img.service;

import java.util.Collection;
import java.util.List;

import javax.servlet.http.Part;

import vo.ImageVO;

public interface ImageService {

	
	/**
	 * 첨부파일 목록 저장
	 * @param Part정보를 꺼내기 위한 요청 객체
	 * @return empNo를 담고 있는 AtchFileVO 객체
	 */
	public ImageVO saveAtchFileList(Collection<Part> parts) throws Exception;

	
	/**
	 * 파라미터로 입력된 사번을 통해 프로필 사진을 찾아와서 정보를 ImageVO에 담아서 리턴
	 * @param empNo
	 * @return ImageVO
	 */
	public ImageVO getImage(String empNo);

	
}

