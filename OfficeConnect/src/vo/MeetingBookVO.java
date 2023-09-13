package vo;

public class MeetingBookVO {

	private int mtrbookNo;
	private int mtrNo;
	private String empNo;
	private String mtrbookRent;
	private String mtrbookRtn;
	private int mtrbookPer;
	private String mtrbookCont;

	public MeetingBookVO() {}

	public MeetingBookVO(int mtrNo, String empNo, String mtrbookRent, String mtrbookRtn, int mtrbookPer,
			String mtrbookCont) {
		super();
		this.mtrNo = mtrNo;
		this.empNo = empNo;
		this.mtrbookRent = mtrbookRent;
		this.mtrbookRtn = mtrbookRtn;
		this.mtrbookPer = mtrbookPer;
		this.mtrbookCont = mtrbookCont;
	}

	public int getMtrBookNo() {
		return mtrbookNo;
	}
	public void setMtrBookNo(int mtrbookNo) {
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

	public String getMtrbookRent() {
		return mtrbookRent;
	}

	public void setMtrbookRent(String mtrbookRent) {
		this.mtrbookRent = mtrbookRent;
	}

	public String getMtrbookRtn() {
		return mtrbookRtn;
	}

	public void setMtrbookRtn(String mtrbookRtn) {
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
