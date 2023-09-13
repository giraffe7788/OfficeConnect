package emp.service;

import java.util.List;

import vo.EmpVO;

public interface IEmpService {

	/**
	 * 로그인 체크를 위한 메서드
	 * @param empvo
	 * @return 로그인 성공여부
	 */
	public boolean loginCheck(EmpVO empVO);
	
	
	/**
	 * 사원정보 등록을 위한 메서드
	 * @param empVO 등록할 데이터가 담겨진 empVO객체
	 * @return 사원 등록이 성공하면 1이상의 값이 반환되고, 실패하면 0이 반환됨.
	 */
	public int registEmp(EmpVO empVO);
	
	
	/**
	 * 사원데이터를 다 가져올 메서드
	 * @param empvo
	 * @return List에 사원 정보다 담김.
	 */
	public List<EmpVO> selectAll();
	
	/**
	 * 사원조회 화면에 출력해줄 값들을 가져오는 메서드
	 * @param empNo
	 * @return empVO
	 */
	public EmpVO empChart(String empNo);
}
