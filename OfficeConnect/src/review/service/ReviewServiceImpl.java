package review.service;

import java.util.List;

import review.dao.IReviewDao;
import review.dao.ReviewDaoImpl;
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
	public ReviewVO selectOne(String empNo) {
		return dao.selectOne(empNo);
	}

}
