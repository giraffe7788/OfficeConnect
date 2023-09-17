package vo;

public class ReviewVO {

	private String empNo;
	private int revScore;
	private String revEmpNo;
	private String revDate;
	private int revNo;
	
	public ReviewVO() {}
	
	public ReviewVO(String empNo, int revNo, int revScore, String revEmpNo, String revDate) {
		super();
		this.empNo = empNo;
		this.revNo = revNo;
		this.revScore = revScore;
		this.revEmpNo = revEmpNo;
		this.revDate = revDate;
	}

	public String getEmpNo() {
		return empNo;
	}

	public void setEmpNo(String empNo) {
		this.empNo = empNo;
	}

	public int getRevScore() {
		return revScore;
	}

	public void setRevScore(int revScore) {
		this.revScore = revScore;
	}

	public String getRevEmpNo() {
		return revEmpNo;
	}

	public void setRevEmpNo(String revEmpNo) {
		this.revEmpNo = revEmpNo;
	}

	public String getRevDate() {
		return revDate;
	}

	public void setRevDate(String revDate) {
		this.revDate = revDate;
	}

	public int getRevNo() {
		return revNo;
	}

	public void setRevNo(int revNo) {
		this.revNo = revNo;
	}
}