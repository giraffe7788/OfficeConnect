package mail.dao;

import java.util.List;
import java.util.Map;

import vo.MailVO;

public interface IMailDao {
	
	
	/**
	 * 메일 쓰기를 위한 메서드
	 * @param mailVO
	 * @return 성공 1 반환, 실패 0 반환
	 */
	public int sendMail(MailVO mailVO);
	
	
	/**
	 * 메일 삭제를 위한 메서드
	 * @param mailNo 삭제할 메일 번호
	 * @return 삭제 성공 1 반환, 실패 0 반환
	 */
	public int deleteMail(int mailNo);
	
	
	/**
	 * 메일 리스트 뽑아오는 메서드, 파라미터로 보낸메일을 뽑을지 받은메일을 뽑을지 결정
	 * @param isSend로 보낸메일인지 받은메일인지 확인 후 전달
	 * @return mailList
	 */
	public List<MailVO> getMailList(Map<String,Object> isSend);


	/**
	 * 사용자로부터 받은 MailNo와 실제 DB의 Mail정보를 조회함
	 * @param mailNo
	 * @return
	 */
	public MailVO getMailByMailNo(String mailNo);


}
