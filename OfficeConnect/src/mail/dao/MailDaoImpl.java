package mail.dao;

import java.util.ArrayList;
import java.util.List;

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
	 * 보낸 메일함 확인 메서드
	 * @param isSend
	 * @return 보낸 메일함 확인
	 */
	@Override
	public boolean checkMail(String isSend) {
		
		boolean isExist = false;
		SqlSession session = MyBatisUtil.getInstance();
		
		try {
			int cnt = session.selectOne("mail.checkMail", isSend);
			
			if(cnt > 0) {
				isExist = true;
			}
			
		} catch (PersistenceException e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			session.close();
		}
		return isExist;
	}
	
	/**
	 * 메일 리스트 뽑아오는 메서드, 파라미터로 보낸메일을 뽑을지 받은메일을 뽑을지 결정
	 * @param isSend
	 * @return 메일리스트
	 */
	@Override
	public List<MailVO> getMailList(boolean isSend) {
		List<MailVO> mailList = new ArrayList<MailVO>();
		
		SqlSession session = MyBatisUtil.getInstance(true);
		
		try {
			
			if(isSend) {
				mailList = session.selectList("mail.getSendMail"); //보낸메일
			}else {
				mailList = session.selectList("mail.getReceiveMail"); //받은메일
			}
		
		} catch (PersistenceException ex) {
			ex.printStackTrace();
		} finally {
			session.close();
		}
		return mailList;
	}
	
}
