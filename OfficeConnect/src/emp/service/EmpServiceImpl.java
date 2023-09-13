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
	
	/**
	 * 로그인 체크 메서드, 파라미터로 사번과 관리자로그인 체크 여부를 받고 로그인 성공 여부를 리턴
	 * @param empVO
	 * @param isAdminLogin
	 * @return
	 */
	@Override
	public boolean loginCheck(EmpVO empVO, boolean isAdminLogin) {
		return loginDao.loginCheck(empVO, isAdminLogin);
	}
	
	/**
	 * 사원정보 등록을 위한 메서드
	 * @param empVO 등록할 데이터가 담겨진 empVO객체
	 * @return 사원 등록이 성공하면 1이상의 값이 반환되고, 실패하면 0이 반환됨.
	 */
	@Override
	public int registEmp(EmpVO empVO) {
		return loginDao.joinEmployee(empVO);
	}

}
