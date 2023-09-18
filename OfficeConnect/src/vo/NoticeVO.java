package vo;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

public class NoticeVO implements Comparable<NoticeVO> {

	private int ntcNo;
	private String empNo;
	private Date ntcDate;

	private String ntcCont;
	private String ntcTitle;
	private int ntcViews;
	private int adminCode;
	private String empPosit;
	private String empName;
	private int deptCode;
	private String deptName;

	public NoticeVO() {
	}

	public NoticeVO(int ntcNo, String empNo, Date ntcDate, Date ntcMod, String ntcCont, String ntcTitle, int ntcViews,
			int adminCode, String empPosit, String empName, int deptCode) {

		this.ntcNo = ntcNo;
		this.empNo = empNo;
		this.ntcDate = ntcDate;
		this.ntcCont = ntcCont;
		this.ntcTitle = ntcTitle;
		this.ntcViews = ntcViews;
		this.adminCode = adminCode;
		this.empPosit = empPosit;
		this.empName = empName;
		this.deptCode = deptCode;
	}

	public String getDeptName() {
		return deptName;
	}

	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}

	public int getNtcNo() {
		return ntcNo;
	}

	public void setNtcNo(int ntcNo) {
		this.ntcNo = ntcNo;
	}

	public String getEmpNo() {
		return empNo;
	}

	public void setEmpNo(String empNo) {
		this.empNo = empNo;
	}

	public Date getNtcDate() {
		return ntcDate;
	}

	public String getNtcDateDisplay() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		return sdf.format(this.ntcDate);
	}

	public void setNtcDate(Date ntcDate) {
		this.ntcDate = ntcDate;
	}

	public String getNtcCont() {
		return ntcCont;
	}

	public void setNtcCont(String ntcCont) {
		this.ntcCont = ntcCont;
	}

	public String getNtcTitle() {
		return ntcTitle;
	}

	public void setNtcTitle(String ntcTitle) {
		this.ntcTitle = ntcTitle;
	}

	public int getNtcViews() {
		return ntcViews;
	}

	public void setNtcViews(int ntcViews) {
		this.ntcViews = ntcViews;
	}

	public int getAdminCode() {
		return adminCode;
	}

	public void setAdminCode(int adminCode) {
		this.adminCode = adminCode;
	}

	public String getEmpPosit() {
		return empPosit;
	}

	public void setEmpPosit(String empPosit) {
		this.empPosit = empPosit;
	}

	public String getEmpName() {
		return empName;
	}

	public void setEmpName(String empName) {
		this.empName = empName;
	}

	public int getDeptCode() {
		return deptCode;
	}

	public void setDeptCode(int deptCode) {
		this.deptCode = deptCode;
	}

	@Override
	public String toString() {
		return "NoticeVO [ntcNo=" + ntcNo + ", empNo=" + empNo + ", ntcDate=" + ntcDate + ", ntcCont=" + ntcCont
				+ ", ntcTitle=" + ntcTitle + ", ntcViews=" + ntcViews + ", adminCode=" + adminCode + ", empPosit="
				+ empPosit + ", empName=" + empName + ", deptCode=" + deptCode + "]";
	}

	@Override
	public int compareTo(NoticeVO bvo) {
		return this.ntcDate.compareTo(bvo.getNtcDate());
	}

}