package util;

import org.apache.catalina.Session;
import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;

public class TransEmpInfo {
	
	private static TransEmpInfo instance = null;
	private TransEmpInfo() {}
	public static TransEmpInfo getInstance() {
		if(instance == null) instance = new TransEmpInfo();
		return instance;
	}
	
	/**
	 * 파라미터로 부서 코드를 받으면 부서 이름 으로 변환해서 리턴시켜주는 메소드
	 * @param deptCode
	 * @return deptName
	 */
	public String transformDeptCode(int deptCode) {
		
		SqlSession session = MyBatisUtil.getInstance();
		String deptName = null;
		
		try {
		
			deptName = session.selectOne("transform.getDeptName", deptCode);
		
		} catch(PersistenceException e) {
			session.rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return deptName;
	}
	
	/**
	 * 파라미터로 업무상태 코드를 받으면 업무상태명 으로 변환해서 리턴시켜주는 메소드
	 * @param stateCode
	 * @return stateName
	 */
	public String transformStateCode(int stateCode) {
		
		SqlSession session = MyBatisUtil.getInstance();
		String stateName = null;
		
		try {
		
			stateName = session.selectOne("transform.getStateName", stateCode);
		
		} catch(PersistenceException e) {
			session.rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return stateName;
	}
	
	/**
	 * 파라미터로 부서 이름를 받으면 부서 코드로 변환해서 리턴시켜주는 메소드
	 * @param deptCode
	 * @return deptName
	 */
	public int transformDeptName(String deptName) {
		
		SqlSession session = MyBatisUtil.getInstance();
		int deptCode = 0;
		
		try {
		
			deptCode = session.selectOne("transform.getDeptCode", deptName);
			System.out.println("deptCode : " + deptCode);
		
		} catch(PersistenceException e) {
			session.rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return deptCode;
	}
	
	/**
	 * 파라미터로 부서 이름를 받으면 부서 코드로 변환해서 리턴시켜주는 메소드
	 * @param deptCode
	 * @return deptName
	 */
	public int transformStateName(String stateName) {
		
		SqlSession session = MyBatisUtil.getInstance();
		int stateCode = 0;
		
		try {
		
			stateCode = Integer.parseInt(session.selectOne("transform.getStateCode", stateName));
			System.out.println("stateCode : " + stateCode);
			
		} catch(PersistenceException e) {
			session.rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return stateCode;
	}
}
