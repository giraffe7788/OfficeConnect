package vo;

import java.util.Date;

public class MeetingVO {
	
	private int mtrbookNo;
	private int mtrNo;
	private String empNo;
	private Date mtrbookRent;
	private Date mtrbookRtn;
	private int mtrbookPer;
	private String mtrbookCont;
	
	public MeetingVO(int mtrbookNo, int mtrNo, String empNo, Date mtrbookRent, Date mtrbookRtn, int mtrbookPer,
			String mtrbookCont) {
		super();
		this.mtrbookNo = mtrbookNo;
		this.mtrNo = mtrNo;
		this.empNo = empNo;
		this.mtrbookRent = mtrbookRent;
		this.mtrbookRtn = mtrbookRtn;
		this.mtrbookPer = mtrbookPer;
		this.mtrbookCont = mtrbookCont;
	}

	public int getMtrbookNo() {
		return mtrbookNo;
	}

	public void setMtrbookNo(int mtrbookNo) {
		this.mtrbookNo = mtrbookNo;
	}

	public int getMtrNo() {
		return mtrNo;
	}

	public void setMtrNo(int mtrNo) {
		this.mtrNo = mtrNo;
	}

	public String getEmpNo() {
		return empNo;
	}

	public void setEmpNo(String empNo) {
		this.empNo = empNo;
	}

	public Date getMtrbookRent() {
		return mtrbookRent;
	}

	public void setMtrbookRent(Date mtrbookRent) {
		this.mtrbookRent = mtrbookRent;
	}

	public Date getMtrbookRtn() {
		return mtrbookRtn;
	}

	public void setMtrbookRtn(Date mtrbookRtn) {
		this.mtrbookRtn = mtrbookRtn;
	}

	public int getMtrbookPer() {
		return mtrbookPer;
	}

	public void setMtrbookPer(int mtrbookPer) {
		this.mtrbookPer = mtrbookPer;
	}

	public String getMtrbookCont() {
		return mtrbookCont;
	}

	public void setMtrbookCont(String mtrbookCont) {
		this.mtrbookCont = mtrbookCont;
	}
	
}
