package review.dao;

import java.util.List;

import vo.EmpVO;
import vo.ReviewVO;

public interface IReviewDao {

	/**
	 * 근무태도평가 조회
	 * @param empNo
	 * @return
	 */
	public List<ReviewVO> selectList(String empNo);
	
	/**
	 * 평가할 수 있는 부하직원들을 확인하는 메서드
	 * @param empVO
	 * @return
	 */
	public List<EmpVO> getInferiorList(EmpVO empVO);
	
	/**
	 * 자신의 평가를 확인
	 * @param empNo
	 * @return
	 */
	public ReviewVO selectScore(String empNo);
	
	/**
	 * 사원의 근무 태도를 평가하는 메서드
	 * @param reviewVO
	 * @return
	 */
	public int insertScore(ReviewVO reviewVO);
}
