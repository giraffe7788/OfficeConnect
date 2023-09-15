package emp.service;

import java.util.List;

import vo.ImageVO;
import vo.EmpVO;

public interface IEmpService {

	/**
	 * 로그인 체크를 위한 메서드, 파라미터로 empVO와 관리자로그인 체크 여부가 들어간다
	 * @param empvo, isAdminLogin
	 * @return 로그인 성공여부
	 */
	public boolean loginCheck(EmpVO empVO, boolean isAdminLogin);
	
	
	/**
	 * 사원정보 등록을 위한 메서드
	 * @param empVO에 등록할 데이터가 담겨진 EmpVO의 객체
	 * @return 사원 등록에 성공하면 1이상의 값 반환, 실패하면 0 반환
	 */
	public int registEmployee(EmpVO empVO);
	
	
	/**
	 * 사원정보 수정을 위한 메서드
	 * @param empVO에 등록할 데이터가 담겨진 EmpVO의 객체
	 * @return 사원정보 수정에 성공하면 1이상의 값 반환, 실패하면 0 반환
	 */ 
	public int modifyEmployee(EmpVO empVO, boolean isAdmin);
	
	
	/**
	 * 사원정보 삭제를 위한 메서드
	 * @param empNo 삭제할 사원의 사번
	 * @return 삭제에 성공하면 1 반환, 실패하면 0 반환
	 */
	public int removeEmployee(String empNo);
	
	
	/**
	 * 사원정보가 존재하는지 확인하는 메서드
	 * @param empNo 체크할 사원의 사번
	 * @return 사번이 존재하면 true, 없으면 false 리턴
	 */
	public boolean checkEmployee(String empNo);
	
	
	/**
	 * 해당 사번에 해당하는 사원정보를 가져오기 위한 메서드
	 * @param empNo 가져올 사번
	 * @return 해당 사원의 정보를 담은 empVO 객체
	 */
	public EmpVO selectOne(String empNo);
	
	
	/**
	 * 사원데이터를 다 가져올 메서드
	 * @param empvo
	 * @return List에 사원 정보다 담김.
	 */
	public List<EmpVO> selectAll();

	/**
	 * 이메일과 사번이 들어있는 객체로 비밀번호를 찾아서 비밀번호를 반환
	 * @param empVO
	 * @return empPw
	 */
	public String forgotPw(EmpVO empVO);
}