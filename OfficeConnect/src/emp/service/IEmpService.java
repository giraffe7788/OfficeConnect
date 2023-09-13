package emp.service;

import vo.EmpVO;

public interface IEmpService {

	/**
	 * 로그인 체크 메서드, 파라미터로 사번과 관리자로그인 체크 여부를 받고 로그인 성공 여부를 리턴
	 * @param empVO
	 * @param adminLogin
	 * @return
	 */
	public boolean loginCheck(EmpVO empVO, boolean isAdminLogin);
	
	
	/**
	 * 사원정보 등록을 위한 메서드
	 * @param empVO 등록할 데이터가 담겨진 empVO객체
	 * @return 사원 등록이 성공하면 1이상의 값이 반환되고, 실패하면 0이 반환됨.
	 */
	public int registEmp(EmpVO empVO);
}
