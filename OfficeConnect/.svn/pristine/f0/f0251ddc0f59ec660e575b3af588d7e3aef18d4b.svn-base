package main.service;

import java.util.List;

import main.dao.IMainDao;
import main.dao.MainDaoImpl;
import vo.ApprovalVO;
import vo.BoardVO;
import vo.EmpVO;
import vo.MailVO;
import vo.NoticeVO;

public class MainServiceImpl implements IMainService {

	private static MainServiceImpl instance = new MainServiceImpl();

	private IMainDao mainDao;

	public MainServiceImpl() {
		mainDao = MainDaoImpl.getInstance();
	}

	public static IMainService getInstance() {
		return instance;
	}


	@Override
	public List<EmpVO> getMtrBook(String empNo) {

		List<EmpVO> mtrList = mainDao.selectMember(empNo);

		return mtrList;
	}
	
	
	/**
	 * 메인에 출력하기 위한 최근 보낸 결재내역 5개 가져오기
	 * @param empNo
	 * @return apprList 최근 발신결재5개
	 */
	@Override
	public List<ApprovalVO> getSendApprovalList(String empNo){
		return mainDao.getSendApprovalList(empNo);
	}
	
	
	/**
	 * 메인에 출력하기 위한 최근 공지사항 5개 가져오기
	 * @return noticeList 최근 공지사항5개
	 */
	@Override
	public List<NoticeVO> getCurrentNoticeList(){
		return mainDao.getCurrentNoticeList();
	}
			
			
	/**
	 * 메인에 출력하기 위한 최근 자유게시판 글 5개 가져오기
	 * @return boardList 최근 자유게시판 글 5개
	 */
	@Override
	public List<BoardVO> getCurrentBoardList(){
		return mainDao.getCurrentBoardList();
	}

			
	/**
	 * 메인에 출력하기 위한 최근 수신메일 5개 가져오기
	 * @param empNo
	 * @return mailList 최근 수신메일5개
	 */
	@Override
	public List<MailVO> getCurrentReceiveMailList(String empNo){
		return mainDao.getCurrentReceiveMailList(empNo);
	}
}