package mail.service;

import java.util.List;

import mail.dao.IMailDao;
import mail.dao.MailDaoImpl;
import vo.MailVO;

public class MailServiceImpl implements IMailService {
	
	// 싱글톤 패턴
	public static IMailService instance = null;
	private MailServiceImpl() {}
	public static IMailService getInstance() {
		if(instance == null) instance = new MailServiceImpl();
		return instance;
	}
	
	IMailDao mailDao = MailDaoImpl.getInstance();
	
	
	/**
	 * 메일쓰기를 위한 메서드
	 * @param mailVO
	 * @return 성공 1 반환, 실패 0 반환
	 */
	@Override
	public int writeMail(MailVO mailVO) {
		return mailDao.sendMail(mailVO);
	}
	
	
	/**
	 * 메일 삭제를 위한 메서드
	 * @param mailNo 삭제할 메일 번호
	 * @return 삭제 성공 1 반환, 실패 0 반환
	 */
	@Override
	public int removeMail(int mailNo) {
		return mailDao.deleteMail(mailNo);
	}
	
	
	/**
	 * 보낸 메일함 확인 메서드
	 * @param isSend
	 * @return 보낸 메일함 확인
	 */
	@Override
	public boolean checkMail(String isSend) {
		return mailDao.checkMail(isSend);
	}
	
	
	/**
	 * 메일 리스트 뽑아오는 메서드, 파라미터로 보낸메일을 뽑을지 받은메일을 뽑을지 결정
	 * @param isSend
	 * @return 메일리스트
	 */
	public List<MailVO> getMailList(boolean isSend){
		List<MailVO> mailList = mailDao.getMailList(isSend);
		return mailList;
	}

}
