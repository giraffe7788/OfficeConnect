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

	/**
	 * 근무태도평가 조회
	 */
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
	
	/**
	 * 평가할 수 있는 부하직원들을 확인하는 메서드
	 * @param empVO
	 * @return
	 */
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
	
	/**
	 * 자신의 평가를 확인
	 * @param empNo
	 * @return
	 */
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
	
	/**
	 * 사원의 근무 태도를 평가하는 메서드
	 * @param reviewVO
	 * @return
	 */
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
