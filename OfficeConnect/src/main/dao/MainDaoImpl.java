package main.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;

import util.MyBatisUtil;
import util.SessionEmpInfo;
import vo.ApprovalVO;
import vo.BoardVO;
import vo.EmpVO;
import vo.MailVO;
import vo.NoticeVO;

public class MainDaoImpl implements IMainDao {

	private static IMainDao mainDao;

	public MainDaoImpl() {

	}

	public static IMainDao getInstance() {
		if(mainDao == null) {
			mainDao = new MainDaoImpl();
		}
		return mainDao;
	}

	@Override
	public List<EmpVO> selectMember(String empNo) {

		List<EmpVO> mtrList = new ArrayList<EmpVO>();
		SqlSession session = MyBatisUtil.getInstance();

		mtrList = session.selectList("", empNo);

		return mtrList;
	}

	
	/**
	 * 메인에 출력하기 위한 최근 보낸 결재내역 5개 가져오기
	 * @param empNo
	 * @return apprList 최근 발신결재5개
	 */
	@Override
	public List<ApprovalVO> getSendApprovalList(String empNo){
		
		SqlSession session = MyBatisUtil.getInstance(true);
		List<ApprovalVO> apprList = new ArrayList<>();
		
		try {
			apprList = session.selectList("approval.getCurrentSendApprovalList", empNo);
 		} catch(PersistenceException e) {
 			e.printStackTrace();
 		} finally {
 			session.close();
 		}
		
		return apprList;
	}
	
	
	/**
	 * 메인에 출력하기 위한 최근 공지사항 5개 가져오기
	 * @return noticeList 최근 공지사항5개
	 */
	@Override
	public List<NoticeVO> getCurrentNoticeList(){
		
		SqlSession session = MyBatisUtil.getInstance(true);
		List<NoticeVO> noticeList = new ArrayList<>();
		
		try {
			noticeList = session.selectList("notice.getCurrentNoticeList");
		} catch (PersistenceException e) {
			session.rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return noticeList;
	}
			
			
	/**
	 * 메인에 출력하기 위한 최근 자유게시판 글 5개 가져오기
	 * @return boardList 최근 자유게시판 글 5개
	 */
	@Override
	public List<BoardVO> getCurrentBoardList(){
		
		SqlSession session = MyBatisUtil.getInstance(true);
		List<BoardVO> boardList = new ArrayList<>();
		
		try {
			boardList = session.selectList("board.getCurrentBoardList");
		} catch (PersistenceException e) {
			session.rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return boardList;
	}

			
	/**
	 * 메인에 출력하기 위한 최근 수신메일 5개 가져오기
	 * @param empNo
	 * @return mailList 최근 수신메일5개
	 */
	@Override
	public List<MailVO> getCurrentReceiveMailList(String empNo){
		
		SqlSession session = MyBatisUtil.getInstance(true);
		List<MailVO> mailList = new ArrayList<>();
		
		try {
			mailList = session.selectList("mail.getCurrentReceiveMailList", SessionEmpInfo.getInstance().getEmpVO(empNo).getEmpEmail());
		} catch (PersistenceException e) {
			session.rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return mailList;
	}
}