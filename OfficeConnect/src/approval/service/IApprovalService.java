package approval.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.ApprovalLineVO;
import vo.ApprovalVO;
import vo.EmpVO;

public interface IApprovalService {
	
	/**
	 * 자신의 부서 사람들중 자신보다 직급이 높은 사원들의 vo를 뽑아 리스트로 전달
	 * @param empVO
	 * @return 상사리스트
	 */
	public List<EmpVO> getAllSuperior(EmpVO empVO);
	
	
	/**
	 * 결재내역과 라인을 db에 집어넣음
	 * 
	 * @param1 apprVO
	 * @param2 apprlVO
	 * @return 성공여부
	 */
	public int insertApproval(ApprovalVO apprVO, ApprovalLineVO apprlVO);
	
	
	/**
	 * 본인이 보낸 모든 결재 리스트를 가져옴
	 * @param empNo
	 * @return 결재리스트
	 */
	public List<ApprovalVO> selectSendAppr(String empNo);
	
	
	/**
	 * 결재 번호로 결재 내용을 뽑아서 VO로 리턴
	 * @param apprNo
	 * @return 결재 내용
	 */
	public ApprovalVO getApprVO(int apprNo);
}
