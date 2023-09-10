package meeting.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;

import util.MyBatisUtil;
import vo.MeetingVO;

public class MeetingDaoImpl implements IMeetingDao{

	public static IMeetingDao dao;
	
	private MeetingDaoImpl() {}
	public static IMeetingDao getInstance() {
		if(dao == null) dao = new MeetingDaoImpl();
		return dao;
	}
	
	
	/**
	 * 회의실 리스트 가져오는 메서드
	 * @param MeetingVO
	 * @return 
	 */
	@Override
	public List<MeetingVO> selectAll() {

		List<MeetingVO> mtrList = new ArrayList<MeetingVO>();
		
		SqlSession session = MyBatisUtil.getInstance();
		
		try {
			mtrList = session.selectList("meetingroom.selectAll");
		} catch (PersistenceException ex) {
			session.rollback();
			ex.printStackTrace();
		}finally {
			session.close();
		}
		

		return mtrList;
	}
	
	
	@Override
	/**
	 * 회의실 예약시키는 메서드
	 * @param meetingVO
	 * @return 성공여부
	 */
	public int bookMtr(MeetingVO meetingVO) {

		int cnt = 0;
		SqlSession session = MyBatisUtil.getInstance();
		
		try {
			cnt = session.insert("meetingroom.insertBook", meetingVO);
			if(cnt > 0) {
				session.commit();
			} else {
				session.rollback();
			}
			
		} catch (PersistenceException ex) {
			session.rollback();
			ex.printStackTrace();
		}finally {
			session.close();
		}
		
		return cnt;
	}
}