package emp.login.dao;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;

import emp.vo.EmpVO;
import util.MyBatisUtil;

public class LoginDaoImpl implements ILoginDao {

	// 싱글톤패턴
	public static ILoginDao instance = null;
	private LoginDaoImpl() {}
	public static ILoginDao getInstance() {
		if(instance == null) instance = new LoginDaoImpl();
		return instance;
	}
	
	@Override
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
}
