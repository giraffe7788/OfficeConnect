package review.service;

import java.util.List;

import vo.EmpVO;
import vo.ReviewVO;

public interface IReviewService {

	public List<ReviewVO> selectList(String empNo);
	
	public List<EmpVO> getInferiorList(EmpVO empVO);
	
	public ReviewVO selectScore(String empNo);
	
	public int insertScore(ReviewVO reviewVO);
}
