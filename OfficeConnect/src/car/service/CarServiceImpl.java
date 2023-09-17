package car.service;

import java.util.List;

import car.dao.CarDaoImpl;
import car.dao.ICarDao;
import vo.CarVO;

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

}
