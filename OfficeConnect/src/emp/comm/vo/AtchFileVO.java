package emp.comm.vo;

import java.util.Date;

public class AtchFileVO {
	
	private String empNo; 	 	// 사원번호
	private String imgPath;     // 파일저장경로
	private String imgExtin;    // 파일명
	private String orignFileName; // 원본파일명
	
	public AtchFileVO(){};
	public String getEmpNo() {
		return empNo;
	}
	public void setEmpNo(String empNo) {
		this.empNo = empNo;
	}
	public String getImgPath() {
		return imgPath;
	}
	public void setImgPath(String imgPath) {
		this.imgPath = imgPath;
	}
	public String getImgExtin() {
		return imgExtin;
	}
	public void setImgExtin(String imgExtin) {
		this.imgExtin = imgExtin;
	}
	public String getOrignFileName() {
		return orignFileName;
	}
	public void setOrignFileName(String orignFileName) {
		this.orignFileName = orignFileName;
	}
	
	
	
}