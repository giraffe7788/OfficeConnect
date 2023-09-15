package vo;

import java.util.Date;

public class MailVO {
	private String mailCont;   	  // 메일내용
	private String mailSender; 	  // 보낸사람
	private String mailReceiver;  // 받는사람
	private int mailNo;        	  // 메일번호(PK)
	private int mailSendStat;     // 보낸사람 메일 상태(0 삭제안함, 1 삭제함)
	private int mailReceStat;     // 받은사람 메일 상태(0 삭제안함, 1 삭제함)
	private Date mailSendDate;    // 메일 발신날짜
	private String isSend; 		  // 보낸메일 확인
	private String mailTitle; 		  // 메일 제목
	
	public MailVO (){};
	
	public MailVO(String mailCont, String mailSender, String mailReceiver, int mailNo, int mailSendStat,
			int mailReceStat, Date mailSendDate) {
		super();
		this.mailCont = mailCont;
		this.mailSender = mailSender;
		this.mailReceiver = mailReceiver;
		this.mailNo = mailNo;
		this.mailSendStat = mailSendStat;
		this.mailReceStat = mailReceStat;
		this.mailSendDate = mailSendDate;
	}

	public String getMailCont() {
		return mailCont;
	}

	public void setMailCont(String mailCont) {
		this.mailCont = mailCont;
	}

	public String getMailSender() {
		return mailSender;
	}

	public void setMailSender(String mailSender) {
		this.mailSender = mailSender;
	}

	public String getMailReceiver() {
		return mailReceiver;
	}

	public void setMailReceiver(String mailReceiver) {
		this.mailReceiver = mailReceiver;
	}

	public int getMailNo() {
		return mailNo;
	}

	public void setMailNo(int mailNo) {
		this.mailNo = mailNo;
	}

	public int getMailSendStat() {
		return mailSendStat;
	}

	public void setMailSendStat(int mailSendStat) {
		this.mailSendStat = mailSendStat;
	}

	public int getMailReceStat() {
		return mailReceStat;
	}

	public void setMailReceStat(int mailReceStat) {
		this.mailReceStat = mailReceStat;
	}

	public Date getMailSendDate() {
		return mailSendDate;
	}

	public void setMailSendDate(Date mailSendDate) {
		this.mailSendDate = mailSendDate;
	}

	public String getIsSend() {
		return isSend;
	}

	public void setIsSend(String isSend) {
		this.isSend = isSend;
	}

	public String getMailTitle() {
		return mailTitle;
	}

	public void setMailTitle(String mailTitle) {
		this.mailTitle = mailTitle;
	}
	
}
