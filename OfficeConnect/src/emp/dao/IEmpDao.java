package emp.dao;

import java.util.List;

import vo.ImageVO;
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
	
	public int forgotPw(String empNo);
	
	/**
	 * 사원정보 수정을 위한 메서드
	 * @param empVO에 등록할 데이터가 담겨진 EmpVO의 객체
	 * @return 사원정보 수정에 성공하면 1이상의 값 반환, 실패하면 0 반환
	 */
	public int updateEmployee(EmpVO empVO);
	
	
	/**
	 * 사원정보 삭제를 위한 메서드
	 * @param empNo 삭제할 사원의 사번
	 * @return 삭제에 성공하면 1 반환, 실패하면 0 반환
	 */
	public int deleteEmployee(String empNo);
	
	
	/**
	 * 사원정보가 존재하는지 확인하는 메서드
	 * @param empNo 체크할 사원의 사번
	 * @return 사번이 존재하면 true, 없으면 false 리턴
	 */
	public boolean checkEmployee(String empNo);
	
	
	/**
	 * 해당 사번에 해당하는 사원정보를 가져오기 위한메서드
	 * @param empNo 가져올 사번
	 * @return 해당 사원의 정보를 담은 empVO 객체
	 */
	public EmpVO getEmployee(String empNo);

	
	/**
	 * 전체 사원정보(리스트)를 가져오는 메서드
	 */
	public List<EmpVO> selectAll();
	
	
	/**
	 * 사원 정보를 검색하기 위한 메서드
	 * @param 검색된 회원정보를 담은 ev 객체
	 * @return 검색한 사원의 정보를 담은 ev를 return
	 */
	public List<EmpVO> searchEmployee(EmpVO ev);
}
