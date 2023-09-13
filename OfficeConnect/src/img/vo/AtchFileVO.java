package img.vo;

import java.util.Date;

public class AtchFileVO {
	
	private String empNo; 	 	// 사원번호
	private String imgPath;     // 파일저장경로
	private String imgName;     // 파일명
	
	public AtchFileVO(){};
	
	public AtchFileVO(String empNo, String imgPath, String imgName) {
		this.empNo = empNo;
		this.imgPath = imgPath;
		this.imgName = imgName;
	}

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
	public void setImgName(String imgName) {
		this.imgName = imgName;
	}
	public String getImgName() {
		return imgName;
	}
}