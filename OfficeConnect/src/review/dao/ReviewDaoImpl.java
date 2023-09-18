package review.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;

import util.MyBatisUtil;
import vo.ReviewVO;

public class ReviewDaoImpl implements IReviewDao{
	
	public static IReviewDao instance = null;
	
	private ReviewDaoImpl() {}
	public static IReviewDao getInstance() {
		if(instance == null) instance = new ReviewDaoImpl();
		return instance;
	}

	@Override
	public ReviewVO selectOne(String empNo) {

		SqlSession session = MyBatisUtil.getInstance();

		ReviewVO rvo = null;
		
		try {
			
			rvo = session.selectOne("review.selectOne", empNo);
			
			if(rvo!=null) {
				 session.commit();
			 }
		} catch (PersistenceException ex) {
			session.rollback();
			ex.printStackTrace();
		} finally {
			session.close();
		}
		return rvo;
	}

}
