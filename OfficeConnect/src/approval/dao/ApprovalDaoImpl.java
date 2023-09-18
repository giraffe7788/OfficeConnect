package approval.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

			apprList = session.selectList("approval.selectSendAppr", empNo);

		} catch (PersistenceException e) {
			session.rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}

		return apprList;
	}
	
	
	/**
	 * 본인이 받은 모든 결재 리스트를 가져옴
	 * @param empNo
	 * @return 결재리스트
	 */
	public List<ApprovalVO> selectReceiveAppr(String empNo){
		
		SqlSession session = MyBatisUtil.getInstance(true);
		List<ApprovalVO> apprList = new ArrayList<>();
		List<ApprovalLineVO> apprlList = new ArrayList<>();

		try {

			apprlList = session.selectList("approval.selectApprovalLine", empNo);
			
			for(ApprovalLineVO apprlVO : apprlList) {
				ApprovalVO apprVO = null;
				int apprlNo = apprlVO.getapprlNo();
				apprVO = session.selectOne("approval.selectReceiveApprovalVO", apprlNo);
				apprList.add(apprVO);
			}

		} catch (PersistenceException e) {
			session.rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		System.out.println("apprList : " + apprList);
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
	
	
	/**
	 * 결재라인 번호로 결재라인내용을 뽑아서 VO로 리턴
	 * 
	 * @param apprNo
	 * @return 결재 내용
	 */
	public ApprovalLineVO getApprlVO(int apprlNo) {

		SqlSession session = MyBatisUtil.getInstance();
		ApprovalLineVO apprlVO = null;

		try {

			apprlVO = session.selectOne("approval.getApprlVO", apprlNo);

		} catch (PersistenceException e) {
			session.rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}

		return apprlVO;
	}
	
	
	/**
	 * 사번과 결재라인 번호로 내가 몇번째인지 반환
	 * @param1 apprlNo 결재라인 번호
	 * @param2 empNo 사번
	 * @return seq 내가 몇번째인지
	 */
	public int getApprovalSeq(int apprlNo, String empNo) {
		
		SqlSession session = MyBatisUtil.getInstance();
		Map<String, Object> apprlMap = new HashMap<>();
		apprlMap.put("empNo", empNo);		
		apprlMap.put("apprlNo", apprlNo);
		
		int seq = 0;
		
		try {
			
			if(session.selectOne("approval.getApprovalSeq1", apprlMap) != null) {
				seq = 1;
			} else if(session.selectOne("approval.getApprovalSeq2", apprlMap) != null) {
				seq = 2;
			} else if(session.selectOne("approval.getApprovalSeq3", apprlMap) != null) {
				seq = 3;
			}
			
		} catch(PersistenceException e) {
			session.rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return seq;
	}
	
	
	/**
	 * 결재번호와 상태코드를 입력받고 결재테이블의 결재진행상태를 변경시켜주는 메소드
	 * @param1 apprNo 결재번호
	 * @param2 apprsCode 상태코드
	 * @return cnt 성공여부
	 */
	@Override
	public int setApprsCode(int apprNo, int apprsCode) {
		
		SqlSession session = MyBatisUtil.getInstance();
		Map<String, Integer> updateMap = new HashMap<String, Integer>();
		updateMap.put("apprsCode", apprsCode);
		updateMap.put("apprNo", apprNo);
		
		int cnt = 0;
		
		try {
			
			cnt = session.update("approval.setApprsCode", updateMap);
			
			if(cnt > 0) {
				session.commit();
			}
			
		} catch(PersistenceException e) {
			session.rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return cnt;
	}
	
	
	/**
	 * 결재라인 번호를 입력하면 해당 결재의 진행상황이 1 증가한다
	 * @param apprlNo
	 * @return cnt 성공여부
	 */
	@Override
	public int addApprProg(int apprlNo) {
		
		SqlSession session = MyBatisUtil.getInstance();
		int cnt = 0;
		
		try {
			cnt = session.update("approval.addApprlProg", apprlNo);
			if(cnt>0) {
				session.commit();
			}
		} catch(PersistenceException e) {
			session.rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return cnt;
	}
}
