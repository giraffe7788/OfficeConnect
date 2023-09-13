package vo;

public class EmpVO {

	private String empNo;		// 사번
	private String empPw;		// 비밀번호
	private String empAddr;		// 주소
	private String empTel;		// 전화번호
	private String empEmail;	// 이메일
	private String empName;		// 이름
	private String empPosit;	// 직급
	private int empState;		// 상태코드(부재중, 업무중 등..)
	private int adminCode;		// 관리자여부코드(0이면 일반사원, 1이면 관리자)
	private int deptCode;		// 부서코드
	private String deptName;		// 부서이름
	private String imgYn;		// 이미지 존재여부
	
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
	public int getEmpState() {
		return empState;
	}
	public void setEmpState(int empState) {
		this.empState = empState;
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

	public String getImgYn() {
		return imgYn;
	}
	
	public void setImgYn(String imgYn) {
		this.imgYn = imgYn;
	}
	
	public String getDeptName() {
		return deptName;
	}
	
	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}

	public String getEmpStateName() {
		return empStateName;
	}

	public void setEmpStateName(String empStateName) {
		this.empStateName = empStateName;
	}
}
