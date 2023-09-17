package approval.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;

import util.MyBatisUtil;
import vo.ApprovalLineVO;
import vo.ApprovalVO;
import vo.EmpVO;

public class ApprovalDaoImpl implements IApprovalDao {
	private static IApprovalDao instance = null;

	private ApprovalDaoImpl() {
	}

	public static IApprovalDao getInstance() {
		if (instance == null)
			instance = new ApprovalDaoImpl();
		return instance;
	}

	/**
	 * 자신의 부서 사람들중 자신보다 직급이 높은 사원들의 vo를 뽑아 리스트로 전달
	 * 
	 * @param empVO
	 * @return 상사리스트
	 */
	@Override
	public List<EmpVO> getAllSuperior(EmpVO empVO) {

		List<EmpVO> empList = new ArrayList<>();
		SqlSession session = MyBatisUtil.getInstance(true);

		try {
			empList = session.selectList("employee.getAllSuperior", empVO);
		} catch (PersistenceException e) {
			e.printStackTrace();
		} finally {
			session.close();
		}

		return empList;
	}

	
	/**
	 * 결재내역과 라인을 db에 집어넣음
	 * 
	 * @param1 apprVO
	 * @param2 apprlVO
	 * @return 성공여부
	 */
	@Override
	public int insertApproval(ApprovalVO apprVO, ApprovalLineVO apprlVO) {

		SqlSession session = MyBatisUtil.getInstance();
		int cnt1 = 0;
		int cnt2 = 0;
		int apprlNo = 0;

		try {
			
			cnt1 = session.insert("approval.insertApprovalLine", apprlVO);
			apprlNo = session.selectOne("getCurrSeq");
			apprVO.setApprlNo(apprlNo);
			cnt2 = session.insert("approval.insertApproval", apprVO);

			if (cnt1*cnt2 > 0) {
				session.commit();
			}

		} catch (PersistenceException e) {
			session.rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}

		return cnt1*cnt2;
	}

	/**
	 * 본인이 보낸 모든 결재 리스트를 가져옴
	 * 
	 * @param empNo
	 * @return 결재리스트
	 */
	public List<ApprovalVO> selectSendAppr(String empNo) {

		SqlSession session = MyBatisUtil.getInstance(true);
		List<ApprovalVO> apprList = new ArrayList<>();

		try {

			apprList = session.selectList("selectSendAppr", empNo);

		} catch (PersistenceException e) {
			session.rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}

		return apprList;
	}

	/**
	 * 결재 번호로 결재 내용을 뽑아서 VO로 리턴
	 * 
	 * @param apprNo
	 * @return 결재 내용
	 */
	public ApprovalVO getApprVO(int apprNo) {

		SqlSession session = MyBatisUtil.getInstance();
		ApprovalVO apprVO = null;

		try {

			apprVO = session.selectOne("approval.getApprVO", apprNo);

		} catch (PersistenceException e) {
			session.rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}

		return apprVO;
	}
}
