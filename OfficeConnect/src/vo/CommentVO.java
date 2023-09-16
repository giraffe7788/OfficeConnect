package vo;

import java.text.SimpleDateFormat;
import java.util.Date;

public class CommentVO {

	private int commNo;
	private String empNo;
	private String commCont;
	private int brdNo;
	private Date commDate;
	private Date commMod;
	private String empPosit;
	private String empName;
	private String deptName;		
	

	public String getDeptName() {
		return deptName;
	}

	public void setDeptName(String deptName) {
		this.deptName = deptName;
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

	public CommentVO() {}

	public CommentVO(String commCont, int brdNo, int commDeleteYn) {
		this.commCont = commCont;
		this.brdNo = brdNo;
	}

	public int getCommNo() {
		return commNo;
	}

	public void setCommNo(int commNo) {
		this.commNo = commNo;
	}

	public String getEmpNo() {
		return empNo;
	}

	public void setEmpNo(String empNo) {
		this.empNo = empNo;
	}

	public String getCommCont() {
		return commCont;
	}

	public void setCommCont(String commCont) {
		this.commCont = commCont;
	}

	public int getBrdNo() {
		return brdNo;
	}

	public void setBrdNo(int brdNo) {
		this.brdNo = brdNo;
	}

	public Date getCommDate() {
		return commDate;
	}
	


	public void setCommDate(Date commDate) {
		this.commDate = commDate;
	}

	public Date getCommMod() {
		return commMod;
	}
	
	public String getCommModDisplay() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		return sdf.format(this.commMod);
	}

	public void setCommMod(Date commMod) {
		this.commMod = commMod;
	}

	@Override
	public String toString() {
		return "CommentVO [commNo=" + commNo + ", empNo=" + empNo + ", commCont=" + commCont + ", brdNo=" + brdNo
				+ ", commDate=" + commDate + ", commMod=" + commMod + "]";
	}


	

	
	
}
