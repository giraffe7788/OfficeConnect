package emp.service;

import emp.dao.IEmpDao;
import vo.ImageVO;
import vo.EmpVO;

import java.util.List;

import emp.dao.EmpDaoImpl;

public class EmpServiceImpl implements IEmpService{
	
	// 싱글톤패턴
	public static IEmpService instance = null;
	private EmpServiceImpl() {}
	public static IEmpService getInstance() {
		if(instance == null) instance = new EmpServiceImpl();
		return instance;
	}
	
	IEmpDao empDao = EmpDaoImpl.getInstance();
	
	/**
	 * 로그인 체크 메서드, 파라미터로 사번과 관리자로그인 체크 여부를 받고 로그인 성공 여부를 리턴
	 * @param empVO
	 * @param isAdminLogin
	 * @return
	 */
	@Override
	public boolean loginCheck(EmpVO empVO, boolean isAdminLogin) {
		return empDao.loginCheck(empVO, isAdminLogin);
	}
	
	
	/**
	 * 사원정보 등록을 위한 메서드
	 * @param empVO에 등록할 데이터가 담겨진 EmpVO의 객체
	 * @return 사원 등록이 성공하면 1이상의 값이 반환되고, 실패하면 0이 반환됨.
	 */
	@Override
	public int registEmployee(EmpVO empVO) {
		return empDao.joinEmployee(empVO);
	}
	
	
	/**
	 * 사원정보 수정을 위한 메서드
	 * @param empVO에 등록할 데이터가 담겨진 EmpVO의 객체
	 * @return 사원정보 수정에 성공하면 1이상의 값 반환, 실패하면 0 반환
	 */
	@Override
	public int modifyEmployee(EmpVO empVO) {
		int cnt = empDao.updateEmployee(empVO);
		return cnt;
	}
	
	
	/**
	 * 사원정보 삭제를 위한 메서드
	 * @param empNo 삭제할 사원의 사번
	 * @return 삭제에 성공하면 1 반환, 실패하면 0 반환
	 */
	@Override
	public int removeEmployee(String empNo) {
		return empDao.deleteEmployee(empNo);
	}
	
	
	/**
	 * 사원정보가 존재하는지 확인하는 메서드
	 * @param empNo 체크할 사원의 사번
	 * @return 사번이 존재하면 true, 없으면 false 리턴
	 */
	@Override
	public boolean checkEmployee(String empNo) {
		return empDao.checkEmployee(empNo);
	}
	
	
	/**
	 * 해당 사번에 해당하는 사원정보를 가져오기 위한메서드
	 * @param empNo 가져올 사번
	 * @return 해당 사원의 정보를 담은 empVO 객체
	 */
	@Override
	public EmpVO getEmployee(String empNo) {
		return empDao.getEmployee(empNo);
	}
	
	
	/**
	 * 전체 사원정보(리스트)를 가져오는 메서드
	 */
	@Override
	public List<EmpVO> selectAll() {
		List<EmpVO> empList = empDao.selectAll();
		return empList;
	}
	
	
	/**
	 * 사원 정보를 검색하기 위한 메서드
	 * @param 검색된 회원정보를 담은 ev 객체
	 * @return 검색한 사원의 정보를 담은 ev를 return
	 */
	@Override
	public List<EmpVO> searchEmployee(EmpVO ev) {
		List<EmpVO> empList = empDao.searchEmployee(ev);
		return empList;
	}

}
