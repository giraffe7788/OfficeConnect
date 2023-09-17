package vo;

import java.util.Date;

//vo 수정해야함.
public class CarBookVO {
	
	private String empNo;	//사원번호
	private String carNo;	//차량번호
	private Date carBookRent;	//예약?빌린여부
	private Date carBookReturn; //반납여부
	
	
	public CarBookVO() {}
	
	public CarBookVO(String empNo, String carNo, Date carBookRent, Date carBookReturn) {
		super();
		this.empNo = empNo;
		this.carNo = carNo;
		this.carBookRent = carBookRent;
		this.carBookReturn = carBookReturn;
	}


	public String getEmpNo() {
		return empNo;
	}
	public void setEmpNo(String empNo) {
		this.empNo = empNo;
	}
	public String getCarNo() {
		return carNo;
	}
	public void setCarNo(String carNo) {
		this.carNo = carNo;
	}
	public Date getCarBookRent() {
		return carBookRent;
	}
	public void setCarBookRent(Date carBookRent) {
		this.carBookRent = carBookRent;
	}
	public Date getCarBookReturn() {
		return carBookReturn;
	}
	public void setCarBookReturn(Date carBookReturn) {
		this.carBookReturn = carBookReturn;
	}
	
	
	
	

}
