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

}	
