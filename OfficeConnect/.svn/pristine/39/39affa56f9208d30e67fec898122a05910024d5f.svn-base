package meeting.dao;

import java.util.List;

import vo.MeetingBookVO;
import vo.MeetingRoomVO;

public interface IMeetingDao {
	
	/**
	 * 회의실 리스트 가져오는 메서드
	 * @param MeetingBookVO
	 * @return 
	 */
	public List<MeetingBookVO> selectAll();

	/**
	 * 회의실 예약시키는 메서드
	 * @param MeetingBookVO
	 * @return 성공여부
	 */
	public int bookMtr(MeetingBookVO meetingVO);

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
	public int deleteBook(String empNo);

	/**
	 * 사번으로 해당 사원이 예약한 예약정보 MeetingBookVO 반환
	 * @param empNo
	 * @return MeetingBookVO
	 */
	public MeetingBookVO getMeetingBookVO(String empNo);
}