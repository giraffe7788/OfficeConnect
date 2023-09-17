package notice.service;

import java.util.List;

import notice.dao.NoticeDaoImpl;
import notice.dao.INoticeDao;

import vo.NoticeVO;


public class NoticeServiceImpl implements INoticeService {

	private INoticeDao NoticeDao;


	private static INoticeService NoticeService;

	private NoticeServiceImpl() {
//		NoticeDao = NoticeDaoImplWithJDBC.getInstance();
		NoticeDao = NoticeDaoImpl.getInstance();

	}

	public static INoticeService GetInstance() {
		if (NoticeService == null) {
			NoticeService = new NoticeServiceImpl();
		}
		return NoticeService;
	}

	@Override
	public int insertNotice(NoticeVO nv) {

		int cnt = NoticeDao.insertNotice(nv);
		// TODO Auto-generated method stub
		return cnt;
	}

	@Override
	public int deleteNotice(int brdNo) {
		// TODO Auto-generated method stub
		int cnt = NoticeDao.deleteNotice(brdNo);
		return cnt;
	}



	@Override
	public List<NoticeVO> selectAll() {
		// TODO Auto-generated method stub
		List<NoticeVO> NoticeList = NoticeDao.selectAll();
		return NoticeList;
	}

	@Override
	public NoticeVO detailNotice(int empNo) {
		
		return NoticeDao.detailNotice(empNo);
	}

	@Override
	public int updateNotice(NoticeVO nv) {
		int cnt = NoticeDao.updateNotice(nv);
		return cnt;
	}

	@Override
	public int updateViews(int brdNo) {
		int cnt = NoticeDao.updateViews(brdNo);
		return cnt;
	}





	
}
