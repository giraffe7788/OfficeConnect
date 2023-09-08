package meeting.service;

import meeting.dao.IMeetingDao;
import meeting.dao.MeetingDaoImpl;
import vo.MeetingVO;

public class MeetingServiceImpl implements IMeetingService {

	public static IMeetingService instance = null;
	private MeetingServiceImpl() {}
	public static IMeetingService getInstance() {
		if(instance == null) instance = new MeetingServiceImpl();
		return instance;
	}
	
	IMeetingDao bookDao = MeetingDaoImpl.getInstance();
	
	@Override
	/**
	 * 회의실 예약을 위한 메서드
	 * @param MeetingVO 등록할 데이터가 담겨진 meetingVO객체
	 * @return 회의실 예약이 성공하면 1이상의 값이 반환되고, 실패하면 0이 반환됨.
	 */
	public int registMtr(MeetingVO meetingVO) {
		return bookDao.bookMtr(meetingVO);
	}
	
	

}
