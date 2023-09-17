package vo;

public class ApprovalLineVO {
	
	String apprlNo;
	String apprlSeq1;
	String apprlSeq2;
	String apprlSeq3;
	
	public ApprovalLineVO(String apprlSeq1, String apprlSeq2, String apprlSeq3) {
		this.apprlSeq1 = apprlSeq1;
		this.apprlSeq2 = apprlSeq2;
		this.apprlSeq3 = apprlSeq3;
	}

	public String getapprlNo() {
		return apprlNo;
	}

	public void setapprlNo(String apprlNo) {
		this.apprlNo = apprlNo;
	}

	public String getapprlSeq1() {
		return apprlSeq1;
	}

	public void setapprlSeq1(String apprlSeq1) {
		this.apprlSeq1 = apprlSeq1;
	}

	public String getapprlSeq2() {
		return apprlSeq2;
	}

	public void setapprlSeq2(String apprlSeq2) {
		this.apprlSeq2 = apprlSeq2;
	}

	public String getapprlSeq3() {
		return apprlSeq3;
	}

	public void setapprlSeq3(String apprlSeq3) {
		this.apprlSeq3 = apprlSeq3;
	}
}
