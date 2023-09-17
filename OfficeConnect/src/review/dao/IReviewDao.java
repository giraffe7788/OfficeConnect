package review.dao;

import java.util.List;

import vo.ReviewVO;

public interface IReviewDao {

	public ReviewVO selectOne(String empNo);
}
