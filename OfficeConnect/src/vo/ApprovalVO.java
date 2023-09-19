package vo;

import java.util.Date;

public class ApprovalVO {
	
	int apprNo;
	String empNo;
	int apprlNo;
	String apprCont;
	int apprType;
	Date apprDate;
	int apprsCode;
	
	public ApprovalVO() {}
	public ApprovalVO(String empNo, String apprCont, int apprType) {
		this.empNo = empNo;
		this.apprCont = apprCont;
		this.apprType = apprType;
	}

	public int getApprNo() {
		return apprNo;
	}

	public void setApprNo(int apprNo) {
		this.apprNo = apprNo;
	}

	public String getEmpNo() {
		return empNo;
	}

	public void setEmpNo(String empNo) {
		this.empNo = empNo;
	}

	public int getApprlNo() {
		return apprlNo;
	}

	public void setApprlNo(int apprlNo) {
		this.apprlNo = apprlNo;
	}

	public String getApprCont() {
		return apprCont;
	}

	public void setApprCont(String apprCont) {
		this.apprCont = apprCont;
	}

	public int getApprType() {
		return apprType;
	}

	public void setApprType(int apprType) {
		this.apprType = apprType;
	}
	public Date getApprDate() {
		return apprDate;
	}
	public void setApprDate(Date apprDate) {
		this.apprDate = apprDate;
	}
	public int getApprsCode() {
		return apprsCode;
	}
	public void setApprsCode(int apprsCode) {
		this.apprsCode = apprsCode;
	}
}
