package emp.service;

import emp.dao.IEmpDao;
import vo.EmpVO;
import emp.dao.EmpDaoImpl;

public class EmpServiceImpl implements IEmpService{
	
	// 싱글톤패턴
	public static IEmpService instance = null;
	private EmpServiceImpl() {}
	public static IEmpService getInstance() {
		if(instance == null) instance = new EmpServiceImpl();
		return instance;
	}
	
	IEmpDao loginDao = EmpDaoImpl.getInstance();
	
	@Override
	/**
	 * 로그인 체크를 위한 메서드
	 * @param empvo
	 * @return 로그인 성공여부
	 */
	public boolean loginCheck(EmpVO empVO) {
		return loginDao.loginCheck(empVO);
	}
}
