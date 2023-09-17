package approval.dao;

import java.util.List;

import vo.EmpVO;

public interface IApprovalDao {
	
	/**
	 * 자신의 부서 사람들중 자신보다 직급이 높은 사원들의 vo를 뽑아 리스트로 전달
	 * @param empVO
	 * @return 상사리스트
	 */
	public List<EmpVO> getAllSuperior(EmpVO empVO);
}
