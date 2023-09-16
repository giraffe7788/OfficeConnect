package meeting.service;

import java.util.HashMap;
import java.util.Map;
import java.util.List;

import meeting.dao.IMeetingDao;
import meeting.dao.MeetingDaoImpl;
import vo.MeetingBookVO;
import vo.MeetingRoomVO;

public class MeetingServiceImpl implements IMeetingService {

	private IMeetingDao dao;
	private static IMeetingService service;
	
	public static IMeetingService instance = null;
	private MeetingServiceImpl() {
		dao = MeetingDaoImpl.getInstance();
	}
	
	public static IMeetingService getInstance() {
		if(service == null) {
			service = new MeetingServiceImpl();
		}
		return service;
	}
	
	//IMeetingDao bookDao = MeetingDaoImpl.getInstance();
	
	/**
	 * 회의실 리스트 가져오는 메서드
	 * @param MeetingBookVO
	 * @return 
	 */
	@Override
	public List<MeetingBookVO> selectAll() {
		return dao.selectAll();
	}
	
	
	@Override
	/**
	 * 회의실 예약을 위한 메서드
	 * @param MeetingVO 등록할 데이터가 담겨진 meetingVO객체
	 * @return 회의실 예약이 성공하면 1이상의 값이 반환되고, 실패하면 0이 반환됨.
	 */
	public int registMtr(MeetingBookVO meetingVO) {
		return dao.bookMtr(meetingVO);
	}
	
	
	@Override
	/**
	 * 회의실의 이름과 인원을 가져와서 Map타입으로 만들어주고 반환
	 * @return
	 */
	public List<MeetingRoomVO> getRoomList() {
		return dao.getRoomList();
	}
	
	
	/**
	 * 회의실 예약 취소를 위한 메서드
	 * @param empNo
	 * @return
	 */
	@Override
	public int deleteBook(String empNo) {
		
		int cnt = dao.deleteBook(empNo);
		
		return cnt;
	}
}
