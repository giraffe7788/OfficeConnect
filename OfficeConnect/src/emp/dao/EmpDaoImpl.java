package emp.dao;

import java.sql.SQLException;

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
	
	
}
