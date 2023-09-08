package meeting.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;

import util.MyBatisUtil;
import vo.MeetingVO;

public class MeetingDaoImpl implements IMeetingDao{

	private static IMeetingDao dao;
	
	private MeetingDaoImpl() {}	
	public static IMeetingDao getInstance() {
		if(dao == null) dao = new MeetingDaoImpl();
		return dao;
	}
	
	@Override
	public List<MeetingVO> selectAll() {
		
		List<MeetingVO> mtrList = new ArrayList<MeetingVO>();
		
		SqlSession session = MyBatisUtil.getInstance();
		
		try {
			mtrList = session.selectList("meetingroom.selectAll");
		}catch(PersistenceException ex) {
			session.rollback();
			ex.printStackTrace();
		}finally {
			session.close();
		}
		
		return mtrList;
	}

}
