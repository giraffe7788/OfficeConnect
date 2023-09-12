package img.service;

import java.util.Collection;
import java.util.List;

import javax.servlet.http.Part;

import img.vo.AtchFileVO;

public interface IAtchFileService {

	
	/**
	 * 첨부파일 목록 저장
	 * @param Part정보를 꺼내기 위한 요청 객체
	 * @return empNo를 담고 있는 AtchFileVO 객체
	 */
	public AtchFileVO saveAtchFileList(Collection<Part> parts) throws Exception;

	
	/**
	 * 첨부파일 조회
	 * @param atchFileVO
	 * @return 첨부파일 목록
	 */
	public List<AtchFileVO> getAtchFileList(AtchFileVO atchFileVO);

	
	/**
	 * 첨부파일 정보 조회
	 * @param atchFileVO
	 * @return 첨부파일 정보
	 */
	public AtchFileVO getAtchFile(AtchFileVO atchFileVO);
	
}

