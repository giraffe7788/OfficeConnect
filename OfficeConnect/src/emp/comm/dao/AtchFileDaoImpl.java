package emp.comm.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;

import emp.comm.vo.AtchFileVO;
import util.MyBatisUtil;

public class AtchFileDaoImpl implements IAtchFileDao {
	
	private static IAtchFileDao atchFileDao;
	
	private AtchFileDaoImpl() {
		
	}
	
	public static IAtchFileDao getInstance() {
		if(atchFileDao == null) {
			atchFileDao = new AtchFileDaoImpl();
		}
		
		return atchFileDao;
	}

	@Override
	public int insertAtchFile(AtchFileVO atchFileVO) {
		SqlSession session = MyBatisUtil.getInstance();
		
		int cnt = 0;
		try {
			cnt = session.insert("atchFile.insertAtchFile", atchFileVO);
			session.commit();
		} catch (PersistenceException ex) {
			session.rollback();
			ex.printStackTrace();
		} finally {
			session.close();
		}
		
		return cnt;
	}


	@Override
	public List<AtchFileVO> getAtchFileList(AtchFileVO atchfileVO) {
		SqlSession session = MyBatisUtil.getInstance();
		
		List<AtchFileVO> atchFileList = new ArrayList<AtchFileVO>();
		
		try {
			atchFileList = session.selectList("atchFile.getAtchFileList",atchfileVO);
		
		}catch(PersistenceException ex) {
			ex.printStackTrace();
		}finally {
			session.close();
		}
		return atchFileList;
	}

	@Override
	public AtchFileVO getAtchFile(AtchFileVO atchfileVO) {
		SqlSession session = MyBatisUtil.getInstance();
		
		AtchFileVO fileVO = new AtchFileVO();
		
		try {
			
			fileVO = session.selectOne(
					"atchFile.getAtchFile",atchfileVO);
		
		}catch(PersistenceException ex) {
			ex.printStackTrace();
		}finally {
			session.close();
		}
		return fileVO;
	}

}
