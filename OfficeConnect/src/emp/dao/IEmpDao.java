package emp.dao;

import vo.EmpVO;

public interface IEmpDao {
	
	/**
	 * 로그인 체크 메서드, 파라미터로 사번과 관리자로그인 체크 여부를 받고 로그인 성공 여부를 리턴
	 * @param empVO
	 * @param adminLogin
	 * @return
	 */
	public boolean loginCheck(EmpVO empVO, boolean isAdminLogin);
	
	/**
	 * 회원가입 시켜주는 메서드
	 * @param empVO
	 * @return 성공여부
	 */
	public int joinEmployee(EmpVO empVO);

}
