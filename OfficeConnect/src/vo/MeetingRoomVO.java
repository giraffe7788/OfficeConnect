package vo;

public class MeetingRoomVO {
	String mtrNo;
	String mtrPer;
	
	public MeetingRoomVO() {}
	public MeetingRoomVO(String mtrNo, String mtrPer) {
		super();
		this.mtrNo = mtrNo;
		this.mtrPer = mtrPer;
	}
	public void setMtrNo(String mtrNo) {
		this.mtrNo = mtrNo;
	}
	public void setMtrPer(String mtrPer) {
		this.mtrPer = mtrPer;
	}
	public String getMtrNo() {
		return mtrNo;
	}
	public String getMtrPer() {
		return mtrPer;
	}
}
