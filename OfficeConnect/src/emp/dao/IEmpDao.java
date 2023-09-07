package emp.dao;

import vo.EmpVO;

public interface IEmpDao {
	
	/**
	 * 로그인 체크를 위한 메서드
	 * @param empvo
	 * @return 로그인 성공여부
	 */
	public boolean loginCheck(EmpVO empVO);
	
	/**
	 * 회원가입을 위한 메서드
	 * @param empVO
	 * @return 회원가입 성공여부
	 */
	public int joinEmployee(EmpVO empVO);
}
