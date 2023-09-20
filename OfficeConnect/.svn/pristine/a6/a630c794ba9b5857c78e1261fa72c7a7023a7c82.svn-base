package comment.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;

import board.dao.BoardDaoImpl;
import board.dao.IBoardDao;

import util.MyBatisUtil;
import vo.CommentVO;

public class CommentDaoImpl implements ICommentDao {

	
	private static ICommentDao commentDao;
	private CommentDaoImpl() {}
	public static ICommentDao getInstance() {
		if(commentDao == null) {
			commentDao = new CommentDaoImpl();
		}
		return commentDao;
	}
	
	@Override
	public int insertComment(CommentVO cv) {

		SqlSession session = MyBatisUtil.getInstance();

		int cnt = 0;

		try {
			cnt = session.insert("comment.commentInsert",cv );
			if (cnt > 0) {
				session.commit();
			}

		} catch (PersistenceException e) {
			// TODO: handle exception
			e.printStackTrace();
			session.rollback();
		} finally {
			session.close();
		}

		return cnt;
	}

	@Override
	public int updateComment(CommentVO cv) {
		int cnt = 0;
		
		SqlSession session = MyBatisUtil.getInstance();
		
		try {
			cnt = session.update("commentUpdate",cv);
			if(cnt>0) {
				session.commit();
			}
		} catch (PersistenceException e) {
			e.printStackTrace();
			session.rollback();
		}finally {
			session.close();
		}
		
		return cnt;
	}

	@Override
	public int deleteComment(int commNo) {
		int cnt=0;
		
		SqlSession session = MyBatisUtil.getInstance();
			
		try {
			cnt=session.delete("commentDelete", commNo);
			if(cnt>0) {
				session.commit();
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		}finally {
			session.close();
		}
		System.out.println("다오임 : " + cnt);
				return cnt;
	}

	@Override
	public List<CommentVO> selectAll(int brdNo) {
		
		List<CommentVO> commentList = new ArrayList<>();
		
		SqlSession session = MyBatisUtil.getInstance();
		
		try {
			commentList = session.selectList("comment.commentListWithEmp", brdNo);

			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return commentList;
	}

	@Override
	public CommentVO detailComment(CommentVO cv) {
		// TODO Auto-generated method stub
		return null;
	}

}