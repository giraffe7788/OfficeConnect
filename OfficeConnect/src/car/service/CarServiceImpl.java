package car.service;

import java.util.List;

import car.dao.CarDaoImpl;
import car.dao.ICarDao;
import vo.CarBookVO;
import vo.CarVO;
import vo.EmpVO;

public class CarServiceImpl implements ICarService{
   
   private static ICarService carService;
   
   private CarServiceImpl() {}
   
   public static ICarService getInstance() {
      if(carService == null) {
         carService = new CarServiceImpl();
      }
      return carService;
   }
   
   ICarDao dao = CarDaoImpl.getInstance();
   
   
   /**
    * 보유 차량 전체를 가져와 list에 담음.
    */
   @Override
   public List<CarVO> selectAllCar() {
      
      return dao.selectAllCar();
   }
   /**
    * 차량 예약을 위한 메서드
    */
   @Override
   public int registCar(CarBookVO carBookVO) {
      
      return dao.insertCar(carBookVO);
   }
   
   /**
    * 예약 된 차 정보를 가져오는 메서드
    * @return 전체 예약 차량 정보를 담은 리스트
    */
   @Override
   public List<CarBookVO> selectAllcarBookList() {
      
      return dao.selectAllcarBookList();
   }
   
   /**
    * 차량 예약 한 사원의 이름을 가져오는 메서드
    * @return 전체 예약 사원 정보를 담은 리스트
    */
   @Override
   public List<EmpVO> selectOnecarBookEmpName() {
      
      return dao.selectOnecarBookEmpName();
   }
   /**
    * 사원이 예약한 차량 내역을 가져오는 메서드
    * @return 예약 내역
    */
   @Override
   public CarBookVO selectOneMyCarBook(String empNo) {
      
      return dao.selectOneMyCarBook(empNo);
   }
   
   /**
    * 사원이 예약한 차량 이미지를 가져오는 메서드
    * @return 차량 이미지 경로
    */
   @Override
   public CarVO selectOneCarInfo(String carNo) {
      
      return dao.selectOneCarInfo(carNo);
   }
   /**
    * 차량 예약 내역을 삭제하는 메서드
    * @return 차량 예약 내역 삭제 여부
    */
   @Override
   public int deleteCarBook(String empNo) {
      
      return dao.deleteCarBook(empNo);
   }

}