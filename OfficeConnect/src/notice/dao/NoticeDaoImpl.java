package notice.dao;

import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import util.MyBatisUtil;
import vo.NoticeVO;


public class NoticeDaoImpl implements INoticeDao{

	private static INoticeDao NoticeDao;
	private NoticeDaoImpl() {
		// TODO Auto-generated constructor stub
	}
	public static INoticeDao getInstance() {
		if(NoticeDao == null) {
			NoticeDao = new NoticeDaoImpl();
		}
		return NoticeDao;
	}
	

	
	@Override
	public int insertNotice(NoticeVO nv) {
		// TODO Auto-generated method stub
		SqlSession session = MyBatisUtil.getInstance();
		
		int cnt = 0;
		
		try {
			
			cnt =session.insert("notice.insertNotice", nv);
			if(cnt > 0) {
				session.commit();
			}
			
		} catch (PersistenceException e) {
			// TODO: handle exception
			e.printStackTrace();
			session.rollback();
		}finally {
			session.close();
		}
		
		return cnt;
	}

	

	@Override
	public int updateNotice(NoticeVO nv) {
		int cnt =0;
		
		SqlSession session = MyBatisUtil.getInstance();
		try {
			
			cnt = session.update("notice.updateNotice",nv);
			if(cnt>0) {
				session.commit();
			}
					
		} catch (PersistenceException e) {
			e.printStackTrace();
			session.rollback();
			// TODO: handle exception
		}finally {
			session.close();
		}
		return cnt;
	}

	@Override
	public int deleteNotice(int brdNo) {
		int cnt = 0;
		
		SqlSession session = MyBatisUtil.getInstance();
		
		try {
		
			cnt = session.delete("notice.deleteNotice",brdNo);
		if(cnt>0) {
			session.commit();
		}
			
		} catch (PersistenceException e) {
			// TODO: handle exception
			e.printStackTrace();
			session.rollback();
		}finally {
			session.close();
			
			
		}
		
		return cnt;
	}

	@Override
	public boolean checkNotice(String empNo) {
		
		boolean isExist = false;
		
		SqlSession session = MyBatisUtil.getInstance();
		
		try {
			int cnt = session.selectOne("notice.checkNotice", empNo);
					
			if(cnt > 0) {
				isExist = true;
			}
		} catch (PersistenceException e) {
			// TODO: handle exception
			e.printStackTrace();
			session.rollback();
		}
		finally {
			session.close();
		}
		return isExist;
		
	}

	@Override
	public List<NoticeVO> selectAll() {
		
		List<NoticeVO> NoticeList = new ArrayList<>();
		
		SqlSession session = MyBatisUtil.getInstance();
		
		try {
			
			NoticeList = session.selectList("notice.listNoticeWithEmp");

			
		} catch (PersistenceException e) {
			// TODO: handle exception
			e.printStackTrace();
			
		}finally {
		session.close();	
		}
		return NoticeList;
	}

	@Override
	public List<NoticeVO> searchNotice(NoticeVO nv) {
		
		List<NoticeVO> NoticeList = new ArrayList<>();
		
		SqlSession session = MyBatisUtil.getInstance();
		
		try {
			
			NoticeList = session.selectList("notice.searchNotice", nv);
			
		} catch (PersistenceException e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			session.close();
		}
		return NoticeList;
	}
	@Override
	public NoticeVO detailNotice(int brdNo) {
		
		SqlSession session = MyBatisUtil.getInstance(false);
		
		NoticeVO nv = null;
				
		try {
		
			nv = session.selectOne("notice.detailNotice",brdNo);
			
			
		} catch (PersistenceException e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			session.close();
		}
		return nv;
	}
	@Override
	public int updateViews(int brdNo) {
		int cnt =0;
		
		SqlSession session = MyBatisUtil.getInstance();
		try {
			
			cnt = session.update("notice.updateViews",brdNo);
			if(cnt>0) {
				session.commit();
			}
					
		} catch (PersistenceException e) {
			e.printStackTrace();
			session.rollback();
			// TODO: handle exception
		}finally {
			session.close();
		}
		System.out.println("views : " + cnt);
		return cnt;
	}




}