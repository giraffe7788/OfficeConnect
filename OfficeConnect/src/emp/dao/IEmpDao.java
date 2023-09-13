package emp.dao;

import java.util.List;

import vo.EmpVO;

public interface IEmpDao {
	
	/**
	 * 로그인 체크를 위한 메서드
	 * @param empvo
	 * @return 로그인 성공여부
	 */
	public boolean loginCheck(EmpVO empVO);
	
	/**
	 * 회원가입 시켜주는 메서드
	 * @param empVO
	 * @return 성공여부
	 */
	public int joinEmployee(EmpVO empVO);
	
	/**
	 * 사원(EMPLOYEE table) 데이터를 다 가져오는 메서드
	 * @return List에 담긴다.
	 */
	public List<EmpVO> selectAll();
	
	
	/**
	 * 사원조회 화면에 출력해줄 값들을 가져오는 메서드
	 * @param empNo
	 * @return empVO
	 */
	public EmpVO empChart(String empNo);
}
