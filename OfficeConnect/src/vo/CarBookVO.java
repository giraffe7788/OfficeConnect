package vo;

import java.util.Date;

//vo 수정해야함.
public class CarBookVO {
	
	private String carBookNo;
	private String empNo;	//사원번호
	private String carNo;	//차량번호
	private Date carBookRent;	//예약날짜
	private Date carBookReturn; //반납날짜
	private String carBookCont; // 예약사유
	
	
	public CarBookVO() {}
	
	//차량 예약을 위한 생성자
	public CarBookVO(String empNo, String carNo, Date carBookRent, Date carBookReturn, String carBookCont) {
		super();
		this.empNo = empNo;
		this.carNo = carNo;
		this.carBookRent = carBookRent;
		this.carBookReturn = carBookReturn;
		this.carBookCont = carBookCont;
	}

	public String getCarBookNo() {
		return carBookNo;
	}
	public void setCarBookNo(String carBookNo) {
		this.carBookNo = carBookNo;
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

	public String getCarBookCont() {
		return carBookCont;
	}

	public void setCarBookCont(String carBookCont) {
		this.carBookCont = carBookCont;
	}
	



	
	
	
	
	

}
