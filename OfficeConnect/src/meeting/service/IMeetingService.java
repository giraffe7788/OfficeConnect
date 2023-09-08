package meeting.service;

import java.util.List;

import vo.MeetingVO;

public interface IMeetingService {

	public List<MeetingVO> selectAll();
}
