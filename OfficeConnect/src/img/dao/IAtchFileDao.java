package img.dao;

import java.util.List;

import img.vo.AtchFileVO;

public interface IAtchFileDao {

		/**
		 * 첨부파일 저장
		 * @param atchFileVO
		 * @return
		 */
		public int insertAtchFile(AtchFileVO atchFileVO);
		
		
		/**
		 * 첨부파일 목록 조회하기
		 * @param atchFileVO
		 * @return
		 */
		public List<AtchFileVO> getAtchFileList(AtchFileVO atchfileVO);
		
		
		/**
		 * 첨부파일 세부정보 조회하기
		 * @param atchFileVO
		 * @return
		 */
		public AtchFileVO getAtchFile(AtchFileVO atchfileVO);

}	
