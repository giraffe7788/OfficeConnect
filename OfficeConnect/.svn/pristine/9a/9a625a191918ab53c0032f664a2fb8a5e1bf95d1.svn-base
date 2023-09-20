package vo;

import java.text.SimpleDateFormat;
import java.util.Date;

public class MailVO {
	private String mailCont;   	  // 메일내용
	private String mailSender; 	  // 보낸사람
	private String mailSenderName; // 보낸사람 이름
	private String mailSenderEmail; // 보낸사람 이메일
	private String mailSenderPosit; // 보낸사람 직위
	private String mailReceiver;  // 받는사람
	private String mailReceiverName; // 받는사람 이름 ㄴㄴ 그게 
	private String mailReceiverPosit; // 받는사람 직위
	private int mailNo;        	  // 메일번호(PK)
	private int mailSendstat;     // 보낸사람 메일 상태(0 삭제안함, 1 삭제함)
	private int mailRecestat;     // 받은사람 메일 상태(0 삭제안함, 1 삭제함)
	private Date mailSenddate;    // 메일 발신날짜
	private String isSend; 		  // 보낸메일 확인
	private String mailTitle;	  // 메일제목
	private String empName;	 	  // 사원명
	private String empPosit;	  // 직위
	
	public MailVO (){};
	//EMP_NAME, EMP_POSIT
	public MailVO(String mailCont, String mailSender, String mailReceiver, int mailNo, int mailSendstat,
			int mailRecestat, Date mailSenddate, String empName, String empPosit) {
		super();
		this.mailCont = mailCont;
		this.mailSender = mailSender;
		this.mailReceiver = mailReceiver;
		this.mailNo = mailNo;
		this.mailSendstat = mailSendstat;
		this.mailRecestat = mailRecestat;
		this.mailSenddate = mailSenddate;
		this.empName = empName;
		this.empPosit = empPosit;
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

	public String getMailSenderName() {
		return mailSenderName;
	}

	public void setMailSenderName(String mailSenderName) {
		this.mailSenderName = mailSenderName;
	}

	public String getMailReceiverName() {
		return mailReceiverName;
	}

	public void setMailReceiverName(String mailReceiverName) {
		this.mailReceiverName = mailReceiverName;
	}

	public String getMailSenderEmail() {
		return mailSenderEmail;
	}

	public void setMailSenderEmail(String mailSenderEmail) {
		this.mailSenderEmail = mailSenderEmail;
	}

	public String getMailSenderPosit() {
		return mailSenderPosit;
	}

	public void setMailSenderPosit(String mailSenderPosit) {
		this.mailSenderPosit = mailSenderPosit;
	}

	public String getMailReceiverPosit() {
		return mailReceiverPosit;
	}

	public void setMailReceiverPosit(String mailReceiverPosit) {
		this.mailReceiverPosit = mailReceiverPosit;
	}
	public String getEmpName() {
		return empName;
	}
	
	public void getEmpName(String empName) {
		this.empName = empName;
	}
	public String getEmpPosit() {
		return empPosit;
	}
	
	public void getEmpPosit(String empPosit) {
		this.empPosit = empPosit;
	}
	
	
	
}
