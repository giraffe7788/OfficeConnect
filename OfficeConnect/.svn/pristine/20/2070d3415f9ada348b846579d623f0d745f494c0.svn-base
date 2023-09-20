package main.dao;

import java.util.List;

import vo.ApprovalVO;
import vo.BoardVO;
import vo.EmpVO;
import vo.MailVO;
import vo.NoticeVO;

public interface IMainDao {

	public List<EmpVO> selectMember(String empNo);

	
	/**
	 * 메인에 출력하기 위한 최근 보낸 결재내역 5개 가져오기
	 * @param empNo
	 * @return apprList 최근 발신결재5개
	 */
	public List<ApprovalVO> getSendApprovalList(String empNo);
	
	
	/**
	 * 메인에 출력하기 위한 최근 공지사항 5개 가져오기
	 * @return noticeList 최근 공지사항5개
	 */
	public List<NoticeVO> getCurrentNoticeList();
			
			
	/**
	 * 메인에 출력하기 위한 최근 자유게시판 글 5개 가져오기
	 * @return boardList 최근 자유게시판 글 5개
	 */
	public List<BoardVO> getCurrentBoardList();

			
	/**
	 * 메인에 출력하기 위한 최근 수신메일 5개 가져오기
	 * @param empNo
	 * @return mailList 최근 수신메일5개
	 */
	public List<MailVO> getCurrentReceiveMailList(String empNo);
}
