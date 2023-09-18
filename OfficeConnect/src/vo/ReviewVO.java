package vo;

public class ReviewVO {

	private String empNo;
	private String revEmpNo;
	private String revDate;
	private int resScore;
	private int scrScore;
	private int copScore;
	private int creScore;
	
	public ReviewVO() {}

	public ReviewVO(String empNo, String revEmpNo, String revDate, int resScore, int scrScore, int copScore,
			int creScore) {
		super();
		this.empNo = empNo;
		this.revEmpNo = revEmpNo;
		this.revDate = revDate;
		this.resScore = resScore;
		this.scrScore = scrScore;
		this.copScore = copScore;
		this.creScore = creScore;
	}

	public String getEmpNo() {
		return empNo;
	}

	public void setEmpNo(String empNo) {
		this.empNo = empNo;
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

	public int getResScore() {
		return resScore;
	}

	public void setResScore(int resScore) {
		this.resScore = resScore;
	}

	public int getScrScore() {
		return scrScore;
	}

	public void setScrScore(int scrScore) {
		this.scrScore = scrScore;
	}

	public int getCopScore() {
		return copScore;
	}

	public void setCopScore(int copScore) {
		this.copScore = copScore;
	}

	public int getCreScore() {
		return creScore;
	}

	public void setCreScore(int creScore) {
		this.creScore = creScore;
	}
	
}