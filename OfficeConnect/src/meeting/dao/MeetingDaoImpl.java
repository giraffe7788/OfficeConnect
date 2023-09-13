package meeting.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;

import util.MyBatisUtil;
import vo.MeetingBookVO;
import vo.MeetingRoomVO;

public class MeetingDaoImpl implements IMeetingDao{

	public static IMeetingDao dao;
	
	private MeetingDaoImpl() {}
	public static IMeetingDao getInstance() {
		if(dao == null) dao = new MeetingDaoImpl();
		return dao;
	}
	
	
	/**
	 * 회의실 리스트 가져오는 메서드
	 * @param MeetingBookVO
	 * @return 
	 */
	@Override
	public List<MeetingBookVO> selectAll() {

		List<MeetingBookVO> mtrList = new ArrayList<MeetingBookVO>();
		
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
	public int bookMtr(MeetingBookVO meetingVO) {

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
	
	@Override
	/**
	 * 회의실의 이름과 인원을 가져와서 Map타입으로 만들어주고 반환
	 * @return
	 */
	public List<MeetingRoomVO> getRoomList() {
		
		List<MeetingRoomVO> mbVO = new ArrayList<>();
		
		SqlSession session = MyBatisUtil.getInstance();
		
		mbVO = session.selectList("meetingroom.selectMeetingRoom");
		System.out.println("roomMap : " + mbVO);
		return mbVO;
	}
}
