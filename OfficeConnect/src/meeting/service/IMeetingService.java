package meeting.service;

import java.util.List;
import java.util.Map;

import vo.MeetingRoomVO;
import vo.MeetingBookVO;

public interface IMeetingService {
	
	/**
	 * 회의실 리스트 가져오는 메서드
	 * @param MeetingBookVO
	 * @return 
	 */
	public List<MeetingBookVO> selectAll();
	
	/**
	 * 회의실 예약을 위한 메서드
	 * @param MeetingBookVO 등록할 데이터가 담겨진 meetingVO객체
	 * @return 회의실 예약이 성공하면 1이상의 값이 반환되고, 실패하면 0이 반환됨.
	 */
	public int registMtr(MeetingBookVO meetingVO);

	/**
	 * 회의실의 이름과 인원을 가져와서 Map타입으로 만들어주고 반환
	 * @return
	 */
	public List<MeetingRoomVO> getRoomList();

	/**
	 * 회의실 예약 취소를 위한 메서드
	 * @param empNo
	 * @return
	 */
	public int removeBook(String empNo);
}
