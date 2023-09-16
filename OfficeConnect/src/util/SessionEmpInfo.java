package util;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;

import vo.EmpVO;

public class SessionEmpInfo {
	
	private static SessionEmpInfo instance = null;
	private SessionEmpInfo() {}
	public static SessionEmpInfo getInstance() {
		if(instance == null) instance = new SessionEmpInfo();
		return instance;
	}
	
	/**
	 * 파라미터로 사번을 넣으면 해당 사번의 EmpVO를 리턴
	 * @param empNo
	 * @return EmpVO
	 */
	public EmpVO getEmpVO(String empNo) {
		
		EmpVO empVO = null;
		SqlSession session = MyBatisUtil.getInstance();
		
		try {
		empVO = session.selectOne("employee.selectOne", empNo);
		} catch(PersistenceException e) {
			session.rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}
		return empVO;
	}
}
