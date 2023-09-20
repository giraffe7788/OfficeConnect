package car.service;

import java.util.List;

import vo.CarBookVO;
import vo.CarVO;
import vo.EmpVO;
import vo.MeetingBookVO;

public interface ICarService {
   
   /**
    * 전체 보유 차량을 가져오는 메서드
    * @return 전체 차량정보를 담은 리스트
    */
   public List<CarVO> selectAllCar();
   
   /**
    * 차량 예약을 위한 메서드
    * @param carBookVO 등록할 데이터가 담겨진 carBookVO객체
    * @return 차량 예약이 성공하면 1이상의 값이 반환되고, 실패하면 0이 반환됨.
    */
   public int registCar(CarBookVO carBookVO);
   
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
    * 나의 차량 예약 내역을 가져오기 위한 메서드
    * @return 나의 차량 예약 정보를 가진 리스트
    */
   public CarBookVO selectOneMyCarBook(String empNo);
   
   /**
    * 차량 이미지를 가져오기 위한 메서드
    * @param carNo
    * @return 
    */
   public CarVO selectOneCarInfo(String carNo);
   
   
   /**
    * 차량 예약 취소를 위한 메서드
    * @param empNo
    * @return 예약취소가 성공하면 1이상의 값이 반환되고, 실패하면 0이 반환됨.
    */
   public int deleteCarBook(String empNo);
   

}