package vo;

public class CarVO {
	
	
	private String carNo;	//차량번호
	private String carName;	//차이름
	private String carImagePath; //차량이미지경로
	private String carImageName; //차량이미지이름
	
	public CarVO(){}

	public CarVO(String carNo, String carName, String carImagePath, String carImageName) {
		super();
		this.carNo = carNo;
		this.carName = carName;
		this.carImagePath = carImagePath;
		this.carImageName = carImageName;
	}

	public String getCarNo() {
		return carNo;
	}

	public void setCarNo(String carNo) {
		this.carNo = carNo;
	}

	public String getCarName() {
		return carName;
	}

	public void setCarName(String carName) {
		this.carName = carName;
	}

	public String getcarImagePath() {
		return carImagePath;
	}

	public void setcarImagePath(String carImagePath) {
		this.carImagePath = carImagePath;
	}

	public String getcarImageName() {
		return carImageName;
	}

	public void setCarImgName(String carImageName) {
		this.carImageName = carImageName;
	}
	
	
	
	
	
	

	

}
