package emp.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;

import util.MyBatisUtil;
import vo.EmpVO;

public class EmpDaoImpl implements IEmpDao {

	// 싱글톤패턴
	public static IEmpDao instance = null;
	private EmpDaoImpl() {}
	public static IEmpDao getInstance() {
		if(instance == null) instance = new EmpDaoImpl();
		return instance;
	}
	
	
	@Override
	/**
	 * 로그인 체크를 위한 메서드
	 * @param empvo
	 * @return 로그인 성공여부
	 */
	public boolean loginCheck(EmpVO empVO) {
		
		boolean loginCheck = false;
		SqlSession session = MyBatisUtil.getInstance();
		
		try {
			
			if(session.selectOne("employee.loginCheck", empVO) == null) {
				loginCheck = false;
			} else {
				loginCheck = true;
			}
			
		} catch (PersistenceException e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			session.close();
		}
		
		return loginCheck;
	}
	
	
	@Override
  	/**
	 * 회원가입 시켜주는 메서드
	 * @param empVO
	 * @return 성공여부
	 */
	public int joinEmployee(EmpVO empVO) {
		
		SqlSession session = MyBatisUtil.getInstance();
		
		int cnt = 0;
		
		try {
			cnt = session.insert("employee.joinEmployee", empVO);
			if (cnt > 0) {
				session.commit();
			}
			
		} catch (PersistenceException ex) {
			session.rollback();
			ex.printStackTrace();
		} finally {
			session.close();
		}
		
		return cnt;

	}
	
	/**
	 * 사원(EMPLOYEE table) 데이터를 다 가져오는 메서드
	 * @return List에 담긴다.
	 */
	@Override
	public List<EmpVO> selectAll() {
		
		List<EmpVO> empList = new ArrayList<EmpVO>();
		
		SqlSession session = MyBatisUtil.getInstance();
		
		try {
		
		empList = session.selectList("employee.selectAll");
		
		}catch (PersistenceException e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return empList;
	}
	
	/**
	 * 사원조회 화면에 출력해줄 값들을 가져오는 메서드
	 * @param empNo
	 * @return empVO
	 */
	@Override
	public EmpVO empChart(String empNo) {
		EmpVO empVO = new EmpVO();
		
		SqlSession session = MyBatisUtil.getInstance();
		
		try {
			
			empVO = session.selectOne("employee.empCheck",empNo);
			
		} catch (PersistenceException e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		return empVO;
	}
}
