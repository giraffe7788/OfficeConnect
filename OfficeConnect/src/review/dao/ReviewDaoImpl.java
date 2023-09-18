package review.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;

import util.MyBatisUtil;
import vo.EmpVO;
import vo.ReviewVO;

public class ReviewDaoImpl implements IReviewDao{
	
	public static IReviewDao instance = null;
	
	private ReviewDaoImpl() {}
	public static IReviewDao getInstance() {
		if(instance == null) instance = new ReviewDaoImpl();
		return instance;
	}

	@Override
	public List<ReviewVO> selectList(String empNo) {

		SqlSession session = MyBatisUtil.getInstance();

		List<ReviewVO> rvo = null;
		
		try {
			
			rvo = session.selectList("review.selectList", empNo);
			
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
	
	@Override
	public List<EmpVO> getInferiorList(EmpVO empVO) {
		
		List<EmpVO> empList = new ArrayList<EmpVO>();
		
		SqlSession session = MyBatisUtil.getInstance();
		
		try {
			
			empList = session.selectList("employee.getInferiorList", empVO);
			
		}catch(PersistenceException ex) {
			ex.printStackTrace();
			session.rollback();
		}finally {
			session.close();
		}
		
		System.out.println("empList : " + empList);
		return empList;
	}
	
	@Override
	public ReviewVO selectScore(String empNo) {

		ReviewVO rvo = null;
		
		SqlSession session = MyBatisUtil.getInstance();
		
		try {
			
			rvo = session.selectOne("review.selectOne", empNo);
			
			if(rvo != null) {
				session.commit();
				
			}
		
		}catch(PersistenceException ex) {
			ex.printStackTrace();
			session.rollback();
		}finally {
			session.close();
		}
		return rvo;
	}
	
	@Override
	public int insertScore(ReviewVO reviewVO) {

		int cnt = 0;
		
		SqlSession session = MyBatisUtil.getInstance();
		
		try {
			
			cnt = session.insert("review.insertScore", reviewVO);
			
			if(cnt > 0) {
				session.commit();
			}
		}catch(PersistenceException ex) {
			ex.printStackTrace();
			session.rollback();
		}finally {
			session.close();
		}
		
		return cnt;
	}

}
