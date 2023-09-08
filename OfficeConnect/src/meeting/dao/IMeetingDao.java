package meeting.dao;

import java.util.List;

import vo.MeetingVO;

public interface IMeetingDao {
	
	/**
	 * 회의실 리스트 가져오는 메서드
	 * @param MeetingVO
	 * @return 
	 */
	public List<MeetingVO> selectAll();

	/**
	 * 회의실 예약시키는 메서드
	 * @param MeetingVO
	 * @return 성공여부
	 */
	public boolean bookMtr(MeetingVO meetingVO);

}