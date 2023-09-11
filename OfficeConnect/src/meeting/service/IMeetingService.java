package meeting.service;

import java.util.List;

import vo.MeetingVO;

public interface IMeetingService {
	
	/**
	 * 회의실 리스트 가져오는 메서드
	 * @param MeetingVO
	 * @return 
	 */
	public List<MeetingVO> selectAll();
	
	/**
	 * 회의실 예약을 위한 메서드
	 * @param MeetingVO 등록할 데이터가 담겨진 meetingVO객체
	 * @return 회의실 예약이 성공하면 1이상의 값이 반환되고, 실패하면 0이 반환됨.
	 */
	public boolean registMtr(MeetingVO meetingVO);

}