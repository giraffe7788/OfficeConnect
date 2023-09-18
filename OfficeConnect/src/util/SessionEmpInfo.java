package util;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;

import vo.EmpVO;

public class SessionEmpInfo {

	private static SessionEmpInfo instance = null;

	private SessionEmpInfo() {
	}

	public static SessionEmpInfo getInstance() {
		if (instance == null)
			instance = new SessionEmpInfo();
		return instance;
	}

	/**
	 * 파라미터로 사번을 넣으면 해당 사번의 EmpVO를 리턴
	 * 
	 * @param empNo
	 * @return EmpVO
	 */
	public EmpVO getEmpVO(String empNo) {

		EmpVO empVO = null;
		SqlSession session = MyBatisUtil.getInstance();

		try {
			empVO = session.selectOne("employee.selectOne", empNo);
		} catch (PersistenceException e) {
			session.rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}
		return empVO;
	}

	/**
	 * 결재라인 번호와 순번을 입력하면 해당 결재라인 순번의 부서 이름 직급을 리턴시켜줌
	 * 
	 * @param1 apprlNo
	 * @param2 index
	 * @return String
	 */
	public String getApprlSeq(int apprlNo, int index) {

		SqlSession session = MyBatisUtil.getInstance();
		String apprlSeq = "";
		String empNo = "";
		EmpVO empVO = null;

		try {

			switch (index) {
			case 1:
				empNo = session.selectOne("approval.selectSeq1", apprlNo);
				break;
			case 2:
				empNo = session.selectOne("approval.selectSeq2", apprlNo);
				break;
			case 3:
				empNo = session.selectOne("approval.selectSeq3", apprlNo);
				break;
			}
			
			if(empNo == null) {
				System.out.println("empNo null");
				return null;
			}
			
			empVO = getEmpVO(empNo);

		} catch (PersistenceException e) {
			session.rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}

		apprlSeq = TransEmpInfo.getInstance().transformDeptCode(empVO.getDeptCode()) + " " + empVO.getEmpName() + " " + empVO.getEmpPosit();
		return apprlSeq;
	}
}
