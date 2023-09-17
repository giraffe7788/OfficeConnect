package approval.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;

import util.MyBatisUtil;
import vo.EmpVO;

public class ApprovalDaoImpl implements IApprovalDao {
	private static IApprovalDao instance = null;
	private ApprovalDaoImpl() {}
	public static IApprovalDao getInstance() {
		if(instance==null)instance = new ApprovalDaoImpl();
		return instance;
	}
	
	/**
	 * 자신의 부서 사람들중 자신보다 직급이 높은 사원들의 vo를 뽑아 리스트로 전달
	 * @param empVO
	 * @return 상사리스트
	 */
	@Override
	public List<EmpVO> getAllSuperior(EmpVO empVO){
		
		List<EmpVO> empList = new ArrayList<>();
		SqlSession session = MyBatisUtil.getInstance(true);
		
		try {
			empList =  session.selectList("employee.getAllSuperior", empVO);
		} catch(PersistenceException e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return empList;
	}
}
