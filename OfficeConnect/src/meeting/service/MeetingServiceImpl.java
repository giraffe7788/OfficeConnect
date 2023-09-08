package meeting.service;

import java.util.List;

import emp.service.IEmpService;
import meeting.dao.IMeetingDao;
import meeting.dao.MeetingDaoImpl;
import vo.MeetingVO;

public class MeetingServiceImpl implements IMeetingService{
	
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
	
	@Override
	public List<MeetingVO> selectAll() {
		
		List<MeetingVO> mtrList = dao.selectAll();
				
		return mtrList;
	}


}
