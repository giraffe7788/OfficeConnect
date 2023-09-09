package board.vo;

import java.text.SimpleDateFormat;
import java.util.Date;

public class BoardVO {

	private int brdNo;
	private String empNo;
	private Date brdDate;
	private Date brdMod;
	private String brdCont;
	private String brdTitle;
	private int brdViews;

	public BoardVO() {
	}

	public BoardVO(String brdCont, String brdTitle) {
		this.brdCont = brdCont;
		this.brdTitle = brdTitle;
	}

	public int getBrdNo() {
		return brdNo;
	}

	public void setBrdNo(int brdNo) {
		this.brdNo = brdNo;
	}

	public String getEmpNo() {
		return empNo;
	}

	public void setEmpNo(String empNo) {
		this.empNo = empNo;
	}

	public Date getBrdDate() {
		return brdDate;
	}

	public String getBrdDateDisplay() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		return sdf.format(this.brdDate);
	}

	public void setBrdDate(Date brdDate) {
		this.brdDate = brdDate;
	}

	public Date getBrdMod() {
		return brdMod;
	}

	public String getBrdModDisplay() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		return sdf.format(this.brdMod);
	}

	public void setBrdMod(Date brdMod) {
		this.brdMod = brdMod;
	}

	public String getBrdCont() {
		return brdCont;
	}

	public void setBrdCont(String brdCont) {
		this.brdCont = brdCont;
	}

	public String getBrdTitle() {
		return brdTitle;
	}

	public void setBrdTitle(String brdTitle) {
		this.brdTitle = brdTitle;
	}

	public int getBrdViews() {
		return brdViews;
	}

	public void setBrdViews(int brdViews) {
		this.brdViews = brdViews;
	}

	@Override
	public String toString() {
		return "BoardVO [brdNo=" + brdNo + ", empNo=" + empNo + ", brdDate=" + brdDate + ", brdMod=" + brdMod
				+ ", brdCont=" + brdCont + ", brdTitle=" + brdTitle + ", brdViews=" + brdViews + "]";
	}

}
