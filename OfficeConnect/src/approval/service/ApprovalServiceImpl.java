package approval.service;

import java.util.List;

import approval.dao.ApprovalDaoImpl;
import approval.dao.IApprovalDao;
import vo.EmpVO;

public class ApprovalServiceImpl implements IApprovalService {
	
	private IApprovalDao approvalDao = null;
	private static IApprovalService instance = null;
	private ApprovalServiceImpl() {
		approvalDao = ApprovalDaoImpl.getInstance();
	}
	public static IApprovalService getInstance() {
		if(instance==null)instance = new ApprovalServiceImpl();
		return instance;
	}
	
	/**
	 * 자신의 부서 사람들중 자신보다 직급이 높은 사원들의 vo를 뽑아 리스트로 전달
	 * @param empVO
	 * @return 상사리스트
	 */
	@Override
	public List<EmpVO> getAllSuperior(EmpVO empVO){
		return approvalDao.getAllSuperior(empVO);
	}
}
