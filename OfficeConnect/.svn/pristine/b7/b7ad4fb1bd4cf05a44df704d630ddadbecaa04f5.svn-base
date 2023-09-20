package mail.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;

import util.MyBatisUtil;
import vo.MailVO;

public class MailDaoImpl implements IMailDao {
	
	// 싱글톤 패턴
	public static IMailDao instance = null;
	private MailDaoImpl() {}
	public static IMailDao getInstance() {
		if(instance == null) instance = new MailDaoImpl();
		return instance;
	}
	
	
	/**
	 * 메일 쓰기를 위한 메서드
	 * @param mailVO
	 * @return 성공 1 반환, 실패 0 반환
	 */
	@Override
	public int sendMail(MailVO mailVO) {
		
		SqlSession session = MyBatisUtil.getInstance();
		
		int cnt = 0;
		
		try {
			cnt = session.insert("mail.writeMail", mailVO);
			if (cnt > 0) {
				session.commit();
			}
		} catch (PersistenceException ex) {
			session.rollback();
			ex.printStackTrace();
		} finally {
			session.close();
		}
		
		return cnt;
	}
	
	
	/**
	 * 메일 삭제를 위한 메서드
	 * @param mailNo 삭제할 메일 번호
	 * @return 삭제 성공 1 반환, 실패 0 반환
	 */
	public int deleteMail(int mailNo) {
		int cnt = 0;
		
		SqlSession session = MyBatisUtil.getInstance();
		
		try {
			cnt = session.delete("mail.deleteMail", mailNo);
			
			if (cnt > 0) {
				session.commit();
			}
		} catch (PersistenceException ex) {
			ex.printStackTrace();
			session.rollback();
			
		} finally {
			session.close();
		}
		return cnt;
	}
	
	/**
	 * 메일 리스트 뽑아오는 메서드, 파라미터로 보낸메일을 뽑을지 받은메일을 뽑을지 결정
	 * @param paramMap, isSend를 사용하여 보낸메일인지 받은메일인지 확인 후 전달
	 * 		  isSend가 1이면 받은메일, 그외는 보낸메일
	 * @return mailList
	 */
	@Override
	public List<MailVO> getMailList(Map<String,Object> paramMap) {
		List<MailVO> mailList = new ArrayList<MailVO>();
		
		SqlSession session = MyBatisUtil.getInstance(true);
				
		try {
			if("1".equals(paramMap.get("isSend"))) {
				mailList = session.selectList("mail.getReceiveMail",paramMap); //받은메일
			} else {
				mailList = session.selectList("mail.getSendMail",paramMap); //보낸메일
			}
		} catch (PersistenceException ex) {
			ex.printStackTrace();
		} finally {
			session.close();
		}
		return mailList;
	}
	
	
	/**
	 * 사용자로부터 받은 MailNo와 실제 DB의 Mail정보를 조회함
	 * @param mailNo
	 * @return
	 */
	@Override
	public MailVO getMailByMailNo(String mailNo) {
		MailVO mail = null;
		
		SqlSession session = MyBatisUtil.getInstance();
		
		try {
			mail = session.selectOne("mail.getMailByMailNo", mailNo);
			
		} catch (PersistenceException ex) {
			ex.printStackTrace();
		} finally {
			session.close();
		}
		return mail;
	}
	
}
