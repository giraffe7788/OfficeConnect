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

	@Override
	public CarBookVO selectOneMyCarBook(String empNo) {
		
		return dao.selectOneMyCarBook(empNo);
	}

}
