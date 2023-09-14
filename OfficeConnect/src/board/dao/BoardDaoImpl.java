package board.dao;

import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import board.vo.BoardVO;
import util.MyBatisUtil;


public class BoardDaoImpl implements IBoardDao{

	private static IBoardDao boardDao;
	private BoardDaoImpl() {
		// TODO Auto-generated constructor stub
	}
	public static IBoardDao getInstance() {
		if(boardDao == null) {
			boardDao = new BoardDaoImpl();
		}
		return boardDao;
	}
	

	
	@Override
	public int insertBoard(BoardVO bv) {
		// TODO Auto-generated method stub
		SqlSession session = MyBatisUtil.getInstance();
		
		int cnt = 0;
		
		try {
			
			cnt =session.insert("board.boardInsert", bv);
			if(cnt > 0) {
				session.commit();
			}
			
		} catch (PersistenceException e) {
			// TODO: handle exception
			e.printStackTrace();
			session.rollback();
		}finally {
			session.close();
		}
		
		return cnt;
	}

	

	@Override
	public int updateBoard(BoardVO bv) {
		int cnt =0;
		
		SqlSession session = MyBatisUtil.getInstance();
		try {
			
			cnt = session.update("board.updateboard",bv);
			if(cnt>0) {
				session.commit();
			}
					
		} catch (PersistenceException e) {
			e.printStackTrace();
			session.rollback();
			// TODO: handle exception
		}finally {
			session.close();
		}
		return cnt;
	}

	@Override
	public int deleteBoard(int brdNo) {
		int cnt = 0;
		
		SqlSession session = MyBatisUtil.getInstance();
		
		try {
		
			cnt = session.delete("board.deleteboard",brdNo);
		if(cnt>0) {
			session.commit();
		}
			
		} catch (PersistenceException e) {
			// TODO: handle exception
			e.printStackTrace();
			session.rollback();
		}finally {
			session.close();
			
			
		}
		
		return cnt;
	}

	@Override
	public boolean checkBoard(String empNo) {
		
		boolean isExist = false;
		
		SqlSession session = MyBatisUtil.getInstance();
		
		try {
			int cnt = session.selectOne("board.checkboard", empNo);
					
			if(cnt > 0) {
				isExist = true;
			}
		} catch (PersistenceException e) {
			// TODO: handle exception
			e.printStackTrace();
			session.rollback();
		}
		finally {
			session.close();
		}
		return isExist;
		
	}

	@Override
	public List<BoardVO> selectAll() {
		
		List<BoardVO> boardList = new ArrayList<>();
		
		SqlSession session = MyBatisUtil.getInstance();
		
		try {
			
			boardList = session.selectList("board.boardList");
			
		} catch (PersistenceException e) {
			// TODO: handle exception
			e.printStackTrace();
			
		}finally {
		session.close();	
		}
		return boardList;
	}

	@Override
	public List<BoardVO> searchBoard(BoardVO bv) {
		
		List<BoardVO> boardList = new ArrayList<>();
		
		SqlSession session = MyBatisUtil.getInstance();
		
		try {
			
			boardList = session.selectList("board.searchboard", bv);
			
		} catch (PersistenceException e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			session.close();
		}
		return boardList;
	}
	@Override
	public BoardVO detailBoard(int brdNo) {
		
		SqlSession session = MyBatisUtil.getInstance(false);
		
		BoardVO bv = null;
				
		try {
		
			bv = session.selectOne("board.detailboard",brdNo);
			
			
		} catch (PersistenceException e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			session.close();
		}
		return bv;
	}





}
