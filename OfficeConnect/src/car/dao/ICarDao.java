package car.dao;

import java.util.List;

import vo.CarBookVO;
import vo.CarVO;
import vo.EmpVO;

public interface ICarDao {
	

	/**
	 * 전체 보유차량 정보를 가져올 메서드
	 * @return 전체 차량정보를 담은 리스트
	 */
	public List<CarVO> selectAllCar();
	
	
	/**
	 * 차량 예약을 위한 메서드
	 * @param CarBookVO
	 * @return 성공여부
	 */
	public int insertCar(CarBookVO carBookVO);
	
	/**
	 * 예약 된 차 정보를 가져오는 메서드
	 * @return 전체 예약 차량 정보를 담은 리스트
	 */
	public List<CarBookVO> selectAllcarBookList();
	
	/**
	 * 차량 예약 한 사원의 이름을 가져오는 메서드
	 * @return 전체 예약 사원 정보를 담은 리스트
	 */
	public List<EmpVO> selectOnecarBookEmpName();

	/**
	 * 나의 차량 예약 내역을 가져오는 메서드
	 * @param empNo
	 * @return 해당 사원의 차량 예약 내역을 담은 메서드
	 */
	public CarBookVO selectOneMyCarBook(String empNo);

	/**
	 * 차량 번호로 차량 이미지를 가져오는 메서드
	 * @param carNo
	 * @return 차량 이미지
	 */
	public CarVO selectOneCarInfo(String carNo);

	/**
	 * 차량 예약내역을 삭제하는 메서드
	 * @param empNo
	 * @return 예약 삭제 성공여부 
	 */
	public int deleteCarBook(String empNo);

}
