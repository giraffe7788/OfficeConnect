package car.dao;

import java.util.List;

import vo.CarVO;

public interface ICarDao {
	
	/**
	 * 전체 보유차량 정보를 가져올 메서드
	 * @return 전체 차량정보를 담은 리스트
	 */
	public List<CarVO> selectAllCar();

}
