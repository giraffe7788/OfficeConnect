package notice.service;

import java.util.List;


import vo.NoticeVO;


/**
 *  
 * 서비스를 위한 Interface
 * @author PC-05
 *
 */
public interface INoticeService {

	/**
	 * 게시판정보 등록을 위한 메서드
	 * @param bv 에 등록할 데이터가 담겨진 NoticeVO객체
	 * @return 게시판등록이 성공하면 1이상의 값이 반환되고, 실패하면 0이 반환됨
	 */
	public int insertNotice(NoticeVO bv);
	
	/**
	 * 게시판정보를 수정 위한 메서드
	 * @param bv 변경할 데이터가 담겨진 NoticeVO객체
	 * @return 변경작업이 성공하면 1이 반환되고, 실패하면 0이 반환됨.
	 */
	
	public int updateNotice(NoticeVO bv);

	
	public int updateViews(int ntrNo);
	
	/**
	 * 해당 ID에 해당하는 게시판정보를 삭제하기 위한 메서드
	 * @param brdNo 삭제할 게시판ID
	 * @return 삭제성공하면 1, 실패하면 0반환됨
	 */
	public int deleteNotice(int ntrNo);
	


	/**
	 * 전체 게시판정보를 가져오기 위한 메서드 
	 * @return 전체 게시판정보를 담은 리스트
	 */
	public List<NoticeVO> selectAll();
	
	
	public NoticeVO detailNotice(int ntrNo);
	
	/**
	 * 게시판정보를 검색하기 위한 메서드
	 * @param bv 검색할 게시판정보를 담은 NoticeVO객체
	 * @return 검색된 게시판정보를 담은 List객체
	 */

	
	
}
