package car.service;

import java.util.List;

import vo.CarBookVO;
import vo.CarVO;
import vo.MeetingBookVO;

public interface ICarService {
	
	/**
	 * 전체 보유 차량을 가져오는 메서드
	 * @return 전체 차량정보를 담은 리스트
	 */
	public List<CarVO> selectAllCar();

}
