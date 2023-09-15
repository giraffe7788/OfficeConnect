package comment.dao;

import java.util.List;

import vo.CommentVO;

public interface ICommentDao {
	
	
	//댓글 생성
	public int insertComment(CommentVO cv);
	
	
	//댓글 수정
	public int updateComment(CommentVO cv);
	
	
	//댓글 삭제
	public int deleteComment(int commNo);
	
	
	//해당 게스판의 댓글리스트출력 
	public List<CommentVO> selectAll(int brdNo);

	
	//댓글 선택
	public CommentVO detailComment(CommentVO cv);
	
	


}
