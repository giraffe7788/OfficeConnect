package meeting.dao;

import vo.MeetingVO;

public interface IMeetingDao {

	/**
	 * 회의실 예약시키는 메서드
	 * @param meetingVO
	 * @return 성공여부
	 */
	public int bookMtr(MeetingVO meetingVO);

}