package meeting.dao;

import org.apache.ibatis.session.SqlSession;

import util.MyBatisUtil;
import vo.MeetingVO;

public class MeetingDaoImpl implements IMeetingDao{

	public static IMeetingDao instance = null;
	private MeetingDaoImpl() {}
	public static IMeetingDao getInstance() {
		if(instance == null) instance = new MeetingDaoImpl();
		return instance;
	}
	
	@Override
	/**
	 * 회의실 예약시키는 메서드
	 * @param meetingVO
	 * @return 성공여부
	 */
	public int bookMtr(MeetingVO meetingVO) {

		SqlSession session = MyBatisUtil.getInstance();
		
		int cnt = 0;
		
		//session.insert("")
		
		return 0;
	}
	
	
}
