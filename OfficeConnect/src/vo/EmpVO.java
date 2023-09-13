package vo;

public class EmpVO {

	private String empNo;		// 사번
	private String empPw;		// 비밀번호
	private String empAddr;		// 주소
	private String empTel;		// 전화번호
	private String empEmail;	// 이메일
	private String empName;		// 이름
	private String empPosit;	// 직급
	private int stateCode;		// 상태코드(부재중, 업무중 등..)
	private int adminCode;		// 관리자여부코드(0이면 일반사원, 1이면 관리자)
	private int deptCode;		// 부서코드
	
	public EmpVO() {};
	
	public EmpVO(String empPw, String empAddr, String empTel, String empEmail, String empName,
			String empPosit, int adminCode, int deptCode) {
		super();
		this.empPw = empPw;
		this.empAddr = empAddr;
		this.empTel = empTel;
		this.empEmail = empEmail;
		this.empName = empName;
		this.empPosit = empPosit;
		this.adminCode = adminCode;
		this.deptCode = deptCode;
	}
	
	public String getEmpNo() {
		return empNo;
	}
	public void setEmpNo(String empNo) {
		this.empNo = empNo;
	}
	public String getEmpPw() {
		return empPw;
	}
	public void setEmpPw(String empPw) {
		this.empPw = empPw;
	}
	public String getEmpAddr() {
		return empAddr;
	}
	public void setEmpAddr(String empAddr) {
		this.empAddr = empAddr;
	}
	public String getEmpTel() {
		return empTel;
	}
	public void setEmpTel(String empTel) {
		this.empTel = empTel;
	}
	public String getEmpEmail() {
		return empEmail;
	}
	public void setEmpEmail(String empEmail) {
		this.empEmail = empEmail;
	}
	public String getEmpName() {
		return empName;
	}
	public void setEmpName(String empName) {
		this.empName = empName;
	}
	public String getEmpPosit() {
		return empPosit;
	}
	public void setEmpPosit(String empPosit) {
		this.empPosit = empPosit;
	}
	
	public int getStateCode() {
		return stateCode;
	}

	public void setStateCode(int stateCode) {
		this.stateCode = stateCode;
	}

	public int getAdminCode() {
		return adminCode;
	}
	public void setAdminCode(int adminCode) {
		this.adminCode = adminCode;
	}
	public int getDeptCode() {
		return deptCode;
	}
	public void setDeptCode(int deptCode) {
		this.deptCode = deptCode;
	}
}
