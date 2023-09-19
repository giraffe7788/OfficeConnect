package review.service;

import java.util.List;

import review.dao.IReviewDao;
import review.dao.ReviewDaoImpl;
import vo.EmpVO;
import vo.ReviewVO;

public class ReviewServiceImpl implements IReviewService{
	
	IReviewDao dao = ReviewDaoImpl.getInstance();
	
	public static IReviewService instance = null;
	private ReviewServiceImpl() {}
	public static IReviewService getInstance() {
		if(instance == null) instance = new ReviewServiceImpl();
		return instance;
	}
	
	@Override
	public List<ReviewVO> selectList(String empNo) {
		return dao.selectList(empNo);
	}
	
	@Override
	public List<EmpVO> getInferiorList(EmpVO empVO) {
		return dao.getInferiorList(empVO);
	}
	
	@Override
	public ReviewVO selectScore(String empNo) {
		return dao.selectScore(empNo);
	}
	@Override
	public int insertScore(ReviewVO reviewVO) {
		return dao.insertScore(reviewVO);
	}

}
