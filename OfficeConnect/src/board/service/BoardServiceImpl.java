package board.service;

import java.util.List;

import board.dao.BoardDaoImpl;
import board.dao.IBoardDao;

import vo.BoardVO;


public class BoardServiceImpl implements IBoardService {

	private IBoardDao BoardDao;

//	private static BoardServiceImpl Boardservice; 
//	
//	public static IBoardService getInstance() {
//		if(Boardservice service ==null) {
//			service = new 
//		}
//	}
//	

	private static IBoardService BoardService;

	private BoardServiceImpl() {
//		BoardDao = BoardDaoImplWithJDBC.getInstance();
		BoardDao = BoardDaoImpl.getInstance();

	}

	public static IBoardService GetInstance() {
		if (BoardService == null) {
			BoardService = new BoardServiceImpl();
		}
		return BoardService;
	}

	@Override
	public int insertBoard(BoardVO bv) {

		int cnt = BoardDao.insertBoard(bv);
		// TODO Auto-generated method stub
		return cnt;
	}

	@Override
	public int deleteBoard(int brdNo) {
		// TODO Auto-generated method stub
		int cnt = BoardDao.deleteBoard(brdNo);
		return cnt;
	}



	@Override
	public List<BoardVO> selectAll() {
		// TODO Auto-generated method stub
		List<BoardVO> boardList = BoardDao.selectAll();
		return boardList;
	}

	@Override
	public BoardVO detailBoard(int empNo) {
		
		return BoardDao.detailBoard(empNo);
	}

	@Override
	public int updateBoard(BoardVO bv) {
		int cnt = BoardDao.updateBoard(bv);
		return cnt;
	}

	@Override
	public int updateViews(int brdNo) {
		int cnt = BoardDao.updateViews(brdNo);
		return cnt;
	}




	
}
