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
		
			deptName = session.selectOne("transfer.getDeptName", deptCode);
		
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
		
			stateName = session.selectOne("transfer.getStateName", stateCode);
		
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
		
			deptCode = session.selectOne("transfer.getDeptCode", deptName);
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
		
			stateCode = Integer.parseInt(session.selectOne("transfer.getStateCode", stateName));
			System.out.println("stateCode : " + stateCode);
			
		} catch(PersistenceException e) {
			session.rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return stateCode;
	}
	
	/**
	 * 파라미터로 결재 코드를 받으면 결재상태명으로 변환해서 반환시켜주는 메소드
	 * @param apprsCode
	 * @return apprsName
	 */
	public String transferApprsCode(int apprsCode) {
		
		SqlSession session = MyBatisUtil.getInstance();
		String apprsName = null;
		
		try {
		
			apprsName = session.selectOne("transfer.getApprsName", apprsCode);
			System.out.println("apprsName : " + apprsName);
			
		} catch(PersistenceException e) {
			session.rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return apprsName;
	}
	
	/**
	 * 파라미터로 결재상태명을 받으면 결재 코드로 변환해서 반환시켜주는 메소드
	 * @param apprsName
	 * @return apprsCode
	 */
	public int transferApprsName(String apprsName) {
		
		SqlSession session = MyBatisUtil.getInstance();
		int apprsCode = 0;
		
		try {
		
			apprsCode = session.selectOne("transfer.getApprsCode", apprsName);
			System.out.println("apprsCode : " + apprsCode);
			
		} catch(PersistenceException e) {
			session.rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return apprsCode;
	}
}
