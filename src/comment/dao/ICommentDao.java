package comment.dao;

import java.util.List;

import comment.vo.CommentVO;

public interface ICommentDao {
	
	
	//댓글 생성
	public int insertComment(CommentVO cv);
	
	
	//댓글 수정
	public int updateComment(CommentVO cv);
	
	
	//댓글 삭제
	public int deleteComment(int commNo);
	
	
	//본인이 작성한 댓글 리스트 확인 
	public List<CommentVO> seletAll(String empNo);

	
	//댓글 선택
	public CommentVO detailComment(CommentVO cv);
	
	


}
