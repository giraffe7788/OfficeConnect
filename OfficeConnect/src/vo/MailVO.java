package vo;

import java.text.SimpleDateFormat;
import java.util.Date;

public class MailVO {
	private String mailCont;   	  // 메일내용
	private String mailSender; 	  // 보낸사람
	private String mailReceiver;  // 받는사람
	private int mailNo;        	  // 메일번호(PK)
	private int mailSendstat;     // 보낸사람 메일 상태(0 삭제안함, 1 삭제함)
	private int mailRecestat;     // 받은사람 메일 상태(0 삭제안함, 1 삭제함)
	private Date mailSenddate;    // 메일 발신날짜
	private String isSend; 		  // 보낸메일 확인
	private String mailTitle;	  // 메일제목
	
	public MailVO (){};
	
	public MailVO(String mailCont, String mailSender, String mailReceiver, int mailNo, int mailSendstat,
			int mailRecestat, Date mailSenddate) {
		super();
		this.mailCont = mailCont;
		this.mailSender = mailSender;
		this.mailReceiver = mailReceiver;
		this.mailNo = mailNo;
		this.mailSendstat = mailSendstat;
		this.mailRecestat = mailRecestat;
		this.mailSenddate = mailSenddate;
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

	public int getMailSendstat() {
		return mailSendstat;
	}

	public void setMailSendstat(int mailSendstat) {
		this.mailSendstat = mailSendstat;
	}

	public int getMailRecestat() {
		return mailRecestat;
	}

	public void setMailRecestat(int mailRecestat) {
		this.mailRecestat = mailRecestat;
	}

	public Date getMailSenddate() {
		return mailSenddate;
	}
	
	public String getMailSenddateFormat() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return sdf.format(this.mailSenddate);
	}
	
	public void setMailSenddate(Date mailSenddate) {
		this.mailSenddate = mailSenddate;
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
