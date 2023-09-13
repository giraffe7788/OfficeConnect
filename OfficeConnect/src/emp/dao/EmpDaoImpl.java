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
	
	/**
	 * 로그인 체크를 위한 메서드, 파라미터로 사번과 관리자로그인 실행여부를 받는다
	 * @param empVO
	 * @param isAdminLogin
	 * @return
	 */
	@Override
	public boolean loginCheck(EmpVO empVO, boolean isAdminLogin) {
		
		boolean isSuccess = false;
		SqlSession session = MyBatisUtil.getInstance();
		EmpVO result = null;
		
		try {
			
			if(isAdminLogin) {
				result = session.selectOne("employee.adminCheck", empVO);
			} else if(isAdminLogin == false) {
				result = session.selectOne("employee.loginCheck", empVO);
			}
			
			if(result != null) {
				isSuccess = true;
			}
			
		} catch (PersistenceException e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			session.close();
		}
		
		return isSuccess;
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
}
