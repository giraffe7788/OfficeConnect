package comment.service;

import java.util.Date;
import java.util.List;

import comment.vo.*;

public interface ICommentService {
	
	
	//댓글 생성
	public int insertComment(CommentVO cv);
	
	
	//댓글 수정
	public int updateComment(CommentVO cv);
	
	
	//댓글 삭제
	public int deleteComment(int commNo);
	
	
	// 댓글 리스트 출력
	public List<CommentVO> selectAll(int brdNo);

	
	//댓글 선택
	public CommentVO detailComment(CommentVO cv);





	
	
}





