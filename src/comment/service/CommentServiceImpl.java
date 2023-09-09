package comment.service;

import java.util.List;

import board.dao.BoardDaoImpl;
import comment.dao.CommentDaoImpl;
import comment.dao.ICommentDao;
import comment.vo.CommentVO;

public class CommentServiceImpl implements ICommentService{

	
	private ICommentDao CommentDao;
	
	private static ICommentService CommentService;

	public static ICommentService GetInstance() {
		if(CommentService==null) {
			CommentService = new CommentServiceImpl();
		}
		return CommentService;
	}
	
	private CommentServiceImpl() {

		CommentDao = CommentDaoImpl.getInstance();
	}

	@Override
	public int insertComment(CommentVO cv) {
		int cnt =1;
		// TODO Auto-generated method stub
		return cnt;
	}

	@Override
	public int updateComment(CommentVO cv) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteComment(int commNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<CommentVO> selectAll(int brdNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public CommentVO detailComment(CommentVO cv) {
		// TODO Auto-generated method stub
		return null;
	}
	
	

}
