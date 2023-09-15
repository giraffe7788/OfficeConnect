package board.dao;

import java.util.List;

import vo.BoardVO;

/**
 * 실제 DB와 연결해서 SQL문을 수행한 후 결 과를 작성하여 서비스에 
 * 전달하는 DAO 
 * @author PC-05
 *
 */
public interface IBoardDao {

	/**
	 * BoardVO에 담겨진 데이터를 DB에 insert하기 위한 메서드
	 * @param bv DB에 등록할 데이터가 담겨진 BoardVO객체
	 * @return DB작업이 성공하면 1이상의 값이 반환되고, 실패하면 0이 반환됨
	 */
	public int insertBoard(BoardVO bv);
	
	/**
	 * 
	 * BoardVO에 담겨진 데이터를 DB에 update하기 위한 메서드
	 * @param bv DB에  수정할 데이터가 담겨진 BoardVO객체
	 * @return DB작업이 성공하면 1이 반환되고, 실패하면 0이 반환됨.
	 */
	public int updateBoard(BoardVO bv);
	
	/**
	 * 해당 ID에 해당하는 게시판정보를 삭제하기 위한 메서드
	 * @param brdNo 삭제할 게시판번호
	 * @return 삭제성공하면 1, 실패하면 0반환됨
	 */
	public int deleteBoard(int brdNo);
	
	/**
	 * 해당 ID에 해당하는 게시판정보가 존재하는지 확인하기 위한 메서드
	 * @param memId 체크할 게시판 ID
	 * @return 해당 게시판이 존재하면 true, 존재하지 않으면 false 리턴함
	 */
	public boolean checkBoard(String empNo);

	/**
	 * 해당 ID에 해당하는 게시판정보를 위한 메서드
	 * @param memId 체크할 게시판 ID
	 * @return 해당 게시판의 정보를 담은 BoardVO객체
	 */
	public BoardVO detailBoard(int brdNo);
	
	/**
	 * 전체 게시판정보를 가져오기 위한 메서드 
	 * @return 전체 게시판정보를 담은 리스트
	 */
	public List<BoardVO> selectAll();
	

	/**
	 * 게시판정보를 검색하기 위한 메서드
	 * @param bv 검색할 게시판정보를 담은 BoardVO객체
	 * @return 검색된 게시판정보를 담은 List객체
	 */
	public List<BoardVO> searchBoard(BoardVO bv);
	
	
}
