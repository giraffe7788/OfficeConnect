package emp.login.service;

import emp.login.dao.ILoginDao;
import emp.login.dao.LoginDaoImpl;
import emp.vo.EmpVO;

public class LoginServiceImpl implements ILoginService{
	
	// 싱글톤패턴
	public static ILoginService instance = null;
	private LoginServiceImpl() {}
	public static ILoginService getInstance() {
		if(instance == null) instance = new LoginServiceImpl();
		return instance;
	}
	
	ILoginDao loginDao = LoginDaoImpl.getInstance();
	
	@Override
	public boolean loginCheck(EmpVO empVO) {
		return loginDao.loginCheck(empVO);
	}
}
