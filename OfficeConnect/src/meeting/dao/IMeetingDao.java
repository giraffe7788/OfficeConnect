package meeting.dao;

import java.util.List;

import vo.MeetingVO;

public interface IMeetingDao {

	public List<MeetingVO> selectAll();
}
